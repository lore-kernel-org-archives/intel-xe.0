Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B332AC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 20:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F6510E044;
	Thu, 30 Nov 2023 20:36:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01E410E044
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 20:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701376600; x=1732912600;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=p8YZw4MVqGVtNltSP/Nguybj9aEK79ABBKJpL186xkU=;
 b=NkL907P8OENp6IhS7f9Etpml+x/d0+GiHsJfnV9OGvWdyb5Vn+O6X4cU
 SQ+u2htVghwUKYNJLhubUGl4Wv+WrIz2DZh6tc5u55pN7LBVd5zs3t4D9
 tPi1S9513xYcysdXjrbrOUCBjxAGSTzv7QKfSSiJNmxdGrRQ8hZTJ4l/Q
 2fk/kxypHyWuc2lsYR4CcU7LrwP3GuHN1HoN/BV92wSV/S06iVrsmZMn4
 m0uEVogMzsjlHtgxKJbfTxjLdjOLv/jLrJDsl73Qm7pmtq0LUs19867bd
 MRPe374vaCWcIjRLaLxBzP4m1y0hlUn/0kNA4ecuzVMM8wQXllmU0FoKm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="383782889"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="383782889"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 12:36:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="762865931"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="762865931"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 12:36:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 12:36:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 12:36:40 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 12:36:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/QFBgd73T21hv6OQkoRiwv3ntpbnllwzqO12vXrdj2Un+s0MVFID+y+LOBqBmx7/H6E0h4nGJD3/xoppsFfRT3YnAcnVIF8Pm1c2yPhEGCf49UV8dNonOKgk8gNRhBnuBP+BwoVcVE1BE7o5U0mJMFTC3duCqkCNFXBFUV39rAaDR6xJsb3s5cMXgUa8JYf676vIto1ICtlGvPM/bt+OzBAjDDqPixWltasskiS3PbBy+JyQGo7T1YpMGw3SK2+MYzcVmWGTsYeS5CD25/Ih12Wbb2LcIEWGKf05EhBuknOuMovzAglE92bHgzD28LubybUulg42SEK2rlei7PQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8YZw4MVqGVtNltSP/Nguybj9aEK79ABBKJpL186xkU=;
 b=XzDJnSxLlM9SnMKP7hmCYfF9EXdXHUYmyaj25edCyB8DPRZ18eMnWvyT2QtrHnWfx3OOx9Tmh3SwIWkJP3/6kuY3aSwn5jPN/bD2uHVTRDJ1RW1H+fu9kNJ9wnm45dGD8GkvuvjaCwl2cXB7WCt98weYdPRZSCjtNIHZ1nD20Ce/gniJuLy4FymoJnWgFAU3BfOgqTtEXkAOmxr9I0RmliEd9ioCfD2m+HlzXKGxoFS5bnmk5KUglcj/aNBekbuefXm1dFzX9h+DO7zFgWRYB7brfuKj9Bv/1gw280QDyiMudxrKPmanriZ6WlTkzWOjTyo3+QqibjZYTRJWPTUa9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH0PR11MB4839.namprd11.prod.outlook.com (2603:10b6:510:42::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 20:36:36 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 20:36:36 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v3 03/16] drm/xe: Make
 DRM_XE_DEVICE_QUERY_ENGINES future proof
Thread-Index: AQHaI7y7gWQaK2gFJUWTd2nHzdp0YrCTUTiAgAABHoA=
Date: Thu, 30 Nov 2023 20:36:36 +0000
Message-ID: <9dd2e8c8b9d43e9978bb9c8d6a6f78ee24cf5202.camel@intel.com>
References: <20231130183955.7-1-francois.dugast@intel.com>
 <20231130183955.7-4-francois.dugast@intel.com>
 <874jh3yobi.wl-ashutosh.dixit@intel.com>
