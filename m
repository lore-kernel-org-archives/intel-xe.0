Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C76BC77B78
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 14:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EC110E13B;
	Thu,  4 May 2023 14:08:12 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D0D10E13B
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 14:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683209291; x=1714745291;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fxM9x4hDHPJT2KtnyixiXbkyL9OEu8jDJeQXNdrKpYo=;
 b=XeIsPfKGMqgrmJm1uikRzlqZ67xpzSm6IPYot+wYJdDBFVvhPBgYx7KG
 t6Q1n1NpaNrnoen67V3heMg/t5rnOtPSHa4vUzSmK92+Q+kAXHw5IfKKN
 14FRchlQ+ZCeVRAVQ7VBmyLebd3hwx1Tfvbf499jUmRmORS5ou0fcwNm/
 r7tCDCk2f41lOyOy30tZcDpMNb5kOwGxHfESBOhoEHNak4181ZJG0JF6P
 IIwPXzhrMdKfqaJTn6tudwfAsZxvGZkXW/yYrabWzUA96V9UoaddrwoNw
 w8Gq4oC65jUijB14EUUuybhiaelyuZAabGkqHcqVuhlFA9Fs8Ml9GBkY2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328558417"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="328558417"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 07:08:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="871364156"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="871364156"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 04 May 2023 07:08:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 07:08:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 07:08:07 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 07:08:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAsTyqjNsG7ZFpzg0ae7XFNXa5/33s0eUAJbfgtax/QJx3EY7Y6bvPqXTesnwSg3r9hRJwowL52ziv4B4CJK9Hr8l6v7oJ9pLWgd2XqIiBI+vPgAn4Q4vLF+43UTjYP/NpgBf9AF2q4ofEO/UCbk47Cam23ChG/mExBhRjcR4IVAa0ITYe5yCY7tJoWAPjRI8Zerd+QJwtwNBcgoQqpSKQTP0/E6oc1U8LLNQZ6mWg6nP3UZLWE+joRs8F9eRylxJEzd6N2p6gqJ/c5b81BwIMpdSliLSAiP7jF/ckO4UJCfm6970hDkDXIUfE4iL6S0IujneuMVIrzCGt6tb/lTkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxM9x4hDHPJT2KtnyixiXbkyL9OEu8jDJeQXNdrKpYo=;
 b=IOP4lSsNk5Ybcj9DVGnJBBIzVWmaqbwO+OOqM5ZLUfn96IFsKypye1ag5N2eNXEd0PqAZWCKR3TtIzcrcwLxm6pA5y/q7gwPbHJPISBa57+lDfbespFm5zm1nmmJwxuh4Vbb68v4KUQXYFnKFiyZT+VF03xJqI6trzSxIjxmd5cuhmjPnr9CrQ6iGlZP/ew63HTBHmq392T3BWFM4oNd2VbaZcnhsqYqhDhEd2BblrcrKU/Xke1/xVZuz5GTCNm20RlpMcdmfbR+edgsXaaKCEXxmVxK1DKPnlVTOVYJ8x1nBSLBIbmnAT1U3GAD5cvr9fkqTv9qjGkBwF9NEDC2mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB4782.namprd11.prod.outlook.com (2603:10b6:a03:2df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 14:08:05 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 14:08:04 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [PATCH v3 2/2] drm/xe: Set default MOCS value for copy cs
 instructions
Thread-Index: AQHZfdyarXysIhcSGUe6jhuAgfU1NK9JKvaAgAD8/IA=
Date: Thu, 4 May 2023 14:08:04 +0000
Message-ID: <37e9a4d8fa66e2c695a13c176ee1a312d8641308.camel@intel.com>
References: <20230503163013.50231-1-jose.souza@intel.com>
 <20230503163013.50231-2-jose.souza@intel.com>
 <20230503230233.GM10045@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230503230233.GM10045@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB4782:EE_
x-ms-office365-filtering-correlation-id: 374db52d-7ebb-4fa4-6bf8-08db4ca8fa6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MvOvhDtXx92ytmaZhaYrA6iWGFs63a0OanjKvVJd5D5bMw8heWqr+U0aElCYixTqDeEMnFwwFHWAuQGBHQMTVnixNw4U1ticZc++TuJjVPmKGg4EUiFZcxkIx7mcH/8MErNs5ctVfdP27HX9an5dJroek9X8I6GIj4ubQXmVHvPz1s1j4EKyHJ45LqefZUqo2zGl0X9hvcGFAaMKQix6kp9ZR/hKLJU7GY9/w4J/LHwr9CzeROtFaOT0s0Ueq3Yb2won75xfYM2k6ImS4cHg6A7P3AI2G+n1/HhiNFY5KIuZqgy7vrcuIOhkd0sMXeQDqA7VHgXp2WrL+ASbFQ8+epDHK/VIGo8AxLTI9GYAwPm2RQLYD1tZjmN9ICi3x2jwjXiXyFjw56r92wWs+y8r1/OgHuVt/8j7in1cPUJ6tWO97wZdnTjrlKhqEsDz274H0AyII24c//yWQuBR/956g9uHvv+NSh8Thry8dD14G6HC65DCts2HSAYkjXa0R7Mnj84KOdT8s7Erfx58MZSk46VTAPDQS6NJhhut4fR8tn9fiCjKKznYGRp/eIBxxoUDrLqCoX0wNW/4Z8WZ2BjUF2i7J3XE/u7TcY3vrjZ62pecy6KxEWzUSS2MbatD6fKR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199021)(478600001)(37006003)(122000001)(83380400001)(38100700002)(82960400001)(38070700005)(2906002)(2616005)(86362001)(6486002)(76116006)(66946007)(64756008)(66556008)(66446008)(26005)(66476007)(316002)(6506007)(6512007)(91956017)(6636002)(4326008)(186003)(6862004)(36756003)(8676002)(8936002)(5660300002)(41300700001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWszbmlxQ0JPNlkyd0xGNnhzMTZjcm5uU3RiZXozZ3hNMW0rZmxXbENuRXF1?=
 =?utf-8?B?R0hkSUw4TXZoaG9EKzhhanhCV0VpU0s4WUI1cmRFRHYvUHlmNEwvUC9sY1Uy?=
 =?utf-8?B?Sm1FdldZOWpjS2ZOZnlGMzJra0tHQ01ReTVIS1VtcFZ2VHQyTFlFcEd1bGVZ?=
 =?utf-8?B?b1l5Z0FUSE5VU3VpOGVvMVNZcWsrQk1oaWtldUNUMys2bVl3K3hYWXNQelk5?=
 =?utf-8?B?bFRVOWpncHh4b2EzQTZzeXF1YUVwRDRac1dXTjg0Qjd6MGEzUDJ2b01XUzc0?=
 =?utf-8?B?dWxYVW1mZ05CZ1hqeGNGd3Y0d3MrN1k0dzlBdTN6NVNPMkhXQjJXL2Q2WDh5?=
 =?utf-8?B?Q3Y2ZzNDRVJSSHl3blFmRHM1VmQwOExTWDdQQWI5Sks3eElmVHBOTHJqQjBP?=
 =?utf-8?B?SFZ5bmFMYVY2R2FPZjJnT0ZkNWV4UnlodUQxSlJ4U0pucE9lZ3B1aXFqVDFQ?=
 =?utf-8?B?WFllamtOMXBxeTFmSnFmV3RpaTJlelBLYVBPOHQwSW8vZkMwYVJHSTFtZkti?=
 =?utf-8?B?eTVoYmh4a1N1REppbGpYeWpoL1lJY1hKMk1mV21Tc2RtaUJVR0dxTkFuaDZV?=
 =?utf-8?B?L0ZzTjByclFkUHZpdmxtRHJXRnh2QWF5SnRYaS9EcXVDTUYzODlFcTYzd3JC?=
 =?utf-8?B?Q3RkQThEbmZ1N3VzUVJHS3EwczdkRDZIWEM4d2FwaXNMRzUyUUhLdFRyMVFh?=
 =?utf-8?B?QWVmb3B1TmxGTmNBKzA3bk9VcFZ6N0xLT2ZXTXBYV0NGZ2wwNVNxY3hTSTdB?=
 =?utf-8?B?ZUFTZWVPenBFRkV6Z2tydEFVSUlkWnRiK1JsS0kwOU15cEViU2FDZlBVYkF6?=
 =?utf-8?B?WHVkempZL0VFcUZjZ0dac0FrNksraXRYNkthdUdFdFNDZHY0QnhlRmlxVWU1?=
 =?utf-8?B?K2ZOS2dPcWoyM2k1K0l4RmR5OTNiT2NUV3dhZldaYUtYL0JMeDJYM1ZaVWM0?=
 =?utf-8?B?SHBUaUJ5TEZxYWRTRDNRMm00SnZxZ2hZVDR3Qk1HQUFCR0NrOXVNTGRnMXdU?=
 =?utf-8?B?MjNVdDFkVnVndWpHSEFUc1RpWFRlbXNrYTl0Y29YWHM2QUJSa2pYa24zLy9O?=
 =?utf-8?B?NnVzSnUzNmFrVUg0bHZUOFpLTURvSHBleGd6TXZ1N1VJQmc5cGY5UXU5RTNC?=
 =?utf-8?B?T0UvK21hSkVIaEMyTlVhUE1OdjB6UktuRjlQcE8yeXN3OUhHU1RoT2RsRXUv?=
 =?utf-8?B?czdRWkJYcVhFL3duNFpBbGFuQ015RkxxTnBZWVFIVSt3cWlXNlI4WWRtSTlp?=
 =?utf-8?B?QjlvaUR5LzlZOVBWNjBENWxGR0s1Q1dCSnArd0FPNGJPYWJPSFloZnhmNjZE?=
 =?utf-8?B?VjV6NmJwc3p0WVRYdmNiM2JOOGM1RlFaOElEbTl1T3RCOXZySk01R29OVndj?=
 =?utf-8?B?NDdVdkpnaUlmK3J0cVB6T3h1TEJ3eWhEZmVoT3ZLTEZ1NmVKZ3JnZjRjdzRJ?=
 =?utf-8?B?QlZGTnFUbFNWS1hiYXJHL1dYMFpnR1g3Qm9DaVBPVEZoaEVnaE5RcksxaXdk?=
 =?utf-8?B?ZHlPU3VYWWcvVXUwcXc1SjRCV1VsNlYxRnJEc0VxZHNQdU51c2ZjN2VsZlBF?=
 =?utf-8?B?dnpMd3pGVERHWUV5L3RXVGNWZDQ3Y3ZTcmFkRXdrV1pRQ0YyeDJNeDRvcXF2?=
 =?utf-8?B?V3JoWGlNM3J4Q2dRaSs4WWhTT1pQOGNWbXFKU0pkdWpoZFRVeWVxdjFpUG9M?=
 =?utf-8?B?WXlzRktmMUtxNGJOVFQ2bldGM1I1Y1JYQjFHeTVwUEJuajZaOU1oeStpcUZZ?=
 =?utf-8?B?R0RUb3NsYmpZdUVVaTlURHp5QWdUSVFscWJlOU9vaUVZRStycHR1SENyK3FE?=
 =?utf-8?B?NnNLYytrVGdCTjgyckRHQ1hWdERJZjBjK00xMVZvNzRmNFU4MzlqOUVGZytY?=
 =?utf-8?B?RUtsalVTUE81YnUyYkptZjlhTGcvTDFvT1VVNnlHK3RmWG1VUFJXd25Ed2dV?=
 =?utf-8?B?VW9SUDhqVFAxb1RhMFY2QjF1Z1M1TzJodjRqUnhWVS9Wak9mV2pwVnVBUmZx?=
 =?utf-8?B?ZER3eDF3UjVNKzVJSkEwbDN3eWhHb3B0YWFoNU1vVVRFSkl5UEF2L1J5UEpN?=
 =?utf-8?B?MjgvVTlyOXl3U25YZ1ppT2E1MDJzaU5GZlpyd1BDWDVHTkc4bjFlelZTellu?=
 =?utf-8?Q?cmEOsv5c7kltZ+ckiURohQeyR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A7ABCDA4562094F8F2AC09EC77C9DED@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 374db52d-7ebb-4fa4-6bf8-08db4ca8fa6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 14:08:04.2267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lqnk3f4LjJAwhm6RhxpUQoVnxMWEOBIF7jntOsLvHAPXbaT19fGLP/d5b1xGCI37CMz4speIpvrEGNsFAJfQrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4782
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe: Set default MOCS value for
 copy cs instructions
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

T24gV2VkLCAyMDIzLTA1LTAzIGF0IDE2OjAyIC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBXZWQsIE1heSAwMywgMjAyMyBhdCAwOTozMDoxM0FNIC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRl
IFNvdXphIHdyb3RlOg0KPiA+IGNvcHkgY3MgaW5zdHJ1Y3Rpb25zIHRoYXQgZG9udCBoYXZlIGEg
ZXhwbGljdCBNT0NTIGZpZWxkIHdpbGwgdXNlIHRoaXMNCj4gPiBkZWZhdWx0IE1PQ1MgdmFsdWUu
DQo+ID4gDQo+ID4gVGhpcyB3YXMgbWFpbmx5IGNvcGllZCBmcm9tIGk5MTUgc291cmNlIGNvZGUu
DQo+ID4gDQo+ID4gdjI6DQo+ID4gLSBtb3ZlIHRvIHhlX2h3X2VuZ2luZS5jDQo+ID4gLSByZW1v
dmUgQkxJVF9DQ1RMIGF1eGlsaWFyeSBtYWNyb3MNCj4gPiAtIHJlbW92ZWQgTUFTS0VEX1JFRw0K
PiA+IA0KPiA+IHYzOg0KPiA+IC0gcmViYXNlZA0KPiA+IA0KPiA+IEJTcGVjOiA0NTgwNw0KPiA+
IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiA+
IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oIHwgIDYg
KysrKysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYyAgICAgICAgfCAx
NiArKysrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygr
KQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9lbmdp
bmVfcmVncy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5naW5lX3JlZ3MuaA0KPiA+
IGluZGV4IDcxN2Q1NjA2MjZjZWMuLmIwYmE1NjM0Mjc3M2EgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5naW5lX3JlZ3MuaA0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmgNCj4gPiBAQCAtNTgsNiArNTgsMTIgQEAN
Cj4gPiAgDQo+ID4gICNkZWZpbmUgUklOR19CQkFERFIoYmFzZSkJCQlYRV9SRUcoKGJhc2UpICsg
MHgxNDApDQo+ID4gICNkZWZpbmUgUklOR19CQkFERFJfVURXKGJhc2UpCQkJWEVfUkVHKChiYXNl
KSArIDB4MTY4KQ0KPiA+ICsNCj4gPiArLyogU2FtZSBoYW5kbGluZyBNT0NTIHZhbHVlIGhhbmRs
aW5nIGRvbmUgaW4gUklOR19DTURfQ0NUTCAqLw0KPiA+ICsjZGVmaW5lIEJMSVRfQ0NUTChiYXNl
KQkJCQlYRV9SRUcoKGJhc2UpICsgMHgyMDQpDQo+ID4gKyNkZWZpbmUgICBCTElUX0NDVExfRFNU
X01PQ1NfTUFTSwkJUkVHX0dFTk1BU0soMTQsIDkpDQo+ID4gKyNkZWZpbmUgICBCTElUX0NDVExf
U1JDX01PQ1NfTUFTSwkJUkVHX0dFTk1BU0soNiwgMSkNCj4gPiArDQo+ID4gICNkZWZpbmUgUklO
R19FWEVDTElTVF9TVEFUVVNfTE8oYmFzZSkJCVhFX1JFRygoYmFzZSkgKyAweDIzNCkNCj4gPiAg
I2RlZmluZSBSSU5HX0VYRUNMSVNUX1NUQVRVU19ISShiYXNlKQkJWEVfUkVHKChiYXNlKSArIDB4
MjM0ICsgNCkNCj4gPiAgDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9o
d19lbmdpbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiA+IGluZGV4
IGQ0OTdmMDI4OWMzNzIuLjI4NGIxNTNjZDMwYjUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2h3X2VuZ2luZS5jDQo+ID4gQEAgLTI3Nyw2ICsyNzcsOCBAQCBod19lbmdpbmVfc2V0dXBfZGVm
YXVsdF9zdGF0ZShzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UpDQo+ID4gIAljb25zdCB1OCBtb2Nz
X3JlYWRfaWR4ID0gZ3QtPm1vY3MudWNfaW5kZXg7DQo+ID4gIAl1MzIgcmluZ19jbWRfY2N0bF92
YWwgPSBSRUdfRklFTERfUFJFUChDTURfQ0NUTF9XUklURV9PVkVSUklERV9NQVNLLCBtb2NzX3dy
aXRlX2lkeCkgfA0KPiA+ICAJCQkgICAgICAgIFJFR19GSUVMRF9QUkVQKENNRF9DQ1RMX1JFQURf
T1ZFUlJJREVfTUFTSywgbW9jc19yZWFkX2lkeCk7DQo+ID4gKwl1MzIgYmxpdF9jY3RsX3ZhbCA9
IFJFR19GSUVMRF9QUkVQKEJMSVRfQ0NUTF9EU1RfTU9DU19NQVNLLCBtb2NzX3dyaXRlX2lkeCkg
fA0KPiA+ICsJCQkgICAgUkVHX0ZJRUxEX1BSRVAoQkxJVF9DQ1RMX1NSQ19NT0NTX01BU0ssIG1v
Y3NfcmVhZF9pZHgpOw0KPiA+ICAJY29uc3Qgc3RydWN0IHhlX3J0cF9lbnRyeSBlbmdpbmVfd2Fz
W10gPSB7DQo+ID4gIAkJLyoNCj4gPiAgCQkgKiBSSU5HX0NNRF9DQ1RMIHNwZWNpZmllcyB0aGUg
ZGVmYXVsdCBNT0NTIGVudHJ5IHRoYXQgd2lsbCBiZQ0KPiA+IEBAIC0yOTUsNiArMjk3LDIwIEBA
IGh3X2VuZ2luZV9zZXR1cF9kZWZhdWx0X3N0YXRlKHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSkN
Cj4gPiAgCQkJCQkgICByaW5nX2NtZF9jY3RsX3ZhbCwNCj4gPiAgCQkJCQkgICBYRV9SVFBfQUNU
SU9OX0ZMQUcoRU5HSU5FX0JBU0UpKSkNCj4gPiAgCQl9LA0KPiA+ICsJCS8qDQo+ID4gKwkJICog
U29tZSBibGl0dGVyIGNvbW1hbmRzIGRvIG5vdCBoYXZlIGEgZmllbGQgZm9yIE1PQ1MsIHRob3Nl
DQo+ID4gKwkJICogY29tbWFuZHMgd2lsbCB1c2UgTU9DUyBpbmRleCBwb2ludGVkIGJ5IEJMSVRf
Q0NUTC4NCj4gPiArCQkgKiBCTElUX0NDVEwgcmVnaXN0ZXJzIGFyZSBuZWVkZWQgdG8gYmUgcHJv
Z3JhbW1lZCB0byB1bi1jYWNoZWQuDQo+ID4gKwkJICovDQo+ID4gKwkJeyBYRV9SVFBfTkFNRSgi
QkxJVF9DQ1RMX2RlZmF1bHRfTU9DUyIpLA0KPiA+ICsJCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNT
X1ZFUlNJT05fUkFOR0UoMTIwMCwgWEVfUlRQX0VORF9WRVJTSU9OX1VOREVGSU5FRCksDQo+ID4g
KwkJCSAgICAgICBFTkdJTkVfQ0xBU1MoQ09QWSkpLA0KPiA+ICsJCSAgWEVfUlRQX0FDVElPTlMo
RklFTERfU0VUKEJMSVRfQ0NUTCgwKSwNCj4gPiArCQkJCSBCTElUX0NDVExfRFNUX01PQ1NfTUFT
SyB8DQo+ID4gKwkJCQkgQkxJVF9DQ1RMX1NSQ19NT0NTX01BU0ssDQo+ID4gKwkJCQkgYmxpdF9j
Y3RsX3ZhbCwNCj4gPiArCQkJCSBYRV9SVFBfQUNUSU9OX0ZMQUcoRU5HSU5FX0JBU0UpKSkNCj4g
PiArCQl9LA0KPiANCj4gVW5saWtlIENNRF9DQ1RMLCB3ZSBjYW4ndCBwdXQgdGhpcyBvbmUgb24g
aHdlLT5yZWdfc3Igc2luY2UgdGhlDQo+IEJMSVRfQ0NUTCByZWdpc3RlciBpcyBwYXJ0IG9mIHRo
ZSBjb250ZXh0IGltYWdlIChic3BlYyA0NTU4NCwgb2Zmc2V0DQo+IDB4NDQpLiAgV2UgbmVlZCB0
byBnZXQgdGhpcyBvbmUgb250byBod2UtPnJlZ19scmMgaW5zdGVhZCBzbyB0aGF0IGl0DQo+IGdl
dHMgYXBwbGllZCB0byB0aGUgZ29sZGVuIGNvbnRleHQgaW1hZ2UgcHJvcGVybHkuDQoNCk9oIHNv
cnJ5LCBtaXNzZWQgdGhhdCBmcm9tIHlvdXIgZmlyc3QgcmV2aWV3Lg0KDQo+IA0KPiBSZWdhcmRp
bmcgbXkgc3VnZ2VzdGlvbiBsYXN0IHRpbWUgdG8gbWFrZSB0aGlzIHVzZXJzcGFjZSdzDQo+IHJl
c3BvbnNpYmlsaXR5LCBJIHRob3VnaHQgYWJvdXQgaXQgYSBiaXQgbW9yZSBhbmQgaXQgbWlnaHQg
YmUgYmVzdCB0bw0KPiBoYXZlIHRoZSBrZXJuZWwgYWx3YXlzIGFwcGx5IHRoZSB1bmNhY2hlZCBN
T0NTIGluZGV4LiAgQnV0IHVwZ3JhZGluZyB0bw0KPiBXQiBjYWNoZSBiZWhhdmlvciAod2hlbiBy
dW5uaW5nIG9uIGEgcGxhdGZvcm0gd2hlcmUgaXQncyByZWNvbW1lbmRlZCwNCj4gYW5kIHdoZXJl
IHVzZXJzcGFjZSB3YW50cyB0byBvcHQgaW4pIGlzIHNvbWV0aGluZyB3ZSBjYW4gbGVhdmUgdG8N
Cj4gdXNlcnNwYWNlIHRvIGhhbmRsZS4gIEkuZS4sIHdlIGFsd2F5cyBwcm92aWRlIHRoZSBkZWZh
dWx0LCBzYWZlIGJlaGF2aW9yDQo+IGFuZCB1c2Vyc3BhY2UgY2FuIGRlY2lkZSBpZi93aGVuIGl0
IG1ha2VzIHNlbnNlIHRvIG9wdGltaXplLg0KDQpZZWFoIG1ha2VzIHNlbnNlIHRoaXMgYXBwcm9h
Y2gsIHVzZXItc3BhY2UgY2FuIHByb2dyYW0gd2l0aCBhbnkgb3RoZXIgdmFsdWUgaXQgd2FudHMu
DQoNCj4gDQo+IA0KPiBNYXR0DQo+IA0KPiA+ICAJCXt9DQo+ID4gIAl9Ow0KPiA+ICANCj4gPiAt
LSANCj4gPiAyLjQwLjENCj4gPiANCj4gDQoNCg==
