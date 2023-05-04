Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9035BC7EE21
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 15:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F64C10E16C;
	Thu,  4 May 2023 15:30:56 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B8510E16C
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 15:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683214254; x=1714750254;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=1u4x7obFlaTA8/RmuI6Z4OtfBeZTEWdLT3Ifd46MyuE=;
 b=fimUD/K10RlfIIkiboLKyI1RqC9IWgBU04C1frYZGhyfYCpIq4l5LxIE
 hsTq9eEtmfDdskbZPcHr07JpnQldhS3Z48cLPK7GtDyLjIHsW304Z9GHD
 mns9T81vcVV7V31XPH0g56rTL/dvY525+b+k1lGSSy+YLMTTYtmaNQLS7
 AFPeJM9egNSEuFnjoJRvzlXEB8PXTnCmANwAQ4w/nFZHpKVpciMWrv6fm
 5vOfkrxT2zTbxF25qHudOzpwghWnaa4hwvUB/KTaQ2EW3QgepKI0tS5T3
 CiKwgmbYwfDyEdwSZYD/su5p3TZ+ODFP/T9+ABMXWPhod4LVZ4n3BDPAr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="412173518"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="412173518"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 08:30:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="647374632"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="647374632"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 04 May 2023 08:30:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 08:30:50 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 08:30:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 08:30:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 08:30:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARX8BLwT9PgvuL8I4Xw0dYfK6V9lkm3cta80gEIo7Dg1sL6X1jW9JH4voYv1b1WN1feqFWWItMIGkUdk5zmXD7NNmOR6+g+8m5uZnHW6UE5UTlRjw+RQdiKw4hzgWx+5WNQqtF5Vqye+X6evHBeUO8csg2BxRru2GQsbajJ/JA3rbCdppbL5ubFjbkh4gIIO4ndxMan5Qmzaq42maRX/6J5bfQhbQbXpb4wsAQ5QDsy7c3joi6RSBNnEac0FHSY0GhEdvcKaLoydt1TTMbc2G9KITS6Hx3zCMglVmTDoVFi2ds+l0VHTlZxV25xsD1xCcduOOWR4KBILiA9bk+WCJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1u4x7obFlaTA8/RmuI6Z4OtfBeZTEWdLT3Ifd46MyuE=;
 b=gChAtdYlSgXTKlHSrh5RHUqtqpdlvX6sWwlIKslHsPptFLzu1vMamEQZsV1AFH3l/PXZ9csR1JhAf59oig+SkZrK8DJKy9pYd7obdMSlR8fCa+lJaqju6xUOETnJ39MkqGYfBHgbX2cjYtdRnABKnscHkYIKMroK39ixc7vbmBnkVymt+RPQE+K+4c7IMfuIDiwyYiRuhY9gYrXC0XrYK/88uMhqAMRO3ujuByFoz/wU/tZ3PWWYiAZsc7uPhg/6DTmuYJTTv34G749KTNPD4F2aIxSvmS7VPElI30so/rbLpRtlmY87QhEAU5UPMifA7JO5moPYlReyISX6MmX7nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CYYPR11MB8330.namprd11.prod.outlook.com (2603:10b6:930:b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 15:30:48 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 15:30:48 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 7/7] drm/xe/guc: Port workarounds to OOB infra
Thread-Index: AQHZflrJqH7DE5Ib6Eq/3YVeS8QSP69KPhIA
Date: Thu, 4 May 2023 15:30:48 +0000
Message-ID: <d7865dca6ea77cfa8274129f584f2074e7291894.camel@intel.com>
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
 <20230504073250.1436293-8-lucas.demarchi@intel.com>
