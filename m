Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC24EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 19:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA75A10E059;
	Thu, 29 Jun 2023 19:10:10 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F8910E059
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 19:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688065809; x=1719601809;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=f62fXmhk4EhL4GW6/+13ZfmZkEzVy386dG6uK05vGxg=;
 b=ZMuuW4nARZBbTA5PiPsCH83CRH7eocPhx2j/lfzkVBpoV+Vkgt4FZNqO
 2bzyr9dCecaM6nutodRaCFomRXQzF6/Xs5AtxC6k8RWDL93FGVia+49Rl
 4Sf0z3/s9KRZLlKKsdRAhhyTcGO+RYv4ba+BDj0naeT2fCjcQisjf/0tu
 5THqqBXrcmejfX1iqdE5R5Hu1WM+IPCVq6855xdjDHpmhnwypPO58IqV6
 20ge5FSEewGoW8paEzYz9tmBgVsuTxZoD/vlKARbunhw93hL/2wzae1lP
 L8JtbwrzDRIcNNboBO3PqQX1zllr2RD/FBnNCnaEwO6T2/Y4Y4F7ymN8a w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="362242401"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="362242401"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 12:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="752746318"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="752746318"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 29 Jun 2023 12:10:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 12:10:07 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 12:10:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 12:10:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 12:10:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/C8PV1C4oZs+Fb8f8xSrs90htTkkgOFkoEfOleKcsewk/hPrk/UNkF5k7IRRv63hZGQJxVwF0GD5eb0BUiNVGUv8tb91dZFY5RYgMK8tQih52A0MYLTleaDGIWMUZ4f5acUfNTK+0iGfJtoHzkiSSUy0h1k4WT1mTE2oBZBt6hmvyKbO7AA5kSKsD0KOXQZJ8G74VB1fm/OFtA/enj5hH5CaD0fgA5larmJWzA/rotYy7/9aVOTaKEJabh6jZcQ/4BLu8gklXg/oH3AJJ8tcyod7C+1yubKxr6apFP4YxMGrlX7Kx6hSuk/X8yS1z4/lyw+jcUA4BA6ZuooEU4jeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f62fXmhk4EhL4GW6/+13ZfmZkEzVy386dG6uK05vGxg=;
 b=kOenVakqTNP5y1AN8P2BLAulQEeYG6pV4qcd2wUpX2KoDaHPOyHHoMEJf6/GSHvHy9d4PzgZ6FIAK+jdDM+y6OjPArSS8Hb3I2NJd2BL0rGCSfeZ84xxJyFs+bv26h6eEMPF9Li8jUNdJKZMQWbZd1/QkVSMi+WJbenE6r94oe5Ue4nE6shw5S2LYl6sNDIZ8pyf4JtZT07kDY2O+3ps9sabv+BuIyL4GcUFU7/HyM/rk+DEO5KQkpfwh4TI+yqZYQ3ESNkZ+RNM1zyoKQlh8ltNpNbDeUKoh5d0o8TUH0TOVVs2xBMjPiwDVdpu1DXF43CckZn8jdGljFENibcY+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS0PR11MB8184.namprd11.prod.outlook.com (2603:10b6:8:160::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 19:10:04 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 19:10:04 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Thread-Topic: [Intel-xe] [PATCH v6 0/6] uAPI bits for small-bar
Thread-Index: AQHZop1ZstXJZEoUaEaaqGiTqqsaSa+iNWCA
Date: Thu, 29 Jun 2023 19:10:03 +0000
Message-ID: <fb445fe4c72588d7582aa877b7a2653d321bec7a.camel@intel.com>
References: <20230619110018.53538-8-matthew.auld@intel.com>
In-Reply-To: <20230619110018.53538-8-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS0PR11MB8184:EE_
x-ms-office365-filtering-correlation-id: 044b10d8-8fc6-4284-4ff9-08db78d471b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QZspCTpKBnShrlV6wike2nXxuQTuP3U6cNkr15tV7Q4eAKZOmEqAGkHxUHPgcer5JfaPInKR681rN47Own0Scl2NKD4rcCh0w33HmEnolbi6b0jM0hoqLS8GeaB13NWbC9iyyhFQ56+NPU2qZAZlgcVMyVWlwL0CvwP9tLrVPM/AtCGCRidzmPx8y4DJd0Bk1Wjbi2Y2uWVcBa2fzkyfQworKW4eUJ6dh3C3xIzx0TeKstU7GzBffBKuddJPxJqz84W/pNQ0QJmIHbgh+WvLgTU7aoAo0iiDQiDmiy4+3J7Rk4RlpkPRi0qew4Pg+X/l/9C6eAhGir9MOBGUW1B6RI3Fsri5RwnMzVcnBaNhN3qwdhV9jhbdtK7+cqVnHF4LdVuBk5li0Ceta0H1cL6P6ekJaOyGqvmc9gIsG3ORTRj8H8Pw1teGnqeGyEZgsZO87DB3fWQGvq8dXb7AeCK7w3eAfqsapi5mSjfV/TtWLOUbavrI8WoXCBdDklU4YpwKkvnm0pipGDtIJpaM31ZHMhrm874EcJhCYal4zV8Mdl+2ARn4BRIWzKkQ7VginchePuE8wE2/iSbux9SLXyUQbgesdaBjD/tBX+xnjOcmkhA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(346002)(39850400004)(136003)(376002)(451199021)(5660300002)(64756008)(66446008)(66556008)(316002)(66946007)(36756003)(478600001)(66476007)(91956017)(76116006)(6636002)(6506007)(8936002)(8676002)(86362001)(4744005)(2906002)(6512007)(26005)(966005)(110136005)(41300700001)(6486002)(186003)(38070700005)(71200400001)(83380400001)(38100700002)(122000001)(2616005)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tjl2UmlEWEU1clFCT2xXSUFORXlPQ2FjS0lmeTRrSWFNcGZxNFVsT012SmFw?=
 =?utf-8?B?VFN3ME96NzcwaDNrY01JQW5tRXRKdG80NDZkQTBSNmpIMzFJL0xmSzk5dUM1?=
 =?utf-8?B?a1VEeUY1OTUzZVVwWW1yaDNFRk5MYnYxcG0vQlFHN1R0cUNkNURFR3BVeW10?=
 =?utf-8?B?eGYxcFdpMk0xR3VJSUpNM29CL2JTendQeFIza1NsNktCY2EyQmtBVTRzWjBK?=
 =?utf-8?B?cTM1OGRxYyswa20wWUhaQndEaWFQb1B0YjVpZUhLOXdqcjRidm9FMWpjc1Vy?=
 =?utf-8?B?ZEN6UjJ3Y1QvZVhoN2p6c3o1NitNSER6ckdhZ0EyUWJLL2ZkWVpaRTEvbUlM?=
 =?utf-8?B?S1lpVmFkWHpRTmptZW1Pck9TaGM5U1lBK3JOanY1cUt6b2pWaWtEQ0ZIR3Ji?=
 =?utf-8?B?SDZBbTEzUDI0SVFrZ0UrZmlBVkw1QmdyN0lLWUpGazRRTWY5bFNaNm1zSGov?=
 =?utf-8?B?RkVmSXE2S2xjOE5qSm5CNCtMbWJOaHJGTGRXSWtNcWVqZlpDNGhCb05ubi9D?=
 =?utf-8?B?SStmUnRMN3Q5RHV1YXFtTDlKRVJ4ZDM0UFJHQis3aGljVDcwaG1RMmVyK1Qx?=
 =?utf-8?B?amg5dDRpOVdFSkd4eWg4TTRvdTgrT1BRMGljdUtPTEpFc2p2cDJNQkJ4ZE5R?=
 =?utf-8?B?L2p6TERoUHlxbkpxR1Q0RXdSSWRzREVFK1RhR3QycCt1eERpZC9HTWd1WkRF?=
 =?utf-8?B?SEpqdFY4STFGODRIbmQwNlFYUVdha3FkMXRqbWYzR3ZJa3djTXFmS1hDSUdF?=
 =?utf-8?B?SG1GVkNzc09YTkxRampvNzNaUndBT04xTFJKZ1FVeXRsUFpGeDdCcnd3akpa?=
 =?utf-8?B?Q2xhQnZIKzlYSktONDhBbjB3UmUvNWo1MVh4Vk56MHdKRHl3N3ZucnRkSWs1?=
 =?utf-8?B?aEk3N1BUMlprbVdKWmhrclhhWWRybDlUTFFiN2U4S1JnN0tud0hUNnpZOWZz?=
 =?utf-8?B?NWY2aTlydGZGTEZCeVlIaE51bWc4REdib1lxeHdQVW9NZHkwQ2tDS3p0SmJs?=
 =?utf-8?B?WXZpTXlZRXoyZjZaMHd3Y0RKV0NsUEo2ZlAzMTJwU05kRUhmdTA4NnhTSEo4?=
 =?utf-8?B?WDdhYnpkZE1RSFdTT1hNYndOMEU2cldMZ3RrZ2ZNS1N2R0V0RUgxeEwzdld4?=
 =?utf-8?B?T1J5WWk0LzkwN25hWFArd1kvWHNBc2pMS1RRRU9rSVVIZ0F4YU8ybjQ3RmF5?=
 =?utf-8?B?SXBua2t0c1RIZEJ2VFhQdzZiSW90NkM3by9jR2VvelZyS0RtWHdvYWhVUVZ4?=
 =?utf-8?B?TThPTiswVFRPOFArMmFYSktyQ1FYTnNKZ0JVa3c0cG5RSldOMy9zMTBtOHg1?=
 =?utf-8?B?VFg0SEMrRW5zLzgzZ0FibnFzWS9Fdk5nNURyVktRMGgvdjFQSi9iRVZxQkdE?=
 =?utf-8?B?d2VBaTBaeWkxRERhMEZSQUx3MndQT05aKzhFOXRVZm9GaDUzazZXZmVHUWQ3?=
 =?utf-8?B?VGhWQitYeDhWN3JKSFN0b1VOVmJ6NHc4TnhQY05MVEhpSlQvTDJCTmdSZG1O?=
 =?utf-8?B?Vy8vT055alltQTF4Q203UHJWTUIyRkJZaTlXcjNWWW1IOFJ3RDNOSkFFelp6?=
 =?utf-8?B?R0hGWmZRa0ZxZTlUaUhWMVd2QzVNRnA0UjFVU1BiRzVhMStmQXNvakh1cjg0?=
 =?utf-8?B?R1FYQ21hZkdlMUtmYjVza09qVndwM1BGU2RJRzhmWHpYQXdsUlQwT0Nmb0tn?=
 =?utf-8?B?OFBWUktYL2UySWNzYXk1UTY5Tm1NY0JMcWY5Tloya1N6dGZncExjQUF6aFA2?=
 =?utf-8?B?dHZ1V0hmYnhWQS9DNWw3VG9HcmY1dlhJa1k5MkVOZitKVEs0ZFFPZk9aV0RH?=
 =?utf-8?B?bkdFYnl3c0d5RDYrM292NUVaTUIvSW91TWIrQU1iZ3J3c1p4K3o5RnNGZE13?=
 =?utf-8?B?Tk5uS0VHdCt3RzFOajd2ZStGaUw3RWkyL2FjU2c3bks3d0x1QStHK1VOUWE5?=
 =?utf-8?B?UWx6c0F1OGR2MHVKQndtTS9uZEgrbng0UVFkVlpxbVdwcHpQMmNjN25xY1Fh?=
 =?utf-8?B?M00zQ1FQZnBDclZPNFZKbFR0OThqeEUzd3VPNk00SnU2TXIyRHg5d2FabFNU?=
 =?utf-8?B?WGdsM0RycmJ1ZDBWZFM1SXdrUnZxZ0pxVGNLeGJZeFZyTTAvOVdXV1RSRDRv?=
 =?utf-8?B?YjlCSStEc3RwVUNsNVM3RWhweXRmMjZ5ODY4WXRYYThDVnZSY1dRMEo3MzVk?=
 =?utf-8?B?Y1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1057D1B11E1AD44C9C73D1D39758DCF4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 044b10d8-8fc6-4284-4ff9-08db78d471b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 19:10:03.8594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GhHS24XYoKQCwoV7TUKb7M6s4ED8/d2FbII4vLAnfQA27ZOwMaIUmrfrjjroWD5sjKoTPDLG+Mhs1gFJxyX+cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8184
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 0/6] uAPI bits for small-bar
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

