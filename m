Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12063C6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 15:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF49510E17B;
	Fri, 24 Mar 2023 15:20:15 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F08710E17B
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 15:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679671214; x=1711207214;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iLfEgN6jyXIjKj5epe0aBTOaXe1acrnlfHEOnE6LpOg=;
 b=c4b1O/+XjbTYp1DesKGPHlp0yQUpM0Ask3U51p4o4K9APcYe1Vvt2xka
 K4nUNdUmfCbNXR6pvc7kbIUN1bo44AvBe/Nepd2q6RGSyrQ5p4dWCnJe8
 Z+IDVig6s18rYaKIGdVQv+OSk+saISyz9aevz7/poePd5bCU/zklEyLTb
 8XfsOp9VVNmaukUzyY+/9JrjunZjXgVfZWyVXRiCRF26ShYzzhjw+IS5b
 MU7Lp97W4uMIO4Pq6s0LU3Nyq2VqJTHlSC04OIL+QY2oRIkPFw26VpekC
 TJyD2OCT0AbahVRZWngmyIiu/dozLWhCaUPVRZ+duOhU3jOBAxKCREvqq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="338522860"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="338522860"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 08:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="713106926"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="713106926"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 24 Mar 2023 08:20:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:20:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 08:20:12 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 08:20:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUrf78C2XFPE7NRLBdEImG+55oKUg+Iafd32eu6K+UxHq2UkRu+iXwLcJUvRArIDp0hLJsQy4Bja2uDwcrXCOToRcVb4JIzV2/Nmr5/Wut1TNe/6cs8N8fD20HC1O6O3yzvsrZZomn3s2o9/MccKQOstiwQ0gO6hs4QVrXdKjH7Z63b409I7Q8LFK1bJ5XHv/2obTmQMdOyL814KN2dfbx/FXJOOnzELAbUVK/wN/uqDhGldamveYN1Xzmmjz1i8+ijxaC+1LQxf5E+SFqaD/NP1ZfAW1SrEGJgT5d77GrVu/haSMo5XPDY8U9rH2B1toQi/1pC7pfkIND15ojAVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLfEgN6jyXIjKj5epe0aBTOaXe1acrnlfHEOnE6LpOg=;
 b=FlTy+YWxi0+YOQ0tuTacBpCCUXKyzHzsg2xwXNc4w0NAOIjZnf7O/fpRrqGwHjOqJlLnH/qIR2LX35DVIwyomeOL9bkThKfH4UMIBqnGN1dGErcj9p7iHZ/fqBFbntKzMdAx7xQQbAbYIiZ0JgRJbg/s9KudbP0jnAl5dtFXE1Ke+oze1Eiu++2pxSFZ0cnXjP6eoout6epSlFxckbwIJQ+lpNssXmy54ARboi+cl/NskYDpyl+Ynal6FrpJVY3jlPn1v18gcZY0DvlwfuyehBesf5al/pDw1Hu+nY0ule6bq218FAUQtgMIesdEKo0VcQLMTXpvjwU4KZj4SqC8lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY4PR11MB2054.namprd11.prod.outlook.com (2603:10b6:903:2d::9)
 by SA3PR11MB7463.namprd11.prod.outlook.com (2603:10b6:806:304::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.39; Fri, 24 Mar
 2023 15:20:10 +0000
Received: from CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b]) by CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b%10]) with mapi id 15.20.6178.038; Fri, 24 Mar
 2023 15:20:10 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Thread-Topic: [PATCH v2 3/6] drm/xe/query: restrict system wide accounting
Thread-Index: AQHZXX8OrKaIaZsG70qcD5tuy9Vq/q8KDT2A
Date: Fri, 24 Mar 2023 15:20:10 +0000
Message-ID: <2f04bd63ea8c9f9353eeaf539335a8547f3dd86a.camel@intel.com>
References: <20230323115926.391900-1-matthew.auld@intel.com>
 <20230323115926.391900-4-matthew.auld@intel.com>
