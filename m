Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC356C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 17:01:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D191131EC;
	Tue, 30 Jan 2024 16:04:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59A21131EC
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706630666; x=1738166666;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=LHi9A5hZ6oxYnidMP2TBxALVUyzUx5iwjcxH0Rabmkc=;
 b=noTGMvIBByBvA9LtaCrENhPP2bmi8ojm/szxFoFFaKe1quGOvhssKe2d
 5aZNQ135It1xK23KCdbMo6aFk2A349A0ZL8zAMP+Hsf8yOsM/XeHT4+RF
 Wz5H1DHW4hxWz+AadCrsW9rf4Q8SPohuyIn+9v8hEVUFxGP2PYeHSLmNg
 6bpNtkd6mOliSPTUyasmzMDoufC4Gk74X7Tnufj7jBKv4x0MHg6PhRSwa
 ZroC9ZgNII3OZW+3wrgqpHn88qUcRtmDewnqcdADB6ecJf1VhTmD2In90
 6EMpKzDakoR/KuX4ccLwwtOds+XUSoX3Xc7pw44ocvN89mpuUf450WszO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="467573055"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="467573055"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 08:00:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="961321500"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="961321500"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 08:00:09 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 08:00:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 08:00:08 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 08:00:08 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 08:00:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n488cGQlNaRS/tETMWWyakGJkCQPhdnMDo6u8hdJ3lSEXO8pjzdPVdWSvF9WCIWahWhARf/4fQBaX30vt3k84H9SMpI7h3UymQoSib5/0IBlFpIvRnBTPc/wCoYCsH4bxY3J6wYBvASj2BwVLDADl5wZrTWAC2Rk15LMDjKiuiqzLPTzG93XX5twUcDm52Gepf7bfgcFa2ctLXlctGR6obYn+bgZn2GyT9pK/ECTaseaGpAd+ITlbzVSRH0b16zQBiwa+y49jW8r+Bdtag6bDtEAhVOPusGqQIu4COgeEwTi0OMkqxu3+imzZOWwfmjNj4AD4wW+QtxU3zjwLrcpXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHi9A5hZ6oxYnidMP2TBxALVUyzUx5iwjcxH0Rabmkc=;
 b=KYxST08xVu+Vmojmf3may+dsIUkdbYzgAwthy19bAgdftFAUzv+gtPufdUlDXsFtxEqsXM+n72ERLREZiUS6T9j32BUM5Qb1Jo4GdbpRHAkz/1tpvooqBvxpZyrCQiBITGwvoR7VcvCjUNvc3H0/gyaK3yv1qscntOgD3OWvH/QevBrcqidRAqzd3TXYm5hA1R6HoZnnGQe64kBkCjBe3BwWFArxzr3u6EUG7di4PXP4nhVgXzqWRvA97hKz5FTGLd2UuoxNEMLRlcVZ3ok3LmNPfitb7Cuy7xZdAmzNdt2pcnypUMkH3enlFrJvPP4g6jIxyIcNuC+HfBg5Wr3DtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW4PR11MB6617.namprd11.prod.outlook.com (2603:10b6:303:20d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.31; Tue, 30 Jan 2024 16:00:05 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f%7]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 16:00:05 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Dong, 
 Zhanjun" <zhanjun.dong@intel.com>
Subject: Re:  CI.checkpatch: warning for drm/xe: Expose number of dss per
 group and helpers
Thread-Topic: CI.checkpatch: warning for drm/xe: Expose number of dss per
 group and helpers
Thread-Index: AQHaU5Vjd7pOEpPdmUiX3Bm4xnhFzQ==
Date: Tue, 30 Jan 2024 16:00:05 +0000
Message-ID: <2b3953d9e6ebdd306581ab643253cea9826e9702.camel@intel.com>
References: <20240129223403.150578-1-zhanjun.dong@intel.com>
 <170656785585.806401.15391310555698830368@5338d5abeb45>
