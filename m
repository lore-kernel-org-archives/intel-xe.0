Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A806E7C4E6
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 17:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63DB10E3A2;
	Wed,  4 Oct 2023 17:15:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B365910E3A2
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 17:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696439717; x=1727975717;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8XmVhE2PZzsqqSDdeh/DWdKvsjgVuckMOO/8VTSTBiw=;
 b=C1tFTIaACGcqcwgRvfDDJyyzgg2t+hDhmr+ZepDhxyeyCTpbpPyEQ4CK
 DmcOp8cW66jjtHd1gkILb6ldzML1Kdn6WBVHubkjQhxqqEQCQZZ6Xz8ZC
 g1VOvBgbq4hilU7N0wu8TvoW2HpRRTjRQGdVk4r+7696OpuvpY3xx45q2
 O7gYZcz05UQQlandeRzluohkS0fy0PUzjmAC5z0ZFGSO8/pyZ2IDhUk+h
 LOsYpiyZw47VqKl99FeN9QLQQ4HDqFfgJssCZbByKfyB0SvNeiicp+PbK
 0Xn8TtUwuq8bjb63iJSvNAAJysBBtlnlj2FOJasHjdBSKLi3ZzIzrmvql Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368296847"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="368296847"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="1082592741"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="1082592741"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 10:15:16 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 10:15:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 10:15:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 10:15:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpi60yCo6MsyqXK04Yhv7BStRjSGN6rRqg2+rAws0lvN/qKYbwMz9SpS2X/SKwheHLf+w7ILZ8+Dq+fvVndvujtwtLiCLKZGBhaCH8DwDKzUXy3Z8vgiZXiVt5RHx0OIA9Ri3uO6hIlAkIETl8tmI6KPOUrBwVTfXrQrlp/3424WzsfL4WF6kcQZ+uFKmWq40Xi/4um7W8xuVDfLE1lDHtnQesbWUqKNLqOPNpwr26flT1P6RNlv/MQ5Ld7jB5r8h6HV2Eh2N4/nJ/uRaGxc99lrpiOA6k2clfMoHI2TMef89Q7oLCFsQWki6LUnKfGhGjSsWfCO3cALf6RhgFKCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XmVhE2PZzsqqSDdeh/DWdKvsjgVuckMOO/8VTSTBiw=;
 b=nvqpAc4mCB0DUREhbqeEn23S6gxjidpnMNNL5NrO9mbL9/mCFJkhJQ+0T80Q/4FhGqkJS0XQBA5vqtHayI7uYiQDB1cOvsT5d8KI1cQOC9dBZmYT59PQmSSwNd0kxqWgL9zPPYt5ZHyq1Ox3umkv3lVJ91KfE6VmgsSiE9tvBkqWYHR47rG/oL3Pdf9WXXljlhT/pK8WFMTBwQ3IvQAcZbW0ig+ixXsBbrcLkGV6A4tcvrEoioRxcYZVHvB7ju9rqhZOOaRSJoFmVtjslm+gixoDzDRaYm9dwbXeuXQaxs9ghnhXH/Ip82UC/oT4Gxc5fSTk1HijMA48ElyjRtD8zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MN2PR11MB4568.namprd11.prod.outlook.com (2603:10b6:208:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 17:15:13 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 17:15:13 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 3/3] drm/xe: Remove devcoredump readout of
 IPEIR
Thread-Index: AQHZ9jgT6fB4HexqvUyiIivzTdbrerA53zQAgAABBYA=
Date: Wed, 4 Oct 2023 17:15:13 +0000
Message-ID: <85b1efd2ad0bee2c5ac10e52afd9410cb655ad2c.camel@intel.com>
References: <20231003202728.132545-1-jose.souza@intel.com>
 <20231003202728.132545-3-jose.souza@intel.com> <ZR2cxBinwax6xtM4@intel.com>
