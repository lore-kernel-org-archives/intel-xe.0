Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D6FE7E654
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 16:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2793710E1A9;
	Tue, 26 Sep 2023 16:40:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF3310E1A9
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 16:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695746434; x=1727282434;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uHcJ25rh8Af9MfOK0RhEVggcC4hcVICishiceOiyyLw=;
 b=GsBQ72LRR71LQbgSppZUiyVpNswsy8L+K/81S+HaGdkH2mjaWBTs0Jpp
 Tp2ChbIync0nVm24cJ6EwKooRDSsZ4itSTbgGDYnndyk1vCI7wJglG76P
 9Lf9xspRooH02R+PAvbFDtorEv4wTPL/Fbh6XC6LMkzv+BGi40m9DlQSK
 lBYuN3q1vvmrofUQVyccrZm3G11o8zLitB3nUhqjy0y18/tEBFJKZR14a
 97OMAjfhpDAvdfC0uFafVzQ/fm6pYCK8WuMI2NRNOcN5a2WjkAdM98E5m
 3Gv6gwvA4D4mZk/awm8TceBhdMAiLccVtDPnMup0oA7xwbciV7ydkvshx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="378890732"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="378890732"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 09:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="748866673"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="748866673"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 09:40:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 09:40:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 09:40:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 09:40:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 09:40:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYqPYH3oXFoNNUE9+tnhCzTsaGtin4yTWIjkDwITdENvDYuNwvAiXKCRZfO9c1RWqiJI7TGAILwZaIKSPghEvWF/mp3CmFSas38FUlT3qq9Zpzzo0tMpXoe0XXtH261avf1wHeeydxJgrhYLrMBDYM4ZWeNu1jAJLuPrUczzpsRf7PBfSzDO6S90+nSdDnwnbTK8J3DX5IFPZ/LCNj7DkRh5iAFhkGLekGw1oeJMTA4WSV8zR77TE4agD9rdHRuWCQ4oUiwW8TIHq7NDTDkhLORcwyTp+bBz+CHAqvGcVOyr41ix37JUHmviVFllhNzHG4z5DuoxAgvmlgwq6ZBhfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHcJ25rh8Af9MfOK0RhEVggcC4hcVICishiceOiyyLw=;
 b=A5Yr6SDjkm4nin3fWMt8gnItCcjqkhEwXmkJyQbh4h6vbkmCZ4DIe0ZdpxsjxdLEKU5rwXsYjS07DNM3lCeihLaaZC6PeZXHPrUdxUG9lSh2zbEkv/FlVyDsFNMYxQvaEmWFT95V2FnjpnoaoHxOh60pAW2Di3GmPyCltLQlFMyLm5onEo7P1Qav2h8Oi8BrBG0fxJuQYyAL89BGkK0uhCf/7WDLW/FgrDb0DZ/3J/nyNrM5wj9Jt49CuC2MmNU67jN1r/Ir2pnp/InvNuPRJzJIUoDAlXNRlcJ3Qxu0S0xzZz7EK+x3wbotsh76z+y15UHMGuybZzlVu9PFBziesw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Tue, 26 Sep
 2023 16:40:24 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 16:40:24 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v3 22/30] drm/xe/uapi: Crystal Reference Clock
 updates
