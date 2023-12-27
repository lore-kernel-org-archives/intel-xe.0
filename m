Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3604FC46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 13:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC46910E042;
	Wed, 27 Dec 2023 13:52:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0ECF10E042
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 13:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703685132; x=1735221132;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YONC48X9TsdzhKbgdWFaNW1NJqCDiwiYjjT3JpBckYI=;
 b=WHz4RpKeRcynG8nhdGQ9CyAoIBdopHkFJaEUGVPqqFMGhUb6oOftayad
 xYvt2ROTvYqmpRKpWkE933MeytoPN4kUIhiDzUfhmR8pNubXYj3RiY/r0
 Q/D85UNbZgU8XikNIy1MjTNouVmeZhznYR97aUoYDOVFtgxBlhJMcAivi
 SSgCy+jqClLRzUVKALYWjPZkkPcIpMPRG1kZpVLFzPhCgJM7jnwISVJvb
 DhC8PaLNq6DHpS5g1IQmDStuFDMEXgsVhtjQ0bdlJOWs8Ak/0ls7Ztb4B
 /88yT85OhACfYdiRzcy1ulFyr3xtN4V5mmLaGM1Iz/cr3NsJTtJ5yZjbC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="375940283"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; d="scan'208";a="375940283"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 05:52:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; d="scan'208";a="12715961"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 05:52:12 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 05:52:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 05:52:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 05:52:11 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 05:52:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfk6Zk7PFtefAPVLn9VW3zyDeLxIuUWJFfvQowTuN1zYGlb+coLrBM4lj1BaMuJpAx7Fb8UOgcm+YTOk9oSIZs9z6FaL3bdZESudffEZxuyrdrHnuZmC37PltQUMrA0rTC78lWTo/1O15pJsRaf5qBMRlRbB7eMauHZ6W3lpB320CNGFHTWh+Ce2RENKhXmyLAFOM/hMHrF0/vxeUB6ynB4x8hFYyP9Zj4CXVWv14E55h0ifJ3To2ZVY/DUJvTJiMVN66p+te5F6QikZgjrr79wVV2Ie1vzIFm4Au5N7bKmzxNCVNS8thL6DOC+UouvaNVf91PnkwC9+sS0hb9B4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YONC48X9TsdzhKbgdWFaNW1NJqCDiwiYjjT3JpBckYI=;
 b=TxrWitDyULoKPuwn2XnCHFcZyyhQFredzTBb/LcQWBijl/MljCkJeoEAhMQEGt4HvLAj9oSRNcsypt5cPGmC7IUypiiE1pOc7yCFjpAXcSqTccEmwwbBO+DXtZIFYazdh5/Sa0P45ave7aB/ptoVhC7xen8GiBKft3X5FLjgiy0e/dTWkMqzWeQ+tamDfVyWNaG2Y4OLdUHHJ6oWImQLLAprYoq7OpnzXMGSh38S8gBo5sPjnV4tNYrOxFPd5GwTsaUYdmwGjphNDzh7ONM5qXvrbNQx3XgFdrdT8jmIHtvk7+eMrrkozhmVddceLc3b4YnvGWzxfh1W4hqanXPa9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 13:52:09 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762%4]) with mapi id 15.20.7113.027; Wed, 27 Dec 2023
 13:52:09 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/debugfs: Make sysfs gt force reset synchronous
Thread-Topic: [PATCH] drm/xe/debugfs: Make sysfs gt force reset synchronous
Thread-Index: AQHaOJ4Zpo6RbjglA0S9ihMdGxYDLbC83sTggAA5GYCAAA2/oA==
Date: Wed, 27 Dec 2023 13:52:08 +0000
Message-ID: <CY5PR11MB6211912449E7517B9FC3CA9F959FA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231227083204.3982491-1-karthik.poosa@intel.com>
 <CY5PR11MB6211A31CBBD708FFEDBDCF06959FA@CY5PR11MB6211.namprd11.prod.outlook.com>
 <fbd23755-eb5c-4591-979c-6ec3ebaa2b8a@intel.com>
