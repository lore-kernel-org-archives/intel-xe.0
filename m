Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E72AC47DDC
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 15:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4A910E1BB;
	Wed, 24 Jan 2024 15:21:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C0110EA21
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 15:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706109672; x=1737645672;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=36EqlBwHiiL9SGBx2247YUe0AxRC2Nng9+7JDBhJBhc=;
 b=U4lSUy7sFGMDePGQ8pWsWkzdep2zmEE4UAccVa8GrvAyuXhSNLagYn6V
 0JakE6QxyD7+F/Yfdil2ljyw0C4sGJ6MPlU1exVKDgwunOjpXCPUX4TyV
 7EKxfgjPnsLjIFVLrgZqx3uYHyNbFbmPx9F0ANCZ4nOwCHkH8Zm22UMAF
 7RU4MJ5uMKKogtM3mXsYPzb3m0VkdZlY2+Xnaa74tQmZoUD2L3+tzX5qI
 vMHJ2YRGIVcXubcxokUxMH3SIjFTzirq3/cuzmRR9DcPeXAdx+17ql2O6
 uYHBrFUePSlCQv1B1dzikTVnlXPa7OccTUZDI1ojRVHC5EWtwQuV1QkOs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1745713"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1745713"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 07:21:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="28139796"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 07:21:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 07:20:59 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 07:20:59 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 07:20:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5DPbN7jPkqX7jyVgKRApCTb6qmehuoUxuRTX5TH3mIxZkKnjywZ8LvXlFD4cBNblGohGVoFSZ6nHC3eK5OYbmhX8cVDPwgXgSEzvmtRL6AH/bkoP3eGPPGsXWxpQYkZ+4hLJEtufWB1scPGylZAMYR2YLCtfSR05dKOcyMuMnH5eB8ubTWZj6w8HNZURsiGICISVbeikbh8CSYN0XNtEECda6ccNvz0bNgBYtMCuyNRK9UpLTL4pXnxSBLq0UjoYPclp/e6UOPW6N1I7pG7OdrvcTkbnaRSGJqozOqbf6kAb5DeN90mvhvn2vPrMaT00OegHGbOMcRl8ZN220h5og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36EqlBwHiiL9SGBx2247YUe0AxRC2Nng9+7JDBhJBhc=;
 b=XVwNRT4dMMFUmAiNvtJFDN0Xc9IBe/F+nBF2A2oyp/6LkFPsJ4tV/NQ+2+oNq5s+tJv0y0SFCiYs2App43NP2De7msOcbS6vky6WZkKsoTXLJMuHioYB0/7a1pdIS3z/VNSDwtWGTRnudTjlS36A5C6WcKyMKVcGb3j7hP4Z55aurfoyfMsF7s6tbueBQGput9gkkfjSGTi83Ph9+kTBRwUNddh1zwfaSDFoiy1cneGu3qKcoPdnDI76VTrQblGV8Dojk0E7COYu5MTq2tTsU3meqjL368NodZ+Ky5MpgMOyRpJnEbdjNWEIiqJ7fCXUWzdm7MgGzlOsbGIOAEpSIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA3PR11MB7533.namprd11.prod.outlook.com (2603:10b6:806:306::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 15:20:56 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967%4]) with mapi id 15.20.7202.034; Wed, 24 Jan 2024
 15:20:56 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/9] drm/xe: Add functions to convert regular address to
 canonical address and back
Thread-Topic: [PATCH 3/9] drm/xe: Add functions to convert regular address to
 canonical address and back
Thread-Index: AQHaTVUpl56fksLIN0yAQQ7OJUif3bDmKc2AgAABXICAAuqzgIAAAVCA
Date: Wed, 24 Jan 2024 15:20:56 +0000
Message-ID: <a628246a5fc0667208594e4e683c29904e947b2a.camel@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
 <20240122170445.108856-3-jose.souza@intel.com>
 <ac8c0487457d8f6b7085f7fe9aec23472aff8587.camel@intel.com>
 <5749b3be988a6e8e6b2c5330d817e32abba44b4c.camel@intel.com>
 <83ca9d83fe5b8e6d9040c8989e17f5c0e18a5442.camel@intel.com>
