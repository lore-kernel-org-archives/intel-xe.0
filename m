Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EDBCD54B2
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 11:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D717F10E262;
	Tue, 19 Sep 2023 11:09:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA3610E262
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 11:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695121767; x=1726657767;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=JF/hZwLe1sLjgRxIfDFzqC1QiWE0V27YYK7RnFbANic=;
 b=nocldxFN8faziKdwZZnOlwgzGoSsTO1KPOkqpt7wRWKGszRXnSOz7dwn
 J904NFYg5n3QBFfpTrH7hzn91L4KZvPEkSR0ffL0pidQgx2K+c3vwbKtN
 rAT7Zw4sbLddu1LBK7TJyoJxL1rnVjr7Y92TrBYzZs+JkPlJMTgsG+0YA
 /EX1lf74mZO/q1gOKIl8ZdVq2V0Oh3InbjkR+Fmt2HC6dRUn0ATf6Qxqw
 t1uSzkfumk9BmLJ8mfDb7MX/+1agJv4IaT818GA3QummQJU4LV/kZQDC/
 aHrsenapQrzvumwSEw9nPcjdKk411pnHrnq4nSkSIdH1Cpab90rGEJDTV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="360169711"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="360169711"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 04:09:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775510024"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="775510024"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 04:09:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 04:09:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 04:09:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 04:09:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUKGXrCiDHGBPOMsoGynNFA8ny4hdT2RO8jO0vX40ac8Pf/ewilgteU2WRg9P/sVrVdyYPQ/DVqM0xZE/MPD80DdSfcqDiuGPcvAGGKfpDysUQsY+TLblxI/+7N5dlPnaeI2UPIwc25+3Vt16sAVyVRiyp+k1+lqp1vEu5DK7hnCtZY4iV/PqVt3ljL+vqDUMYyJ/X4/FTrj9u2lls6On0KZhFsPOFFcrao3s1/fTlFW2HXaiGhxPrkTm1jx7FVJai92W2SGCCdDZtw55n8TjTdOU1xAaKjxFiu4Y3dqbUvaVDaKxjYw+BuB7b1OMqgPhU9F6CB4vrVkjOOh7BaXlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JF/hZwLe1sLjgRxIfDFzqC1QiWE0V27YYK7RnFbANic=;
 b=JvXLcKuy04/RY9TlJYiNq/niZBhNkmgfNAaiBoUaznmtWh37Ze7PjDGXzP5xVF4n0l/ElI3mhjfqB83MlODbTYFJvQ/CHBRitLlfvKLApAKgYcM7dOp4mBi9n31IwUJQWQOURhqpYqGlAyARlan7WCFVlMQKdGRXDpdkqPgBQqAuwqDcpfm8xpTpCL7fGDh9UReKw4+ig15rKNy2yloVGMd2fiGC4sXFuUW1wIwC9kBIBQlLDVDsK6pl9LeOgboDsNtyjRif0uCN3LNCfnBBEhPA89h338YON2KPsOJaJJbBveHgTXW2ZJbgaKC5cAHadgDrVEwrxo+h1w6xVbjFuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SN7PR11MB7601.namprd11.prod.outlook.com (2603:10b6:806:34a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 11:09:23 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf%5]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 11:09:23 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/6] Revert "FIXME: drm/i915: include
 intel_frontbuffer.h from skl_universal_plane.c"
Thread-Index: AQHZ58N0dDEA8XNhjES1j3pSzGdzXLAhFP8AgACSwACAABGcAIAASpIA
Date: Tue, 19 Sep 2023 11:09:23 +0000
Message-ID: <b3e4851def300a3ca578ff5c7cac66e2f70b0a60.camel@intel.com>
References: <20230915105724.1025509-1-jouni.hogander@intel.com>
 <20230915105724.1025509-2-jouni.hogander@intel.com>
 <826cdfdb62b6033f60aeaa9d6384b3d92a4e81fc.camel@intel.com>
 <fbdb146cfcea0dd1bb147a669836081cccda7e5c.camel@intel.com>
 <CY8PR11MB777736B25114581AA50586A8F6FAA@CY8PR11MB7777.namprd11.prod.outlook.com>