In-Reply-To: <fbd23755-eb5c-4591-979c-6ec3ebaa2b8a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|CO1PR11MB5009:EE_
x-ms-office365-filtering-correlation-id: 1f04c1f2-d672-4826-af1c-08dc06e304d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ShrpQ6Xa4A3ZXFnzqsUmwai4vfLPOHfJsv7WmKkUCHRbFYvciKca1P/tJxepIMaRBbslbY3p1+qb215YavFCe6r0PxR0ZhiBYkj8lBzWDdlajg1tOq1MNpLpLolxkhLIyC8Wt39oEZwg1LSOFyEsePsHP50t1W8o3job0BoRHa4NUSL3C6jDJs6Li9WiVt4WSjG7pkV508CtekhxN/zjFnaPSh+H1eSt3JU7yErUjCzuvTRGJX6XFggF+ziEunLQgon72yTCzmE+RUIfn9T25XfdzGyxGZO88nOD2lRfM4t5s1ccAOE1+8nD3+QXd1l2dIodW73WeMO3kA8qwTnRwLPWsXNGdpVHogYoQghKuMw0B18IroNgCuq86AY6AZsqmb7vqhx3e7p/edVgp1YBbyBhGkicGC1WAuIk3mhF8vNypsNrO6Y40fd8l6QM7kZtEyVcL2EW06tJrYNgTw8CGyCKOt5aUFbOH/L4dyMNW9EXQxk7ooNfNX90U1z5xduHX59D6Gk2QfCfB/4F+q9jMwJCB+6beeysUim4zxW9U1IQTMs32I0iF9ykQF8IJBEXmpZGOKiGOU3HjYySt2Op7KxtgvrRSLGtbKgrPSR+G3cr8SdFXTPHGbbXjmD5V/D62R/ZljoYt/JBOvGsOtjXDg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(376002)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(122000001)(5660300002)(2906002)(478600001)(26005)(107886003)(41300700001)(38100700002)(86362001)(55016003)(53546011)(33656002)(38070700009)(82960400001)(83380400001)(54906003)(64756008)(66446008)(66556008)(316002)(66946007)(110136005)(76116006)(66476007)(9686003)(7696005)(71200400001)(6506007)(8676002)(52536014)(4326008)(8936002)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXc2Vk1UdnpGUTdpK1B3dTQ1OFBtQWpqaXpjenlyLzlqN2V3dWRzS3gyL01G?=
 =?utf-8?B?YjZZTlltTDIyOXhicWI0TmVhQThmRlFxN0dqMmNweTl0OE9GUmZMaEpaNlpj?=
 =?utf-8?B?eTZaNUpvN01KS0JIYXFYeWU5YldyUWtIN3hiYjl4YWpHbnZBdUtjYnlKa2ZE?=
 =?utf-8?B?Rm51RURIWjdPamtPWGtCV0VHcEUrODhpQThveDZQWmdyVGx0YmQ1bEdjMTBZ?=
 =?utf-8?B?YlZBVHBvRThtNlNHeURnbEVIdDg5blhRMCtNYldEOUR3Nis1ZGVKRTluOVhS?=
 =?utf-8?B?U2kvbjBNRGxVc1pkTWxOWkxBVDJCb0lmdmR4K0hUbE81b2djUi9kbnY3R3dp?=
 =?utf-8?B?c0xoVTkycFp1MUp4YTkxQXcwdjFwYU84Z0QzWnAwK3FUb3NaMVl6ckZVQUtU?=
 =?utf-8?B?dG5VeGtlYkE3UFlqODZXLzlhZU1vY1JxU1FoSjk1aG81VmhRZTdmaEc1S3k1?=
 =?utf-8?B?Y2ZxSjE4SVI1YkxDbkpNTUFJUzk5dEZWNFYvTm11ZFRqaHdqTWJTd05JTWdD?=
 =?utf-8?B?dTdpRjYxaE5tZUVJVDUzNlNhS3Z6UlNPdEVOUWQrVEdyZHpIcFkybGFBanlW?=
 =?utf-8?B?WlBwblNDTHJYNWNoa01lZlJLU3ZZLzlzY3NmYndCa243dlRZZU9YTkVwZlh1?=
 =?utf-8?B?bGJUUTdLNFFUNWoreUFOQlU0TlM5YkU4MUZGQzlwVVFPMXA3QWpZejdidzZ4?=
 =?utf-8?B?R21iT05pRVllTGZoWW1vem1wS2J1bmJiWnVETlhkZWYvZVpJbHNnMjZRSUxw?=
 =?utf-8?B?N0lGNjAzQktLQWJhOE9yRHJxOEp4Y1lGeXZlZkxndmdJbFFRekJHSXBzdjFy?=
 =?utf-8?B?TGNtNi90TmVGSHZwOXFTMGpMNW5XcnJZZkJKMk45ZTVJK2FJeFZSVFVZNlZw?=
 =?utf-8?B?cVNRMTd1VUk4WGcxVmtqcms3ZWowWWFEWXBjTUlwVjM1Ni9PMmNTWlh0cjRE?=
 =?utf-8?B?TXZxZHgzTE9SMFBZVTB0WDQ5YllnRExKSVdRc3ZKSDBpMEx5WEFDZzZaY2ZY?=
 =?utf-8?B?c3RCYWw5QUVOelFoeHU1WC9HbnpkNEZIM1JGTnYwZWZxSFlZa0J4VzFIWHhL?=
 =?utf-8?B?TmlCQXVWSkUvR01pMmRuWWZKR3ZQZEE4UDBjUGQxNGU0aUFKTCtBbXFNaXkz?=
 =?utf-8?B?MHJvWkJZUnNMRFl5TFVvbFBMNEZCV3hQYmdDbi9ITEZzaUJMNVNaR3hqNWNr?=
 =?utf-8?B?K3lvaTFwangyaWRpNUt2cjFnakZMZFE0Z2RianBBY0NEaEVSdDFxTHljM2tp?=
 =?utf-8?B?WWYyd0pSc3BCZkJ6YmViOGRFQ3piSHBLU0pYamhBOVhMWlVFZXpib2EzSEpS?=
 =?utf-8?B?MGdkbmJSOWJVbnpZWnR1ck5CS08vT0taT0pxQzd0eTFpa3ZvQ3B3TEJNUDdK?=
 =?utf-8?B?UHBLZXVSVnl5OGxwWGJDU3dWQ0hxemNVa3JHc2IxTkE5akJOaUJDV2RySEg4?=
 =?utf-8?B?cU56MCsvMXFLanFDamNnQ0t5RmJPaEdDc2NDZlYrWk1DN2JkWERvbXk0M2l6?=
 =?utf-8?B?Tm13NVZ3R3BDVXlQMDA1bStoVEJ2c2YxK3lONkFUa3M4TUE5Yy92dDBwNnNC?=
 =?utf-8?B?SHRHcW9nTkxrSlVTZ3czSXo5Y2pHNkJuSmloYmFyZ3M4ZzVoeW5RamllaWFO?=
 =?utf-8?B?WlZRU0dYUDltMUtWREFXNGNkR1kzVTA2cFMvSVlQWGpUM093UHFPQktFRDNG?=
 =?utf-8?B?eEsrQW5yUzNvM0ExSDREZnY0Z2tzWlVZOEJEK3VqMkN6aENTbUFvTTJwSUsy?=
 =?utf-8?B?YVhNdGErZktVSk1uNThkT0t5TFBmZGZSTTlBZ21BTWJVUU9MTk9qdHUxYjVQ?=
 =?utf-8?B?aFM0MUVlVU9pSFpoazVQZHhMUlpXOFlrR1M1V1BlU1Y2T003RytURlJrd2FV?=
 =?utf-8?B?Qnd4MVpFY0NBUjYrakU4blZTL1laZlQ5V1puUTBHMzV0K0xYQ0RSRFVrQzIr?=
 =?utf-8?B?MXZOTFRIQm5panZJUjNOTmJuM3Rqa0hXQnArZEk2dUlRc3JzRWFNSEE2N1JF?=
 =?utf-8?B?bjd5Q3o0RnplY1B4aXVPTzlMbnk0Vmdsc3Z3cFNySlZCYzZXQmdHTkY5c2F5?=
 =?utf-8?B?VnBOeC9qMmRjWFhma1JsQTZVeXRBMElkblRjVlZRNnBUaTZoYmQwYThSZEVU?=
 =?utf-8?Q?A/sHG7fGabcfR4hSZBUCBj/Le?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f04c1f2-d672-4826-af1c-08dc06e304d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2023 13:52:08.8216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dl65DT0zv/JOmVRe+XoFpqs5cLmNsaWb5kEOfrX1tmIoH9fe98bcjLiGk0LxGLClTC9S85i3M/W3pa+y/HwycTIpWdQcOKfLIE9gu1qEZIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
