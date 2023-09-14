Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F25EDE99E
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 09:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C22E10E26B;
	Thu, 14 Sep 2023 09:39:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CF810E26B
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 09:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694684381; x=1726220381;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NBMi+BK6+trqALK/on/MrVaHc2XRpE72R5YytC+BIJI=;
 b=esPHxx72F2cYCwGv9BMymt/W8FDOZiv8l9X3A3fUkO1WBAQRXR2A38qg
 LoGXaL2lu3/ZmKW84kv+/YLUIuPFupGSbfa6SzsGnrIiW1Ohh1WlGhT2f
 7XvsE7/zJTcxUwfxA5xLidlEAMYTROhN2o5WadjsSN06EVNv4LoRp7i/j
 rnWwBFl7jJCe85afi/LH2jKERMkKDZzwbnDrUmX7fyOZFypJ59cO8NydY
 VU4e150vZg+mFH5+67cM6fSsLsrWjW9ABa/JsTwVkGJYQ42HOOGYhtD8P
 M2JKyFxI0j6StrxhPCptn8MHSRS6pRaxzIbSOir72CWcHHb6DveWX6H29 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="376238996"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="376238996"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 02:39:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="814615810"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="814615810"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 02:39:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 02:39:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 02:39:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 02:39:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D31DwN6V/GYb2IiY7S2BQmgo9tBgi49mG+cX9A6iwGRo/Fxc2yy9hp0WoJjh7S4ykq7HK3jiPLVs+lasKzxZoUvWtLBvto9RunhWMSJfV37LAv/b/PoBAaMwmVvDmiHgLyzUd5zoVoeCShYifyDR/X5EqOWCc5jKyWjenwySgXDdVkayYzjQQnPRe01Zt0XfitA/dMZqBSZlVgXWb91XTXpvURXITH0kK3tHRZnTozOpDSdMHUv/IqA7/0XfSJkb910+KhkOmYjaJ8vrqlv+rKrjl1z4V0br45+wUZyrPcB5VVXD9jVZZVZXVYTpIa35UYH1XccOY4tDGhbWwyyTig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBMi+BK6+trqALK/on/MrVaHc2XRpE72R5YytC+BIJI=;
 b=dGQ1WIBk9JsiXwvKqEZ0faUGklr1+Qoib4pdhEu3O1CGNtwFZ+Bn6BhFwpJmGAD3IL9pJ++ZgQ7JPCFr8pfa7lV0bAnJ+bxEHH2ULS5qtvTHMQ9fmkWiDHnt4RmB4DI8Ft7IuHoz9MWeCFB1erM41/jf+OE2N7sCDeCSFf2gGUquQf1uGbLXLq6BhvF6ccmJw2JjVG0TXGb4DPyRzX0oXkvXbL6B9nqdoRWdg+bDcN2vd4hcjrN4d1sZnVWkGXdOumnmgocUAbYnmweVCGL1qv17AjzOQiW4azBjP0qVmYf5JYJbVtwiLijowDgnmXVjki8dUY6Oplm5S3TsGThHbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM6PR11MB4579.namprd11.prod.outlook.com (2603:10b6:5:2ab::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.19; Thu, 14 Sep 2023 09:39:38 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf%5]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 09:39:38 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Thread-Topic: [PATCH 0/2] Remove extra headers added into intel_display_power.h
Thread-Index: AQHZ5W7X6F0rs/i8LkGnykHsE7AbC7AXE4wAgAMAVoA=
Date: Thu, 14 Sep 2023 09:39:38 +0000
Message-ID: <3d81a906a4fe37bc82fd35b64455956ed25d8421.camel@intel.com>
References: <20230912114641.2990078-1-jouni.hogander@intel.com>
 <87a5try5kd.fsf@intel.com>
