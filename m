Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06187C77B7C
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 11:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41CD10E09C;
	Thu, 11 May 2023 11:43:20 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB8810E09C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 11:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683805398; x=1715341398;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=na6Pkq+8/ZiTsw5MxfHC/Z2r+Wy0ka3ACwDaytACRfs=;
 b=UVMf1lSojGMJBC9gFoWoPHEfWS9WGay6gHafIAbWofvdh6ihMyiKI6FR
 VM3nT4mKTEz2gVvhEbps5b45h0uJ3XtZmdSpkKs5L7ykrFWXX8dNGAQp3
 SoCnwzfHkC/iXafjmR5FFnD5peVYLshLCUGg5b/7bX9CDAPuGkOGsPavV
 Ng2Lmeh7NKvWdMNXhy40or2kgMCo3dbXCuTMMYUEM7EqceGKwjYtFw9o4
 2w4+Tv382Uc3Vud8xhJyg68f+tlUY3s4PIu10onrV8/z1sAI4pl9dRgjO
 P1iGpTzPLdJfVumWdBRe6J9krJxenff1r1ZhPgMWiJWgrqQStt3WBJIE8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="334958215"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="334958215"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 04:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="1029603082"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="1029603082"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 11 May 2023 04:43:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 04:43:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 04:43:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 04:43:09 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 04:43:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUXJjlw0aLZ1vItyLeR3MUsbQ+QRhRwTamBnCGosvj4NrHJzSYswC4AIw7lU6FNTXcqJQJMquchtB47135N+DlyePE5TbDM8Rt/2U2FYps3/QQNI5jC6wdbtSdnBlxZ4AoNtaqAkk0qN/HKvbnHkSbshSG0sU9yYyL1P/BKKokpI3/aYZBL1uG2zafuCatP0P5DE5rgT/xhFpbfcQR/CzZQM7iqHv9YQUnkyIPdxF9tNtRurH7JVt+ilhPXI7K0OKmiA6tUJbF/1eEF084kASzzTrdmLQwMKww+3yGXPaPxYiuWKY/fIetZiTCyxwEMrJN/4dqTUQCSqvzrxwRmcFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=na6Pkq+8/ZiTsw5MxfHC/Z2r+Wy0ka3ACwDaytACRfs=;
 b=dcVg9jPXhPJcPKTpnMykD1CSLtN/N8ksEo5l1JijqxAfwA4J/dQ6nGof3aeIawycQsRgnBwMHARwt/AoR5jOKgyR8a1EBkG/vPN7GVQgbOZexKhURYU2v8avWrDrCBwywrEnwyZJUFICE8lHr3p8E8ekCwqSzUcdyI5Rh1bNhZ3NMpdcKGwmXeBANQvLFu0Exwm4ppzlvL8YG+noS3/2wJlg8/k3MO0Owca0khS/Kp/49iV9ZGWq+nz1WKZsUVZ1cnB0kyPpema3pbDIab8gda9WHno7GE/rvFiuWmboW13Hu6gQ0nm6yA3d1V63QCK6XDjv6iLKnE/GxWlCP3socw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN2PR11MB4664.namprd11.prod.outlook.com (2603:10b6:208:26e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 11:43:05 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%5]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 11:43:04 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Harrison, 
 John C" <john.c.harrison@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
 engine/gt reset fails.
Thread-Index: AQHZgk9opp0VN5cF5kicAhdiYtpyCq9Uf8YAgAB2WzA=
Date: Thu, 11 May 2023 11:43:04 +0000
Message-ID: <MW4PR11MB70569ED202909F1F60C3F578B3749@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230509082558.614913-1-himal.prasad.ghimiray@intel.com>
 <def394d8-f723-d036-d5c1-a249ede937d4@intel.com>
