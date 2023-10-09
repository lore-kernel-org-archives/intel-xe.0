Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1E7C2BA1B
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 22:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D47710E0F1;
	Mon,  9 Oct 2023 22:03:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6598010E082;
 Mon,  9 Oct 2023 22:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696888994; x=1728424994;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3sb/tpm55ZHDNG063mL2ERniGLRZdauKs+v7zqZxRm4=;
 b=dI5a/8TSr+8HJ/2/7VEdAur5A+rCsrswCQ8JFsQRa4l6Mmt2F9KBUz8s
 B2HikC3MCmzV6TgcVrnv9uE0Wancr5GrwvohDtIeeWrK5M5IP4nrLzD0q
 Q5Ri9spEHwipju2z6mxkWR0xgPFfUMWxYncKq4aFHYnft4XCKCSHNLnrh
 D0fp1BO1bZDBHqVpkfJndb4dw5UhN2lQunkms1m4tvRTgFKdpJjEJLqpD
 XoWOWI1kFdb2AMBhaqBlysqhDcM/KcGIhZAXa5l6r3lzXuUgXiJ18ijqI
 ETj6FebdXLRt7LfRyoKRwSCYzGNYfThZJSpzj1TI/be2AuMyGy0G3FlVU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="387088677"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="387088677"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 15:03:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="756861971"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="756861971"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 15:03:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 15:03:12 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 15:03:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 15:03:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 15:03:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsQenATDSNdbh2w9BhXemSkPwgfsGRpoTyddDJnnZl2MBVsPSj2m0JwRQ8Qs/tbUWeCCi8yr6uTRmDtgtZ/ta5CXoaf1J7lwS0jWs9V50a282k+VGUtON20cgmHutxkzLErVNlJvyJmuV5vdfIRoEmZ6XHBMRWsecpHxjC6BqzAuv9vCaNu2unraesNhfX+6DxXMwG8OVMbjiKdN8At0g5RBHPD3K2ZLdYidlblaOu7EkS0snafqEa38q+Ha3t0H402doi64G05HhGT1Rh9G0EG/qtJMv0sva2A2gJa6q7g2gJaTarT0KuSGRhWlUekITlVsBR6S5YHkYmoP8jLPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sb/tpm55ZHDNG063mL2ERniGLRZdauKs+v7zqZxRm4=;
 b=jKV6hONUWtSgXMo0Xx/D+uISA/q/8/L1jUrrBQmdhx6+FhYStMgG03/EaShhb2QJUFQWI2QtWv/r6CN+vQnqd8om/WFNO6aYTsaqmaU82OcUXbsxDlb/B27OS3q9DFjFE+emd1VIqp5Tnk3UuD0Lxax2ZR1mgnrgAtoPHbdXKUaSGNJH02jvWqoKdTlfgr5jUMe6Gv4f8S5RrjAtpF46h+f6obFTYtLpsbDPvjf8RpjIqUnChlbCTG9ZmpgC8P2NXCS4NBHbFYjM/hWU5y8oyejyvHzL6RCqM2IoTdCXQSDsIgGK3WVxWAYpsvDdUru+aPC+WTGasXUz/3MVd0dTxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by MW4PR11MB6960.namprd11.prod.outlook.com (2603:10b6:303:226::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 22:03:10 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::fc2f:c7e1:8163:6c24]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::fc2f:c7e1:8163:6c24%4]) with mapi id 15.20.6838.033; Mon, 9 Oct 2023
 22:03:10 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Thread-Topic: [PATCH i-g-t 01/12] drm-uapi/xe_drm: sync to get pat and
 coherency bits
Thread-Index: AQHZ96EWzcJ6GcvOCE+Faw4M0n23k7BCCTHg
Date: Mon, 9 Oct 2023 22:03:10 +0000
Message-ID: <PH0PR11MB578229B440319881806BC50182CEA@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20231005153116.452319-1-matthew.auld@intel.com>
 <20231005153116.452319-2-matthew.auld@intel.com>
