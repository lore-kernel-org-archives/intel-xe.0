Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C21C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 20:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9D810E65B;
	Wed, 29 Nov 2023 20:04:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A9F10E65B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 20:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701288288; x=1732824288;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AzOh4DPhRuaId2qKo59I/4Jpy155jfgRsGR/Qv5qCCE=;
 b=Rl4phsUgseLAC7rSeu7QRyvVs8O6rOYJ+Z3DFGBe+c89QcpM/BkxzcPd
 zglgQeUKnbc78ISGUEBOalKQk4A1f1ThXEMapL0A1eieaXzVyGStdkSP4
 yoPSwe05yc1iMoRsN4tPjhWB4sFa+KAg4RvhHVKLpTMfM7qEeQUGlYrqu
 tgseRZ98ym+YT5AVn/eoQyfA6aCcS1cKwNXVq0y8Hsn2yQAM1kmfkt2CW
 AE4YGhbVD19vRFc4kz3BqsElUJ7f8OO5vgh6uIqTWb1qpXMGs0OtNYO/H
 Rqt2daYbPBhsEiC+VT1fRE71heWTKXRIdH6lmPWy5Vr0EnH2Gi+feDhKN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="120902"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="120902"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 12:04:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="762433403"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="762433403"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 12:04:40 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 12:04:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 12:04:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 12:04:40 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 12:04:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7+CcC8tWX2zmCzeSe3qFpC4H6JeHffSXkmeJUNCFnEgQ5ShMH7xMsfZ+2xuBTP/G30YaDlVaoQ+1aSFY5fZca3EGkC78edsuPMYGz9niebSwOFLh4+AWpMwOWvBaaweRDdSC5ZoWpvYbQYTWcT7HST5mkD0RBAks6+KLoX0syDT3k/PKp/KOUrKhq6Z6tYBRlyrXsTjCkk/qdGXfTWTTbePv/0NtlM5O0D+K9AdtAoM5OaBVwnVhoX4PJltySZUb06LIPfFPxJxYBuaMEYsf+YxxNkv8lh2Ee+JoMiut88Uw5glgPk2b9KkcKM7XQXBbvGfFZ2Tb93glkqvHsrifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzOh4DPhRuaId2qKo59I/4Jpy155jfgRsGR/Qv5qCCE=;
 b=YotRc8K0y0ELFHIPDjKfepwKKxA2QODB29bk+4wq2DHFqb481xC/Cz5wTbBgreArK3enEcf0jqZrwwm4W/WhvLKyccXe2JvitWcb1EExiqMd07q9XymIsP/Y7tT8aSqWLQu8aIcX+FdLSlNzoE/VYRQKxRi9ZktcXl0/ZHlZcZxuttaljOPTsqrI4ppF5mO60UFuAt7OR+Ds6cG6thwmHSJj7iUFbbikxUOJtmGOMF/qrjrFJ540IexE7/2CuIbhwFKSl858fq6DlexlUiGmvqJ4OWRv9XVQuiabeZ/bGECtKK4gl+hxmeDo6HTOhKlQu4ECseVpj0cFj9infI0Khg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CO1PR11MB4801.namprd11.prod.outlook.com (2603:10b6:303:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 20:04:37 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 20:04:37 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 03/14] drm/xe: Make
 DRM_XE_DEVICE_QUERY_ENGINES future proof
Thread-Index: AQHaHVGdwvdBpW5kEUOu6v6UYakc0rCQRgyAgAFI2oD//7erAIAAfViA
Date: Wed, 29 Nov 2023 20:04:37 +0000
Message-ID: <7b38be287ab91b8efc73544f2448520214b8c604.camel@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-4-francois.dugast@intel.com>
 <ZWZY/zQQzVeWV1PG@DUT025-TGLU.fm.intel.com> <ZWds2xD8bXkBy-t0@intel.com>
 <ZWcwLhlAGj/o5xaJ@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZWcwLhlAGj/o5xaJ@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CO1PR11MB4801:EE_
