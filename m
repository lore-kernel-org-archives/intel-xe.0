Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4ECC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 18:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBF510E052;
	Wed, 29 Nov 2023 18:33:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6CC10E052
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 18:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701282799; x=1732818799;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iD9zumXPhU7ApvQM+9ITnxRHJicR59YzryZ2WVlIhd0=;
 b=cC76JKK/9bL39GBTzEIiqsSJVWlK5fnEq5qhs65VcS/yEyeKb5ZLzFlK
 wrukbYZm/9IRG3IuqA6783n+hX9P4WLBp/ZjjBjjuFfPERzXrpEf7kzkc
 aQzt16OP5dFsmrffjKJvwuTdIX+Hrn/7U7NznKeldgkZpvvkhNwdp08ap
 JLfaUGx4eQJnpj3UYapMHmQx+xbSe9vx8ZHSPBV0ePHzlo1sBHIrQ1sKg
 HOLR/7QXDZVkU0XBAA6VBqkPWXYzKlqatqUOc92iAvpbmrCOfeU7Sez9q
 4H5okkpzZob7SvCLyfr4h3BWZI3F4cs1FpCzPGtm574MPd0pq67DkTPM2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="396017492"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="396017492"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 10:33:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="839527498"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="839527498"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 10:33:18 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 10:33:18 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 10:33:18 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 10:33:18 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 10:33:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZ0T5fsiRL0NXFjFxEnf2ua0o7Nk7M5v0HVAUsq1jLC6se1Fj41b5NCpdzCtXMSIOJJ7PoSlfN+zRAm8QjLoz1QajTgm6ldvAlXdMsCda2v8kXFdXtUtWSlLDor/hkR3ytvjIEtI1WpTndBKXbiPe7PIDm3rkX5lcxVQVCYTgRkZKvsX3yTSGCWEpoFlkJy8UFEf/EMN3+2QMP0jWuyvZXHdrongdXkVfLpd+p1g2tNmtB7bjuW7QzqtRstLWtI7Yivxv6ItmiJU6XpUrIS0LXCBuIEa5MJCsWSVgPMPgn1LAbJUUOFAudGLSvf0nNS7aey/ui3SOjllUf0enjRhJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iD9zumXPhU7ApvQM+9ITnxRHJicR59YzryZ2WVlIhd0=;
 b=HOjHURfHu/Jae/uyExVuGs4yRGw71lrHKIkf6zXFWMC3ZM7u98uXlTm2eXMeELDwGYrVPxbzSz4o17Cc+z1UnbAo8lefQHHyIGy5TGV0A9/YYoVJ9/L7LizTFEr0NUjQyHb9Q7RdiqNiCFxwWTsZhuRs7RoVZWri8xTYtaI9VNYSIZb0FfVuklu+EoalEbu3/hLGN55XVPyzzHEerIyrneilxL5ZOajBY/UF79YLma1mjX8Isf2fLWifVox17yC5+efvA/n3+17+S4NVpYOrLReeRG6a//3r4H3ltYM5EOnWTXec4+wIOWUKsDcXRnR6nyMQRqEsf8VYeWj3nMoKgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB5117.namprd11.prod.outlook.com (2603:10b6:a03:2d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 18:33:15 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 18:33:15 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [PATCH v2 10/14] drm/xe/uapi: Crystal Reference Clock updates
Thread-Index: AQHaHVGk2KvVqWZVUkO2II+SgPW7TrCJ0BIAgAeQYQCAAEntAA==
Date: Wed, 29 Nov 2023 18:33:14 +0000
Message-ID: <2ad7220f89f99b267373bf46b4561dd405fca0a2.camel@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-11-francois.dugast@intel.com>
 <e5871895301ff0053323d5f83eb46275bf4ac45e.camel@intel.com>
 <ZWdF5KXfDAxEU8Oe@fdugast-desk.home>
