Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C948EB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 18:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F51810E318;
	Tue,  4 Jul 2023 18:42:32 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A210010E318
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 18:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688496150; x=1720032150;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=iCzjC2HH5HyV0MZunCf5DRFhD444RWN/RlcAWwL/Xag=;
 b=ZStd4c0H5jE7bliwF/dFFn+XNUXpRDscWuHC6T0jvR69eUkghfz7v6zh
 quRrCW4pudcGwJSDVQQZIHILmpdoPMucVVPoL7MeRkSKuVJXEzefie4VU
 xIxkzDE6fB9S6QYkgsGC07tYV8P2mZ9/zrKMpxdTbVxIvxarUn90sg8HT
 i0WH/u5GtynULwiO3XlHxP0c4dU1nuZpfYIkUDG2/ZGBbrYHBnkTPacrd
 zuRBEaAiimLj1XkfxdWAEyZaAziSXegSIeCdGeDIUies973mYW25+SWmY
 qlFVialeZzlzgIJdzOwudXql6l/wTCJ+RiDpGjPMdMPCvsudTSBqfctzf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="366658383"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="366658383"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 11:42:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="832244237"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="832244237"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2023 11:42:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 11:42:28 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 11:42:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 11:42:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 11:42:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fo6/4pII3fwe1Tnf+WdZe+Hyp831IRpVaRH0TaO6jFVWIH1rWDfgOFgmyAAmLI5OkkUXUZ76VIJ+JcxOoZ1A1bU87qZ30AjgCiORNw0RpFcQErc+qtsHU//iGHk4vVMrmtIX8bAYJp0H0h/WHEqzOy8XTbLXG5J/jW2AEFQZRk90nEEBkoHsY6XH6KegAP5o+JL5WsKKHVM+AEjXq6r3lWPyPhGUik/Mjyc9OtydMET5v0IX5Codu6wtoTuirReiaxqgbsGLoWkwPhSvMWOHfBYfsD2qVi1szEzSeJr+XYv8qXuyrC95sQozFlT7aGtB7XRTLeDsyA7TAHyzmtQpsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCzjC2HH5HyV0MZunCf5DRFhD444RWN/RlcAWwL/Xag=;
 b=S8ydwLY4qOBGWEq/2oyW4FQFPYjCL/dUXvJHxjFs98e3Q7B/cWQm48NXAfTLDTyGaMeWD6ry2kTWk710/C70NNPa5Jf+C3BczN8MuNa5+JXmevW9SnbmTqVjtedZXW/idLSpEv81EsapFpzaYajCDxhSzVoiu8gUyCqMItG0XM/s+2sOyT5o9XkdMXtNQGscCReMCEAKxg7aWv45zqAyXvxtmK/5Jt1MnQ2M8D067IzKf/TD+OkifJAF4B7YEyT123P7/BZhdAvxVq1XxznduebudE9nLOVF04aG53ACOavyB1iDR9z+55bWK3Jeg9N3I1WcgvfmThN1DYgqAgDPuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 18:42:21 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 18:42:21 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Thread-Topic: [Intel-xe] [PATCH v3 0/5] Try to handle TLB invalidations from
 CT fast-path
Thread-Index: AQHZrn31mbJE6dlYFUipzh/MXfjGXa+p6zEAgAAGVoA=
Date: Tue, 4 Jul 2023 18:42:20 +0000
Message-ID: <9b85e5dab2ef877067ec807131a8323e975e573d.camel@intel.com>
References: <20230704134524.138377-7-matthew.auld@intel.com>
 <d899032fae79b3e4a6f1827d0a18746ecb2b5d21.camel@intel.com>
