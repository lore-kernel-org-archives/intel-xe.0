Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB9DC7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 18:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D950110E0AE;
	Fri,  9 Jun 2023 18:36:06 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F86F10E0AE
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 18:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686335765; x=1717871765;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=seAzB1IGk6Zqz3+E7OyNj5jNk1rugCX/0U+xCZa8zfU=;
 b=N8RhYWR7F4KDEnyduhZe7t8NI3/xrlanTcpXUAYV2FvLw9P7knj1BOhk
 2owNT+d/+ng+7oZpMxNMRBIFH6rQJMo9BVLhxEoLoSSz4xE5fzoZBU2w9
 2sShbtPyopIaoLTCKvd+qLgd+Ry22vSnczlrczhHXCKZ7at5u0vaZBTXZ
 +DcLD1iXg5LR5XWJPrYqw1aNARU3XYOp8C3RhdOGtQvZDIz0RyWz+hgxm
 I0F6PLukzBK+h1iXyL+hYxsvIMOvguYqjlxsduVtvH07RDG0op75AJxZU
 oRwbTapyZJtdo/PaVkU/E7AjX/LvhzfIl2zcGEUvMRtFjAgjIY0X1u5iG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="338021936"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="338021936"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 11:36:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="710443752"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="710443752"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 09 Jun 2023 11:35:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 11:35:56 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 11:35:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 9 Jun 2023 11:35:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 9 Jun 2023 11:35:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAAMt4YF7NwAmDN7pXJFmCzs+5JukMhSi/mkMPZflSDRZsKv1qWJGWoophnUVoy/qPnvOjeU4/Mj2aokfMIh/KdKm++pAPBm6J+i9LRyjz0MeV+QmnZwZQFtas040rgEsS8iEHQhFL+/DCtuR47zwETRVsPcb4+LskC850n8m1x7s9olZZ5HsB9JbWT3dwVJTLWY7ZSibIlqe1tGg4XynU8gGU7Wg/4v1qQumtarVYTDJeKsLW8xHNBz5HAMbtBlYsEfTfIqC4RsJI4RgEHHzzMIK0E1D6qEksfGfJVEorNyN0GMWlTvLUrWRR2SoN5T2b1+m59TyyQUXc4uCmmTmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seAzB1IGk6Zqz3+E7OyNj5jNk1rugCX/0U+xCZa8zfU=;
 b=WRahMar/hHqVOtw4zoTDyRY7XQLQLsKMpQl7NgX24E3YmTmpqnlo1K61klaEWmqmDGQBMkLwD5ZD434N3zg/ASgKhkcQLU2StSB7KrbyhcV6PxjWWxe/IWaoaY6W7nF0pSKhqE8iSLY9lIhSprCG0k1hgymLSNSxeKGsnvVaCl04f3h8wIfOOpmAPVw19DHlqOZOffnQSZ/4ZEQTDY1bBDNTbO/XmcDKV9nTEJ58GAjXmzZo21z5oZKlCL1d700u0NveE2716DHQsTl0CN2BVHCG//u8a+kgj+wOrTO2TcrhPfqVFYVkxyrVvm2sviqVa92FPyRNrkgbZRWkhf0ceA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by LV3PR11MB8460.namprd11.prod.outlook.com (2603:10b6:408:1b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 18:35:51 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6455.034; Fri, 9 Jun 2023
 18:35:51 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Thread-Topic: [Intel-xe] [PATCH 3/3] drm/xe: Use Xe ordered workqueue for
 rebind worker
Thread-Index: AQHZmv/v/NKxBBmaBE2VOhBmrbWKnK+CzGeA
Date: Fri, 9 Jun 2023 18:35:51 +0000
Message-ID: <e0819c3e445e72ea9969263aa852f9852b968866.camel@intel.com>
References: <20230609182627.143150-1-matthew.brost@intel.com>
 <20230609182627.143150-4-matthew.brost@intel.com>