T24gTW9uLCAyMDIzLTA2LTE5IGF0IDEyOjAwICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IFRoZSByZW1haW5pbmcgc21hbGwtYmFyIGJpdHMuIEFkZCBzdXBwb3J0IGZvciByZXF1ZXN0aW5n
IENQVSBhY2Nlc3MgZm9yIFZSQU0NCj4gYnVmZmVycy4gQWxzbyBleHBvc2UgdGhpcyB0byB1c2Vy
c3BhY2UsIGFsb25nIHdpdGggdmFyaW91cyBiaXRzIG9mIHJlbGF0ZWQNCj4gYWNjb3VudGluZy4g
RmluYWxseSB0dXJuIG9uIHNtYWxsLWJhciBzdXBwb3J0Lg0KDQpNZXNhIE1SIG1ha2luZyB1c2lu
ZyBvZiBuZXcgdUFQSSByZXZpZXdlZCBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVz
YS9tZXNhLy0vbWVyZ2VfcmVxdWVzdHMvMjM3ODEganVzdCB3YWl0aW5nIHRoaXMgdG8gZ2V0IG1l
cmdlZC4NCg0KPiANCj4gdjI6IFZhcmlvdXMgaW1wcm92ZW1lbnRzIHN1Z2dlc3RlZCBieSBKb3PD
qQ0KPiB2MzogQWRkIHNvbWUga2VybmVsLWRvYyAoR3dhbi1neWVvbmcpDQo+IHY0OiBTbWFsbCBr
ZXJuZWwtZG9jIGZpeCwgYWxzbyB1c2UgdGhlIGNvcnJlY3QgdmVyc2lvbiBvZiB0aGUgc3RydWN0
DQo+IHY1OiBSZWJhc2Ugb24gbGF0ZXN0IHhlLW5leHQgY2hhbmdlcw0KPiB2NjogUmViYXNlIG9u
IHRoZSBuZWVkZWQgUExfVFQgLT4gUExfVFQgbW92ZSBmaXgsIHBsdXMgZml4IHNvbWUgb3RoZXIg
aXNzdWVzDQo+ICAgICByZXBvcnRlZCBieSBKb3PDqSB3aGVuIHJ1bm5pbmcgYWN0dWFsIHdvcmts
b2Fkcw0KPiANCg0K
