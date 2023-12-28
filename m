Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5F3C3DA6E
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 11:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E602810E013;
	Thu, 28 Dec 2023 11:31:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5323689FF9
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 11:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703763087; x=1735299087;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yy8T9solwhjTvk0CPeerVFwRFioN4t/9tO8KrzASViQ=;
 b=KHeogmaIYthl0+86OGAsyEeDqZnzzYddjL8VfdF0Z8pytCpxgDIzbweu
 g5WM5sGBfpPXVoNSTmiE3EROcEsxq5ZxNAdmIKJ1U7maP7RD6q4vvsinJ
 bMHRyapolr/WXN1tYzdtQuLP7PA3zUBocSxduNbrFi7rjZSN/sHJubKW2
 qk2ySjQe1AOkPXCYDPoUZCcaI+/dtTQ+UuTBhn8bd90v41iNMWAvIGlp5
 5idZrXyLipwn/528MR/8acD7yFmo5HKJP0iZS1SEO8XoTt37RtXXn4pXG
 qBeJvsUh8ZWy+LwsOym/Cek19kIe7Go5OCurRTD5cpSNiawmnoyzrUZ8o A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="400348659"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; d="scan'208";a="400348659"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 03:31:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="807402609"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; d="scan'208";a="807402609"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Dec 2023 03:31:26 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Dec 2023 03:31:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Dec 2023 03:31:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Dec 2023 03:31:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+HqTPT0Z0p24AVieCALczjZNBSIQ+AW7vZarO5zOanGdO/PETYWYmwZV7/5+OVKoMqMpm3bA4Tv09lnbzILTZazjztQjTPh94O7fwDJ4hy2i9tpZc5rA2GzpWbrhRvAvdpv+z6FCG8Q7Tclim5azKKchn1ZLf0buoj53MPR51NKyRHHdd9p11vT8eEeNKUIWTlWghSv2+hbR8dnaNn5db3zaL/yIn9xCsMkoSp9ktXdx+ER6X6UgYHvMifYoSc1qZHZdO22Z4HnjQ8dNuYG/ecyYbRjirVJ/qE9yEQ6xcD/5VfXQLLuXEXC+kMqghn9IAAZRZf6IRh7L5MCzvXwtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yy8T9solwhjTvk0CPeerVFwRFioN4t/9tO8KrzASViQ=;
 b=gKgqTz87zwhObg28Tk9p5MhTZpzt2G6+V8l8RjFDaa8vom0m+QyQssgrC9tWPoGaWV1TH4gsMDMq5e0Eny5cZV1rwnyXgdTtCINMafzWgOpo2cu68BtbmWjafB0cov4bm+cL34VClbB7GhQsSHQpS3D/mCNwdjw2NVeW0kTqJE+cFipjiou6Y7/t/suu+A1BeNKQGqSj7ReDWhppzUE6rFpvbCz4wI30YFQMT99nNI4XcIH/7Q0RcYvZN9tJBFcAAqxf2NxYwqG87wp86C36v7sPPeDw2C94XRuN7/h9qpapFwRIYK6JuCmSzFi/m+lrzFpMT3ZwNlDu/xhQfaYTuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7382.namprd11.prod.outlook.com (2603:10b6:8:131::13)
 by CO1PR11MB4852.namprd11.prod.outlook.com (2603:10b6:303:9f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 11:31:22 +0000
Received: from DS0PR11MB7382.namprd11.prod.outlook.com
 ([fe80::b043:8f67:3566:67ee]) by DS0PR11MB7382.namprd11.prod.outlook.com
 ([fe80::b043:8f67:3566:67ee%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 11:31:22 +0000
From: "Coelho, Luciano" <luciano.coelho@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: [RFC] drm/i915/display: add support for DMC wakelocks
Thread-Topic: [RFC] drm/i915/display: add support for DMC wakelocks
Thread-Index: AQHaOX8CqsOqqBbgOkKDcYWKcnJsubC+jxAAgAAAtIA=
Date: Thu, 28 Dec 2023 11:31:22 +0000
Message-ID: <b3d7a36d2f755122335a15806b83baf36668b355.camel@intel.com>
References: <20231228110934.383623-1-luciano.coelho@intel.com>
 <d1025642c5e47fcf8338bda82d3d31930877848b.camel@intel.com>
 <877ckyk1l9.fsf@intel.com>
In-Reply-To: <877ckyk1l9.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7382:EE_|CO1PR11MB4852:EE_
x-ms-office365-filtering-correlation-id: b9d1c389-418f-4731-c09a-08dc079884ab
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SeK2tmwHvj9k4Ke5qBOQ+m2+g80RlskPhK+U9Ii61SlOMasRd2Tp0HoqQDKteJ1fcKQihvcpoY6DYEInH+a9Qv/PRCkjd01NVUqW9dLTEm6bD1CFvXHYFTmQQEWbcpGAYJozfL3Ow4l1qtSo9SrQcBCR86GyWKNrccwKQZ+gO4mq+g7Ck5+RlS0Qhcvp1hCj3QFBjCMBKzRqVheU7oHhacgDhzIKh9fcceLOEXaYQLurVLEbOAY435ot4PKPwX0EPDLKjrZqMiMsHniwIIEJS7q7vKgub4IjJSmerGI9jlHER/E+qEECCOycIoy+bv3JpIB+/IkrQF6tlsfcYYvXE2Pvdx8GWx9yzOoCQJPcvMo7vih9ZBPguFbpE4DZdqO897cTTLyzGcvrSfw4ly1tC1c1CCqZnwe8RWhyBkXnyjRVApO5lI7210Uqh9JVXPBFPocEOPx49FTEgi37/14PhXNtgAEgF2Zhk8vqPgAQ0BL1ToApXJpSZWlOA7nRW5T9FTjjRLjP2PzC9BiUVZ1BlfRD2e/DisHZOevb9aeRX5QG4c7knGAb3xAxg0yJJX9tZmcbjI1bztebUPegDExGZTdlrWZuvlXihOInXCxPTWs8gl85tCmDmukxfYSNpInL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7382.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(376002)(366004)(396003)(136003)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(316002)(478600001)(66556008)(2906002)(5660300002)(66476007)(4001150100001)(76116006)(54906003)(6486002)(91956017)(64756008)(66946007)(66446008)(6512007)(6506007)(110136005)(122000001)(8676002)(8936002)(4326008)(38070700009)(6636002)(41300700001)(71200400001)(83380400001)(82960400001)(38100700002)(2616005)(26005)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkhoYUQ0eVk3MnZqaGhkakNKeFJtK0lHZ3dQSUNWSlFWZ29XWUJuc3YzMVVG?=
 =?utf-8?B?QVMxTm1QaHNFcW1BK1lUYWxVMndFK29oZVZEdHlFNmE2UUtQY011ejV5MkU1?=
 =?utf-8?B?TkhQTityZmJEOGJLSnh2NDlkd2xuanBXN3F4eEZkQkNjTkMyRlRldmlnL0c5?=
 =?utf-8?B?M2hVS0Rra0kvMEZVcW9rdDdpK25iNmRrSEdYaXY3T3JISWtJSE1WTFNDMzdY?=
 =?utf-8?B?UVJXbm0wcTE2U3ZOUSt0UGlpVm82YU5OdFhkcmMrYjZqdTJzaWdRdTNhWlUw?=
 =?utf-8?B?WWNlb0piNDFMakZUZDk4UTZCQXBnaWg4ZVpYOFF1eFpFL3BpeVFqYUpQMkZa?=
 =?utf-8?B?amdNZExSQWpJSXRxRDBPUWxXUWp5WWE1ZHI3b3VISnhCSGxrQTlIbTZTV1FS?=
 =?utf-8?B?YWlsOUR2OWx3UnhUdy81QUJvdFFtVjM0TWI4RFdLVFd2M24xUGRObXc2TS9K?=
 =?utf-8?B?cDlCMC9uVjkyb2kybi8vUXFjdjQ5OEptYys1U0hhVWZKWjN1cHlYUjJibE0y?=
 =?utf-8?B?Y2RRSWFZUXhYdnkzVjZ1WHZWWlJEVDFYZW80cXh6cHk2N2RSVjlTakVSdkEw?=
 =?utf-8?B?UUF6a0cvejBjdDB1ZEEwOEVia202SWZkTjd6TDlJYTRWMlJOS202S2ttZkxY?=
 =?utf-8?B?aklaMVJiVVU1c3VzckZad24zOGkzL2ZHZU1UWHM2WkloK0UzeG9JRzdNb1lE?=
 =?utf-8?B?T0NNdmRhZE9qcHBVZCtvalQwRitTNDRmd3picGJidE44YzhuajRLVjJPMER6?=
 =?utf-8?B?QzZSNVl1aHdLc0lsWXlocDZMNWwvaVkzUFA0R2RMd1FmUkhPaGtOS1o2dEg5?=
 =?utf-8?B?cDNoSSs0VXVPTk9YS0JjeEFscDEwYU5UYmh5bTI4OGRQOVdUeW5nR3MzdGc1?=
 =?utf-8?B?b1FrMjloSVdHOXljTmhSdUtQRXRKdHhkMFdiL01MUGV2M0JDc1dzU2sxNnRX?=
 =?utf-8?B?RVhFQ0RvZWdBM0RzY0tLb1hLUnRlOXVrVE9JMzdzelpZeXFXRnZFMUJib1Fq?=
 =?utf-8?B?MFhFSXpYRzJMMHdNVVFUTmh1dlJaOVZrMkJ1cWU2aDNOVDFNSm5RTG5yeGoz?=
 =?utf-8?B?eEx6MEhDbXI3ME1EYlNpZDhselVNZDFUYXlVSVpna3NyeDFJcUxvZjJmNE9S?=
 =?utf-8?B?Q0o1dUFFL0VGQ2M2bzlFd2p5U2pUZGJJZWxOUFVRdFFrNFRFRkNnTEoxcENN?=
 =?utf-8?B?SGc1ZHVianFNeTlwc2tnWFhucXdUVVJtT3BNclpHa21nYkFpS0plbDZxTjdP?=
 =?utf-8?B?QnRwcmFzUk5qSHFOSno5QVhTZkx5TEs2TTNlRksvV3VMWjRXVkZvMUJKcDFO?=
 =?utf-8?B?NVU5MlRIMzhOVnpwSVlVdlNUMERmY25UY0NOa2FGaFltSUE3TVZUdFViQW9Q?=
 =?utf-8?B?ZmVYZmdacW9LZFJnRy85ZHUxaSt0enlOUE5ZaDhuaFNkdjdkdDNnU3RKQWph?=
 =?utf-8?B?anAvU1IzeUdEOTRzdzBOTUxqU2VnNW9TNjJBV3REck9xRnJ1VXVIYmpob21u?=
 =?utf-8?B?SGg0NXpSalovZUM3VUtVYVJndlFhdEFBeDJVTEJ1SmVkTkhPU04rNW9pYVJ5?=
 =?utf-8?B?akpYNG1BZzhEeTVVOTVrbU5TNlJmbjFRYVZmWFdsZFFBNXRSZzA2dHRPWXMw?=
 =?utf-8?B?cEVkaU9TbG9YbW5yUmRxazQ1OE4zUXlTRkRzR2k0elY4ZVJ6SHdIQlJGSzNL?=
 =?utf-8?B?MHdWSHdvazAralRPZk05Qk44QW1aQStkcm53TmZOcEtlVHd5NlJEcTdDRWFl?=
 =?utf-8?B?K2g2dHVTdUhtRlU2c1oyM01xQ0g3TW55ZUtqT0hkbXg2U3BkaHhEVGczanZk?=
 =?utf-8?B?ditUWms5eXo1L1kzZlFleFc1ZGRCZ2VMVEg3dWVNampDYjcxUVg2VkRLQVVE?=
 =?utf-8?B?bWwrb3gwblBGMDYyTUNQT0tVaDFCelZCSVBQRmZDYkNWc2pQNkVZYXdiWkVi?=
 =?utf-8?B?dHVoVDdwZzg4STRaQWo5M0VXeUZ4YlFSdW9URmkzZWx3VEg2c29UUTRzUEp5?=
 =?utf-8?B?dW5xcHcyVVJLZnFka2pCTFUrbzRlYTF2TVhEdm9QdFN6UUVRSnlpc0RNejdO?=
 =?utf-8?B?Sm1qTUhvYk9BaHQ2M1V6S3ZQa1YrdHQ4ckJRV1ZML3VBY01YaWNWbWJYeFUz?=
 =?utf-8?B?TWJUdm9raFhXNnppTmNMVmF5Rjh6ZTFRMlJQOXQyVjdYWllKR0M1SHlOWUlG?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F27E1940EE58BC46976D71AE3E71B909@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7382.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d1c389-418f-4731-c09a-08dc079884ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2023 11:31:22.1841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SUHAv9ib15bRTBRb91ZdVwrkPP9afaPDZ2f93QS940UihAzUw2vY2PEI8g+icryai46K5mQQxRmwGaZrzSRGe2+dj41GXYbyqjPLiDJSemE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4852
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTEyLTI4IGF0IDEzOjI4ICswMjAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gVGh1LCAyOCBEZWMgMjAyMywgIkNvZWxobywgTHVjaWFubyIgPGx1Y2lhbm8uY29lbGhvQGlu
dGVsLmNvbT4gd3JvdGU6DQo+ID4gRm9yIHNvbWUgc3RyYW5nZSByZWFzb24sIGdpdC1zZW5kLWVt
YWlsIGRpZG4ndCBhZGQgVW1hIGFuZCBWaWxsZSBpbiBDQywNCj4gPiBldmVuIHRob3VnaCBJIHNw
ZWNpZmllZCBpdCBpbiB0aGUgY29tbWFuZCBsaW5lLg0KPiANCj4gRXZlcnl0aGluZyB3b3JrZWQg
YXMgZXhwZWN0ZWQsIGJ1dCBpdCBtaWdodCBzZWVtIGEgYml0IHN1cnByaXNpbmcuIDspDQo+IA0K
PiBNYWlsbWFuIGhhcyBhIHBlcnNvbmFsIHNldHRpbmcgb24gd2hldGhlciB0byBmaWx0ZXIgeW91
ciBhZGRyZXNzIGZyb20gQ2MNCj4gaW4gbWVzc2FnZXMgc2VudCB0byB0aGUgbGlzdC4gSSBoYXZl
IGl0IGRpc2FibGVkLCB3aGlsZSBhcHBhcmVudGx5IFVtYQ0KPiBhbmQgVmlsbGUgaGF2ZSBpdCBl
bmFibGVkLiBZb3UncmUgcHJvYmFibHkgbG9va2luZyBhdCB0aGUgY29weSBvZiB0aGUNCj4gbWFp
bCB0aGF0IHlvdSByZWNlaXZlZCB2aWEgdGhlIG1haWxpbmcgbGlzdC4gSXQgb25seSBoYXMgbWUg
aW4gQ2MsIGFuZA0KPiBVbWEgYW5kIFZpbGxlIGhhdmUgYmVlbiBmaWx0ZXJlZC4gVGhlIGNvcHkg
SSByZWNlaXZlZCBkaXJlY3RseSBoYXMgYWxsDQo+IHRocmVlIG9mIHVzIGluIENjLg0KPiANCj4g
VGhpcyBpcyBvbmUgb2YgdGhlIHJlYXNvbnMgSSBDYyBhbGwgb2YgbXkgcGF0Y2hlcyBkaXJlY3Rs
eSB0byBteXNlbGYsIHNvDQo+IEkgYWxzbyBoYXZlIGEgY29weSB0aGF0IHdhc24ndCBtb2RpZmll
ZCBieSBtYWlsbWFuLg0KDQpBaCwgdmVyeSBpbnRlcmVzdGluZyEgVGhhbmtzIGZvciBsZXR0aW5n
IG1lIGtub3cuICBJJ3ZlIHNlZW4gdGhpcyBhIGZldw0KdGltZXMgYmVmb3JlIGFuZCB0aG91Z2h0
IEkgd2FzIGRvaW5nIHNvbWV0aGluZyB3cm9uZy4NCg0KSSdsbCBDQyBteXNlbGYgdG9vLCBhcyB5
b3Ugc3VnZ2VzdGVkLCBzbyBJIGNhbiBzZWUgdGhlIHRydXRoLg0KDQotLQ0KQ2hlZXJzLA0KTHVj
YS4NCg==