x-ms-office365-filtering-correlation-id: d7b6e019-2d22-48b2-cc7e-08dbf1166a19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ce87zVlHEm6daNCnvUlW0sPY9TXuREd964qUshd7VR4kUUfIwFmct01MREXL39s4vO6ZFRrmtzWRtjefnd9PmWH1knI5tM0HmQQiWdAs0VmnlkNXPilAx5ejxkUhcm/cIlYION1igBXhExEKzD6J+VnEXlHi8kXctuNe/YL+mTnHE/zFSHNyNE41/8PdlASDUBAvitoT8wmMhiAJ8++3k1DkLKIs38zbDQJpZGqr0Bj5LnOomD1YywMATAYZyj0grFuMnGTXlzA2TM7zgUt1g+9Q+9/UcCUWgJVQaUkoWgZ42o7SyPftlfMe5OSnO9jQzStAZCUXcCSbgK67MiwomJeiHIo/O5WJxuQwoxgl0L2mlJ0vxPrUzwD3uqHroZUj/z36tLv2ndbrgv+vrPWfNuTLM9bVDsMquPBHLQ4XZdy5aaPSHWbUR9RKjJwwrC8tskmXBHk3hFdHIaoFSYVUznFBFiFn9oYCaqMRwSAOoElH0L4MTSYCOjmnv7b/kt9oHXAEfxgq4biBA+8hJww5au8kf5h6t3pU77pSGLPmRo2FijNB9p9dTO/Ec+PPDwVZ8JIM2WlsY7lTkMXmsAWI4lUnxcjgrqmWhzUITw2lMDASuHwqh0LfGBAwgmfn09wsCysiUTmpi7NEKN8tGokkag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(41300700001)(107886003)(2616005)(26005)(6512007)(83380400001)(202311291699003)(91956017)(66946007)(66446008)(66476007)(66556008)(64756008)(76116006)(36756003)(5660300002)(6636002)(110136005)(54906003)(316002)(82960400001)(122000001)(8936002)(4326008)(86362001)(8676002)(71200400001)(4001150100001)(38070700009)(6506007)(6486002)(478600001)(966005)(2906002)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0thYU03SzVibmNmd2c3NktQYWVQYmtsdEtiSWsyNjFiakxpVDNyYSt3OEdI?=
 =?utf-8?B?VTVGejhQT1dDUnY1UyswNkFJT0YxOHk2VlJWQTkvK3psTzE0K1FEMDk1WTU1?=
 =?utf-8?B?MkJqYlNmb3F0TWF5MXhWTXZNZk41Y1Y3bzFCQ3NNVmdlQjFyck1mNWQ1bzZW?=
 =?utf-8?B?dFhEdFo5akt4Y1FzdmlhN0NuQVlOZmZnVWh0bThJVXFvMVQvVGUraFJHd1Y4?=
 =?utf-8?B?NVlEL3hTZHM4Q3FnQUVzR1pKNVZtL2kwVzlnL1B5QnFyS0hEWEdXOTdzSjl4?=
 =?utf-8?B?Y1JkdzQrNnovcHF2NCtFMTZwRWFSd1I4NkNpeVlOdWgxNjhCdWVmdWg0OGZh?=
 =?utf-8?B?b0lyRGdQMUJVUlZKOUtkdHBpb05zVXdZV1FPZXByTWJBdzRoQXo5QVJnSDZV?=
 =?utf-8?B?Z3hWdkszRUhaU0RhWUR0U01EY28xT3BHSXg0V3hiZ3hRd1VRSmdtNlFkV0xs?=
 =?utf-8?B?Q1BjU2VUdXJqSzFRdTlCY3RtWERXVHRUa2p3ZStJMnkrTXZNSEFZRWFlS21r?=
 =?utf-8?B?TmhoS3g0WnM2Qm9VSEI0T0NtRllTaDVDZ3UzWktqMUtUSjlLK1MySTM4S1dN?=
 =?utf-8?B?UTBGS2ZhSFZXTWd5S2pudjJkNEdEOHFwNHk4ejNlRkMxQmlwUmNOVEFGY3lK?=
 =?utf-8?B?N1VhTFN5Z2o2ZERJUVc3Z1JXcy9Hb05xbGFENWlITGorekZjSHlYR2FTR1Rv?=
 =?utf-8?B?Q0gxazJZOXpmTjJrdjMwUUIxcERHY0dBdU9pZ2JzZXBPVExlSXZkYmpvam0r?=
 =?utf-8?B?b0ppUHkzTzlUS1o5VTFxbjcvc1B4UzlNNFRGMmN5ZExOekVBMVNPT3M3dEli?=
 =?utf-8?B?Q0hVbDJRWDYzejE4aksvK3F5cDUyS3lxUTZTbHdGdWlTZ3RWd2t4ZWllWit3?=
 =?utf-8?B?TTNUNVd4WHk5R3VhMTFaSFZDOE1ubU5wWkFiUlZwUFBkZGJYbkZNemFrZHQr?=
 =?utf-8?B?MFNSZ2MrMCsrMW5acEordHdEL0NEM1BZcWlSaEp0d2lLK0pYVGlWUnZadEVD?=
 =?utf-8?B?cUptT2VoWXpsTVovRTNyeXRwOU9lNCt6M1BnRDEvQUgxUnlCZVN5eVBpWEpI?=
 =?utf-8?B?Nk5tdERWVDZ6MVRRbmprVE5hMkxyM2dobnpqd2FUWFRXb05CWnQ5RlRDa0dB?=
 =?utf-8?B?Ykw5OEVKekxPWFVMVCtOcUNJaVZHZ01KOE1KNTNRbFZoOFYxUC8xWWZ1S3ZN?=
 =?utf-8?B?VFAxWjVFWldiYXRTaWdNYUwwdXM1TTd6d1h2Y1pON1ZlOXJNQmtmdDBIcmJ1?=
 =?utf-8?B?THpxTFNNdmVQeHBNS04rc0ZVQzJ5Q1lOZXJUa1F5RkphRU5oMGRGcG9pS0Y0?=
 =?utf-8?B?OW5EdTE5OG1QcUxhNGR1eEZjZnp1VkxxNHBTOHoxT1MxUFRZUG85RWZydDNw?=
 =?utf-8?B?VGtDUWdrWlN2NGtJQlFXYlU4YlRycXZQSzcxSmRGWTJlWkxEcHdIWmJOaTJ0?=
 =?utf-8?B?SG9GeEZ1eE92Wjcxc0JpMDBEN0NHNUF2b05vTUtOVWNtR0c3WjB0S0U4Uk94?=
 =?utf-8?B?TFZ1akFOUG9LekZyQ003Rkt3Y254OXptQTZDRFVLRGlsdjRFV3ljMEhzTWI4?=
 =?utf-8?B?SENSRmxTRWxwQytjc2trSExYMzl4Um9GaFp2cWh5SDNOVVY5WkZrTEN3S2p5?=
 =?utf-8?B?Zk5OY2pCaWtyeHdQNjRPUnZvUmpPWTMvaFJwb0V1eW1QRTRRTTlHdWRWUzBQ?=
 =?utf-8?B?Zm5ZdHV2azYrb3hNdEk1dGNiTnBRTTRCdXZnTVpoTFVtY2M0UTBFVVBTMXFQ?=
 =?utf-8?B?Q00xSnE2T1drazNTclMzK2tNelNOcGc2ODJPZ0RvSy8vMFFvK3M3WmZYSGpI?=
 =?utf-8?B?RG9VQmdMajFSeFpNcGF3MFJLMHBIWDNLbDMxektQcURSZUIyY1pTbVhONlRu?=
 =?utf-8?B?d0hTcjhXYmV0OTNocDRKWGNObHRKblVJSUFkaHNVQ0lxWWEwSnBxRlNIUzMv?=
 =?utf-8?B?RkpxK21FdVJGdmJITXNJZlhnMWEwYWRtUHZiMW91YzdYaTRuMzMvVjlJTFpW?=
 =?utf-8?B?cUlvK2pzVytXc3Avbml0ZjFSY0lJMUR4ZlN2RWZIZis0T1QrUlI2NXkrZEFV?=
 =?utf-8?B?L3lvTnp5YjQrQkFBaTRXa083MVA1Qld4VXFna3JmWG13NTk2K1RUbDlmd1A3?=
 =?utf-8?B?Z1JsUm42bmNmaW51WFZ6U0hBVHNXZ21kckc0RXp2czNBaE1DTEN2b2ZQK1c3?=
 =?utf-8?B?N3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <765AC9590E00144D90F7251747BBC076@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b6e019-2d22-48b2-cc7e-08dbf1166a19
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 20:04:37.4129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I6ufCZIB3d6fyvV8ZI5naHXBDqb6opo3Zu31Aj6TrywWlyZyc8mFQJ4R7lslGSzxZmteydlBUcyAGFAJ14llFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4801
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/14] drm/xe: Make
 DRM_XE_DEVICE_QUERY_ENGINES future proof
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTExLTI5IGF0IDEyOjM1ICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBXZWQsIE5vdiAyOSwgMjAyMyBhdCAxMTo1NDo1MUFNIC0wNTAwLCBSb2RyaWdvIFZpdmkg
d3JvdGU6DQo+ID4gT24gVHVlLCBOb3YgMjgsIDIwMjMgYXQgMDk6MTc6NTFQTSArMDAwMCwgTWF0
dGhldyBCcm9zdCB3cm90ZToNCj4gPiA+IE9uIFdlZCwgTm92IDIyLCAyMDIzIGF0IDAyOjM4OjIy
UE0gKzAwMDAsIEZyYW5jb2lzIER1Z2FzdCB3cm90ZToNCj4gPiA+ID4gRnJvbTogSm9zw6kgUm9i
ZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gPiA+IA0KPiA+ID4gPiBX
ZSBoYXZlIGF0IGxlYXN0IDIgZnV0dXJlIGZlYXR1cmVzKE9BIGFuZCBmdXR1cmUgbWVkaWEgZW5n
aW5lcw0KPiA+ID4gPiBjYXBhYmlsaXRpZXMpIHRoYXQgd2lsbCByZXF1aXJlIFhlIHRvIHByb3Zp
ZGUgbW9yZSBpbmZvcm1hdGlvbiBhYm91dA0KPiA+ID4gPiBlbmdpbmVzIHRvIFVNRHMuDQo+ID4g
PiA+IA0KPiA+ID4gPiBCdXQgdGhpcyBpbmZvcm1hdGlvbiBzaG91bGQgbm90IGp1c3QgYmUgYWRk
ZWQgdG8NCj4gPiA+ID4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSBmb3IgYSBjb3VwbGUg
b2YgcmVhc29uczoNCj4gPiA+ID4gLSBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlIGlzIHVz
ZWQgYXMgaW5wdXQgdG8gb3RoZXIgc3RydWN0cy91QVBJcw0KPiA+ID4gPiBhbmQgdGhvc2UgdUFQ
SXMgZG9uJ3QgY2FyZSBhYm91dCBhbnkgb2YgdGhlc2UgZnV0dXJlIG5ldyBlbmdpbmUgZmllbGRz
DQo+ID4gPiA+IC0gdGhvc2UgbmV3IGZpZWxkcyBhcmUgdXNlbGVzcyBpbmZvcm1hdGlvbiBhZnRl
ciBpbml0aWFsaXphdGlvbiBmb3INCj4gPiA+ID4gc29tZSBVTURzLCBzbyBpdCBzaG91bGQgbm90
IG5lZWQgdG8gY2FycnkgdGhhdCBhcm91bmQNCj4gPiA+ID4gDQo+ID4gPiA+IFNvIGhlcmUgbXkg
cHJvcG9zYWwgaXMgdG8gbWFrZSBEUk1fWEVfREVWSUNFX1FVRVJZX0VOR0lORVMgcmV0dXJuIGFu
DQo+ID4gPiA+IGFycmF5IG9mIGRybV94ZV9xdWVyeV9lbmdpbmVfaW5mbyB0aGF0IGNvbnRhaW4N
Cj4gPiA+ID4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSBhbmQgMyB1NjRzIHRvIGJlIHVz
ZWQgZm9yIGZ1dHVyZSBmZWF0dXJlcy4NCj4gPiA+IA0KPiA+ID4gVGhlcmUgaXMgNSB1NjQgaW4g
dGhpcyBwYXRjaC4NCj4gPiANCj4gPiBteSBiYWQsIHNvcnJ5LiBqdXN0IHRyeWluZyB0byBwcmVw
YXJlIGZvciB0aGUgbWFueSBjYXBhYmlsaXRpZXMgYW5kIG90aGVyDQo+ID4gc3R1ZmYgd2Ugd2ls
bCBsaWtlbHkgbmVlZC4gQnV0IGxpa2VseSAzIHdvdWxkIGJlIGVub3VnaC4NCj4gPiANCj4gPiA+
IA0KPiA+ID4gQW55d2F5cyBhZ3JlZSB0aGlzIGJldHRlciBidXQgd2hhdCBpZiB3ZSBpbXByb3Zl
IHRoaXMgYSBiaXQgbW9yZSBtYWtpbmcNCj4gPiA+IGVhY2ggX19kcm1feGVfcXVlcnlfZW5naW5l
X2luZm8gYSBkeW5hbWljIHNpemUuDQo+ID4gDQo+ID4gaG1tbS4uLiBJIHRoaW5rIEkgbGlrZSB0
aGlzIGlkZWEuIHBhaG9sZSBzZWVtcyB0byBoYXZlIGEgZ29vZCBvdXRwdXQNCj4gPiB3aXRoIG91
ciBvdGhlciBleGlzdGVudCBkeW5hbWljIGFycmF5Lg0KPiA+IA0KPiANCj4gQ29vbCwgbG9va2lu
ZyBmb3J3YXJkIHRvIHdoYXQgd2UgY29tZSB1cCB3aXRoLg0KDQp2MiBvZiBkcm1feGVfcXVlcnlf
ZW5naW5lX2luZm8gd291bGQgYmUgc29tZXRoaW5nIGxpa2UgdGhpcz8NCg0Kc3RydWN0IGRybV94
ZV9xdWVyeV9lbmdpbmVfaW5mbyB7DQogICAgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5z
dGFuY2UgaW5zdGFuY2U7DQogICAgX191NjQgZm9vOw0KICAgIF9fdTY0IHJlc2VydmVkWzBdOw0K
fQ0KDQptYXliZSBhbHJlYWR5IGFkZCBhIHBhZCBlbm91Z2ggZm9yIHRoZSBPQSBjb3VudGVyIGFu
ZCBtZWRpYSBlbmdpbmUgY2FwYWJpbGl0aWVzIHVzYWdlcyBhbmQgbGVhdmUgcmVzZXJ2ZWRbMF0g
YXQgdGhlIGVuZCBmb3IgZnV0dXJlLg0KDQoNCj4gDQo+ID4gPiANCj4gPiA+IGUuZy4NCj4gPiA+
IHN0cnVjdCBfX2RybV94ZV9xdWVyeV9lbmdpbmVfaW5mbyB7CS8qIEJhZCBuYW1lLCBqdXN0IGZv
ciBleGFtcGxlICovDQo+ID4gPiAgICAgIC8qKiBAaW5zdGFuY2U6IFRoZSBAZHJtX3hlX2VuZ2lu
ZV9jbGFzc19pbnN0YW5jZSAqLw0KPiA+ID4gICAgICBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFz
c19pbnN0YW5jZSBpbnN0YW5jZTsNCj4gPiA+IA0KPiA+ID4gICAgICAvKiogQHJlc2VydmVkOiBS
ZXNlcnZlZCwgZHluYW1pYyBzaXplICovDQo+ID4gPiAgICAgIF9fdTY0IHJlc2VydmVkWzBdOw0K
PiA+IA0KPiA+IEkgYmVsaWV2ZSBbXSBpbnN0ZWFkIG9mIFswXSBpcyB0aGUgcHJlZmVycmVkIHdh
eSBub3dhZGF5cy4NCj4gPiANCj4gDQo+IFllcC4NCj4gDQo+IE1hdHQNCj4gDQo+ID4gPiB9Ow0K
PiA+ID4gDQo+ID4gPiBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2VuZ2luZV9pbmZvIHsNCj4gPiA+ICAg
ICAgLyoqIEBudW1fZW5naW5lczogTnVtYmVyIGVuZ2luZXMgKi8NCj4gPiA+ICAgICAgX191NjQg
bnVtX2VuZ2luZXM7DQo+ID4gPiAgICAgIC8qKiBAZW5naW5lX2luZm86IEFycmF5IG9mIGVuZ2lu
ZSBpbmZvICovDQo+ID4gPiAgICAgIHN0cnVjdCBfX2RybV94ZV9xdWVyeV9lbmdpbmVfaW5mbyBl
bmdpbmVfaW5mb1swXTsNCj4gPiA+IH07DQo+ID4gPiANCj4gPiA+IFRoZSBzaXplIG9mIF9fZHJt
X3hlX3F1ZXJ5X2VuZ2luZV9pbmZvIHRoZW4gY2hhbmdlIGFuZCBjYW4gYmUgY2FsY3VsYXRlZA0K
PiA+ID4gdG8gYmU6DQo+ID4gPiANCj4gPiA+IChyZXR1cm5lZCBzaXplIG9mIHF1ZXJ5IC0gc2l6
b2VvZihfX3U2NCkpIC8gZHJtX3hlX3F1ZXJ5X2VuZ2luZV9pbmZvLm51bV9lbmdpbmVzDQo+ID4g
PiANCj4gPiA+IFdlIHRoZW4gc2hvdWxkIGJlIGFibGUgdG8gYWRkIGFkZGl0aW9uYWwgZmllbGRz
IHRvDQo+ID4gPiBfX2RybV94ZV9xdWVyeV9lbmdpbmVfaW5mbyBpbmRlZmluaXRlbHkuDQo+ID4g
PiANCj4gPiA+IFdoYXQgZG9lcyBldmVyeW9uZSB0aGluaz8gV2UgbGlrZWx5IGNhbiBhcHBseSB0
aGlzIGlkZWEgdG8gb3RoZXINCj4gPiA+IHF1ZXJpZXMgdG9vIGFzIGl0IG1ha2VzIHNlbnNlLg0K
PiA+ID4gDQo+ID4gPiBNYXR0DQo+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IFJlZmVyZW5jZSBP
QToNCj4gPiA+ID4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzU1ODM2
Mi8/c2VyaWVzPTEyMTA4NCZyZXY9Ng0KPiA+ID4gPiANCj4gPiA+ID4gQ2M6IEZyYW5jb2lzIER1
Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4NCj4gPiA+ID4gQ2M6IFJvZHJpZ28gVml2
aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kg
Um9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPiA+ID4gW1Jv
ZHJpZ28gUmViYXNlZF0NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgRHVnYXN0IDxm
cmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9xdWVyeS5jIHwgMTUgKysrKysrKystLS0tLS0tDQo+ID4gPiA+ICBpbmNs
dWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrLQ0K
PiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9x
dWVyeS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gPiA+ID4gaW5kZXggNjFh
N2Q5MmI3ZTg4Li4wY2JmZWFlYjEzMzAgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9xdWVyeS5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9x
dWVyeS5jDQo+ID4gPiA+IEBAIC01Myw3ICs1Myw3IEBAIHN0YXRpYyBzaXplX3QgY2FsY19od19l
bmdpbmVfaW5mb19zaXplKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+ID4gPiAgCQkJaSsrOw0K
PiA+ID4gPiAgCQl9DQo+ID4gPiA+ICANCj4gPiA+ID4gLQlyZXR1cm4gaSAqIHNpemVvZihzdHJ1
Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSk7DQo+ID4gPiA+ICsJcmV0dXJuIGkgKiBz
aXplb2Yoc3RydWN0IGRybV94ZV9xdWVyeV9lbmdpbmVfaW5mbyk7DQo+ID4gPiA+ICB9DQo+ID4g
PiA+ICANCj4gPiA+ID4gIHR5cGVkZWYgdTY0ICgqX19rdGltZV9mdW5jX3QpKHZvaWQpOw0KPiA+
ID4gPiBAQCAtMTg2LDkgKzE4Niw5IEBAIHN0YXRpYyBpbnQgcXVlcnlfZW5naW5lcyhzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSwNCj4gPiA+ID4gIAkJCSBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSAq
cXVlcnkpDQo+ID4gPiA+ICB7DQo+ID4gPiA+ICAJc2l6ZV90IHNpemUgPSBjYWxjX2h3X2VuZ2lu
ZV9pbmZvX3NpemUoeGUpOw0KPiA+ID4gPiAtCXN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2lu
c3RhbmNlIF9fdXNlciAqcXVlcnlfcHRyID0NCj4gPiA+ID4gKwlzdHJ1Y3QgZHJtX3hlX3F1ZXJ5
X2VuZ2luZV9pbmZvIF9fdXNlciAqcXVlcnlfcHRyID0NCj4gPiA+ID4gIAkJdTY0X3RvX3VzZXJf
cHRyKHF1ZXJ5LT5kYXRhKTsNCj4gPiA+ID4gLQlzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19p
bnN0YW5jZSAqaHdfZW5naW5lX2luZm87DQo+ID4gPiA+ICsJc3RydWN0IGRybV94ZV9xdWVyeV9l
bmdpbmVfaW5mbyAqaHdfZW5naW5lX2luZm87DQo+ID4gPiA+ICAJc3RydWN0IHhlX2h3X2VuZ2lu
ZSAqaHdlOw0KPiA+ID4gPiAgCWVudW0geGVfaHdfZW5naW5lX2lkIGlkOw0KPiA+ID4gPiAgCXN0
cnVjdCB4ZV9ndCAqZ3Q7DQo+ID4gPiA+IEBAIC0yMTEsMTIgKzIxMSwxMyBAQCBzdGF0aWMgaW50
IHF1ZXJ5X2VuZ2luZXMoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ID4gPiA+ICAJCQlpZiAoeGVf
aHdfZW5naW5lX2lzX3Jlc2VydmVkKGh3ZSkpDQo+ID4gPiA+ICAJCQkJY29udGludWU7DQo+ID4g
PiA+ICANCj4gPiA+ID4gLQkJCWh3X2VuZ2luZV9pbmZvW2ldLmVuZ2luZV9jbGFzcyA9DQo+ID4g
PiA+ICsJCQlod19lbmdpbmVfaW5mb1tpXS5pbnN0YW5jZS5lbmdpbmVfY2xhc3MgPQ0KPiA+ID4g
PiAgCQkJCXhlX3RvX3VzZXJfZW5naW5lX2NsYXNzW2h3ZS0+Y2xhc3NdOw0KPiA+ID4gPiAtCQkJ
aHdfZW5naW5lX2luZm9baV0uZW5naW5lX2luc3RhbmNlID0NCj4gPiA+ID4gKwkJCWh3X2VuZ2lu
ZV9pbmZvW2ldLmluc3RhbmNlLmVuZ2luZV9pbnN0YW5jZSA9DQo+ID4gPiA+ICAJCQkJaHdlLT5s
b2dpY2FsX2luc3RhbmNlOw0KPiA+ID4gPiAtCQkJaHdfZW5naW5lX2luZm9baV0uZ3RfaWQgPSBn
dC0+aW5mby5pZDsNCj4gPiA+ID4gLQkJCWh3X2VuZ2luZV9pbmZvW2ldLnBhZCA9IDA7DQo+ID4g
PiA+ICsJCQlod19lbmdpbmVfaW5mb1tpXS5pbnN0YW5jZS5ndF9pZCA9IGd0LT5pbmZvLmlkOw0K
PiA+ID4gPiArCQkJaHdfZW5naW5lX2luZm9baV0uaW5zdGFuY2UucGFkID0gMDsNCj4gPiA+ID4g
KwkJCW1lbXNldChod19lbmdpbmVfaW5mby0+cmVzZXJ2ZWQsIDAsIHNpemVvZihod19lbmdpbmVf
aW5mby0+cmVzZXJ2ZWQpKTsNCj4gPiA+ID4gIA0KPiA+ID4gPiAgCQkJaSsrOw0KPiA+ID4gPiAg
CQl9DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGIvaW5j
bHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gPiBpbmRleCAxYmRkMjBkM2M0YTguLmM4MGUw
M2I2MTQ4OSAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0K
PiA+ID4gPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gPiA+IEBAIC0xMjQs
NyArMTI0LDE0IEBAIHN0cnVjdCB4ZV91c2VyX2V4dGVuc2lvbiB7DQo+ID4gPiA+ICAjZGVmaW5l
IERSTV9JT0NUTF9YRV9FWEVDX1FVRVVFX0dFVF9QUk9QRVJUWQlEUk1fSU9XUihEUk1fQ09NTUFO
RF9CQVNFICsgRFJNX1hFX0VYRUNfUVVFVUVfR0VUX1BST1BFUlRZLCBzdHJ1Y3QgZHJtX3hlX2V4
ZWNfcXVldWVfZ2V0X3Byb3BlcnR5KQ0KPiA+ID4gPiAgI2RlZmluZSBEUk1fSU9DVExfWEVfV0FJ
VF9VU0VSX0ZFTkNFCQlEUk1fSU9XUihEUk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX1dBSVRfVVNF
Ul9GRU5DRSwgc3RydWN0IGRybV94ZV93YWl0X3VzZXJfZmVuY2UpDQo+ID4gPiA+ICANCj4gPiA+
ID4gLS8qKiBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAtIGluc3RhbmNlIG9m
IGFuIGVuZ2luZSBjbGFzcyAqLw0KPiA+ID4gPiArLyoqDQo+ID4gPiA+ICsgKiBzdHJ1Y3QgZHJt
X3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAtIGluc3RhbmNlIG9mIGFuIGVuZ2luZSBjbGFzcw0K
PiA+ID4gPiArICoNCj4gPiA+ID4gKyAqIEl0IGlzIHJldHVybmVkIGFzIHBhcnQgb2YgdGhlIEBk
cm1feGVfcXVlcnlfZW5naW5lX2luZm8sIGJ1dCBpdCBhbHNvIGlzDQo+ID4gPiA+ICsgKiB1c2Vk
IGFzIHRoZSBpbnB1dCBvZiBlbmdpbmUgc2VsZWN0aW9uIGZvciBib3RoIEBkcm1feGVfZXhlY19x
dWV1ZV9jcmVhdGUNCj4gPiA+ID4gKyAqIGFuZCBAZHJtX3hlX3F1ZXJ5X2VuZ2luZV9jeWNsZXMN
Cj4gPiA+ID4gKyAqDQo+ID4gPiA+ICsgKi8NCj4gPiA+ID4gIHN0cnVjdCBkcm1feGVfZW5naW5l
X2NsYXNzX2luc3RhbmNlIHsNCj4gPiA+ID4gICNkZWZpbmUgRFJNX1hFX0VOR0lORV9DTEFTU19S
RU5ERVIJCTANCj4gPiA+ID4gICNkZWZpbmUgRFJNX1hFX0VOR0lORV9DTEFTU19DT1BZCQkxDQo+
ID4gPiA+IEBAIC0xNDUsNiArMTUyLDIxIEBAIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2lu
c3RhbmNlIHsNCj4gPiA+ID4gIAlfX3UxNiBwYWQ7DQo+ID4gPiA+ICB9Ow0KPiA+ID4gPiAgDQo+
ID4gPiA+ICsvKioNCj4gPiA+ID4gKyAqIHN0cnVjdCBkcm1feGVfcXVlcnlfZW5naW5lX2luZm8g
LSBkZXNjcmliZSBoYXJkd2FyZSBlbmdpbmUNCj4gPiA+ID4gKyAqDQo+ID4gPiA+ICsgKiBJZiBh
IHF1ZXJ5IGlzIG1hZGUgd2l0aCBhIHN0cnVjdCBAZHJtX3hlX2RldmljZV9xdWVyeSB3aGVyZSAu
cXVlcnkNCj4gPiA+ID4gKyAqIGlzIGVxdWFsIHRvICVEUk1fWEVfREVWSUNFX1FVRVJZX0VOR0lO
RVMsIHRoZW4gdGhlIHJlcGx5IHVzZXMgYW4gYXJyYXkgb2YNCj4gPiA+ID4gKyAqIHN0cnVjdCBA
ZHJtX3hlX3F1ZXJ5X2VuZ2luZV9pbmZvIGluIC5kYXRhLg0KPiA+ID4gPiArICovDQo+ID4gPiA+
ICtzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2VuZ2luZV9pbmZvIHsNCj4gPiA+ID4gKwkvKiogQGluc3Rh
bmNlOiBUaGUgQGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKi8NCj4gPiA+ID4gKwlzdHJ1
Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSBpbnN0YW5jZTsNCj4gPiANCj4gPiA+ID4g
Kw0KPiA+ID4gPiArCS8qKiBAcmVzZXJ2ZWQ6IFJlc2VydmVkICovDQo+ID4gPiA+ICsJX191NjQg
cmVzZXJ2ZWRbNV07DQo+ID4gPiA+ICt9Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICAvKioNCj4gPiA+
ID4gICAqIGVudW0gZHJtX3hlX21lbW9yeV9jbGFzcyAtIFN1cHBvcnRlZCBtZW1vcnkgY2xhc3Nl
cy4NCj4gPiA+ID4gICAqLw0KPiA+ID4gPiAtLSANCj4gPiA+ID4gMi4zNC4xDQo+ID4gPiA+IA0K
DQo=
