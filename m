Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B13C27C7A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 05:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4BE10E3F7;
	Thu, 17 Aug 2023 05:33:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA5D10E3F5
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 05:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692250433; x=1723786433;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=aYnUo+XkHyPySQGTDflQZ9WQPgk8duJw7s5k06ueRYA=;
 b=HNd3f390E5SZqtfdpk4mKxHq3eKc1YDQrqAEhNWLc5r1SDSLOlUdm6CU
 MW9H9pG8nC4Nk06snydk/G/gCNmnH+nbw6wL9/Iamdiwe1iIUSW4B09S4
 53Lqo9Gwx8C7ELmf7d74wD00YnZi9zxhvHNl9ePjS0erB6mdddiX9Roy3
 oZlDrhe1a2f2jLIdnertm16VqMZ2QBi8Nq/siXLAYLgwhEOJPSJVdnNp0
 7oqKKc4du+D8UMNipki/ZdB+dHjXJwq6JNH1FJLXt41dQuYHDVYZzixVV
 Z8olp/Okp3Ktx5bL4xObQQmJ3nouHJCpZqyyltENBG+GIPb/ol0xHUfqm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352309374"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="352309374"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 22:33:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763907565"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="763907565"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 16 Aug 2023 22:33:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 22:33:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 22:33:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 22:33:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 22:33:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9R6ifB7h0FJeIam/S+tglADbctM/wCAGwmqetIWLIjtdSLkHrKKMiyv7ZL29gAxMJGVGLhfb1ygr1RKMlmCO0C1W5HkjusXuF9UyySmYUl6aB65rW21jpP8X1s/hnJk6PIOY6eM8kciUo4/WA2R5f69Nj8BCTfqxVsebLXITjAcGH7sJ1AViJq9uYL3sHDuSZqpjAh4Qd4fqWFVmQYOzcCNc0q9csWQGJXz37tuP/e/k4psCjiidyYe5datBtcuIGtdHw0HCeHdF68O34QLzoLPqS2a9j6Kf+cs5QeUDzB3ZJaF2IPcYf3IsLHKSu2CEQEKcanMUbNTibjcwEDdIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYnUo+XkHyPySQGTDflQZ9WQPgk8duJw7s5k06ueRYA=;
 b=B+6AcMngX6YA1L1TdcE1YxG3o8QRdLIoLeDAmLtB9t324hKN/DBI6+cqz6UOf+b9RHz7VV5ZffFScfPNyetv8kQ/xCJiAAF0bnn/OZxVeFX3ilwRAJYKE1w/RhtnDECWlVUdTrqk9dkME1+wrurPOslLeqT12Glw1Ed9CrNbA9ZM+Th1OJRtVC72bMSBKmT7iIxOlRT/6SsfpSQMBfniZWIWwqYXR4e/lmdEfd8mLAhZ2v4jmSJvDcLij7sqJROmX+woCEtYbXw6wJdfvf2T5JKnI7Z9U6TMuFGunTj7DARejS2GwzFpSjor+LA+bxBbYjgsatOcpOzr424NWh7LXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SJ0PR11MB5614.namprd11.prod.outlook.com (2603:10b6:a03:300::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 05:33:49 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::6e2:18ec:9c09:e22e]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::6e2:18ec:9c09:e22e%5]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 05:33:49 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Thread-Topic: [Intel-xe] [PATCH 0/9] drm/xe: i915 irq backports + display
 cleanups