In-Reply-To: <ZWdF5KXfDAxEU8Oe@fdugast-desk.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB5117:EE_
x-ms-office365-filtering-correlation-id: 1a51d9f8-9baf-42f8-70e0-08dbf109a613
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HZJ+F3QQ6ss6etVSDlAAlgSoffZ+bXf+d561yeRu0+J9FHA4Nz3mKpOtg3Ki7Vt9JRoetG9VvqcD31ZBmiAF4Kqkrn2PoY33kdypXo1EtaEZO8upo7Bfq01xM4Z7PsLqXRolx8vemFs6p/E4qF9plymVu/xGmVwixG7SstJFNQp/yt/R4FzCf9nigEeFbD5ghUBVcRtpts0opUGlxvaWR/PBMWK0MiH5Nrq8czA8lRLlaXDwGN0+eu248ZpWTtkLKhONLczourLmf2EfBWhtl7SpUTQhH7pVTYwPfSBHAyIP2tEjnPudHPnQ9tTMglvOCmSobjncSXO3pAjJhCcyNx3aUvT13Z+/qPoUjhi696/uhQAO7XJo3e4G8VOo3E94DHH84XwtNxkykCO2YN8292i+hwvKErxzZtcnk3lP/GeXrRlmj4AQF0RDD88gW3Sy5Tb2hwkaNhWEK4aOVfuk4lJJe02l7K7GaHVkckWogu0RBF5ZsKsIcilsyQKnuWCiLi1iYAeXHubbxg5BKUx0NlaPsV3vq428Fg8FGaJYhCBmj0T4DppH3ZM3Gii2cmauYKMSt+SDdpO7qwtun5Q/Uua0MCfyHPkAapvSnOaBBl+SehlX+6Fp6XdmEXrkWYFH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(39860400002)(346002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(82960400001)(36756003)(83380400001)(86362001)(122000001)(38100700002)(91956017)(6636002)(66556008)(316002)(76116006)(66946007)(66446008)(37006003)(6486002)(64756008)(66476007)(8676002)(478600001)(4001150100001)(5660300002)(6862004)(41300700001)(38070700009)(4326008)(8936002)(2906002)(26005)(2616005)(6506007)(71200400001)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEs2ZHhnYmIwRTh4Mkx2ZGN4V3lLTFVzVG9WWWUwTGtaKzcyYk9BZTN1OVVR?=
 =?utf-8?B?OG1uSmdIdEJGc042ZEs0S205ZnhVS01kL01vQmp5SEpmRklENmNYek5jdGhW?=
 =?utf-8?B?UUZ5dnhNVDdBNUhlRnZ5MEhGM0U0Z2wvZHlSZ3FWNis5TXQ2aDY1ZHlXdWFx?=
 =?utf-8?B?RXpTanRWalBGS3VwRHZlaDJ3OTdCc09XWDl6UWFLWTVIeHFNZnJHcll3c0Fv?=
 =?utf-8?B?OXExUlNwRXYwd05uOWtiQXJITlVjMTZsUGVCYXhsbFl4bGxKblhSRlA0YnVB?=
 =?utf-8?B?OFAzLy9KUkdBQ3pGcEtvd28yYXFBOE04U0RRNkhrUDdlREFBZFdFN01LZ2Iw?=
 =?utf-8?B?S0gxRldzU1ArZlhJYWVHWGRabWdWWUNtT2JqM3RrS1h2aUFiSmtOQjZZL1U0?=
 =?utf-8?B?T3REci9QVkxkZE1iM0FnM3dYVXI2eXJUdUh2TXA3MWxySUJxRzlPK0tEUHNZ?=
 =?utf-8?B?dlNFMUlCSDJ3aWdlb1RxQitlNTdYcUowOCtkZmJBalVkb2RMRTVDaUJ5Y25C?=
 =?utf-8?B?S1pBMlIrdEVRcHFNSlpuUzNkMlVuNWxOdjJjazlKYnVXRUtFTHJMS2Uxa0pH?=
 =?utf-8?B?L0FqK3krSWw3NS9yNXRjN1k3bGFDZEhFQjdoVzdieWRMYWNXK3JMSTlaRmFk?=
 =?utf-8?B?Z3BtUTJWL2ExUkg0OXM3dlAxZkJzMk5SaFdjYmp6Vm1rdURUQXVMT0J1L3Fq?=
 =?utf-8?B?TDBzaWxzWWI5SDZIcmVtbU1WR0JFZlFyUzNLM0pSM21xMDVaNXNpN0pJSnBQ?=
 =?utf-8?B?OWFJYzVWYzZLbEVCSWk4WGl0QW81b1dFdWk3N21SVGFmTitYY21saC9kQXFW?=
 =?utf-8?B?TnhzbmFKYk9YNmZuVUxLL1g4S2I0Z0JGWTlrMEtXMU5uL1E1SExIMUlEUTJa?=
 =?utf-8?B?T3BseHUwYnY5Si9aZGc1WFZ1enNpWVFLaGhCOUl6L2U4U3V2ZWJOOFR0cUtW?=
 =?utf-8?B?aEROUmhZU2xyWVh6SzdRV002NTFJcm9id3huTmF6ODk1RlpZRnliYWtBcG1P?=
 =?utf-8?B?ZnZhbGVjVXYwTzluMytNdmdrMG8vRkJhbDNwTEJUVVo1WU5Tb3FQZlI5ZTJ5?=
 =?utf-8?B?R25GU294d1Fpdkk2WWtJb3Faa2l0MDlSR0FQajFFY3JxdE83NWF1YVZIV0lZ?=
 =?utf-8?B?YUlKRnVNVU5QMnlLaW04TFpyUVk1L3krQThNWStvTUQ5ajBWU0hsNmxleUxq?=
 =?utf-8?B?Qmd6UlBhTzJDaC9nTVV3dXBqRzZTZm9TWERsOHNwQ2YybElzdmdwdzZGeEFo?=
 =?utf-8?B?N0twbS9VZmhScktyTnFGQ3Z5c3BZK1Izd2xUMEU4VXZmaE9GWVlTaVB5aXNM?=
 =?utf-8?B?ekJJeGNiNThNUklJSXVBUWlWdE5TemVCNXpWWlE5TUk4OTl0ZGFlWjU3dkht?=
 =?utf-8?B?NmRVeTZWYTFGbFRKK2hORXVKdjRpaGp2U3NwVVpIQUJMdWFFYkJxc0QwRE9n?=
 =?utf-8?B?MytWZVdHUG9vL29ZOWhIWTZGczN3RkdZNzd2QkltZFFYZWRTdzh1RDlHeUdK?=
 =?utf-8?B?SmpGZWQ3cVJYeG52OHdxdFNSQzQ4M0RjRUlxbXZERmtPQWtYN2dDbWMvQUxj?=
 =?utf-8?B?WnFodm9lLzFGa2p3N3JYVmpXV1FVNHRPQmNBSEZGSW1wVHYwNTVObnRzM2FW?=
 =?utf-8?B?b2h2aDZ0RmdybUYyR1k2amtleGlvQ0x1WjFGdVpkRFJ3bzBjK1oraXZ4cWVQ?=
 =?utf-8?B?K2dHVDdJWFByTlh1aU9NU0dxdjRxdDg3TDdDd1VBdG1NVUFxNU5zbmNKOHdO?=
 =?utf-8?B?K2hQZzI3ZjVqM3NLZGJDanF4MS9QSnBVa0ErVWR3NzlZc2E3RHpTWU9RS1My?=
 =?utf-8?B?Sk9zRzlSSFRtczEzdWpydnFIbFZCOGdad0hEUjcvOEMyUTNYenlySFp5SWlX?=
 =?utf-8?B?b0J0ZTFIbTFRQ1NIZURzSjJubXA5bkY4eG5MUGJ6OGVacGxDaXhoKzgvTWFE?=
 =?utf-8?B?alN4Z3pOZmc4dU9vSFhKMC9jaVlDaFFwUFdWQW1NdzI4cHhqeTh3UGc2ZzV6?=
 =?utf-8?B?b2lRVFlsTFVTdEttczNwWlJvdjlXNmpGM3F6Tzk3ckg5dFF2OHNZK1FtV25z?=
 =?utf-8?B?WDNWcTRqQm9va2RMd0RhZlJScXZXZ1pOKzBhbnh4b2I2anBEOHFNUmlVb1pG?=
 =?utf-8?B?b014eUJxNE9vQldrdWdOVE5vM0h2YjJ0UWIzcGVrOUV3VUtZRGlQb1d6MjRu?=
 =?utf-8?B?Vnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E8E14C2A971A6478A4E66ACC05DE467@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a51d9f8-9baf-42f8-70e0-08dbf109a613
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 18:33:14.5967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A3aERpVVvS+6JDJDGzlP2sjtSfwFGsbXfuooqoPCKWudcmMT3kpWeolQ9+sTeMkzt/Q2yj3oNIu6ZSRL6uXeWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5117
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 10/14] drm/xe/uapi: Crystal Reference
 Clock updates
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTExLTI5IGF0IDE1OjA4ICswMTAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IE9uIEZyaSwgTm92IDI0LCAyMDIzIGF0IDA3OjM4OjA0UE0gKzAxMDAsIFNvdXphLCBKb3Nl
IHdyb3RlOg0KPiA+IE9uIFdlZCwgMjAyMy0xMS0yMiBhdCAxNDozOCArMDAwMCwgRnJhbmNvaXMg
RHVnYXN0IHdyb3RlOg0KPiA+ID4gRnJvbTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50
ZWwuY29tPg0KPiA+ID4gDQo+ID4gPiBGaXJzdCBvZiBhbGwsIGxldCdzIHJlbW92ZSB0aGUgZHVw
bGljYXRpb24uDQo+ID4gPiBCdXQgYWxzbywgbGV0J3MgcmVuYW1lIGl0IHRvIHJlbW92ZSB0aGUg
d29yZCAnZnJlcXVlbmN5Jw0KPiA+ID4gb3V0IG9mIGl0LiBJbiBnZW5lcmFsLCB0aGUgZmlyc3Qg
dGhpbmcgcGVvcGxlIHRoaW5rIG9mIGZyZXF1ZW5jeQ0KPiA+ID4gaXMgdGhlIGZyZXF1ZW5jeSBp
biB3aGljaCB0aGUgR1RzIGFyZSBvcGVyYXRpbmcgdG8gZXhlY3V0ZSB0aGUNCj4gPiA+IEdQVSBp
bnN0cnVjdGlvbnMuDQo+ID4gPiANCj4gPiA+IFdoaWxlIHRoaXMgZnJlcXVlbmN5IGhlcmUgaXMg
YSBjcnlzdGFsIHJlZmVyZW5jZSBjbG9jayBmcmVxdWVuY3kNCj4gPiA+IHdoaWNoIGlzIHRoZSBi
YXNlIG9mIGV2ZXJ5dGhpbmcgZWxzZSwgYW5kIGluIHRoaXMgY2FzZSBvZiB0aGlzDQo+ID4gPiB1
QVBJIGl0IGlzIHVzZWQgdG8gY2FsY3VsYXRlIGEgYmV0dGVyIGFuZCBwcmVjaXNlIHRpbWVzdGFt
cC4NCj4gPiA+IA0KPiA+ID4gdjI6IChTdWdnZXN0ZWQgYnkgSm9zZSkgUmVtb3ZlIHRoZSBlbmdp
bmVfY3MgYW5kIGtlZXAgdGhlIEdUIGluZm8gb25lDQo+ID4gPiBzaW5jZSBpdCBtaWdodCBiZSB1
c2VmdWwgZm9yIG90aGVyIFNSSU9WIGNhc2VzIHdoZXJlIHRoZSBlbmdpbmVfY3MNCj4gPiA+IHdp
bGwgYmUgemVyb2VkLiBTbywgZ3JhYmJpbmcgZnJvbSB0aGUgR1RfTElTVCBzaG91bGQgYmUgY2xl
YW5lci4NCj4gPiA+IA0KPiA+ID4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRl
bC5jb20+DQo+ID4gPiBVbWVzaCBOZXJsaWdlIFJhbWFwcGEgPHVtZXNoLm5lcmxpZ2UucmFtYXBw
YUBpbnRlbC5jb20+DQo+ID4gPiBDYzogSm9zZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+
DQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZp
QGludGVsLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNv
aXMuZHVnYXN0QGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndF9jbG9jay5jIHwgIDQgKystLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dF90eXBlcy5oIHwgIDQgKystLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5j
ICAgIHwgIDggKy0tLS0tLS0NCj4gPiA+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICAg
ICB8IDExICsrKystLS0tLS0tDQo+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDE4IGRlbGV0aW9ucygtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d0X2Nsb2NrLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfY2xvY2su
Yw0KPiA+ID4gaW5kZXggMjVhMThlYWFkOWM0Li45MzcwNTRlMzFkNzIgMTAwNjQ0DQo+ID4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfY2xvY2suYw0KPiA+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d0X2Nsb2NrLmMNCj4gPiA+IEBAIC03NSwxMSArNzUsMTEgQEAgaW50
IHhlX2d0X2Nsb2NrX2luaXQoc3RydWN0IHhlX2d0ICpndCkNCj4gPiA+ICAJCWZyZXEgPj49IDMg
LSBSRUdfRklFTERfR0VUKFJQTV9DT05GSUcwX0NUQ19TSElGVF9QQVJBTUVURVJfTUFTSywgYzAp
Ow0KPiA+ID4gIAl9DQo+ID4gPiAgDQo+ID4gPiAtCWd0LT5pbmZvLmNsb2NrX2ZyZXEgPSBmcmVx
Ow0KPiA+ID4gKwlndC0+aW5mby5yZWZlcmVuY2VfY2xvY2sgPSBmcmVxOw0KPiA+ID4gIAlyZXR1
cm4gMDsNCj4gPiA+ICB9DQo+ID4gPiAgDQo+ID4gPiAgdTY0IHhlX2d0X2Nsb2NrX2N5Y2xlc190
b19ucyhjb25zdCBzdHJ1Y3QgeGVfZ3QgKmd0LCB1NjQgY291bnQpDQo+ID4gPiAgew0KPiA+ID4g
LQlyZXR1cm4gRElWX1JPVU5EX0NMT1NFU1RfVUxMKGNvdW50ICogTlNFQ19QRVJfU0VDLCBndC0+
aW5mby5jbG9ja19mcmVxKTsNCj4gPiA+ICsJcmV0dXJuIERJVl9ST1VORF9DTE9TRVNUX1VMTChj
b3VudCAqIE5TRUNfUEVSX1NFQywgZ3QtPmluZm8ucmVmZXJlbmNlX2Nsb2NrKTsNCj4gPiA+ICB9
DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmggYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaA0KPiA+ID4gaW5kZXggZDNmMjc5MzY4NGUy
Li41NmIwZjIyZWU3OGQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3RfdHlwZXMuaA0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgN
Cj4gPiA+IEBAIC0xMDcsOCArMTA3LDggQEAgc3RydWN0IHhlX2d0IHsNCj4gPiA+ICAJCWVudW0g
eGVfZ3RfdHlwZSB0eXBlOw0KPiA+ID4gIAkJLyoqIEBpZDogVW5pcXVlIElEIG9mIHRoaXMgR1Qg
d2l0aGluIHRoZSBQQ0kgRGV2aWNlICovDQo+ID4gPiAgCQl1OCBpZDsNCj4gPiA+IC0JCS8qKiBA
Y2xvY2tfZnJlcTogY2xvY2sgZnJlcXVlbmN5ICovDQo+ID4gPiAtCQl1MzIgY2xvY2tfZnJlcTsN
Cj4gPiA+ICsJCS8qKiBAcmVmZXJlbmNlX2Nsb2NrOiBjbG9jayBmcmVxdWVuY3kgKi8NCj4gPiA+
ICsJCXUzMiByZWZlcmVuY2VfY2xvY2s7DQo+ID4gPiAgCQkvKiogQGVuZ2luZV9tYXNrOiBtYXNr
IG9mIGVuZ2luZXMgcHJlc2VudCBvbiBHVCAqLw0KPiA+ID4gIAkJdTY0IGVuZ2luZV9tYXNrOw0K
PiA+ID4gIAkJLyoqDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1
ZXJ5LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiA+ID4gaW5kZXggOGJmMGZl
NmIwOWUwLi43N2NhYjY2ZDMzN2YgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcXVlcnkuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMN
Cj4gPiA+IEBAIC0xNDcsOCArMTQ3LDYgQEAgcXVlcnlfZW5naW5lX2N5Y2xlcyhzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSwNCj4gPiA+ICAJaWYgKCFod2UpDQo+ID4gPiAgCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gPiA+ICANCj4gPiA+IC0JcmVzcC5lbmdpbmVfZnJlcXVlbmN5ID0gZ3QtPmluZm8uY2xvY2tf
ZnJlcTsNCj4gPiA+IC0NCj4gPiA+ICAJeGVfZGV2aWNlX21lbV9hY2Nlc3NfZ2V0KHhlKTsNCj4g
PiA+ICAJeGVfZm9yY2Vfd2FrZV9nZXQoZ3RfdG9fZncoZ3QpLCBYRV9GT1JDRVdBS0VfQUxMKTsN
Cj4gPiA+ICANCj4gPiA+IEBAIC0xNjQsMTAgKzE2Miw2IEBAIHF1ZXJ5X2VuZ2luZV9jeWNsZXMo
c3RydWN0IHhlX2RldmljZSAqeGUsDQo+ID4gPiAgCXhlX2RldmljZV9tZW1fYWNjZXNzX3B1dCh4
ZSk7DQo+ID4gPiAgCXJlc3Aud2lkdGggPSAzNjsNCj4gPiA+ICANCj4gPiA+IC0JLyogT25seSB3
cml0ZSB0byB0aGUgb3V0cHV0IGZpZWxkcyBvZiB1c2VyIHF1ZXJ5ICovDQo+ID4gDQo+ID4gdGhl
IGNvbW1lbnQgaXMgcmVsZXZhbnQgdG8gdG8gb3RoZXIgcHV0X3VzZXIoKSBjYWxscy4NCj4gDQo+
IEluZGVlZCwgaXQgd2lsbCBiZSBiYWNrIGluIHRoZSBuZXh0IHJldmlzaW9uLg0KDQpXaXRoIHRo
YXQ6DQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGlu
dGVsLmNvbT4NCg0KPiANCj4gRnJhbmNvaXMNCj4gDQo+ID4gDQo+ID4gPiAtCWlmIChwdXRfdXNl
cihyZXNwLmVuZ2luZV9mcmVxdWVuY3ksICZxdWVyeV9wdHItPmVuZ2luZV9mcmVxdWVuY3kpKQ0K
PiA+ID4gLQkJcmV0dXJuIC1FRkFVTFQ7DQo+ID4gPiAtDQo+ID4gPiAgCWlmIChwdXRfdXNlcihy
ZXNwLmNwdV90aW1lc3RhbXAsICZxdWVyeV9wdHItPmNwdV90aW1lc3RhbXApKQ0KPiA+ID4gIAkJ
cmV0dXJuIC1FRkFVTFQ7DQo+ID4gPiAgDQo+ID4gPiBAQCAtMzgzLDcgKzM3Nyw3IEBAIHN0YXRp
YyBpbnQgcXVlcnlfZ3RfbGlzdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IGRybV94ZV9k
ZXZpY2VfcXVlcnkgKnF1ZXJ5DQo+ID4gPiAgCQllbHNlDQo+ID4gPiAgCQkJZ3RfbGlzdC0+Z3Rf
bGlzdFtpZF0udHlwZSA9IERSTV9YRV9RVUVSWV9HVF9UWVBFX01BSU47DQo+ID4gPiAgCQlndF9s
aXN0LT5ndF9saXN0W2lkXS5ndF9pZCA9IGd0LT5pbmZvLmlkOw0KPiA+ID4gLQkJZ3RfbGlzdC0+
Z3RfbGlzdFtpZF0uY2xvY2tfZnJlcSA9IGd0LT5pbmZvLmNsb2NrX2ZyZXE7DQo+ID4gPiArCQln
dF9saXN0LT5ndF9saXN0W2lkXS5yZWZlcmVuY2VfY2xvY2sgPSBndC0+aW5mby5yZWZlcmVuY2Vf
Y2xvY2s7DQo+ID4gPiAgCQlpZiAoIUlTX0RHRlgoeGUpKQ0KPiA+ID4gIAkJCWd0X2xpc3QtPmd0
X2xpc3RbaWRdLm5lYXJfbWVtX3JlZ2lvbnMgPSAweDE7DQo+ID4gPiAgCQllbHNlDQo+ID4gPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0v
eGVfZHJtLmgNCj4gPiA+IGluZGV4IDg1YjBhZmZjOWY4OS4uYTk0Yzc1MTQ1MGQ1IDEwMDY0NA0K
PiA+ID4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gKysrIGIvaW5jbHVk
ZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gQEAgLTI4MCw4ICsyODAsOCBAQCBzdHJ1Y3QgZHJt
X3hlX21lbV9yZWdpb24gew0KPiA+ID4gICAqIGluIC5kYXRhLiBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5
X2VuZ2luZV9jeWNsZXMgaXMgYWxsb2NhdGVkIGJ5IHRoZSB1c2VyIGFuZA0KPiA+ID4gICAqIC5k
YXRhIHBvaW50cyB0byB0aGlzIGFsbG9jYXRlZCBzdHJ1Y3R1cmUuDQo+ID4gPiAgICoNCj4gPiA+
IC0gKiBUaGUgcXVlcnkgcmV0dXJucyB0aGUgZW5naW5lIGN5Y2xlcyBhbmQgdGhlIGZyZXF1ZW5j
eSB0aGF0IGNhbg0KPiA+ID4gLSAqIGJlIHVzZWQgdG8gY2FsY3VsYXRlIHRoZSBlbmdpbmUgdGlt
ZXN0YW1wLiBJbiBhZGRpdGlvbiB0aGUNCj4gPiA+ICsgKiBUaGUgcXVlcnkgcmV0dXJucyB0aGUg
ZW5naW5lIGN5Y2xlcywgd2hpY2ggYWxvbmcgd2l0aCBHVCdzIEByZWZlcmVuY2VfY2xvY2ssDQo+
ID4gPiArICogY2FuIGJlIHVzZWQgdG8gY2FsY3VsYXRlIHRoZSBlbmdpbmUgdGltZXN0YW1wLiBJ
biBhZGRpdGlvbiB0aGUNCj4gPiA+ICAgKiBxdWVyeSByZXR1cm5zIGEgc2V0IG9mIGNwdSB0aW1l
c3RhbXBzIHRoYXQgaW5kaWNhdGUgd2hlbiB0aGUgY29tbWFuZA0KPiA+ID4gICAqIHN0cmVhbWVy
IGN5Y2xlIGNvdW50IHdhcyBjYXB0dXJlZC4NCj4gPiA+ICAgKi8NCj4gPiA+IEBAIC0zMDksOSAr
MzA5LDYgQEAgc3RydWN0IGRybV94ZV9xdWVyeV9lbmdpbmVfY3ljbGVzIHsNCj4gPiA+ICAJICov
DQo+ID4gPiAgCV9fdTY0IGVuZ2luZV9jeWNsZXM7DQo+ID4gPiAgDQo+ID4gPiAtCS8qKiBAZW5n
aW5lX2ZyZXF1ZW5jeTogRnJlcXVlbmN5IG9mIHRoZSBlbmdpbmUgY3ljbGVzIGluIEh6LiAqLw0K
PiA+ID4gLQlfX3U2NCBlbmdpbmVfZnJlcXVlbmN5Ow0KPiA+ID4gLQ0KPiA+ID4gIAkvKioNCj4g
PiA+ICAJICogQGNwdV90aW1lc3RhbXA6IENQVSB0aW1lc3RhbXAgaW4gbnMuIFRoZSB0aW1lc3Rh
bXAgaXMgY2FwdHVyZWQgYmVmb3JlDQo+ID4gPiAgCSAqIHJlYWRpbmcgdGhlIGVuZ2luZV9jeWNs
ZXMgcmVnaXN0ZXIgdXNpbmcgdGhlIHJlZmVyZW5jZSBjbG9ja2lkIHNldCBieSB0aGUNCj4gPiA+
IEBAIC0zODIsOCArMzc5LDggQEAgc3RydWN0IGRybV94ZV9ndCB7DQo+ID4gPiAgCV9fdTE2IHR5
cGU7DQo+ID4gPiAgCS8qKiBAZ3RfaWQ6IFVuaXF1ZSBJRCBvZiB0aGlzIEdUIHdpdGhpbiB0aGUg
UENJIERldmljZSAqLw0KPiA+ID4gIAlfX3UxNiBndF9pZDsNCj4gPiA+IC0JLyoqIEBjbG9ja19m
cmVxOiBBIGNsb2NrIGZyZXF1ZW5jeSBmb3IgdGltZXN0YW1wICovDQo+ID4gPiAtCV9fdTMyIGNs
b2NrX2ZyZXE7DQo+ID4gPiArCS8qKiBAcmVmZXJlbmNlX2Nsb2NrOiBBIGNsb2NrIGZyZXF1ZW5j
eSBmb3IgdGltZXN0YW1wICovDQo+ID4gPiArCV9fdTMyIHJlZmVyZW5jZV9jbG9jazsNCj4gPiA+
ICAJLyoqDQo+ID4gPiAgCSAqIEBuZWFyX21lbV9yZWdpb25zOiBCaXQgbWFzayBvZiBpbnN0YW5j
ZXMgZnJvbQ0KPiA+ID4gIAkgKiBkcm1feGVfcXVlcnlfbWVtX3JlZ2lvbnMgdGhhdCBhcmUgbmVh
cmVzdCB0byB0aGUgY3VycmVudCBlbmdpbmVzDQo+ID4gDQoNCg==
