Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1899C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 14:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C9310E2A1;
	Mon, 27 Nov 2023 14:20:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DE010E2A1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 14:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701094812; x=1732630812;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=otpCvwCapJfBwdoOB4ZQqioOS7LYR3A1qEXgrFLOy5Q=;
 b=ITxmZO/vXXS6kLxsJU/gH3H5mp9umLQMRHliFow4JY8xwbO+VF2KIdMS
 H58IJxyCNhJOaRMhQZ+tnXPA3L7bivKyXYCpSZ6t77hMxsKR8zX2QDs2M
 VQIWE4ecHlVy80851CTurKOGDv8abrqf6q963LnaiHKuTUwb5gYNAAyxa
 vBHBXx1PQXG9ltrbQJNqedSSlET8+JnxlinNO4VUpvZCOShSL7zJswIGh
 bAaX7xl7GV1eFYQVAE3Ubu4dqFQM6d+m7Dx9aSvuipoL9WF0w/l88EkN6
 S6ScSRplLaLRK0q7s7jK6xCRCHPrF7Ml7FuHjRcq49Yf+RselQCb5xIO0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="372870556"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="372870556"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 06:20:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="718047443"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="718047443"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 06:20:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 06:20:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 06:20:05 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 06:20:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zf+aCDc8dSEd2rbqzQ9Dwia5EZVDgS9e+zXmMFFw1LSLDvefBZH3lXW9laq1dcU5MCYmU9lyUT5i84Ano8ALG+9CYYfGD/dNOp9N3bmwchW9tgTnKYjgiRyGeuH0X84LpKWUGw53e49MYHfV5a0MTsZQRd3n/X0xhFC3kdYuRG8yKMJZNEvQqYKnPeFPCZQaMJZzBTQn5k8Hiao7zqs/C0ctcmjg4K4dxHk+V1GheJpI5ywlJOtDYT3Zs7P8c42EYg4y++uvcsrHNVGCRJ00Znb/Jgbd48PimGnwXMxHhrW0ULG486YbDlGE1heVKuT5yq0oOChz1SIEjXyYMur2PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otpCvwCapJfBwdoOB4ZQqioOS7LYR3A1qEXgrFLOy5Q=;
 b=cqS0cjwia/TjLt2jZiCdeDE8DpprBDPL+j1CCEXAAcrsccXffaSwav7WTjoqwVY911nlD/IxeihavPsGieNq6FklOyjujuM3pMFLIbPg21e+WGgRDb8IaUkmyKlBS9kEM6VAH/xR+sORi0VkKn6qd4gIuiJNrsbw7VRkxyGJrCGJ7htcF0gH4ReYU4YDSq1Dyy0yLGwBzoVWzU2/5VfX3cQMnIhgO75MzC3ALwgrDfO1q7iwGr4EOG51sBJmOLnv6OewOw6KpyT02fKNyOorEgFk2V5FafBeaPYaeT4kVtv3Bv5cFy/H/mCRGqJCt3qoO67pW2TSXIDy2Nc+UD03iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY8PR11MB7946.namprd11.prod.outlook.com (2603:10b6:930:7e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Mon, 27 Nov
 2023 14:20:02 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 14:20:02 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [PATCH v2 12/14] drm/xe/uapi: Add Tile ID information to the GT
 info query
Thread-Index: AQHaHVGpWHEjO3+cjkqYvYL8FiS4F7CJ0gcAgARppICAAANKgA==
Date: Mon, 27 Nov 2023 14:20:02 +0000
Message-ID: <74f1088679ef4fe73648c09f639afe6a2ec2e3c8.camel@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-13-francois.dugast@intel.com>
 <09a13c69df528c028abaf2c32c8285a65d22c5fb.camel@intel.com>
 <ZWSiy_XVQ1HNywv-@fdugast-desk.home>
In-Reply-To: <ZWSiy_XVQ1HNywv-@fdugast-desk.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY8PR11MB7946:EE_
x-ms-office365-filtering-correlation-id: 93e5e90a-c76f-42a5-b7be-08dbef53f1d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TdZi8WZauIb62m3g/dBI2X5pX4Yd/40W2mHQ1QWZoqxzGun3j3mZGC3FP0pmW9gav9rXjVdqRzWVW/wmGavxj6reDMoHU5B6bEP8BMOTUd7A8cBqMB2/1WSl/qtj3e5Yg5jvfGtr12bBvFpJRnP6NA0Ovtjlw7NnSTBzexyFpXQYqy91UNlUE8/bz/3mPJzTVmHoEgrMuV7bmgJ/wgPPh1+kNLopGdWIc7K5stgRZN/JP2jRQ0bVSODt7amWsy34jdFn9X1uUx7pTzUAg01pzjCcRlNk6MOTvcCjKaSIJp1ErV3UqWBM14zn3d7ysLVd2oU/se9THlrS0mZBi+znRs4HqnlSJ6lOO557fr8DoZEu0YxhAtaBp8tULi6V5NLMRKK1ZWlv4jOI6HptJlquYObZTCqkQWU3WUIr9b8SJSAajKJfqShzzDsqMLiWnhUNZwZI9+LZXDmsTvwBbi2EkOrnoixOahVp131ap1DO3bdrIT5PCZsDeFpgBVKFBgcv2cFWPY1LAmoNI9j1fly8yhe2calAn3dMwYS5zZ5G6CYnJkbpx1kcU1aJ3YIhn9eiMbkW/sBZ/bDkD+DDX2o4oL8p2Kzt+vWNWePx2GheVzcHxKz2gdzZ7RQWUx8DduQf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(376002)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(4001150100001)(2906002)(5660300002)(71200400001)(6512007)(38070700009)(41300700001)(478600001)(36756003)(4326008)(6862004)(8676002)(8936002)(38100700002)(6486002)(122000001)(82960400001)(2616005)(83380400001)(6506007)(316002)(86362001)(6636002)(37006003)(54906003)(66446008)(66476007)(66556008)(76116006)(91956017)(64756008)(66946007)(107886003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TE1IYkF5emhkS2lWYUhGbXU1U3l2TEhzZzJuZEI2SXp2S3dickxVOGp3MmZ0?=
 =?utf-8?B?cnlEaVU5bGhyTlFLVzNuSzIvcU9NMkFycEQ5TFhvY084dEdHOXhkYjlxY1pn?=
 =?utf-8?B?dWZ0NGViRUpaS01YSXgrRWRaQjZJWktqVkEzMDh5WVNvSExrVTBTQ3gwVzZX?=
 =?utf-8?B?WWV6TDVqaW5uRE5UWURUTmo1MCtJY0dYNGJWU2grNkxVbmZpcGhXbHVMWGtz?=
 =?utf-8?B?L081dmRIRVFCTkhYM1R4VUhBYUJsdDRIb0dkeUZuTU03VFVLZHd2Y0Z4ZjA1?=
 =?utf-8?B?NlZhYmtleFV3cG1jUlpEVVg4cXNEMDRkMWFlTFNwQ1pZS2hFbWk4dkxuV2lr?=
 =?utf-8?B?L2prWVpQTFhhSllVd1FHci9EbXBUWGtQRmM2RDArQ2dEbDErTzJkcmhtMTVL?=
 =?utf-8?B?NUg0YmhxS0xHQVh4NldiYmIxdnRpdjRvWmh0WDNmUld0WDZTbjBOVEJmOHNy?=
 =?utf-8?B?VitWRjA2SlJhNENTU3dBTlltV0NOa01BSjA0WjRlMWFTUVh4a0VzUEVyTFBF?=
 =?utf-8?B?OThsTHcrN3ZPa0NzZW1vbk9EMDJiRGhwMFJhMDB4RXd4NDQ5T1p6VVN3WUQw?=
 =?utf-8?B?RHYweXYrVHk5elN1OUw3aG5ISFljVFZ1TlNqRXUwZFFRWVFHTVM3RkxWamdk?=
 =?utf-8?B?ay9iOThnYkVpcUg0b2R3Y3RKYXBXOW1uQ2IycTltWlovRUF2RnRlclBwVDF1?=
 =?utf-8?B?ZUFkYU9Za05qZnZ0MGpYdjFnMXluSzJtZlVmZldITkNmSjNYUE9JcytNS2tS?=
 =?utf-8?B?NFNXNUZodThjMXBNOGlOTkJyRFZPK3hYSDE5MnBpZ3lIZmJDRzNHNmsvZ3ZP?=
 =?utf-8?B?T0IvNExJMVhCVHp5TlUyYzhBYlhQTU1QTEFleEVPaStLamM4UHMyN0lwY3R5?=
 =?utf-8?B?NVVEYUt4NTRBU2NacC9QUlF1U2FXamlZRGV1eDdtdjJ2Q0hqaENNb0w5L1lG?=
 =?utf-8?B?eGUzN0N2SWtXTjNST1VCSktsakJUdVZDZkJFcnVac1pQalRuM3lqa0NuLy9R?=
 =?utf-8?B?TlNiam9GZnQ5TGVPK3hvMS9WQ0NjcGZyMXR3SjYzK2c2ZHBabVlVRXhXS1pl?=
 =?utf-8?B?czJXcS9iUERKTlJlMG52ampLQ01VRW9ZdEhGMFFuMkFUbGNZamhYblN5TXpo?=
 =?utf-8?B?OFpWRWpmK1VDelpJdnBLSFBWY3FCMTBVcEJwMXFsNGowR1puS3pzWG9xVjdN?=
 =?utf-8?B?eTJIbjNTUm14bGZkd2J4QlJHeWM5MmRNblNVRU1lYjdvN1lxdnpzM2x3ZFor?=
 =?utf-8?B?YUxKWVBSS3Nkd3huUWowWVk1QnEvRWVSWHNzZUtiOVBuV01pTFYxQ2U1WHBE?=
 =?utf-8?B?M0lsZjZsbThYS09LeTVLVythaHRzekt1VnhGaE9iTjhUcWgrZWN6T1ZnN0Va?=
 =?utf-8?B?cmZYL2JQNWo3dXNmVGJWRU1DeEc2Z29LWmEzWVREazV3eFJWbEJHWGtXeGU0?=
 =?utf-8?B?ZEVkV1Iwc1ViaFBsY3UwR0Z2OEtnaFdzQ3lVSGI4blRVZ1ovUm1kTktvVWhV?=
 =?utf-8?B?NzBpOE1BWlNwMUpkbHVpUVhyMnRVejNHZS9jUTNSdEZEaWFrcXhjUUVUTUFP?=
 =?utf-8?B?YTFwdjBIcjUxT2tIQUNUOXcyZjE2YkxBMmRLQlJQb1NwU3BVL1hBclkrajIz?=
 =?utf-8?B?TjFtd05nWlh2S1NKTDB4ekJGWW9XZmpBc2NvR1ZGQnhONmoxRzVoU0FHajAy?=
 =?utf-8?B?a3V1RWYwTjBrc2N4RFFtbFFvaG1LK1M4U2l2Ulg2ZWZmWTE4SmVIc0J3SEVE?=
 =?utf-8?B?MmhiY3h5VlN1K1NjenRzUGhzblJGdDZMM2VNTWl2TG9OeWlGc1dzUExkQzNh?=
 =?utf-8?B?K2liQXpuQkxHdzkxRjFvUndEbk9yZU1BdFl4SCtrLzI2VkE3RUlqMXpML01G?=
 =?utf-8?B?WkkxNFo1VU9JSkZFUjlEVDRqc2pNblFTNnhKN283VGc1dUpQcEF5OTNmRnU3?=
 =?utf-8?B?ZnRhNmNiNmNkb1RaaEppeGtjTjNsMEkyZEZkRWxIUlV1Q0dVNWtFcC8zZDJ4?=
 =?utf-8?B?djk0VC9jcG9idVJLRk1Sd2NnK2hyWklGd0hTV3V6UTF5QVJUTm12T1RITkpv?=
 =?utf-8?B?djBncWo2UWxDcHdHMTROMUtlZjFNdGo2M3dlL0FQYXBpNGNTOUwza1BXQzAy?=
 =?utf-8?B?ZTc2cHFsd3VmQjIyQ3p2ZEc0Q2xtM1hHUiticUQ5cG05NWkxRzFuSytvT2w1?=
 =?utf-8?B?RGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <247810AC120D8B4FAAF6D1BDFEE80A56@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e5e90a-c76f-42a5-b7be-08dbef53f1d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 14:20:02.1823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aAaJU9q52yyMNfCYzRJ0VyiMAsU+wcHrK9b9HFR1YZM6qi4ncPIlN14jWO2Chh3gg7E/2KZ5tePZo49bKEZw2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7946
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 12/14] drm/xe/uapi: Add Tile ID
 information to the GT info query
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

T24gTW9uLCAyMDIzLTExLTI3IGF0IDE1OjA4ICswMTAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IE9uIEZyaSwgTm92IDI0LCAyMDIzIGF0IDA3OjQ1OjA0UE0gKzAxMDAsIFNvdXphLCBKb3Nl
IHdyb3RlOg0KPiA+IE9uIFdlZCwgMjAyMy0xMS0yMiBhdCAxNDozOCArMDAwMCwgRnJhbmNvaXMg
RHVnYXN0IHdyb3RlOg0KPiA+ID4gRnJvbTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50
ZWwuY29tPg0KPiA+ID4gDQo+ID4gPiBBcyBhbiBpbmZvcm1hdGlvbiBvbmx5LiBTbyBVc2Vyc3Bh
Y2UgY2FuIHVzZSB0aGlzIGluZm9ybWF0aW9uDQo+ID4gPiBhbmQgYmUgYWJsZSB0byBjb3JyZWxh
dGUgZGlmZmVyZW50IEdUcy4NCj4gPiA+IA0KPiA+ID4gTWFrZSBBUEkgc3ltbWV0cmljIGJldHdl
ZW4gRW5naW5lIGFuZCBHVCBpbmZvLg0KPiA+ID4gDQo+ID4gPiBUaGVyZSdzIG5vIG5lZWQgcmln
aHQgbm93IHRvIGluY2x1ZGUgYSB0aWxlX3F1ZXJ5IGVudHJ5DQo+ID4gPiBzaW5jZSB0aGVyZSdz
IG5vIG90aGVyIGluZm9ybWF0aW9uIHRoYXQgd2UgbmVlZCBmcm9tIHRpbGUNCj4gPiA+IHRoYXQg
aXMgbm90IGFscmVhZHkgZXhwb3NlZCB0aHJvdWdoIGRpZmZlcmVudCBxdWVyaWVzLg0KPiA+ID4g
DQo+ID4gPiBIb3dldmVyLCB0aGlzIGNvdWxkIGJlIGFkZGVkIGxhdGVyIGlmIHdlIGhhdmUgZGlm
ZmVyZW50IFRpbGUNCj4gPiA+IGluZm9ybWF0aW9uIHRoYXQgY291bGQgbWF0dGVyIHRvIHVzZXJz
cGFjZS4gQnV0IGxldCdzIGtlZXANCj4gPiA+IHRoZSBBUEkgcmVhZHkgZm9yIGEgZGlyZWN0IHJl
ZmVyZW5jZSB0byBUaWxlIElEIGJhc2VkIG9uDQo+ID4gPiB0aGUgR1QgZW50cnkuDQo+ID4gPiAN
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGlu
dGVsLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZp
QGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVy
eS5jIHwgMSArDQo+ID4gPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgICAgfCAyICsrDQo+
ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gPiA+IA0KPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3F1ZXJ5LmMNCj4gPiA+IGluZGV4IDc3Y2FiNjZkMzM3Zi4uMDk1ZjFiOGMyMjkwIDEw
MDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+ID4gPiBAQCAtMzc2LDYgKzM3Niw3
IEBAIHN0YXRpYyBpbnQgcXVlcnlfZ3RfbGlzdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0
IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5DQo+ID4gPiAgCQkJZ3RfbGlzdC0+Z3RfbGlzdFtp
ZF0udHlwZSA9IERSTV9YRV9RVUVSWV9HVF9UWVBFX01FRElBOw0KPiA+ID4gIAkJZWxzZQ0KPiA+
ID4gIAkJCWd0X2xpc3QtPmd0X2xpc3RbaWRdLnR5cGUgPSBEUk1fWEVfUVVFUllfR1RfVFlQRV9N
QUlOOw0KPiA+ID4gKwkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0udGlsZV9pZCA9IGd0X3RvX3RpbGUo
Z3QpLT5pZDsNCj4gPiA+ICAJCWd0X2xpc3QtPmd0X2xpc3RbaWRdLmd0X2lkID0gZ3QtPmluZm8u
aWQ7DQo+ID4gPiAgCQlndF9saXN0LT5ndF9saXN0W2lkXS5yZWZlcmVuY2VfY2xvY2sgPSBndC0+
aW5mby5yZWZlcmVuY2VfY2xvY2s7DQo+ID4gPiAgCQlpZiAoIUlTX0RHRlgoeGUpKQ0KPiA+ID4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJt
L3hlX2RybS5oDQo+ID4gPiBpbmRleCA0YmFkODRlNzc5M2YuLmIwZWYxZjYyZmQ5OSAxMDA2NDQN
Cj4gPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiA+ICsrKyBiL2luY2x1
ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiA+IEBAIC0zNzcsNiArMzc3LDggQEAgc3RydWN0IGRy
bV94ZV9ndCB7DQo+ID4gPiAgI2RlZmluZSBEUk1fWEVfUVVFUllfR1RfVFlQRV9NRURJQQkJMQ0K
PiA+ID4gIAkvKiogQHR5cGU6IEdUIHR5cGU6IE1haW4gb3IgTWVkaWEgKi8NCj4gPiA+ICAJX191
MTYgdHlwZTsNCj4gPiA+ICsJLyoqIEB0aWxlX2lkOiBUaWxlIElEIHdoZXJlIHRoaXMgR1QgbGl2
ZXMgKEluZm9ybWF0aW9uIG9ubHkpICovDQo+ID4gPiArCV9fdTE2IHRpbGVfaWQ7DQo+ID4gPiAg
CS8qKiBAZ3RfaWQ6IFVuaXF1ZSBJRCBvZiB0aGlzIEdUIHdpdGhpbiB0aGUgUENJIERldmljZSAq
Lw0KPiA+ID4gIAlfX3UxNiBndF9pZDsNCj4gPiA+ICAJLyoqIEByZWZlcmVuY2VfY2xvY2s6IEEg
Y2xvY2sgZnJlcXVlbmN5IGZvciB0aW1lc3RhbXAgKi8NCj4gPiANCj4gPiBjaGFuZ2UgaXMgZ29v
ZCBidXQgaXQgYnJva2UgdGhlIGFsaWdubWVudCBvZiBhIHN0cnVjdCB0aGF0IHdhcyBhbGlnbmVk
IA0KPiANCj4gVHJ1ZSBidXQgdGhpcyBhbmQgb3RoZXIgbWlzYWxpZ25tZW50cyBhcmUgZml4IGlu
IHRoZSBuZXh0IHBhdGNoIG9mIHRoaXMNCj4gc2VyaWVzICJkcm0veGUvdWFwaTogRml4IHZhcmlv
dXMgc3RydWN0IHBhZGRpbmcgZm9yIDY0YiBhbGlnbm1lbnQiLg0KDQpPa2F5DQo=