X-OriginatorOrg: intel.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUG9vc2EsIEthcnRoaWsg
PGthcnRoaWsucG9vc2FAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDI3
LCAyMDIzIDY6MzAgUE0NCj4gVG86IEd1cHRhLCBBbnNodW1hbiA8YW5zaHVtYW4uZ3VwdGFAaW50
ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTmlsYXdh
ciwgQmFkYWwgPGJhZGFsLm5pbGF3YXJAaW50ZWwuY29tPjsgQnJvc3QsIE1hdHRoZXcNCj4gPG1h
dHRoZXcuYnJvc3RAaW50ZWwuY29tPjsgVml2aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVs
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3hlL2RlYnVnZnM6IE1ha2Ugc3lzZnMg
Z3QgZm9yY2UgcmVzZXQgc3luY2hyb25vdXMNCj4gDQo+IEhpIEFuc2h1bWFuLA0KPiANCj4gMS4g
Q2FuJ3QgZm9yY2VfcmVzZXQgYmUgc3luY2hyb25vdXMgPw0KVGhlbiB3ZSBzaG91bGQgcmUtd3Jp
dGUgZW50aXJlIHJlc2V0IGxvZ2ljIGluc3RlYWQgb2YgaW50cm9kdWNpbmcgd2FpdF9mb3JfY29t
cGxldGlvbi4NCj4gDQo+IDIuIHJlZ2FyZGluZyBhZGRpbmcgd2FpdCBpbiBnZXQgZnJlcSBBUElz
LA0KPiANCj4gdGhlcmUgaXMgYWxyZWFkeSBhIGZsYWcgJ3BjLT5mcmVxX3JlYWR5JyBpbiB4ZV9n
dWNfcGNfZ2V0X3h4eF9mcmVxIEFQSXMsIHdoaWNoDQo+IHJldHVybnMgLUVBR0FJTiBpZiByZXNl
dCBpbiBwcm9ncmVzcywgaW5zdGVhZCBvZiB3YWl0aW5nLCB3aGljaCBpcyBjYXVzaW5nIHRoZQ0K
PiB0ZXN0IGZhaWx1cmVzLg0KSU1PIHdlIHNob3VsZCB3YWl0IGluc3RlYWQgb2YgY2hlY2tpbmcg
ZnJlcV9yZWFkeSgpIHNvIHRlc3QgY2FuIGhhdmUgb3Bwb3J0dW5pdHkgdG8gcGFzcy4NClRoYW5r
cywNCkFuc2h1bWFuIEd1cHRhLg0KPiANCj4gT24gMjctMTItMjAyMyAxNjowNiwgR3VwdGEsIEFu
c2h1bWFuIHdyb3RlOg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+
IEZyb206IFBvb3NhLCBLYXJ0aGlrIDxrYXJ0aGlrLnBvb3NhQGludGVsLmNvbT4NCj4gPj4gU2Vu
dDogV2VkbmVzZGF5LCBEZWNlbWJlciAyNywgMjAyMyAyOjAyIFBNDQo+ID4+IFRvOiBpbnRlbC14
ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4gQ2M6IEd1cHRhLCBBbnNodW1hbiA8YW5zaHVt
YW4uZ3VwdGFAaW50ZWwuY29tPjsgTmlsYXdhciwgQmFkYWwNCj4gPj4gPGJhZGFsLm5pbGF3YXJA
aW50ZWwuY29tPjsgQnJvc3QsIE1hdHRoZXcgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPjsNCj4g
Pj4gVml2aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IFBvb3NhLCBLYXJ0aGlr
DQo+ID4+IDxrYXJ0aGlrLnBvb3NhQGludGVsLmNvbT4NCj4gPj4gU3ViamVjdDogW1BBVENIXSBk
cm0veGUvZGVidWdmczogTWFrZSBzeXNmcyBndCBmb3JjZSByZXNldA0KPiA+PiBzeW5jaHJvbm91
cw0KPiA+Pg0KPiA+PiBXYWl0IGZvciBndCByZXNldCB0byBjb21wbGV0ZSBiZWZvcmUgcmV0dXJu
aW5nIGZyb20gZm9yY2VfcmVzZXQgc3lzZnMgY2FsbC4NCj4gPj4gV2l0aG91dCB0aGlzIGlndCB0
ZXN0IGZyZXFfcmVzZXRfbXVsdGlwbGUgZmFpbHMgc3BvcmFkaWNhbGx5IGluIGNhc2UNCj4gPj4g
eGVfZ3VjX3BjIGlzIG5vdCBzdGFydGVkLg0KPiA+Pg0KPiA+PiB2MjoNCj4gPj4gLSBDaGFuZ2Vk
IHdhaXQgZm9yIGNvbXBsZXRpb24gdG8gaW50ZXJydXB0aWJsZSAoQW5zaHVtYW4pLg0KPiA+PiAt
IE1vdmVkIHRpbWVvdXQgdG8geGVfZ3QuaCAoQW5zaHVtYW4pLg0KPiA+PiAtIENyZWF0ZWQgYSBk
ZWJ1Z2ZzIGZvciB1cGRhdGluZyB0aW1lb3V0IChSb2RyaWdvKS4NCj4gPj4NCj4gPj4gVGVzdGNh
c2U6IGlndEB4ZV9ndWNfcGNAZnJlcV9yZXNldF9tdWx0aXBsZQ0KPiA+PiBTaWduZWQtb2ZmLWJ5
OiBLYXJ0aGlrIFBvb3NhIDxrYXJ0aGlrLnBvb3NhQGludGVsLmNvbT4NCj4gPj4gLS0tDQo+ID4+
ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMgICAgICAgICB8ICAyICsrDQo+ID4+ICAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0X2RlYnVnZnMuYyB8IDEyICsrKysrKysrKysrKw0KPiA+PiAg
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oICAgfCAgNiArKysrKysNCj4gPj4gICAz
IGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMN
Cj4gPj4gaW5kZXgNCj4gPj4gM2FmMmFkZWMxMjk1Li40N2FiYjkzMzZjNTggMTAwNjQ0DQo+ID4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndC5jDQo+ID4+IEBAIC02NSw2ICs2NSw3IEBAIHN0cnVjdCB4ZV9ndCAqeGVf
Z3RfYWxsb2Moc3RydWN0IHhlX3RpbGUgKnRpbGUpDQo+ID4+DQo+ID4+ICAgCWd0LT50aWxlID0g
dGlsZTsNCj4gPj4gICAJZ3QtPm9yZGVyZWRfd3EgPSBhbGxvY19vcmRlcmVkX3dvcmtxdWV1ZSgi
Z3Qtb3JkZXJlZC13cSIsIDApOw0KPiA+PiArCWluaXRfY29tcGxldGlvbigmZ3QtPnJlc2V0X2Rv
bmUpOw0KPiA+Pg0KPiA+PiAgIAlyZXR1cm4gZ3Q7DQo+ID4+ICAgfQ0KPiA+PiBAQCAtNjMzLDYg
KzYzNCw3IEBAIHN0YXRpYyBpbnQgZ3RfcmVzZXQoc3RydWN0IHhlX2d0ICpndCkNCj4gPj4gICAJ
eGVfZGV2aWNlX21lbV9hY2Nlc3NfcHV0KGd0X3RvX3hlKGd0KSk7DQo+ID4+ICAgCVhFX1dBUk5f
T04oZXJyKTsNCj4gPj4NCj4gPj4gKwljb21wbGV0ZSgmZ3QtPnJlc2V0X2RvbmUpOw0KPiA+PiAg
IAl4ZV9ndF9pbmZvKGd0LCAicmVzZXQgZG9uZVxuIik7DQo+ID4+DQo+ID4+ICAgCXJldHVybiAw
Ow0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2RlYnVnZnMuYw0K
PiA+PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9kZWJ1Z2ZzLmMNCj4gPj4gaW5kZXggYzRi
NjdjZjA5ZjhmLi5mYmRhODg2YzhhOTUgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF9kZWJ1Z2ZzLmMNCj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
X2RlYnVnZnMuYw0KPiA+PiBAQCAtNTgsOCArNTgsMTYgQEAgc3RhdGljIGludCBod19lbmdpbmVz
KHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZA0KPiA+PiAqZGF0YSkgc3RhdGljIGludCBmb3JjZV9y
ZXNldChzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpICB7DQo+ID4+ICAgCXN0cnVjdCB4
ZV9ndCAqZ3QgPSBub2RlX3RvX2d0KG0tPnByaXZhdGUpOw0KPiA+PiArCXN0cnVjdCB4ZV9kZXZp
Y2UgKnhlID0gZ3RfdG9feGUoZ3QpOw0KPiA+PiArCWxvbmcgcmV0Ow0KPiA+Pg0KPiA+PiAgIAl4
ZV9ndF9yZXNldF9hc3luYyhndCk7DQo+ID4+ICsJcmV0ID0gd2FpdF9mb3JfY29tcGxldGlvbl9p
bnRlcnJ1cHRpYmxlX3RpbWVvdXQoJmd0LT5yZXNldF9kb25lLA0KPiA+PiArDQo+ID4gVGhpcyB3
b3VsZCBkZWZlYXQgdGhlIHB1cnBvc2Ugb2YgeGVfZ3RfcmVzZXRfYXN5bmMoKSwgYXMgdGhpcyB3
aWxsDQo+ID4gbWFrZSBmb3JjZV9yZXNldCBzeW5jaHJvbm91cyAsIEkgdGhpbmsgd2UgbmVlZA0K
PiA+IHdhaXRfZm9yX2NvbXBsZXRpb25faW50ZXJydXB0aWJsZV90aW1lb3V0IGluICB4ZV9ndF9m
cmVxIHN5c2ZzIGJlZm9yZQ0KPiByZWFkaW5nIHRoZSBndWMgcGMgZnJlcXVlbmN5Lg0KPiA+IFNv
bWV0aGluZyBsaWtlIGJlbG93Lg0KPiA+IGd1Y19wY19mcmVxX3JlYWR5KCkNCj4gPiB7DQo+ID4g
CXdhaXRfZm9yX2NvbXBsZXRpb25faW50ZXJydXB0aWJsZV90aW1lb3V0KCkNCj4gPiB9DQo+ID4N
Cj4gPiBUaGFua3MsDQo+ID4gQW5zaHVtYW4gR3VwdGEuDQo+ID4gCQkJCQkJbXNlY3NfdG9famlm
ZmllcyhndC0NCj4gPj4+IHJlc2V0X3RpbWVvdXRfbXMpKTsNCj4gPj4gKwlpZiAocmV0IDw9IDAp
IHsNCj4gPj4gKwkJZHJtX2VycigmeGUtPmRybSwgImd0IHJlc2V0IHRpbWVkIG91dC9pbnRlcnJw
dXRlZCwgcmV0DQo+ID4+ICVsZFxuIiwgcmV0KTsNCj4gPj4gKwkJcmV0dXJuIC1FVElNRURPVVQ7
DQo+ID4+ICsJfQ0KPiA+Pg0KPiA+PiAgIAlyZXR1cm4gMDsNCj4gPj4gICB9DQo+ID4+IEBAIC0y
MjUsNiArMjMzLDEwIEBAIHZvaWQgeGVfZ3RfZGVidWdmc19yZWdpc3RlcihzdHJ1Y3QgeGVfZ3Qg
Kmd0KQ0KPiA+PiAgIAkJcmV0dXJuOw0KPiA+PiAgIAl9DQo+ID4+DQo+ID4+ICsJLyogc2V0IGEg
ZGVmYXVsdCB0aW1lb3V0ICovDQo+ID4+ICsJZ3QtPnJlc2V0X3RpbWVvdXRfbXMgPSAxMDAwOw0K
PiA+PiArCWRlYnVnZnNfY3JlYXRlX3UzMigiZ3RfcmVzZXRfdGltZW91dF9tcyIsIDA2MDAsIHJv
b3QsDQo+ID4+ICsJCQkJCSZndC0+cmVzZXRfdGltZW91dF9tcyk7DQo+ID4+ICAgCS8qDQo+ID4+
ICAgCSAqIEFsbG9jYXRlIGxvY2FsIGNvcHkgYXMgd2UgbmVlZCB0byBwYXNzIGluIHRoZSBHVCB0
byB0aGUgZGVidWdmcw0KPiA+PiAgIAkgKiBlbnRyeSBhbmQgZHJtX2RlYnVnZnNfY3JlYXRlX2Zp
bGVzIGp1c3QgcmVmZXJlbmNlcyB0aGUNCj4gPj4gZHJtX2luZm9fbGlzdCBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3RfdHlwZXMuaA0KPiA+PiBpbmRleCBmNzQ2ODQ2NjA0NzUuLjgyNGNlZmRlMjBkMiAx
MDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgNCj4gPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgNCj4gPj4gQEAgLTM1OCw2ICsz
NTgsMTIgQEAgc3RydWN0IHhlX2d0IHsNCj4gPj4gICAJCS8qKiBAb29iOiBiaXRtYXAgd2l0aCBh
Y3RpdmUgT09CIHdvcmthcm91ZG5zICovDQo+ID4+ICAgCQl1bnNpZ25lZCBsb25nICpvb2I7DQo+
ID4+ICAgCX0gd2FfYWN0aXZlOw0KPiA+PiArDQo+ID4+ICsJLyoqIEByZXNldF9kb25lIDogY29t
cGxldGlvbiBmb3IgR1QgcmVzZXQgKi8NCj4gPj4gKwlzdHJ1Y3QgY29tcGxldGlvbiByZXNldF9k
b25lOw0KPiA+PiArDQo+ID4+ICsJLyoqIEBndF9yZXNldF90aW1lb3V0X21zIDogZ3QgcmVzZXQg
dGltZW91dCBpbiBtcyAqLw0KPiA+PiArCXUzMiByZXNldF90aW1lb3V0X21zOw0KPiA+PiAgIH07
DQo+ID4+DQo+ID4+ICAgI2VuZGlmDQo+ID4+IC0tDQo+ID4+IDIuMjUuMQ0K