In-Reply-To: <CY8PR11MB777736B25114581AA50586A8F6FAA@CY8PR11MB7777.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SN7PR11MB7601:EE_
x-ms-office365-filtering-correlation-id: d184d247-9f62-46bf-948a-08dbb900e12f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bzKh4+ODyuqQ3ZOY0wMIsLDBEP/7WS7GS82kiZ7xxB0/MN56btNWmVjXJ/ape79HR9zUHqc9v4Ss4zD0jRh+bJqsNPaiIgLGY5jGp2MBc/uA5EDngHvR8U5VLxAlN1frGDZb7XjTaXKsUrQtsJZbHDa3sI75WM+3TWuktPyPZgSfbK3vd3y56YH2jnoA/+o5uGH4uf3m5OYpjHS/ISDePbC8F/xVxfibFtieJ6nwakcHl8p+OfKh3p11JBjjrzQ1lgZToIkZ2fqukLcP/KsfGzaAaibjz7mVG6Se3emY5JFaZHYSkLTKK5zmXqzFiRsujpxtuE8ku6tdM1P+melZkT9gj2T26/kYGFGrz4zbIULXTQ4OJniZrhRo3ly/oV+Yu4gJkzTuOPVALEljj4Ub0nFWMqUdWxE2P8kHzEMMBHRMivGSsyOahtdx5T+JfPGc4E4bKE/zGgCM7XOw45wUIH/o1maPKGPnskzy0Xe0RT4JxQeBW6cEvAb5L5LJAgqi3UbwVk+5z3z/v/B/6nieT1CrHqeJY2DSVw1G2J60DznZ83NfKjV/+q4FFxaLcpZQBIGVWuihtj8lNhTuqJRv3z2x+SM0KKbwzAxC5PMbAPKoRcGIoHNglV7fowC2m8Kr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(136003)(396003)(186009)(451199024)(1800799009)(6512007)(53546011)(6486002)(6506007)(26005)(66574015)(2616005)(8936002)(8676002)(83380400001)(82960400001)(2906002)(122000001)(36756003)(41300700001)(66476007)(86362001)(64756008)(66446008)(66556008)(66946007)(76116006)(316002)(6636002)(110136005)(38070700005)(38100700002)(91956017)(71200400001)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXJ5QWVLR0VqMFQ4QjhkTEpmYmpPa01xSGlSSU9CSEJGNzcwd1VDS0ZwVEZh?=
 =?utf-8?B?SG1tTWdVVnlENUNSTkRBYzZESXh4dWhnbW5iVTFUdG1VNzJNaDJYVkJsREU1?=
 =?utf-8?B?NFJ1UUd5N01iT010ZU1KcUR5a3dqcWxjalZSbSt6Y3NZSlVpRFY4aTgyN2kr?=
 =?utf-8?B?U0NIZC9abWsxQjROYi9PeE9YZmNFT1hScGlFazdhWkN4RE9hOGdaM1N5YnJm?=
 =?utf-8?B?cytFaElGME5qcnhJQXF4QjgwLzlGbHZaQ3VzZ3IrQjlkOU5rMkhTQndOU1pS?=
 =?utf-8?B?Z1FMTGpxOWQ0Rk5yM2loNWI3MGJQQ09LQmVsOUhYVG0zUVhFMGJNVWJXZkc1?=
 =?utf-8?B?cm8zbHlOZ3FWUVdwMEV0QUpnekxhSi95ZGdLSkdxc2xOYkZyeFBvd2FiWVZh?=
 =?utf-8?B?YzVoQlpyTEZJcE1PUERhWGlkUkpseFBMSDd4elFiVHYwQU43SXh3aXFJR2ln?=
 =?utf-8?B?aGVieVRlQXhWdnRjcGNvcFppVW00anltSlJ2TGpiZ1gyV2VDZnVrbW50aWI2?=
 =?utf-8?B?VjEvazdhUlpXR1BXaFlRWHRrcllNZTczeThUZWR6MHArUnFsUC82bDVTUCs2?=
 =?utf-8?B?RE9INUtxNTBpWE5hTGZxR3VOU2ZTN1RvVTMrazcrdkNjbzFsSEEreVRXMzYw?=
 =?utf-8?B?SDl3d0x5eVBRNDZPL05OZzhWZUZVM3pZV2NENldDcW1CT05pcHFqWEdqTlN2?=
 =?utf-8?B?MzhaSDNxRHlvdC80N2pOb25YNU14bWZBSUVUai9rVGVDL0hFaWVsakRCN3BK?=
 =?utf-8?B?RUw5a2s3Q1EzVGplekFpSC9PTSswUnFBWjJWMzNFN0J6VVNPUnEwaFRTVGVy?=
 =?utf-8?B?UnhodFdvYk8wS2dHN0V6clRMczk4ZnNXdllsc1BWbjlIK0pRMDZwYjZSYjlw?=
 =?utf-8?B?cVFscXpTd1pTTldTN2pCOHZyTUhmSWh0bTVZekdITHA0dFZ6U3I4RlgzRDAv?=
 =?utf-8?B?bFlwVlh2Ukt0SFcvNG96M0RrK0JheS9sVGZ0ZS9aek0vdTUwZUt0WFRuSTkw?=
 =?utf-8?B?Mzg5TityTzArNVh3akxJRnBITzZWYmNPbTRrZXZhY2FzakgwZVUxVEl1Qi9s?=
 =?utf-8?B?RnU5MmJXU2ZTS3dzRDYyOVZNUFNzekwzek1SVDQrSEV6VHROclZqWSt4NVVq?=
 =?utf-8?B?Q3diSnYxSHJPSVR1R2NEeVVBVnJERzdhU1RQVlpTbXBib3h1RkZQZlNRbzhG?=
 =?utf-8?B?SWY1dWp6ZUdTeFcrN0NFWlZYSnJ0ODZXMEdtOGQ3OEpOcVRIenRvVWx4RlZI?=
 =?utf-8?B?Y3Zlb3d0RFhRQkJtU0hrSk9KaTB3UDJOc213bFUrd01JOGJ4OHdxanlZMFcr?=
 =?utf-8?B?Z0xiOUN3RkpTWjhPKzZpYVk2ZDcwVEZidS9maEJSU3pmSU1xQUc3NHRmUjBO?=
 =?utf-8?B?bHVWMTc1UDV3OXJMSTIyNDZqbUFnVFR4aC9iVVN3T25DbzlYci9rZ25DSWFF?=
 =?utf-8?B?cmVPS2xqazZsQVZwMkt5RURWazU2M1FDRkVOZTFPalZ6STBjZGpsb0FndlhX?=
 =?utf-8?B?bmtqTStjZUJYUHBKcGlzVCthN2ZTRTZ0cnNrT2pYVThFbGw5cXpibkI3aThr?=
 =?utf-8?B?K25IZU13UngybUxuWXV5Mm96dEEvTnY5Ykx1cDZYYk0yMGVTZHMrQk9oQ2pr?=
 =?utf-8?B?bW16S3JreElzT2lUdUF0ZFJheGFZam14amNqbFpTRDEydzJQWXBmV1JzNmsy?=
 =?utf-8?B?TmRzVWt4dEhTb0JadURTVkZNdHJlWEdpMzhOTXYybFRVZWhlYWJsVGpZTW1V?=
 =?utf-8?B?R0VFVG5BTkFWMEd4VXF2NFZSMjQ3eDJ0LzJWb1hmMnZWZUIvMUU5U24wNnFr?=
 =?utf-8?B?TFUyRVhSNmNQL2V1N1U1anBScEp1ZUNhTEpCN0dHQi9QUFh3RDcrYytaQmtO?=
 =?utf-8?B?aFMxdTdwa3E4YkxHaTk4TWM2UFZvS1FHUkJiSmV4dHQ0S1RYUGQ3YUpDdyto?=
 =?utf-8?B?MmoxQVBWOWRSUEhKTDlOY2NBRS9SMGk1eUY3ZlZzQTJ6UFdwRGE4Q3VGZmFy?=
 =?utf-8?B?OENYZm1YS0RzYXpCY3ZhK1RSWkpRZmY2SkpvNmovMjFoWmlyM1JCWGVZbXNq?=
 =?utf-8?B?aEp3L2R2eG92M2RzVzcxM2d0cGljNmIyNFpyRmFFR2tJMEFvOHQxYU9heEFX?=
 =?utf-8?B?RjFHcVRiYStQRGU5TWtFc2k3WTh6YTRnM0pMM2JUTWRhODR2Z2VDWlZvMXU2?=
 =?utf-8?B?L2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <031418071F0B4543B6DEDF2D3E03F95A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d184d247-9f62-46bf-948a-08dbb900e12f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 11:09:23.1834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W71kCKl63MCNBxUnJX4aJ4qzvMqoO/Rn/0H9akG4WiR2IAjjuZdRqnIcMQf9oqPZSbybmZhH/JyeBvVCxzoa8NEC5OJJAYTGZW2IAmWU9+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7601
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/6] Revert "FIXME: drm/i915: include
 intel_frontbuffer.h from skl_universal_plane.c"
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

