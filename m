Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED48C54EAA
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jan 2023 18:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8D310E0A6;
	Mon, 30 Jan 2023 18:05:21 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A3410E0A6
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jan 2023 18:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675101920; x=1706637920;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MgzSOpqOeebtnSOAR/MdUT/x5Qm77jRTC8jNbimFo2k=;
 b=dlp9EFq63mCmJktoc72g8ItAwB+aQuc6poUxcnl/qXz2Tgxvupy7/yC+
 zTBOplBe1bBcb4Td1mOg/8C42S0XSVsCjDHsGWABKnG1znSD6ba//qlqK
 VzTG0LUo6wtj5agmxqviH+up0CSwBBHjQGq8xpuLACNl/HGk6weHZ1CxL
 Npc+gyTq3aoxMoa2VVgmWctCIefFKlPxa+Iqc3noNL7nsV8kZ651YUhz0
 dlwgCcgvRmVpDrPv4u7L/s5lmWTZKOIZjY6swGCA/Gb6cQQbxLW5+zB16
 co6l9CIr+e0Jns+2UVyUfQ5UD4aq8llKZkHgiCmgRgJtLjZ2xZEKrbyD5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="315590051"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="315590051"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 10:04:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="732783979"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="732783979"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 30 Jan 2023 10:04:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 10:04:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 10:04:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 30 Jan 2023 10:04:27 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 30 Jan 2023 10:04:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqCBPM97OPQ8NpHeg/9N0UbdE+6Dh1Ylpm/Ufo1Xk/VoxvqxGvnkzcTBEHJZTKoucczKs7+9Tg4djqUwtGzT5h6P4JIYu84HRM3QLEy5kivfTgQ0OXrelfLtjqPn+ZAqf6dhs9kO6Zcc/J9Pv46wgcV5EVvnQvetwHQjIW4gfQRl+Yd0mRUDIxq175UJQ6NEsvHjZ7c5dT+hPmP21lXfFu3MQO98g7XbgBLPbx4GOyjNEslW2cim4dqAhCJz0YqacO3gAZCuCpFuXRZvo4JpqYppb7fkgIjXQVOAcXovV/e8OHwcTazqpyBryzQHAQA9bQhot0LvFkW25588pmmquw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgzSOpqOeebtnSOAR/MdUT/x5Qm77jRTC8jNbimFo2k=;
 b=YksadUGGmJhQOeTlTSM6hLbdry+Wu4KQbJbYr2rSW62i159r8MlB5eEGtY0aLpn35Urs4Cr1A57jCDESUGJnJpneLbM8mDLZ0dUbx3JjusaGteswAgP1WTdxIBOdphiO/2CI5GjHPV+fQ/W9RbK315X98sXBOnNW/QCGRp96tTi7UPBoR5etTfbj2almBTMdaqX5WIrodM/0MZcFJmAK0CvvPlTYwSY2nFWZKCmeQLIxvxDTZleLgk4u+WdGZJGK8MWPE786An2PcH5gE6RehMIN9fRC/bITg2CP1vT9gTDan4uuBOqkcssmoNVgoQxJhwWKPXEQ5qxdQpxA8e1xYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY4PR11MB2054.namprd11.prod.outlook.com (2603:10b6:903:2d::9)
 by MN2PR11MB4568.namprd11.prod.outlook.com (2603:10b6:208:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 18:04:25 +0000
Received: from CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::a11b:8f88:32ed:1828]) by CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::a11b:8f88:32ed:1828%11]) with mapi id 15.20.6043.036; Mon, 30 Jan
 2023 18:04:25 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [PATCH v2] drm/xe: Add fake workaround to maintain backward
 compatible in MI_BATCH_BUFFER_START
Thread-Index: AQHZNMZgoxtTsMO+yE6am6PfoCoCAK63M2aAgAANnAA=
Date: Mon, 30 Jan 2023 18:04:25 +0000
Message-ID: <7c9f39e8eb4ad81926af9b91f45509a5a5a9d347.camel@intel.com>
References: <20230130161723.42602-1-jose.souza@intel.com>
 <Y9f7O86ki5W4Qv1C@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <Y9f7O86ki5W4Qv1C@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR11MB2054:EE_|MN2PR11MB4568:EE_