Thread-Index: AQHZ0MxmzHqr3WjeXUuLR0FOzykxtg==
Date: Thu, 17 Aug 2023 05:33:49 +0000
Message-ID: <1a616a72e41ee46aaa5e3c58af6af5ee6b5ccf56.camel@intel.com>
References: <20230811093559.2304457-1-jani.nikula@intel.com>
In-Reply-To: <20230811093559.2304457-1-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SJ0PR11MB5614:EE_
x-ms-office365-filtering-correlation-id: 17e57f44-f34d-4486-45aa-08db9ee388e8
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B5aSD+0akgIDDc7PYwvoAex2pd+5jBxOA5USyVyndSr4WNNzaoaNZcd1JCzESNtObRlI69TadGvpfsjXSmVdZaWyGi1plEIX1loLrP7A6bilWzOaeP5PMcZ+zyBCzcNkDXLjfaQM0dz22+IGGaPn5bGfyC3eDTib850OYjFciiTcCuHu/zSrKbsGk3/0n0lm1GMfcDjmZvWXfvWazb4HOtplX2AN642zOxvOFpYbmlDbGPKn2ZDuwqgF/g9sABQLpvke3P63tRR0MaIChrcCkCW/oRKHdD4xpoLqFWgbRaSeHTBd7s7F8T0Nyec4pndKbQyvO+/ve5hbxTGN95kNenJwVRQzUlKlfme7zGZQyZF6pDqGeCBejDOx1h8geInS3jBy456ML/lM7iKNSEYutXo/vWx01Vj8mQBk2WeJOhR253jJUB38djMOIcoj6nJGc5fUPkOYbOMWmrATUoUYe5PC11TZ2TP+8A9Jj1j3Xoa2S3Or4Qgsx1U7s8SInc0QEY4DpPAyIiWE2/yB0h31663IxYptZsAN3YcFQowAo9Nv9ZqIp/MbJ2DiAC5R2EFrN7zV1thStDhKzPIp829eG2rCVLSkmG2PgrY9KG68oi9LZetIcAfvOGSyKesOiSH1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(1800799009)(186009)(451199024)(83380400001)(66556008)(64756008)(38070700005)(66476007)(38100700002)(6636002)(76116006)(66446008)(82960400001)(316002)(91956017)(478600001)(122000001)(110136005)(66946007)(2906002)(41300700001)(4326008)(8676002)(8936002)(5660300002)(66574015)(6512007)(71200400001)(6486002)(6506007)(26005)(2616005)(107886003)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmZIQU1KMUcyN2d1YTIzeTY0Q0E1VzI4SEd6WWg4TWZraWdLRDVqYWZwY0Iz?=
 =?utf-8?B?SWMvdDdMWmZUdzlOWCsrRk9vWG5samhUcEhUZ2s0VSs0amdUVnp4ODdhd3Yx?=
 =?utf-8?B?RGVKOWlwVFdWemJUK2wybzAvSmtRYjlEd2R5b2p3cmw0OWxWMkhDKy9UQ3Np?=
 =?utf-8?B?M1R5ZnkydVZrV1hEclVzNWNZVkc3bFBqVExCbHlXYTlhZStSNmZweHlUQXAv?=
 =?utf-8?B?Z1c0UjR5YkJsTC9zRC92SjI4aHJFejYrd29TOURndC96aXBHM2dUOExBNEdo?=
 =?utf-8?B?MEo4Vzd0eDVFdzEzdlkzb29mT1BxWjViVDdLc3NQZWVLYURCbURkSkJFakZG?=
 =?utf-8?B?anN2NGlWemVUUjJaR2gwSERqMFVoTDJwRDdpbmtsVTYrbmF2WEw2SUpVdlNu?=
 =?utf-8?B?bktHY3N5dys4cW0ycG5VdzhUQnh3cmdCMEhtR2p0eDF2QlhWMkt0bUZRUlhp?=
 =?utf-8?B?a21SV1YrZmlrdWhNSFhEeUNJWkRDalBIa1pJQW84Q3B5NEhtckREQk05NFJX?=
 =?utf-8?B?N1JIMmhjVWtTM085aXpFemdJcW4xTkt0T3U2MXVqSzhPUTR2WjdjKzc4K3dZ?=
 =?utf-8?B?YTBmOENJSGFqdWpJdFczd1U0M1lLb0pqb3FDclZWaTYyWnNWTXFoaXR1Ykdk?=
 =?utf-8?B?cng4ZTAvY0tsc1lJMDVURDNVTEpOMnE3K1VLQ3JuN2ZKcS9XWUUyR2UrSTVw?=
 =?utf-8?B?eVBJSlA5ZGFkY1pTRFY4VGd4Z0dvRG0vZXQ4a0p5T21VdXJDYnRTdEpaM2Fy?=
 =?utf-8?B?YzB4QXdFb0pEL243NHQrbnE5cXloY2R4NTd5VUJiSFhJNzZvTVJPRnZ3Y1hj?=
 =?utf-8?B?YnBmWkk4VmdhVFFLZ1MzbmlZVkRlSEUyNkEzZis3L0JPT3lBajhoRjh6cDcr?=
 =?utf-8?B?dStmdDFmVVdIcDFuc1RpU0ZhYUloT1lza1N2ZXEzU2Z2bG5pWTNwZW1sN2F1?=
 =?utf-8?B?UHVCTFJrMDBkUnBHK2x5d1p4ZDVnU1pKbkxKRUpEeUtFclRxSzdiUzk1aUl5?=
 =?utf-8?B?OXZ1MzBwR0xrU2t6dUZrbk1oeFdEc1JwY09Valh6WllUVUxCemtxL2J1WUgv?=
 =?utf-8?B?bWlhSzFUNUZ4azBqc0xzN1Npei9uTEV0S091Q2x2MTRFQkdGdWdEODRrUE92?=
 =?utf-8?B?S0kzcVI4UXkzVFcwbVBiY3MydmRlVXVWbno4YnVYNjhDYjNva0JCaU1yMkg1?=
 =?utf-8?B?bm5ndHh5Qi81NVB5N0xERjN6clJBYTV3d01VSHdzTlVkalp5YzZQMG42THZs?=
 =?utf-8?B?OC8rZGRucWVLS2ozYjJvbUI1WTI3RnVXT3NTM0o1eTdaR2dUbkpqZUF4UXg4?=
 =?utf-8?B?Z0Q4Y3VORVAvOG9jL24zaDNIczl0M1RNRjBLTGpyTUdaVWd6MFBCMExQdjZr?=
 =?utf-8?B?TXJlekN4S21tc0ZFNWJZeXFrK2tNeC84dFE4TnFhcTdmcmxwaTFiUUpCTG0v?=
 =?utf-8?B?d0hRaXBWOUp4S2ZBMVBhOGd1OFJEaFpOV1k0WEROTHlKeFNTVllmamlPaWlD?=
 =?utf-8?B?eTA3TWNST3FkUG9HeDNTVnFQcHdtYkxueTZidE9XemlUUm52YkJnUktSemtP?=
 =?utf-8?B?SjZaYmNFNnluV2J3cU41N05CWEhlcW4vY1hza2M4SUhScjBuNVNzS3VkUWQv?=
 =?utf-8?B?RG9qU2tuYkNjOW9VNUxrU2RjNHhkdzhncEN4UDVhTm10dFQydUlpTm01Q3lK?=
 =?utf-8?B?VVZQKzRwZXZjVWZEWXM2STNHdWswckdIQ2xhcEFnSzVFWExjcWQxdGFLektP?=
 =?utf-8?B?TWIzQjd3Vm4wOFlvcmVwQWJiRndTQlBOWE01ZTk1OGhWT1k1WERSS0FsbDBt?=
 =?utf-8?B?bk9EOWUvQmovOENUMkdaSWlPNCswNlh5eEhJTzNJSlljY0dWZmJmRnBVbFl5?=
 =?utf-8?B?bHRTc3hOT1NEakt3aDB5dVliRERwTHRxSU4xUi9ZV0Q2V3MyL1FTUlJFbC9Z?=
 =?utf-8?B?QUtpTjVCN21zcEx6RzJRWlBsb3Q1djVxcEk0QlhnVjdtbGRrYmpwYmVjK3FM?=
 =?utf-8?B?T0NvVlNpaTRJQ01DZnhlSTZBYklyNDZGMjBUZ24yMVBBVjJrODZIMDNPQlIz?=
 =?utf-8?B?b1p6b0VoTXlVTEJ3UEpZMVhGMXNJQWxrTk11Z1pBZlY3Zm9MVHBtVWZ1YWlk?=
 =?utf-8?B?QmxsbHRpV0VJTjFiOE1XNHpJQllUZnFyLysyRU9KVEo3TnBQdUE1am1vRXhY?=
 =?utf-8?B?bGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90D98513F68DCE42B8ABEDF5B13C0699@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e57f44-f34d-4486-45aa-08db9ee388e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2023 05:33:49.4486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X6SeTkBuEaJkCbjsmJO+7xYppVF/J160Z0Z9/ofUyl+VazW6Gk8uUjgbd/RWQwGshDTPNW38ObsUkQJRXdkovRuOImNMTD8vqLvc+ZjbEwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5614
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/9] drm/xe: i915 irq backports + display
 cleanups
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