In-Reply-To: <20230504073250.1436293-8-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CYYPR11MB8330:EE_
x-ms-office365-filtering-correlation-id: 544d162f-f08b-4c0b-f7d4-08db4cb4892a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mQYetO8TasLaFHwTES69uzaCZ8AGeT74W+vu5is+JabYFFExqSXoC5q5LZd1w95WSLziZTG3bnKdt6omtWaaxQaQnAChO+TL7yF7xbMrSIRQP699V1g8PY8UagU7jtss/1fKTU8pqVS8lOTgNJgoDxOTX0dPpteWYp69EuZtSVAvhYVeKLnynIY8LwiJ3hBH8sFOHESmktuJfI07Ec7Iir93TgZfIr5k1NSp5E4cMFD8Hu0vrbWPVY/6l7rxsVofX6K5V47VtTn2bcRdjmBVL6aTVApwGT2/40YUZHX4kUhc/7UyuRJHB5E9S7M8f91pl029+OZaMSq2yJuU9KXw6yGbF3dnAtPOk785dC1GAnvh7rdWer+7OiMZUt38XUNJurUQi47NLAesWoQ/KJ1g6+Fq7+t6FcS3PFVtCJba4UyWFJcQ/XVJJd1r1ezjlN3gwlUQyJJ8iyhDoCCQzIZsW8bvAsWo5+1mvTjbL+VfTNIVvphq39tyyfLg5YQOcBiFKqlYNmz7HlmFiT9FwqPHKvJB7lH6/XcfQTl5QRj/j2o4/CekLR9t2k8vqGDYeKHv2IHQDEb/dwP5DqsjqpsQnK+EWE2M5AqamPL3G7+Hwy68TL12XvSyPMAUKGOtgoZd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199021)(41300700001)(38070700005)(91956017)(6506007)(6512007)(26005)(478600001)(71200400001)(6636002)(86362001)(6486002)(2616005)(36756003)(66556008)(66476007)(66446008)(64756008)(66946007)(76116006)(38100700002)(316002)(186003)(5660300002)(110136005)(83380400001)(2906002)(82960400001)(122000001)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ek5XSDBKSDhBbGpLKzRDeWM2UXNIRXdjTlhVakYyajVuNnZ6dXBDQ0RjQlQ4?=
 =?utf-8?B?c0ttOS96ejhrOERJWVFmYWI4S0FMU3Q5T20xelhBaXR2Tk5BcE11a1NIRjZ5?=
 =?utf-8?B?TmN6VURMQ05mU0UwZ0pWTjI2U2RDcC85ei9OUHdnOU9SMjgzcHlRMHBlV0NY?=
 =?utf-8?B?VXNpL3dFcE00TDhOU0NXcU16ajVwM3oxblNJbU9XVE5nQzZxNnlLK1FXWHlN?=
 =?utf-8?B?OHg5SGdFMVJuOGhJVjhlUGtLeXlQa05DZEl2dFR5QnNuK2xWRm1YU1VOQkJP?=
 =?utf-8?B?R1FVL3ppOFplemhmMnI0RWplL21JRUtxV1ZvWFVTdThjRzRXRDRCd3hnTyto?=
 =?utf-8?B?ZnlqK2Exa1dWNXVWdUlWWnovTTlEWTJBQWpoY3EzTTlxN2xGZkd6ajdHTUlk?=
 =?utf-8?B?V2xzMVRuZ0pYYnZqeGtHZFBzdDJ1cnBqRFNkTzhMRjBkcTdMektCY09nb3g0?=
 =?utf-8?B?MW1WSWpqNEszQkR3TjVKMUhyUmVBUXI3TDQ3ZFdyL0Q4NXdpNVkxZEIyVWMv?=
 =?utf-8?B?V0dwMU1XRTlZWXVzdk91dS9CWUVaUk80VVRPM1Y2NDRPbmxFMkpDMGw3LzJy?=
 =?utf-8?B?bno1L3ptVUZ3SnRlOVoyeFhLS25IRjNBaUVuWkhJRmlkK0NPQUNFdmlwd3Jm?=
 =?utf-8?B?R0puaHdYYXpaaVgxRXhnbThqM0RzZU9seVlrSmZYYno1UjExZTlYT2krb1k1?=
 =?utf-8?B?dlY0U2ZHVWQrVGZWNHgrRXAvdTVxR2EyUG1hNzR0MlBQb1piV095OHlFT1Z0?=
 =?utf-8?B?ejBRVG81cHdRNW1HcUFDN0VtTGNhWHlOYVRZSWptNDFPdXp6WlRjU09IMWxO?=
 =?utf-8?B?V1VaczNtbmdIbzBGZWp0WFM4MTNxWTd4RVc3dm9BN1RSQWpJQlBlbzdMZ0RY?=
 =?utf-8?B?TGdXSjJQVzAvK1RITk53MUZPRVY2MUpxOU9tU1loMkh0T1hxTVR6ODVwckFj?=
 =?utf-8?B?eG4vclFzNE8vTzh2L3lvcXErV2VueHZwMWlOdUk0QTB3NnFYa3Y0M0huamtE?=
 =?utf-8?B?TGQwLzgxR2locVZub0VwZlhlZVpxeFdHRVRmQUdvTWhlc2tmd1RYbDFHT2hE?=
 =?utf-8?B?N3V3R0twOVZLVXFwUWR1MG8wbUg5Um5ucG1paDBlRTJJajlWbW9Sd0dQcy9R?=
 =?utf-8?B?WWkrQytKSDhMSEJBb0FwTTVaOUtNWjFvNnAwM0pFaDRpK2xVb0hLQ3crM2g1?=
 =?utf-8?B?UkNMSkdXS0lzdDhWV1B2NnhyQjhNaEJLUENVdFVyS3ZjMDJZenZKdDcvV2Ew?=
 =?utf-8?B?WkEyd0hleWpoU3BaK3c4MXl6UVd5VzFISGJwM00wNDRhaE1iNjgycnN1S1Rx?=
 =?utf-8?B?K0xrNGtTYXdKT0lkSVM0M3lCUzdhakZFM0V2QmJnNy8rVktlL0hhd1ZjSXhS?=
 =?utf-8?B?cU1OYkdhNjV4ME9JZ2hNazF0NWNNd2Vka0liY3l2VHNoZGF6cmwzUjZBYm15?=
 =?utf-8?B?Y2JVdnZ2ckhrWGwxbEJCVm1YRndjTXAvK0R4aml1NG9TMHJ1RmxiQnVsbTdS?=
 =?utf-8?B?TVhKY1NYTXdNT1dIeGJpdzY4ZWcvVC8zMFJFTGdnc09JZzNRTU11OUk1NVQw?=
 =?utf-8?B?a0c4MS9tNGF6aEJ3dCtMSHkxNUlNcC9nR2JwaUx6WmN6S1R3RXlXelVWVzZ6?=
 =?utf-8?B?K1pDak93eStCNXZLRGFmTFFOREorUGtrMlJ5U1V4RDVTSGFZYkZPcmU3SFZ5?=
 =?utf-8?B?cnIyS0JDVEcxekhFeUVPOENXZDh5ajVSVG9lS3BUbDlId1BkOFdVNkZMYXo0?=
 =?utf-8?B?SEVwSVp1TldzUHdCQnV3THN0bGFULzRKbWNCREZkcStkdm9pVTg0WXVEZiti?=
 =?utf-8?B?YmtSMHVOTVFJZ2JtN1AzdDJJS25NNzhyZjBsTWQzdzhBRlcvU2VvK2VDb3l2?=
 =?utf-8?B?LzEreVJ1YzliWS90ZlRpaS94bDU2ZHNDKzhHUlplZnpnVjd3STFXMy9LclNG?=
 =?utf-8?B?N3ZKRGRaRFYvYnZYdlJvamtDNWZSU2ppY01md3pBdUhObTdieEwyMHowNXNF?=
 =?utf-8?B?QU9sWng3azk5N0tqdGhRaDBoVHF6K0lwdllQSFNCcFZxLzdaRWxzYzd4aE9r?=
 =?utf-8?B?VjFxZHh3b1RxSURndkRiVEZBRHZsdDh0b3dYU2p2UFh2ZXBZS0xncTlFdGta?=
 =?utf-8?Q?PF+wMW0uk1CFDRFK2QVpUK/RW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <67728D3EDFDF024C842F0B17981586F7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 544d162f-f08b-4c0b-f7d4-08db4cb4892a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 15:30:48.1586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O6x+4kc9D8jyF+nO7lKbZQmSw+TeGfwZ4rS3Pdiw6/umL0DBgZlN9LfyDURAfLcz6fsH5kUzNnglQWaPGrSFeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8330
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 7/7] drm/xe/guc: Port workarounds to OOB infra
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