In-Reply-To: <83ca9d83fe5b8e6d9040c8989e17f5c0e18a5442.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA3PR11MB7533:EE_
x-ms-office365-filtering-correlation-id: a5b3e721-6d0a-47f4-8ef3-08dc1cf00fba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oK8lGtRuQZTuhfwU+Hpv4Scuqw1GGUf8J1SPN36cQxQT/FBR6g+4NT1OhvX6JUqPwjI1yQ+YO1Wu9ztmVYOiF4wjBztXQ39Hh9bhUiRH+HA3q/NxfknUlewwPZ6Uj+1y9MHmMgitpg1HlvMpKqAQlwSVieyjJXCmy1tp0EmkkLGG9PGFGJd8Ov0te0G4i8vohp1fsgeyGRy7dFWYkz6a9pg2w+2CqW0bFP5KbLJBKpBv6AbeeqHdR5uoZQ/v/VV364MksG5MCgsTKaR/Nuigjnh2LA2a2dI3JW6+sIMg7XKdSpy3yYNbqr+0D7SI8HeRXS6M4mr4bcg4zMJTr5ayC8zH95dZ3sg+YcrQ4HMk3xBM1Kb0rbYQQoSRhrFpEvUGNI3edZjPTxbY503C5Fm9WtMKyFjNCEtiP/l8gFoh7LWTrCs+XuzOFVorNUS23EnMrvlUGAfsNoEvDdM7hrWpkxobwacvRrOoGkxdHb9cLbBjyy6v8J3kaMqdW07nq6HTvqCXoOuTL7Fn0UrvPE1pIWMZ9GAlc3wysvkvntiCm+3OrHFkYKyNq7W8uaEcxaiaGKcSQD+r8zYh+5yR0JKEqGWJKhC8E5oHX4Vjm9EPD5UlI2pKSnE7oryQwYF5VHHY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(110136005)(4326008)(8676002)(82960400001)(8936002)(316002)(66946007)(66556008)(91956017)(66446008)(76116006)(66476007)(54906003)(64756008)(2906002)(36756003)(38070700009)(5660300002)(86362001)(41300700001)(38100700002)(6506007)(6512007)(122000001)(26005)(71200400001)(6486002)(478600001)(83380400001)(107886003)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0sxQVo5OTBqN05Zdko5a3pldEJkTm15QUVmSkI4Z2VIOTdzSGlzMHpCeVNK?=
 =?utf-8?B?WlB5bnpsek9zNkVvL0ZNMnN0SWRTdmdWSmtra1labHhqT3MrYTdURWpST290?=
 =?utf-8?B?b1V3Znd5Z05FaGovR3JEZUxPcWd1Y1NLQ0hac29CaXZQMGd1RUNZcmFhRWdI?=
 =?utf-8?B?M1NoQ0QwY3RKdXkxSWtxeW1JeWFZcmpMb09icjIvTWRyTnJFUitIL0NZK2dY?=
 =?utf-8?B?UG13YSszVU42L2NKRkhJNStOZ0RVMnlhVmpoUmJtdEV2b0JObDJyV2JEb3ZD?=
 =?utf-8?B?ZG55V2tvRXBoRDdxSGpaQVhWMGwxVG8zT05PYU5ScFRJdFhPTkJ5U2IwNzB1?=
 =?utf-8?B?U0xITVJtUml1WTEwY3hsOHNwQkZYRlBqSk8xWFZhdTA4MDBkT25MNWNWdVFH?=
 =?utf-8?B?NDRCcnVwUU9MWHpSZllucEtZS0QwTTZ6alRNTzd5VFJ4NTVpZkp1TVVBY3hs?=
 =?utf-8?B?Qk8wU2pKMkNHK1d2T0N6ZDZKTEk3cWJDRXNjbWpmbitDaGhsSUdOM0NoTkpO?=
 =?utf-8?B?WGlDTHRoUHMwaFA3NGFOZ1o0SVNrM1htZFRBL1lhWDFJSE5mN0d5c2x1Y3Jk?=
 =?utf-8?B?aE5wU21CMnFza3dKSEdBVWJqMGI0VlJiMjN0bHFMbnBNTzdwRVNCLzBKRmxq?=
 =?utf-8?B?SkM2VWNsYXd1OTNDZHZlS2RBRjBhTzhlU0pialVrQnhEbDVoM3J6RndtRWty?=
 =?utf-8?B?NS9CRXFuVjh2ak51bDc0OTg5aUpvcUJCYTVTcVNvdkZwUFZsOGtWNXY4SWls?=
 =?utf-8?B?NE5STnZ0L052SFFBOGcxaWhWYStoSzY1SDhhSkQ5TmVzTVdYVS81ZUtreng0?=
 =?utf-8?B?aTFLektNNFhPcnoxK0cwVmp3MVRXdTg0Tzl3MUo4YTMxdFhxVUpva0JzTnFo?=
 =?utf-8?B?cEs3d2pQMlRTMmZpMkVCSmlFbFVtSE56R0NlSnM4TmtYc1B6Z0dPeGdXY2oz?=
 =?utf-8?B?STBVQSswRWhnNDVvMnZDbUdBSUhuWHZ3RC9lMWtROHdEbXZScVI5NGpqQ0xM?=
 =?utf-8?B?b0k0MHNCUTN4SDRteWRUbUViRU9JRmlvdy9PejV2OFBod2g2TUFOR3g4ZEI2?=
 =?utf-8?B?eUpSejVTN0w1YnY5ZlNUVFVkMFBHSWRCL0dSd0FMZzR4TG83aTNDOUxjODFC?=
 =?utf-8?B?UThsY2JBRDBVYXlObVlFblhnbjhEcC9zNVgrUGsrMUF6eDlnUWNJdHlGclpl?=
 =?utf-8?B?SktBVUhmS1ZuUWplVzhmZTcra3ZjT1FERWNHanVwbkFMeDNUTWFvdEt4a0tH?=
 =?utf-8?B?dHpLRWtucVhQcENQVDkyVWRHT1c2dEVlQmVNeWgreUE4Q1M2MmVIZEJwdFJt?=
 =?utf-8?B?N2g0UDMybU9CbDNGdGdBMkFXWS9xcUdCUWpQZjhQSTkwK0p1RXU1eG42RTdu?=
 =?utf-8?B?NGhLZktBSW52TXAveTVCa1kyTngwUm5YOTRxUXdMaUVKcE52cGcvRVl5d2lq?=
 =?utf-8?B?WUNpdm1vNlJDaUVZSm1aYzd4VVpZTGFBOEVzTHVOWFVuOHAwZGc1K0E2dStv?=
 =?utf-8?B?ZVB0WmNqYkdlMGVFQ201bndLWkNOUWZEaVVhNFVTQnJpY1hEd294N3ZQOU96?=
 =?utf-8?B?RGFpRUExWURNQmdlaFpmWFNaTVViMCthTnd2QjNxZEdiVkZsZDFjTkpaNEZ0?=
 =?utf-8?B?YkE5aEMybXYxM0p2TzdHckl5a2J6NjJ0b1VPOXdSemJJV0JBR3JxUW9wWkJC?=
 =?utf-8?B?UEtQVThtbjFrNEo0L0VRNVJPOTRWYWhkTmowVzJPUVUyWTMwblZiSmJXTm1F?=
 =?utf-8?B?YTh3ZVdmanB3Yy94dVpiR3g5c0MybXJGblA0eDl1YUNtMXMxSjdrQ2lQaTZB?=
 =?utf-8?B?V09oSnNsTkxYVjZnU3gxVXFUcUEvTmJEMDZqK1VzRUVyeFhvck9QWEFMQ3Zy?=
 =?utf-8?B?RVRsdFExR2VOWTJFS1hhNUN1MnRucHYvUHdTa2N6ZmY5NE8zZjVXcmp2bnR1?=
 =?utf-8?B?a2J4OEMyaWJwV294ZnIrbXNzYVBaTlgrYkpPTGozblBNMHZ5bENxbnNCUW1h?=
 =?utf-8?B?LzYvNk43TXJlYkpJREt6RngvN0ZCQWxMcGI0U0tUWEo5MVBuaCtpT0VMbm9x?=
 =?utf-8?B?RnQ3R2FUNFB2VWJhUFJ1ejdhR1hDNjMzdkZGazQ5WUp2Y3FVbUVpdTZSUkdO?=
 =?utf-8?B?QTlQVlRndGE0L2tWdWY5WGtkRVJlcWF1c1VheGUxMlBJTWVyQ1ZsSnFuc1Fw?=
 =?utf-8?B?eUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3CFC101EB0677E458394EA1FB2715D24@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b3e721-6d0a-47f4-8ef3-08dc1cf00fba
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 15:20:56.1086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6FvjICBCgqZZ2nRrLfjyySYHzLVkUCDA+oX/Y86Hu8nfPyMDG5Zh0SQpRKJnB0HuehEBJYY7odrFkdqlB3U0xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7533
X-OriginatorOrg: intel.com
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDI0LTAxLTI0IGF0IDE1OjE2ICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+IE9uIE1vbiwgMjAyNC0wMS0yMiBhdCAxODo0MyArMDAwMCwgU291emEsIEpvc2Ugd3JvdGU6
DQo+ID4gT24gTW9uLCAyMDI0LTAxLTIyIGF0IDE4OjM4ICswMDAwLCBTdW1tZXJzLCBTdHVhcnQg
d3JvdGU6DQo+ID4gPiBPbiBNb24sIDIwMjQtMDEtMjIgYXQgMDk6MDQgLTA4MDAsIEpvc8OpIFJv
YmVydG8gZGUgU291emEgd3JvdGU6DQo+ID4gPiA+IFNvbWUgaW5zdHJ1Y3Rpb25zIHJlcXVpcmVz
IGNhbm9uaWNhbCBhZGRyZXNzIGxpa2UNCj4gPiA+ID4gTUlfQkFUQ0hfQlVGRkVSX1NUQVJUKFVN
RHMgbXVzdCBjYWxsIHhlX2V4ZWMgd2l0aCBhIGNhbm9uaWNhbA0KPiA+ID4gPiBhZGRyZXNzDQo+
ID4gPiA+IGZvciBYZTIrKS4NCj4gPiA+ID4gDQo+ID4gPiA+IFNvIGhlcmUgYWRkaW5nIGZ1bmN0
aW9ucyB0byBjb252ZXJ0IHJlZ3VsYXIgYWRkcmVzcyB0byBjYW5vbmljYWwNCj4gPiA+ID4gYWRk
cmVzcyBhbmQgYmFjaywgdGhlIGZpcnN0IHVzZXIgb2YgdGhpcyBmdW5jdGlvbnMgd2lsbCBiZSBh
ZGRlZA0KPiA+ID4gPiBpbiB0aGUgbmV4dCBwYXRjaGVzLg0KPiA+ID4gPiANCj4gPiA+ID4gQ2M6
IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPiA+ID4gQ2M6IE1hYXJ0
ZW4gTGFua2hvcnN0IDxkZXZAbGFua2hvcnN0LnNlPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBK
b3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gPiA+ID4gLS0t
DQo+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jIHwgMTUgKysrKysrKysr
KysrKysrDQo+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oIHzCoCAzICsr
Kw0KPiA+ID4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiAN
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+
ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+ID4gPiBpbmRleCBhYjQx
N2Y0ZjdkMmE3Li5iNGNkY2YxYjIwODFhIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmljZS5jDQo+ID4gPiA+IEBAIC03MjcsMyArNzI3LDE4IEBAIHZvaWQgeGVfZGV2aWNlX21l
bV9hY2Nlc3NfcHV0KHN0cnVjdA0KPiA+ID4gPiB4ZV9kZXZpY2UNCj4gPiA+ID4gKnhlKQ0KPiA+
ID4gPiDCoA0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgeGVfYXNzZXJ0KHhlLCByZWYgPj0gMCk7
DQo+ID4gPiA+IMKgfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICtzdGF0aWMgaW5saW5lIGludCBoaWdo
ZXN0X2FkZHJlc3NfYml0X2dldChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiA+ID4gK3sNCj4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHhlLT5pbmZvLmRtYV9tYXNrX3NpemUgPiA0OCA/
IDU3IDogNDc7DQo+ID4gPiANCj4gPiA+IFdoeSBub3QganVzdCB4ZS0+aW5mby5kbWFfbWFza19z
aXplIC0gMT8NCj4gPiANCj4gPiBXZSBoYXZlIHBsYXRmb3JtcyB0aGF0IHNldCBkbWFfbWFza19z
aXplIHRvIDM5LCA0NiBhbmQgNTIgYnV0IHRoZQ0KPiA+IGNhbm9uaWNhbCBhZGRyZXNzIGJvdW5k
YXJpZXMgaXMgNDhiaXQgYW5kIDU4Yml0IGJpdHMuDQo+IA0KPiBobS4uIEkgZmVlbCBsaWtlIGl0
IHdvdWxkIGJlIG1vcmUgY2xlYXIgdG8gaGF2ZSBhIGNhbm9uaWNhbCBzaXplIHRoZW4NCj4gYW5k
IHRoZW4gZG8gKGNhbm9uaWNhbF9zaXplIC0gMSkuDQoNCkxpa2UgdGhpcz8NCg0Kc3RhdGljIGlu
bGluZSBpbnQgaGlnaGVzdF9hZGRyZXNzX2JpdF9nZXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQp7
DQoJcmV0dXJuIHhlLT5pbmZvLmRtYV9tYXNrX3NpemUgPiA0OCA/IDU4IDogNDg7DQp9DQoNCnU2
NCB4ZV9kZXZpY2VfY2Fub25pY2FsaXplX2FkZHIoc3RydWN0IHhlX2RldmljZSAqeGUsIHU2NCBh
ZGRyZXNzKQ0Kew0KCXJldHVybiBzaWduX2V4dGVuZDY0KGFkZHJlc3MsIGhpZ2hlc3RfYWRkcmVz
c19iaXRfZ2V0KHhlKSAtIDEpOw0KfQ0KDQp1NjQgeGVfZGV2aWNlX3VuY2Fub25pY2FsaXplX2Fk
ZHIoc3RydWN0IHhlX2RldmljZSAqeGUsIHU2NCBhZGRyZXNzKQ0Kew0KCXJldHVybiBhZGRyZXNz
ICYgR0VOTUFTS19VTEwoaGlnaGVzdF9hZGRyZXNzX2JpdF9nZXQoeGUpIC0gMSwgMCk7DQp9DQoN
Cj4gDQo+IFRoYW5rcywNCj4gU3R1YXJ0DQo+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBUaGFua3Ms
DQo+ID4gPiBTdHVhcnQNCj4gPiA+IA0KPiA+ID4gPiArfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICt1
NjQgeGVfZGV2aWNlX2Nhbm9uaWNhbGl6ZV9hZGRyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQN
Cj4gPiA+ID4gYWRkcmVzcykNCj4gPiA+ID4gK3sNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgcmV0
dXJuIHNpZ25fZXh0ZW5kNjQoYWRkcmVzcywNCj4gPiA+ID4gaGlnaGVzdF9hZGRyZXNzX2JpdF9n
ZXQoeGUpKTsNCj4gPiA+ID4gK30NCj4gPiA+ID4gKw0KPiA+ID4gPiArdTY0IHhlX2RldmljZV91
bmNhbm9uaWNhbGl6ZV9hZGRyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQNCj4gPiA+ID4gYWRk
cmVzcykNCj4gPiA+ID4gK3sNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIGFkZHJlc3Mg
JiBHRU5NQVNLX1VMTChoaWdoZXN0X2FkZHJlc3NfYml0X2dldCh4ZSksDQo+ID4gPiA+IDApOw0K
PiA+ID4gPiArfQ0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmljZS5oDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+ID4gPiA+
IGluZGV4IGFmOGFjMmU5ZTI3MDkuLmNlMjBmNmZlNjIxOWEgMTAwNjQ0DQo+ID4gPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaA0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlLmgNCj4gPiA+ID4gQEAgLTE3NSw0ICsxNzUsNyBAQCBzdGF0aWMg
aW5saW5lIGJvb2wNCj4gPiA+ID4geGVfZGV2aWNlX2hhc19tZW1pcnEoc3RydWN0DQo+ID4gPiA+
IHhlX2RldmljZSAqeGUpDQo+ID4gPiA+IMKgDQo+ID4gPiA+IMKgdTMyIHhlX2RldmljZV9jY3Nf
Ynl0ZXMoc3RydWN0IHhlX2RldmljZSAqeGUsIHU2NCBzaXplKTsNCj4gPiA+ID4gwqANCj4gPiA+
ID4gK3U2NCB4ZV9kZXZpY2VfY2Fub25pY2FsaXplX2FkZHIoc3RydWN0IHhlX2RldmljZSAqeGUs
IHU2NA0KPiA+ID4gPiBhZGRyZXNzKTsNCj4gPiA+ID4gK3U2NCB4ZV9kZXZpY2VfdW5jYW5vbmlj
YWxpemVfYWRkcihzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTY0DQo+ID4gPiA+IGFkZHJlc3MpOw0K
PiA+ID4gPiArDQo+ID4gPiA+IMKgI2VuZGlmDQo+ID4gPiANCj4gPiANCj4gDQoNCg==