In-Reply-To: <170656785585.806401.15391310555698830368@5338d5abeb45>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW4PR11MB6617:EE_
x-ms-office365-filtering-correlation-id: 46dcb70c-cd95-4568-44fc-08dc21ac864c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vRk9Pjux5CiyaJtMLDKe/XMZkO8IbCsCPhhTI2t11hLTA5wL4e/qqcVPOuA0muCvE0ETHqOiio0m4UKLME8wg7J3MuxEwPt9Yt+ZLvc8Betj6KIBDGctceiAo+JEXDhuzQgaawFYfdn4dcqzuPVCTYO5f8H4mwWAxStPalEmQRvTghUeN0kszeXz4gyfaKLPjGfLgrJLfTsxBBVrDNGAOj17gJTke2chk2OYLyllmw0ewH8O0Ez9mIBrg6we9ML9g6MyKXdb83s4ZPGCXfR5eeNHDkPm50KFEhmJ7g8uEN+KWQCVb/VOA5eRs63VC59/LGvVz527/9E29oUc0/nykvhwn6NpZ2Lt9woCkaAHPpLFbJ9mlyjDV753H+cIRTZP4PICv04a/0ViWCGF29AAdqy//1u6D7lSeHdWYfGyTGqQ3xLYF9BcjeoXuzoz5jht7Bg/Y6x6mwAamHIv0hh2tctNHSRt/bCXp9G9pNAp24p+eX6WEFRRGNWaJyLgyZWqQJJ3sk6t1I7cuPqxx+VXuu83Y4zk70z7cnjyn10Up1sjrRyvepjA1hAuIGtXc1sIeZyxLEZb0ObPlQe1te0SbViiRYFyrvzdQLvE1nT0keSbq8irZ/MmylyqEHWon8+CGiM0kz4XEfxeOMD24ZolIaue91e7ynuUCcCKMVKezjjqTu18C7PYUVLgugYC1wxU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(396003)(376002)(346002)(230173577357003)(230273577357003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(66446008)(66556008)(8936002)(5660300002)(66946007)(8676002)(86362001)(2906002)(76116006)(64756008)(36756003)(6512007)(38070700009)(316002)(6636002)(966005)(66476007)(122000001)(478600001)(82960400001)(38100700002)(71200400001)(6506007)(110136005)(6486002)(83380400001)(41300700001)(2616005)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ay85U2RUSG14N1FOVWduclYzVnVKSmdKVVlRb1NCYVFnWmF5UHJUb1YyelhX?=
 =?utf-8?B?bHdYUXFrTU5mN1ZHOEZrL3FFenBaL3g2di9iZWhWTkxJMG5palhFNERDNHVs?=
 =?utf-8?B?NW1UUjUvYXN0T1ZjdGkzdTJlSkp5ZmM5clBPZ0dUS3lPUHZMcHdRanhzY1Br?=
 =?utf-8?B?bUNkMWdPalhjR2pPQWU0VVNmeWNoK2Z6dzB2V3gyNkNLNEdsa1pVOUQydGo2?=
 =?utf-8?B?VmFKMkxPazlIMXpScHozTnlFSVlHdGFKSzlFcStwRUg2TXc2TVdHbEZtaklM?=
 =?utf-8?B?VGJTQ21hbGVrVHdSUWZhMjB1THFXczloNjU5bytEMFl5SEhlWjBVL2FlTW5j?=
 =?utf-8?B?Qk1RT2lTbWdoa2NQbXZIS2IxcWtsNXd1UHc5OWNJTUFFRWpoSU1ndDFIYWJ4?=
 =?utf-8?B?YktGcEtVemFtTDVCQmFUV0JJZCtnbnhkVWdrcjdiVDRuYm9sZTY3ZHBtNjB4?=
 =?utf-8?B?SnZyYXVhR3hBT2o0QTAxK0tjUFluRklRb0E3cXBZbDMrejAzMVhpcXo3TkdD?=
 =?utf-8?B?cWR2Z3pHRXVlQjRHUWwyZG9ZZzlDWGNrSXpjYWYvS1lXMW85VU9qVVNpTXk5?=
 =?utf-8?B?b3RwTkNzR1hadzN0UWdjQ3dBS3BtK0dIcTQ5ZjYxYTBBaHFVTER6NVM3TWpw?=
 =?utf-8?B?U1VVTHlJSUp3emdrUXVTTFczOGhhZ0lOU1NpQ3M3cUNyczhYUVl6SC80bUNo?=
 =?utf-8?B?R09XVUM4QlVYWkVKRWwvVTh1WWhBdVg1TmR1ckEyK0s1NjBMQ25VQzVuQmlU?=
 =?utf-8?B?bjVrWnZCaG1DQUlpbTRLV3hxWUJ1L0ZnU0ZTRVZGeU9EOXFaU0diQWh0Q0U4?=
 =?utf-8?B?Wk9BZ1BBc1ZkQ3FacnZ4aWJhVDdHSGlnUTZaekdBV2FuUnhCWDQzNjJ3N09Z?=
 =?utf-8?B?ZnNLaFhyL0RkMC9PV0hJaFgwMWRzZFRVaE9iQW8veGcyenZnV045b1lld3pl?=
 =?utf-8?B?SDVJMU5yUkFCOWMyOEhOYm15cWVHSCt0L0c2aTBwMytMYzdGQkFOa09CdTNy?=
 =?utf-8?B?Nm5VbWkyOHljN1FTQTlqVmVkMG51ZFdRWHphSW9BZXlCY1R1S0ZRbGRGZzh5?=
 =?utf-8?B?cFhNakVVUTVvMmxGVlNVaDNQNTI2QVNPK1VwOCt4ZWxxbUNETW10bFQyQ0tu?=
 =?utf-8?B?ZnVQUWgvajZzbExkbDliN2VESDdDZ0dyN3FaaDZSUFM3Q2I2QjdzMWd6ZG56?=
 =?utf-8?B?MkdtSjJpeTB0UFZFTUdJRTljdHFPRW5GL0w1OFBNWDJZNlFsUmhKc0ZyaXQ0?=
 =?utf-8?B?N1B0ZUZnbGlud1VLYnlCYzNadHAwVi9yZmM3R0JNM21RN2R2ajJwZnNtQ0tP?=
 =?utf-8?B?OFo0ZmRZd28yNGgrZVdXL3VuSGUwZk81Q3hVWFA0cnFBY2pKSktaRjZSOGpK?=
 =?utf-8?B?YzB1YitJZ1gwcE9VQU9XZ096TWpCNzErY1NRVHU3elZ0QldDdHoxbEppRVFI?=
 =?utf-8?B?V25JaFZyY1F6RXY3N2JtdUZvWS9ZeERPTkNHLzBlakdBc095RytUNVB3Q2xp?=
 =?utf-8?B?eVZQUUJFZjRJdnFOcGNMSjVLaEx2RytXRll0L1VCZkxMOWRVRWVEUlpxSDF4?=
 =?utf-8?B?Vll6SktzQ2liVThNOGNtWDlsNlJieUpDR2VUWmEvM01vQllqR1dFRnlsWU5n?=
 =?utf-8?B?MFVyTzlVazBjZk05QW5zQ0FEUmhpRm8zZldqejEzaFN3SWdUWTR5clUvQTJQ?=
 =?utf-8?B?Y3F0bmg0NWpWNVFRTVpsaEp0Rjc0OHkzN1RzRzQxc0dYSDdqejB6dGNLcDlS?=
 =?utf-8?B?UXVvb0VPZnJaZWdhdE5VZVJjVFVla1dyREJQamlEN0dUNHZkZlQrZEljS1k3?=
 =?utf-8?B?UDNSZ1ZJWTluOVZoamVya0pKeS9sUlJYT3U5RmliZm13SWlUdmF6ZU9NSjJl?=
 =?utf-8?B?MnFiUEdvNkFJTnhMaHRtUWVVQkJ6WlM1akZUZlFMbitHMUVhU205L2REcERU?=
 =?utf-8?B?V2kxQUV2TUNnWmVPLzJ1MmZmZ2xheUVTT2s2cjJhTkROVUhtcDVtZXJPVWRL?=
 =?utf-8?B?ZE8yRzZFWGtwdGFFNFFScmZBVkRObktWUFZXTUVWbjZCY3RGSVNJc1ZsZHBk?=
 =?utf-8?B?MEgvQ2hmYmVpQ2d3Sk5MMXR2MjIrY3dSOVljYis5WGpKcnp1RzJOS2RVMko2?=
 =?utf-8?B?YW1taDFFS1E4ems0TFFrb3B2NFVIN2tMeUF5ck85OG1FSGtkWjlKR1dhTG1F?=
 =?utf-8?B?QlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <506ABFDE7781134E8A07E494F4CE18F5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46dcb70c-cd95-4568-44fc-08dc21ac864c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 16:00:05.0366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TjGI3CAEB4HEZzcA0JfTiKJUrf8taSbORH5VmRP/0D2TwsrAmT5p96taCV60pqQnd1TgUcNP5iMdFnvaQi8mQ/WzSAJ/9F+V+gfFAso8ZNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6617
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDI0LTAxLTI5IGF0IDIyOjM3ICswMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09
IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IGRybS94ZTogRXhwb3NlIG51bWJlciBv
ZiBkc3MgcGVyIGdyb3VwIGFuZCBoZWxwZXJzDQo+IFVSTMKgwqAgOiBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEyOTI4My8NCj4gU3RhdGUgOiB3YXJuaW5nDQo+IA0K
PiA9PSBTdW1tYXJ5ID09DQo+IA0KPiArIEtFUk5FTD0va2VybmVsDQo+ICsgZ2l0IGNsb25lIGh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vbWFpbnRhaW5lci10b29sc8KgbXQNCj4g
Q2xvbmluZyBpbnRvICdtdCcuLi4NCj4gd2FybmluZzogcmVkaXJlY3RpbmcgdG8NCj4gaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9tYWludGFpbmVyLXRvb2xzLmdpdC8NCj4gKyBn
aXQgLUMgbXQgcmV2LWxpc3QgLW4xIG9yaWdpbi9tYXN0ZXINCj4gMzU1OTFmYjhiNGQ1MzA1YjM3
Y2UzMTQ4M2Y4NWFjMDk1NmVhYTUzNg0KPiArIGNkIC9rZXJuZWwNCj4gKyBnaXQgY29uZmlnIC0t
Z2xvYmFsIC0tYWRkIHNhZmUuZGlyZWN0b3J5IC9rZXJuZWwNCj4gKyBnaXQgbG9nIC1uMQ0KPiBj
b21taXQgOWYyODY4MDBhNWIzZTIzYmU4MDhlODk2MWYyODJhZDg1NTgxOTI5Mw0KPiBBdXRob3I6
IFpoYW5qdW4gRG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCj4gRGF0ZTrCoMKgIE1vbiBK
YW4gMjkgMTQ6MzQ6MDMgMjAyNCAtMDgwMA0KPiANCj4gwqDCoMKgIGRybS94ZTogRXhwb3NlIG51
bWJlciBvZiBkc3MgcGVyIGdyb3VwIGFuZCBoZWxwZXJzDQo+IMKgwqDCoCANCj4gwqDCoMKgIEV4
cG9zZSBoZWxwZXIgZm9yIGRzcyBwZXIgZ3JvdXAsIGZlYXR1cmVzIGxpa2UgR3VDIHJlZ2lzdGVy
DQo+IMKgwqDCoCBjYXB0dXJlIHdpbGwgbmVlZCB0aGlzIGluZm8gdG8gcHJlcGFyZSBidWZmZXIg
cmVxdWlyZWQuDQo+IMKgwqDCoCANCj4gwqDCoMKgIFNpZ25lZC1vZmYtYnk6IFpoYW5qdW4gRG9u
ZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCj4gKyAvbXQvZGltIGNoZWNrcGF0Y2ggZjRjMGRh
Yzg5YmQzY2QwMmExYWZlNWU3YTkxZWQ0YmY4ZGU0YWZjNiBkcm0tDQo+IGludGVsDQo+IDlmMjg2
ODAwYSBkcm0veGU6IEV4cG9zZSBudW1iZXIgb2YgZHNzIHBlciBncm91cCBhbmQgaGVscGVycw0K
PiAtOjk3OiBDSEVDSzpNQUNST19BUkdfUkVVU0U6IE1hY3JvIGFyZ3VtZW50IHJldXNlICdzc18n
IC0gcG9zc2libGUNCj4gc2lkZS1lZmZlY3RzPw0KPiAjOTc6IEZJTEU6IGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF9tY3IuaDo0MDoNCj4gKyNkZWZpbmUgZm9yX2VhY2hfc3Nfc3RlZXJpbmcoc3Nf
LCBndF8sIGdyb3VwXywgaW5zdGFuY2VfKSBcDQo+ICvCoMKgwqDCoMKgwqDCoGZvciAoc3NfID0g
MCwgeGVfZ3RfZ2V0X3NzX3N0ZWVyaW5nKGd0XywgMCwgJmdyb3VwXywNCj4gJmluc3RhbmNlXyk7
IFwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3NfIDwgWEVfTUFYX0RTU19GVVNFX0JJVFM7
IFwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3NfKyssIHhlX2d0X2dldF9zc19zdGVlcmlu
ZyhndF8sIHNzXywgJmdyb3VwXywNCj4gJmluc3RhbmNlXykpIFwNCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGZvcl9lYWNoX2lmKF9IQVNfU1MoZ3RfLCBncm91cF8sIGluc3RhbmNl
XykpDQo+IA0KPiAtOjk3OiBDSEVDSzpNQUNST19BUkdfUkVVU0U6IE1hY3JvIGFyZ3VtZW50IHJl
dXNlICdndF8nIC0gcG9zc2libGUNCj4gc2lkZS1lZmZlY3RzPw0KPiAjOTc6IEZJTEU6IGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuaDo0MDoNCj4gKyNkZWZpbmUgZm9yX2VhY2hfc3Nfc3Rl
ZXJpbmcoc3NfLCBndF8sIGdyb3VwXywgaW5zdGFuY2VfKSBcDQo+ICvCoMKgwqDCoMKgwqDCoGZv
ciAoc3NfID0gMCwgeGVfZ3RfZ2V0X3NzX3N0ZWVyaW5nKGd0XywgMCwgJmdyb3VwXywNCj4gJmlu
c3RhbmNlXyk7IFwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3NfIDwgWEVfTUFYX0RTU19G
VVNFX0JJVFM7IFwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3NfKyssIHhlX2d0X2dldF9z
c19zdGVlcmluZyhndF8sIHNzXywgJmdyb3VwXywNCj4gJmluc3RhbmNlXykpIFwNCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvcl9lYWNoX2lmKF9IQVNfU1MoZ3RfLCBncm91cF8s
IGluc3RhbmNlXykpDQo+IA0KPiAtOjk3OiBDSEVDSzpNQUNST19BUkdfUkVVU0U6IE1hY3JvIGFy
Z3VtZW50IHJldXNlICdncm91cF8nIC0gcG9zc2libGUNCj4gc2lkZS1lZmZlY3RzPw0KPiAjOTc6
IEZJTEU6IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuaDo0MDoNCj4gKyNkZWZpbmUgZm9y
X2VhY2hfc3Nfc3RlZXJpbmcoc3NfLCBndF8sIGdyb3VwXywgaW5zdGFuY2VfKSBcDQo+ICvCoMKg
wqDCoMKgwqDCoGZvciAoc3NfID0gMCwgeGVfZ3RfZ2V0X3NzX3N0ZWVyaW5nKGd0XywgMCwgJmdy
b3VwXywNCj4gJmluc3RhbmNlXyk7IFwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3NfIDwg
WEVfTUFYX0RTU19GVVNFX0JJVFM7IFwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3NfKyss
IHhlX2d0X2dldF9zc19zdGVlcmluZyhndF8sIHNzXywgJmdyb3VwXywNCj4gJmluc3RhbmNlXykp
IFwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvcl9lYWNoX2lmKF9IQVNfU1Mo
Z3RfLCBncm91cF8sIGluc3RhbmNlXykpDQoNCldlcmUgeW91IHBsYW5uaW5nIG9uIGFkZHJlc3Np
bmcgdGhlIGNoZWNrcGF0Y2ggY29uY2VybnMgaGVyZT8NCg0KLVN0dWFydA0KDQo+IA0KPiAtOjk3
OiBDSEVDSzpNQUNST19BUkdfUFJFQ0VERU5DRTogTWFjcm8gYXJndW1lbnQgJ2dyb3VwXycgbWF5
IGJlDQo+IGJldHRlciBhcyAnKGdyb3VwXyknIHRvIGF2b2lkIHByZWNlZGVuY2UgaXNzdWVzDQo+
ICM5NzogRklMRTogZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X21jci5oOjQwOg0KPiArI2RlZmlu
ZSBmb3JfZWFjaF9zc19zdGVlcmluZyhzc18sIGd0XywgZ3JvdXBfLCBpbnN0YW5jZV8pIFwNCj4g
K8KgwqDCoMKgwqDCoMKgZm9yIChzc18gPSAwLCB4ZV9ndF9nZXRfc3Nfc3RlZXJpbmcoZ3RfLCAw
LCAmZ3JvdXBfLA0KPiAmaW5zdGFuY2VfKTsgXA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
c18gPCBYRV9NQVhfRFNTX0ZVU0VfQklUUzsgXA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
c18rKywgeGVfZ3RfZ2V0X3NzX3N0ZWVyaW5nKGd0Xywgc3NfLCAmZ3JvdXBfLA0KPiAmaW5zdGFu
Y2VfKSkgXA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZm9yX2VhY2hfaWYoX0hB
U19TUyhndF8sIGdyb3VwXywgaW5zdGFuY2VfKSkNCj4gDQo+IC06OTc6IENIRUNLOk1BQ1JPX0FS
R19SRVVTRTogTWFjcm8gYXJndW1lbnQgcmV1c2UgJ2luc3RhbmNlXycgLQ0KPiBwb3NzaWJsZSBz
aWRlLWVmZmVjdHM/DQo+ICM5NzogRklMRTogZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X21jci5o
OjQwOg0KPiArI2RlZmluZSBmb3JfZWFjaF9zc19zdGVlcmluZyhzc18sIGd0XywgZ3JvdXBfLCBp
bnN0YW5jZV8pIFwNCj4gK8KgwqDCoMKgwqDCoMKgZm9yIChzc18gPSAwLCB4ZV9ndF9nZXRfc3Nf
c3RlZXJpbmcoZ3RfLCAwLCAmZ3JvdXBfLA0KPiAmaW5zdGFuY2VfKTsgXA0KPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzc18gPCBYRV9NQVhfRFNTX0ZVU0VfQklUUzsgXA0KPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzc18rKywgeGVfZ3RfZ2V0X3NzX3N0ZWVyaW5nKGd0Xywgc3NfLCAmZ3Jv
dXBfLA0KPiAmaW5zdGFuY2VfKSkgXA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Zm9yX2VhY2hfaWYoX0hBU19TUyhndF8sIGdyb3VwXywgaW5zdGFuY2VfKSkNCj4gDQo+IC06OTc6
IENIRUNLOk1BQ1JPX0FSR19QUkVDRURFTkNFOiBNYWNybyBhcmd1bWVudCAnaW5zdGFuY2VfJyBt
YXkgYmUNCj4gYmV0dGVyIGFzICcoaW5zdGFuY2VfKScgdG8gYXZvaWQgcHJlY2VkZW5jZSBpc3N1
ZXMNCj4gIzk3OiBGSUxFOiBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfbWNyLmg6NDA6DQo+ICsj
ZGVmaW5lIGZvcl9lYWNoX3NzX3N0ZWVyaW5nKHNzXywgZ3RfLCBncm91cF8sIGluc3RhbmNlXykg
XA0KPiArwqDCoMKgwqDCoMKgwqBmb3IgKHNzXyA9IDAsIHhlX2d0X2dldF9zc19zdGVlcmluZyhn
dF8sIDAsICZncm91cF8sDQo+ICZpbnN0YW5jZV8pOyBcDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHNzXyA8IFhFX01BWF9EU1NfRlVTRV9CSVRTOyBcDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHNzXysrLCB4ZV9ndF9nZXRfc3Nfc3RlZXJpbmcoZ3RfLCBzc18sICZncm91cF8sDQo+ICZp
bnN0YW5jZV8pKSBcDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmb3JfZWFjaF9p
ZihfSEFTX1NTKGd0XywgZ3JvdXBfLCBpbnN0YW5jZV8pKQ0KPiANCj4gdG90YWw6IDAgZXJyb3Jz
LCAwIHdhcm5pbmdzLCA2IGNoZWNrcywgOTkgbGluZXMgY2hlY2tlZA0KPiANCj4gDQoNCg==
