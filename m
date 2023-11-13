Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED22C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 09:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD17C10E173;
	Mon, 13 Nov 2023 09:12:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2C810E173
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 09:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699866721; x=1731402721;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VYKxXsLfhAuSMm3f/C6DOMt+xVHxm+VJeZTB4CTipRI=;
 b=M3vCCz0JiLXM5ZZkbCXwrshxcQBgoxKjLhWus430E3Nw1T35cuptXhF+
 KUH4rllRT5HH0cp88BdJKiM9B6d0GMDm3BIsyvH/x1sKA8wdHmP2IdMd9
 JIWAP8gqmWPF5TzJeoaPUIL/UYNnVJgURA+UtJ/EN6fbGkCLdNccltRxq
 6K6BkptoeILMuorBjZ6DAJ2omFs7Oe32QG7zVSTE5liO264WebQfr2zTL
 6zA52WQlUQqFWej+tg7xlmMw+X9WCyImpVtqnxBtfwWcSom4yn7oiSrpW
 3B5uPTm0VPTMlFRJ2PpUczc5FnfPprfeztQE8muO2KT6EfV5KxujV5+ud A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="370602038"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="370602038"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 01:12:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5405796"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 01:12:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 01:11:59 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 01:11:59 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 01:11:59 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 01:11:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lszuehEmVGMwG76rJEoSqzyVnWAgy0nRj7zVknVuq0k7yFcIS7PyA6i7mFrOZnZghMxaoplc3D8kL4XJrZ9l9ZL0afBYdpn98FKXfVNBDUrmkV1jIrltgiWXR4XC1cdeDxd0cjor5Asmea8xPhsKooYJzCQAuYcCjxXo2wM7P9Jhg7AGv3Vu1QhJv7l1MHTxrSv2INeCsL2uBDLPU3RQ1AOoZp8vCYJLVCwC5+/R48aTTZQXzQBN0i79UeLJJT8lN7nfPObt4uHzZZjzHF5SvG2zC3VuP4uYJgySulOzIJS/6yAoLhLSbVaEfqpWpjiutKHVBKn9skZv7aGWMzfG/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYKxXsLfhAuSMm3f/C6DOMt+xVHxm+VJeZTB4CTipRI=;
 b=T8rvRXGBAw3tcyZWGnHR3H3ulsNxtBWTmUkgeGAbx+GHyRBXo6IddKHZnRV1or16etfULB1A8RH7pjtAGmiMMGf7bSajpyIRDg1dviiuWEv+m4/xju4E7W6pu6ATY6Vca59gUwmFcy2Mgup4FmtS7Mg63usgKbB+PdvJ+rrZFg0XoYvJRGn5K2wQFR/s4rK0ITJfeOiw4Ais+OhI4qNqOzhUJTaKfV/N1iR/n97YiFPPXeoazti1cbP5M2c17Bv8OmeKgXxBBeu+Z9s0xhhV+5aIdqnMhkUf7VCckQeG9fu+USWS2oXAlRKZtJpQj510N8V3OrkS+bHf6pIxT8mI8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 by PH7PR11MB6930.namprd11.prod.outlook.com (2603:10b6:510:205::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 09:11:56 +0000
Received: from BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::c112:9cb2:ff33:b512]) by BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::c112:9cb2:ff33:b512%3]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 09:11:56 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "Milczarek, Slawomir"
 <slawomir.milczarek@intel.com>, Tomasz Mistat
 <tomasz.mistat@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Arteaga Molina, Jaime A"
 <jaime.a.arteaga.molina@intel.com>, "Cetnerowski, Adam"
 <adam.cetnerowski@intel.com>, "Chodor, Jaroslaw" <jaroslaw.chodor@intel.com>, 
 "Dunajski, Bartosz" <bartosz.dunajski@intel.com>, "Harasimiuk, Artur"
 <artur.harasimiuk@intel.com>, "Hoppe, Mateusz" <mateusz.hoppe@intel.com>,
 "Jablonski, Mateusz" <mateusz.jablonski@intel.com>, "Jobczyk, Lukasz"
 <lukasz.jobczyk@intel.com>, "Kasper, Kacper K" <kacper.k.kasper@intel.com>,
 "Rozenfeld, Piotr" <piotr.rozenfeld@intel.com>, "Wilma, Pawel"
 <pawel.wilma@intel.com>, "Wolny, Bartlomiej" <bartlomiej.wolny@intel.com>,
 "Yates, Brandon" <brandon.yates@intel.com>, "Zdanowicz, Zbigniew"
 <zbigniew.zdanowicz@intel.com>
Thread-Topic: FW: [Intel-xe] [PATCH v9 0/3] PAT and cache coherency support
Thread-Index: AQHaEjcC8KkdjP8z1kGuapkljd5tCrBwUtkAgAHDNoCAAAHXAIAABSDggAAMegCABdSnkA==
Date: Mon, 13 Nov 2023 09:11:56 +0000
Message-ID: <BN9PR11MB5275972DC0EC1C9EDB24E98BE7B3A@BN9PR11MB5275.namprd11.prod.outlook.com>
References: <ZUtv1eH5uiHl3j9N@tmistat-desk>
 <0c8104df-3c51-95a4-aec1-392b4b92efb9@intel.com>
 <CH3PR11MB8494CC467BA08CA3D00B7EE59DAFA@CH3PR11MB8494.namprd11.prod.outlook.com>
 <d71fbd17-72ae-796c-7c7c-964f7926ea26@intel.com>
 <BN9PR11MB527557220C41FFD53AE7A425E7AFA@BN9PR11MB5275.namprd11.prod.outlook.com>
 <9268ebca-3d21-c702-bce0-458f411e3234@intel.com>
