Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A032CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 11:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B63410E1BC;
	Mon, 16 Oct 2023 11:22:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3B610E1BC
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 11:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697455346; x=1728991346;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=aZqSDFdCRLJcdU7pvjgfo1959nCzv7xuLTMsmPcc3ZY=;
 b=e00fnzCe/vZThrPrHdEOMw3NzomuLxgqDxpijrnHqng+703HKf9r+zjQ
 ceiU36UtqiPm5jajwgY/8A6dBwUNmXNIJVYwTxIK7ALXLd8fAl4B3eHvJ
 4s6mdgaNiNtqgkVf+br5xEioyDOqdq4dYFHXlEvjthGiJ11hOWbmsI1sl
 j5OKLtxmc8uv2e5qUcNRRsSFv5yn/YvJpbjWwXEc0Ct4md1wsI4zGIFxm
 hECXOTRBBfkpyBmG/MILSa+YHv941UuE3EJ3LqEXpBUri9tdF3+TPoCMX
 5X7nRDbjL69advvD2XT+hSHigQs3nE90R6voIFSRqjt4s22S8oWAvxxBz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="365759096"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="365759096"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 04:22:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="759358642"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="759358642"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 04:22:25 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 04:22:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 04:22:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 04:22:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNrwZ7iY/046OVEb7HBIzh4fAXgQfLfhR96BjStGjFXoNxrtI9RElI+uR0/4eXdn63LQzexs6VGvZIWQqaynPD8RQT3LArs/zgaKxu9db10BbWWfH2R5LI1iFDuxLuCLGqFo41B84BhFa33eFFNNazvJ7q0FAHez2ut2t2aj0XiZv06w2sAJoqUkC329HiFAahp2qpuKBrjdsq5c5GrLlYc3e+79XRljs1jgOUvmdFTZkRaCSiNuw35FzAoD6Y/WUPVIbrL/tN1aXfUzyuPuQTCsQ5lFSbLuNA2TiqduiIrLqAnyZTXrbjn5j6OjTjivmnvO0l/XOhSKfX+t2EFPOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZqSDFdCRLJcdU7pvjgfo1959nCzv7xuLTMsmPcc3ZY=;
 b=mSJC9igvluBZAZfGrA0pkJVTccOC7o2pAi4kEn6tZuq3FpGtYlkO2QheRpHSwsKQNJmdiVCi/SeO3jcIWJjbI80H0AJab3CFF041HdXmLupcefhaMz0vOT8JqL2GhDGR4P1y9TfUCORWDeegikFO2oqdYwpCdT4ZZkgcE341rmmEzjD5/lP3/me0Q9E5bIVmlabcpwjf28Ma4js3BPrhism/Jv60inALFIW8DoeJ1urSbJ5CQXhkvif5hB8rqNNWtUiBnoJjxFUGOzqBexuD8u/Gb0nHDJhnZBiTp1JeRBvOskdfHycQgRVJWM8qkWnDxcDspHmsxe1ooNGzbOjDdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 LV8PR11MB8559.namprd11.prod.outlook.com (2603:10b6:408:1e6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 11:22:17 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::483:8093:febb:f038]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::483:8093:febb:f038%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 11:22:17 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Thread-Topic: [Intel-xe] [RFC PATCH 0/3] Xe dma fence handling on atomic commit
Thread-Index: AQHZ8RSx7xsxwvkxfEavit+3eP74xbAuehSAgAADNoCAAB6cAIABTBuAgACCggCAAAMFAIAb9laA
Date: Mon, 16 Oct 2023 11:22:17 +0000
Message-ID: <a69aa0a02a7aa730f0e94bc764a69703b6eb43ab.camel@intel.com>
References: <20230927073125.3825836-1-jouni.hogander@intel.com>
 <ee8b5153-1cbd-4ab3-2b1a-626b13fbd761@linux.intel.com>
 <2fd37d47aacb192f9d4b4e8491743323536f364c.camel@intel.com>
 <85245068-4cce-8851-e527-29792385f78b@linux.intel.com>
 <fb8f3086713e91e4280421c507b082949a3640f8.camel@intel.com>
 <ZRWlht3cvt4WYCsu@intel.com> <ZRWoDhvisTOYi-nK@intel.com>
