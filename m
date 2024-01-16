Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AE0C4706C
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 12:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A8410E4F2;
	Tue, 16 Jan 2024 12:32:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1D510E4C2
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 12:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705408363; x=1736944363;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=cXXIKsvydtEs8U2yumGgFd1xNx3bEWQVBRIZKA1KdXs=;
 b=CorGn/xWy5XSYEHJgtxv7IUFn7rHaMmo50xLm0m20tJmqLDv4cOKHjUw
 incQVjHKmeno0TnrBKHP+JEZU2u5qaoLiTpfkr6lQWrqp0B+uYT2AozQh
 U9s/eVMmsJUH3jllsvK7u1DqjdXSSmq1qmJkStGVC6TnS2hN/brynphrU
 pWouH3ky7Wmz/SlF1PSv22T4zomS4cSNLhXe5NdSP6dR0tSbkvWZPDbf/
 IValBXa1cEji1bkOZ68BWmJNg/aol3WpNlqLkpOK3hhRQQZUpYT6bqzqc
 OrKFdfTKYkWybiAFEARTrqyBHiE/r6P87qJumFGAg+DTHQucSaFWz8Pqz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="466229352"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="466229352"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 04:32:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="760165925"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="760165925"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 04:32:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 04:32:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 04:32:43 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 04:32:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B75oHaw8iPVjvpZpQMmvOy7DojS7L2I7z9OJOopztrA4DLoJCIH1MD3/rYyUjubDQ4K/toJgste8lm+y0DUZj3Rc+es3j9vfO5QVGAk//olJxMCi3neVom8u4baZIBW1gPfiWagD1mRLCBaEGmUlPnNM5tpnH5SgKuvrzG1o1ysJqLN2MRBy3Neb9RPA8WzqFr4s9RVkYbJrUsnyLVUaKFIKhzKAKYK9bMqUMI5IY+PQ4Ea7s10KXyK0/CpcPIX9eT27/PQPzm5uZ4qAnnylU9HxuRe24qSbSNV4oDHnuBbTgwNSdbHUMxZ18PxrurM6YzFkP0q++qzhSMs8QaGNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXXIKsvydtEs8U2yumGgFd1xNx3bEWQVBRIZKA1KdXs=;
 b=B2802RWCgRnhw+4FrQV/3ukzlFEwMuwBP40CEEmufwDXdmCM65O/dIoWiCiVP+RstQRYnCES9BLz+hM31TploI3QXtqCzBptsBWfd8JIJAubpcbSZAunLRDZLPWst7KdQeSpnj7D9D3rxcePhl+919HfuxMLnXQrTEagJ+/Ct37d+kgFJ+aUHe6BvKgOINss4V3ckg9C2LO7gTkcM+rT70eyY/G7X6F2Fef++ZiQ2R6Tlm4Au43uV4Hs1RwEpWzTKjLzTjP+gdIB44aovG8m5KqsxHUnPjE3lLRok9UPnsJOzHhwUiUQAiH5m32tD9fSjnZRgxRm8WwZhbcSMpgG6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7382.namprd11.prod.outlook.com (2603:10b6:8:131::13)
 by SA3PR11MB8076.namprd11.prod.outlook.com (2603:10b6:806:2f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Tue, 16 Jan
 2024 12:32:40 +0000
Received: from DS0PR11MB7382.namprd11.prod.outlook.com
 ([fe80::b043:8f67:3566:67ee]) by DS0PR11MB7382.namprd11.prod.outlook.com
 ([fe80::b043:8f67:3566:67ee%5]) with mapi id 15.20.7159.020; Tue, 16 Jan 2024
 12:32:40 +0000
From: "Coelho, Luciano" <luciano.coelho@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: [RFC v2 1/4] drm/i915/display: add support for DMC wakelocks
Thread-Topic: [RFC v2 1/4] drm/i915/display: add support for DMC wakelocks
Thread-Index: AQHaSHd+cGTsMFAW+0ecWGQkHclWBLDcXz8A
Date: Tue, 16 Jan 2024 12:32:39 +0000
Message-ID: <5de5aff06d303129a742a416ef65fea64f4f1d27.camel@intel.com>
References: <20240111091622.1110799-1-luciano.coelho@intel.com>
 <20240111091622.1110799-2-luciano.coelho@intel.com>
 <875xztsbrt.fsf@intel.com>
In-Reply-To: <875xztsbrt.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7382:EE_|SA3PR11MB8076:EE_
x-ms-office365-filtering-correlation-id: b4235eac-6dd3-4f8c-8737-08dc168f3aa4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nW74BxVGLV7v4BuQVbShEhi1k9ZwoOD0pYdh1qvUTXlWO/+SjnzMxWmAH/eWc4oL90orzPIoxOVxccl+MPR/PZBf0JfPqMZYg9tpxkZqa8E46sSeMZw4MJRT4uJ5AsMjQme+zAXGhswx6ok8X+4xoKk6RdYudRPgaIIvrNM+NWdXNbErA4OZoVIvOoMMoRAQtJnBD6rvUksORL6J1YNagbmorF9NCCcSGQ1vh2/At9wL94A5vGtTmlNvne86wB6n4yANE5U2rGlSRRgIxZ3u58BL1kcwPa48auSosMVAGYSvHlOJfzaFs/+y6gAHRG5taDpxRWS4axa0q2ZLpTBXdaDLJ38Q8zWlSfjWE0w/6oaNTb5f6awO1MnSqoNh+qtIdZXli9iauE0Q2IDdIcuAzsHCEzXO+Ns9mdZhd1FdXivFmokDb9LaKxX5wYjtgYwkHORQbQ0voia2yfqoutuZg1tBK6p1SMYSmYb/d4eON2ZwijAMOJ4ljP4zTBxBcd2yYTdmoA8eiRymE46FmdrCdq49rmlpJmdfBrYBvwyPYtQj4D+LDS8OOngKXmC+RLFyrneJAtrARDAEBgjDe3kIFYZ8DzQu4OqxpqLwnMLsynkGbDZNyrx6T5ml7NeUItG1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7382.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(122000001)(38100700002)(2906002)(5660300002)(36756003)(86362001)(41300700001)(82960400001)(6512007)(64756008)(6636002)(316002)(2616005)(66446008)(66476007)(110136005)(91956017)(76116006)(66946007)(66556008)(478600001)(6486002)(71200400001)(6506007)(83380400001)(26005)(8676002)(8936002)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1hGSUlsc25NWDltWHlROWQ1SVlNSjJ2U05uRHJkWldMbVF5ekZPYktaeWxO?=
 =?utf-8?B?eE81VkNDZWszbzRvdTVpajQ3bUpBa2xkdU1mVnlzR1RHdjZNVENzbERsdkFu?=
 =?utf-8?B?K253Qm43T0lWcWF3U1o1dmM4VUpmVEdPVFpvZ20rMXdmdUZzT1hkd0lRSTlL?=
 =?utf-8?B?TkF4NS90ZTlRVWRHei9vWGlYY2tlK3QzOUFIUmZKdGhVcDcyaWZpT3FsY29N?=
 =?utf-8?B?Z2gxWmNZaHRGY3RRaTJLRk1OWDRubUtlM0RvNjNGcHd4Y0ExUG5oaGpsU1NI?=
 =?utf-8?B?ODYvNmFZZFA2Z2FQY0RmQjNkUVRZQ3A5eFJhMHFwTmxYd3k5MlR5eE4zSTE2?=
 =?utf-8?B?bWx4Y3UyUnBhWkpVZ2t1N3ZCUDlhMUlIUnRwNTgrdVUrN1ptdDExYU9iMTlI?=
 =?utf-8?B?OXJhY2QzTVl0blhUeUZwOWsxV0k5OFIxcTA0NkpKZ3Q0NTRZRjlRYWNjVUtL?=
 =?utf-8?B?K2JGZWpIcWZOdElUSjhwWlJsdENiNW1WYTF2SGlBVXRiWG9oTVhPL0FKcTVE?=
 =?utf-8?B?ajU1Y1JBYVBhNFVNNTg2bSt1bDJNUTFFTXNIbldvWHVxdVh3d3MwZUVwTHU5?=
 =?utf-8?B?MVloZ3FndCs4Y1pTSVFSMWJudjk3NlYrd2lBSkhxV3hQY0lnQzRsc256WkFM?=
 =?utf-8?B?Mm5ZR2xLcmZjSVBtNnBQWjg5bllpVlNTanpWMlhnbktwcUUrd0ZwUXFEb3Bt?=
 =?utf-8?B?NjdZbXc0UU1KWFV0RDJFeTZlM2wrMnhFWXQvTFljdDlDMWxuNzk4b3NjMDU3?=
 =?utf-8?B?MU9hSWlycDdFTzE3MFBycDkveDc3OStEOTlEVDNtVHNlbU1keS9EVXhoT3FT?=
 =?utf-8?B?S0RQWUhpSUlaSTVnNmd0eENvcHMwbElPaEtmcVhuRm9MTlY4VlVCOEMvYUdU?=
 =?utf-8?B?UlFUNldDYXVnSDZpVjhDK011dHAyalVWY1JvdGhxbE8wYklNVVhweXN4alZM?=
 =?utf-8?B?UTdKb1QrbW5hSGZFSHJZZUNubk5scFl2VWJrZ0pGSTk4WlVuVWlmWkxITkU4?=
 =?utf-8?B?My9IMkhEMnBZdkJuMXlGVzdRTXhiTUFnZkp5VEwzU1liT2NjSG42TmhiR3Vr?=
 =?utf-8?B?aEFvaDdHU3hzaWl3UzFCRWVZYlJYUlozRk0vYmpOVUQ5VWl3RldlczFsRTU4?=
 =?utf-8?B?VG91M0RZc1RpNVpWYmlyQnFwb3g3MzlKWkoyU1AyYU1Kb040VWxrRDRJVDBk?=
 =?utf-8?B?MGI4dXB5SGJoaVpJYVpaM0psT3RWdC9qQ0MzelUwYmsway9SRm1mQS9LQWt4?=
 =?utf-8?B?MTFhTlRSRFhOZnRGV1p3VUFlTXZHdDZoaWJ6cU9BOWk4blo2cmV2QXhQZGdX?=
 =?utf-8?B?ankvYkVGK21JaTBkQmR0WDRSNW1YQlFML0gzZ2FETkFoUU9qanE0QzZHNEVG?=
 =?utf-8?B?VmVJSGZ3YVh4S0JWVDMrelNTdkdhQWllbEgyeTZiSklPaXRSREJpQ0thbGtq?=
 =?utf-8?B?UllPc2llVUdwYm1zS2l5MTBhK3ZObUpNRzdjbjJmMTZmOWlhYUYyVFJ2eXVP?=
 =?utf-8?B?U3FtdS9XekhaT0hsUEZGUXNQUE0wb3hNQXcxOXlJV2ZydVl5Y1J0RXRlZTQ3?=
 =?utf-8?B?K2RMNzR0U1RFWGRwRWtucVB2SUkxVWdWOXNmMXE1dmcxaldoTXJ3b1hvbmNl?=
 =?utf-8?B?ZXNnTFkrOWkvaG9WTHZvOUdWVkpaTWdFNy9mbTlxTHE2T1F4bHJiaEF5c0V6?=
 =?utf-8?B?ekdQN3VMZ3Z0c1JqcVZwcEpUZlZjbGVneFRybS9ha0Q0ZzduY2ttcmdVdmpP?=
 =?utf-8?B?WDEwM1FJMnVKS1R3eTFpRDJ2R1hmZXYxYWVyZ1YrakFmNFd4WTBwVmhEeWh2?=
 =?utf-8?B?Y09uU2laMkhqVjBMY0tXcmdNdDFmVWtwRVkzaTc5RzIwQWFpOTM4TUc5MjZw?=
 =?utf-8?B?aFNLY25kemV3dVdIanRIdzNES3BJUFNncGtpVENUdXp3OEx6VHplQ2paWlVU?=
 =?utf-8?B?VFRPMVFEOFdpM1dJWEJMQ2h0NVNNb0VWb0JOUmVUTjYwWXZkZ1d4VERROEhu?=
 =?utf-8?B?OXF2ZmxBOGNLRWJBMDQ1c2xyODVaZWduRUVjeHRJRmxVT01uT1MzYmFsNFNT?=
 =?utf-8?B?U0hVR2lTMXFOdXVkeGltbldlQStpclFhRWQ4RGZjbjZBMmwvVTg5emVNTkRO?=
 =?utf-8?B?VURFZ3FoVEg4K0J3NzNPd2xFeHlBTzVkd25XdFRZSC9LdmlXQm5RTDFpSGhU?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF194B4197BA564F9CCEBDDB04FBE0E5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7382.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4235eac-6dd3-4f8c-8737-08dc168f3aa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 12:32:39.9632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9NXTc1mKpHPvtdGZrTXNAzvAKoMudH4r8rbJEEyn/seY4mhUF2BQNd+xqUn3/4cDLIWqQ8MjvfuAXzCMO89lJXfElxfv5WYqYFXhaRXeFPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8076
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

T24gVHVlLCAyMDI0LTAxLTE2IGF0IDE0OjI4ICswMjAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gVGh1LCAxMSBKYW4gMjAyNCwgTHVjYSBDb2VsaG8gPGx1Y2lhbm8uY29lbGhvQGludGVsLmNv
bT4gd3JvdGU6DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfd2FrZWxvY2suaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfd2Fr
ZWxvY2suaA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAw
Li5hNDcyMDVlMWVhMzINCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF93YWtlbG9jay5oDQo+ID4gQEAgLTAsMCArMSwzNCBAQA0K
PiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+ID4gKy8qDQo+ID4gKyAq
IENvcHlyaWdodCAoQykgMjAyMyBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+ICsgKi8NCj4gPiArDQo+
ID4gKyNpZm5kZWYgX19JTlRFTF9XQUtFTE9DS19IX18NCj4gPiArI2RlZmluZSBfX0lOVEVMX1dB
S0VMT0NLX0hfXw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ID4gKyNp
bmNsdWRlIDxsaW51eC93b3JrcXVldWUuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3JlZmNvdW50
Lmg+DQo+ID4gKw0KPiA+ICsjaW5jbHVkZSAiaTkxNV9yZWdfZGVmcy5oIg0KPiA+ICsNCj4gPiAr
c3RydWN0IGRybV9pOTE1X3ByaXZhdGU7DQo+ID4gKw0KPiA+ICtzdHJ1Y3QgaW50ZWxfZGlzcGxh
eV93bCB7DQo+ID4gKwlzcGlubG9ja190IGxvY2s7DQo+ID4gKwlib29sIGVuYWJsZWQ7DQo+ID4g
KwlyZWZjb3VudF90IHJlZmNvdW50Ow0KPiA+ICsJc3RydWN0IGRlbGF5ZWRfd29yayB3b3JrOw0K
PiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RydWN0IGludGVsX2Rpc3BsYXlfd2xfcmFuZ2Ugew0KPiA+
ICsJdTMyIHN0YXJ0Ow0KPiA+ICsJdTMyIGVuZDsNCj4gPiArfTsNCj4gPiArDQo+ID4gK3ZvaWQg
aW50ZWxfZGlzcGxheV93bF9pbml0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KTsNCj4g
PiArdm9pZCBpbnRlbF9kaXNwbGF5X3dsX2VuYWJsZShzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAq
aTkxNSk7DQo+ID4gK3ZvaWQgaW50ZWxfZGlzcGxheV93bF9nZXQoc3RydWN0IGRybV9pOTE1X3By
aXZhdGUgKmk5MTUsIGk5MTVfcmVnX3QgcmVnKTsNCj4gPiArdm9pZCBpbnRlbF9kaXNwbGF5X3ds
X3B1dChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSwgaTkxNV9yZWdfdCByZWcpOw0KPiAN
Cj4gTml0cGljaywgSSdsbCB3YW50IHRoZSBuYW1lIHByZWZpeCB0byBtYXRjaCB0aGUgZmlsZW5h
bWUsDQo+IGkuZS4gaW50ZWxfZm9vLltjaF0gaGF2ZSBmdW5jdGlvbnMgbmFtZWQgaW50ZWxfZm9v
XyouDQoNCk9rYXksIHNvIGludGVsX3dha2Vsb2NrXyooKSwgc3BlY2lmaWNhbGx5IGluIHRoaXMg
Y2FzZT8NCg0KSSBjYW4gYWxzbyByZW5hbWUgdGhlIGZpbGUgdG8gaW50ZWxfd2wuW2NoXSBpZiB3
ZSB3YW50IHRvIHNhdmUNCmhvcml6b250YWwgcmVhbCBlc3RhdGUsIGluIHdoaWNoIGNhc2UgdGhl
IGZ1bmN0aW9uIG5hbWVzIHdvdWxkIGJlDQppbnRlbF93bF8qKCksIHJpZ2h0Pw0KDQpUaGFua3Mh
DQoNCi0tDQpDaGVlcnMsDQpMdWNhLg0K