Thread-Index: AQHZ8HoE6MlxSY3/w0qe2aHr6sb1GLAtT1QA
Date: Tue, 26 Sep 2023 16:40:24 +0000
Message-ID: <6b81eb7206361dad664c345913a7679622a368a5.camel@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-23-francois.dugast@intel.com>
In-Reply-To: <20230926125540.7-23-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS0PR11MB7901:EE_
x-ms-office365-filtering-correlation-id: 22f6866a-02e1-46b6-545a-08dbbeaf4837
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TAEN27br2dnFfdRLRBXfl6eDHvySuElWSVDshTK3nJCv2oAtA1zKSIB4FYqYmoD77BP3tJrhM4f243RuHdNsOz72tP2p34zZtcXRH/vno0UmRWezocueg5joAzBPwH6YAxYAQ6ZdesQeJiI5E2e2KR/fs2+A4IJa52WDwd/VBDGOzbNl6KS2LInrXYrzy8pWdlUfUOhJn0bOK6iGSsYf/b2RAmTUeRZGeG30GS5jKV4mqwjFVlMgMsQyPkMsm1nGV+TPD8AhGa4NFLmSAcu2XFllPw9DJnQAIt4pXZ8rMzmVuIsNL7TT0pkenxeLOH87wAqPD4uhucrFvUc+LvN9DSBYWLPCcJbMTWPW5oLQFdOq2rTqDIYUCrNApj8/FCkoCr7eSIz6+ULs2g0kA9++UT3qxC4/ZKI5VFtGGX+rp3cpTNW60BYZQRTtTwvE6K0EUF24Nfr9jvwjNqBGglZJyFO8Bu9upVlNKgEFSyRnpFUKGqvgODR8dTJIOjgCPmgUgjED8MUylxIPpfZfIxTfwv2OWwcrspsU92EsoRXoO/miV7bn//nbNltNog/2FPvTK4q0z2PRBrcnHR6PHcnQ2z43XyNUXIQWtFQ7kNPjdN7J7ForHyGhIGWD4pI6Doxs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(451199024)(186009)(1800799009)(6506007)(38100700002)(82960400001)(122000001)(86362001)(36756003)(107886003)(38070700005)(2906002)(54906003)(66446008)(83380400001)(6512007)(6486002)(66946007)(5660300002)(478600001)(71200400001)(2616005)(26005)(8676002)(4326008)(316002)(8936002)(41300700001)(91956017)(110136005)(66476007)(66556008)(64756008)(6636002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3JJWEMxR0pSR2t6aThGaE9wRk1XSUZmZzh0QjJrTEF4QVFrK0JDM2MyRGZ0?=
 =?utf-8?B?OWp6UUxOOTBDTDRTMFFmc2dUTTEyY3JmSmkwdEovQUVSc0daZ1lKMGo5dGlQ?=
 =?utf-8?B?SlU0SHhJeHp6QkRnQjdwd1pVR21BbzNvaUt1STgweW9JOFBBcE13cEhEcnNi?=
 =?utf-8?B?dUJGazN3Umo3N1IrcGFjKzhld3hQQXVLYXN2THQ1bldmRy8yK3VISWxHZGhs?=
 =?utf-8?B?aVUvc0ZQWTFEMHl1NlBmMUdwVG95ZDNxcnBaUVVwVXJZZ05tVVk5WGJQZjAv?=
 =?utf-8?B?OTN2Rmw1aVNYbFdxTVM1a3dPRlhDcUZjYlpYMHY5bVJ0UzFwZnUyU3F5dlNr?=
 =?utf-8?B?K0xodWl6V0FvUjVjOXV5azh1U2NKUTJNcnBTQ3JvWnFFQWtyU1BFbVlkbS93?=
 =?utf-8?B?NlhiVG5ZNGNnVGVSMHlSeXNLYjFrL1VKR1RZekplOUZ2dFhFOGNRcnVHZFIv?=
 =?utf-8?B?dmlUMGtRQkZRcjdnd2JSdU1kY3EycmZXaktndHlhZHBaY0o1Y1RUL0puODIr?=
 =?utf-8?B?dTlJaHI5ODBTdWVJZFRmZ0tOd1hOWXZUTHgyQ2dRQ1FKd0ZUS01haE5XeWtI?=
 =?utf-8?B?YlJBeFBQNHhha3NveUJjWjF2RnFrdVZ1SWlXNlJnM2hNNmZwY0Y0T09RRmpi?=
 =?utf-8?B?SFlkSDBpdForVTRjK21XZzY5NG5lSzlpMGpyQnpNOFZlL2x5VkZpemtBalFx?=
 =?utf-8?B?YWhKeDcrZFU2RThqZC95enpORUtyd2FGNG5lQTREVG9PRUNZN2tOWktKUHJt?=
 =?utf-8?B?c0xrWWQyL2dOakFrdFFiUGRQdXZFWGNTQW52T3pLdVhmc3dSc0licHJhMktP?=
 =?utf-8?B?ZGwwZmg4YzlQdThleEFLeVMrdlAyWlRMd0FObFdKSXVIaTJuSk5QQ2tVZHNh?=
 =?utf-8?B?ZUx4R0hrUGFEMTh5N05ybWZsaTVHcmJVTkR4ZzRCUWtOVHQ0Wjg5emhFQTJs?=
 =?utf-8?B?M2hXS0RFZlduZEFsSTFKMUhZVUk4RjJuZ2pZeStIQXM4MGpqME1WVU1pZzZj?=
 =?utf-8?B?eGEwZVNNWllkZG0waUFZRDFQMUxHbFpVWEx4R01tQmpYaFpwL3J3SUd3VWtx?=
 =?utf-8?B?S3N4MndlOTdVWVBJKzNkY2NkY2ZrVUVzUlZFVG41YnU2bURsSDErK1hpZ1BU?=
 =?utf-8?B?dkxkT3JnNERSaC8xNzZ5WTJvSk9BUW9icFAvR1JkSEtMYmp3OVI4eUQycEkx?=
 =?utf-8?B?QlI5OXR4VkhOeXJSLzJ6cDZWY2RjRUFqZVRNcDVzMTdnNmV5cmRpUk5IR3VB?=
 =?utf-8?B?Y3FVU0ZsOS9MaklQWGNleXd2ZHVETWZldzlDLzZxcERJTm5lQVFBOHhNSFZx?=
 =?utf-8?B?ajVNdkY5N2FLQWRQdUJUK0hIVUpoMUV5UWVpOHlXRXdXNGZIYTBDMUtmb08z?=
 =?utf-8?B?UEFTR1FQWEtzeHlIMWlBejROcldvUFZqYXNPT2hSVlk1VjI0Q1l5K1RaM1Vs?=
 =?utf-8?B?RVh6bzNQbHR5eERkenU2S2UyR0ViZ2FZajgyTlVocGpnVThVVkhDM1ovYmFK?=
 =?utf-8?B?Rzl6YXZkbDl5bW5uMGpnQmhGNVBPYW9oRTlHWjlaYkxUaHM4b0FGeEVRK0NP?=
 =?utf-8?B?NGNLZ0diMEhkOFRnTlRGTElyQWZpTGtxenVqckNyNEhpcmMvV2crL1htVFpY?=
 =?utf-8?B?aSs2Vlp0VjhrUU9hQXlPOEF4VlZtbG5TMXd3K3JaTUNsWkEybXR2Z3h5MDZE?=
 =?utf-8?B?NWwzRkk4M3J1d3dlL1EvYXpDZzluTjY0a1RKbW1hSDZGaTREV3J0MmZPUGoy?=
 =?utf-8?B?QUdLRXBpYW1tWk85eVl5MGJhT0dSZmJKQ3lGUXlIWm9oZHJ6UVVPMXhXZC8w?=
 =?utf-8?B?MUQ0SHhrcDZ5S0tuNFAxTnNhZnRiSUg3T2lLMnNyKzV1VEtqeE1kaG5sNnl4?=
 =?utf-8?B?SC8xL2d3dng4U000UzBodGpaMDVqLytPK3pRWTh6K0RkVDQ0U1ZHT1RydGg0?=
 =?utf-8?B?VUZWSFovNlMrR1c5Njd4SGcvS2JKRGFjOFZXM1RJSlovOGxTamRYR3JFVVNl?=
 =?utf-8?B?UWtvWVhSdjlWWjY3VVhtZ2VTNXduYjdLZUNwRVhYbExCVkdZVEZabU9nTkRo?=
 =?utf-8?B?cU1DZTY1TGtWemVwTGVTTzFodDRYQUpXSE9ab0tRWGtyajZGeXpsdC9NOXg4?=
 =?utf-8?B?ZGd2amZDT1NCU3RkN3Fza0cxTzBlam1PVDNEb0g5RmpwTm1Ka1JaNlVqK05B?=
 =?utf-8?B?N3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9C76DA7E2CFE94082B5AE29DD0C5619@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f6866a-02e1-46b6-545a-08dbbeaf4837
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 16:40:24.3084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xn4ZOFHn47dfq9ySh0qnhaaGEo169iL9IBXCAoXj1ghZeuVEDVHQO70YzGdUP/V0LjOe5meAyB52pdJXZZPQsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7901
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 22/30] drm/xe/uapi: Crystal Reference
 Clock updates
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA5LTI2IGF0IDEyOjU1ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IEZyb206IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gDQo+IEZp
cnN0IG9mIGFsbCwgbGV0J3MgcmVtb3ZlIHRoZSBkdXBsaWNhdGlvbi4NCj4gQnV0IGFsc28sIGxl
dCdzIHJlbmFtZSBpdCB0byByZW1vdmUgdGhlIHdvcmQgJ2ZyZXF1ZW5jeScNCj4gb3V0IG9mIGl0
LiBJbiBnZW5lcmFsLCB0aGUgZmlyc3QgdGhpbmcgcGVvcGxlIHRoaW5rIG9mIGZyZXF1ZW5jeQ0K
PiBpcyB0aGUgZnJlcXVlbmN5IGluIHdoaWNoIHRoZSBHVHMgYXJlIG9wZXJhdGluZyB0byBleGVj
dXRlIHRoZQ0KPiBHUFUgaW5zdHJ1Y3Rpb25zLg0KPiANCj4gV2hpbGUgdGhpcyBmcmVxdWVuY3kg
aGVyZSBpcyBhIGNyeXN0YWwgcmVmZXJlbmNlIGNsb2NrIGZyZXF1ZW5jeQ0KPiB3aGljaCBpcyB0
aGUgYmFzZSBvZiBldmVyeXRoaW5nIGVsc2UsIGFuZCBpbiB0aGlzIGNhc2Ugb2YgdGhpcw0KPiB1
QVBJIGl0IGlzIHVzZWQgdG8gY2FsY3VsYXRlIGEgYmV0dGVyIGFuZCBwcmVjaXNlIHRpbWVzdGFt
cC4NCj4gDQo+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiBV
bWVzaCBOZXJsaWdlIFJhbWFwcGEgPHVtZXNoLm5lcmxpZ2UucmFtYXBwYUBpbnRlbC5jb20+DQoN
Ck1pc3NpbmcgQ2MuDQoNCkRpc2N1c3NlZCB3aXRoIFJvZHJpZ28gb2ZmbGluZSBhbmQgd2FzIGFn
cmVlZCB0byBicmluZyBiYWNrIGNsb2NrX2ZyZXEgaW4gZHJtX3hlX3F1ZXJ5X2d0IGFuZCBkcm9w
IGNzX3JlZmVyZW5jZV9jbG9jay9jc19mcmVxdWVuY3kgZnJvbQ0KZHJtX3hlX3F1ZXJ5X2NzX2N5
Y2xlcy4NCg0KPiBDYzogRnJhbmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+
DQo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVs
LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyB8ICA1ICsrLS0t
DQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICB8IDEwICsrKystLS0tLS0NCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3F1ZXJ5LmMNCj4gaW5kZXggYTI3YjEwNTgzZjVhLi44MTg0ZGY0YWJkZTEgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IEBAIC0xNDksNyArMTQ5LDcgQEAgcXVlcnlfY3NfY3lj
bGVzKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiAgCWlmICghaHdlKQ0KPiAgCQlyZXR1cm4gLUVJ
TlZBTDsNCj4gIA0KPiAtCXJlc3AuY3NfZnJlcXVlbmN5ID0gZ3QtPmluZm8uY2xvY2tfZnJlcTsN
Cj4gKwlyZXNwLmNzX3JlZmVyZW5jZV9jbG9jayA9IGd0LT5pbmZvLmNsb2NrX2ZyZXE7DQo+ICAN
Cj4gIAl4ZV9kZXZpY2VfbWVtX2FjY2Vzc19nZXQoeGUpOw0KPiAgCXhlX2ZvcmNlX3dha2VfZ2V0
KGd0X3RvX2Z3KGd0KSwgWEVfRk9SQ0VXQUtFX0FMTCk7DQo+IEBAIC0xNjcsNyArMTY3LDcgQEAg
cXVlcnlfY3NfY3ljbGVzKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiAgCXJlc3Aud2lkdGggPSAz
NjsNCj4gIA0KPiAgCS8qIE9ubHkgd3JpdGUgdG8gdGhlIG91dHB1dCBmaWVsZHMgb2YgdXNlciBx
dWVyeSAqLw0KPiAtCWlmIChwdXRfdXNlcihyZXNwLmNzX2ZyZXF1ZW5jeSwgJnF1ZXJ5X3B0ci0+
Y3NfZnJlcXVlbmN5KSkNCj4gKwlpZiAocHV0X3VzZXIocmVzcC5jc19yZWZlcmVuY2VfY2xvY2ss
ICZxdWVyeV9wdHItPmNzX3JlZmVyZW5jZV9jbG9jaykpDQo+ICAJCXJldHVybiAtRUZBVUxUOw0K
PiAgDQo+ICAJaWYgKHB1dF91c2VyKHJlc3AuY3B1X3RpbWVzdGFtcCwgJnF1ZXJ5X3B0ci0+Y3B1
X3RpbWVzdGFtcCkpDQo+IEBAIC0zODAsNyArMzgwLDYgQEAgc3RhdGljIGludCBxdWVyeV9ndF9s
aXN0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSAqcXVl
cnkNCj4gIAkJZWxzZQ0KPiAgCQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0udHlwZSA9IFhFX1FVRVJZ
X0dUX1RZUEVfTUFJTjsNCj4gIAkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0uZ3RfaWQgPSBndC0+aW5m
by5pZDsNCj4gLQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0uY2xvY2tfZnJlcSA9IGd0LT5pbmZvLmNs
b2NrX2ZyZXE7DQo+ICAJCWlmICghSVNfREdGWCh4ZSkpDQo+ICAJCQlndF9saXN0LT5ndF9saXN0
W2lkXS5uYXRpdmVfbWVtX3JlZ2lvbnMgPSAweDE7DQo+ICAJCWVsc2UNCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+
IGluZGV4IGYzMDZjYWU2ZDQ2Ny4uMDI2NTM2YTIwMjUzIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRl
L3VhcGkvZHJtL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4g
QEAgLTI0OSw4ICsyNDksOCBAQCBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X21lbV9yZWdpb24gew0KPiAg
ICogcmVsZXZhbnQgR1BVIHRpbWVzdGFtcC4gY2xvY2tpZCBpcyB1c2VkIHRvIHJldHVybiB0aGUg
c3BlY2lmaWMgQ1BVDQo+ICAgKiB0aW1lc3RhbXAuDQo+ICAgKg0KPiAtICogVGhlIHF1ZXJ5IHJl
dHVybnMgdGhlIGNvbW1hbmQgc3RyZWFtZXIgY3ljbGVzIGFuZCB0aGUgZnJlcXVlbmN5IHRoYXQg
Y2FuDQo+IC0gKiBiZSB1c2VkIHRvIGNhbGN1bGF0ZSB0aGUgY29tbWFuZCBzdHJlYW1lciB0aW1l
c3RhbXAuIEluIGFkZGl0aW9uIHRoZQ0KPiArICogVGhlIHF1ZXJ5IHJldHVybnMgdGhlIGNvbW1h
bmQgc3RyZWFtZXIgY3ljbGVzIGFuZCB0aGUgcmVmZXJlbmNlIGNsb2NrIHRoYXQNCj4gKyAqIGNh
biBiZSB1c2VkIHRvIGNhbGN1bGF0ZSB0aGUgY29tbWFuZCBzdHJlYW1lciB0aW1lc3RhbXAuIElu
IGFkZGl0aW9uIHRoZQ0KPiAgICogcXVlcnkgcmV0dXJucyBhIHNldCBvZiBjcHUgdGltZXN0YW1w
cyB0aGF0IGluZGljYXRlIHdoZW4gdGhlIGNvbW1hbmQNCj4gICAqIHN0cmVhbWVyIGN5Y2xlIGNv
dW50IHdhcyBjYXB0dXJlZC4NCj4gICAqLw0KPiBAQCAtMjY3LDggKzI2Nyw4IEBAIHN0cnVjdCBk
cm1feGVfcXVlcnlfY3NfY3ljbGVzIHsNCj4gIAkgKi8NCj4gIAlfX3U2NCBjc19jeWNsZXM7DQo+
ICANCj4gLQkvKiogRnJlcXVlbmN5IG9mIHRoZSBjcyBjeWNsZXMgaW4gSHouICovDQo+IC0JX191
NjQgY3NfZnJlcXVlbmN5Ow0KPiArCS8qKiBSZWZlcmVuY2UgQ2xvY2sgb2YgdGhlIGNzIGN5Y2xl
cyBpbiBIei4gKi8NCj4gKwlfX3U2NCBjc19yZWZlcmVuY2VfY2xvY2s7DQo+ICANCj4gIAkvKioN
Cj4gIAkgKiBDUFUgdGltZXN0YW1wIGluIG5zLiBUaGUgdGltZXN0YW1wIGlzIGNhcHR1cmVkIGJl
Zm9yZSByZWFkaW5nIHRoZQ0KPiBAQCAtMzgyLDggKzM4Miw2IEBAIHN0cnVjdCBkcm1feGVfcXVl
cnlfZ3Qgew0KPiAgCV9fdTE2IHR5cGU7DQo+ICAJLyoqIEBndF9pZDogVW5pcXVlIElEIG9mIHRo
aXMgR1Qgd2l0aGluIHRoZSBQQ0kgRGV2aWNlICovDQo+ICAJX191MTYgZ3RfaWQ7DQo+IC0JLyoq
IEBjbG9ja19mcmVxOiBBIGNsb2NrIGZyZXF1ZW5jeSBmb3IgdGltZXN0YW1wICovDQo+IC0JX191
MzIgY2xvY2tfZnJlcTsNCj4gIAkvKioNCj4gIAkgKiBAbmF0aXZlX21lbV9yZWdpb25zOiBCaXQg
bWFzayBvZiBpbnN0YW5jZXMgZnJvbQ0KPiAgCSAqIGRybV94ZV9xdWVyeV9tZW1fdXNhZ2UgdGhh
dCBsaXZlcyBvbiB0aGUgc2FtZSBHUFUvVGlsZSBhbmQgaGF2ZQ0KDQo=