In-Reply-To: <20230323115926.391900-4-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR11MB2054:EE_|SA3PR11MB7463:EE_
x-ms-office365-filtering-correlation-id: 5b3ed3e3-01fe-4cb5-dd90-08db2c7b4247
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YEt+27DwLXeDZ/X06HAa7lj7MaRQtH9rW4E4sHRtupwx5s79bcSD7U+MxkURsPtDHyiCpzCsl8HAvHTkSXYpZyw2jLhA0yMkvRqtu01+sINyEjbdHvx2vUzrjbVhK6pf2w18WziJragd+B+HPVAC3Xe3HFFxMlA4FpzMqYiRf2/n5DWsvsQPnp+FY6k/mfEz1pD6D7gdYRKUBBknnoPNtFMcpVFbeEl50S8KQxKpb8jlcWtgdAiQcuYwWejsiOM6XjoCMdUWrxuFguo2xew6iG42xbu4qCRTCu0J672niyi3zRjEDIUHHOhMPJDk4JUnOojZpxtz1f5uE7YcIxdynVA28rHYybS2x65IMRe80fwzK7+f1K6wAoua+FcamtcTKys9ynFNS6WQphqCOH1zTJ29B4LZRrHmJnRJYbGmWhKcC+DhvnNs3JuISElX9Ten/EBALRmPkGW4kMxumoFeCOIwgrX/SILc0ipeKTCYuP40VauWyHiFlRjaODSbVr+WQ1JgpsYkU82ZLLAiyGxWMSDjMzccVDEgkLQn+WTKx3EpMbF9HdBCRgPGae+IcyfWp5cCaLeMlseySP7cY0Ossr02NcrOW/U4s/MM4jzbAS3IuqN9NyDMEbaUAHWnF3Qe8iQX6fF3AQf3cgXpeiCf9Mn2B0LXct1GUsGI90pAXRJ96ibLnBlQnt/CTTxYeP+NoLRoRHC6Q/zPvblhN27Rkg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB2054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199018)(82960400001)(6486002)(36756003)(66476007)(110136005)(38100700002)(66556008)(6636002)(54906003)(478600001)(66946007)(76116006)(91956017)(66446008)(2906002)(8676002)(64756008)(38070700005)(316002)(4326008)(2616005)(66574015)(186003)(122000001)(71200400001)(41300700001)(15650500001)(8936002)(86362001)(83380400001)(5660300002)(26005)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ulk1WVQvb0Izb3FmS3k3dUpPclJocVExYW1wTEZpUS85TE5CWnZITURnY0hM?=
 =?utf-8?B?S1hmTTVOanJCSk5GM0liL1JMU2h2dkUrT2o1bEJKTXJyWWMvNmZ4RWNtVlhO?=
 =?utf-8?B?V2pJNUJZVk9ZS1ltMUxnWlQvSU1YRlNYOG9zakQ2Q3pmRlpTSHIyL1liYWxG?=
 =?utf-8?B?RjRacmI3M1hBZzFTeFIwTDFEVDgwREhCK2JoMHlubFhZU1RyRWlpNVdSRG43?=
 =?utf-8?B?R3JyTlZDNjdDd0g4OGdnUGtoNHp6VGFtQkpLcUp0TTJISGdZeUFVOGNZWmwx?=
 =?utf-8?B?ZDhlTGYxVExId2p1Rk4xUWx1UTRTTHBsWDIreUlyYUZWSTI0UThwOC91aVRk?=
 =?utf-8?B?RHZRZmJDUEpqVmZTV0xJYVl6bzE4NUw5R2ZLNzkzZUp0d2dzazRPL3J1SkFa?=
 =?utf-8?B?eE5Cb1ppbGZ2eGhJU05ROS9IOFJOUU1FZFhNeEQ2NUcrVEZHNDlLV3l4SmFG?=
 =?utf-8?B?WG5Nb0ZLdWY4LzlFc2kwZWFZUW44L2pyV285TWpQRER3NE9RMmg2TENtMVQv?=
 =?utf-8?B?ZjNEWnA3Kzk0YmxlZTlXS0NPeDI1dGs4ZnlCaGFPY2dRSGQ0Qm11K2pzT2lh?=
 =?utf-8?B?OUhmbGpkUHlUYW50UkhTci9qQzFTVHA5cVFkLy9odFdmT1pDSnlyc0VGa3hI?=
 =?utf-8?B?Vms1OElDQXdqWnNOeThIeVpzRER0UFh6L2FhbmlmZU9TOFA4RWRTeGJmalRt?=
 =?utf-8?B?bWh5YXBxT091Y1I3NXN3ZUI0Nld5UUVja2JkZE1SeWxCZ1ZUNjV5ODZnN2JH?=
 =?utf-8?B?YVRVOGZ2TjBpaGRoSEhXOWpEdEF3NmlETkZOTnpQc3ZVUURGam9hYmIxK2RY?=
 =?utf-8?B?U3MvS1hHL3NjWkhyVWZuV0IrQmwwMEd5NHNITERtK2VBNnZXT1Z6Z2lEVDJ5?=
 =?utf-8?B?SnhJWSs4aUlFNFRYaktMUlRqSitPQkRHK3phc0xjK0swT3Z4N00xK3RDc1E3?=
 =?utf-8?B?bkJNV3lwWUQ3Mm9SL0U4dGIxSndXZWdFNFlpeGdScUo5NXBhZ2JQaUVrUys5?=
 =?utf-8?B?d0xFWWZwZk9mNzFZU080TVl5YjVXNUhzOFdZZ1FLNFkrSWZjVVFLakc1M1RJ?=
 =?utf-8?B?U1pEK25rRU1CSmYwYWd5QVlWYWpUZDNVeExuNGxGKytoUENieFVaS1BqYmxQ?=
 =?utf-8?B?a0FTY1B1T2dndWZUZUZwb2FjWjlWT2lnODVCWTB6TzlXS2lQT2ZJNDQ5OFBa?=
 =?utf-8?B?ZWdwTDFFTncrNFZqWnNxOEVhV2dGZTNGMGtnZVRIeUhFOVl3Q1FWbG1WZzh3?=
 =?utf-8?B?YUx1cEZhL1oxTTFtNUVjeENwR09IYlpKSnVzWSs3eExmbUJleEF3ZnVTc080?=
 =?utf-8?B?aGJJT0pNL25Ka2VKOXRmbEFsVENCdEFBUmxjVDhHeXowZkR1a0RraUkrVDdh?=
 =?utf-8?B?NUNQS1h1M3ZEZEdHTnV3SGRWV3UrL1RMeVcrRktJWTlvd1owdlVMdkFoQnRR?=
 =?utf-8?B?WWhBejE1a1ViQlk3dGp6cDgreXhqeVluTDhHUTNsL2hqb0djK1R2RWYyVzVq?=
 =?utf-8?B?a0xVOG12aUJtdFNQS1VGbTB1dmo0NFF6eUNDTEo4WCtvYWtVKzViSDRTa0dD?=
 =?utf-8?B?dnBSU3lUSTNoNWJjdkMvdzVFRU9ZekRzZmNIdWVMU2JJcWdPUnMzZUlIU095?=
 =?utf-8?B?T3NaUEFWTkZIZWtyRDk5QkZWbnhjaFpNUTBHMTQ3TEZzeFY3eVZIMG03MUtx?=
 =?utf-8?B?SGVZYUFBMExaMUFONlNhNzVUcjY1R3VzcGpVUldKTlFJK2h3MVpmTjRRZ1pQ?=
 =?utf-8?B?ZUNoR3NWOVBLK2QvM0h0UnQ5dDRSdnRDK05CMjBHWTVYbDg0RGZ5bS9KN2N5?=
 =?utf-8?B?eXlrVXd0am9hOE5VaUh6UFJkUTdXMkVTUjZLMHRxL1N2aS93T1JWaWRsVUw5?=
 =?utf-8?B?UDE3dFl5M0NkajJRMit2ci82bXJQbW93RFR1SkNHTkNLd2ViaURHbmVjSWlQ?=
 =?utf-8?B?di9kVUFUVmpSbUxnRmdleDFUTUZlM0hHVHB3SklRWndOY25lODJZNi9oWVNT?=
 =?utf-8?B?QWUyd0E1UkQxVmV5NGI0aWpyeDVMekszRTRFb1RoOW5kWlJrb1U3Z2lNMklo?=
 =?utf-8?B?eHpwTjJUYjUvMU15TkpQT0lGRHFhQjJaZWFnbWFza25acmJIeGp3NEZyVDVn?=
 =?utf-8?B?YzVTUGUxcUlqL3Z5aVJlK3N1ZGQzVFRNS1haaUhrdHNsaXN2Ty9wVWNFN1Nl?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F97B747E7FF1F745A7305A467E6EA5EE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB2054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3ed3e3-01fe-4cb5-dd90-08db2c7b4247
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2023 15:20:10.7194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fj3fcQYp1+dnlvt8CtWW5HwMIPnob0yabePGlCYDllD43qoZkasskIlGhT3DDn8NZWByiwA4gISAIxciUsSzfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7463
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/6] drm/xe/query: restrict system wide
 accounting
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
Cc: "Hazubski, Filip" <filip.hazubski@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>, "Zhang, Carl" <carl.zhang@intel.com>, "Yu,
 Effie" <effie.yu@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTAzLTIzIGF0IDExOjU5ICswMDAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IFNpbmNlIHRoaXMgaXMgY29uc2lkZXJlZCBhbiBpbmZvIGxlYWsgKHN5c3RlbSB3aWRlIGFjY291
