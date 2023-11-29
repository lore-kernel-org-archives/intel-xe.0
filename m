Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72A4C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 14:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B1D10E576;
	Wed, 29 Nov 2023 14:38:50 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 14:38:48 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A0410E1F6
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 14:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701268728; x=1732804728;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=I8HONrvJWLQy5pmRtWzRDs4FFNmUF0yP5+G7KJnsr88=;
 b=Td0WjnQl9eBGagLhrWeTPuElnDI3BLxdK8SosF8sqa+MD0+iNBkeg+D2
 j60z9DifMtgcv6Pjoi8Btvkuvws8q9d1oXXcmW+I8aI0GGNSXLnADfI/Q
 dzmdOi4IzYXSwoj8GOotutc4aIpUv8YHeb1n8pDL0Y7M416uthKBxQZiB
 JTvixguXOgFs7KiRv0Vx8ZOBavt2DJL/8Emt/FYc3apXS/NRmXY9/BVTu
 Qsc1Q+creukZdKl+FanVNV1k55ZTA0g+PLxPJxJKAeDqOstiz+SFzHe3C
 z28N4oR4VpT3bGSYyjFfXbNlsiVNa+otEvmkYtqYBl8jNgJomSOwR1NTw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="40304"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="40304"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 06:31:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="886879065"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="886879065"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 06:31:37 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 06:31:37 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 06:31:37 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 06:31:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAVbmbhoZvH085li8zXBAlLx21wMtpi+dtXSAK7mtxCU+D3oNyZnUhs2wl3miv3BVIZTquQx4vHQxL91+HfCW3YhRJ6XnacLSn5V2+Z4kHxjV64gsosPoBmDVlu2WwIUGrinyE6snK04G5O1s2IumVJeq2GT6kq4TQGm5WTTeF23zpkON24RSbETlU9dJv34yUUtPiMrvLLcLeKDjnPim4UqumatGRoifQg7ClThMh6E26HQlC+GyES4WPmsJWCHAL8RWkPY4UGQhjK/jlLRgF1gob1FVLdBfhLu9fpUGyUuJ9ZX7NmSt0iT1RvG3nC9giXLIKVypbEavOmfpNeMKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8HONrvJWLQy5pmRtWzRDs4FFNmUF0yP5+G7KJnsr88=;
 b=OU26QpDI9VTYfPAitv2qltHS+Ia4wEE+5VGvDzS6u0kgK/AZOBLSP3NWyJ8PlFBA9W+EtL0La9Bfsj6OvFBwMevIWmzurb6RKlaTAOoDsdltYEBIMeMnCkUlj2GosAL0wgtnaLlrCmnyxJjc8TMOtgnan6q2iAT5GCFuVj/F023mgSM/uVg/7hyw93b2+EwgfISAoWnj9nkxa6cFfjNoK+YKLi4nqzPG/M/d+MmfqR9CriO9iTUYlIdTKgoJt38zMpgxoR2KqB/OW/tBRUSF9bdHitHAwVzBQv5Q3lqfYfRyEk0Mt0V27mauYaZZj2dUoPZlgJYUHcrkgNwsDLBALA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DM4PR11MB8180.namprd11.prod.outlook.com (2603:10b6:8:18d::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 29 Nov 2023 14:31:30 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::a3f4:5901:da8b:c719]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::a3f4:5901:da8b:c719%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 14:31:30 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v1 0/6] DSB refactoring
Thread-Index: AQHaIszkpd4GtXBnLEekm+F/MaIXbrCRWX0AgAACIjA=
Date: Wed, 29 Nov 2023 14:31:29 +0000
Message-ID: <DS7PR11MB599022F639094498D63C313FF983A@DS7PR11MB5990.namprd11.prod.outlook.com>
References: <20231129135054.564076-1-animesh.manna@intel.com>
 <87r0k863lr.fsf@intel.com>