T24gRnJpLCAyMDIzLTA4LTExIGF0IDEyOjM1ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
QmFja3BvcnQgdGhlIGk5MTUgZGlzcGxheSBpcnEgcmVmYWN0b3JzLiBUaGV5IHdpbGwgYnJlYWsg
dGhlIGJ1aWxkDQo+IHVudGlsDQo+IGZpeGVkIGJ5IHBhdGNoIDUuIEluIHJlYmFzZXMsIHRoZSBi
YWNrcG9ydHMgc2hvdWxkIGJlIG1vdmVkIGJlZm9yZQ0KPiAiZHJtL3hlL2Rpc3BsYXk6IEltcGxl
bWVudCBkaXNwbGF5IHN1cHBvcnQiLg0KPiANCj4gQWRkaXRpb25hbGx5LCB0aGVyZSBhcmUgYSBm
ZXcgZGlzcGxheSBjbGVhbnVwcyBvbiB0b3AuDQoNClJldmlld2VkLWJ5OiBKb3VuaSBIw7ZnYW5k
ZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCg0KRm9yIHRoZSB3aG9sZSBzZXQuDQoNCj4g
QlIsDQo+IEphbmkuDQo+IA0KPiBKYW5pIE5pa3VsYSAoOSk6DQo+IMKgIGRybS9pOTE1L2lycTog
YWRkIGRlZGljYXRlZCBpbnRlbF9kaXNwbGF5X2lycV9pbml0KCkNCj4gwqAgZHJtL2k5MTUvaXJx
OiBhZGQgZGcxX2RlX2lycV9wb3N0aW5zdGFsbCgpDQo+IMKgIGRybS9pOTE1L2lycTogYWRkIGls
a19kZV9pcnFfcG9zdGluc3RhbGwoKQ0KPiDCoCBkcm0vaTkxNS9pcnE6IG1vdmUgYWxsIFBDSCBp
cnEgcG9zdGluc3RhbGwgY2FsbHMgdG8gZGlzcGxheSBjb2RlDQo+IMKgIGZpeHVwISBkcm0veGUv
ZGlzcGxheTogSW1wbGVtZW50IGRpc3BsYXkgc3VwcG9ydA0KPiDCoCBmaXh1cCEgZHJtL3hlL2Rp
c3BsYXk6IEltcGxlbWVudCBkaXNwbGF5IHN1cHBvcnQNCj4gwqAgZml4dXAhIGRybS94ZS9kaXNw
bGF5OiBJbXBsZW1lbnQgZGlzcGxheSBzdXBwb3J0DQo+IMKgIGZpeHVwISBkcm0veGUvZGlzcGxh
eTogSW1wbGVtZW50IGRpc3BsYXkgc3VwcG9ydA0KPiDCoCBmaXh1cCEgZHJtL3hlL2Rpc3BsYXk6
IEltcGxlbWVudCBkaXNwbGF5IHN1cHBvcnQNCj4gDQo+IMKgLi4uL2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheV9kcml2ZXIuY8KgwqAgfMKgIDIgKw0KPiDCoC4uLi9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5X2lycS5jwqAgfCA4NA0KPiArKysrKysrKysrKysrKysrKyst
DQo+IMKgLi4uL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfaXJxLmjCoCB8wqAg
NyArLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgNzQgKy0tLS0tLS0tLS0tLS0tLQ0KPiDCoC4uLi9ncHUvZHJtL3hlL2Nv
bXBhdC1pOTE1LWhlYWRlcnMvaTkxNV9pcnEuaCB8wqAgNiArKw0KPiDCoC4uLi94ZS9jb21wYXQt
aTkxNS1oZWFkZXJzL2ludGVsX3BtX3R5cGVzLmjCoMKgIHwgMzQgLS0tLS0tLS0NCj4gwqAuLi4v
eGUvY29tcGF0LWk5MTUtaGVhZGVycy9zb2MvaW50ZWxfZ21jaC5owqDCoCB8IDE0ICstLS0NCj4g
wqBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS9leHQvaTkxNV9pcnEuY8KgwqDCoMKgIHwgNTAg
LS0tLS0tLS0tLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS9leHQvaTkxNV9pcnEu
aMKgwqDCoMKgIHwgNTggLS0tLS0tLS0tLS0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
aXNwbGF5LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICstDQo+IMKgMTAgZmls
ZXMgY2hhbmdlZCwgOTcgaW5zZXJ0aW9ucygrKSwgMjM1IGRlbGV0aW9ucygtKQ0KPiDCoGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUvY29tcGF0LWk5MTUtaGVhZGVycy9pOTE1
X2lycS5oDQo+IMKgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS9jb21wYXQt
aTkxNS0NCj4gaGVhZGVycy9pbnRlbF9wbV90eXBlcy5oDQo+IMKgZGVsZXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L2V4dC9pOTE1X2lycS5oDQo+IA0KDQo=