In-Reply-To: <d899032fae79b3e4a6f1827d0a18746ecb2b5d21.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|LV3PR11MB8603:EE_
x-ms-office365-filtering-correlation-id: fe9f3c5c-37a9-4565-a0dc-08db7cbe6653
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H4f6NABYnqV3UdEtkh5oX2PA9c1cH8rjRgb/Uw6q0J1aef6NuVo5bZJtqq45KNL1o+t5id90racpNT+2hpCQky8RBIDHMbnUaarQkO22JAkfY7hmbi/+P8rlOVRPTBGYyvYqeTzZCNwHWCCbaYTCS1hcgOV4cqpvCjoT+tGZlCXa3ovUIP8R/FM0LJQjCVSKE2PbSufiw+L/I64s16Ow6iB0Rwkji5/BhZLZXN+rieUQuHc1Us5jVi2hICY6l7ezajdx6zPP0o7UC4wiALORdROoLmDwBIkj3xepRNFJMKorM9MtFdWeIiPeqsbsArHrl5yemnQH/rBFV0PnTGDoZetlWdQ1nDdT5g7qB6tp1oxxfHOUiGLxZFQDbkV0P4geby5hSVqOd9sNNGbeQ0EJ7nj3dh3unexq0PYLhB6EsoZiZKjdYbmdXYYU2sUnJnsG46p5eT/nAvSUBbS9HvdZ/seT36FvjISQWnT0ER2WRlCuMy/c5194fuTCgis7l2WMmrxgB3oszli9HyyKToxgDHiESy7ohpvsHE0Z2vwYK6gd2axOEa/0BuIBL0MdApzrtrINqcQzCqN4CfPT7gp0t42wBQfvwP07j2GQGfpNl8HiJngFLvgD2deJLu5OV/1grY5OwzRe+OCS24ok//aS/g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199021)(26005)(478600001)(82960400001)(71200400001)(966005)(6506007)(6512007)(86362001)(2616005)(186003)(38100700002)(6636002)(64756008)(66476007)(66556008)(66446008)(66946007)(83380400001)(110136005)(91956017)(6486002)(76116006)(316002)(122000001)(5660300002)(8676002)(8936002)(4744005)(38070700005)(41300700001)(2906002)(36756003)(10126625003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0FNMFo5Z0RiQW4rWmxPVlRxM3pQTFUyLy9PVlRDMXBXYmMwSGlTSFpyV2lo?=
 =?utf-8?B?Q2JIREp2eVZwMW5xcVdaRlE1ai9sUXZxSHBWbFBLK2I3SUU5L0p2MUR3NEFo?=
 =?utf-8?B?NHIxcWVNTmNOVWgwT01McHRtYWMvbXJDRFRjY3NwUHdHdzBxemdqVlBBUlZm?=
 =?utf-8?B?aXdQa01rU0p2UFI0aXc0MDlVeERsSFBzSzNZemFNck1QR05hM3VNN0VDTGZG?=
 =?utf-8?B?RW5JUEd3MTNDbktvTjcvTHFSdzRqSTNwTE85NHNnWVQxSjFTWlNWSi9XbzdT?=
 =?utf-8?B?TUxMdzJZTk40a3ZHQ3cvTklnSFREdnBlYmJTbGpxV2hreTlsdFViQStrU1Ru?=
 =?utf-8?B?WFdVV2Y3cUNma2lTdkxPak45Rmc1YkZmZXNHWkkxN2dLVFk1dnlGRFJUVE5G?=
 =?utf-8?B?clVEa2ltcEs3S3o4NDBhd29tSzRiYWJoalVRcUFxRHJNK0dKdXdFZDNLb09t?=
 =?utf-8?B?KzJjTVZBTXN6c2lZRklpRUd0eXQ2ZSttNCtwRjQxNzJWbzRzZ00zT2N1bDlF?=
 =?utf-8?B?VktlTEZ6aUdJM2Q5Y2lNY1ZXYjFYWGlTWUNXeW9FRUhQU1lzbVNTMUQ5ekxT?=
 =?utf-8?B?RlBrYVZpTFBUTnFqKzJpeXdNanhobFZIT0o0ZWV4c3gweFJMR2c0ZUJ3V1hG?=
 =?utf-8?B?d1k0MjZ4OHpRN1kxQytvL3owSk43TllMUUMzRW1QKzVHWjd6Z2d4NHM0Y0Ex?=
 =?utf-8?B?Y0R0VkV4YldSNUx4NmlPV3hBSEZxbyt3Mi9URE82QmhEYlphQ1VrM3lpUUVH?=
 =?utf-8?B?eG1QSFkzQ1BUQVZ2KzF5SC9oYktOb0FYQmYrTExCZUFqbEdxOUlCNnhXUnkx?=
 =?utf-8?B?dC9MNjlsbEkyT2hRNFcxcm5rcXRCU2dtZzIyeTEyUmIwZlh4VGd5UXdLdDND?=
 =?utf-8?B?SWF4Y3BMY2NOSzZWeVhJRklySklVUCs3aUZhTGV5YTBlSUp3M3BnaTRRVnB0?=
 =?utf-8?B?aFVzSzE1VkYrUm1RUmViYTZoUEM5ZmNoM0dBTnVWYVRUWm1Xb25WbUtHUmJv?=
 =?utf-8?B?THc4TlVLbjVwTUdNM0U0dGJrVDQzNmJNTENYRWhHNnNGRGcrOTJYR1lsdmNI?=
 =?utf-8?B?TmVVaU5hQ0Q5bGpxRmw0ajNvSVpZV3c2UHVzS0srcGduVzNqazRKQ1NKRWZk?=
 =?utf-8?B?RFdNR09BRWRJbThXaEVJcU4zNDBrK2hySWhhWVJaUmJxUFdHa093alJkeG9a?=
 =?utf-8?B?cFFOYTkyeFkrMEg1QU9EVUFKeUR0U25GOStVakkramcvWjY2WWp6N2xla0VC?=
 =?utf-8?B?UXU2a2hYQ1czYWVGQWVYUk9VeEZmT3Y2aHZRSnFrK1hiREY0ZGRacFZaWDdx?=
 =?utf-8?B?NjZqajZEb0FTeUhGOHd5V0NVN2FpK3BaYkJLN2VxcFF0aURRUW1iR2hRWm9L?=
 =?utf-8?B?eW5zYk5KdWtMNi9jVzE3elpmcWZ4dS9RVTViMk9MUU1MVVdlTUMybytxM3Vz?=
 =?utf-8?B?ZTlaZzA2NG9nQWY0a1lsRDVFcUp3L0lEYll6UE9BVGExQWZWNXdFeU9TWi84?=
 =?utf-8?B?NDNGaVh4eVEyS1k0Q2l0R1ByVXlQZVNaMGJ2WE5TOWtYMy9xVGpWcWduN3Bi?=
 =?utf-8?B?MnVmZThtTC9DOG1yM3ZWZWM3OXhSYndCTHJ4ZHRjeTdGM0dYeU1tUWNVNGcz?=
 =?utf-8?B?eituSjdtTU52c09OUXl3eWdKdzZ6Z0N2QXJLWFlLZkRPS0pqTFg2RnpGWmtT?=
 =?utf-8?B?Um52VElGNHBmZWtPZTRuZFZBUEpaVlVDc3ZLRnplYjNPNFlDOFBvZFlucFBy?=
 =?utf-8?B?YVB6aSs0dm5mRVU5VTNnZ3NycUhvL3g2L01QeXVLdWkvR1ZDdXg0ZEJ4aDE1?=
 =?utf-8?B?L25mQjhMZHNTbUVQczRPV3JZeDFKaFpzbjFTQ2Y5ckk5WGF1a2w1UnpXUlgr?=
 =?utf-8?B?NVJWdENMbC93TlNZZ1lVQ0ZPKzUrMytsVEsrU3E1c0VaTHhHZjJhNURRUmN1?=
 =?utf-8?B?T3dMWWtwU1krWDNZVVdxU1Y3dmlqWGVXTWFjSEZTeVNtbzVKbnBKbGdpL1Zo?=
 =?utf-8?B?bHNuMWJoVndyUjZnOHBkdzdkWXhhSndGOVRBeE12NVdNaVlHbHVpOE9UbGEy?=
 =?utf-8?B?cTlCSGJKQlAzTUNVTGE2Z2hOU3dPQ3VWZnZkeE4xVTNxcmxRWElZbVNSWDFh?=
 =?utf-8?B?dTJ2TXh0SEdid2hmWjNuQUZoOTdCaGVHMFBSeGVHUnF2dGY2L2Z5VVZiY3Zv?=
 =?utf-8?B?K2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDA6E567C01AE242A6B01048AF3E16B4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9f3c5c-37a9-4565-a0dc-08db7cbe6653
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 18:42:20.4824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lGsWoiHbIS9RM3dLh+GjhfYUe2NWwCecxP8Rtu66WVxcapxj/ZCiO7PCUUJgCkQjK5HTcXjLMhZndEiaIFhMLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8603
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 0/5] Try to handle TLB invalidations from
 CT fast-path
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

