Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E8BC4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 16:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5537510E355;
	Mon,  6 Nov 2023 16:31:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C791210E355
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 16:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699288268; x=1730824268;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=bFkncGY24XzAktXyXYeEFKvR2yhPKkRPZC1UwFrad20=;
 b=T1KLMTjQYISCqIsEfXdqxqDRtmmANJiPM6zVJe4T5y6d/ngCcSjuPQjJ
 vpn+HhDNUcFD6TZalwNPL2+pWx1yl0yJTYLwqxpbPf6NlRVwqOC/DWb62
 pZfzO9y/S7L80RgWq7U+H87NH133JkusSEUw7grdBBU4ALnPJ8AR+yOle
 T60sERByk3+vt8UfBIfqxsBqxxFe9KLzmyMHc+Aw16oDWBmKLdigx0301
 7cv1eGUMGhGCoERgGrGLXGKDr3VAEo8BCt0zkg1Ho6rgIrbNYCfl2lqkd
 56g4WhU+7DBOQlS18/2OqE5J8w+mBnXr9CGaynhE+JAi+Bpey7WKylWc5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="420423017"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="420423017"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 08:31:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="853055094"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="853055094"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2023 08:31:07 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 6 Nov 2023 08:31:06 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 6 Nov 2023 08:31:06 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 6 Nov 2023 08:31:06 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 6 Nov 2023 08:31:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHt8qbrGCSwFJBF9NWT+pFrp0ki0w4YaOQWTR+aL/1WmdbY7glICtLYhHT8WZItF2TbbRsKbjFPpdEzuzQstIBbsVAoQNR3xSNCdb6Nb1Scvy2vZ0SFcYJX9KtZUGOiUVt6SKFmn67d/BE4NkiHribC0T4UjGcUL2iJLb2uFzQMBfQfNqDrL3viBHcL57aOACzrdB5wRypxWTMFiQWwfsZmmCxsEzFaCBOgLg1dX8BYw7sh6UAgagLl4+DASNuypxnPmginbK6TP9JRcCOsLWU2Ddve9ni6UWvd2b/yhUmwoLN0xH0xA+Yj6126TeGesQPpwXQf81xL72mjHKQ+0kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFkncGY24XzAktXyXYeEFKvR2yhPKkRPZC1UwFrad20=;
 b=UuYRi2uUErghiCI3AlVx11UF39gf9H1O5T74SuZygTqdyZORiw9DVlZXQdogdu2wx86T69aqJGsA618QOmGVGB3AmdAwBzO+bduM7P7HtSR50fREzmzvDTvqqn3pszDdpDidHi0e6iHsnlMyzdR4cUzVMumvFrjgNx805qL1aVpvx5B+sq365rgQpbOx4UHhLgL7XY7Q5t7u1hQEFBkpzi6KWqksLKT2Vj6OFTnmfhcuEPIqmR+9piLT47cjko4qYOLcBADeuEOq6kKr5pnx6/zhOHzepBEL3dlLxWz0gtqcHp7PO2d/VvkD8gq7JCpvQgisVtsk5RREVRVpvWAirQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 LV8PR11MB8487.namprd11.prod.outlook.com (2603:10b6:408:1ed::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 16:31:04 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::4ada:1428:b59d:fd4f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::4ada:1428:b59d:fd4f%7]) with mapi id 15.20.6954.028; Mon, 6 Nov 2023
 16:31:03 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Mishra, Pallavi" <pallavi.mishra@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Prevent null ptr dereference