bnRpbmcpLCByYXRoZXINCj4gaGlkZSBiZWhpbmQgcGVyZm1vbl9jYXBhYmxlKCkuDQo+IA0KDQpS
ZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+
DQoNCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29t
Pg0KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVs
LmNvbT4NCj4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4Lmlu
dGVsLmNvbT4NCj4gQ2M6IEd3YW4tZ3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNv
bT4NCj4gQ2M6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiBD
YzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+IENjOiBG
aWxpcCBIYXp1YnNraSA8ZmlsaXAuaGF6dWJza2lAaW50ZWwuY29tPg0KPiBDYzogQ2FybCBaaGFu
ZyA8Y2FybC56aGFuZ0BpbnRlbC5jb20+DQo+IENjOiBFZmZpZSBZdSA8ZWZmaWUueXVAaW50ZWwu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIHwgMTcgKysrKysr
KysrKysrKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5j
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gaW5kZXggMGY3MDk0NTE3NmY2Li45
ZmY4MDZjYWZjZGQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IEBAIC0xMjcsNyArMTI3
LDEwIEBAIHN0YXRpYyBpbnQgcXVlcnlfbWVtb3J5X3VzYWdlKHN0cnVjdCB4ZV9kZXZpY2UgKnhl
LA0KPiAgCXVzYWdlLT5yZWdpb25zWzBdLm1pbl9wYWdlX3NpemUgPSBQQUdFX1NJWkU7DQo+ICAJ
dXNhZ2UtPnJlZ2lvbnNbMF0ubWF4X3BhZ2Vfc2l6ZSA9IFBBR0VfU0laRTsNCj4gIAl1c2FnZS0+
cmVnaW9uc1swXS50b3RhbF9zaXplID0gbWFuLT5zaXplIDw8IFBBR0VfU0hJRlQ7DQo+IC0JdXNh
Z2UtPnJlZ2lvbnNbMF0udXNlZCA9IHR0bV9yZXNvdXJjZV9tYW5hZ2VyX3VzYWdlKG1hbik7DQo+
ICsJaWYgKHBlcmZtb25fY2FwYWJsZSgpKQ0KPiArCQl1c2FnZS0+cmVnaW9uc1swXS51c2VkID0g
dHRtX3Jlc291cmNlX21hbmFnZXJfdXNhZ2UobWFuKTsNCj4gKwllbHNlDQo+ICsJCXVzYWdlLT5y
ZWdpb25zWzBdLnVzZWQgPSB1c2FnZS0+cmVnaW9uc1swXS50b3RhbF9zaXplOw0KPiAgCXVzYWdl
LT5udW1fcmVnaW9ucyA9IDE7DQo+ICANCj4gIAlmb3IgKGkgPSBYRV9QTF9WUkFNMDsgaSA8PSBY
RV9QTF9WUkFNMTsgKytpKSB7DQo+IEBAIC0xNDQsOCArMTQ3LDE2IEBAIHN0YXRpYyBpbnQgcXVl
cnlfbWVtb3J5X3VzYWdlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiAgCQkJCVNaXzFHOw0KPiAg
CQkJdXNhZ2UtPnJlZ2lvbnNbdXNhZ2UtPm51bV9yZWdpb25zXS50b3RhbF9zaXplID0NCj4gIAkJ
CQltYW4tPnNpemU7DQo+IC0JCQl1c2FnZS0+cmVnaW9uc1t1c2FnZS0+bnVtX3JlZ2lvbnMrK10u
dXNlZCA9DQo+IC0JCQkJdHRtX3Jlc291cmNlX21hbmFnZXJfdXNhZ2UobWFuKTsNCj4gKw0KPiAr
CQkJaWYgKHBlcmZtb25fY2FwYWJsZSgpKSB7DQo+ICsJCQkJdXNhZ2UtPnJlZ2lvbnNbdXNhZ2Ut
Pm51bV9yZWdpb25zXS51c2VkID0NCj4gKwkJCQkJdHRtX3Jlc291cmNlX21hbmFnZXJfdXNhZ2Uo
bWFuKTsNCj4gKwkJCX0gZWxzZSB7DQo+ICsJCQkJdXNhZ2UtPnJlZ2lvbnNbdXNhZ2UtPm51bV9y
ZWdpb25zXS51c2VkID0NCj4gKwkJCQkJbWFuLT5zaXplOw0KPiArCQkJfQ0KPiArDQo+ICsJCQl1
c2FnZS0+bnVtX3JlZ2lvbnMrKzsNCj4gIAkJfQ0KPiAgCX0NCj4gIA0KDQo=
