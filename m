Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90216EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 21:34:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5729610E00D;
	Fri, 16 Jun 2023 21:34:52 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504B810E00D
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 21:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686951290; x=1718487290;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1lQvisdjHDFW0VkPGJ/6PjA44GcfBDdoNrtVuQ6clj0=;
 b=Zj8x10O2gqK67sxI+JJHUAVP5jqtlaWyIW21j2UflSnvhUVK5LwUUGIO
 eFAaJPtct2/QK6Cztbmbwmzc/UOQKwEjzOJMjvRi04BvzBkwpmZ9kR8DX
 Utze74gtb+b4AfO3CHBJNkZL0HURheKNb7ftwk0Ag98mBaYThZPR8Hl7S
 IeTjs41bbljR28yRHpAene4XhQtdBlkiDA5GqABFMjn+JDfhCHdO7Ksg3
 PQK2u2fSkSKSEGbxlZYpXYrX/doEcWBTwkSrJoRWqEHjINcoDQEnFzFoT
 47UYNvn9sncvyUddI6TzPYItL/OedqqYNZVyFfs59SPNxPsr3N0cxI1Ip Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="422971957"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="422971957"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 14:34:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="802979417"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="802979417"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Jun 2023 14:34:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 14:34:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 14:34:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 14:34:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2FrbLc5f6Qw53NXxyAQHdI73v4iy2MeTFHSTQr5UtAPflcFHRhXSOemViVvAwMq+kh5y+2VDnRBzkqVMVSPmMNs87/e4IGk6HVa1mLrgcFZtkHoT8iU+wEUX0wtQtDQ0cl4/9xaTQokIdLhP3khXEdZjJVECFxB8J+GirMWwSIoApp8Kmpm6n9VeGPWxGf7+nQ2ZrS/auomwIiHXtuMc8Vxks39ldYbMiRc6LbbQe+7x0mNGa+tnGKtSFr4tl3nf/b88c+fQHmyX/Pv1ASrEf2XjTMILuCsEMhuKog0ZkQKwdHceEye0lVKNsp8reUsbb8uDUNnlK6UEI6hwlLizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lQvisdjHDFW0VkPGJ/6PjA44GcfBDdoNrtVuQ6clj0=;
 b=QwmDty8XuSDvIxVbNSknahN5swLtcJtdpB3kWVXfzeXf0I+88NX23lM9KnM16W4RhOzGTPk6cRYHYWI9FQjYT9+YpcAA6+aq5TiNqGY8a2IoCScHSGy6MTSrD0/R5tTet3fm7HFZ0nZtEEdvgSIhnjk8Ow8CjYhkN7W33AbkdNTlcTz0GMRw2vKs92chYM5RsEyXSOwpgiq6RZzZNIWX8zhw73nubUn6pscawJKkTAytftWgFnObUpbuSj/wYmUoSFsq2AEHdzlIW6rwNB+1WhLRk5USXERs8gqbi/0hm2fmDAGemQd6bpVYHB2XbXl6c6m5+hyfqoTs4AZ2LntXYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by IA0PR11MB8397.namprd11.prod.outlook.com (2603:10b6:208:48b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Fri, 16 Jun
 2023 21:34:35 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6500.025; Fri, 16 Jun 2023
 21:34:34 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe/display: Append dma_buf fences to
 framebuffer fences
Thread-Index: AQHZmLRORcclCI4Hd0OGuV4fBVnpBK+LwrKAgAJAk4A=
Date: Fri, 16 Jun 2023 21:34:34 +0000
Message-ID: <bcab08899bc712ffc217e1067bdd793081eb564e.camel@intel.com>
References: <20230606201959.94128-1-jose.souza@intel.com>
 <DM4PR11MB6360A0F1846E78E51FE0A2D0F45BA@DM4PR11MB6360.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6360A0F1846E78E51FE0A2D0F45BA@DM4PR11MB6360.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|IA0PR11MB8397:EE_
x-ms-office365-filtering-correlation-id: 98905930-dd07-41f7-d958-08db6eb17a7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +bF+gqDCKfgn35QXlJXOzr1cIMvMecuXUphKZr87GQ3GqUNiPHv63QVYeDx1LWfZ1OupE1oZa7pSY9HIrvq1X0ChSyI2Avsi2ukyyqsTD3dDU1fedYlusByTmfL7k7NFtcQN6iqaZFGaHer/mVajFpQhoIdYHMcvcwRg80fqqJvcbKwyOTLn4gbPNUQN7Zu7eW5iS7nIIZbY3PLwg+XOsEH21WIHbNGGIuEr+TEeAzH7gIR6LynkFziuwiMXYU+5sRH/xZQwaEG6xUFZhMIFzSYxNgHkPnxU83oAG893YjEJ0N6XC7Z2zZjbcQUWYU436v9pZeIlh/4MZ2RXqrbABHAPSv9MPsfW0oVLjnC5TT3FvZyWvKfrSvjRRjQXYBP6+X7JHl5QO7m+hWJwSD4PRXjQYYxr7x/3vPAvI+LuwkSKPUqh9HnV3fmDieZiCowjoNp2uDlM9M6x2yJGk4qi0TCRaWJq6AVYyMNACqnJJDRnMGbVRkBb0CCHLy6x99kCMQz0aFTw+L6zdyxKnPtHmxfH1a6aYMx5AjWLaKE8WY8MJLIywtlg5Y1lT3KrBPs1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199021)(83380400001)(66476007)(66556008)(66446008)(91956017)(66946007)(76116006)(53546011)(6506007)(26005)(71200400001)(6486002)(6512007)(966005)(478600001)(2906002)(110136005)(2616005)(186003)(4326008)(86362001)(8936002)(8676002)(36756003)(5660300002)(122000001)(41300700001)(38070700005)(38100700002)(316002)(82960400001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVIzTmxrY1NtVStrQjVaMkFwZTQ2MHEzZ0s1N3dKNVNlQXFDWTR2U1I2VVZU?=
 =?utf-8?B?UXdSZ1h4dkVicE5HdGY3NXJ6WVNudCtjODU2WTZvU25UZEVMZUdmMDBsSUc0?=
 =?utf-8?B?emFxbjREVkUya1VvdCtlVHdsSkRWTEFEZnQvbjA5d3lWc3ZFKytlZFdJbjBO?=
 =?utf-8?B?aUlOcGpEMVFSMm81QWU0bTJDTXZSZ1k5SFRKMHlWeklyaU16WGNNU2M0dGZV?=
 =?utf-8?B?Ym9ORFk4M2JlY0h4TmU0cjBVOERoNFFEbEkwcW8zQ3N6UmRmMGVYZFRpcWM2?=
 =?utf-8?B?SkJuZ0p5K3lGV2VNclVXRXB0Wk9FV1U5RGF2MnVyOWFONkN2SGh2YnJNa3hT?=
 =?utf-8?B?a0NnQkF4WFBoYUNoLzQ1d29RazBoNTh4d08zcUw4Y2dETVM4U3d5NWcvUG1C?=
 =?utf-8?B?bXNYNnN5ZlR4M0xXdWlMeDZTcSt1TGI0Yi9vZEtUSDFESHFIYUMvMHFSaUlG?=
 =?utf-8?B?YVliVFp0RUlUZCtkN3dndzJ0Y0Qvc2hMdzJ6b1hmVDdYQzMwQlNhcVpubWcr?=
 =?utf-8?B?OGFMUEthYTNZSDd6WjZlTUc0STRNcFZzVXVmNXZZUVdiSHphMk5Bd2N2cWZs?=
 =?utf-8?B?d04yOVBZa2MrUFdQd3ovRStGNDF4UUZTUXg4eENIemlNa2VVV0VrcU1FQXBW?=
 =?utf-8?B?VThJN1BXMHNVTUl1ejFnSVZDM1hwTWpKa1hLNVhncnZibWE2R3hyYzA5ZEVV?=
 =?utf-8?B?OFZHM0x5M2wwWXBoVm1UNXRjNHJtR3NBbDFzb2c3c3Q4dXRjRkRGaVVSSEtI?=
 =?utf-8?B?cElBbWo2NU00SFdYUjVPRzVTb1BOVFEyZ0ZmWENoc2E0RENUQ1crcFYzTXpm?=
 =?utf-8?B?SVhXMDNva3k1ZDd4NmlRRDJ4MEtMV3RzbmN1QUFTNTZsTWtSN094S1FZQzM2?=
 =?utf-8?B?R1BLUWxRbmVpMzFQRjZIeFRQWWkxcGxxNzdsVU9CZ05mNzkzVi9QektBRjdq?=
 =?utf-8?B?SlR3WFBkS2ZSakpUbDQvTUF0UFAyWEErQ1ZqanlnY0ZSekdvanJNbFZCa0VO?=
 =?utf-8?B?VzFhU0dnMUNBeUNYTVRLeU1PTFZUZmhVbmt5UWVZQ1E0MWc2eDk5RkozS2tj?=
 =?utf-8?B?U1FOOUlGZCsxSkQxajVRVHdrR2FBQTJ0YXYzNG5yMTBtRXd4enNUWjI5SU1P?=
 =?utf-8?B?b1lzbzBHelJidmFFN1Z2ZWNmdmhYY2JrNllieXRiM0NZcENVQU1pQXN0Ymw1?=
 =?utf-8?B?TnJzMWsvVkk2Zmk1K1pYQ1FKRERPVlFlTng1czl5eC80QVBrM2MyQUxhRUg1?=
 =?utf-8?B?UnpYL1UzZ2REQUZWdktocHhuK0hWVHhqblBhZkNxOGRRQUs3ZGRsVEJHeW9I?=
 =?utf-8?B?QzlDdVYxRVBIU1RKVVExS1VhWDZ4c2ZiNTV4dUtPdlVQT1BzMWlmU2VTTG01?=
 =?utf-8?B?d1ZNbDFQZFlFVGY4UVdjRWZrQ1NjeTNYU3pqd0gxaVlKa2lIOU1ETE1XNGhV?=
 =?utf-8?B?aTFDMnpORTBKV0llYUYweDFNNitob2kwZUEySUpsRWVZSDdQTDlzMWhBOCtQ?=
 =?utf-8?B?cnFtcEpja01TZ3JYYi9jT1BOcGF5WnBaNkdvUFRtcm9kaEJ5cWhCbFdjc0cv?=
 =?utf-8?B?STNPN0oyeVcvcklWdzFxbHFzY05IWmlTNHhCczRVRGkvbldSRVJYVGx1bUk1?=
 =?utf-8?B?SmMrZjVBd3V4WjFLTVUzVTBTK0pQWE94cFF5TnRnZkg3VUpTOGJCenZuTE5l?=
 =?utf-8?B?cWJ3MkVJVEZYWlZDOWkwcWU5ckRoOHVDRTlKZkUrSVl4TUpCY3pSb2VhOWY4?=
 =?utf-8?B?a0VOSVhOOFpzczdXY3JMekxEUWh1RnBSVFBGTDFUM0liVExTZElMcm5oeXVr?=
 =?utf-8?B?T1JIRUFxRlZZOFVkdVV5RDF4THN1N0hLUDFYMVhnOW1KckFNWUEvSHkrU01v?=
 =?utf-8?B?UUo2YzZnU0NybVZ6UDF3S2lsUExzdFRTZFlqd3JTSGdFbHd1SzNJekRkUHB0?=
 =?utf-8?B?cTBrMjJXNUhNYjlCZjBsamhkcWtSYzkxOEJxckFJeGFOR1l5WWVtSnV1OE5C?=
 =?utf-8?B?MldRNTdFNXN4cFdQcU5yNUVBQmtuMG9xZGZmVEJDa2hYaGRCS2p4bnpiOFhz?=
 =?utf-8?B?VGtVby8wV2E1SGFQOUNVQy8zMG84NEk1QVB2WWhDV3VJOXhnV2NoVnVsbW43?=
 =?utf-8?B?dlpNc2tmK2ZHS1NuWHBjblVWQXltRDh2VnEvejdoVDFvNHlaU0pKbS9ITDQ1?=
 =?utf-8?B?UVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBF49EF80DDE9445B7B08CE00F1386E9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98905930-dd07-41f7-d958-08db6eb17a7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 21:34:34.5752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n/tM5MLBbiiuBkWHYgBEBJA8QfQ1nIKCi5u4Ql7+Hysfv5tLkDACuJNJv+hp771B2sFFqvwSvf2l8FFqifGrqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8397
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA2LTE1IGF0IDExOjEwICswMDAwLCBTaGFua2FyLCBVbWEgd3JvdGU6DQo+
IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSW50ZWwteGUgPGlu
dGVsLXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSm9zw6kg
Um9iZXJ0bw0KPiA+IGRlIFNvdXphDQo+ID4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDcsIDIwMjMg
MTo1MCBBTQ0KPiA+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBTdWJq
ZWN0OiBbSW50ZWwteGVdIFtQQVRDSF0gZHJtL3hlL2Rpc3BsYXk6IEFwcGVuZCBkbWFfYnVmIGZl
bmNlcyB0byBmcmFtZWJ1ZmZlcg0KPiA+IGZlbmNlcw0KPiA+IA0KPiA+IFRoaXMgaXMgcmVxdWly
ZWQgdG8gY29tcGx5IHdpdGggS01TIHBhZ2UgZmxpcCByZXF1aXJlbWVudHMsIGFuZCBpdCBpcyB0
aGUgb25seSB3YXkgdG8NCj4gPiBzeW5jaHJvbml6ZSBmcmFtZWJ1ZmZlciBzY2Fub3V0cyBpbiBY
ZSBLTUQuDQo+ID4gDQo+ID4gVU1EcyBhcmUgZXhwZWN0ZWQgdG8gYXR0YWNoIGEgc3luY29iaiB0
aGF0IHdpbGwgYmUgc2lnbmFsZWQgYXQgdGhlIGVuZCBvZiB0aGUgR1BVDQo+ID4gam9iIHRoYXQg
aXMgcmVuZGVyaW5nIGluIHRoZSBmcmFtZWJ1ZmZlci4NCj4gPiBUaGlzIHdheSwgdGhlIGNvbXBv
c2l0b3IgY2FuIHNlbmQgam9icyB0byB0aGUgR1BVIHRvIHJlbmRlciB0aGUgZnJhbWVidWZmZXIg
YW5kDQo+ID4gd2l0aG91dCBoYXZpbmcgdG8gd2FpdCBmb3IgaXQgdG8gY29tcGxldGUsIHF1ZXVl
IHRoZSBwYWdlIGZsaXAgaW4gS01TLg0KPiA+IA0KPiA+IFRoaXMgZml4ZXMgZGlzcGxheSBnbGl0
Y2hlcy4NCj4gDQo+IExvb2tzIEdvb2QgdG8gbWUuDQo+IFJldmlld2VkLWJ5OiBVbWEgU2hhbmth
ciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KPiANCj4gQFZpbGxlOiBDYW4geW91IGFsc28gY2hl
Y2sgdGhpcyBvbmNlIGFuZCBjb25maXJtLg0KDQpObyBjb21tZW50cywgc28gcHVzaGVkLg0KDQpU
aGFuayB5b3UgZm9yIHJldmlld2luZyBpdC4NCg0KPiANCj4gUmVnYXJkcywNCj4gVW1hIFNoYW5r
YXINCj4gDQo+ID4gTGluazogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVz
YS8tL2lzc3Vlcy84OTIzDQo+ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6
YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljX3BsYW5lLmMgfCAxMyArKysrKysrKysrKystDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWlj
X3BsYW5lLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWlj
X3BsYW5lLmMNCj4gPiBpbmRleCBiNzU2NTYxZjA4YmQxLi5hM2YzMGEzMTllNGMwIDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljX3BsYW5l
LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21pY19w
bGFuZS5jDQo+ID4gQEAgLTMyLDYgKzMyLDcgQEANCj4gPiAgICovDQo+ID4gDQo+ID4gICNpbmNs
dWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4NCj4gPiArI2luY2x1ZGUgPGRybS9kcm1fZ2Vt
X2F0b21pY19oZWxwZXIuaD4NCj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fYmxlbmQuaD4NCj4gPiAg
I2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+DQo+ID4gDQo+ID4gQEAgLTExMjAsMTAgKzExMjEs
MjAgQEAgaW50ZWxfcHJlcGFyZV9wbGFuZV9mYihzdHJ1Y3QgZHJtX3BsYW5lICpfcGxhbmUsDQo+
ID4gDQo+ID4gIAlyZXR1cm4gcmV0Ow0KPiA+ICAjZWxzZQ0KPiA+ICsJaW50IHJldDsNCj4gPiAr
DQo+ID4gIAlpZiAoIWludGVsX2ZiX29iaihuZXdfcGxhbmVfc3RhdGUtPmh3LmZiKSkNCj4gPiAg
CQlyZXR1cm4gMDsNCj4gPiANCj4gPiAtCXJldHVybiBpbnRlbF9wbGFuZV9waW5fZmIobmV3X3Bs
YW5lX3N0YXRlKTsNCj4gPiArCXJldCA9IGludGVsX3BsYW5lX3Bpbl9mYihuZXdfcGxhbmVfc3Rh
dGUpOw0KPiA+ICsJaWYgKHJldCkNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArCXJl
dCA9IGRybV9nZW1fcGxhbmVfaGVscGVyX3ByZXBhcmVfZmIoX3BsYW5lLCBfbmV3X3BsYW5lX3N0
YXRlKTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJaW50ZWxfcGxhbmVfdW5waW5fZmIobmV3X3Bs
YW5lX3N0YXRlKTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gcmV0Ow0KPiA+ICAjZW5kaWYNCj4gPiAg
fQ0KPiA+IA0KPiA+IC0tDQo+ID4gMi40MS4wDQo+IA0KDQo=