In-Reply-To: <87r0k863lr.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB5990:EE_|DM4PR11MB8180:EE_
x-ms-office365-filtering-correlation-id: 8086dd1d-49d9-430b-0752-08dbf0e7e0a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xs5wLuvaMKzUWlDhjzSm4GvjvjNzubwL0xGfJHgWgylc8idAYdG3T6hJEaT4ZtWMxtyb61BkUT54Ydczm8IaovGAJL1Xg1sX7MecGxJ5KWtzhikUd73oKQOxthqaRZyqDFpCGqpwPRO1Ez1zqL9gFoxXKUmQ6mTnKDpzEprh21FZL9rT1kfO1395lc9TuPkl6hTuL+wgKTQjN0jylQYsgl5YDXz7pQH2DEwZ3fS1gsDBtMmd/NLAOtyvcvqbkGlzPDT16aNaQzLY+C1VjU850LgJkrR4D5045Q41dmCkiIqwLDmpzcpYbCiuNjJquoPL9YxiW+nsgXpSFRl8QZquEpfgErOgE9u9RFDfCtoTkjc6lF3ImgsPE+pUWIJt1BpqAUS/fDZxo7Whbh9uS5KWWWvXn451jbd7PXBzJByq2T6IFcczCwDZvSXJgyA8DsqozW8CDdrXWC+LKxNwJrwcIM9xmlawKCCY2/O+tiXV3GGbmU1zcHN3fO/AT1W5vrYuP48+/GUu93Vy5zzNm6psbHI6z48iZpNV725OsO6uFXdsyxUDJM3nDyv+jGBquDWUUbuHnnFaufJ/Z4jaTF9Kq7dz9zp/0WDWZFvaqUDAlNGLZ+hr9VhynvbCjuJojLIt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(136003)(396003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(52536014)(8676002)(8936002)(9686003)(6506007)(7696005)(53546011)(71200400001)(110136005)(64756008)(76116006)(66946007)(66556008)(316002)(478600001)(122000001)(55016003)(41300700001)(38100700002)(38070700009)(33656002)(86362001)(26005)(66574015)(2906002)(66476007)(5660300002)(83380400001)(82960400001)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTF2ZjRVWU8zOGkyUm5XOFAwZVhseHdzellGeUlEWG1IQVQ3T0loSFU5Tm1N?=
 =?utf-8?B?YjUzMGRyNGsvQmVTMWlVT3Y2Wlpucy9pb1l2eEVlWmFmYkZhelF3aDRhK0Mr?=
 =?utf-8?B?WVRsbmtBNHR3V1F3LzFNei9SaEIzaEhnajdQNzJEMGR1RjR3TldSTDVEcHE2?=
 =?utf-8?B?UjdTZVZ0WGJGZFc0eVEyMmE4OGdheWF0a3BqL1NjaGVjK1JpWldOdzJibzB1?=
 =?utf-8?B?T0pPczhJOGUxSmQ4b21GbmhQVHhuSU5sZEsyZXhwWWFMajJiVTh6YU9NS1lQ?=
 =?utf-8?B?NU9OQTZ1VitEQmIvMWRmdVJDSys4cEJXZnBZTzk1VDE0bjA4aUpMSWNXYVVl?=
 =?utf-8?B?MVREQ01rZkxqclhCUEh4OVlZdVlaWEZ1WU1UOEdGd0IvUjJ1R3gyZUx2c0ZC?=
 =?utf-8?B?RWN3cTVNZXhPTFpxZkxGVXdkNFJWdWVldldCZ2FhV3FOZ0lHTEZPSXI1R3pQ?=
 =?utf-8?B?bXVLS1o4QjdFQTk3azRuaC96VTlSQXFnNVFld3E1aUp3NWdXK2ZDT1lScGk4?=
 =?utf-8?B?QlZLNTJ5ZUswOUY4K0s1eDJnR1FkWFZZaWk0Nyt1d1Y0YTNKTjh1bU0xbnhu?=
 =?utf-8?B?elEwZUg1aDdSbHpuY3RiOEIrb1E3bEJXaVR3VWpvdXRqUS9XNEtaSmZobEo0?=
 =?utf-8?B?a2d2dm5xekZldDdIK0lzQ0VYRUN1SzlxK25KTWZzRXVZZDFmTlA4L2NuYWw4?=
 =?utf-8?B?MWNGSW5DbnMyUm45YmZvRVY1d1ZBcWpSVTAvVDJ1a2xlME1zV0kzWmlDTmli?=
 =?utf-8?B?RWt1MkIyK2Q1UjdjWXFLNjJOS2t5aDlyOTR0NFJZYzA4d3JUTDhKYzlZQ3Rp?=
 =?utf-8?B?QTRYamYzbFJOTExNMjFuZnROVjIzaktyRy9md2VFR1lRdlZaZFRWSU50amIy?=
 =?utf-8?B?TnZXNXJVemYvbmRWY3VmMTFaV3F5U1BmRnRjLzFyUEpFdldicEczcWU3ejlC?=
 =?utf-8?B?U3ZPOUFlN2d0T21oYXo5NjFvQWNpNUI4NjZYR3A2OHhaNCt3N1E5b3dPd2lj?=
 =?utf-8?B?cHhWT2VTOGJnUitmL3JDejJjM2ZObTVlWnNsS0lTUTVCbDJxSmRRVXpJaldD?=
 =?utf-8?B?SDdyY0tXeHJCdkRqQ0N6Q05kWG9aMzNTVFFNU2ZBTm9STjNQaERaVDEwK1hY?=
 =?utf-8?B?bm9kRUpEd2RyOWxVMzBjMkg4TWViZkZqaURpTEZKaG5TQm44dVNoTG1KUGJi?=
 =?utf-8?B?UTdNNlY1Rmw2UUZPYlk1dnRYeitCdnA1M0JoTVVsL2FrbzdMNytmdk9Ta2xR?=
 =?utf-8?B?R3BPY3VaaXl0L3JRd0IyQy92YWE0TUlRczZFUEdia29GSUxXR0s0S01lclNX?=
 =?utf-8?B?c0ZZbkdOYmVMSC9pSnE2SnZYV1hUNCsyQU9Dam1VTkRZNU1hTzU5cFZFa3VL?=
 =?utf-8?B?SjVBKzdzd3hyNDNKaVJEbDF4UWx1UzYzeEE3OVZjc0JtZno3UThXTCtBVS9M?=
 =?utf-8?B?M05LU1VQNjk1ZmY2dDNoYkNrb3lqYVlrajAvZWhVczhiL2luZ3NQSHNCTi94?=
 =?utf-8?B?eEZlWFFTNEljZkVoVW02ZEZvSjRVemtXN2Jid2JmRjR4cXRVc3RCaUtQQk9m?=
 =?utf-8?B?TzhEalBieVkwTHY3dVhTd3ZHM0xGQjVoMDFSakVFeFBCditmektYQVcrRG01?=
 =?utf-8?B?ZGlNaWN6aFhsR1FoVCtEcUp0a0ttaUVaNmFHeTRzbjZGR3k3OWk1UWd3eGlq?=
 =?utf-8?B?VmxPTldHSXdwaFVaTFAvc2Z5STNKN05FYmxubVlDWnR5TklFdlZYdzhaUFNq?=
 =?utf-8?B?U0ZuSUs5eE1MQW5hS1NSczhSRHovWDRHV1ZJM3lvZExGelRQZjMxWVFMY2VH?=
 =?utf-8?B?cUZmZWlaUGk2QUdtNERRQWd1RjVpNFY5N0MwbTdEbjBQb0NBS0RmeVhubGpN?=
 =?utf-8?B?Zy9ORmhwaDZtY0xOM0twWm9WUGZjbThGL0cxNWJWbFk2TUlsWE80TFdVc0wz?=
 =?utf-8?B?VDkwNU1HRk9GZ0xjRDJicFRqMkRjT2hvdjVleXJPb0RGMFFKZFg0Nnc5T09h?=
 =?utf-8?B?bVU0VWFHQlFNdEdxTjFKc1gzdjFyZTI1SEcrNS9CN0taSUNJRGJDaCtobWI1?=
 =?utf-8?B?cjVQY0pzNVVZN0VIb1BaZWVuakdkU3lHWkM2eFBSbUhpa2Z2ZjBsbWVwSzE5?=
 =?utf-8?Q?taEYrdcuOkBg2hWuBrNRe2JRG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8086dd1d-49d9-430b-0752-08dbf0e7e0a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 14:31:30.0187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zvc6zWzPCqAnJgvuxU4VmldL3o0LBNh99ly0nTVeCp1tYh7N3UlHqPUdW9G5AxXqEztPn9/S+iVXsBqPyYJZRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8180
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 0/6] DSB refactoring
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAy
OSwgMjAyMyA3OjUzIFBNDQo+IFRvOiBNYW5uYSwgQW5pbWVzaCA8YW5pbWVzaC5tYW5uYUBpbnRl
bC5jb20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJl
OiBbSW50ZWwteGVdIFtQQVRDSCB2MSAwLzZdIERTQiByZWZhY3RvcmluZw0KPiANCj4gT24gV2Vk
LCAyOSBOb3YgMjAyMywgQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+IHdy
b3RlOg0KPiA+IERTQiByZWZhY3RvcmluZyBmb3IgeGUgYWZ0ZXIgY2hlcnJ5LXBpY2tpbmcgRFNC
IGltcGxlbWVudGF0aW9uIG9mDQo+ID4gaTkxNS4NCj4gDQo+IFBsZWFzZSB1c2UgZ2l0IGNoZXJy
eS1waWNrIC14IG9wdGlvbiBmb3IgYWxsIGNoZXJyeSBwaWNrcyB0byByZWZlcmVuY2UgdGhlDQo+
IHVwc3RyZWFtIGNvbW1pdC4gVGhpcyBoZWxwcyBhdXRvbWF0aW9uIGFuZCB1cGNvbWluZyByZWJh
c2VzLg0KDQpTdXJlLCBJIHdpbGwgdGFrZSBpbiBuZXh0IHZlcnNpb24uDQoNClJlZ2FyZHMsDQpB
bmltZXNoDQo+IA0KPiBCUiwNCj4gSmFuaS4NCj4gDQo+IA0KPiANCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiA+DQo+ID4g
QW5pbWVzaCBNYW5uYSAoMyk6DQo+ID4gICBSZXZlcnQgIkZJWE1FOiBkcm0vaTkxNS9kc2I6IHhl
IGNoYW5nZXMgZm9yIGRzYiINCj4gPiAgIGRybS9pOTE1L2RzYjogRFNCIGNvZGUgcmVmYWN0b3Jp
bmcNCj4gPiAgIGRybS94ZS9kc2I6IERTQiBpbXBsZW1lbnRhdGlvbiBmb3IgeGUNCj4gPg0KPiA+
IFZpbGxlIFN5cmrDpGzDpCAoMyk6DQo+ID4gICBkcm0vaTkxNS9kc2I6IEFsbG9jYXRlIGNvbW1h
bmQgYnVmZmVyIGZyb20gbG9jYWwgbWVtb3J5DQo+ID4gICBkcm0vaTkxNS9kc2I6IENvcnJlY3Qg
RFNCIGNvbW1hbmQgYnVmZmVyIGNhY2hlIGNvaGVyZW5jeSBzZXR0aW5ncw0KPiA+ICAgZHJtL2k5
MTUvZHNiOiBSZS1pbnN0YXRlIERTQiBmb3IgTFVUIHVwZGF0ZXMNCj4gPg0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMgICAgfCAgIDMgLQ0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RzYi5jICAgICAgfCAxNTMgKysrKy0t
LS0tLS0tLS0tLS0tDQo+ID4gIC4uLi9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kc2JfYnVm
ZmVyLmMgICB8ICA4MiArKysrKysrKysrDQo+ID4gIC4uLi9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kc2JfYnVmZmVyLmggICB8ICAyOSArKysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94
ZS9kaXNwbGF5L3hlX2RzYl9idWZmZXIuYyAgICB8ICA3MCArKysrKysrKw0KPiA+ICA3IGZpbGVz
IGNoYW5nZWQsIDIxOCBpbnNlcnRpb25zKCspLCAxMjEgZGVsZXRpb25zKC0pICBjcmVhdGUgbW9k
ZQ0KPiA+IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RzYl9idWZm
ZXIuYw0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kc2JfYnVmZmVyLmgNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS94ZS9kaXNwbGF5L3hlX2RzYl9idWZmZXIuYw0KPiANCj4gLS0NCj4gSmFuaSBOaWt1bGEs
IEludGVsDQo=