T24gVHVlLCAyMDIzLTA5LTE5IGF0IDA2OjQyICswMDAwLCBHb3ZpbmRhcGlsbGFpLCBWaW5vZCB3
cm90ZToNCj4gSGkgSm91bmkNCj4gDQo+IE9rYXkuIFNlZW1zIHJlYXNvbmFibGUuIFJldmlld2Vk
LWJ5IGlzIGFscmVhZHkgdGhlcmUgZm9yIHRoZSBwYXRjaGVzLg0KDQpUaGFuayB5b3UgVmlub2Qg
Zm9yIHlvdXIgcmV2aWV3LiBUaGVzZSBhcmUgbm93IG1lcmdlZC4NCg0KQlIsDQoNCkpvdW5pIEjD
tmdhbmRlcg0KDQo+IA0KPiBCcg0KPiBWaW5vZA0KPiANCj4gRnJvbTogSG9nYW5kZXIsIEpvdW5p
IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAx
OSwgMjAyMyA4OjM5OjI0IGFtDQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcg
PGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47DQo+IEdvdmluZGFwaWxsYWksIFZpbm9k
IDx2aW5vZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtJbnRlbC14
ZV0gW1BBVENIIDEvNl0gUmV2ZXJ0ICJGSVhNRTogZHJtL2k5MTU6IGluY2x1ZGUNCj4gaW50ZWxf
ZnJvbnRidWZmZXIuaCBmcm9tIHNrbF91bml2ZXJzYWxfcGxhbmUuYyINCj4gDQo+IE9uIE1vbiwg
MjAyMy0wOS0xOCBhdCAyMDo1NCArMDAwMCwgR292aW5kYXBpbGxhaSwgVmlub2Qgd3JvdGU6DQo+
ID4gT24gRnJpLCAyMDIzLTA5LTE1IGF0IDEzOjU3ICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3Jv
dGU6DQo+ID4gPiBUaGlzIHJldmVydHMgY29tbWl0IGMzZTk0MmEwNjQzM2U4YzUzODEwOGYyNGI0
ZmU3OGEwOTI3ZTJhZWEuDQo+ID4gPiANCj4gPiA+IFdlIGFyZSBhYm91dCB0byBiYWNrcG9ydCB1
cHN0cmVhbSBjaGFuZ2VzIHRoYXQgaXMgdGFraW5nIGNhcmUgb2YNCj4gPiA+IGluY2x1ZGluZw0K
PiA+ID4gaW50ZWxfZnJvbnRidWZmZXIuaCBhcyBuZWNlc3NhcnkuDQo+ID4gPiANCj4gPiA+IFNp
Z25lZC1vZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0K
PiA+ID4gLS0tDQo+ID4gDQo+ID4gSGkgSm91bmksDQo+ID4gDQo+ID4gU2hvdWxkIHRoZXNlIHJl
dmVydHMgYmUgbW92ZWQgYWZ0ZXIgdGhlIHBhdGNoIDQgaW4gdGhpcyBzZXJpZXM/DQo+ID4gV29u
J3QNCj4gPiB0aGF0IGNhdXNlIGJ1aWxkIGZhaWx1cmU/IE9yDQo+ID4gdGhlIHBhdGNoIGRlc2Ny
aXB0aW9uIGlzIG5vdCBhY2N1cmF0ZT8NCj4gDQo+IEkgY2hvb3NlIHRoaXMgYXBwcm9hY2ggYXMg
YmFja3BvcnRpbmcgcGF0Y2ggNCB3b3VsZCBoYXZlIGxvdHMgb2YNCj4gY29uZmxpY3RzIGlmIGJh
Y2twb3J0aW5nIGl0IGZpcnN0LiBPbiBuZXh0IHJlYmFzZSBhbGwgdGhlc2UgcGF0Y2hlcw0KPiB3
aWxsIGRpc2FwcGVhciBhbnl3YXlzLg0KPiANCj4gQlIsDQo+IA0KPiBKb3VuaSBIw7ZnYW5kZXIN
Cj4gwqANCj4gPiANCj4gPiBXaXRoIHRoYXQgY2hlY2tlZCwgDQo+ID4gDQo+ID4gUmV2aWV3ZWQt
Ynk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPg0K
PiA+IA0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxf
cGxhbmUuYyB8IDEgLQ0KPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPiA+
ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xf
dW5pdmVyc2FsX3BsYW5lLmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9z
a2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4gPiA+IGluZGV4IDRkMDFjN2FlNDQ4NS4uMmRlZDFiY2Nl
NzU0IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xf
dW5pdmVyc2FsX3BsYW5lLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+ID4gPiBAQCAtMTYsNyArMTYsNiBAQA0KPiA+ID4g
wqAjaW5jbHVkZSAiaW50ZWxfZGlzcGxheV90eXBlcy5oIg0KPiA+ID4gwqAjaW5jbHVkZSAiaW50
ZWxfZmIuaCINCj4gPiA+IMKgI2luY2x1ZGUgImludGVsX2ZiYy5oIg0KPiA+ID4gLSNpbmNsdWRl
ICJpbnRlbF9mcm9udGJ1ZmZlci5oIg0KPiA+ID4gwqAjaW5jbHVkZSAiaW50ZWxfcHNyLmgiDQo+
ID4gPiDCoCNpbmNsdWRlICJza2xfc2NhbGVyLmgiDQo+ID4gPiDCoCNpbmNsdWRlICJza2xfdW5p
dmVyc2FsX3BsYW5lLmgiDQo+ID4gDQo+IA0KPiANCg0K