Thread-Index: AQHaDpo8Rn016Q03UEGTjIVt6rWdF7BtgA4A
Date: Mon, 6 Nov 2023 16:31:03 +0000
Message-ID: <7702e3a9dd33089049a2fa2253525df54db557a4.camel@intel.com>
References: <20231103211924.426715-1-pallavi.mishra@intel.com>
In-Reply-To: <20231103211924.426715-1-pallavi.mishra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|LV8PR11MB8487:EE_
x-ms-office365-filtering-correlation-id: 44c82c80-606a-449e-afe3-08dbdee5c4be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pDOyE80e0tDqQepLgoohrDbvZEET6PJMVe+Lwr/Wy6EWshkFr5DVMoCZYnM5DVXdRvNGqEkhFQ3sEwjLKbhXpCA/Ear9leKJYdWjX2IjHUcFpzXYa/XHokgE6skN28Tn421/jVaWDpNp1PhsT8SgNJYtFOhgRx6G5AZvwgQGkYIyC0WpZYkNQs9P+ThytjJn2gkiUFCnK38S3ne7E7rKhFM9K71/mY5kqw5WOrFQbfOU8d4t3WFUXICWGhmSH5HO6XLrpf8X/mDL9Cy7pffaiCT8ceKzvqi7JiJ7xvLrubn9tvD3rSJb/M3naZqCG/5Xn443MbdHEAmLazUJdHosq+RFBAfHXWlmfjHNT9RoAXMVvTDrjwAtaCJucMZorr6vUieKf/mL43hKE92Sisacxoj0EXv5XztFVXT3RMxJbFO20Mk0gSPKSD2V/tlmFJaRTmb9SXB8Vd+TjH6xv0JYvkssn+EVg/1r7ZZBbmqsvOQNT5eeyuH8XCVqNYzNBp0RitLdo6bY7ADClJJxGgFNsVXEmDbHJh9zdRa/rxCk0cN2eO3/vcuhfeUi7GRtSb7F4MFIL+hZ3A0Nm8LCFgkXlxSYTQl+8yqAn90oa6S1TcXRi2aQR9xoF535a59c3DGW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(346002)(39860400002)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(38070700009)(36756003)(316002)(8936002)(8676002)(83380400001)(26005)(66476007)(110136005)(64756008)(66946007)(91956017)(66446008)(6636002)(66556008)(5660300002)(76116006)(41300700001)(478600001)(6486002)(6512007)(71200400001)(6506007)(2616005)(2906002)(122000001)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1dpMVozbmRmMWg4RXhBNGdTM3kyVmNCQ0E0QlU2VFA4WU5QRDQ2K3ZiWFVC?=
 =?utf-8?B?YVF6Nmh1YjhnUlhKUk1MTmdWZDdpdWJ2b3p0WTNUZmR5OVJIK2tFYWJ1Uk9G?=
 =?utf-8?B?SUd6WXhFR3JaUTIxNjNxVXBhQnBLNTBFTWcrNmlZaklCcjFhRE0rMHJYL1B1?=
 =?utf-8?B?a0dCdHNjWDFFRXE2OUJHclU4Sks1NkpiTzRZY1YyTmZzVkVwMEJLTDZYZk1Y?=
 =?utf-8?B?UHZBbXpDNUJtQjFXNCtPUW9tSlI2SW1KY01kbWoyTkhvUE0rNTFlV2dYM3Fq?=
 =?utf-8?B?Vkl1clhlWlJyRjJISFFYdnU3SmR2QklkWGdxdmRhS2JhU3ptT09qOUFrNTRu?=
 =?utf-8?B?NnJXQWxtc0hPanZPNGFRb3ZpdENJdExUYlJJSndhdG5JQy9GdExoR2g5UlZk?=
 =?utf-8?B?Nk8yVTAzYmR3cG9STWlFZktrT2g2ZThQT0s5RDNuN0pEaFVsWUZ4cG1IT1Mz?=
 =?utf-8?B?Z2NXemxkQ0htTHpnUVJ5eDlTbEtmTmJ3Z2ZyVUJQL3QzdUZ4RGh3STlHcldO?=
 =?utf-8?B?SG0zdkxwQVRPUVN2cjR0eC8wblZVMTJQSHRUdFdtQUNHZjROSlJDNjVsVVZ4?=
 =?utf-8?B?UDBNYko1TkJwMldPVWVnbnlZTm1HVzVyUVZxNjFSekhrZktzMlRKTm5GMGhG?=
 =?utf-8?B?TkUzVnJmWk1oMkRRU05nelMzNThMS290amNveEYrbG9nNWtqZXh1THZqS1Z1?=
 =?utf-8?B?a3NwbmRlS2c2b1dneE5sVDN3aHBoY1B3LzRsbitpS0VOY3pGRDFJcmwzNnhN?=
 =?utf-8?B?Smlqd3NDM0FxVXI1cnRXbnFjQnd0VUZMTzBpQzFybi9wc0ZrK3d4S0NtelNT?=
 =?utf-8?B?eGdQQ3Q5dlZmQUVQV096c1hhbmRIREpOWFpCNy9KamM2ZmVJeXpTMUZBQXda?=
 =?utf-8?B?bnFKQmdwd3lSbUJYTTc0b1NYMnR5UnRHUlIvN3RnbkE3eDBmWEF4OE9mVVYv?=
 =?utf-8?B?L04rbnpoWThMdTZUU1R6cXlvcnA0Ynd5V1ExZzF6TWpwU1Noa25vaUVLQmta?=
 =?utf-8?B?SDF0Vmk4VGVJZXhmNjJuOC9xWmdWVGJ5NmpTSzJ6NkVyZWtpcktnb2xhRXcr?=
 =?utf-8?B?UCsyZGhtNmZ1c1ZiTWs1azcxYzdNZkxaU0dYNWZGKzJjcEVSTi8xaWZTVmll?=
 =?utf-8?B?aFFBbmZJTlpDVGZFQWVhcDhZbjQvdGswcXptOVVsS1JuWERkcTNTRWNEMStr?=
 =?utf-8?B?bVJMSW1HdmVwTjdlRnk1WG1XaHg0Q1RjS1M3NnE0SjFlSXd0R1VGaTlHbDRC?=
 =?utf-8?B?TjJmZEk2RlpJZXlOSnROa011WE5FN2RqdldhUXYwYmtaK1c2bkcwRmpDcHhr?=
 =?utf-8?B?alZVMmQrWk9FVUZyOWFNUUU2aGcrK3JBdms2WEMwcHlrWWtRMk5HSDBobUgy?=
 =?utf-8?B?ZEVZUlFUZVRac2RKMkkxb3RJMVFLWEpnU1hOUkZia09NYTNQdjVTbTJUdGFU?=
 =?utf-8?B?dHgzNUZqanpkZ2dBbU5LbGJxUkp3SE5jdFUrZVJ4bkxFUFJHM0o1a3d0dzZO?=
 =?utf-8?B?b0t3WWdkbG92WHozaG5rc3pCN0FpY2U3enlUS1FVSVpOVGdyLzgzS2J5eHli?=
 =?utf-8?B?NHhzR2pacU1FM2VVeXdaUVoyTzdvQzU1enJxWFFmVFRVbTlMb1kyQWZnUFV4?=
 =?utf-8?B?VHUwNDMwSUtiWHB3UmNRQzd2ZU9tUDhHM0NpY1Vkc0RvKzVPVm55eEtGckp6?=
 =?utf-8?B?R2xMeUtWRVlDVkY0QjVTRDFtZVgyRFhXUHpkNHYyNVFodmJsZkxJYjNseTA2?=
 =?utf-8?B?VDFKSkJtNmZJNXZXZUkrOVFWeEJwSzZzRzZBRURkMER5cmp5WXFYVmRjTitw?=
 =?utf-8?B?aTRHOVF2UzJFWE5JMVo2QS85VGlBNHo0T2YyaFNkNVppTmxXcEV5K0FlMVpH?=
 =?utf-8?B?OFg4OFNjcSs3RzJwRlR3T0txbWRZVjk2UnBkN2xIMDdZYmUwVXFlblJrN3ps?=
 =?utf-8?B?UlBzSTA0T1R5dEhlRzFMbjQ3VlhVa0pNUHNrWEwwV01NTVE1eWJpS2M1aUQ4?=
 =?utf-8?B?ZUt6bk5takNHRDk4cnVURXlVSVpiZGJWZDVFaGFTREY5OGhhYjRpU1VJS3ZH?=
 =?utf-8?B?RmNrQWVuS2NpUmhYNW9VT1VhTlhhR0l0MUwxNUN1TGhnckk0VllJTXRXT2ZF?=
 =?utf-8?B?cllRUHlxekpiSk1aWjdpTVVvQWRiYTc5TUFFMTR5NFh3MHNNdkZzOC8zOTlr?=
 =?utf-8?B?TVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D53439BE7689A4B83CC6EEB96AC0D55@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c82c80-606a-449e-afe3-08dbdee5c4be
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 16:31:03.2549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nuzPtiq9MZml6sn83C8SiVWtGJ+ZiMhd7YVTMmVX0b5UJCpVYC2DjyQCpV+UolQTlrkZWbhyvXhMUudoa0QX94DBRfcwdzM04IIDDitO2vA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8487
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Prevent null ptr dereference
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