T24gVHVlLCAyMDIzLTA3LTA0IGF0IDE4OjE5ICswMDAwLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4g
T24gVHVlLCAyMDIzLTA3LTA0IGF0IDE0OjQ1ICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
ID4gSW4gdmFyaW91cyB0ZXN0IGNhc2VzIGFuZCB3b3JrbG9hZHMgdGhhdCBwdXQgdGhlIHN5c3Rl
bSB1bmRlciBhIGhlYXZ5IGxvYWQsIHdlDQo+ID4gY2FuIHNvbWV0aW1lcyBzZWUgZXJyb3JzIHdp
dGggbWlzc2VkIFRMQiBpbnZhbGlkYXRpb25zLiBJZiB3ZSBoYW5kbGUgdGhlIFRMQg0KPiA+IGNv
bXBsZXRpb25zIGRpcmVjdGx5IGZyb20gSVJRIHdlIGNhbiBzZWUgYSBiaWcgaW1wcm92ZW1lbnQu
DQo+ID4gDQo+IA0KPiBUaGUgX19nMmhfcmVsZWFzZV9zcGFjZSgpIHdhcm5pbmdzIGFyZSBmaXhl
ZCBpbiB0aGlzIHZlcnNpb24gYW5kIHNvIGZhciBpdCBpcyBzdGFibGUuDQoNCk9wcy4gU3RpbGwg
YWJsZSB0byBnZXQgdGhlIHdhcm5pbmcgb24gREcyL0FDTTogaHR0cHM6Ly9wYXN0ZWJpbi5jb20v
cmF3L3ZjczZ3a3A5DQpUaGUgcHJldmlvdXMgdGVzdHMgd2VyZSBvbiBUR0wuDQoNCj4gDQo+IFRl
c3RlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoN
Cg==