In-Reply-To: <9268ebca-3d21-c702-bce0-458f411e3234@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5275:EE_|PH7PR11MB6930:EE_
x-ms-office365-filtering-correlation-id: 28f0ff09-2d5f-4e9f-348c-08dbe4289579
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3zLBLqoIm/L9XFrH4emTGfz/Vbj8LWE5xwMzwiu1Pg4dfnccQyjHapNvybyA9s5efTXwaH+OUuT4njJCEFG4P4Ma49CeoYuC7nZkt5l2lRUaVNhIYYHOgBGK2ghGD+igiDhxxf8Vl3RRIE7ETGKeIB78dPgTaif3KRpuYN3DFRLwAIX/K+6gVzZdf90w0cJq4E18YhwYY+obbg7/wSGuKUi/jABBmWWpo+mUVVO7tqBZ8Tx06VCqMShrMckAMqLterNkts+NnKdOHz+ESjGTg4oX17Xx9mW+2uVjUnDbL2oqxaNNiKZeviRvhpT66d7r0m3vF2QD8GEvvONidzflKNBhNSNUFSU7hvtVVcCerYUDG7kLc9ndzdAWj187+jKraWPpM2PU7yNEkhzWdOoSHkEjihLL/i/b/A1V0OxzMV9+3IXH88mMNjSTeLs2lj5bKrat8nnyDxpdVlhUuRzhzew8Sf3eMtePy0RWvnwy+8lK72z4Ar7Atb8nStAVx4qUfZZvRLGxxxxA6zUT5Svm+PD3+aexUhiGPuvzjpj10lWuFrShDRmoTRIxoe+XPM9B/DqepflvUqXX/GKTHpedHFsnlqkpev78Hv8l6gjsWEqqYAPYThTwyZfCQlOrjDRCPwc6++x+v6d1OgGmSsidvQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5275.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6506007)(53546011)(7696005)(9686003)(71200400001)(966005)(478600001)(26005)(83380400001)(5660300002)(41300700001)(66446008)(66556008)(66476007)(66946007)(64756008)(2906002)(316002)(110136005)(76116006)(6636002)(52536014)(8676002)(8936002)(921008)(38070700009)(38100700002)(82960400001)(122000001)(86362001)(33656002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajJKMXJhSzhxTDJLZzBDV3NRVlQ5bFlockovOVFNcVhhZWhmOUlMUmFBNEdi?=
 =?utf-8?B?NGFOWk9rNHZSdTI0S2ZHdWRDaWoyRFl0Y2x5ejM0ZmpVWENHVU5hcVFGNkMr?=
 =?utf-8?B?NjlFbHkxN3JJc0pNZ0tUNHNyL085VzVqOEVaQ1ppOHk0N2k0eTJJM2hXY3Uw?=
 =?utf-8?B?Y01zTXRQR2tRWW5ZZ2ZoUXo4bHFRRHJibGwySFhVUFhpQkx1L3lxNHlsVzJL?=
 =?utf-8?B?VWJGMzNQejNFaEw5RDdpWXgwamVtL2h4RHNaV0ZETE4rQVZlZSttOGdxZDFQ?=
 =?utf-8?B?ZVpwRHdWbEVRMHRCaHhjS00xTzlpL1VUb2hKUVA2anJDc1RKeGdRZjBYb25I?=
 =?utf-8?B?WlZXQXFBeE9HMU80aER4cmlhMUIwc2JKaG5aTWpqMjlhZ3AwdTU4cWNmUVFz?=
 =?utf-8?B?T0I0MEs5TGdRNnNKMmduNDQybFFJeGdZdG1YTXpmOFVlakwrQUd5cUdUYkRy?=
 =?utf-8?B?dk1PR2tpZDBVVU5zVTQrTjY3T0xOa0RveE5NM092ZFNHWmtJS1VMWEdvb2R1?=
 =?utf-8?B?Ti8xYlFuQ3pjMUplaFk0Z0JHS0lTRFd1Z3dmbXcvWjcvVHF2NVJWODZkWFRp?=
 =?utf-8?B?cnkxdzdBTFNpRVdqOWk0Yyt2WHlWVG13RW15Vk9ibnI1YVlXOElHSTVCYWhG?=
 =?utf-8?B?Yk1OMCtiTENlM3R5QXcrdzZYZG9mcytBbWlLc0NHSURNYUxMajFXNmRkWHB4?=
 =?utf-8?B?b0NnWitLTHQ5UDJ0MUlJODI5aWpTM3ZzWEM2VXBQYXFqSVZpdDlQa2U2YUZO?=
 =?utf-8?B?K1Z0Uk10cjRLRit4UjdydGlESmNTTmFFdlZ1Vy9BRm1MWXp1Nkd3ZXJRYmky?=
 =?utf-8?B?cjB0Vnh1amtmRTRNU1BodzRPbWJNTnFCV0Jma250blVZTml2Zi8zWURwelM4?=
 =?utf-8?B?MUhCRW4wK3FNS0JTWkVqNlJ6VTNKZ0hoRWtVQmFZVGNYSGh1MUpmbkg5NFBC?=
 =?utf-8?B?S1hxM2ZrUTQ0b1NDSURwbTAxbm9yRjA3ZW1JYmdma2FWckNqMzVJMU1UM1Vx?=
 =?utf-8?B?RjlHMFYveVBDQkZzbE5OSjBnNk9KNHJEVDh1N0hiVjF1c2wxSVJMblphN3Fz?=
 =?utf-8?B?QjFIS09hL3dxUEo5d1ZrYmIwNGFscEt6MnBzTFR1bStZM251eFM4Um5zZmU0?=
 =?utf-8?B?N3dyNnI0WUhPWVhYRStiNEVNeXZUclF5eVI2VCt6azIyNVo1RGZ0WU1aWG1N?=
 =?utf-8?B?SHZjUU1KYVJ4Q0tTODFwQmJpR1RTdEdudEZDRE9QRHRRWFA0Y1kyRE53a0tE?=
 =?utf-8?B?bHFCbXJhRnJXUFZrTzgrYktZVHRzYzRFRjg2dXI1V1g2NktKckVvMHpSTDhW?=
 =?utf-8?B?OGg0cERneEh2U2lHSm9PV0hyWHVDNk01dlkrTk53T0toQVlqTUF6VVE2Tkww?=
 =?utf-8?B?OUFkUGU1aFFHRDFXZDN0R3FaN1pxK3FLNTJwN1ZPUnY2b1FsYWZQNU1JSlRK?=
 =?utf-8?B?cmVubjBrcmp4aHlZVExsMGJJdHRuSjdIaklYQUNaK2FYd0wvZ0swNnQvK21u?=
 =?utf-8?B?THNRMko4czJWcXN6Zzd6WTNCUks1S1E4TC9yZ0N2RUZZN1ViSjY1VzROcWJB?=
 =?utf-8?B?NGF0WDhWTHhveFZsdVc2ZFBCSEgzSUNCMXlqei8xY2VCa0Q1YWZ1eDVoTCsy?=
 =?utf-8?B?VTNhaC92R2NJN1ZOSUlkRllyWmljSUVERFl2b0pzMkRXSnlTaUF2WG4wRFkz?=
 =?utf-8?B?TUhVdDJOcmQ2SWR3bCtFWDYwb1FZblg5VitoNjJmVytQZUJ5dkl2RHhFYW9I?=
 =?utf-8?B?RVNNK2dnano2cVo0OEZLWVZIcGY5SStsVWlxbDRTaDBVMnB3Q2psM3dwYUJJ?=
 =?utf-8?B?WDB1dXdoU0crRy8vd1RIYytWbVZ4cFd2RXkwR0l2VWRacXU5azY1RTZ4MFhZ?=
 =?utf-8?B?OE1mWmdld2R6Um1WSWhRbUJiR0pwU04zSEVwWkE5VTRkODRSTCs1ODl1V29n?=
 =?utf-8?B?RFpUSUc5VFNjWFJNWmVvMWJKN201Y2NST0pJNkZycDlHcWsyWnNQY3B3Vmg4?=
 =?utf-8?B?QnFCUCtRaitWZnkvbE04UHR6S1grZTFMUXltOU5Zd0o0Ym4wNS9UbGQxd1V1?=
 =?utf-8?B?QzU0Tit0SEVXY3RIaEVuNXFjRjM5VGZKR0MrbDkydnRXUjdsa3EvK2N5bUhl?=
 =?utf-8?Q?cvpxgJcvEHBcKnqsuqCpreeMJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f0ff09-2d5f-4e9f-348c-08dbe4289579
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 09:11:56.0312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4gdPBn/VB5HmHEMLxxEUR1eObfAvtXwe2f0lufEx6z5NyHfMHbNuzGQ+YvCWLkv7L8XCfdcXYu6ZC/zhOdFlaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6930
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] FW:  [PATCH v9 0/3] PAT and cache coherency support
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