In-Reply-To: <def394d8-f723-d036-d5c1-a249ede937d4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: john.c.harrison@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|MN2PR11MB4664:EE_
x-ms-office365-filtering-correlation-id: c252edd7-df11-4c14-17aa-08db5214e19a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xG5jnnyxCHIfElmX13ehO311pH+V0vKTPEhQDBZgiGsrdfLxLXeLi+hD/s4BSSit1Pq79ciVV92a48tdBVkAnIjGJaSITd54KVq23XBpNz16jK1YsSHLKwgtiCsv/G7WQYLceNWMq3Z+eTUzz27B+/+y3td+qSJccOYwVAfoFGH6SqjbiPuczUg5uHFH7SqvSne2UlritkcQcdMHmr08cU/NkfAIt5O62m9w6vfVJWvFF9TK3XSmrrGUM6YlOKJ1gE8nshVR+vE16xAmsprQLqKDnZuHiVok0bOaOlhYTONvEuB72LkWNkjAN1ahNcs0BSt4pSs5O0IQv6vCGjScPC4OzKmIqNV5yvcBo/O3/kTGzwZG37ThABuxjRtVrq4KXAqtA6EiXN9gw5pzR9ykR/IKQ2frnfx145NOhM54LGU9gU9zHEnaRWc1WQMyUINDWLXW2fw/HnGnGrsbLUPnjKK26PB7aHHtZXaH5jurza/oEnUZvLV325GVwHt5fGmsgk9/JQnucsxKJWmGY4kcrN4or+KHMDP0ME5AYRKZ1cfPdPOuwka34MuPp8MXw2AeWNZ779Y8RKe1z8AKi8Wz33qjM6AgE9J1cnI3ybKE2lUA6TodfDPREaepPHpc+0A4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39860400002)(366004)(396003)(136003)(451199021)(8676002)(8936002)(4326008)(38100700002)(41300700001)(5660300002)(83380400001)(6636002)(66476007)(66556008)(52536014)(64756008)(66946007)(76116006)(316002)(66446008)(38070700005)(478600001)(186003)(71200400001)(33656002)(9686003)(53546011)(86362001)(122000001)(26005)(6506007)(82960400001)(7696005)(2906002)(107886003)(110136005)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUVXQ2liYTMxdjVnNldqYmgyRXFBdTdiZ1JDdkVJYTFDK3lJdkxEREwzNmsy?=
 =?utf-8?B?VGNBUkQ5UTdFbGdwWWtCT0dpWHBVM2dvL3BtU29zSG5UMzN3ZTlOWXdXOERn?=
 =?utf-8?B?RUtXUXdxVUI4UDBmcHl6cXZzMGc4NkRsNG1RSkt3MG9lcVZ4MHp5eE4yQ0tV?=
 =?utf-8?B?cC81Ky9Xb0hienlKdUpiRWx1VUNiWmh6b3kxUmFza0xsWHVicE9VZWpsWDZs?=
 =?utf-8?B?UXAzWEF5Vlp1bjN1VmVibUpxdW5Dc3NnRFhmenFMd0RBemxwUGVGREx2QU8w?=
 =?utf-8?B?WXV4c2NUZVdkRlk2SE0xRXd2V2hadEdxeDFaV2EzbzFiS1g5S0JkSHg3TnVm?=
 =?utf-8?B?M1dIa3NXUnNiZWV0R2ZaVnpldTVNb0g4ZFgrMEo3cXlKNVBhcVdrT1lnK3M0?=
 =?utf-8?B?YjlRZTUzS3h5UVZTTjVsU2xpV25xcFpybjQxRU1tZTdEbUo4M2ExSDZ2VTU2?=
 =?utf-8?B?TEpIdkh3NWllTlozQjQ0UjVoT0dQdG0yNU82NFpsVVpsajR2VGVuWVM1QTJU?=
 =?utf-8?B?bUNTRzBRSEQzMkR3dS93NE5JQVA3T08wK3Q0ankrR2NVVWpicTk0SW9tYUtV?=
 =?utf-8?B?Q2NsWnBPNkkxVmdwNFRDcGhvNzJmUC9PREp2NWVsSVRrY0hPUnNKNUhkaWRG?=
 =?utf-8?B?ZHJFclZHWHJVUFU2QjFYb0E2Snd1MmlPY0IzYUdRSmtQQ2hCbFBVeDdPbUlW?=
 =?utf-8?B?VWhjZGdOOEI2QkV1eCtXUHp3QVRuL3NlY3c4NlJBcE44NW9JaTNydVhNMXV0?=
 =?utf-8?B?UzFlSXNGVE12MzE4bWM3KzFBMUdIRU1XOU91ekhCSGxMcmR2VTNqQ0hFQVky?=
 =?utf-8?B?Q0ZzclZ1WmluRVZEL0c2QnB5S2NjaUdkMW5tc3lPN0dzZ0t3RDZJdlQybldl?=
 =?utf-8?B?dHdaaGJxZS9ZeDMyOUFFWWd4Vm03aThkTHlDaXNpOG1tc201d3VCVGxjSXZ5?=
 =?utf-8?B?THV4T1hNcHZ6SkM2TitaaHFwdkZHL0N1ampJS1JlbzJNNjBkeTZYRDJzWkhY?=
 =?utf-8?B?RWsyK2dIUWRYZTZkOVJqeDZuZUZqZW93dUZENEJhVXNKc2pyUkJWTTBjV1dF?=
 =?utf-8?B?cy9UdXZaV3d1TnRpZmllSlloSjNJaC9hSlJaVTFJUW92djRnbGxXQkNxNDYw?=
 =?utf-8?B?M2RnbEUvUG5pTnI1WVgrb1FUSzF2WnlNTlE5REZpYXorR0g5bUxKa0NaMkhu?=
 =?utf-8?B?eDNFNXlLYStPY2x4cXpPd09UQjd2RVZzWXVUQU40ZENWZ0V6UkxtcnVKcG1s?=
 =?utf-8?B?TDN5bVZyL3poT1ZGRmFkcTJPYXB1TjgzcWZOUzA5b01tbzFkeURwa0M3cTNC?=
 =?utf-8?B?N3BQNXNJRlJxczlpY1RoRHdiQThKeEFtb2NRRjNLcFVuZGt1cmN2NWlhWW9n?=
 =?utf-8?B?QmNGU2s4MzRHbzAyR3drdzBwYVpIQ01BallvbVBCa1hYMzVQd0I4cXJ6YjYx?=
 =?utf-8?B?MThJOGQ2Vm5XbDZrREkza3lkbHp3KzZSeVVSRXgxYUVadi8vdDk1WEpmRFpQ?=
 =?utf-8?B?VlhqcHNCaFVhSmhxekl2WG9Ed2R4a3hVYjMzOGJkL1JkWmVCUlJGNkgremJv?=
 =?utf-8?B?bFd4VysxdzdYZzJMZXN0Qk1oK3BFNi9JeTlVRGRrWndnV29FVTU0ZXNRc0pp?=
 =?utf-8?B?MXY5MlBEWVFtZDhTa3FqV1FrUDUxRERGZVk3cytUN292K3ArcDN1YzFucURu?=
 =?utf-8?B?Mlg5eFR5V1o3VjlMWndvcnU1TGp3d21ZWFQrc2V6ZDlIeDZtbllDaEpzWHZn?=
 =?utf-8?B?TTdjeXZSRWxYQjdLdThGMy9rM3lMMkxicU5QaUM1MDVFSEJ2aGZxMWd6Vy9J?=
 =?utf-8?B?U0hUNkt5cUlGZmdFVTBjZDJ0cFJobzVuRjF6dW00amN5ZlJmTm10VGU3N0Zo?=
 =?utf-8?B?bDd5REJqREVpOTB5aTNsREZKcHNQSjlCVUtzMTBxUitQMEV1QnUrZjVXbGJz?=
 =?utf-8?B?S1VVMVlhSnNjc0tqeEMwaHNzV0EvbkYweDNscmFoWENXaThEUGNnSm14Umdx?=
 =?utf-8?B?c20yYW52TnlQamhwT3JaeHExNnExQlc3U0ZReW1oNE91SjlTR0VTSnZ6dmwy?=
 =?utf-8?B?aGhkNzlmczd6NTc4SVZDVGpwMGV5S0wrNXgwTjcwWGZOeDk4elVvczNmMWho?=
 =?utf-8?B?aUtPQ3JHdGNheGdKTWdnWjI1TjRjQW9td0FMSGF5c3dOQ2l4N1llMWpBNXNL?=
 =?utf-8?B?OWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c252edd7-df11-4c14-17aa-08db5214e19a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2023 11:43:04.0581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oc3JtSsalHZsMSB65czKawVlCjpbv0tGsqiqG4HE3qlvWMFXxggMqiDpRoAZMEkfAUW9sy2V+pccAWbre4848BhwFo3aX62DkIRnZLT8XU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4664
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
 engine/gt reset fails.
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlsYXdhciwgQmFkYWwg
PGJhZGFsLm5pbGF3YXJAaW50ZWwuY29tPg0KPiBTZW50OiAxMSBNYXkgMjAyMyAxMDowNw0KPiBU
bzogR2hpbWlyYXksIEhpbWFsIFByYXNhZCA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNv
bT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFVwYWRoeWF5LCBU
ZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW0ludGVsLXhl
XSBbUEFUQ0ggdjIgMS8xXSBkcm0veGU6IE5vdGlmeSBVc2Vyc3BhY2Ugd2hlbg0KPiBlbmdpbmUv
Z3QgcmVzZXQgZmFpbHMuDQo+IA0KPiBIaSBIaW1hbCwNCj4gDQo+IE9uIDA5LTA1LTIwMjMgMTM6
NTUsIEhpbWFsIFByYXNhZCBHaGltaXJheSB3cm90ZToNCj4gPiBTZW5kIHVldmVudCBpbiBjYXNl
IG9mIGVuZ2luZSByZXNldCBvciBndCByZXNldCBmYWlsdXJlLg0KPiA+IFRoaXMgaW50aW1hdGlv
biBjYW4gYmUgdXNlZCBieSB1c2Vyc3BhY2UgbW9uaXRvcmluZyB0b29sIHRvIGRvIHRoZQ0KPiA+
IGRldmljZSBsZXZlbCByZXNldC9yZWJvb3Qgd2hlbiBHVCByZXNldCBmYWlscy4gdWRldmFkbSBj
YW4gYmUgdXNlZCB0bw0KPiA+IG1vbml0b3IgdGhlIHVldmVudHMuDQo+ID4NCj4gPiB2MjoNCj4g
PiAtQWRkIE5VTEwgY2hlY2sgZm9yIHhlX2d0X2h3X2VuZ2luZSByZXR1cm4oQXJhdmluZCkgLUFy
cmFuZ2UgdmFyaWFibGVzDQo+ID4gaW4gQ2hyaXN0bWFzIHRyZWUgb3JkZXIoVGVqYXMpIC1DaGVj
ayBHVUNfR1NDX09USEVSX0NMQVNTKFRlamFzKQ0KPiA+DQo+ID4gQ2M6IEFyYXZpbmQgSWRkYW1z
ZXR0eSA8YXJhdmluZC5pZGRhbXNldHR5QGludGVsLmNvbT4NCj4gPiBDYzogVGVqYXMgVXBhZGh5
YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBIaW1hbCBQ
cmFzYWQgR2hpbWlyYXkgPGhpbWFsLnByYXNhZC5naGltaXJheUBpbnRlbC5jb20+DQo+ID4gLS0t
DQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYyAgICAgICAgIHwgMTggKysrKysrKysr
KysrKysrKysrDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmggICAgICAgIHwgMTkg
KysrKysrKysrKysrKysrKysrKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJt
aXQuYyB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gICBpbmNsdWRlL3VhcGkvZHJt
L3hlX2RybS5oICAgICAgICAgIHwgIDggKysrKysrKysNCj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwg
NjggaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4gPiBpbmRleCAzYWZjYTNk
ZDk2NTcuLjJjM2ZmYTFkYjc0ZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3QuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ID4gQEAgLTgs
NiArOCw3IEBADQo+ID4gICAjaW5jbHVkZSA8bGludXgvbWlubWF4Lmg+DQo+ID4NCj4gPiAgICNp
bmNsdWRlIDxkcm0vZHJtX21hbmFnZWQuaD4NCj4gPiArI2luY2x1ZGUgPGRybS94ZV9kcm0uaD4N
Cj4gPg0KPiA+ICAgI2luY2x1ZGUgInJlZ3MveGVfZ3RfcmVncy5oIg0KPiA+ICAgI2luY2x1ZGUg
InhlX2JiLmgiDQo+ID4gQEAgLTU5MCw2ICs1OTEsMjAgQEAgc3RhdGljIGludCBkb19ndF9yZXN0
YXJ0KHN0cnVjdCB4ZV9ndCAqZ3QpDQo+ID4gICAJcmV0dXJuIDA7DQo+ID4gICB9DQo+ID4NCj4g
PiArc3RhdGljIHZvaWQgeGVfdWV2ZW50X2d0X3Jlc2V0X2ZhaWx1cmUoc3RydWN0IHhlX2Rldmlj
ZSAqeGUsIHU4IGlkKSB7DQo+ID4gKwljaGFyICpyZXNldF9ldmVudFs1XTsNCj4gPiArDQo+ID4g
KwlyZXNldF9ldmVudFswXSA9IFhFX1JFU0VUX0ZBSUxFRF9VRVZFTlQgIj0xIjsNCj4gPiArCXJl
c2V0X2V2ZW50WzFdID0gIlJFU0VUX0VOQUJMRUQ9MSI7DQo+ID4gKwlyZXNldF9ldmVudFsyXSA9
ICJSRVNFVF9VTklUPWd0IjsNCj4gPiArCXJlc2V0X2V2ZW50WzNdID0ga2FzcHJpbnRmKEdGUF9L
RVJORUwsICJSRVNFVF9JRD0lZCIsIGlkKTsNCj4gPiArCXJlc2V0X2V2ZW50WzRdID0gTlVMTDsN
Cj4gPiArCWtvYmplY3RfdWV2ZW50X2VudigmeGUtPmRybS5wcmltYXJ5LT5rZGV2LT5rb2JqLCBL
T0JKX0NIQU5HRSwNCj4gPiArcmVzZXRfZXZlbnQpOw0KPiA+ICsNCj4gPiArCWtmcmVlKHJlc2V0
X2V2ZW50WzNdKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgIHN0YXRpYyBpbnQgZ3RfcmVzZXQoc3Ry
dWN0IHhlX2d0ICpndCkNCj4gPiAgIHsNCj4gPiAgIAlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd0
X3RvX3hlKGd0KTsgQEAgLTYzOSw2ICs2NTQsOSBAQCBzdGF0aWMgaW50DQo+ID4gZ3RfcmVzZXQo
c3RydWN0IHhlX2d0ICpndCkNCj4gPiAgIAl4ZV9kZXZpY2VfbWVtX2FjY2Vzc19wdXQoZ3RfdG9f
eGUoZ3QpKTsNCj4gPiAgIAlkcm1fZXJyKCZ4ZS0+ZHJtLCAiR1QgcmVzZXQgZmFpbGVkLCBlcnI9
JWRcbiIsIGVycik7DQo+ID4NCj4gPiArCS8qIE5vdGlmeSB1c2Vyc3BhY2UgYWJvdXQgZ3QgcmVz
ZXQgZmFpbHVyZSAqLw0KPiA+ICsJeGVfdWV2ZW50X2d0X3Jlc2V0X2ZhaWx1cmUoeGUsIGd0LT5p
bmZvLmlkKTsNCj4gPiArDQo+ID4gICAJcmV0dXJuIGVycjsNCj4gPiAgIH0NCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmggYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjLmgNCj4gPiBpbmRleCA3NGE3NDA1MWYzNTQuLmEzNjM3ZWVhYWEzNyAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmgNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjLmgNCj4gPiBAQCAtNTYsNCArNTYsMjMgQEAgc3RhdGljIGlubGlu
ZSB1MTYgeGVfZW5naW5lX2NsYXNzX3RvX2d1Y19jbGFzcyhlbnVtDQo+IHhlX2VuZ2luZV9jbGFz
cyBjbGFzcykNCj4gPiAgIAl9DQo+ID4gICB9DQo+ID4NCj4gPiArc3RhdGljIGlubGluZSB1MTYg
eGVfZ3VjX2NsYXNzX3RvX2VuZ2luZV9jbGFzcyh1OCBndWNfY2xhc3MpIHsNCj4gPiArCXN3aXRj
aCAoZ3VjX2NsYXNzKSB7DQo+ID4gKwljYXNlIEdVQ19SRU5ERVJfQ0xBU1M6DQo+ID4gKwkJcmV0
dXJuIFhFX0VOR0lORV9DTEFTU19SRU5ERVI7DQo+ID4gKwljYXNlIEdVQ19WSURFT19DTEFTUzoN
Cj4gPiArCQlyZXR1cm4gWEVfRU5HSU5FX0NMQVNTX1ZJREVPX0RFQ09ERTsNCj4gPiArCWNhc2Ug
R1VDX1ZJREVPRU5IQU5DRV9DTEFTUzoNCj4gPiArCQlyZXR1cm4gWEVfRU5HSU5FX0NMQVNTX1ZJ
REVPX0VOSEFOQ0U7DQo+ID4gKwljYXNlIEdVQ19CTElUVEVSX0NMQVNTOg0KPiA+ICsJCXJldHVy
biBYRV9FTkdJTkVfQ0xBU1NfQ09QWTsNCj4gPiArCWNhc2UgR1VDX0NPTVBVVEVfQ0xBU1M6DQo+
ID4gKwkJcmV0dXJuIFhFX0VOR0lORV9DTEFTU19DT01QVVRFOw0KPiA+ICsJY2FzZSBHVUNfR1ND
X09USEVSX0NMQVNTOg0KPiA+ICsJZGVmYXVsdDoNCj4gPiArCQlYRV9XQVJOX09OKGd1Y19jbGFz
cyk7DQo+ID4gKwkJcmV0dXJuIC0xOw0KPiA+ICsJfQ0KPiA+ICt9DQo+ID4gICAjZW5kaWYNCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+IGluZGV4IGU4NTcwMTMwNzBi
OS4uZDA2OGFmMGNhN2RmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfc3VibWl0LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5j
DQo+ID4gQEAgLTEyLDYgKzEyLDcgQEANCj4gPiAgICNpbmNsdWRlIDxsaW51eC9kbWEtZmVuY2Ut
YXJyYXkuaD4NCj4gPg0KPiA+ICAgI2luY2x1ZGUgPGRybS9kcm1fbWFuYWdlZC5oPg0KPiA+ICsj
aW5jbHVkZSA8ZHJtL3hlX2RybS5oPg0KPiA+DQo+ID4gICAjaW5jbHVkZSAicmVncy94ZV9scmNf
bGF5b3V0LmgiDQo+ID4gICAjaW5jbHVkZSAieGVfZGV2aWNlLmgiDQo+ID4gQEAgLTE1ODksMTAg
KzE1OTAsMjYgQEAgaW50DQo+IHhlX2d1Y19lbmdpbmVfbWVtb3J5X2NhdF9lcnJvcl9oYW5kbGVy
KHN0cnVjdCB4ZV9ndWMgKmd1YywgdTMyICptc2csDQo+ID4gICAJcmV0dXJuIDA7DQo+ID4gICB9
DQo+ID4NCj4gPiArc3RhdGljIHZvaWQgeGVfdWV2ZW50X2VuZ2luZV9yZXNldF9mYWlsdXJlKHN0
cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiA+ICtjb25zdCBjaGFyICpuYW1lKSB7DQo+ID4gKwljaGFy
ICpyZXNldF9ldmVudFs1XTsNCj4gPiArDQo+ID4gKwlyZXNldF9ldmVudFswXSA9IFhFX1JFU0VU
X0ZBSUxFRF9VRVZFTlQgIj0xIjsNCj4gPiArCXJlc2V0X2V2ZW50WzFdID0gIlJFU0VUX0VOQUJM
RUQ9MSI7DQo+ID4gKwlyZXNldF9ldmVudFsyXSA9ICJSRVNFVF9VTklUPWVuZ2luZSI7DQo+ID4g
KwlyZXNldF9ldmVudFszXSA9IGthc3ByaW50ZihHRlBfS0VSTkVMLCAiUkVTRVRfSUQ9JXMiLCBu
YW1lKTsNCj4gPiArCXJlc2V0X2V2ZW50WzRdID0gTlVMTDsNCj4gPiArCWtvYmplY3RfdWV2ZW50
X2VudigmeGUtPmRybS5wcmltYXJ5LT5rZGV2LT5rb2JqLCBLT0JKX0NIQU5HRSwNCj4gPiArcmVz
ZXRfZXZlbnQpOw0KPiA+ICsNCj4gPiArCWtmcmVlKHJlc2V0X2V2ZW50WzNdKTsNCj4gPiArfQ0K
PiA+ICsNCj4gPiAgIGludCB4ZV9ndWNfZW5naW5lX3Jlc2V0X2ZhaWx1cmVfaGFuZGxlcihzdHJ1
Y3QgeGVfZ3VjICpndWMsIHUzMiAqbXNnLA0KPiB1MzIgbGVuKQ0KPiA+ICAgew0KPiA+ICAgCXN0
cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3VjX3RvX3hlKGd1Yyk7DQo+ID4gKwlzdHJ1Y3QgeGVfaHdf
ZW5naW5lICpod2U7DQo+ID4gICAJdTggZ3VjX2NsYXNzLCBpbnN0YW5jZTsNCj4gPiArCXUxNiBl
bmdpbmVfY2xhc3M7DQo+ID4gICAJdTMyIHJlYXNvbjsNCj4gPg0KPiA+ICAgCWlmICh1bmxpa2Vs
eShsZW4gIT0gMykpIHsNCj4gPiBAQCAtMTYwOCw2ICsxNjI1LDEyIEBAIGludCB4ZV9ndWNfZW5n
aW5lX3Jlc2V0X2ZhaWx1cmVfaGFuZGxlcihzdHJ1Y3QNCj4geGVfZ3VjICpndWMsIHUzMiAqbXNn
LCB1MzIgbGVuKQ0KPiA+ICAgCWRybV9lcnIoJnhlLT5kcm0sICJHdUMgZW5naW5lIHJlc2V0IHJl
cXVlc3QgZmFpbGVkIG9uICVkOiVkDQo+IGJlY2F1c2UgMHglMDhYIiwNCj4gPiAgIAkJZ3VjX2Ns
YXNzLCBpbnN0YW5jZSwgcmVhc29uKTsNCj4gPg0KPiA+ICsJLyogTm90aWZ5IHVzZXJzcGFjZSBh
Ym91dCBlbmdpbmUgcmVzZXQgZmFpbHVyZSAqLw0KPiA+ICsJZW5naW5lX2NsYXNzID0geGVfZ3Vj
X2NsYXNzX3RvX2VuZ2luZV9jbGFzcyhndWNfY2xhc3MpOw0KPiA+ICsJaHdlID0geGVfZ3RfaHdf
ZW5naW5lKGd1Y190b19ndChndWMpLCBlbmdpbmVfY2xhc3MsIGluc3RhbmNlLA0KPiA+ICtmYWxz
ZSk7VGhlIFRoZSBpbnN0YW5jZSBoZXJlIGlzIGNvbnNpZGVyZWQgYXMgcGh5c2ljYWwgaW5zdGFu
Y2Ugb2YNCj4gPiAraHdlIGJ1dCB3aGlsZQ0KPiBzdWJtaXR0aW5nIGNvbnRleHRzIGttZCBwYXNz
ZXMgbG9naWNhbCBpbnN0YW5jZSB0byBndWMuIFdpdGggdGhhdCBJIGFzc3VtZQ0KPiBndWMgbWln
aHQgYmUgcGFzc2luZyBsb2dpY2FsIGluc3RhbmNlIG9yIGZvciB0aGlzIG5vdGlmaWNhdGlvbiBp
dCBpcyBwYXNzaW5nDQo+IHBoeXNpY2FsIGluc3RhbmNlPw0KQUZBSUsgZm9yIHJlc2V0IGZhaWx1
cmUgbm90aWZpY2F0aW9uIHRoZSBpbnN0YW5jZSBwYXNzZWQgYnkgZ3VjIGluIGcyaCBwYXlsb2Fk
IGlzIHBoeXNpY2FsIGluc3RhbmNlIC4NCkBIYXJyaXNvbiwgSm9obiBDIENhbiB5b3UgcGxlYXNl
IGNvbmZpcm0gPw0KDQo+IA0KPiBSZWdhcmRzLA0KPiBCYWRhbA0KPiA+ICsJaWYgKGh3ZSkNCj4g
PiArCQl4ZV91ZXZlbnRfZW5naW5lX3Jlc2V0X2ZhaWx1cmUoeGUsIGh3ZS0+bmFtZSk7DQo+ID4g
Kw0KPiA+ICAgCXhlX2d0X3Jlc2V0X2FzeW5jKGd1Y190b19ndChndWMpKTsNCj4gPg0KPiA+ICAg
CXJldHVybiAwOw0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGIv
aW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+IGluZGV4IGIwYjgwYWFlM2VlOC4uNzllZjU5
NDdjMTcyIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiAr
KysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gQEAgLTM2LDYgKzM2LDE0IEBAIGV4
dGVybiAiQyIgew0KPiA+ICAgICogc3ViamVjdCB0byBiYWNrd2FyZHMtY29tcGF0aWJpbGl0eSBj
b25zdHJhaW50cy4NCj4gPiAgICAqLw0KPiA+DQo+ID4gKy8qDQo+ID4gKyAqIFVldmVudHMgZ2Vu
ZXJhdGVkIGJ5IHhlIG9uIGl0J3MgZGV2aWNlIG5vZGUuDQo+ID4gKyAqDQo+ID4gKyAqIFhFX1JF
U0VUX0ZBSUxFRF9VRVZFTlQgLSBFdmVudCBpcyBnZW5lcmF0ZWQgd2hlbiBhdHRlbXB0IHRvIHJl
c2V0DQo+IGVuZ2luZQ0KPiA+ICsgKglvciBndCBmYWlscy4gVGhlIHZhbHVlIHN1cHBsaWVkIHdp
dGggdGhlIGV2ZW50IGlzIGFsd2F5cyAxLg0KPiA+ICsgKi8NCj4gPiArI2RlZmluZSBYRV9SRVNF
VF9GQUlMRURfVUVWRU5UICJSRVNFVF9GQUlMRUQiDQo+ID4gKw0KPiA+ICAgLyoqDQo+ID4gICAg
KiBzdHJ1Y3QgeGVfdXNlcl9leHRlbnNpb24gLSBCYXNlIGNsYXNzIGZvciBkZWZpbmluZyBhIGNo
YWluIG9mIGV4dGVuc2lvbnMNCj4gPiAgICAqDQo=