In-Reply-To: <20230609182627.143150-4-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|LV3PR11MB8460:EE_
x-ms-office365-filtering-correlation-id: 09ecfe97-0083-4d18-958f-08db691859e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Oa2JVTqjBehCLLgN1U73f7eIma4O4vsx5mcUdpM9iHdaRV9sBlXT4kFL0o6xxXr7ejLx4rt6g2uhC7XlpFEmqYAoCXNmFg5YgeEML3dkPmh0gy1K+70Vb+DhJBbiapVDFBZ6dE9X/YPmdR+7xKIj7499Fxa99vvfs/AB6hPrhMtS7XRgr8LSAcbCgEexOXgU+qC5z0YHse4LpvA2+tsfzU36SVSGTTg9W0asU+FDl7NEEm6DMKLAOn888xK+P6vvbFKfrHMl5u4xvA0VE4oCifOHwE143BfFf1bTZhf/q3oGscKPrFw+ey31Y+3NOY1ldeva0482uYjlXwbZxQikv3GegWY+gxL9oiOCQcWjRAfcwN3mCBxa76LQYCUG/eD0fjN6CQLGVQHWQD3tycHyFFqxN2m3FMBixiMXHV5jLg6N8a4/sOUSNCPBP65jtqtNlWYHg0n/snWEKtUOQ2By6iIoWmvWjOfI0yRW+gJCJZA/ELCkRZMVOOfkM5mFA8bjPKvXjx4Z9YImRjqJb8euSRao2PZbKtH3KsGe2vhmpEBXTMU3df2uhu7hReXObaPm8fEB66Km+2l0goOpYqc/dld+fwAgmk8h+jH91gujnpRLxJUEIUd4D5xXoywX59wr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199021)(2616005)(6512007)(38100700002)(6506007)(41300700001)(6486002)(26005)(83380400001)(186003)(71200400001)(478600001)(110136005)(64756008)(122000001)(91956017)(66446008)(316002)(66946007)(82960400001)(76116006)(8676002)(66556008)(66476007)(6636002)(8936002)(5660300002)(2906002)(38070700005)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVVEQzBJVTdYNGxRR2NuZC9iRFc4ZVlKV1pOSzVUOEVrdXdLSVRpdGpMUldz?=
 =?utf-8?B?aXhhay9YYkJRU0MraFlBOTVPdnkrS0VxOW12M1BhTU9paXAzNjhWL0hEcUR3?=
 =?utf-8?B?RVpmMmxpTnluQXY0S1JKUmowemRjU09XcVd1TlZaWEdSR2VVMW5oZlR4ZzhH?=
 =?utf-8?B?UzE0QVNtVGVITHoySHpGcWJXeVM4S1dwSmY4ejMxR1VFRGk3cEhKdjZrdXRS?=
 =?utf-8?B?S2pXL1VqR0tNMVNCcFRKLzR3NURGZ1FmUWhOUVFlbDFHbUVuTDFSck5QT3pD?=
 =?utf-8?B?NUtsZUJ2MndseTZKQnBlTkJhVjh2bytzckZNRVRIVExFdTVCQ2JpM1FUVGpa?=
 =?utf-8?B?c0kvN05zVEQwSndNYVgyQlExTnptUGUvOS85NUVJVVY3a2xwZFpudFpQRllI?=
 =?utf-8?B?aFRIbkNTN1NPNGZLQm90cDYvMG1ac3VYdXJyd3FYcFUrb1oyKytrcGxrVUxq?=
 =?utf-8?B?eGMzWWNxNUI3UksyZ1hyaVlyL3dqWFZ1QWVaekJlRUZEYjUwSzVERWR5c1Qx?=
 =?utf-8?B?S1o2emkrM3oxd3NRUGVheDJhK3JhZ2lXUE1aSWc1d2psQ3JEQTVRVmVVR09s?=
 =?utf-8?B?dHBnTDRIRnVxUXgzOThzKy9OdnFIaThaL0ZkbUFkNHVjNWs5V21xR1NEaTFi?=
 =?utf-8?B?Nkx2WEIrdC8wd2p2dm0rQU93R2JCR3lmMzF2YWFWcm5ScWxqMkZZYzFuWWhZ?=
 =?utf-8?B?R2JaRmNDZDJnTjVBc0dkOGZmamt4cFR1QWJTRFJuWkIxaDVLUzlGTUhkaFFW?=
 =?utf-8?B?QkNEbXRiazY0eWFibVNja29rWDJYVUxaYnZaQVFhSkFNaUwwTTZnL2hBbUxW?=
 =?utf-8?B?eC9sL2R4Q2hxeDlGZmJtRWdYWG5RNFM5UElweG5EUHQrV2p1aUpBYytpbjlu?=
 =?utf-8?B?dHd4Ymtxd2NiVjh2THFzWkFSSlVqS3ZhME5IRnRuRnd2VzFCTys2WHJudjFM?=
 =?utf-8?B?M2VjRW9rSzMzeWg1ZGNucFZ2aDVhMVkva0JvekZiTElMUkZETzdLTEZ3UlBp?=
 =?utf-8?B?N2VoblNVa04wTElZQVdNVlpraTB2MkNYWENubURlYnhhMUJXZjNKWnJzTFZS?=
 =?utf-8?B?UUhCM3U4dHprTlViVmV2N2lKNmlDc1pPRkZ0eTloVlpLYWh6d2o4L0RkaVBT?=
 =?utf-8?B?Tm5kQVNrM3lXcmR4ZTdhTitucEJwekFjcWw3WEV1WlhhbUVqYmpBK3RGbFYw?=
 =?utf-8?B?a1VWdjVVbFNGbHBJblM4Q09ZdmJLQmhIbW5wR1llU1pUYlFJNUcwa2QxSnlQ?=
 =?utf-8?B?a0VreCtiYU5rb0JIekoxTm94YlRBaHlzandJNXhmVTdoZG91WTJRUko2T2I4?=
 =?utf-8?B?QnpvcnFRcklJK2RHdkd2RmpNY1JtOTF5MEhaT2hIOEFMajVCV2k2ZEtVakJX?=
 =?utf-8?B?TWNZc2VycUxvcmVJUTY0N1N3VEd0UWV6bjlyUzZJTTdwUE5CcDJMci83RjNu?=
 =?utf-8?B?bEh4U0FrUzhYSGJla0g0QUt4WHFYUSt5KzZzenpmSnRCUHI4TXBpdzA2NGQw?=
 =?utf-8?B?T0Q1MVJ3K2t0SnBZRWtuMnBHZEZDNlNsVnBGWldCYXEyKzVzRFREVlNGM2x3?=
 =?utf-8?B?OC81MWJVMVB0UDRlRmtDYmVOOGZyQlQ4by8xZjhmamRYUWJSTE50MlZYWHcx?=
 =?utf-8?B?SmdLeHQ3cWg3eXh6QW1mTWtSTHIrRTZVNTRMSmY1eC91OGNJY0VIanU2bjRR?=
 =?utf-8?B?MmRDWmlMTEtpQ2x6eGpCYmlLYVFiNXlVQjcrYnZ2eEFnekNpdkI4RU9CNGNQ?=
 =?utf-8?B?ektWQm8xYUFrdjUyckdDOG1GR1dBZmtxS1VLTmpDbGVjRVZoM2lQVkIxdlBh?=
 =?utf-8?B?YytRUFdyaEdjd0wyZm9RVjFiVlc5OEpIdC96cG85ZWxpUyt4d1JGN1pDa2Rx?=
 =?utf-8?B?cTBTY2txaHc4VXZVdGRGVHFxczdtUEpZM25NWXZEeGRITUZabTNaKzN0N1M5?=
 =?utf-8?B?T0cwcTBjSko1RUUyNGdLR0RZRTNRSEtDQURYSkFVdi8vTWlzT3lMc3g1dSty?=
 =?utf-8?B?K0tLcG9jVnF3clB3ZDZvSlNyTGRjYzJXZ0Zmc1lDcStUUzc4YTdKNXpBempa?=
 =?utf-8?B?d2Y5RUZQVnVyYzI2eHQ5WDZJTTFDenY3ZVhJSzdwMFdzRmJZbUdnUVN1SXBt?=
 =?utf-8?Q?8RjkDIfwqBp4teq4nbI782Bfb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4C006A4E9C4274494FB3920A0FE4B52@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ecfe97-0083-4d18-958f-08db691859e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 18:35:51.0795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YKqx+6feDfww57UdvsdciTRCyv3VnE8c2rCXF3xJKOFnU96ov0YmkQo2De9QWGxWqgjdnA/1xaz4huu7vcrPOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8460
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Use Xe ordered workqueue for
 rebind worker
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