In-Reply-To: <87a5try5kd.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM6PR11MB4579:EE_
x-ms-office365-filtering-correlation-id: 5a1b6cf1-1bd4-42f0-0478-08dbb506837e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D6k4aYW+oSic9TeZf0rFu3ME0ghcyZKpz4M75xHb2PSeE/fr0b2VgBc4BttnATmNk/zWU6lJ6J0PcdfTKjOUPQ06LJR7YUmTdlW6hW8BC9OFAePF1zp9xm6r+5noB3AIls+d5TuI+fjTljwrdNGxXMRDY6NUi+2j24KHVb9+d5e1GrRI6BEyBPSv6l2QAmDYT/FKNPK8+q/8B4SCWOAb2/YDRsQSAaezVXn1DvikcHn8OIMz9/BQbSpLxhFIv0MDjY2X8mGww0e6b0iLugY3+bG/pQIXcI+YmPMx96odIIq28dnJ7dYKBwsMWT6Mq3S/4IZTDiNXkWH9RVCmnAVS9X+F4r8LzAPoG2tWuDnNNGQ6uweN1ECn+yo8nr5cYvx2QXW9ANmpeCuEZ/dUUbPWfKP4p88iG1BSuWWi4ZR8jOkhJogeve42GsPKmmcsVqJnYIsPjFCM3cYpWQDX1Fl+mWsKTuhuqqabW/5jwko6uLRHwdkLXOMYkhxTE0EHrB7aLv3JtJ0srmisqpCCU3/cVU9bZH9Mzb1MkGVs9OS/+6fDd94xlHEoCSyjQ4FAFbqN5bIFVSoEPc5Kq5hHAddrklTYDXSNtj6/KMcs6Ei+5Xwq+N/T6jz4C//Ovj4JVNj0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(366004)(376002)(346002)(1800799009)(186009)(451199024)(4744005)(316002)(2906002)(66446008)(66556008)(54906003)(64756008)(36756003)(4326008)(6636002)(66476007)(8936002)(8676002)(41300700001)(5660300002)(91956017)(38070700005)(478600001)(6506007)(6486002)(6512007)(86362001)(2616005)(71200400001)(38100700002)(66946007)(66574015)(82960400001)(26005)(110136005)(122000001)(83380400001)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVpDVUtzalVKUkpWOWF4VDY0VDY0dUZYdDJMdFp4NmpXTk5HVXZWK3Y2V3pH?=
 =?utf-8?B?NVQzM2gzUzNxcDZpckxhKzRYZTl5bVpWa1RKbnNnMnZOUkc5Ym5pMSt0WEdL?=
 =?utf-8?B?akFhb0lOWVNqaXQxV2QwdVRvU0poQ01vVytFRkRIY1ZqMmh0Q01hUTVPb255?=
 =?utf-8?B?N2VEQjhQaWxnM2NLcUpkUk51aXgrMlB4ZlNlc0dUbjRlcjd5ZnpvR2MyZng2?=
 =?utf-8?B?ZFNLak94UU5LSGdBOWlJMnU5NHhYSlJtS3VBUTZ1dW01U0x6SjJKSnZDeC9R?=
 =?utf-8?B?RER3YkwzaC9VZkJrMTIwTENQZzdFb01DTjJYcWdqU2wwdzZuRGdjL2l4SjR4?=
 =?utf-8?B?aDBGOGxlUFVZMkxCazNTVTY3dXgybkZFbTE1OTExb2Y1UE4rakwxMFdLbTZ0?=
 =?utf-8?B?N2ZwMTFINUFKbG9PZGtoL2lSRWhPOG0vYlFtNmxseVBTWkdZT1RwVit0aHNu?=
 =?utf-8?B?MGxjM29DZ2hTNjZSYVZKMThLN3oxQTRKaXdzdHhPYXpaczg2dTJmek0yeEJq?=
 =?utf-8?B?M3F0TjhzZkVuTlkwdWFhTmxCWjRyYStsWGsvTVZNUkJSZlMyWkVGTm5qN0dh?=
 =?utf-8?B?TjF3aWFOSWdrNUxuY3pZM3NndU5MQ2pXQUREa1IwMWVGckJ0dTBmekdGOGdQ?=
 =?utf-8?B?Y3ZNMUh3Nm0yVzZJQ09BVldKbG5mdTd3bDhZNVg5cUppUDNnSkJMOWhkRmQ5?=
 =?utf-8?B?VWdJRzBHLzZCR3JtSHhENUJ3WEFLSzdjaFJOZmFxQ3pCbm1PakpkQXovYWI4?=
 =?utf-8?B?eXV3aHdBSnZXT3VrTUErL0NtZGJ4bVcwQWxzRG5EVi9zL1ZtSlVEa0I3ZG1H?=
 =?utf-8?B?U252VmZGVXJ4OEg1aG5CSDBqMlpLakkzbGRiVzhaVEozZENlZ0hsZlVOdElW?=
 =?utf-8?B?d3BkeHdWc05ySmkwS1VpNE03b2o2QSthZUQ5Q042MU00cXg4MEJpT3IyWlBr?=
 =?utf-8?B?VHFjOGFkVWNxT0FFb0w2VzkrODNrM0hBRE1OUC9PcWRySWFRTkJMYnhRV1dW?=
 =?utf-8?B?dERubDFRQVhaV29QZ3hZdk5vVXdXRS9wV0ZmdUlpT1lzcWNKcFdzQ05ma3Ji?=
 =?utf-8?B?SitmS1h3ODNIeDR2MUZoMmdQOEIvWmJKNUJsSVd3dUNDTGhFRXBMNXZNZFdO?=
 =?utf-8?B?NHZEeWZDdDFaVy9sandUV2FoZndXaXR3alpDQUZaTERsV0lsbGJwUVRDenVu?=
 =?utf-8?B?U0ZIRUw3SnhLeE5BaE9GdUVCZkhlZ2NhTDVIUVhRd0Z3dmx6TE9jcDU1V0Rm?=
 =?utf-8?B?MXBjNkJUZEdiMTRFV2d5QzVLdzcyVW00eVduVWJReVY1ZTJVajcvUDlRYks1?=
 =?utf-8?B?ZXBPenVvTzVLMkwweStpbGtpdWEvWTJTSmJLY0dlZkhYbXdqVWNHUGFwZFg3?=
 =?utf-8?B?c0Rjc2o3Mi84U21DWHpva2dGVVdvbzJuS1dzR3RadkI1L1ZVcUU0VnJCS0s3?=
 =?utf-8?B?TlBHbkxhN2lnVUlmVlJuRDB6MUZrWFFLc01TQ1BNanpGeHdXTnlKUzFFdzRJ?=
 =?utf-8?B?VXlHTTdHZWxURE9lOTU5ZG1aL21TWlpZbnBSaDZ6aTVDUjdnOWxCNFh0Y01m?=
 =?utf-8?B?YlRtdlJGOHdHajZUVnhnUzZyangwOUJlQ1lLSTZaTDFhNmlRUFhlVEFRT3ZM?=
 =?utf-8?B?QWsyS2tHZmcyWG91eU95Uk1kNkdzd2FtVXY1cGRycjdITmFORVREVFJhTVZP?=
 =?utf-8?B?cWNiL1M5YmpJVVpxalFUTy9HL1dLYnBMVTU0c0NISlFyemVhYUlJeERscEpO?=
 =?utf-8?B?L056diswTFIrb0IxazJoaFVZQzRjTFVFRjZ2VDU2QUZZeUVLTmlCNlY3c3Vt?=
 =?utf-8?B?b3d0NVFqYzgyRVVuaHhTcFIwRHk3K0ZKSDNyNCs5b01kM2UrOVk4MEh5ZzRq?=
 =?utf-8?B?ZCt5ZWx1UGxNSzBEbE1hUWlMeCtxR1AzTjQxNE80N3BUM2twZWRYcFdxUWFo?=
 =?utf-8?B?NWFBVnBQTnFnaUppZHFOQWhEekFlTDVmcyt0UGlFRzJHdHZoaG1qSGUvVW14?=
 =?utf-8?B?UFBDdFAvck9tMlgxalltNENpMUZyR1VkMVZKRVhXMFIyY0FmNEtYMlpsQjZh?=
 =?utf-8?B?dm0remd2Z0ZJSlBnNUhMNWI2SU1qaWpKUTBrNXgrWlBWaWpaMEduNi9wOWdG?=
 =?utf-8?B?ekFNaFRCSSsvd1ltKzhmaTlMYXFtREdEVkF2eEVhMDZzN2ozZWFlQjVnL3lQ?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AF9241481260D41A6C00F9903CF481C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a1b6cf1-1bd4-42f0-0478-08dbb506837e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 09:39:38.3347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9+p+LExiA4g5HCsQlCYcO1R3hkjB9jIexz4OA4NMdJUtEWU2L3tD9muxYuVueUPLm2Yjgvi16RZAVILjtd4TYB8uL4qBL0dwv9tc0w48r6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4579
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/2] Remove extra headers added into
 intel_display_power.h
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA5LTEyIGF0IDE0OjQ5ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gVHVlLCAxMiBTZXAgMjAyMywgSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRl
bC5jb20+IHdyb3RlOg0KPiA+IFRoZXNlIHBhdGNoZXMgYXJlIG1ha2luZyB0ZW1wb3JhcnkgcGF0
Y2ggdW5uZWNlc3Nhcnk6DQo+ID4gDQo+ID4gRklYTUU6IGRybS9pOTE1OiBhZGQgYSBsb3Qgb2Yg
aW5jbHVkZXMgaW4gaW50ZWxfZGlzcGxheV9wb3dlci5oDQo+ID4gDQo+ID4gYW5kIHJldmVydGlu
ZyBpdC4NCj4gDQo+IElmIGl0IGJ1aWxkcywgaXQncyBwZXJmZWN0Lg0KPiANCj4gQWNrZWQtYnk6
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQoNClRoYW5rIHlvdSBKYW5pLiBU
aGVzZSBhcmUgbm93IG1lcmdlZC4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0KPiAN
Cj4gPiANCj4gPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4NCj4gPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4N
Cj4gPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+IA0KPiA+
IEpvdW5pIEjDtmdhbmRlciAoMik6DQo+ID4gwqAgZml4dXAhIGRybS94ZS9kaXNwbGF5OiBJbXBs
ZW1lbnQgZGlzcGxheSBzdXBwb3J0DQo+ID4gwqAgUmV2ZXJ0ICJGSVhNRTogZHJtL2k5MTU6IGFk
ZCBhIGxvdCBvZiBpbmNsdWRlcyBpbg0KPiA+IMKgwqDCoCBpbnRlbF9kaXNwbGF5X3Bvd2VyLmgi
DQo+ID4gDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlf
cG93ZXIuaCB8IDUgLS0tLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9jb21wYXQtaTkxNS1o
ZWFkZXJzL2k5MTVfZHJ2LmjCoCB8IDEgKw0KPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQoNCg==