In-Reply-To: <20231005153116.452319-2-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|MW4PR11MB6960:EE_
x-ms-office365-filtering-correlation-id: 53cda4f5-947a-4f7e-b5aa-08dbc9138684
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cPzoKzE2DchJmB4yBwkC9G5Kb1TP9JtY5NpZrK8XOZcYWuZ9/jqXqHVIv1KRuReG/Y28je1PDEEfIHFT9uiChZe71Wtaf/OSf9a0tozZEHgv107FMruATHixHySv/sAfLUBbBsMiYVDw201GxYTC9UnaPZsdUaoYfLOinG/zynfFVj+GwX2Wfv/20TAYdMFILl3uZcuyzjIQdBjOBqs3tbMuAg+Nu9WpHOr3toO4doRT2qh3crGoJwOyYc7ReThdqg2UwWe2J5urco59CV2WBPUNOZw5yMynSMjHmt8EXIKwotspuhWjMNiYn1+W4ZvcIgiJjJcsi+7tGrrf5eiLiA+aExZ4dZZflCWpBgnV0q/kVClIxeIgrpVgShPVZgNfalM+fJbGFfx583k/q8IPzCdAxWQISn3rqQBTVp7T4WdiYjXxa8p6hP+nUIpVtDdVmb+7LRptm63W/csw8mx8ciRrNTLDdl26es1L7rNvXtCu7OW/YtxKxzD+6WJXMi6SDybA0zuc9MI4y483nWTZRDauQKOcQ+ME+hPxYfFtIH1CKfN+VmWqtRAdckkmUnywsp0AGjfZY+aaceZhMz2eBJj37r20sJs1scv+KR4g1Y+5mz3VoW4rkcv+MTYMXlk6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(396003)(136003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(55016003)(26005)(83380400001)(122000001)(82960400001)(38100700002)(8936002)(450100002)(4326008)(8676002)(110136005)(54906003)(66446008)(66556008)(66946007)(66476007)(316002)(76116006)(52536014)(107886003)(9686003)(5660300002)(478600001)(41300700001)(2906002)(53546011)(7696005)(71200400001)(6506007)(64756008)(33656002)(38070700005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVkvUDdEODFRaU5xVXJiTGVERVpBdnBqRkV2YWdhMmhJZy9CZmR5bUN6elJn?=
 =?utf-8?B?QVJmY3RCSmVzZnI3cEdJRkEwQmRuTXRkdGJhNXI2ZUNGVEdOY0V5TmtBb3li?=
 =?utf-8?B?RDVYUGhJdit2SFdpRThMZEdySFVrRUtOdk1RL2JGdVdsY3B1cy9LZW9GbWdI?=
 =?utf-8?B?QW1CK2NhR2F5SkZzTEMxN0gyRGNWaFE5Nlk2dlJtWXFLM3VrR0JrTWNLcE9I?=
 =?utf-8?B?OGQ2RUtwS2hldmZpU1JianpFaDdxTUlsNkUxRm1wUDZMVW40SnlBWkpXZGg1?=
 =?utf-8?B?WkVzYVB6MHVJb3d1empVVnh3ZUFCcjF2T0dhYVlwWnRzRHBDUWR0RUFEU05K?=
 =?utf-8?B?R0JNWlpMUUJCY0tUVHowQnIyeXBRWU85VFdlSkpXOUwrZU1QY0dqUklGdG5w?=
 =?utf-8?B?Qy8zOW41WEZwdDN0VURzd2FjcVpVTCtHeWtFUE1QcDF6RWsvMUliSGZWMGZT?=
 =?utf-8?B?dTc2RVJxeVBqbktrZVFReVdhU1JKWEoxQmNtVGd2TFFhZHpGMFFQS1ExVWtl?=
 =?utf-8?B?T2pxaFVTZUsxNmhWcjNWTXR3OHlTbjc4TE1jWTN2amdMOGdxT1dveGVHWlhE?=
 =?utf-8?B?Y3Z3Zk4zTUxzaHl2NmhaU0pSbGJ0T0Z1NE1KTGxwU1NoVTlYUVc4TUVNUDRV?=
 =?utf-8?B?NFM1WnMxbGhtT1JpdU8rdHp2Qnk2bWx0aWcxQTBudWxINGIrNGZJdVZIL0RC?=
 =?utf-8?B?Y0JUWFFaanNxMUZQSFRRZEY0bHJlUUp6MFE0VGg0dFFmejBoRU1MVjQyMnNO?=
 =?utf-8?B?RGRRaUZUeUhPaUNlSVYxNVMvcnVQR1hhaGR2aTY3b2VDZzV6dUlHOHZEL0Vv?=
 =?utf-8?B?Zk5VMkJxWXViSjlleWRsSXU1U2ZORkxCZ2pLQmh2QzliZ1hmSXVTNG5PRHli?=
 =?utf-8?B?QnJVd3l6WnkwSHlnNG1XMXZRUDF0TTRYbWljVE15d3lVb1FOcUVTdUpxWkxL?=
 =?utf-8?B?c0sxU3pjVEJwSk4zSWJMNmFUZDNxa2M3ZmV4c0t5TCs0Qnk2Y1BGM2t2NkJa?=
 =?utf-8?B?Y3AxRDhFeXlsdk45KzhQcTdLUFRCcnU0WVlwSFFtdzRtT0NzdXNGeGViTGx3?=
 =?utf-8?B?akxSWmJZTk5odkR0UlY3MmlaTS9hbWo4aGJIdzBvNm1SNXdYem5MZkxleWFG?=
 =?utf-8?B?K29MRncrOXIyOXQxajF5dDdCRERtTzBhY3FzeWw3KzVrN29qYjJMcGJLenFF?=
 =?utf-8?B?TldyOFNiVXZBZDFvZnNwVkFhWUNzaHBhWUtrK3FDQksxb3NFaUdmc1RlVFJm?=
 =?utf-8?B?a05UTlNJWEdGV2F1QlFVV3p3enNRdkJLM3JCaEVIblpHRlEwdzVyVUpDUEpQ?=
 =?utf-8?B?K1JlVERIWnhRZ0k5ellqcDlwVVpMU3NHUEx4ZGpwbmdQdVIvUGpOeWhrcE80?=
 =?utf-8?B?Yy8wV1V4Q2liaTdWUHlORmIzMmFycnJnV0dtZzN2OHhRV2xxMm5FUlJUQWc1?=
 =?utf-8?B?OS9qV3Zoc1ZRZFhUYXNjaWVhNHp3KzMzZzNVYzFRUlYxT1M4L1BiaXFVQy82?=
 =?utf-8?B?dy9YTWNXUGVxdGdGbmlZQnU2a21acDVXcmNNcHppbFVkakdUOFJHM09ub2lF?=
 =?utf-8?B?U2JkcUZjdWRMY2xKc3RudmhxMFU5eDBqWkNReTFWRnpXYzVQTEZvLzFsUi9l?=
 =?utf-8?B?L2JNVlpkWENuUlVBRTBGWUdjT0FPRGI4Z2hRRG5tS0taMTJTSXJ6dlZuL0hI?=
 =?utf-8?B?ZnBqTnRDa012K3hhOUNmZUExTGFwaE5WWTdaQVJ3ZjJXTHp3ZmNPMzRFR21Q?=
 =?utf-8?B?cFcrZmhuNkd0UnpSL1l2R1pVWlNhOXpVMlhISHhvdTZPdHo4NHZ3UW1DRUtO?=
 =?utf-8?B?eVBKQnp2Y2RvMjdsalFxY1ZveHJPazQrbnhVS0kxbTlUcHlyNEV1Wmk3RVZn?=
 =?utf-8?B?RjRmY0R4MDBlVHlGaVpYTVJNSXFqOTZPQXZwS1hoZ2hMcE5IcDFMRERRSWhI?=
 =?utf-8?B?c1p4QllNQ29TNHgwOG9xeXV6djZjaUM0S3RIU2VITVdFY2FrWU9HNjMvcFJV?=
 =?utf-8?B?TmduMWVrVUhVY2g5ejJvQVRGM3M0VUVZQTVaNnRGU0Y1WU91N1pSK0gvanM3?=
 =?utf-8?B?clZXUndaZG5ZaTRNdHE0eUMzOFprZS9LWEtFWkRpOHRYMHRjNHltMVkveUND?=
 =?utf-8?Q?o8Sufs4mvJ3iz0MbD2ZaDu6+f?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cda4f5-947a-4f7e-b5aa-08dbc9138684
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 22:03:10.1372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dq3GcgZlq87SFZPLY1sDQO1FeOrj6orLD7VKu2U7E8po9DSNZi7fn4RQr6F06vBC/tCOb4ToABlKAilDuHPIs29+9owt/Xc4PKmwNaSl7Q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6960
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 01/12] drm-uapi/xe_drm: sync to get pat
 and coherency bits
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgNSwgMjAy
MyA4OjMxIEFNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTb3V6YSwgSm9zZSA8am9zZS5zb3V6YUBpbnRl
bC5jb20+Ow0KPiBNaXNocmEsIFBhbGxhdmkgPHBhbGxhdmkubWlzaHJhQGludGVsLmNvbT4NCj4g
U3ViamVjdDogW1BBVENIIGktZy10IDAxLzEyXSBkcm0tdWFwaS94ZV9kcm06IHN5bmMgdG8gZ2V0
IHBhdCBhbmQgY29oZXJlbmN5DQo+IGJpdHMNCj4gDQo+IEdyYWIgdGhlIFBBVCAmIGNvaGVyZW5j
eSB1YXBpIGFkZGl0aW9ucy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQXVsZCA8bWF0
dGhldy5hdWxkQGludGVsLmNvbT4NCj4gQ2M6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uu
c291emFAaW50ZWwuY29tPg0KPiBDYzogUGFsbGF2aSBNaXNocmEgPHBhbGxhdmkubWlzaHJhQGlu
dGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFBhbGxhdmkgTWlzaHJhIDxwYWxsYXZpLm1pc2hyYUBp
bnRlbC5jb20+DQoNCj4gLS0tDQo+ICBpbmNsdWRlL2RybS11YXBpL3hlX2RybS5oIHwgOTMNCj4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgOTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS11YXBpL3hlX2RybS5oIGIvaW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0uaCBpbmRl
eA0KPiA4MDRjMDIyNzAuLjBhNjY1ZjY3ZiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0tdWFw
aS94ZV9kcm0uaA0KPiArKysgYi9pbmNsdWRlL2RybS11YXBpL3hlX2RybS5oDQo+IEBAIC00NTYs
OCArNDU2LDU0IEBAIHN0cnVjdCBkcm1feGVfZ2VtX2NyZWF0ZSB7DQo+ICAJICovDQo+ICAJX191
MzIgaGFuZGxlOw0KPiANCj4gLQkvKiogQHBhZDogTUJaICovDQo+IC0JX191MzIgcGFkOw0KPiAr
CS8qKg0KPiArCSAqIEBjb2hfbW9kZTogVGhlIGNvaGVyZW5jeSBtb2RlIGZvciB0aGlzIG9iamVj
dC4gVGhpcyB3aWxsIGxpbWl0IHRoZQ0KPiArCSAqIHBvc3NpYmxlIEBjcHVfY2FjaGluZyB2YWx1
ZXMuDQo+ICsJICoNCj4gKwkgKiBTdXBwb3J0ZWQgdmFsdWVzOg0KPiArCSAqDQo+ICsJICogRFJN
X1hFX0dFTV9DT0hfTk9ORTogR1BVIGFjY2VzcyBpcyBhc3N1bWVkIHRvIGJlIG5vdA0KPiBjb2hl
cmVudCB3aXRoDQo+ICsJICogQ1BVLiBDUFUgY2FjaGVzIGFyZSBub3Qgc25vb3BlZC4NCj4gKwkg
Kg0KPiArCSAqIERSTV9YRV9HRU1fQ09IX0FUX0xFQVNUXzFXQVk6DQo+ICsJICoNCj4gKwkgKiBD
UFUtR1BVIGNvaGVyZW5jeSBtdXN0IGJlIGF0IGxlYXN0IDFXQVkuDQo+ICsJICoNCj4gKwkgKiBJ
ZiAxV0FZIHRoZW4gR1BVIGFjY2VzcyBpcyBjb2hlcmVudCB3aXRoIENQVSAoQ1BVIGNhY2hlcyBh
cmUNCj4gc25vb3BlZCkNCj4gKwkgKiB1bnRpbCBHUFUgYWNxdWlyZXMuIFRoZSBhY3F1aXJlIGJ5
IHRoZSBHUFUgaXMgbm90IHRyYWNrZWQgYnkgQ1BVDQo+ICsJICogY2FjaGVzLg0KPiArCSAqDQo+
ICsJICogSWYgMldBWSB0aGVuIHNob3VsZCBiZSBmdWxseSBjb2hlcmVudCBiZXR3ZWVuIEdQVSBh
bmQgQ1BVLiAgRnVsbHkNCj4gKwkgKiB0cmFja2VkIGJ5IENQVSBjYWNoZXMuIEJvdGggQ1BVIGFu
ZCBHUFUgY2FjaGVzIGFyZSBzbm9vcGVkLg0KPiArCSAqDQo+ICsJICogTm90ZTogT24gZGdwdSB0
aGUgR1BVIGRldmljZSBuZXZlciBjYWNoZXMgc3lzdGVtIG1lbW9yeS4gVGhlDQo+IGRldmljZQ0K
PiArCSAqIHNob3VsZCBiZSB0aG91Z2h0IG9mIGFzIGFsd2F5cyAxV0FZIGNvaGVyZW50LCB3aXRo
IHRoZSBhZGRpdGlvbg0KPiB0aGF0DQo+ICsJICogdGhlIEdQVSBuZXZlciBjYWNoZXMgc3lzdGVt
IG1lbW9yeS4gQXQgbGVhc3Qgb24gY3VycmVudCBkZ3B1IEhXDQo+IHRoZXJlDQo+ICsJICogaXMg
bm8gd2F5IHRvIHR1cm4gb2ZmIHNub29waW5nIHNvIGxpa2VseSB0aGUgZGlmZmVyZW50IGNvaGVy
ZW5jeQ0KPiArCSAqIG1vZGVzIG9mIHRoZSBwYXRfaW5kZXggbWFrZSBubyBkaWZmZXJlbmNlIGZv
ciBzeXN0ZW0gbWVtb3J5Lg0KPiArCSAqLw0KPiArI2RlZmluZSBEUk1fWEVfR0VNX0NPSF9OT05F
CQkxDQo+ICsjZGVmaW5lIERSTV9YRV9HRU1fQ09IX0FUX0xFQVNUXzFXQVkJMg0KPiArCV9fdTE2
IGNvaF9tb2RlOw0KPiArDQo+ICsJLyoqDQo+ICsJICogQGNwdV9jYWNoaW5nOiBUaGUgQ1BVIGNh
Y2hpbmcgbW9kZSB0byBzZWxlY3QgZm9yIHRoaXMgb2JqZWN0LiBJZg0KPiArCSAqIG1tYXBpbmcg
dGhlIG9iamVjdCB0aGUgbW9kZSBzZWxlY3RlZCBoZXJlIHdpbGwgYWxzbyBiZSB1c2VkLg0KPiAr
CSAqDQo+ICsJICogU3VwcG9ydGVkIHZhbHVlczoNCj4gKwkgKg0KPiArCSAqIERSTV9YRV9HRU1f
Q1BVX0NBQ0hJTkdfV0I6IEFsbG9jYXRlIHRoZSBwYWdlcyB3aXRoIHdyaXRlLQ0KPiBiYWNrIGNh
Y2hpbmcuDQo+ICsJICogT24gaUdQVSB0aGlzIGNhbid0IGJlIHVzZWQgZm9yIHNjYW5vdXQgc3Vy
ZmFjZXMuIFRoZSBAY29oX21vZGUNCj4gbXVzdA0KPiArCSAqIGJlIERSTV9YRV9HRU1fQ09IX0FU
X0xFQVNUXzFXQVkuIEN1cnJlbnRseSBub3QgYWxsb3dlZCBmb3INCj4gb2JqZWN0cyBwbGFjZWQN
Cj4gKwkgKiBpbiBWUkFNLg0KPiArCSAqDQo+ICsJICogRFJNX1hFX0dFTV9DUFVfQ0FDSElOR19X
QzogQWxsb2NhdGUgdGhlIHBhZ2VzIGFzIHdyaXRlLQ0KPiBjb21iaW5lZC4gVGhpcyBpcw0KPiAr
CSAqIHVuY2FjaGVkLiBBbnkgQGNvaF9tb2RlIGlzIHBlcm1pdHRlZC4gU2Nhbm91dCBzdXJmYWNl
cyBzaG91bGQNCj4gbGlrZWx5DQo+ICsJICogdXNlIHRoaXMuIEFsbCBvYmplY3RzIHRoYXQgY2Fu
IGJlIHBsYWNlZCBpbiBWUkFNIG11c3QgdXNlIHRoaXMuDQo+ICsJICovDQo+ICsjZGVmaW5lIERS
TV9YRV9HRU1fQ1BVX0NBQ0hJTkdfV0IgICAgICAgICAgICAgICAgICAgICAgMQ0KPiArI2RlZmlu
ZSBEUk1fWEVfR0VNX0NQVV9DQUNISU5HX1dDICAgICAgICAgICAgICAgICAgICAgIDINCj4gKwlf
X3UxNiBjcHVfY2FjaGluZzsNCj4gDQo+ICAJLyoqIEByZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4g
IAlfX3U2NCByZXNlcnZlZFsyXTsNCj4gQEAgLTU1Miw4ICs1OTgsNDkgQEAgc3RydWN0IGRybV94
ZV92bV9iaW5kX29wIHsNCj4gIAkgKi8NCj4gIAlfX3UzMiBvYmo7DQo+IA0KPiArCS8qKg0KPiAr
CSAqIEBwYXRfaW5kZXg6IFRoZSBwbGF0Zm9ybSBkZWZpbmVkIEBwYXRfaW5kZXggdG8gdXNlIGZv
ciB0aGlzDQo+IG1hcHBpbmcuDQo+ICsJICogVGhlIGluZGV4IGJhc2ljYWxseSBtYXBzIHRvIHNv
bWUgcHJlZGVmaW5lZCBtZW1vcnkgYXR0cmlidXRlcywNCj4gKwkgKiBpbmNsdWRpbmcgdGhpbmdz
IGxpa2UgY2FjaGluZywgY29oZXJlbmN5LCBjb21wcmVzc2lvbiBldGMuICBUaGUgZXhhY3QNCj4g
KwkgKiBtZWFuaW5nIG9mIHRoZSBwYXRfaW5kZXggaXMgcGxhdGZvcm0gc3BlY2lmaWMgYW5kIGRl
ZmluZWQgaW4gdGhlDQo+ICsJICogQnNwZWMgYW5kIFBSTXMuICBXaGVuIHRoZSBLTUQgc2V0cyB1
cCB0aGUgYmluZGluZyB0aGUgaW5kZXggaGVyZQ0KPiBpcw0KPiArCSAqIGVuY29kZWQgaW50byB0
aGUgcHBHVFQgUFRFLg0KPiArCSAqDQo+ICsJICogRm9yIGNvaGVyZW5jeSB0aGUgQHBhdF9pbmRl
eCBuZWVkcyB0byBiZSBsZWFzdCBhcyBjb2hlcmVudCBhcw0KPiArCSAqIGRybV94ZV9nZW1fY3Jl
YXRlLmNvaF9tb2RlLiBpLmUgY29oX21vZGUocGF0X2luZGV4KSA+PQ0KPiArCSAqIGRybV94ZV9n
ZW1fY3JlYXRlLmNvaF9tb2RlLiBUaGUgS01EIHdpbGwgZXh0cmFjdCB0aGUgY29oZXJlbmN5DQo+
IG1vZGUNCj4gKwkgKiBmcm9tIHRoZSBAcGF0X2luZGV4IGFuZCByZWplY3QgaWYgdGhlcmUgaXMg
YSBtaXNtYXRjaCAoc2VlIG5vdGUNCj4gYmVsb3cNCj4gKwkgKiBmb3IgcHJlLU1UTCBwbGF0Zm9y
bXMpLg0KPiArCSAqDQo+ICsJICogTm90ZTogT24gcHJlLU1UTCBwbGF0Zm9ybXMgdGhlcmUgaXMg
b25seSBhIGNhY2hpbmcgbW9kZSBhbmQgbm8NCj4gKwkgKiBleHBsaWNpdCBjb2hlcmVuY3kgbW9k
ZSwgYnV0IG9uIHN1Y2ggaGFyZHdhcmUgdGhlcmUgaXMgYWx3YXlzIGENCj4gKwkgKiBzaGFyZWQt
TExDIChvciBpcyBkZ3B1KSBzbyBhbGwgR1QgbWVtb3J5IGFjY2Vzc2VzIGFyZSBjb2hlcmVudCB3
aXRoDQo+ICsJICogQ1BVIGNhY2hlcyBldmVuIHdpdGggdGhlIGNhY2hpbmcgbW9kZSBzZXQgYXMg
dW5jYWNoZWQuICBJdCdzIG9ubHkNCj4gdGhlDQo+ICsJICogZGlzcGxheSBlbmdpbmUgdGhhdCBp
cyBpbmNvaGVyZW50IChvbiBkZ3B1IGl0IG11c3QgYmUgaW4gVlJBTSB3aGljaA0KPiArCSAqIGlz
IGFsd2F5cyBtYXBwZWQgYXMgV0Mgb24gdGhlIENQVSkuIEhvd2V2ZXIgdG8ga2VlcCB0aGUgdWFw
aQ0KPiBzb21ld2hhdA0KPiArCSAqIGNvbnNpc3RlbnQgd2l0aCBuZXdlciBwbGF0Zm9ybXMgdGhl
IEtNRCBncm91cHMgdGhlIGRpZmZlcmVudCBjYWNoZQ0KPiArCSAqIGxldmVscyBpbnRvIHRoZSBm
b2xsb3dpbmcgY29oZXJlbmN5IGJ1Y2tldHMgb24gYWxsIHByZS1NVEwgcGxhdGZvcm1zOg0KPiAr
CSAqDQo+ICsJICoJcHBHVFQgVUMgLT4gRFJNX1hFX0dFTV9DT0hfTk9ORQ0KPiArCSAqCXBwR1RU
IFdDIC0+IERSTV9YRV9HRU1fQ09IX05PTkUNCj4gKwkgKglwcEdUVCBXVCAtPiBEUk1fWEVfR0VN
X0NPSF9OT05FDQo+ICsJICoJcHBHVFQgV0IgLT4gRFJNX1hFX0dFTV9DT0hfQVRfTEVBU1RfMVdB
WQ0KPiArCSAqDQo+ICsJICogSW4gcHJhY3RpY2UgVUMvV0MvV1Qgc2hvdWxkIG9ubHkgZXZlciB1
c2VkIGZvciBzY2Fub3V0IHN1cmZhY2VzDQo+IG9uDQo+ICsJICogc3VjaCBwbGF0Zm9ybXMgKG9y
IHBlcmhhcHMgaW4gZ2VuZXJhbCBmb3IgZG1hLWJ1ZiBpZiBzaGFyZWQgd2l0aA0KPiArCSAqIGFu
b3RoZXIgZGV2aWNlKSBzaW5jZSBpdCBpcyBvbmx5IHRoZSBkaXNwbGF5IGVuZ2luZSB0aGF0IGlz
IGFjdHVhbGx5DQo+ICsJICogaW5jb2hlcmVudC4gIEV2ZXJ5dGhpbmcgZWxzZSBzaG91bGQgdHlw
aWNhbGx5IHVzZSBXQiBnaXZlbiB0aGF0IHdlDQo+ICsJICogaGF2ZSBhIHNoYXJlZC1MTEMuICBP
biBNVEwrIHRoaXMgY29tcGxldGVseSBjaGFuZ2VzIGFuZCB0aGUgSFcNCj4gKwkgKiBkZWZpbmVz
IHRoZSBjb2hlcmVuY3kgbW9kZSBhcyBwYXJ0IG9mIHRoZSBAcGF0X2luZGV4LCB3aGVyZQ0KPiAr
CSAqIGluY29oZXJlbnQgR1QgYWNjZXNzIGlzIHBvc3NpYmxlLg0KPiArCSAqDQo+ICsJICogTm90
ZTogRm9yIHVzZXJwdHIgYW5kIGV4dGVybmFsbHkgaW1wb3J0ZWQgZG1hLWJ1ZiB0aGUga2VybmVs
DQo+IGV4cGVjdHMNCj4gKwkgKiBlaXRoZXIgMVdBWSBvciAyV0FZIGZvciB0aGUgQHBhdF9pbmRl
eC4NCj4gKwkgKi8NCj4gKwlfX3UxNiBwYXRfaW5kZXg7DQo+ICsNCj4gIAkvKiogQHBhZDogTUJa
ICovDQo+IC0JX191MzIgcGFkOw0KPiArCV9fdTE2IHBhZDsNCj4gDQo+ICAJdW5pb24gew0KPiAg
CQkvKioNCj4gLS0NCj4gMi40MS4wDQoNCg==