In-Reply-To: <ZRWoDhvisTOYi-nK@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|LV8PR11MB8559:EE_
x-ms-office365-filtering-correlation-id: 74918310-276b-44b4-c34c-08dbce3a27bd
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S2qrgJulmjXeaGzPjHA/Yff1vD7j7iPzxDdT1w1Q5GxXD7VJhacPRI6vquwPlFQt7pJMBo40dqIH3MrW8lOA6fjT+Di4V+UkLkUPRHa9exksWFuTUuFrjOfmJnbgru4i6Ic3A93doTpd0PgnooSPGCMYdlzYBUMLwpXkQO4b7z4I9OD+XPBSV5biW3cLWYA7y4l3S35VI2LChshe3f1RswnXHFCPrpKaHx4QpsFQjfqRUw9CE8az+xWA28OJvKhNBUnHtYiYqRJqB36doVw44ZzheBAqk+nl+k47LTSAYQvAsihWrmmRcivt4fuj7MDArjk5gChd9nXwXUXf6MEdNWvoM146sYIf0qxx6GozB0t+LJVL9g3N3I1Bczanr/vs8vyj/Tj8qFj8kscieCf2iafMdLVP0RYIKDng7g9nbs1KP4djxQaguBwJVJcj/3yfc8abDTdIXoQvXyD2j9DBd9ZTvQXWwPLaO1iucS8L6oZ5m3XASRKsWYkic0xiDAAtQ8++Fwb83dQ+/NW2iOFp7GotEALAYv8Wlm/QxSOVzQMjjNA3zp4PRj5tfDdtZdpNREpeFrWhyVtemqkMjjWc7pObNdmZcaEQvLilUK2IvQegtETl/jP3mc1KBA7YxIfSmqQlc+ktKq12R6vjyej7Gw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(39860400002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(2906002)(71200400001)(5660300002)(41300700001)(8936002)(4326008)(8676002)(6916009)(316002)(66946007)(91956017)(76116006)(478600001)(6486002)(966005)(6506007)(36756003)(83380400001)(53546011)(64756008)(66446008)(66556008)(54906003)(66476007)(38070700005)(66574015)(26005)(86362001)(82960400001)(38100700002)(2616005)(6512007)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bm5aVDhHZFk2dkYzY2orQUVNYUl0cDhRSXJWTFpKTWhFcm1SZXVCbDY2QUdj?=
 =?utf-8?B?Z0FPU0tTYmRXM1hOb29SZUpiNDN4V3RYVFZ6MUUwNmYrZTFZM3lac0drVjV0?=
 =?utf-8?B?MjlWNCt2dllsZHNWMXQ4RDZHak4zaVhoQ0N2Tll5eVJwT3ZMcENqU0tjLzJ1?=
 =?utf-8?B?MWhZaWlOWnRhcEVvL1c4OUVWK3ZYcmlPUTV4ckZVd0Yxam92Rk9ydklwc2h6?=
 =?utf-8?B?Q2swOUltaC9LM3pTZ2ZoZUEwTGhrc0RKT054bUM4R2c0dUIyRUlXTkQ4UExB?=
 =?utf-8?B?Qnl6VGNCVUtGVXpYUXR6VmlRTkRPZXMydWh4RTN0dk5aNjJjQ05HQVRtcTdI?=
 =?utf-8?B?RUZMcVY2WnFUUjJ5WFFHZXloVzJ6b2RqdzlGTFlXNm42Mk9sOUl0N1phNHhW?=
 =?utf-8?B?UGwyY2xvcS8xWlRiZzFvU2ZYNXVKU0w5bHpLeXcyN2padjFuOE9JaklIKzZL?=
 =?utf-8?B?bzdhU1JTRmFjdHJwaXlJMC8zbGY2S0dJUTNpUzhSLzZwVERRaDdYVWRieHho?=
 =?utf-8?B?RnovTVlEQk1kK0N3RU12UnRRQWZ4bHV6ZXdLQlhCdkt0WFZiNEU0TjE2Znpl?=
 =?utf-8?B?RkQvZXpPVFFVNzZhTmplQmRPemY3VzN3Qkd4K3VCSUwzeDJDK2tuS2MxL3Rl?=
 =?utf-8?B?OEdTRTRtRTQ2QjlKR05MK1pqanNwd296WjdMaFR3SENuWEMvZzRaelNEYkxr?=
 =?utf-8?B?OEwwYkV3WHNEQWVKYVlCRitqY3JIMS9XNDNoUXJYTVgwM0tHT01pMjRKekhu?=
 =?utf-8?B?Uk4xeVlqZjNRWnAxOEpaQ3dyUzR3Y1NzMENYV0FrbGRFVExoN3hOOHZKK0NT?=
 =?utf-8?B?eHVsS1NoUmVYNEU5bnBuT09GT2VrSHhYWk9yMDVPT3VEQ1NtQXZyYThJbjh3?=
 =?utf-8?B?cUp3eVpNMDVRRFBPRnN0ZVltTTUyS1RUQXVYWS94clBXSzJPS25zSFpqNTNr?=
 =?utf-8?B?cTRnYXBLWXFZRityU2dCZ0lWbmNzQzdGVnY0VG1OTjBieUpkSUxCREREb2lU?=
 =?utf-8?B?WUVOQTZBanYyazllbTROMGxxUUFIUDVGZFhnV0VnbElCemVyTDFyTmQyTEov?=
 =?utf-8?B?b3I4ZGhGNU04bDd2RmxYNXV1TVNQR0kxNWE3MjNZc0VTM0dnWUFYcS9GcGo3?=
 =?utf-8?B?VmpqSFlleTNVYXFFejJ1UlVqb1RGNE9SK09VQnJtRzk2SGV4VGU5UTMxbHk5?=
 =?utf-8?B?djdOMTU5UnNyb0M5WDBSTkljZGp4dlJGSzhNOW8wS2VXS2hrWHRSTnpPanJQ?=
 =?utf-8?B?RlpqRXVmemlhNXBwT1hTbW9NWFpsRk54VERCb0pHOGV4YjZtNG4wUy9OdUpN?=
 =?utf-8?B?UTNVTVNWTC9QQ3pHRHhQT2tkL3cybDlKMHdKUmx0VGE5S2x5R1hrYThKcXpK?=
 =?utf-8?B?ZytQV25XdWowMGpzaXJFL3F4Z2d2bVo5bzNKbkZWOUVPeVR5ejhxanNVdkVj?=
 =?utf-8?B?Rm14SW1jTzBNODE1MGNuRjcxWjRWRU0zVFpraXkzdzkxd2tCd3ZIM003RXl6?=
 =?utf-8?B?b3NnWEp1YlhZZG1yM3gySU52eWZ2bUJmM08rZmtsQkEvTnZBMFNHRHFXeUdO?=
 =?utf-8?B?UGQySE5ET1BVNHBXbHZPSGlHYmZ6Um1PNk95TjlucFdxNXVVL1NsbmxGWGdm?=
 =?utf-8?B?cXVRVHlsL0hqNUErdXNwVGV6NzJUa3dkLy9taURlN3BDeWhvelBYYitzbEM5?=
 =?utf-8?B?R0RVNU9qWnFKMEh2MnNwb2dPU2pmN0FnUW1LNmUwT0ZQYzVZeTR0aDFrMjVk?=
 =?utf-8?B?UndTcGtiNkk0aHlPeERlekF5TWtoeC9KdWg5aHFCNDdBejBseXpFRVVWZ1hy?=
 =?utf-8?B?aWdRWnJlQ0poM3dwaGxWUjVFNWNRWUdLSjFKQ3psWWJJWHE4cDlUWW1iNE9W?=
 =?utf-8?B?elRteGFhYzVldDQwbFBOUlFhVWFvRVpYSWpuNGsvYnlxa3M0dWxueUJRL3Ji?=
 =?utf-8?B?ME9BdExrV2V0NWJkSDd3VFl0NlhBaGQ3REllZE5wNHhaT3J3SThaY1pkMm96?=
 =?utf-8?B?NzdaczY5d2ZEUUREQXVzREdqcXk2VlVZcS9vZ2w4ay9YckRZS1ovMHZLZVkr?=
 =?utf-8?B?NStpcXVtTkpzeE45M09JQURrM3k0dnBhUFlxWUtuS0FBclNGYTlVRFJzRkVC?=
 =?utf-8?B?NGxGMGQwWE14ZXRBTXhDYm9qSkkyMTRyQVhLY2JKSnA3a3c0eFdsRUVhaUVI?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D75166A1B66615459BAF82CCE65390CF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74918310-276b-44b4-c34c-08dbce3a27bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 11:22:17.3189 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ufr7s2VuWWxo6hiew828rJYMeL12ZJp13TN7l0fKMvLF02tEnATKeLPNR4NVBfV0BuIaRcgllqgiEBMBmFQJNVP5DzMDd2JOLKe/Xi93qa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8559
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 0/3] Xe dma fence handling on atomic
 commit
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA5LTI4IGF0IDE5OjIxICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFRodSwgU2VwIDI4LCAyMDIzIGF0IDA3OjEwOjQ2UE0gKzAzMDAsIFZpbGxlIFN5cmrD
pGzDpCB3cm90ZToNCj4gPiBPbiBUaHUsIFNlcCAyOCwgMjAyMyBhdCAwODoyMzo0MUFNICswMDAw
LCBIb2dhbmRlciwgSm91bmkgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIDIwMjMtMDktMjcgYXQgMTQ6
MzUgKzAyMDAsIE1hYXJ0ZW4gTGFua2hvcnN0IHdyb3RlOg0KPiA+ID4gPiBIZXksDQo+ID4gPiA+
IA0KPiA+ID4gPiBPbiAyMDIzLTA5LTI3IDEyOjQ1LCBIb2dhbmRlciwgSm91bmkgd3JvdGU6DQo+
ID4gPiA+ID4gT24gV2VkLCAyMDIzLTA5LTI3IGF0IDEyOjMzICswMjAwLCBNYWFydGVuIExhbmto
b3JzdCB3cm90ZToNCj4gPiA+ID4gPiA+IEhleSwNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
V2hlbiB3ZSB3cm90ZSB0aGUgb3JpZ2luYWwgZGlzcGxheSBzdXBwb3J0LCB3ZSBwdXJwb3NlbHkN
Cj4gPiA+ID4gPiA+IGRlY2lkZWQNCj4gPiA+ID4gPiA+IG9uDQo+ID4gPiA+ID4gPiBub3QNCj4g
PiA+ID4gPiA+IGFkZGluZyBpOTE1X3N3X2ZlbmNlIHN1cHBvcnQuDQo+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+IEluIHRoaXMgY2FzZSwgSSB0aGluayBhIGJldHRlciBhcHByb2FjaCB3b3VsZCBi
ZSB0byByZW1vdmUNCj4gPiA+ID4gPiA+IHRoaXMNCj4gPiA+ID4gPiA+IGNvZGUNCj4gPiA+ID4g
PiA+IGZyb20gaTkxNSBhcyB3ZWxsLCBhbmQgZW5kIHVwIHdpdGggY2xlYW5lciBkaXNwbGF5IGNv
ZGUgZm9yDQo+ID4gPiA+ID4gPiBib3RoDQo+ID4gPiA+ID4gPiBkcml2ZXJzLg0KPiA+ID4gPiA+
IA0KPiA+ID4gPiA+IFllcywgSSBhZ3JlZSBldmVudHVhbGx5IHRoaXMgd291bGQgYmUgdGhlIGdv
YWwuIEkgZGlkIHNvbWUNCj4gPiA+ID4gPiBleHBlcmltZW50cw0KPiA+ID4gPiA+IGhlcmU6DQo+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Bh
dGNoLzU1ODk4Mi8/c2VyaWVzPTEyMzg5OCZyZXY9NA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFdo
aWNoIGlzIHJlcGxhY2luZyBpOTE1X3N3X2ZlbmNlIHdpdGggc2FtZSBjb2RlIEknbSB1c2luZyBm
b3INCj4gPiA+ID4gPiBYZQ0KPiA+ID4gPiA+IGRyaXZlcg0KPiA+ID4gPiA+IGluIHRoaXMgcGF0
Y2ggc2V0LiBUaGUgcHJvYmxlbSBpcyBHUFUgcmVzZXQgZGV0ZWN0aW9uLiBJDQo+ID4gPiA+ID4g
ZG9uJ3QgaGF2ZQ0KPiA+ID4gPiA+IGN1cnJlbnRseSBnb29kIGlkZWFzIGhvdyB0byB0YWNrbGUg
dGhhdCB3aXRob3V0IGNvbXByb21pemluZw0KPiA+ID4gPiA+IGk5MTUNCj4gPiA+ID4gPiBmdW5j
dGlvbmFsaXR5IGluIHRoaXMgc2NlbmFyaW8gLT4gZW5kZWQgdXAgZG9pbmcgdGhpcyBvbmx5DQo+
ID4gPiA+ID4gZm9yIFhlDQo+ID4gPiA+ID4gdG8NCj4gPiA+ID4gPiBlbnN1cmUgdGhpcyBpcyBu
b3QgYmxvY2tpbmcgdXBzdHJlYW1pbmcgWGUuIFdvdWxkIHRoaXMgYmUNCj4gPiA+ID4gPiBhY2Nl
cHRhYmxlIGFzDQo+ID4gPiA+ID4gdGVtcG9yYXJ5IHNvbHV0aW9uIHRvIGJlIHNvbHZlZCBhZnRl
ciB1cHN0cmVhbWluZz8gQW55d2F5cw0KPiA+ID4gPiA+IHdoYXQgSSdtDQo+ID4gPiA+ID4gZG9p
bmcgaW4gdGhlc2UgcGF0Y2hlcyBpcyBub3QgcmVhbGx5IGFuIGk5MTVfc3dfZmVuY2UNCj4gPiA+
ID4gPiByZXZpc2VkLCBidXQNCj4gPiA+ID4gPiB1c2luZyBkbWFfZmVuY2VzLg0KPiA+ID4gPiBJ
biBhdG9taWMsIHBsYW5lX3N0YXRlLT5mZW5jZSBpcyBzZXQgZm9yIGFsbCBmZW5jZXMsIGFuZCB0
aGF0DQo+ID4gPiA+IHNob3VsZA0KPiA+ID4gPiBiZSANCj4gPiA+ID4gZW5vdWdoLiBJIHRoaW5r
IGNyZWF0aW5nIGEgcmVzZXJ2YXRpb24gb2JqZWN0IGlzIGEgbWFzc2l2ZQ0KPiA+ID4gPiBvdmVy
a2lsbCwNCj4gPiA+ID4gYW5kIHdlIHNob3VsZCB0cnkgdG8gdXNlIHRoZSBkcm1fYXRvbWljX2hl
bHBlcl93YWl0X2Zvcl9mZW5jZXMNCj4gPiA+ID4gaWYgYXQNCj4gPiA+ID4gYWxsIA0KPiA+ID4g
PiBwb3NzaWJsZS4NCj4gPiA+IA0KPiA+ID4gQ2hlY2tlZCB0aGlzIHBsYW5lX3N0YXRlLT5mZW5j
ZS4gVG8gbWUgaXQgbG9va3MgbGlrZSBpdCdzIGZvcg0KPiA+ID4gdXNlcnNwYWNlDQo+ID4gPiB0
byBzZXQ/IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyB0aGUgY2FzZSBmb3IgaTkxNS4gRm9yIFhlLCBJ
IGRvbid0DQo+ID4gPiBrbm93DQo+ID4gPiBpcyBpdCBkb25lPw0KPiA+ID4gDQo+ID4gPiBBbHNv
IGk5MTUgaXMgd2FpdGluZyBmb3IgZmVuY2VzIG9uIG9sZCBmcmFtZSBidWZmZXIgb2JqZWN0cyBh
bmQNCj4gPiA+IG5ldyBmYg0KPiA+ID4gb2JqZWN0cy4gU2hvdWxkbid0IHdlIGRvIHRoZSBzYW1l
IGZvciBYZSBhcyB3ZWxsPw0KPiA+IA0KPiA+IHhlIHNob3VsZG4ndCBuZWVkIHRoZSBvbGQgZmIg
ZmVuY2Ugc2luY2UgdXNlcnNwYWNlIHRoZXJlIHdvbid0IGJlDQo+ID4gZG9pbmcgYW55IE1JX1ND
QU5MSU5FX1dBSVQgc3R1ZmYuDQo+ID4gDQo+ID4gPiBBbnl3YXlzIHRoZXJlIGlzDQo+ID4gPiBj
dXJyZW50bHkgbm8gbWVjaGFuaXNtIGluIGRtYV9mZW5jZSBpbXBsZW1lbnRhdGlvbiB0byBoYXZl
IGNvbW1vbg0KPiA+ID4gZmVuY2UNCj4gPiA+IGZvciB0d28gc2VwYXJhdGUgZG1hX3Jlc3Ygb2Jq
ZWN0cyAoZG1hX3Jlc3ZfZ2V0X3NpbmdsZXRvbikgLT4gSQ0KPiA+ID4gZGlkDQo+ID4gPiB0aGlz
IGJ5IGNyZWF0aW5nIGEgbmV3IGRtYV9yZXN2IGZvciB0aGlzIHB1cnBvc2UuIElmIHRoZXJlIGlz
IG5vDQo+ID4gPiByZWFzb24NCj4gPiA+IHRvIHdhaXQgZm9yIHBvc3NpYmxlIGZlbmNlcyBvbiBv
bGQgZmIgb2JqZWN0LCBtYXliZSB3ZSBjb3VsZCBqdXN0DQo+ID4gPiBkbw0KPiA+ID4gZG1hX3Jl
c3ZfZ2V0X3NpbmdsZXRvbiBpbiBwcmVwYXJlIHBsYW5lcyBmb3IgWGUgYW5kIHdhaXQgZm9yIHRo
YXQNCj4gPiA+IGFuZA0KPiA+ID4gdWFwaS5mZW5jZSBpbiBjb21taXQ/DQo+ID4gDQo+ID4gZHJt
X2dlbV9wbGFuZV9oZWxwZXJfcHJlcGFyZV9mYigpIHN1cHBvc2VkbHkgZG9lcyBzb21ldGhpbmcg
dGhhdA0KPiA+IGFscmVhZHkNCj4gPiB3b3JrcyBmb3IgeGUuIExvb2tzIGxpa2UgaXQgZG9lcyBh
IGZldyB0aGluZ3M6DQo+ID4gLSBwb3B1bGF0ZXMgcGxhbmVfc3RhdGUtPmZlbmNlIHdpdGggZG1h
X3Jlc3ZfZ2V0X3NpbmdsZXRvbigpIGlmDQo+ID4gdXNpbmcNCj4gPiDCoCBpbXBsaWNpdCBmZW5j
aW5nDQo+ID4gLSB1c2VzIGRtYV9mZW5jZV9jaGFpbiBpbnRlcm5hbGx5IHRvIGFkZCBhZGRpdGlv
bmFsIChrZXJuZWwNCj4gPiBpbnRlcm5hbCANCj4gPiDCoCBmb3IgbWVtb3J5IG1vdmVtZW50L2V0
Yy4gbWF5YmU/KSBmZW5jZXMgdG8gdGhlIHVhcGkgc3VwcGxpZWQNCj4gPiBleHBsaWNpdCBmZW5j
ZQ0KPiA+IA0KPiA+IFByZXN1bWFibHkgd2Ugc2hvdWxkIGJlIGFibGUgdG8gZ2x1ZSBvbiB0aGUg
b2xkIGZiIGZlbmNlIHVzaW5nDQo+ID4gZG1hX2ZlbmNlX2NoYWluDQo+ID4gYXMgd2VsbD8NCg0K
SSBzZW50IGEgdmVyc2lvbiB0byBpbnRlbC1nZnggbWFpbGluZyBsaXN0IHdoaWNoIGlzIHV0aWxp
emluZw0KZHJtX2dlbV9wbGFuZV9oZWxwZXJfcHJlcGFyZV9mYiBmb3IgYm90aCBvbGQgYW5kIG5l
dyBmYi4gUGxlYXNlIGNoZWNrOg0KDQpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
c2VyaWVzLzEyNTE2MC8NCg0KPiANCj4gT2ggYW5kIHRoZSBkaXNwbGF5IHZzLiBHUFUgcmVzZXQg
Y2hpY2tlbi9lZ2cgcHJvYmxlbSBtaWdodCBiZQ0KPiB0aGUgaGFyZCBudXQgdG8gY3JhY2suIFdl
IG5lZWQgdG8gZ2V0IHRoZSBwZW5kaW5nIGRpc3BsYXkgY29tbWl0cw0KPiBmbHVzaGVkIG91dCBi
ZWZvcmUgd2UgY2FuIGxldCBhIEdQVSByZXNldCBjbG9iYmVyIHRoZSBkaXNwbGF5LCBidXQNCj4g
dGhlIGRpc3BsYXkgY29tbWl0cyBhcmUgd2FpdGluZyBvbiB0aGUgZmVuY2VzIGFuZCB0aHVzIG5l
aXRoZXIgdGhlDQo+IGRpc3BsYXkgY29tbWl0cyBub3IgdGhlIEdQVSByZXNldCBjYW4gcHJvY2Vl
ZCwgSSB0aGluay4gSGF2aW5nIHRvDQo+IHdhaXQgZm9yIHNvbWUga2luZCBvZiBodWdlIGZlbmNl
IHRpbWVvdXQgaW4gdGhlIGRpc3BsYXkgY29tbWl0IHNlZW1zDQo+IGEgYml0IHN1Yi1vcHRpbWFs
LiBPciB3b3VsZCB0aGUgZmVuY2VzIGdldCBzaWduYWxsZWQgd2hlbiB3ZSBkZXRlY3QNCj4gdGhl
IEdQVSBoYW5nPyBJZiBub3QsIGNhbiB3ZSBhY2hpZXZlIHNvbWV0aGluZyBsaWtlIHRoYXQ/DQoN
CkkgdGVzdGVkIHRoaXMgYW5kIGl0IHNlZW1zIHRvIGJlIHRoYXQgZmVuY2VzIGFyZSBhY3R1YWxs
eSBzaWduYWxlZCB3aGVuDQpHUFUgaGFuZyBpcyBkZXRlY3RlZCAtPiBubyBuZWVkIHRvIGRldGVj
dCB0aGlzIHNlcGFyYXRlbHkgd2hpbGUgd2FpdGluZw0KZm9yIGZlbmNlcy4NCg0KQlIsDQoNCkpv
dW5pIEjDtmdhbmRlcg0KDQo+IA0KDQo=