T24gRnJpLCAyMDIzLTA2LTA5IGF0IDExOjI2IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBBIG1peCBvZiB0aGUgc3lzdGVtIHVuYm91bmQgd3EgYW5kIFhlIG9yZGVyZWQgd3Egd2FzIHVz
ZWQgZm9yIHRoZQ0KPiByZWJpbmQsIG9ubHkgdXNlIHRoZSBYZSBvcmRlcmVkIHdxLiBUaGlzIHdp
bGwgZW5zdXJlIG9ubHkgMSByZWJpbmQgaXMNCj4gb2NjdXJpbmcgYXQgYSB0aW1lIHByb3ZpZGlu
ZyBhIHNvbWV3aGF0IGNsdW5reSB3b3JrIGFyb3VuZCBmb3Igc2hvcnQNCj4gY29taW5ncyBpbiBU
VE0gd3J0IHRvIG1lbW9yeSBjb250ZW50aW9uLiBPbmNlIHRoZSBUVE0gbWVtb3J5IGNvbnRlbnRp
b24NCj4gaXMgcmVzb2x2ZWQgd2Ugc2hvdWxkIGJlIGFibGUgdG8gdXNlIGEgZGVkaWNhdGVkIG5v
bi1vcmRlcmVkIHdvcmtxdWV1ZS4NCj4gDQo+IEFsc28gYWRkIGhlbHBlciB0byBxdWV1ZSByZWJp
bmQgd29ya2VyIHRvIGF2b2lkIHVzaW5nIHdyb25nIHdvcmtxdWV1ZQ0KPiBnb2luZyBmb3J3YXJk
Lg0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRl
bC5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJv
c3RAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wcmVlbXB0X2Zl
bmNlLmMgfCAyICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyAgICAgICAgICAgIHwg
MyArLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5oICAgICAgICAgICAgfCA2ICsrKysr
Kw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ByZWVtcHRfZmVuY2UuYyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wcmVlbXB0X2ZlbmNlLmMNCj4gaW5kZXggNzhhZDhjMjA5
ODczLi4yMTllZWZlYjkwZmYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9w
cmVlbXB0X2ZlbmNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ByZWVtcHRfZmVu
Y2UuYw0KPiBAQCAtMjUsNyArMjUsNyBAQCBzdGF0aWMgdm9pZCBwcmVlbXB0X2ZlbmNlX3dvcmtf
ZnVuYyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKncpDQo+ICAJZG1hX2ZlbmNlX3NpZ25hbCgmcGZlbmNl
LT5iYXNlKTsNCj4gIAlkbWFfZmVuY2VfZW5kX3NpZ25hbGxpbmcoY29va2llKTsNCj4gIA0KPiAt
CXF1ZXVlX3dvcmsoc3lzdGVtX3VuYm91bmRfd3EsICZlLT52bS0+cHJlZW1wdC5yZWJpbmRfd29y
ayk7DQo+ICsJeGVfdm1fcXVldWVfcmViaW5kX3dvcmtlcihlLT52bSk7DQo+ICANCj4gIAl4ZV9l
bmdpbmVfcHV0KGUpOw0KPiAgfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiBpbmRleCAxOTY2YTU4M2I3NjEu
LjIwOGUyZjBiZjQxZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gQEAgLTMxMDMsOCArMzEwMyw3
IEBAIGludCB4ZV92bV9iaW5kX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRh
dGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkNCj4gIA0KPiAgCQkJLyogUmViaW5kcyBtYXkgaGF2
ZSBiZWVuIGJsb2NrZWQsIGdpdmUgd29ya2VyIGEga2ljayAqLw0KPiAgCQkJaWYgKHhlX3ZtX2lu
X2NvbXB1dGVfbW9kZSh2bSkpDQo+IC0JCQkJcXVldWVfd29yayh2bS0+eGUtPm9yZGVyZWRfd3Es
DQo+IC0JCQkJCSAgICZ2bS0+cHJlZW1wdC5yZWJpbmRfd29yayk7DQo+ICsJCQkJeGVfdm1fcXVl
dWVfcmViaW5kX3dvcmtlcih2bSk7DQo+ICAJCX0NCj4gIA0KPiAgCQlnb3RvIHB1dF9lbmdpbmU7
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uaCBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV92bS5oDQo+IGluZGV4IDg1ODIwN2EyMDAxNy4uNjA4NmM0NTVhNTFkIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uaA0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdm0uaA0KPiBAQCAtMTM0LDYgKzEzNCwxMiBAQCBpbnQgeGVfdm1hX3VzZXJw
dHJfcGluX3BhZ2VzKHN0cnVjdCB4ZV92bWEgKnZtYSk7DQo+ICANCj4gIGludCB4ZV92bWFfdXNl
cnB0cl9jaGVja19yZXBpbihzdHJ1Y3QgeGVfdm1hICp2bWEpOw0KPiAgDQo+ICtzdGF0aWMgaW5s
aW5lIHZvaWQgeGVfdm1fcXVldWVfcmViaW5kX3dvcmtlcihzdHJ1Y3QgeGVfdm0gKnZtKQ0KPiAr
ew0KPiArCVhFX1dBUk5fT04oIXhlX3ZtX2luX2NvbXB1dGVfbW9kZSh2bSkpOw0KPiArCXF1ZXVl
X3dvcmsodm0tPnhlLT5vcmRlcmVkX3dxLCAmdm0tPnByZWVtcHQucmViaW5kX3dvcmspOw0KPiAr
fQ0KPiArDQo+ICAvKg0KPiAgICogWEVfT05TVEFDS19UViBpcyB1c2VkIHRvIHNpemUgdGhlIHR2
X29uc3RhY2sgYXJyYXkgdGhhdCBpcyBpbnB1dA0KPiAgICogdG8geGVfdm1fbG9ja19kbWFfcmVz
digpIGFuZCB4ZV92bV91bmxvY2tfZG1hX3Jlc3YoKS4NCg0K