T24gVGh1LCAyMDIzLTA1LTA0IGF0IDAwOjMyIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IExldCB4ZV9ndWMuYyBzdGFydCB1c2luZyBYRV9XQSgpIGZvciB3b3JrYXJvdW5kcy4gT25l
IHdvcmthcm91bmQNCj4gY291bGRuJ3QgYmUgY29udmVydGVkIGR1ZSB0byBubyBzdXBwb3J0IGZv
ciBmdW5jdGlvbiBob29rIGNoZWNrcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIERlIE1h
cmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWMuYyB8IDQwICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjLmMNCj4gaW5kZXggZjdkMzJiNzQ0MjQ3Li5lZWE1ZWQwMTUyODIgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjLmMNCj4gQEAgLTE5LDcgKzE5LDkgQEANCj4gICNpbmNsdWRlICJ4
ZV9ndWNfc3VibWl0LmgiDQo+ICAjaW5jbHVkZSAieGVfbW1pby5oIg0KPiAgI2luY2x1ZGUgInhl
X3BsYXRmb3JtX3R5cGVzLmgiDQo+ICsjaW5jbHVkZSAieGVfcnRwLmgiDQo+ICAjaW5jbHVkZSAi
eGVfdWNfZncuaCINCj4gKyNpbmNsdWRlICJ4ZV93YS5oIg0KPiAgI2luY2x1ZGUgInhlX3dvcGNt
LmgiDQo+ICANCj4gICNkZWZpbmUgTUVESUFfR1VDX0hPU1RfSU5URVJSVVBUICAgICAgICBYRV9S
RUcoMHgxOTAzMDQpDQo+IEBAIC0xMzYsMjkgKzEzOCwyMiBAQCBzdGF0aWMgdTMyIGd1Y19jdGxf
d2FfZmxhZ3Moc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiAgCXN0cnVjdCB4ZV9ndCAqZ3QgPSBndWNf
dG9fZ3QoZ3VjKTsNCj4gIAl1MzIgZmxhZ3MgPSAwOw0KPiAgDQo+IC0JLyogV2FfMjIwMTI3NzMw
MDY6Z2VuMTEsZ2VuMTIgPCBYZUhQICovDQo+IC0JaWYgKEdSQVBISUNTX1ZFUih4ZSkgPj0gMTEg
JiYNCj4gLQkgICAgR1JBUEhJQ1NfVkVSeDEwMCh4ZSkgPCAxMjUwKQ0KPiArCWlmIChYRV9XQSh4
ZSwgIjIyMDEyNzczMDA2IiwgR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgxMTAwLCAxMjUwKSkpDQo+
ICAJCWZsYWdzIHw9IEdVQ19XQV9QT0xMQ1M7DQoNCkp1c3QgYSBzdWdnZXN0aW9uIGJ1dCB3b3Vs
ZCBiZSBiZXR0ZXIgdG8gaGF2ZSB0aGUgd29ya2Fyb3VuZCBydWxlIGRlZmluZWQgc29tZXdoZXJl
IGVsc2UgYW5kIGhlcmUgb25seSBoYXZlICdpZiAoWEVfV0EoeGUsICIyMjAxMjc3MzAwNiIpKScu
DQoNCg0KTWVzYSBub3cgaGFzIHNvbWV0aGluZyBsaWtlIHRoYXQuDQpXZSBoYXZlIGEgUHl0aG9u
IHNjcmlwdCB0aGF0IGdlbmVyYXRlcyBhIEpTT04gZmlsZSB3aXRoIHdvcmthcm91bmQgZGF0YSBm
cm9tIHRoZSB3b3JrYXJvdW5kIGRhdGFiYXNlIEFQSS4NCkR1cmluZyBidWlsZCB0aW1lLCBhbm90
aGVyIFB5dGhvbiBzY3JpcHQgZ2VuZXJhdGVzIHRoZSBpbnRlbF93YS5jIGZpbGUgdXNpbmcgdGhl
IGluZm9ybWF0aW9uIGluIEpTT04sIHNldHRpbmcgYSBiaXQgZm9yIGVhY2ggd29ya2Fyb3VuZCB0
aGF0IGFwcGxpZXMNCnRvIGVhY2ggcGxhdGZvcm0uDQpJbiBydW50aW1lIGl0IGdldCB0aGUgYml0
IGZpZWxkIHdpdGggdGhlIHdvcmthcm91bmRzIHRoYXQgYXBwbGllcyB0byBydW5uaW5nIHBsYXRm
b3JtIG9uIGdpdmVuIHN0ZXBwaW5nLg0KDQpJbiBjb2RlIE1lc2Egd2UgaGF2ZSAnaWYgKGludGVs
X25lZWRzX3dvcmthcm91bmQoZGV2aW5mbywgMTQwMTUwNTU2MjUpKScsIFhlIGttZCB3b3VsZCBw
cm9iYWJseSBuZWVkIGFkZGl0aW9uYWwgY2hlY2tzIGxpa2UgJ2lmIChlbmdpbmUgPT0gQkxJVCAm
Jg0KWEVfV0EoeGUsICJ4eHh4eHgiKSknLg0KDQpUaGlzIHNvbHZlIHRoZSBwcm9ibGVtIHdlIGhh
dmUgd2VyZSB3b3JrYXJvdW5kcyBhcmUgbGVmdCBlbmFibGVkIGluIHBsYXRmb3JtcyB0aGF0IGFs
cmVhZHkgaGF2ZSBhIEhXIGZpeCBmb3IgaXQuDQoNCk5vdCBzdXJlIGlmIHN1Y2ggdGhpbmsgd291
bGQgYmUgYWNjZXB0YWJsZSBpbiBMaW51eCwganVzdCBzaGFyaW5nIHdoYXQgTWVzYSBoYXZlIGRv
bmUuDQoNCj4gIA0KPiAtCS8qIFdhXzE2MDExNzU5MjUzICovDQo+IC0JLyogV2FfMjIwMTEzODM0
NDMgKi8NCj4gLQlpZiAoSVNfU1VCUExBVEZPUk1fU1RFUCh4ZSwgWEVfREcyLCBYRV9TVUJQTEFU
Rk9STV9ERzJfRzEwLCBTVEVQX0EwLCBTVEVQX0IwKSkNCj4gKwlpZiAoWEVfV0EoeGUsICIxNjAx
MTc1OTI1MywgMjIwMTEzODM0NDMiLA0KPiArCQkgIFNVQlBMQVRGT1JNKERHMiwgRzEwKSwgU1RF
UChBMCwgQjApKSkNCj4gIAkJZmxhZ3MgfD0gR1VDX1dBX0dBTV9DUkVESVRTOw0KPiAgDQo+IC0J
LyogV2FfMTQwMTQ0NzU5NTkgKi8NCj4gLQlpZiAoSVNfUExBVEZPUk1fU1RFUCh4ZSwgWEVfTUVU
RU9STEFLRSwgU1RFUF9BMCwgU1RFUF9CMCkgfHwNCj4gLQkgICAgeGUtPmluZm8ucGxhdGZvcm0g
PT0gWEVfREcyKQ0KPiArCWlmIChYRV9XQSh4ZSwgIjE0MDE0NDc1OTU5W210bF0iLCBQTEFURk9S
TShNRVRFT1JMQUtFKSwgU1RFUChBMCwgQjApKSB8fA0KPiArCSAgICBYRV9XQSh4ZSwgIjE0MDE0
NDc1OTU5W2RnMl0iLCBQTEFURk9STShERzIpKSkNCj4gIAkJZmxhZ3MgfD0gR1VDX1dBX0hPTERf
Q0NTX1NXSVRDSE9VVDsNCj4gIA0KPiAgCS8qDQo+IC0JICogV2FfMTQwMTIxOTc3OTcNCj4gLQkg
KiBXYV8yMjAxMTM5MTAyNQ0KPiAtCSAqDQo+ICAJICogVGhlIHNhbWUgV0EgYml0IGlzIHVzZWQg
Zm9yIGJvdGggYW5kIDIyMDExMzkxMDI1IGlzIGFwcGxpY2FibGUgdG8NCj4gIAkgKiBhbGwgREcy
Lg0KPiAgCSAqLw0KPiAtCWlmICh4ZS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9ERzIpDQo+ICsJaWYg
KFhFX1dBKHhlLCAiMTQwMTIxOTc3OTcsIDIyMDExMzkxMDI1IiwgUExBVEZPUk0oREcyKSkpDQo+
ICAJCWZsYWdzIHw9IEdVQ19XQV9EVUFMX1FVRVVFOw0KPiAgDQo+ICAJLyoNCj4gQEAgLTE2OSwy
NyArMTY0LDIwIEBAIHN0YXRpYyB1MzIgZ3VjX2N0bF93YV9mbGFncyhzdHJ1Y3QgeGVfZ3VjICpn
dWMpDQo+ICAJaWYgKEdSQVBISUNTX1ZFUngxMDAoeGUpIDwgMTI3MCkNCj4gIAkJZmxhZ3MgfD0g
R1VDX1dBX1BSRV9QQVJTRVI7DQo+ICANCj4gLQkvKiBXYV8xNjAxMTc3NzE5OCAqLw0KPiAtCWlm
IChJU19TVUJQTEFURk9STV9TVEVQKHhlLCBYRV9ERzIsIFhFX1NVQlBMQVRGT1JNX0RHMl9HMTAs
IFNURVBfQTAsIFNURVBfQzApIHx8DQo+IC0JICAgIElTX1NVQlBMQVRGT1JNX1NURVAoeGUsIFhF
X0RHMiwgWEVfU1VCUExBVEZPUk1fREcyX0cxMSwgU1RFUF9BMCwNCj4gLQkJCQlTVEVQX0IwKSkN
Cj4gKwlpZiAoWEVfV0EoeGUsICIxNjAxMTc3NzE5OFtkZzJfZzEwXSIsIFNVQlBMQVRGT1JNKERH
MiwgRzEwKSwgU1RFUChBMCwgQzApKSB8fA0KPiArCSAgICBYRV9XQSh4ZSwgIjE2MDExNzc3MTk4
W2RnMl9nMTFdIiwgU1VCUExBVEZPUk0oREcyLCBHMTEpLCBTVEVQKEEwLCBCMCkpKQ0KPiAgCQlm
bGFncyB8PSBHVUNfV0FfUkNTX1JFU0VUX0JFRk9SRV9SQzY7DQo+ICANCj4gLQkvKg0KPiAtCSAq
IFdhXzIyMDEyNzI3MTcwDQo+IC0JICogV2FfMjIwMTI3Mjc2ODUNCj4gLQkgKi8NCj4gLQlpZiAo
SVNfU1VCUExBVEZPUk1fU1RFUCh4ZSwgWEVfREcyLCBYRV9TVUJQTEFURk9STV9ERzJfRzEwLCBT
VEVQX0EwLCBTVEVQX0MwKSB8fA0KPiAtCSAgICBJU19TVUJQTEFURk9STV9TVEVQKHhlLCBYRV9E
RzIsIFhFX1NVQlBMQVRGT1JNX0RHMl9HMTEsIFNURVBfQTAsDQo+IC0JCQkJU1RFUF9GT1JFVkVS
KSkNCj4gKwlpZiAoWEVfV0EoeGUsICIyMjAxMjcyNzE3MCwgMjIwMTI3Mjc2ODUgW2RnMl9nMTBd
IiwgU1VCUExBVEZPUk0oREcyLCBHMTApLCBTVEVQKEEwLCBDMCkpIHx8DQo+ICsJICAgIFhFX1dB
KHhlLCAiMjIwMTI3MjcxNzAsIDIyMDEyNzI3Njg1IFtkZzJfZzExXSIsIFNVQlBMQVRGT1JNKERH
MiwgRzExKSwgU1RFUChBMCwgRk9SRVZFUikpKQ0KPiAgCQlmbGFncyB8PSBHVUNfV0FfQ09OVEVY
VF9JU09MQVRJT047DQo+ICANCj4gIAkvKiBXYV8xNjAxNTY3NTQzOCwgV2FfMTgwMjA3NDQxMjUg
Ki8NCj4gKwkvKiBGSVhNRTogY3VycmVudGx5IHRoZXJlIGlzIG5vIHN1cHBvcnQgZm9yIGd0IGNo
ZWNrcyBpbiBYRV9XQSgpICovDQo+ICAJaWYgKCF4ZV9od19lbmdpbmVfbWFza19wZXJfY2xhc3Mo
Z3QsIFhFX0VOR0lORV9DTEFTU19SRU5ERVIpKQ0KPiAgCQlmbGFncyB8PSBHVUNfV0FfUkNTX1JF
R1NfSU5fQ0NTX1JFR1NfTElTVDsNCj4gIA0KPiAtCS8qIFdhXzE1MDkzNzI4MDQgKi8NCj4gLQlp
ZiAoSVNfUExBVEZPUk1fU1RFUCh4ZSwgWEVfUFZDLCBTVEVQX0IwLCBTVEVQX0MwKSkNCj4gKwlp
ZiAoWEVfV0EoeGUsICIxNTA5MzcyODA0IiwgUExBVEZPUk0oUFZDKSwgU1RFUChCMCwgQzApKSkN
Cj4gIAkJZmxhZ3MgfD0gR1VDX1dBX1JFTkRFUl9SU1RfUkM2X0VYSVQ7DQo+ICANCj4gIAlyZXR1
cm4gZmxhZ3M7DQoNCg==