x-ms-office365-filtering-correlation-id: 1a02a60f-49a2-4863-33c6-08db02ec6c4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O4abNf/FdDrSrtUF/KXdmRgO79quoXMZWcM9rzxRM+6V/IgGBt4TJCGiwu7YxZCc6QEM2L1rKm+Sk/nxFfJpXFbK+LX3+UYSz7JFoq7q1X6kaM83HTCUXM5y8Ge5EMz0l4sX41JHl+n+ZSSRnUg09RWJscnW8uONPiJojPChPx5FXHdJ/GZhlaHWdv3/t/KiSoofl7P77FYGlOzgrcgrV5WGOm706VLZirKF/5BUjWze2Qj6kpDQ0N9iGGSHd+nlxLjkFbMYd7FX+Dghv2zjBQ2csHOVgsYVgiIGL0JfACw2B3kCJvqfWrW2VOk1Ib5fg08gixvPjL1XHcwBwFmOzgLaXKy/LKGKVoZO4hWJC5chwyUcgh8F+Xu8p8GSHsbZqRdGlBTm7R7gkpWktXgzHtZTb5vmAw9cJMAQh2LNagVgykuyT52HN/nDIQ+B7uIcKia7o7fuwH4QI+BRnBv4KlIDKcZIjfMY+lfBzWZxZMKm4PptKva+o/NhjWL5lQT9ZZReu1yuSSjUDoIqJs/ZmqVx0PifxbMD/uoIky8Pg4t7bjqDLV9M5mUlAv3uMlkK0sFlU2WhQjQTGDYnzeEVUebwpiYKhTlhrT+Fww/6G132qiCRhVSzMLCcnZy6++BYN5/8M08/OjPT2HiEjR1ONf+NsUwvHTJzeRL5fhGP2TFEqetPCyJiKo/1Grs3pqXoa3KaQpCwHwFrJaMlQmy/AQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB2054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199018)(2616005)(83380400001)(38070700005)(86362001)(36756003)(122000001)(38100700002)(82960400001)(37006003)(6636002)(5660300002)(54906003)(2906002)(91956017)(4326008)(8676002)(41300700001)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(8936002)(6862004)(316002)(107886003)(6512007)(26005)(186003)(6506007)(6486002)(71200400001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0V3SzdVTjF1NWc4d2xrNXE3QXg5UzBlclhJN3VwYlJnbWp1OFJIcjAxeTN3?=
 =?utf-8?B?ZnpNR2ZBRlkrT0tKL1V6ZzU4Q29lSTNCQ1RFTlc2Q2pGc0pkU2F0TTllTEZw?=
 =?utf-8?B?M29TNFg2bkVHZCtWSTFZWGVuN2J2UjRIVHVSQ2pHNlRSVzVQQWdvek1Ib0Fo?=
 =?utf-8?B?T2tvbzUxSnZVWlJhRCtCc292WDhhREpPeCtmYUM4T1FOOVR4NlBHR2ZBbE8y?=
 =?utf-8?B?ZVByTXpPNHV0cUF5eWZCVDBYR3V1ZTZoc29IZnlPZTlFQmdSQ2d3b2IvTEZo?=
 =?utf-8?B?a1I4Q2hSZXpPV1VmTWdXeDVIYlUvMHc2bUpiNmRIWWUxYnNGRDA3ZHlPWTBl?=
 =?utf-8?B?MmtvVGZkSGFQRHVhTno0dTR1YU5Hb2ZMWStoUmZGSnE4K2tRZDE3dklpM3V2?=
 =?utf-8?B?N3pUVm5UK3EyQXVoRUg4eVd5QUdJUXNNdzhuYVhOZGk1KytyWk5FLy9Kdjlo?=
 =?utf-8?B?QStCSXJXdG5ISjRXMkdGYzFrMFNYSjJ6eC9ZdW5zTDQwaUFCR0MrWE15dWJP?=
 =?utf-8?B?QTZhVVlQRzU4bXFLRmpYYno2TVh2VlIzYTIwcFNyaXdSMXBETHBiS1E2WUlY?=
 =?utf-8?B?U0srSXhwVlphbmhCeU1QZGh2Y3J4ejJsT0poWmVZVm14Y3BNaTJXK2ZZZWx3?=
 =?utf-8?B?QktnM1JxMjVTeUJoeDNrZis3T1B0ZWRuUVBuZEdYVWxIeFpwMVAyZGpiWTJB?=
 =?utf-8?B?QmlTUDNHM2tZVWhIajRLNStxWTRsRjRPejdKeWZNZnRTNEFEcWNRcGt3Vmcw?=
 =?utf-8?B?SVZyNEF6bnhkSWEzWDQ4dDI5Z1dVQjdwdVZaQnJSSGpOM2ZXOG4yK05lYWhx?=
 =?utf-8?B?alZKZGU5WGt4VlZ5dk5zOUZRUkdJVXVqUVVOMXlVR25yUTlqZWVrY1lmVW9M?=
 =?utf-8?B?c05NbkR1STV3a0dqb3J4allyaDdJNzlvS0ltVjZqbkhWbDdVSjQ2MWpPMXgr?=
 =?utf-8?B?TUFPQzNVMDBVUTM3c3lxUFV1ekpUclpKR1dUWnZuVXpLaGEvQVFxQVhUeVhH?=
 =?utf-8?B?SG5kOWlUcHZNbnQ2YkxKUUFzTWVURExYVGNsUmdpdkpJNnI0dGNXSXFJbDdN?=
 =?utf-8?B?YnJrSXczdnkvMEZuaXdhaklxZ0RDdGltYVhFWHJDSlF1QlRlQ2VOa1BJRmlx?=
 =?utf-8?B?OWNod3lmTC9XaHlFdE1UVVlFTDNDT2tOZ2lUYld4Qk9NckNKMC94T01WWU1Q?=
 =?utf-8?B?dCtsQTdpdzMzRmJFSkdab1lJN3dzREVZZlVJNVRwWE5vSVdLdDJ2cHZsYURx?=
 =?utf-8?B?UXRzd1c0Zzl6eVFxUU03eENZUXg2cXhqWlhNOHpKc0NKWmNMU0dHMUdPTzNv?=
 =?utf-8?B?TzY1Wkwyams3ZlZ4allUa2dtOHNuNDJyY09sZHQvSXZjUnVZdmtyWTdhVUR5?=
 =?utf-8?B?UStUaGJ6d0pkdmV4b0pCUGk1MkMrdjVzVFMzempuN0ovYVBWVXRGTUhFQmcr?=
 =?utf-8?B?UUkzanFNelBzM0Fvcm04L0lKekd5cW80bDNJRXkvd0g4Qjljcmx4ZG5BQUcx?=
 =?utf-8?B?em1jVVE2SWlUQUhpeXE0aFJuMFRlWFkvblNzSkhmc1V2eDdNcUhWUGtCdzRD?=
 =?utf-8?B?ckJOdnYySm1RMWQrOFdOYnhYUzZUcm9OaHY5L3JIVy81cDhDRGhwdEJUTnMr?=
 =?utf-8?B?Wk5FYUd2S1JZZUhDRVJGZWs3VUxnVWRqUHAxM09jeUtYeUJ3bCswb09QWmk3?=
 =?utf-8?B?VzZUSkVOZFFRL2o1dGlUWmZNSHQzRjBzVytuSlJRdGtWbGFuVGtBWHVWclNY?=
 =?utf-8?B?WkswNmh4c3d2SVpVUTJGSVJ3ZVhXVEF6T0lhOHY2RHlQQWxidk04QnhsdGZj?=
 =?utf-8?B?VWdGTUlycWlVNFFqZEhXSmV6c1IzbWh6dTR3RDZSU2diMjgyaHhtbVEyajNQ?=
 =?utf-8?B?M05sVU45ZUZtVlNqZ2k1bEZ1blErT245NWRYK0RlVkI0U25ObTJhWWRCM3Z5?=
 =?utf-8?B?S2JVelgxWjFsREpEZ0Y2YnNlYmJhaFFQdWdhSjJGdW9sMm9lR3o5ckFRQzBs?=
 =?utf-8?B?QXE0R0pTdFI2TlNIZjlNRWgwd0JBUmQ1cGJ5MVd5Q0wyRGltbTZIUUxoNTJO?=
 =?utf-8?B?OGdxUjc5Vk9kUnZ6UEkzMVB3bDJYazU1NnlaemF2THNjc2hHNDFqWmRMUlEy?=
 =?utf-8?B?NHNtT0pzait3MW5zREx6VEJ5OVBSNTdkNWFLNTZ2aGljbUtKdnJMRkc5WUZP?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF5102D850B49844BADBD40037D13933@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB2054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a02a60f-49a2-4863-33c6-08db02ec6c4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2023 18:04:25.5280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QUkEptjGIdxJxGDQhULM0mD0BNVVdkoiJojFLxLR7JOgPfqtGtLJMGau2ZQHBXJ+pm4IOLB1PCR7QbCM6HYu4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4568
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTAxLTMwIGF0IDA5OjE1IC0wODAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBNb24sIEphbiAzMCwgMjAyMyBhdCAwODoxNzoyM0FNIC0wODAwLCBKb3PDqSBSb2JlcnRvIGRl
IFNvdXphIHdyb3RlOg0KPiA+IGk5MTUgaGFzIHRoZSBzYW1lIGZha2Ugd29ya2Fyb3VuZCB0byBy
ZXR1cm4gTUlfQkFUQ0hfQlVGRkVSX1NUQVJUDQo+ID4gbmVzdGVkIGJhdGNoIGJ1ZmZlciBiZWhh
dmlvciBpbiBERzIgYW5kIG5ld2VyIHBsYXRmb3JtcyB0byB0aGUgc2FtZQ0KPiA+IGJlaGF2aW9y
IGFzIG9sZGVyIHBsYXRmb3Jtcy4NCj4gPiANCj4gPiBTbyBoZXJlIGNsZWFuaW5nIHVwIFRHTF9O
RVNURURfQkJfRU4gaW4gTUlfTU9ERSB0byBkaXNhYmxlIHRoaXJkIGxldmVsDQo+ID4gY2hhaW5l
ZCBiYXRjaCBidWZmZXIgbGV2ZWwuDQo+IA0KPiBJIHdhcyBraW5kIG9mIGFzc3VtaW5nIHdlJ2Qg
anVzdCBkcm9wIHRoaXMgc2V0dGluZyBmb3IgdGhlIFhlIGRyaXZlci4gIEkNCj4gYmVsaWV2ZSBo
YXJkd2FyZSB3aWxsIGJlIHJlbW92aW5nIHRoZSBvcHRpb24gdG8gdHVybiBvZmYgbmVzdGVkDQo+
IGJhdGNoYnVmZmVycyBpbiBhbiB1cGNvbWluZyBwbGF0Zm9ybSwgc28gdXNlcnNwYWNlIGlzIGdv
aW5nIHRvIGhhdmUgdG8NCj4gYWRhcHQgdG8gdGhlIG5ldyBiZWhhdmlvciBzb29uIGFueXdheTsg
ZG9pbmcgaXQgd2hpbGUgbW92aW5nIHRvIGEgbmV3DQo+IEtNRCBzZWVtcyBsaWtlIHRoZSBlYXNp
ZXN0IHRpbWUgdG8gbWFrZSB0aGF0IGhhcHBlbiBzaW5jZSB0aGUgVU1EcyBhcmUNCj4gYWxyZWFk
eSB1cGRhdGluZyB0aGVpciBwcm9ncmFtbWluZyBtb2RlbHMuDQoNClRoaXMgd291bGQgYnJpbmcg
ZXZlbiBtb3JlIGNoYW5nZXMgdG8gdHJhY2sgd2hlbiBkZWJ1Z2dpbmcgaXNzdWVzIGluIFhlIEtN
RCBwb3J0Lg0KQmV0dGVyIGRvIHRoaXMgYWZ0ZXIgWGUgS01EIGlzIHN0YWJpbGl6ZWQgYW5kIHdp
dGggYmV0dGVyIENJIGNvdmVyYWdlIGluIFVNRHMgYW5kIEtNRHMuDQoNCj4gDQo+IA0KPiBNYXR0
DQo+IA0KPiA+IA0KPiA+IHYyOg0KPiA+IC0gcmVwbGFjZSBJUF9WRVJTSU9OX0ZPUkVWRVIgYnkg
WEVfUlRQX0VORF9WRVJTSU9OX1VOREVGSU5FRA0KPiA+IC0gbW92ZSBmYWtlIHdvcmthcm91bmQg
dG8gbHJjX2FkZGl0aW9uYWxfcHJvZ3JhbW1pbmcgdGFibGUNCj4gPiANCj4gPiBCc3BlYzogNDU5
NzQsIDQ1NzE4DQo+ID4gQ2M6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwu
Y29tPg0KPiA+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwu
Y29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYyB8ICAxICsNCj4g
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5oIHwgIDEgKw0KPiA+ICAzIGZp
bGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+
IGluZGV4IDg0YTczZWVjY2QyOTcuLjVkMDdlMWU3YmQ1MDYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3QuYw0KPiA+IEBAIC0zMTEsNiArMzExLDcgQEAgaW50IHhlX2d0X3JlY29yZF9kZWZhdWx0X2xy
Y3Moc3RydWN0IHhlX2d0ICpndCkNCj4gPiAgDQo+ID4gIAkJeGVfcmVnX3NyX2luaXQoJmh3ZS0+
cmVnX2xyYywgIkxSQyIsIHhlKTsNCj4gPiAgCQl4ZV93YV9wcm9jZXNzX2xyYyhod2UpOw0KPiA+
ICsJCXhlX3dhX3Byb2Nlc3NfbHJjX2FkZGl0aW9uYWxfcHJvZ3JhbW1pbmcoaHdlKTsNCj4gPiAg
DQo+ID4gIAkJZGVmYXVsdF9scmMgPSBkcm1tX2t6YWxsb2MoJnhlLT5kcm0sDQo+ID4gIAkJCQkJ
ICAgeGVfbHJjX3NpemUoeGUsIGh3ZS0+Y2xhc3MpLA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfd2EuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jDQo+ID4gaW5k
ZXggMzMyNWRlM2VkZjY5MS4uNzQ0YjdkMDk4MjY4MyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfd2EuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5j
DQo+ID4gQEAgLTI4OCw2ICsyODgsMjEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9ydHBfZW50
cnkgbHJjX3dhc1tdID0gew0KPiA+ICAJe30NCj4gPiAgfTsNCj4gPiAgDQo+ID4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgeGVfcnRwX2VudHJ5IGxyY19hZGRpdGlvbmFsX3Byb2dyYW1taW5nW10gPSB7
DQo+ID4gKwl7IFhFX1JUUF9OQU1FKCJGYWtlV2FEaXNhYmxlTmVzdGVkQkJNb2RlIiksDQo+ID4g
KwkgIC8qDQo+ID4gKwkgICAqIFRoaXMgaXMgYSAiZmFrZSIgd29ya2Fyb3VuZCBkZWZpbmVkIGJ5
IHNvZnR3YXJlIHRvIGVuc3VyZSB3ZQ0KPiA+ICsJICAgKiBtYWludGFpbiByZWxpYWJsZSwgYmFj
a3dhcmQtY29tcGF0aWJsZSBiZWhhdmlvciBmb3IgdXNlcnNwYWNlIHdpdGgNCj4gPiArCSAgICog
cmVnYXJkcyB0byBob3cgbmVzdGVkIE1JX0JBVENIX0JVRkZFUl9TVEFSVCBjb21tYW5kcyBhcmUg
aGFuZGxlZC4NCj4gPiArCSAgICovDQo+ID4gKwkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJT
SU9OX1JBTkdFKDEyNTUsIFhFX1JUUF9FTkRfVkVSU0lPTl9VTkRFRklORUQpKSwNCj4gPiArCSAg
WEVfUlRQX0NMUihSSU5HX01JX01PREUoMCksDQo+ID4gKwkJICAgICBUR0xfTkVTVEVEX0JCX0VO
LA0KPiA+ICsJCSAgICAgWEVfUlRQX0ZMQUcoTUFTS0VEX1JFRywgRU5HSU5FX0JBU0UpKQ0KPiA+
ICsJfSwNCj4gPiArCXt9DQo+ID4gK307DQo+ID4gKw0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IHhlX3J0cF9lbnRyeSByZWdpc3Rlcl93aGl0ZWxpc3RbXSA9IHsNCj4gPiAgCXsgWEVfUlRQX05B
TUUoIldhQWxsb3dQTURlcHRoQW5kSW52b2NhdGlvbkNvdW50QWNjZXNzRnJvbVVNRCwgMTQwODU1
Njg2NSIpLA0KPiA+ICAJICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgxMjAw
LCAxMjEwKSwgRU5HSU5FX0NMQVNTKFJFTkRFUikpLA0KPiA+IEBAIC0zNjIsNiArMzc3LDE5IEBA
IHZvaWQgeGVfd2FfcHJvY2Vzc19scmMoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKQ0KPiA+ICAJ
eGVfcnRwX3Byb2Nlc3MobHJjX3dhcywgJmh3ZS0+cmVnX2xyYywgaHdlLT5ndCwgaHdlKTsNCj4g
PiAgfQ0KPiA+ICANCj4gPiArLyoqDQo+ID4gKyAqIHhlX3dhX3Byb2Nlc3NfbHJjX2FkZGl0aW9u
YWxfcHJvZ3JhbW1pbmcgLSBwcm9jZXNzIGFkZGl0aW9uYWwgTFJDIHByb2dyYW1taW5nDQo+ID4g
KyAqIHRhYmxlDQo+ID4gKyAqIEBod2U6IGVuZ2luZSBpbnN0YW5jZSB0byBwcm9jZXNzIHdvcmth
cm91bmRzIGZvcg0KPiA+ICsgKg0KPiA+ICsgKiBQcm9jZXNzIGFkZGl0aW9uYWwgY29udGV4dCBw
cm9ncmFtbWluZyB0YWJsZSBmb3IgdGhpcyBwbGF0Zm9ybSwgc2F2aW5nIGluDQo+ID4gKyAqIEBo
d2UgYWxsIHRoZSByZWdpc3RlcnMgY2hhbmdlcyB0aGF0IG5lZWQgdG8gYmUgYXBwbGllZCBvbiBj
b250ZXh0IHJlc3RvcmUuDQo+ID4gKyAqLw0KPiA+ICt2b2lkIHhlX3dhX3Byb2Nlc3NfbHJjX2Fk
ZGl0aW9uYWxfcHJvZ3JhbW1pbmcoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKQ0KPiA+ICt7DQo+
ID4gKwl4ZV9ydHBfcHJvY2VzcyhscmNfYWRkaXRpb25hbF9wcm9ncmFtbWluZywgJmh3ZS0+cmVn
X2xyYywgaHdlLT5ndCwgaHdlKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgLyoqDQo+ID4gICAqIHhl
X3JlZ193aGl0ZWxpc3RfcHJvY2Vzc19lbmdpbmUgLSBwcm9jZXNzIHRhYmxlIG9mIHJlZ2lzdGVy
cyB0byB3aGl0ZWxpc3QNCj4gPiAgICogQGh3ZTogZW5naW5lIGluc3RhbmNlIHRvIHByb2Nlc3Mg
d2hpdGVsaXN0IGZvcg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Eu
aCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5oDQo+ID4gaW5kZXggMWEwNjU5NjkwYTMyMC4u
ODcyZjNlNGRkYzczYyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Eu
aA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5oDQo+ID4gQEAgLTEyLDYgKzEy
LDcgQEAgc3RydWN0IHhlX2h3X2VuZ2luZTsNCj4gPiAgdm9pZCB4ZV93YV9wcm9jZXNzX2d0KHN0
cnVjdCB4ZV9ndCAqZ3QpOw0KPiA+ICB2b2lkIHhlX3dhX3Byb2Nlc3NfZW5naW5lKHN0cnVjdCB4
ZV9od19lbmdpbmUgKmh3ZSk7DQo+ID4gIHZvaWQgeGVfd2FfcHJvY2Vzc19scmMoc3RydWN0IHhl
X2h3X2VuZ2luZSAqaHdlKTsNCj4gPiArdm9pZCB4ZV93YV9wcm9jZXNzX2xyY19hZGRpdGlvbmFs
X3Byb2dyYW1taW5nKHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSk7DQo+ID4gIA0KPiA+ICB2b2lk
IHhlX3JlZ193aGl0ZWxpc3RfcHJvY2Vzc19lbmdpbmUoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdl
KTsNCj4gPiAgdm9pZCB4ZV9yZWdfd2hpdGVsaXN0X2FwcGx5KHN0cnVjdCB4ZV9od19lbmdpbmUg
Kmh3ZSk7DQo+ID4gLS0gDQo+ID4gMi4zOS4xDQo+ID4gDQo+IA0KDQo=