In-Reply-To: <874jh3yobi.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH0PR11MB4839:EE_
x-ms-office365-filtering-correlation-id: d432c099-c510-4810-778c-08dbf1e40c31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yw0lBnGflTtpfohkUmyzw1A1g3HEZ+LRsUE85dBLG3LwLzlepHEsua4aPQDEhYtw5dkVyub5VRFV9pQRfmZbFNDpZPJla69rncUknwT3/sWFFxOmKv8OzSjc/uK67SXdxPKK3nVarNkU+eL2CDEFfBFlqf1ijBl4XJuODGDOtgHTz8o537t9+Vv3FYQPvJtctz6yzkdjvWHeb7GFtnQrYNnL1RAuEkQ+UMcp8WUrxQ9LqWbq3aY9SBhxnRui21eAvMikqL78qN1IfcXEvlPLGVVtAJRDnTpA2F8+Ggha8LOUChz2O7pUnN2IEBBV4nryk+F4rCJmcqx9+NlRjoPD3d6BXak8epSDG/9XM4UIUTP/T6Xj5Rh+SA7TbycT4fiIYdCz7zQKrdXAWPFKbSsU/KbwJVhVGGOB0awByCxzOAg54byZV5Sk1geBpzz8+nFyMXM5fKMiopLqSfn+Y+VD7URtl+IiqLGgIy9Gep5tlYqUThyExPYN5W+GgQI+PCfixcrPYHCqLKJwCpoYwIGsY8cghuofzs+tyla3BYehZHTP/EwgkYJwweUmfFhQVshhbuazH8I53EjKsoQ7NUM0LlrGmnrbGKXJBr1CtqWspyQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(346002)(376002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(86362001)(6506007)(26005)(6512007)(2616005)(107886003)(4001150100001)(4326008)(478600001)(5660300002)(8676002)(8936002)(41300700001)(6486002)(2906002)(110136005)(966005)(66556008)(316002)(66476007)(91956017)(54906003)(66446008)(64756008)(71200400001)(6636002)(76116006)(66946007)(122000001)(36756003)(38100700002)(82960400001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjYvbmgyRk9kQzhGeEEyRUpwUmRIMFNyREVPZzl1dFg3dWpVKy9RbkhNamZ3?=
 =?utf-8?B?YnV1SkFhTVJ5VVRvSzB3VGQ2YmhGL2pZeWQ3bHpZKzRhUjM4UkNSd3MvU0FL?=
 =?utf-8?B?aE5HbnB3UWtxQlk1VGRNMENnTzRVK3VxQkNVNVluRjVzdDZwWmdWQThFYjFz?=
 =?utf-8?B?Ukx1TmwxWUlhV3R0Rm5EVStCYkFyNjNESkRFWWxIZmcvWGNiU0hvL1duTWJI?=
 =?utf-8?B?WWlkY2hHS3ZIeEJKSjVha2VjeGlwaDJzbmE4VlBwUGIwRURhNmhUQW1Vd3Jp?=
 =?utf-8?B?WGRCQlowR3V4ZCtUNVZzZkNnNXZuZm1BMi93YllyK0dTdXRqVysrVndDQjQ1?=
 =?utf-8?B?NUhPdHZ0azNiaFh6a1FlQit4UDJ2YkZWNW45cS9mcFRmRWJjamtiOWZSeEFk?=
 =?utf-8?B?ZDF0MlZMNHJqd3lHZXZJM3RZRkhRSnNmRU1lZ1ZraXBLblBBMnVkMVduRGR0?=
 =?utf-8?B?NkZLYStHUmNPRXMwckI5ZWhmNE1QRWNMTGlGT0ZBS1BxOFdpWGVZQldzWlpB?=
 =?utf-8?B?T0ZtbG9YNjVTcnVEQkRGcjQwbzlJa3NMZjNoL3czQWlLdGRWYXhWVHdVTFcz?=
 =?utf-8?B?cEFZVmNTVjErWFRaMlRjdUhQcUNaK2lXUzZxQy9qRUlkUzV5VU8vNmhXTStU?=
 =?utf-8?B?YlRHUkdVM3ZJSUR4YUlsZjBoMktNRGZILzhxa3V4a0s0U0RvUTJ2ZkNhZ0pN?=
 =?utf-8?B?dlkyRmRIZmVLbkZKVUxGZzdmZXNDcmlxRFVkQlpjeVdLZUJtLzROUUlDay93?=
 =?utf-8?B?RCtadW5jT0xvdW5DdVpqS3lWOVJZUjhod25jYmQyeWROcy9aSkppVG54VytU?=
 =?utf-8?B?RjFkWVRXT2NZMUgvRXowb3lXWWhWOTgwb2t1cjZ4MFB2T0hGSGhoZ2U2VktD?=
 =?utf-8?B?aW5mRjEyZlkwZ3dEWXN3M2puSldhMlZHZGNIajB2VXJndWZwYnZKOTVjYUd1?=
 =?utf-8?B?MjEvWW03dUVoUjNDMU9keUZ3VHR3RzRhcytuSzJqY1lzZUFDM0F1LzVldUhB?=
 =?utf-8?B?clpFNWErckF2SXRDN2lTWlhsWXpoeXB4bFQwRW9JMkFxdE1Pb1lvTkFsZm5a?=
 =?utf-8?B?TkVYbHM0dWdEOVBKblN4TEo4U0ZrWjBadUpaRjNrdW1RVUtoSTZVck9TcmNH?=
 =?utf-8?B?dWFONmI1L1hQQ2ZGbXh3VXFlWm10SDZvS3NybldNdzRHYTlTOXlVOVpOZll5?=
 =?utf-8?B?OEVEaHJxcFJJbDNHWklPcitzSExOek9lM0pyd1BhMWxOYm5OUzJWQXpHWU1D?=
 =?utf-8?B?b2pNdDNHSy9tdGNqeEc2UWpIVk5ZNlkwemlBTHpYWjQ1ZmRzZ0dibG5COTNF?=
 =?utf-8?B?R2M4eEZRWUdXSUptNFdWUE8wcUo2bmFvOWFSN1lOZWpjRWYydzQ3bXl3ZVJM?=
 =?utf-8?B?a0FHMHRVOGZkaGM5VDREcHoyZXk3V3ExSEQrZUQyd1VOYTlGK1V6UEhuUjY0?=
 =?utf-8?B?cmhrOFlwNUFoMnowQlUzdHdHSEg3SWFHd09BWkY2ei9IWDFEUTVMV3AzQlVj?=
 =?utf-8?B?cC9VWGphd01jYVF5dnBFaEVsSFA3QVhuQkRoMGhYS1RGTHJRQXpKRkNud3NJ?=
 =?utf-8?B?QnFXb0JJMDVrRXdUeDlSQTRJNGcvamMzeXk3dWd6YlVQWldxdEd2bVpIUWx3?=
 =?utf-8?B?RUJUMDZrejJUUzBPYUV5bTVNZllvbS9Eak5QT1F2LzNwTDY4MEowdzY0ZDdD?=
 =?utf-8?B?YWFibFBsTGV6TitEeWg4b3RqeXNET2FNRTRla2c4Y3pSQ3hVNnc0blRla2xu?=
 =?utf-8?B?dFVlVEhaeGduWmlMUFlSUlA5VVVhRWd6U0tRc3dlaFBQZkx2Y053Z0c3MzZI?=
 =?utf-8?B?K2hZUE44QlAxeERWUzlOSjZLYlhUTEtSeTV4dE5vM3JPbGFzRG92ZmMrK2h4?=
 =?utf-8?B?MWh1Und2SDl6OGNla0ZqYzIwZUpLR1NPNit2SXo1N0Y5aEllcVY1T1Rpcjdj?=
 =?utf-8?B?dmhTMVhwYkQ2SlFncDVmVHhPNHNJYWdTZlZqbEFrc09IRXh5SjN5dTZBclpm?=
 =?utf-8?B?djJMYkdZbFl1NndzSGxKTENHK0llMkpMQTJ6d3JkQURnVHhBTG13bk95a3ZE?=
 =?utf-8?B?bys5LzBDcFpIWXRtOXVUNy9TNWV2TU9RdVgxclJLaGxhSU82Z3U3cDAxcTJM?=
 =?utf-8?B?dlVFRGVpUDdWYis5NWNrMXlQRmFLTHZpWU5PS2JWVFNlUERHQWlPOWlpOWJi?=
 =?utf-8?B?dHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDAF63B5AD797E44A35E75F5F6CBF31A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d432c099-c510-4810-778c-08dbf1e40c31
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 20:36:36.2084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bXvCnWRMq4vgOHkcNes0g6+C4MJrTNnD3NmwHvkQzCc7K99nYdINVeuiMmKP5HMOKxbE5pJI77aPfAahZFyIOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4839
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 03/16] drm/xe: Make
 DRM_XE_DEVICE_QUERY_ENGINES future proof
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTExLTMwIGF0IDEyOjMyIC0wODAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFRodSwgMzAgTm92IDIwMjMgMTA6Mzk6NDIgLTA4MDAsIEZyYW5jb2lzIER1Z2FzdCB3
cm90ZToNCj4gPiANCj4gPiBGcm9tOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXph
QGludGVsLmNvbT4NCj4gPiANCj4gPiBXZSBoYXZlIGF0IGxlYXN0IDIgZnV0dXJlIGZlYXR1cmVz
KE9BIGFuZCBmdXR1cmUgbWVkaWEgZW5naW5lcw0KPiA+IGNhcGFiaWxpdGllcykgdGhhdCB3aWxs
IHJlcXVpcmUgWGUgdG8gcHJvdmlkZSBtb3JlIGluZm9ybWF0aW9uIGFib3V0DQo+ID4gZW5naW5l
cyB0byBVTURzLg0KPiA+IA0KPiA+IEJ1dCB0aGlzIGluZm9ybWF0aW9uIHNob3VsZCBub3QganVz
dCBiZSBhZGRlZCB0bw0KPiA+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgZm9yIGEgY291
cGxlIG9mIHJlYXNvbnM6DQo+ID4gLSBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlIGlzIHVz
ZWQgYXMgaW5wdXQgdG8gb3RoZXIgc3RydWN0cy91QVBJcw0KPiA+IGFuZCB0aG9zZSB1QVBJcyBk
b24ndCBjYXJlIGFib3V0IGFueSBvZiB0aGVzZSBmdXR1cmUgbmV3IGVuZ2luZSBmaWVsZHMNCj4g
PiAtIHRob3NlIG5ldyBmaWVsZHMgYXJlIHVzZWxlc3MgaW5mb3JtYXRpb24gYWZ0ZXIgaW5pdGlh
bGl6YXRpb24gZm9yDQo+ID4gc29tZSBVTURzLCBzbyBpdCBzaG91bGQgbm90IG5lZWQgdG8gY2Fy
cnkgdGhhdCBhcm91bmQNCj4gPiANCj4gPiBTbyBoZXJlIG15IHByb3Bvc2FsIGlzIHRvIG1ha2Ug
RFJNX1hFX0RFVklDRV9RVUVSWV9FTkdJTkVTIHJldHVybiBhbg0KPiA+IGFycmF5IG9mIGRybV94
ZV9xdWVyeV9lbmdpbmVfaW5mbyB0aGF0IGNvbnRhaW4NCj4gPiBkcm1feGVfZW5naW5lX2NsYXNz
X2luc3RhbmNlIGFuZCAzIHU2NHMgdG8gYmUgdXNlZCBmb3IgZnV0dXJlIGZlYXR1cmVzLg0KPiA+
IA0KPiA+IFJlZmVyZW5jZSBPQToNCj4gPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvcGF0Y2gvNTU4MzYyLz9zZXJpZXM9MTIxMDg0JnJldj02DQo+IA0KPiBJbmNpZGVudGFsbHkg
d2UncmUgcHJvcG9zaW5nIHRvIHJlbW92ZSBPQSBpbmZvIGZyb20NCj4gZHJtX3hlX2VuZ2luZV9j
bGFzc19pbnN0YW5jZS4gVGhlIGRpcmVjdGlvbiBub3cgaXMgdG8gY29sbGVjdCBhbGwgT0EgaW5m
bw0KPiBpbnRvIGEgc2VwYXJhdGUgc3RydWN0IHdoaWNoIGxvb2tzIHNvbWV0aGluZyBsaWtlIHRo
aXMgYXQgcHJlc2VudCwgc2VlDQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgYXQgdGhl
IGJvdHRvbToNCg0Kb2theSwgc28gb25lIGxlc3MgdXNlciBmb3IgdGhpcyByZXNlcnZlZCBmaWVs
ZHMuLi4NCg0KPiANCj4gc3RydWN0IGRybV94ZV9xdWVyeV9vYV91bml0cyB7DQo+IAkvKiogQGV4
dGVuc2lvbnM6IFBvaW50ZXIgdG8gdGhlIGZpcnN0IGV4dGVuc2lvbiBzdHJ1Y3QsIGlmIGFueSAq
Lw0KPiAJX191NjQgZXh0ZW5zaW9uczsNCj4gDQo+IAkvKiogQG51bV9vYV91bml0czogbnVtYmVy
IG9mIE9BIHVuaXRzIHJldHVybmVkIGluIG9hdVtdICovDQo+IAlfX3UzMiBudW1fb2FfdW5pdHM7
DQo+IA0KPiAJLyoqIEBwYWQ6IE1CWiAqLw0KPiAJX191MzIgcGFkOw0KPiANCj4gCS8qKiBAcmVz
ZXJ2ZWQ6IE1CWiAqLw0KPiAJX191NjQgcmVzZXJ2ZWRbNF07DQo+IA0KPiAJLyoqIEBvYV91bml0
czogT0EgdW5pdHMgcmV0dXJuZWQgZm9yIHRoaXMgZGV2aWNlICovDQo+IAlzdHJ1Y3QgZHJtX3hl
X29hX3VuaXQgew0KPiAJCS8qKiBAb2FfdW5pdF9pZDogT0EgdW5pdCBJRCAqLw0KPiAJCV9fdTE2
IG9hX3VuaXRfaWQ7DQo+IA0KPiAJCS8qKiBAb2FfdW5pdF90eXBlOiBPQSB1bml0IHR5cGUgb2Yg
QGRybV94ZV9vYV91bml0X3R5cGUgKi8NCj4gCQlfX3UxNiBvYV91bml0X3R5cGU7DQo+IA0KPiAJ
CS8qKiBAZ3RfaWQ6IEdUIElEIGZvciB0aGlzIE9BIHVuaXQgKi8NCj4gCQlfX3UxNiBndF9pZDsN
Cg0KZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSBhbHJlYWR5IGhhdmUgZ3RfaWQNCg0KPiAN
Cj4gCQkvKiogQG9wZW5fc3RyZWFtOiBUcnVlIGlmIGEgc3RyZWFtIGlzIG9wZW4gb24gdGhlIE9B
IHVuaXQgKi8NCj4gCQlfX3UxNiBvcGVuX3N0cmVhbTsNCj4gDQo+IAkJLyoqIEBpbnRlcm5hbF9l
dmVudHM6IFRydWUgaWYgaW50ZXJuYWwgZXZlbnRzIGFyZSBhdmFpbGFibGUgKi8NCj4gCQlfX3Ux
NiBpbnRlcm5hbF9ldmVudHM7DQo+IA0KPiAJCS8qKiBAcGFkOiBNQlogKi8NCj4gCQlfX3UxNiBw
YWQ7DQo+IA0KPiAJCS8qKiBAY2FwYWJpbGl0aWVzOiBPQSBjYXBhYmlsaXRpZXMgYml0LW1hc2sg
Ki8NCj4gCQlfX3U2NCBjYXBhYmlsaXRpZXM7DQo+IA0KPiAJCS8qKiBAb2FfdGltZXN0YW1wX2Zy
ZXE6IE9BIHRpbWVzdGFtcCBmcmVxICovDQo+IAkJX191NjQgb2FfdGltZXN0YW1wX2ZyZXE7DQo+
IA0KPiAJCS8qKiBAb2FfYnVmX3NpemU6IE9BIGJ1ZmZlciBzaXplICovDQo+IAkJX191NjQgb2Ff
YnVmX3NpemU7DQo+IA0KPiAJCS8qKiBAcmVzZXJ2ZWQ6IE1CWiAqLw0KPiAJCV9fdTY0IHJlc2Vy
dmVkWzRdOw0KPiANCj4gCQkvKiogQG51bV9lbmdpbmVzOiBudW1iZXIgb2YgZW5naW5lcyBpbiBA
ZWNpIGFycmF5ICovDQo+IAkJX191NjQgbnVtX2VuZ2luZXM7DQo+IA0KPiAJCS8qKiBAZWNpOiBl
bmdpbmVzIGF0dGFjaGVkIHRvIHRoaXMgT0EgdW5pdCAqLw0KPiAJCXN0cnVjdCBkcm1feGVfZW5n
aW5lX2NsYXNzX2luc3RhbmNlIGVjaVtdOw0KPiAJfSBvYV91bml0c1tdOw0KPiB9Ow0KDQo=