In-Reply-To: <ZR2cxBinwax6xtM4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MN2PR11MB4568:EE_
x-ms-office365-filtering-correlation-id: f8444547-505b-4148-86c0-08dbc4fd78e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P+Z+jzDNuz/es6GCLHiLjfNngsD+Ybdw6hBQwKiciO+r99HT4y+jPJhXn4WIt/y2hxz6XPpPh9INvfl1+YLHCcoUINGAP9kRQmOTaq9riYiyPwFXCynME2c09kKsrdamCE/tz912cwTLMF2oeGZFUUTE6IOBY522b65eGt3rHxUHUwMviAbnkSdPjG7vLmxfeCCXW/L4DtvvjTckjMZnJKF6yljTMp/fwylz68qRIlinNafE6bm/HkrK8lQaF7uwecHX5ReBA+pwTj1kLycCBffIHTLWCF4X9o+F4WlooVcj6ut/knl/b1onOgv+yyJrmMGNQzytR5ZkufOGekF0KbXVv5VfFQMgcpD1xKfZSp5Xv4qe+BCrfh9ViM2me5qouM8Mvm0z1Jb6O/PQVR8RbYrJfoRb4Hs/2HvaSpic5SBPp+WBFXOsi1bEEr0piq/xaVHx1uGFsm4styD3wl8MVa7SfvoZo+u2ZZKkkMbCFsgzIT4VtpbQQF6SrEoll66XLAsRDuIiiQaGAtIHuLlrpZNHbc37cpnd6oPdZZ6r7gqW+eMN6a/ffQ3MNbJ7vyEwtgfNE/Dwy+1AouB+KsICYYZq8DtPmws4oce9Ol5YmOEgdgBe4Whfub/BrTMEzQIL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(396003)(346002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(41300700001)(91956017)(37006003)(6486002)(2616005)(6506007)(316002)(6512007)(76116006)(6636002)(66556008)(66946007)(64756008)(66476007)(66446008)(6862004)(8676002)(4326008)(8936002)(71200400001)(5660300002)(26005)(478600001)(2906002)(83380400001)(122000001)(36756003)(38070700005)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVNJdTNEU0ttMnNPeEhOOGhvK05KRTNYOVRoRXF1TUFvL1R1akFnVFhYZ1hJ?=
 =?utf-8?B?YjhubFBCNDNIOWhDQ3FzbXVBYjdkeVExS3JPa21PYWNMMGdJbkdFdkRRRlhh?=
 =?utf-8?B?L2UwRkZVS1RTTEMrNTB4OExyek5pSTRISHVmTmxGT0JUd1dXN3hJT0g3NUJ5?=
 =?utf-8?B?cmxJQzBlLzF1aUFBWjBhVWtKR1hPYU9abDNhMUp1YXNGT0FjUGtHQjh6d2hJ?=
 =?utf-8?B?WGQxZ0N4d2Yrd05NbUxXY1ZlYW80WnVFRStSbXpndzkwN1NMWUxuRUFicFpC?=
 =?utf-8?B?VHRNckJTSnREWDNoZTJ0RzQwekFES1BJczNKVTdFZjhDeFZtK0d4TnZsL0l4?=
 =?utf-8?B?NnA0bTBlc3ZZWjRoVTFMWEhES0t2Q2RiK0pZdnlQUWcrQ1REZ2dpVWRzOHNY?=
 =?utf-8?B?WENFbGV6eTZUWDN5Rit1MXo5UWVyS1ZjU0xEZkN0Q3VINHpHcDh1WnV0TWVs?=
 =?utf-8?B?bXJrVk9NZnJicWQxTG1BZXRPeHNyWVlJUkk0VkRVWHNEOFhaSnNqRUdKa0dj?=
 =?utf-8?B?Mm5QWE00OVdhQnJRSWZweVFiT1JwWWFYR3lGRUMvMFVsQk8yTFgwdlRXTnhm?=
 =?utf-8?B?a0p1MWFvQ1NySVdPV3dVSjlRcjEydUt4UzJzMWdRanQxWUNOMVlxbmtiLzlW?=
 =?utf-8?B?d0tvQVNTdUZ1eW1PWGNBTVJuWERvOW5OTTFOTk44dGJSdHM3SVVLWW8xdnR6?=
 =?utf-8?B?SEpLWVcwNm10aTF3Wm5mNjMrcFZlcUFZVHpQR3NnYVV0RTBMNG12SExZaGwx?=
 =?utf-8?B?OXM0NGQyZklkRVY0TDQzU2JnZ2lFUlJyOVBwQlNRK1EzVEdxVnlsUGVJajgr?=
 =?utf-8?B?SmRrc2Q0NkZEb1pEZ3o4bTNGdy9wSXBoNDZ0d2ZjSzFSNHIwVm9DRDBidDA4?=
 =?utf-8?B?cTVkTmg0TW9TdWxrOCtEMXRlUkRtc2pvUEVaZEFRMVZCZUI3aFYrV3NENDQw?=
 =?utf-8?B?b2ZtMlM3clgrc3ZsZTBMMGMxelhiT244bVQrTWt0eEcyWXJyYmpCTlpHM2RH?=
 =?utf-8?B?ZmgyZTJqZDhXUjJqRDU2bTdldlRnVUhMUi9QUHJIL3hMVGl0T2h3WlhhbXd1?=
 =?utf-8?B?M21zUXp3Z2lhS0lFZE81SFkyUFRnNFI4ODFpNWZtMU1vWDV1VWZTVzh5Q0dB?=
 =?utf-8?B?THJ2ditmcFNBUzUvM3UxU25NQnpXa3ltR3FGOFlRS0tKNHMxbDZwcUFMVHFM?=
 =?utf-8?B?cFRneWRqcFg3cWhwVE1tcnQ5LzdpRDA5YnNFalBZL2FGQzBKYkJzZ1VhN096?=
 =?utf-8?B?ZWgvTlMxeFQxUFZGb0JLQzZIKzEwMnJFaitlUCtaSjUvNzdIZkZTbE9RZ3Zo?=
 =?utf-8?B?aCtVdU1IVnFOS29MVXlMdklZWUhETWNCdG4yOGlHZ05yNTluNVMxQlZTMXNQ?=
 =?utf-8?B?NlQrZUJnbldTcUw0ZWNic1MwbGtUeUxudDA0dkN2ZUxCaTI1bmFUT3QrVS81?=
 =?utf-8?B?Ujg2QU0vWkQ3c3l6K1Y5R0tYcUZKUkNUUDE2cFlOa2dlWFh3WXV0dHBDRUtr?=
 =?utf-8?B?bVZJMG5sQzVwMzRzTnFtWkdCTExZa1BQSmMxRzFmL0tWQXdYU0lFTWtDZTJo?=
 =?utf-8?B?V1M0TU1pNHZqbEpLb1dXRWtFUzl6QXV4OGgvb1IwQzcrV3dWMWh5bEg1Rk5L?=
 =?utf-8?B?K1VWMENkd2NjV1YxOW1lV2FtUVBidnIzR2JDbXNnbkhBWEpPeWxLc1pqTWQx?=
 =?utf-8?B?U2VsdXM0eDRDY0RYWWNXUWptNlJ2WFNJYkdVWVlYVFJpK0JpNEo5MTdMQWpE?=
 =?utf-8?B?UkVMc2Z4QitobmpkbTgrYzY4TStqRE5NNTlNaHh6UHBmaVJaR3VhMzZnVkpV?=
 =?utf-8?B?UXp1dWFDVXRXODUxUHZvdU1lOW81TkIrS0lnVXc2MHIraUJEdm9HYnQzWk0v?=
 =?utf-8?B?a1M0cFprQkJIcjRJb3JVZzdudzNjbHIwWUVIdU1kNWlsTGpoKzFsNG03YmJL?=
 =?utf-8?B?V21aNUtmUThTMlpqcDNPbTBIeTJxc2ZDV3RMVlZGUHJYTHp1RnZSVVJXa2VG?=
 =?utf-8?B?TWY4WUppcUlaNFlnWUU0MDc4YnBHeEZVSmViZUQyL3ZhSk5ZZHo5aGYwcFBL?=
 =?utf-8?B?WlJnb3U0ZVd6UGZDUkl1S3BSSWRwcHptZ01EZWxkay95R0tvYnhLRHNuSFV5?=
 =?utf-8?B?K1VnYUI1YXUzd29SUWY3Qy9uNmJsOWtxaS9CV2x4TlVERmpPVkZiTmg4ampp?=
 =?utf-8?B?NEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFC77B3BF9918142BB120CAC2BB3E830@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8444547-505b-4148-86c0-08dbc4fd78e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 17:15:13.6766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ApcfR2t/STzTdAzy+clsLyHsjEifeCl9QNhGNvxF4whx0jQrMobdLDjITL1mzSvWRBQXTDz6A0AzmtVY5oJDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4568
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Remove devcoredump readout of
 IPEIR
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

T24gV2VkLCAyMDIzLTEwLTA0IGF0IDEzOjExIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFR1ZSwgT2N0IDAzLCAyMDIzIGF0IDAxOjI3OjI4UE0gLTA3MDAsIEpvc8OpIFJvYmVydG8g
ZGUgU291emEgd3JvdGU6DQo+ID4gVGhpcyByZWdpc3RlciBkb24ndCBleGlzdCBpbiBnZngxMiss
IHNvIGhlcmUgZHJvcHBpbmcgdGhlIHJlYWRvdXQNCj4gPiBhbmQgcHJpbnQgaW4gZGV2Y29yZWR1
bXAuDQo+IA0KPiBXaGF0IGFib3V0IHRoZSBSSU5HX0lQRUlSID8gYWxzbyBkb2Vzbid0IGV4aXN0
IGluIG5ld2VyIHBsYXRmb3Jtcz8NCg0KVGhlcmUgaXMgYSBjaGlja2VuIGJpdCBpbiAweDIwNjQu
DQoNCj4gDQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291
emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
eGUvcmVncy94ZV9lbmdpbmVfcmVncy5oIHwgMiAtLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfaHdfZW5naW5lLmMgICAgICAgIHwgMiAtLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
aHdfZW5naW5lX3R5cGVzLmggIHwgMiAtLQ0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDYgZGVsZXRp
b25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hl
X2VuZ2luZV9yZWdzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5o
DQo+ID4gaW5kZXggNzkyZDQzMTE2MWM2OC4uMzVkZDQ4MzdkZDc1ZiAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5naW5lX3JlZ3MuaA0KPiA+IEBAIC0zMSwxMiArMzEs
MTAgQEANCj4gPiAgDQo+ID4gICNkZWZpbmUgUklOR19BQ1RIRF9VRFcoYmFzZSkJCQlYRV9SRUco
KGJhc2UpICsgMHg1YykNCj4gPiAgI2RlZmluZSBSSU5HX0RNQV9GQUREX1VEVyhiYXNlKQkJCVhF
X1JFRygoYmFzZSkgKyAweDYwKQ0KPiA+IC0jZGVmaW5lIFJJTkdfSVBFSVIoYmFzZSkJCQlYRV9S
RUcoKGJhc2UpICsgMHg2NCkNCj4gPiAgI2RlZmluZSBSSU5HX0lQRUhSKGJhc2UpCQkJWEVfUkVH
KChiYXNlKSArIDB4NjgpDQo+ID4gICNkZWZpbmUgUklOR19BQ1RIRChiYXNlKQkJCVhFX1JFRygo
YmFzZSkgKyAweDc0KQ0KPiA+ICAjZGVmaW5lIFJJTkdfRE1BX0ZBREQoYmFzZSkJCQlYRV9SRUco
KGJhc2UpICsgMHg3OCkNCj4gPiAgI2RlZmluZSBSSU5HX0hXU19QR0EoYmFzZSkJCQlYRV9SRUco
KGJhc2UpICsgMHg4MCkNCj4gPiAtI2RlZmluZSBJUEVJUihiYXNlKQkJCQlYRV9SRUcoKGJhc2Up
ICsgMHg4OCkNCj4gPiAgI2RlZmluZSBSSU5HX0hXU1RBTShiYXNlKQkJCVhFX1JFRygoYmFzZSkg
KyAweDk4KQ0KPiA+ICAjZGVmaW5lIFJJTkdfTUlfTU9ERShiYXNlKQkJCVhFX1JFRygoYmFzZSkg
KyAweDljKQ0KPiA+ICAjZGVmaW5lIFJJTkdfTk9QSUQoYmFzZSkJCQlYRV9SRUcoKGJhc2UpICsg
MHg5NCkNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5j
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+ID4gaW5kZXggYzJkYjM5MWNm
MjY3NC4uZjYzYzgyMWJhZWI3NyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfaHdfZW5naW5lLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5l
LmMNCj4gPiBAQCAtNzI3LDcgKzcyNyw2IEBAIHhlX2h3X2VuZ2luZV9zbmFwc2hvdF9jYXB0dXJl
KHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSkNCj4gPiAgCQlod19lbmdpbmVfbW1pb19yZWFkMzIo
aHdlLCBSSU5HX0RNQV9GQUREX1VEVygwKSk7DQo+ID4gIAlzbmFwc2hvdC0+cmVnLnJpbmdfZG1h
X2ZhZGQgPQ0KPiA+ICAJCWh3X2VuZ2luZV9tbWlvX3JlYWQzMihod2UsIFJJTkdfRE1BX0ZBREQo
MCkpOw0KPiA+IC0Jc25hcHNob3QtPnJlZy5pcGVpciA9IGh3X2VuZ2luZV9tbWlvX3JlYWQzMiho
d2UsIElQRUlSKDApKTsNCj4gPiAgCXNuYXBzaG90LT5yZWcuaXBlaHIgPSBod19lbmdpbmVfbW1p
b19yZWFkMzIoaHdlLCBSSU5HX0lQRUhSKDApKTsNCj4gPiAgDQo+ID4gIAlpZiAoc25hcHNob3Qt
PmNsYXNzID09IFhFX0VOR0lORV9DTEFTU19DT01QVVRFKQ0KPiA+IEBAIC03ODQsNyArNzgzLDYg
QEAgdm9pZCB4ZV9od19lbmdpbmVfc25hcHNob3RfcHJpbnQoc3RydWN0IHhlX2h3X2VuZ2luZV9z
bmFwc2hvdCAqc25hcHNob3QsDQo+ID4gIAlkcm1fcHJpbnRmKHAsICJcdERNQV9GQUREUjogMHgl
MDh4XyUwOHhcbiIsDQo+ID4gIAkJICAgc25hcHNob3QtPnJlZy5yaW5nX2RtYV9mYWRkX3VkdywN
Cj4gPiAgCQkgICBzbmFwc2hvdC0+cmVnLnJpbmdfZG1hX2ZhZGQpOw0KPiA+IC0JZHJtX3ByaW50
ZihwLCAiXHRJUEVJUjogMHglMDh4XG4iLCBzbmFwc2hvdC0+cmVnLmlwZWlyKTsNCj4gPiAgCWRy
bV9wcmludGYocCwgIlx0SVBFSFI6IDB4JTA4eFxuXG4iLCBzbmFwc2hvdC0+cmVnLmlwZWhyKTsN
Cj4gPiAgCWlmIChzbmFwc2hvdC0+Y2xhc3MgPT0gWEVfRU5HSU5FX0NMQVNTX0NPTVBVVEUpDQo+
ID4gIAkJZHJtX3ByaW50ZihwLCAiXHRSQ1VfTU9ERTogMHglMDh4XG4iLA0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lX3R5cGVzLmggYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfaHdfZW5naW5lX3R5cGVzLmgNCj4gPiBpbmRleCBjZDRiYzE0MTJhM2ZmLi41
ZDRlZTI5MDQyNDA3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19l
bmdpbmVfdHlwZXMuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVf
dHlwZXMuaA0KPiA+IEBAIC0yMTcsOCArMjE3LDYgQEAgc3RydWN0IHhlX2h3X2VuZ2luZV9zbmFw
c2hvdCB7DQo+ID4gIAkJdTMyIHJpbmdfZG1hX2ZhZGRfdWR3Ow0KPiA+ICAJCS8qKiBAcmluZ19k
bWFfZmFkZDogUklOR19ETUFfRkFERCAqLw0KPiA+ICAJCXUzMiByaW5nX2RtYV9mYWRkOw0KPiA+
IC0JCS8qKiBAaXBlaXI6IElQRUlSICovDQo+ID4gLQkJdTMyIGlwZWlyOw0KPiA+ICAJCS8qKiBA
aXBlaHI6IElQRUhSICovDQo+ID4gIAkJdTMyIGlwZWhyOw0KPiA+ICAJCS8qKiBAcmN1X21vZGU6
IFJDVV9NT0RFICovDQo+ID4gLS0gDQo+ID4gMi40Mi4wDQo+ID4gDQoNCg==