Ig0KUmlnaHQsIGlmIHlvdSBhbGxvY2F0ZSBXQiBtZW1vcnkgKGNwdV9jYWNoaW5nPXdiKSwgdGhl
biB5b3UgY2FuJ3QgY3VycmVudGx5IHVzZSBhbiBpbmNvaGVyZW50IFBBVCBpbmRleCBpZiBhY2Nl
c3NpbmcgaXQgZnJvbSB0aGUgR1BVLiBLTUQgd2lsbCByZWplY3QgaXQgYXQgdm1fYmluZC4iDQoi
DQoNCldoYXQgYWJvdXQgc2NlbmFyaW9zIHdoZXJlIEkgd2FudCB0byBoYXZlOg0KLSBDUFUgV0Ig
Y2FjaGluZw0KLSBHUFUgbm9uIGNvaGVyZW50IGFjY2Vzcw0KDQpBbmQgbWFudWFsbHkgZmx1c2gg
Y2FjaGUgbGluZXMgb24gc3luY2hyb25pemF0aW9uIHBvaW50cyAoaS5lLiBjbEZsdXNoIG9uIG1h
cHBlZCBPcGVuQ0wgYnVmZmVycykgPw0KSG93IHRvIGRvIGl0IGlmIEtNRCB3b3VsZCByZWplY3Qg
Vk1fQklORCBvcGVyYXRpb25zPw0KDQpNaWNoYWwNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IEF1bGQsIE1hdHRoZXcgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+IA0KU2VudDog
VGh1cnNkYXksIE5vdmVtYmVyIDksIDIwMjMgNTowOCBQTQ0KVG86IE1yb3playwgTWljaGFsIDxt
aWNoYWwubXJvemVrQGludGVsLmNvbT47IE1pbGN6YXJlaywgU2xhd29taXIgPHNsYXdvbWlyLm1p
bGN6YXJla0BpbnRlbC5jb20+OyBUb21hc3ogTWlzdGF0IDx0b21hc3oubWlzdGF0QGxpbnV4Lmlu
dGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQXJ0ZWFnYSBNb2xpbmEs
IEphaW1lIEEgPGphaW1lLmEuYXJ0ZWFnYS5tb2xpbmFAaW50ZWwuY29tPjsgQ2V0bmVyb3dza2ks
IEFkYW0gPGFkYW0uY2V0bmVyb3dza2lAaW50ZWwuY29tPjsgQ2hvZG9yLCBKYXJvc2xhdyA8amFy
b3NsYXcuY2hvZG9yQGludGVsLmNvbT47IER1bmFqc2tpLCBCYXJ0b3N6IDxiYXJ0b3N6LmR1bmFq
c2tpQGludGVsLmNvbT47IEhhcmFzaW1pdWssIEFydHVyIDxhcnR1ci5oYXJhc2ltaXVrQGludGVs
LmNvbT47IEhvcHBlLCBNYXRldXN6IDxtYXRldXN6LmhvcHBlQGludGVsLmNvbT47IEphYmxvbnNr
aSwgTWF0ZXVzeiA8bWF0ZXVzei5qYWJsb25za2lAaW50ZWwuY29tPjsgSm9iY3p5aywgTHVrYXN6
IDxsdWthc3ouam9iY3p5a0BpbnRlbC5jb20+OyBLYXNwZXIsIEthY3BlciBLIDxrYWNwZXIuay5r
YXNwZXJAaW50ZWwuY29tPjsgUm96ZW5mZWxkLCBQaW90ciA8cGlvdHIucm96ZW5mZWxkQGludGVs
LmNvbT47IFdpbG1hLCBQYXdlbCA8cGF3ZWwud2lsbWFAaW50ZWwuY29tPjsgV29sbnksIEJhcnRs
b21pZWogPGJhcnRsb21pZWoud29sbnlAaW50ZWwuY29tPjsgWWF0ZXMsIEJyYW5kb24gPGJyYW5k
b24ueWF0ZXNAaW50ZWwuY29tPjsgWmRhbm93aWN6LCBaYmlnbmlldyA8emJpZ25pZXcuemRhbm93
aWN6QGludGVsLmNvbT4NClN1YmplY3Q6IFJlOiBGVzogW0ludGVsLXhlXSBbUEFUQ0ggdjkgMC8z
XSBQQVQgYW5kIGNhY2hlIGNvaGVyZW5jeSBzdXBwb3J0DQoNCk9uIDA5LzExLzIwMjMgMTU6MjQs
IE1yb3playwgTWljaGFsIHdyb3RlOg0KPiBXaWxsIEtNRCBmYWlsIHRoZSBtbWFwIGNhbGwgaWYg
d2UgcHJvdmlkZSBpbmNvcnJlY3QgbWFwcGluZyA/DQoNCldpdGggWGUgdGhlcmUgYXJlIG5vIG1t
YXAgZmxhZ3Mgb3IgYW55dGhpbmcgbGlrZSB0aGF0LCBzbyB5b3UgY2FuJ3QgcmVhbGx5IHByb3Zp
ZGUgYW4gaW5jb3JyZWN0IG1hcHBpbmcuIElnbm9yaW5nIHRoaXMgc2VyaWVzLCB0aGUgcHJldmlv
dXMgYmVoYXZpb3VyIHdhcyBmb3IgdGhlIEtNRCB0byBpbXBsaWNpdGx5IHNlbGVjdCB0aGUgY3B1
IGNhY2hpbmcgbW9kZSB3aGVuIGFsbG9jYXRpbmcgdGhlIG1lbW9yeSwgd2hlcmUgcm91Z2hseSB5
b3Ugd291bGQgZ2V0IFdDIGZvciBWUkFNIGFuZCB0aGVuIFdCIGZvciBzeXN0ZW0gbWVtb3J5LCB1
bmxlc3MgaXQncyB1c2VkIGZvciBzY2Fub3V0IGluIHdoaWNoIGNhc2UgeW91IGdldCBXQy4gV2l0
aCB0aGlzIHNlcmllcyB1c2Vyc3BhY2UgbXVzdCBub3cgZXhwbGljaXRseSByZXF1ZXN0IHRoZSBj
cHUgY2FjaGluZyBtb2RlIGF0IGFsbG9jYXRpb24gdmlhIGdlbV9jcmVhdGUsIHdoaWNoIHdpbGwg
YmUgdXNlZCBmb3IgYWxsIENQVSBhY2Nlc3MsIGluY2x1ZGluZyBLTUQgaW50ZXJuYWwgc3R1ZmYg
YXMgd2VsbCBhcyB1c2Vyc3BhY2UgbW1hcCgpLg0KDQo+IEkuZS4gV0IgbW1hcCBvbiBub24tY29o
ZXJlbnQgR1BVIHJlc291cmNlPw0KDQpSaWdodCwgaWYgeW91IGFsbG9jYXRlIFdCIG1lbW9yeSAo
Y3B1X2NhY2hpbmc9d2IpLCB0aGVuIHlvdSBjYW4ndCBjdXJyZW50bHkgdXNlIGFuIGluY29oZXJl
bnQgUEFUIGluZGV4IGlmIGFjY2Vzc2luZyBpdCBmcm9tIHRoZSBHUFUuIEtNRCB3aWxsIHJlamVj
dCBpdCBhdCB2bV9iaW5kLg0KDQo+IA0KPiBNaWNoYWwNCj4gDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IEF1bGQsIE1hdHRoZXcgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+
DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciA5LCAyMDIzIDQ6MDUgUE0NCj4gVG86IE1pbGN6
YXJlaywgU2xhd29taXIgPHNsYXdvbWlyLm1pbGN6YXJla0BpbnRlbC5jb20+OyBUb21hc3ogTWlz
dGF0IA0KPiA8dG9tYXN6Lm1pc3RhdEBsaW51eC5pbnRlbC5jb20+OyBpbnRlbC14ZUBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IA0KPiBBcnRlYWdhIE1vbGluYSwgSmFpbWUgQSA8amFpbWUuYS5hcnRl
YWdhLm1vbGluYUBpbnRlbC5jb20+OyANCj4gQ2V0bmVyb3dza2ksIEFkYW0gPGFkYW0uY2V0bmVy
b3dza2lAaW50ZWwuY29tPjsgQ2hvZG9yLCBKYXJvc2xhdyANCj4gPGphcm9zbGF3LmNob2RvckBp
bnRlbC5jb20+OyBEdW5hanNraSwgQmFydG9zeiANCj4gPGJhcnRvc3ouZHVuYWpza2lAaW50ZWwu
Y29tPjsgSGFyYXNpbWl1aywgQXJ0dXIgDQo+IDxhcnR1ci5oYXJhc2ltaXVrQGludGVsLmNvbT47
IEhvcHBlLCBNYXRldXN6IA0KPiA8bWF0ZXVzei5ob3BwZUBpbnRlbC5jb20+OyBKYWJsb25za2ks
IE1hdGV1c3ogDQo+IDxtYXRldXN6LmphYmxvbnNraUBpbnRlbC5jb20+OyBKb2JjenlrLCBMdWth
c3ogDQo+IDxsdWthc3ouam9iY3p5a0BpbnRlbC5jb20+OyBLYXNwZXIsIEthY3BlciBLIA0KPiA8
a2FjcGVyLmsua2FzcGVyQGludGVsLmNvbT47IE1yb3playwgTWljaGFsIDxtaWNoYWwubXJvemVr
QGludGVsLmNvbT47IA0KPiBSb3plbmZlbGQsIFBpb3RyIDxwaW90ci5yb3plbmZlbGRAaW50ZWwu
Y29tPjsgV2lsbWEsIFBhd2VsIA0KPiA8cGF3ZWwud2lsbWFAaW50ZWwuY29tPjsgV29sbnksIEJh
cnRsb21pZWogDQo+IDxiYXJ0bG9taWVqLndvbG55QGludGVsLmNvbT47IFlhdGVzLCBCcmFuZG9u
IA0KPiA8YnJhbmRvbi55YXRlc0BpbnRlbC5jb20+OyBaZGFub3dpY3osIFpiaWduaWV3IA0KPiA8
emJpZ25pZXcuemRhbm93aWN6QGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IEZXOiBbSW50ZWwt
eGVdIFtQQVRDSCB2OSAwLzNdIFBBVCBhbmQgY2FjaGUgY29oZXJlbmN5IA0KPiBzdXBwb3J0DQo+
IA0KPiBPbiAwOS8xMS8yMDIzIDE0OjU4LCBNaWxjemFyZWssIFNsYXdvbWlyIHdyb3RlOg0KPj4g
SGkgTWF0dGhldywNCj4+DQo+PiBJbiB0aGUgY29tcHV0ZSBkcml2ZXIgd2UgY2FsbCBHRU1fTU1B
UF9PRkZTRVQgd2l0aCBmbGFncyB0byBzcGVjaWZ5IGNwdSBjYWNoZSBtb2RlICh3Yi93Yyk6DQo+
PiBHRU1fQ1JFQVRFX0VYVCgpIGFuZCBtbWFwKCkgKyBHRU1fTU1BUF9PRkZTRVQoZmxhZ3M9d2Iv
d2MpDQo+Pg0KPj4gU3RhcnRpbmcgZnJvbSBYZSBLTUQgd2Ugc2hvdWxkIGJlIGFibGUgdG8gYWNo
aWV2ZSB0aGUgc2FtZSBDUFUgY2FjaGluZyBwb2xpY2llcyB3aXRoIEdFTV9DUkVBVEVfRVhUOg0K
Pj4gR0VNX0NSRUFURV9FWFQoZmxhZ3M9d2Ivd2MpIGFuZCBtbWFwKCkgKyBHRU1fTU1BUF9PRkZT
RVQoZmxhZ3M9MCkgQW0gDQo+PiBJIGNvcnJlY3Q/DQo+IA0KPiBZZXMsIHRoYXQncyBjb3JyZWN0
Lg0KPiANCj4+DQo+PiBUaGFua3MsDQo+PiBTbGF3ZWsNCj4+DQo+PiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPj4gRnJvbTogQXVsZCwgTWF0dGhldyA8bWF0dGhldy5hdWxkQGludGVsLmNv
bT4NCj4+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgOCwgMjAyMyAxOjA0IFBNDQo+PiBUbzog
VG9tYXN6IE1pc3RhdCA8dG9tYXN6Lm1pc3RhdEBsaW51eC5pbnRlbC5jb20+OyANCj4+IGludGVs
LXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQXJ0ZWFnYSBNb2xpbmEsIEphaW1lIEEgDQo+PiA8
SmFpbWUuQS5BcnRlYWdhLk1vbGluYUBpbnRlbC5jb20+OyBDZXRuZXJvd3NraSwgQWRhbSANCj4+
IDxhZGFtLmNldG5lcm93c2tpQGludGVsLmNvbT47IENob2RvciwgSmFyb3NsYXcgDQo+PiA8amFy
b3NsYXcuY2hvZG9yQGludGVsLmNvbT47IER1bmFqc2tpLCBCYXJ0b3N6IA0KPj4gPGJhcnRvc3ou
ZHVuYWpza2lAaW50ZWwuY29tPjsgSGFyYXNpbWl1aywgQXJ0dXIgDQo+PiA8YXJ0dXIuaGFyYXNp
bWl1a0BpbnRlbC5jb20+OyBIb3BwZSwgTWF0ZXVzeiANCj4+IDxtYXRldXN6LmhvcHBlQGludGVs
LmNvbT47IEphYmxvbnNraSwgTWF0ZXVzeiANCj4+IDxNYXRldXN6LkphYmxvbnNraUBpbnRlbC5j
b20+OyBKb2JjenlrLCBMdWthc3ogDQo+PiA8bHVrYXN6LmpvYmN6eWtAaW50ZWwuY29tPjsgS2Fz
cGVyLCBLYWNwZXIgSyANCj4+IDxrYWNwZXIuay5rYXNwZXJAaW50ZWwuY29tPjsgTWlsY3phcmVr
LCBTbGF3b21pciANCj4+IDxzbGF3b21pci5taWxjemFyZWtAaW50ZWwuY29tPjsgTXJvemVrLCBN
aWNoYWwgDQo+PiA8bWljaGFsLm1yb3pla0BpbnRlbC5jb20+OyBSb3plbmZlbGQsIFBpb3RyIA0K
Pj4gPHBpb3RyLnJvemVuZmVsZEBpbnRlbC5jb20+OyBXaWxtYSwgUGF3ZWwgPHBhd2VsLndpbG1h
QGludGVsLmNvbT47IA0KPj4gV29sbnksIEJhcnRsb21pZWogPGJhcnRsb21pZWoud29sbnlAaW50
ZWwuY29tPjsgWWF0ZXMsIEJyYW5kb24gDQo+PiA8YnJhbmRvbi55YXRlc0BpbnRlbC5jb20+OyBa
ZGFub3dpY3osIFpiaWduaWV3IA0KPj4gPHpiaWduaWV3LnpkYW5vd2ljekBpbnRlbC5jb20+OyBE
dW5hanNraSwgQmFydG9zeiANCj4+IDxiYXJ0b3N6LmR1bmFqc2tpQGludGVsLmNvbT4NCj4+IFN1
YmplY3Q6IFJlOiBGVzogW0ludGVsLXhlXSBbUEFUQ0ggdjkgMC8zXSBQQVQgYW5kIGNhY2hlIGNv
aGVyZW5jeSANCj4+IHN1cHBvcnQNCj4+DQo+PiBPbiAwOC8xMS8yMDIzIDExOjMwLCBUb21hc3og
TWlzdGF0IHdyb3RlOg0KPj4+IGNvbXB1dGUtdW1kX3VhcGlfcmV2aWV3X3RlYW1AaW50ZWwuY29t
LGJhcnRvc3ouZHVuYWpza2lAaW50ZWwuY29tLHNhDQo+Pj4gdQ0KPj4+IHINCj4+PiBhYmhnLmd1
cHRhQGludGVsLmNvbSx1bGlzc2VzLmZ1cnF1aW1AaW50ZWwuY29tLG1pY2hhbC5tcm96ZWtAaW50
ZWwuYw0KPj4+IG8NCj4+PiBtDQo+Pj4gLHRvbWFzei5taXN0YXRAaW50ZWwuY29tLHBpb3RyLnJv
emVuZmVsZEBpbnRlbC5jb20sYXlhei5zaWRkaXF1aUBpbnQNCj4+PiBlDQo+Pj4gbA0KPj4+IC5j
b20sbHVpcy5zdHJhbm9AaW50ZWwuY29tLGZpbGlwLmhhenVic2tpQGludGVsLmNvbSxmaWxpcC5o
YXp1YnNraUBpDQo+Pj4gbiB0IGVsLmNvbSxtYXRldXN6Lm5ha2xpY2tpQGludGVsLmNvbSxrYW1p
bC5rb3ByeWtAaW50ZWwuY29tDQo+Pj4gQmNjOg0KPj4+IFN1YmplY3Q6IFJlOiBbSW50ZWwteGVd
IFtQQVRDSCB2OSAwLzNdIFBBVCBhbmQgY2FjaGUgY29oZXJlbmN5IA0KPj4+IHN1cHBvcnQNCj4+
PiBSZXBseS1UbzoNCj4+PiBJbi1SZXBseS1UbzogPDIwMjMxMTAzMTU0MzA5LjQwMjE1OS01LW1h
dHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+Pj4NCj4+PiBPbiAyMDIzLTExLTAzIGF0IDE1OjQzOjEw
ICswMDAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+Pj4+IEJyYW5jaCBhdmFpbGFibGUgaGVyZToN
Cj4+Pj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL213YS9rZXJuZWwvLS90cmVlL3hl
LXBhdC1pbmRleD9yZWZfdA0KPj4+PiB5DQo+Pj4+IHANCj4+Pj4gZT1oZWFkcw0KPj4+Pg0KPj4+
PiBJR1QgY2hhbmdlczoNCj4+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nl
cmllcy8xMjQ2NjcvDQo+Pj4+DQo+Pj4+IE1lc2E6DQo+Pj4+IGh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy8yNTQ2Mg0KPj4+Pg0KPj4+PiBH
b2FsIGhlcmUgaXMgdG8gYWxsb3cgdXNlcnNwYWNlIHRvIGRpcmVjdGx5IGNvbnRyb2wgdGhlIHBh
dF9pbmRleCANCj4+Pj4gd2hlbiBtYXBwaW5nIG1lbW9yeSB2aWEgdGhlIHBwR1RULCBpbiBhZGR0
aW9uIHRvIHRoZSBDUFUgY2FjaGluZyANCj4+Pj4gbW9kZS4gVGhpcyBpcyB2ZXJ5IG11Y2ggbmVl
ZGVkIG9uIG5ld2VyIGlncHUgcGxhdGZvcm1zIHdoaWNoIGFsbG93IA0KPj4+PiBpbmNvaGVyZW50
IEdUIGFjY2Vzcywgd2hlcmUgdGhlIGNob2ljZSBvdmVyIHRoZSBjYWNoZSBsZXZlbCBhbmQgDQo+
Pj4+IGV4cGVjdGVkIGNvaGVyZW5jeSBpcyBiZXN0IGxlZnQgdG8gdXNlcnNwYWNlIGRlcGVuZGlu
ZyBvbiB0aGVpciANCj4+Pj4gdXNlY2FzZS4gIEluIHRoZSBmdXR1cmUgdGhlcmUgbWF5IGFsc28g
YmUgb3RoZXIgc3R1ZmYgZW5jb2RlZCBpbiB0aGUgcGF0X2luZGV4LCBzbyBnaXZpbmcgdXNlcnNw
YWNlIGRpcmVjdCBjb250cm9sIHdpbGwgYWxzbyBiZSBuZWVkZWQgdGhlcmUuDQo+Pj4+DQo+Pj4+
IFRvIHN1cHBvcnQgdGhpcyB3ZSBhZGRlZCBuZXcgZ2VtX2NyZWF0ZSB1QVBJIGZvciBzZWxlY3Rp
bmcgdGhlIENQVSANCj4+Pj4gY2FjaGUgbW9kZSB0byB1c2UgZm9yIHN5c3RlbSBtZW1vcnksIGlu
Y2x1ZGluZyB0aGUgZXhwZWN0ZWQgR1BVIA0KPj4+PiBjb2hlcmVuY3kgbW9kZS4gVGhlcmUgYXJl
IHZhcmlvdXMgcmVzdHJpY3Rpb25zIGhlcmUgZm9yIHRoZSANCj4+Pj4gc2VsZWN0ZWQgY29oZXJl
bmN5IG1vZGUgYW5kIGNvbXBhdGlibGUgQ1BVIGNhY2hlIG1vZGVzLiAgV2l0aCB0aGF0IA0KPj4+
PiBpbiBwbGFjZSB0aGUgYWN0dWFsIHBhdF9pbmRleCBjYW4gbm93IGJlIHByb3ZpZGVkIGFzIHBh
cnQgb2YgDQo+Pj4+IHZtX2JpbmQuIFRoZSBvbmx5IHJlc3RyaWN0aW9uIGlzIHRoYXQgdGhlIGNv
aGVyZW5jeSBtb2RlIG9mIHRoZSANCj4+Pj4gcGF0X2luZGV4IG11c3QgYmUgYXQgbGVhc3QgYXMg
Y29oZXJlbnQgYXMgdGhlIGdlbV9jcmVhdGUgY29oZXJlbmN5IG1vZGUuIFRoZXJlIGFyZSBhbHNv
IHNvbWUgc3BlY2lhbCBjYXNlcyBsaWtlIHdpdGggdXNlcnB0ciBhbmQgZG1hLWJ1Zi4NCj4+Pj4N
Cj4+Pj4gdjI6DQo+Pj4+ICAgICAgLSBMb2FkcyBvZiBpbXByb3ZlbWVudHMvdHdlYWtzLiBNYWlu
IGNoYW5nZXMgYXJlIHRvIG5vdyBhbGxvdw0KPj4+PiAgICAgICAgZ2VtX2NyZWF0ZS5jb2hfbW9k
ZSA8PSBjb2hfbW9kZShwYXRfaW5kZXgpLCByYXRoZXIgdGhhbiBpdCBuZWVkaW5nIHRvIG1hdGNo
DQo+Pj4+ICAgICAgICBleGFjdGx5LiBUaGlzIHNpbXBsaWZpZXMgdGhlIGRtYS1idWYgcG9saWN5
IGZyb20gdXNlcnNwYWNlIHBvdi4gQWxzbyB3ZSBub3cNCj4+Pj4gICAgICAgIG9ubHkgY29uc2lk
ZXIgQ09IX05PTkUgYW5kIENPSF9BVF9MRUFTVF8xV0FZLg0KPj4+PiB2MzoNCj4+Pj4gICAgICAt
IFJlYmFzZS4gU3BsaXQgdGhlIHB0ZV9lbmNvZGUoKSByZWZhY3RvcmluZywgcGx1cyB2YXJpb3Vz
IHNtYWxsZXIgdHdlYWtzIGFuZA0KPj4+PiAgICAgICAgZml4ZXMuDQo+Pj4+IHY0Og0KPj4+PiAg
ICAgIC0gUmViYXNlIG9uIEx1Y2FzJyBuZXcgc2VyaWVzLg0KPj4+PiAgICAgIC0gRHJvcCBVQyBj
YWNoZSBtb2RlLg0KPj4+PiAgICAgIC0gcy9zbWVtX2NwdV9jYWNoaW5nL2NwdV9jYWNoaW5nLy4g
SWRlYSBpcyB0byBtYWtlIFZSQU0gV0MgZXhwbGljaXQgaW4gdGhlDQo+Pj4+ICAgICAgICB1YXBp
LCBwbHVzIG1ha2UgaXQgbW9yZSBmdXR1cmUgcHJvb2YuDQo+Pj4+IHY1Og0KPj4+PiAgICAgIC0g
UmViYXNlLCBwbHVzIHNvbWUgc21hbGwgdHdlYWtzIGFuZCBmaXhlcy4NCj4+Pj4gdjY6DQo+Pj4+
ICAgICAgLSBDSSBob29rcyBmaXhlcyArIGNoZWNrcGF0Y2guDQo+Pj4+IHY3Og0KPj4+PiAgICAg
IC0gU29tZSBzbWFsbCB0d2Vha3MNCj4+Pj4gdjg6DQo+Pj4+ICAgICAgLSBSZWJhc2Ugb24gWGUy
IFBBVCB0YWJsZSBhZGRpdGlvbnMuDQo+Pj4+IHY5Og0KPj4+PiAgICAgIC0gRHJvcCBjb2hfbW9k
ZS4NCj4+Pj4NCj4+Pj4gLS0NCj4+Pj4gMi40MS4wDQo+Pj4+DQo+Pj4NCj4+PiBJJ20gc2hhcmlu
ZyBkb3duIGhlcmUgcXVlc3Rpb25zIHBhc3NlZCBieSBiYXJ0b3N6LmR1bmFqc2tpQGludGVsLmNv
bSANCj4+PiBsZXRzIGNvbnRpbnVlIHJldmlldyBoZXJlIGF0IHJlc3BlY3RpdmUgTUwNCj4+Pg0K
Pj4+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgOCwgMjAyMyAwOTowNQ0KPj4+IFN1YmplY3Q6
IFJFOiBbSW50ZWwteGVdIFtQQVRDSCB2OSAwLzNdIFBBVCBhbmQgY2FjaGUgY29oZXJlbmN5IA0K
Pj4+IHN1cHBvcnQNCj4+Pg0KPj4+IEp1c3QgdG8gY29uZmlybSBteSB1bmRlcnN0YW5kaW5nLiBX
ZSB3aWxsIGhhdmUgMiBzZXBhcmF0ZSBBUElzPw0KPj4+IDEuCUZvciBnZW1fY3JlYXRlIHRvIGV4
cGxpY2l0bHkgc2V0IGNvaGVyZW5jeS9jYWNoaW5nIGFjY29yZGluZyB0byBBUEkgZW51bXMNCj4+
DQo+PiBZZWFoLCB5b3UganVzdCBuZWVkIHRvIHByb3ZpZGUgdGhlIGNwdV9jYWNoaW5nIG1vZGUg
KHdjIG9yIHdiKS4gSWYgeW91IGxhdGVyIG1tYXAoKSB0aGUgb2JqZWN0IHRoaXMgc2FtZSBjYWNo
aW5nIG1vZGUgaXMgdXNlZC4gQWxzbyBhbnkgS01EIGludGVybmFsIHRoaW5ncyBsaWtlIHN3YXAt
aW4gd2lsbCBhbHNvIHJlc3BlY3QgdGhpcyBjYWNoaW5nIG1vZGUuIFRoZSBjb2hfbW9kZSBpcyBu
b3cgcmVtb3ZlZC4NCj4+DQo+Pj4gMi4JRm9yIHZtX2JpbmQgdG8gc2V0IFBBVCBpbmRleCB0aGF0
IGlzIGFsaWduZWQgd2l0aCBCc3BlYyBhbmQgY29udHJvbHMgbW9yZSB0aGFuICMxLiBJdCBjYW4g
YWxzbyBvdmVycmlkZSBjb2hlcmVuY3kvY2FjaGluZyB0aGF0IHdhcyBwcmV2aW91c2x5IHNldD8N
Cj4+DQo+PiBSaWdodCwgYXMgcGFydCBvZiB2bV9iaW5kIHlvdSBwcm92aWRlIHdoYXRldmVyIFBB
VCBpbmRleCBjb250cm9sIChhcyANCj4+IHBlcg0KPj4gQnNwZWMpIHlvdSB3YW50IGZvciBlYWNo
IG1hcHBpbmcgb2YgdGhlIG9iamVjdCAoeW91IGNvdWxkIG1hcCBpdCBtdWx0aXBsZSB0aW1lcyku
DQo+Pg0KPj4gV2hlbiBjaG9vc2luZyBhIFBBVCBpbmRleCB0aGUgY3B1X2NhY2hpbmcgb25seSBt
YXR0ZXJzIGlmIHlvdSBjaG9vc2UgYW4gaW5jb2hlcmVudCBQQVQgaW5kZXggKGNvaF9ub25lIGlu
IEJzcGVjKSwgc2luY2Ugd2UgZG9uJ3Qgd2FudCB0byBhbGxvdyBjcHVfY2FjaGluZz13YiBhbmQg
Y29oX25vbmUsIHNpbmNlIHRoYXQgbGVhZHMgdG8gc29tZSBjb21wbGljYXRpb25zIGluIHRoZSBL
TUQuDQo+Pg0KPj4+DQo+Pj4NCg==