T24gU2F0LCAyMDIzLTExLTA0IGF0IDAyOjQ5ICswNTMwLCBQYWxsYXZpIE1pc2hyYSB3cm90ZToK
PiBJbiBzY2VuYXJpb3Mgd2hlcmUgdm0gaXMgbm90IGluaXRpYWxpemVkLCB1c2UgeGVfbWlncmF0
ZQo+IHRvIGdldCB0aGUgYWRkcmVzcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYWxsYXZpIE1pc2hy
YSA8cGFsbGF2aS5taXNocmFAaW50ZWwuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX21pZ3JhdGUuYyB8IDUgKysrKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X21pZ3JhdGUuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYwo+IGluZGV4IGU2
YTMxZjkwZWJkYi4uZjc5ZWM4ZTRhZTRlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9taWdyYXRlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jCj4g
QEAgLTEyOTYsNyArMTI5NiwxMCBAQCB4ZV9taWdyYXRlX3VwZGF0ZV9wZ3RhYmxlcyhzdHJ1Y3Qg
eGVfbWlncmF0ZQo+ICptLAo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgeGVfdGlsZV9hc3NlcnQodGlsZSwgcHRfYm8tPnNpemUgPT0gU1pfNEsp
Owo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBh
ZGRyID0gdm0tPnB0X29wcy0+cHRlX2VuY29kZV9ibyhwdF9ibywgMCwKPiBwYXRfaW5kZXgsIDAp
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHZt
KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGFkZHIgPSB2bS0+cHRfb3BzLQo+ID5wdGVfZW5jb2RlX2JvKHB0X2JvLCAwLCBw
YXRfaW5kZXgsIDApOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZWxzZQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGFkZHIgPSBtLT5xLT52bS0+cHRfb3BzLQo+ID5wdGVfZW5jb2Rl
X2JvKHB0X2JvLCAwLCBwYXRfaW5kZXgsIDApOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJiLT5jc1tiYi0+bGVuKytdID0gbG93ZXJfMzJfYml0cyhh
ZGRyKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBi
Yi0+Y3NbYmItPmxlbisrXSA9IHVwcGVyXzMyX2JpdHMoYWRkcik7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB9CgpJIGFsc28gc2VlIHRoaXMgaW4gdGhlIHJvdXRpbmUgaW4gcXVl
c3Rpb246CiAgICAgICAgaWYgKGZpcnN0X211bm1hcF9yZWJpbmQpIHsKICAgICAgICAgICAgICAg
IGVyciA9IGpvYl9hZGRfZGVwcyhqb2IsICZ2bS0+cmVzdiwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBETUFfUkVTVl9VU0FHRV9CT09LS0VFUCk7CiAgICAgICAgICAgICAgICBp
ZiAoZXJyKQogICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycl9qb2I7CiAgICAgICAgfQoK
c28gbG9va3MgbGlrZSB3ZSBoYXZlIGEgcG90ZW50aWFsIGZvciB0d28gTlBEcyBoZXJlLgoKQWxz
byBpbiB4ZV9taWdyYXRlX3VwZGF0ZV9wZ3RhYmxlc19jcHU6CiAgICAgICAgaWYgKHdhaXRfdm0g
JiYgIWRtYV9yZXN2X3Rlc3Rfc2lnbmFsZWQoJnZtLT5yZXN2LAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgCkRNQV9SRVNWX1VTQUdFX0JPT0tLRUVQKSkKICAg
ICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FVElNRSk7CgpUaGFua3MsClN0dWFydAoK
