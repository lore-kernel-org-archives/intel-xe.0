Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C09C61D97
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 18:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E1210E21C;
	Fri, 24 Nov 2023 18:15:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8180810E20C
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 18:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700849728; x=1732385728;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5B97ibGMcxOTWvDiBFSUZhB+ElCHO7vGF3MUt6IIb0U=;
 b=QtfQtBJBVlAI9BsMMr7mABs6nXGl7V4pNkUwTtgu6l+Op88WRGG7Ygf8
 3WTYKIONG2mVkA7thBrAo5jI04k3tMzXhrg3nGCOdPW+YrF0QV88VRRPU
 sMXECIljol64Fm4AY7KAr+vqbiXNz1ZA+mCoF6Ugb1Ptoqu7nTqdfH2Xd
 oZ/ozf6TJ5xqtSiQuEWwgJtlI1VtChZX8cv0JIg1PQs8pUkDkuFrdLp8Q
 M+Frv6WUk8zw6EpcFHukoRqIKWJaYjnSQKDl/cg2hLkDXMln60F28BzDN
 aU+rbCyRaeOkKd8J8MDLgqGFpwhgE22YnXWVHEVaV+V1tKK5lC3e2aAKw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5680367"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="5680367"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 10:15:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="771330237"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="771330237"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Nov 2023 10:15:26 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 24 Nov 2023 10:15:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 24 Nov 2023 10:15:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 24 Nov 2023 10:15:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 24 Nov 2023 10:15:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=haU+yWFv4WGvk4vgqRwkIyFsCaZce3sn56ocNxg6sv0/EwANiW9EK4kZqKMgPbh+tuWnOUYBFbQA2PRR7P5Rc98X3pK89BYfWOHf0+EUeA7nMbsxPK+6lxit0nwiz8PxhQtmftSAqEcxDD1rXGYSAi0a8aHmuNy+MyZWMnAr9L1vhokiAzmtl6I27U7T3Ip4RIgQ4JJsWcB2Z/8UCtk+7xbtj2XDW4ldq8oEOZ/9CFGYAf9h+V2OzsIaKTXG4skiMbPlXrzKTMk/+Z9Zkpwt/OKmUi5VUDjjPZi3KMjY0XH8RrPQwLfAnPrTktAQLOMcUSEAo+KgvK4q6i8zaQn28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5B97ibGMcxOTWvDiBFSUZhB+ElCHO7vGF3MUt6IIb0U=;
 b=V1yESSIznfKfmZnah20AUHyWumdwedmT4ZWnnXWmSly0gPuYwPv9hy6RL3GaXq4euqGrC/lFHwTf6Qms5s6Cxxo3hhZot0MfaMdntLavi8aBmRE3vsmI33Em0vOUyefb1UmzARMZMkLsip90MRyG+dDQqM7YPM6IHtg39n2INlhBNME06oPRlHkwJfepWrX99LWWerplTIN+IkLqWJJgMWiwQW+81rzil5GrL6BCGhTV1zveXpylXO2lsOfJsqSpUn2NHZZHPDNYKUCympc9kVKPQUE14jUeJpODDk7pPzt1RxdBehF2j0xPc+diwRXhCkaAzGkFiXHNjBluV256bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MN2PR11MB4518.namprd11.prod.outlook.com (2603:10b6:208:24f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 18:15:23 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 18:15:22 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [PATCH v2 04/14] drm/xe/uapi: Reject bo creation of unaligned
 size
Thread-Index: AQHaHVGfLYd0saUXXkGyUpIb4oAP2bCJybmA
Date: Fri, 24 Nov 2023 18:15:22 +0000
Message-ID: <211b3972c32688002ac0198da364e0665f6c1a37.camel@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-5-francois.dugast@intel.com>
In-Reply-To: <20231122143833.7-5-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MN2PR11MB4518:EE_
x-ms-office365-filtering-correlation-id: 9b0beb1f-f143-4363-807f-08dbed1952e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aClfBjaQsVl2xVrqOkkcK8E56XCdtFmVcORLPkHFFm+mzgs1EnA4CdhQA2RZiNWMQIgjP5TKoIBMjXUU/xREnUKF6RanNr6cvlJuzZjmaiuuu/NsEiqpsn29gyKXE7I4NWJRiBDExCrx4aUZ6kAMlFltJtf9l9dG24kU/7a44MAy34aDyhEeiP57s4dhhEs0WATFcKhO3Fkv6Nastj3U9LbhQwmM18DPMEmGydaefaxfB31hZBzRwTMzzYO+HrX5WqaRLYXV7xIzLLlrWMomBeBT27bTSZpicTLSEFBGWFmVCtEMHskjtNl6cmp4VGpBO1rq0JLuQj1Eo1r8av3chM+oR5gsmUkk0uOTGBcEsAWHNCQy2iAAkzgkF+TF+sd1Ador1SCnO+IiSP+tXmLrw0AFsXX+1Fm7MUQSRfCjZu77NKHsUUdpFAGI4G8gcXj7EXLILg9guy7qbKGGXeCc9uTMTwaRuIWD4fZe5SOqGSEuEGtx88bPwqzor3ZkvYZtvbGxKg6wnWuUSpbdSs+vIhBC6H8bHUa9oHn5P1lCzESc3r08g+vmvdSUMVbNBMJnyhW5Q+MWtKI5lsr4PcfoJSyHPiJCC3V1mLAvGFvNlxbqIgt0wH+yLSFkNUL2orq9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(396003)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(66556008)(66946007)(66446008)(54906003)(64756008)(66476007)(76116006)(110136005)(91956017)(6636002)(316002)(83380400001)(6512007)(2616005)(38070700009)(478600001)(6506007)(71200400001)(36756003)(6486002)(26005)(66574015)(38100700002)(5660300002)(4001150100001)(82960400001)(122000001)(2906002)(41300700001)(86362001)(8676002)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RW9Id3NYR0xycGpFTVlJanZLbDdYSUdtbzF2S1MxRG1pcWdsVW96RjB6WU1T?=
 =?utf-8?B?MHVtQkxFMUVVMjRvOHd2d1plU05RM3pZcmJXdEUrOWEzNVNYRG9rb21DODRH?=
 =?utf-8?B?Uy9jZGI3MGp5MTRHWUFQaGN3TElXbWcvcy94NHh0YVpweHhYbXEwVjgrVkFT?=
 =?utf-8?B?eUZlaXNQbkNpVE1iZDJjeGF1YlN4eHErdDZEcEExeGdoVG5wWmlmcVk4bVQv?=
 =?utf-8?B?ZnlKalJTbzJzQy9LbHdmaTU2dGFtS3crcUQyUVpWL1lUWEkwcDhFdmxTR2d2?=
 =?utf-8?B?Um5FOTVCNFVRVzRhc2ltS2QzN3BUR0tOcVhTOVJKa3o4UWs1RTBEbXFqd0Qy?=
 =?utf-8?B?ZnJVMWUxa3dvQlNtSURXQ0I4ZXcwaGlDd0p0RkR3SkZzV0V2UytnVWxTM2hI?=
 =?utf-8?B?YjJ4c2w3b2FZYklmcEFTaFprZkszNjVTczJLcFAwTGY2WmN6L2lZblZESGdq?=
 =?utf-8?B?a0I1Y3ZNSE45RE1aUVR5bG5JZDVLSmFLK05MaUIrd0dMZ3NyWTJubzRPK0Js?=
 =?utf-8?B?M3BHQ25ZV2NwSnljMGNIcDJrUjlzbGlsSE82UzVaQ3NoMXpHOTFvQjBFT2RT?=
 =?utf-8?B?Q0tsNGxIQ0FTRTRXMnJaem5nMnNoOFJtck8vS2daMnR4aTNDUDRKenBvU1NM?=
 =?utf-8?B?Ymx6TUxFM3VSdmNzMnIvcVZMZlVVWVhuOUR0MzZSS1ZBK2RwWjhuSkc0cU4r?=
 =?utf-8?B?dlBsL2g0MkxIMVJVU2I5RVVnZDFCd3A4YU9MY1I5VUpaejczTWVWeGhuZmRT?=
 =?utf-8?B?cTFQZ1pDUXZWZit6QUVicVdoakt6L2J2RTQrb29kcTZURkVnRGM4cWJWcURt?=
 =?utf-8?B?T1Q0VnE3ZjRVUU8rMndKY0lmeWs2TVlidm1wUDdqc3kwRHBGc3Z2WkdYeGw5?=
 =?utf-8?B?d0p3ZXBoS0Y0MWkvY0taeXFuUjVXMGZSbUVlWXRIRkxLT1ZpNFd3K2RpOWV0?=
 =?utf-8?B?SENJZnFzQXk2bzMrQy90S1dEOUcreGZzbHh6NGJqdGhzcjEvT1c0T2MrdG9U?=
 =?utf-8?B?aXlqeEE4R0RuOERqcHBrblNDcklSZlo0eTNsbWpZVW9WelpzOTNoQ1NwRU50?=
 =?utf-8?B?TFNMazNLcW1QME5uVGpaTFIxN285M1gxbjBMd2dHemhvNE05SEZMaWl1YTFn?=
 =?utf-8?B?czNOSDljK3lTUk9kdkUwazR2RFVweDladnYxdUNLdHdRN3ZxcWw2VFBoM0No?=
 =?utf-8?B?OW9ZQjJGZUdzNm1RUFNDZlVBNmo0T2NCUDRqdXpER2hsb3hjSmsvTmczaHRI?=
 =?utf-8?B?UndKckMxd0VXcDBqS3JkNExPWVB5aitjTmhGcVdqUkRCbVJLTC9Bcnp1NjN1?=
 =?utf-8?B?TERJSis3YlN0cjB3MXlFTXh3NjJ4VS9FTUc2ZisxdTU5V3JqYnJVbFFYTy90?=
 =?utf-8?B?WnFpZ0VmSlhuYkhFMFIzaUFuSUpnY29KU1c5R0RmSURNcnZnZ2U1eHlwMFNn?=
 =?utf-8?B?bnFJYVlQc3pTdUpLRitla0tSUENMYkVtZ28wVU9tTlhMemtPeFFWQnZUVzhI?=
 =?utf-8?B?c1IzZFAzVXJVVFRON05lRlIySXNTalEvbzZmR2N5cGVjbXBCSklWUklBbVZr?=
 =?utf-8?B?WDNuTDdOOEtOaEwvWEtIUm1UR1lacnQwZUpyTHRTOHhTTVhMUFUzTTVBdFpL?=
 =?utf-8?B?V3FoblI0Rm0rcis1NUJXeXZrcGo1R1Zyc211ckZHbDd4NFlxcmNiendNZGsr?=
 =?utf-8?B?dXNkV2FESm9OYjJoOWVtVVIyb2taUUJlUWNnWnpaWW1kTUluZ0R1T2VoTzBa?=
 =?utf-8?B?WktwMVhhalF0dWRqY09OaStQampNZUFGODVzOGRxRHZLUmszYkdnRnk1VGxh?=
 =?utf-8?B?ZWpRUzQyVEY3ZHVQYW9iUGdHd0ljd1ZISmZkc0l6dFlPYWE1UEpNVmVuSG5H?=
 =?utf-8?B?cUQrcWUzcm8wM2lIL3p2eW1udFZKVTJvSnVtS2RxbUpWeXEwS0RDNk1aWDZD?=
 =?utf-8?B?Uy83L0Ewclg3NjJ1a21QcmdmN2NBM25vejIwWGhxU1VESGdtZU1qWW8rVmtS?=
 =?utf-8?B?MnovVDFHdkxBek1wWE1ISUVFbjc4T2p0YTVNNXBmTi9ZS29vVk5GcFBnWlFZ?=
 =?utf-8?B?bDJDb0ZGUTBzU3o4WlpielJEOWtiSUo1a2pzRTdkMXc5eWFEQ0NKZm54OC9W?=
 =?utf-8?B?U1NjVW9pUEZHangwSnM4eUpGcmExQWhJaVVmU1NVS2Q0YWNSVVJmMFQwdUly?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38F006B28965324EA0720624043D56EB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0beb1f-f143-4363-807f-08dbed1952e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 18:15:22.3193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vCHjQuEE/F1K1ZwLZhSaKkwIcyVELCqkdVqJ2nxbwx7utAQ7maq1s3NndXyR7gq3/U2lALf10Tij834r5vT0/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4518
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 04/14] drm/xe/uapi: Reject bo creation of
 unaligned size
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

T24gV2VkLCAyMDIzLTExLTIyIGF0IDE0OjM4ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IEZyb206IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWF1cm8uY2hlaGFiQGxpbnV4LmludGVs
LmNvbT4NCj4gDQo+IEZvciB4ZSBibyBjcmVhdGlvbiB3ZSByZXF1ZXN0IHBhc3Npbmcgc2l6ZSB3
aGljaCBtYXRjaGVzIHN5c3RlbSBvcg0KPiB2cmFtIG1pbmltdW0gcGFnZSBhbGlnbm1lbnQuIFRo
aXMgd2F5IHdlIHdhbnQgdG8gZW5zdXJlIHVzZXJzcGFjZQ0KPiBpcyBhd2FyZSBvZiByZWdpb24g
Y29uc3RyYWludHMgYW5kIG5vdCBhbGlnbmVkIGFsbG9jYXRpb25zIHdpbGwgYmUNCj4gcmVqZWN0
ZWQgcmV0dXJuaW5nIEVJTlZBTC4NCj4gDQo+IHYyOg0KPiAtIFJlYmFzZSwgVXBkYXRlIHVBUEkg
ZG9jdW1lbnRhdGlvbi4gKFRob21hcykNCj4gdjM6DQo+IC0gQWRqdXN0IHRoZSBkbWEtYnVmIGt1
bml0IHRlc3QgYWNjb3JkaW5nbHkuIChUaG9tYXMpDQo+IHY0Og0KPiAtIEZpeGVkIHJlYmFzZSBj
b25mbGljdHMgYW5kIHVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UuIChGcmFuY29pcykNCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWF1cm8uY2hlaGFiQGxpbnV4Lmlu
dGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmll
dy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ry
w7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4N
Cj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvdGVzdHMveGVfZG1hX2J1Zi5jIHwgIDggKysr
KysrKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jICAgICAgICAgICAgfCAyNCArKysr
KysrKysrKysrKysrLS0tLS0tLS0NCj4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgICAg
ICAgICAgfCAxNyArKysrKysrKystLS0tLS0tLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNl
cnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUvdGVzdHMveGVfZG1hX2J1Zi5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hl
X2RtYV9idWYuYw0KPiBpbmRleCAxOGMwMGJjMDMwMjQuLmE2NzU2YjU1NDA2OSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hlX2RtYV9idWYuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUvdGVzdHMveGVfZG1hX2J1Zi5jDQo+IEBAIC0xMDksMTQgKzEwOSwyMCBA
QCBzdGF0aWMgdm9pZCB4ZV90ZXN0X2RtYWJ1Zl9pbXBvcnRfc2FtZV9kcml2ZXIoc3RydWN0IHhl
X2RldmljZSAqeGUpDQo+ICAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICppbXBvcnQ7DQo+ICAJc3Ry
dWN0IGRtYV9idWYgKmRtYWJ1ZjsNCj4gIAlzdHJ1Y3QgeGVfYm8gKmJvOw0KPiArCXNpemVfdCBz
aXplOw0KPiAgDQo+ICAJLyogTm8gVlJBTSBvbiB0aGlzIGRldmljZT8gKi8NCj4gIAlpZiAoIXR0
bV9tYW5hZ2VyX3R5cGUoJnhlLT50dG0sIFhFX1BMX1ZSQU0wKSAmJg0KPiAgCSAgICAocGFyYW1z
LT5tZW1fbWFzayAmIFhFX0JPX0NSRUFURV9WUkFNMF9CSVQpKQ0KPiAgCQlyZXR1cm47DQo+ICAN
Cj4gKwlzaXplID0gUEFHRV9TSVpFOw0KPiArCWlmICgocGFyYW1zLT5tZW1fbWFzayAmIFhFX0JP
X0NSRUFURV9WUkFNMF9CSVQpICYmDQo+ICsJICAgIHhlLT5pbmZvLnZyYW1fZmxhZ3MgJiBYRV9W
UkFNX0ZMQUdTX05FRUQ2NEspDQo+ICsJCXNpemUgPSBTWl82NEs7DQo+ICsNCj4gIAlrdW5pdF9p
bmZvKHRlc3QsICJydW5uaW5nICVzXG4iLCBfX2Z1bmNfXyk7DQo+IC0JYm8gPSB4ZV9ib19jcmVh
dGUoeGUsIE5VTEwsIE5VTEwsIFBBR0VfU0laRSwgdHRtX2JvX3R5cGVfZGV2aWNlLA0KPiArCWJv
ID0geGVfYm9fY3JlYXRlKHhlLCBOVUxMLCBOVUxMLCBzaXplLCB0dG1fYm9fdHlwZV9kZXZpY2Us
DQo+ICAJCQkgIFhFX0JPX0NSRUFURV9VU0VSX0JJVCB8IHBhcmFtcy0+bWVtX21hc2spOw0KPiAg
CWlmIChJU19FUlIoYm8pKSB7DQo+ICAJCUtVTklUX0ZBSUwodGVzdCwgInhlX2JvX2NyZWF0ZSgp
IGZhaWxlZCB3aXRoIGVycj0lbGRcbiIsDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+IGluZGV4IGJiY2U0Y2Q4
MGY3ZS4uNGM3YzM3Y2E4YzUwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Ym8uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiBAQCAtMTIwMiw2ICsx
MjAyLDcgQEAgc3RydWN0IHhlX2JvICpfX3hlX2JvX2NyZWF0ZV9sb2NrZWQoc3RydWN0IHhlX2Rl
dmljZSAqeGUsIHN0cnVjdCB4ZV9ibyAqYm8sDQo+ICAJfTsNCj4gIAlzdHJ1Y3QgdHRtX3BsYWNl
bWVudCAqcGxhY2VtZW50Ow0KPiAgCXVpbnQzMl90IGFsaWdubWVudDsNCj4gKwlzaXplX3QgYWxp
Z25lZF9zaXplOw0KPiAgCWludCBlcnI7DQo+ICANCj4gIAkvKiBPbmx5IGtlcm5lbCBvYmplY3Rz
IHNob3VsZCBzZXQgR1QgKi8NCj4gQEAgLTEyMTIsMjMgKzEyMTMsMzAgQEAgc3RydWN0IHhlX2Jv
ICpfX3hlX2JvX2NyZWF0ZV9sb2NrZWQoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV9i
byAqYm8sDQo+ICAJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPiAgCX0NCj4gIA0KPiAtCWlm
ICghYm8pIHsNCj4gLQkJYm8gPSB4ZV9ib19hbGxvYygpOw0KPiAtCQlpZiAoSVNfRVJSKGJvKSkN
Cj4gLQkJCXJldHVybiBibzsNCj4gLQl9DQo+IC0NCj4gIAlpZiAoZmxhZ3MgJiAoWEVfQk9fQ1JF
QVRFX1ZSQU1fTUFTSyB8IFhFX0JPX0NSRUFURV9TVE9MRU5fQklUKSAmJg0KPiAgCSAgICAhKGZs
YWdzICYgWEVfQk9fQ1JFQVRFX0lHTk9SRV9NSU5fUEFHRV9TSVpFX0JJVCkgJiYNCj4gIAkgICAg
eGUtPmluZm8udnJhbV9mbGFncyAmIFhFX1ZSQU1fRkxBR1NfTkVFRDY0Sykgew0KPiAtCQlzaXpl
ID0gQUxJR04oc2l6ZSwgU1pfNjRLKTsNCj4gKwkJYWxpZ25lZF9zaXplID0gQUxJR04oc2l6ZSwg
U1pfNjRLKTsNCj4gKwkJaWYgKHR5cGUgIT0gdHRtX2JvX3R5cGVfZGV2aWNlKQ0KPiArCQkJc2l6
ZSA9IEFMSUdOKHNpemUsIFNaXzY0Syk7DQoNCm5pdDogcy9zaXplID0gQUxJR04oc2l6ZSwgU1pf
NjRLKTsvc2l6ZSA9IGFsaWduZWRfc2l6ZTsNCg0KPiAgCQlmbGFncyB8PSBYRV9CT19JTlRFUk5B
TF82NEs7DQo+ICAJCWFsaWdubWVudCA9IFNaXzY0SyA+PiBQQUdFX1NISUZUOw0KPiArDQo+ICAJ
fSBlbHNlIHsNCj4gLQkJc2l6ZSA9IEFMSUdOKHNpemUsIFBBR0VfU0laRSk7DQo+ICsJCWFsaWdu
ZWRfc2l6ZSA9IEFMSUdOKHNpemUsIFNaXzRLKTsNCj4gKwkJZmxhZ3MgJj0gflhFX0JPX0lOVEVS
TkFMXzY0SzsNCj4gIAkJYWxpZ25tZW50ID0gU1pfNEsgPj4gUEFHRV9TSElGVDsNCj4gIAl9DQo+
ICANCj4gKwlpZiAodHlwZSA9PSB0dG1fYm9fdHlwZV9kZXZpY2UgJiYgYWxpZ25lZF9zaXplICE9
IHNpemUpDQo+ICsJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPiArDQo+ICsJaWYgKCFibykg
ew0KPiArCQlibyA9IHhlX2JvX2FsbG9jKCk7DQo+ICsJCWlmIChJU19FUlIoYm8pKQ0KPiArCQkJ
cmV0dXJuIGJvOw0KPiArCX0NCj4gKw0KPiAgCWJvLT50aWxlID0gdGlsZTsNCj4gIAliby0+c2l6
ZSA9IHNpemU7DQo+ICAJYm8tPmZsYWdzID0gZmxhZ3M7DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBpbmRleCBj
ODBlMDNiNjE0ODkuLmRhMTBkOTQ2OTMwYiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS91YXBpL2Ry
bS94ZV9kcm0uaA0KPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IEBAIC0yMDYs
MTEgKzIwNiwxMyBAQCBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X21lbV9yZWdpb24gew0KPiAgCSAqDQo+
ICAJICogV2hlbiB0aGUga2VybmVsIGFsbG9jYXRlcyBtZW1vcnkgZm9yIHRoaXMgcmVnaW9uLCB0
aGUNCj4gIAkgKiB1bmRlcmx5aW5nIHBhZ2VzIHdpbGwgYmUgYXQgbGVhc3QgQG1pbl9wYWdlX3Np
emUgaW4gc2l6ZS4NCj4gLQkgKg0KPiAtCSAqIEltcG9ydGFudCBub3RlOiBXaGVuIHVzZXJzcGFj
ZSBhbGxvY2F0ZXMgYSBHVFQgYWRkcmVzcyB3aGljaA0KPiAtCSAqIGNhbiBwb2ludCB0byBtZW1v
cnkgYWxsb2NhdGVkIGZyb20gdGhpcyByZWdpb24sIGl0IG11c3QgYWxzbw0KPiAtCSAqIHJlc3Bl
Y3QgdGhpcyBtaW5pbXVtIGFsaWdubWVudC4gVGhpcyBpcyBlbmZvcmNlZCBieSB0aGUNCj4gLQkg
KiBrZXJuZWwuDQo+ICsJICogQnVmZmVyIG9iamVjdHMgd2l0aCBhbiBhbGxvd2FibGUgcGxhY2Vt
ZW50IGluIHRoaXMgcmVnaW9uIG11c3QgYmUNCj4gKwkgKiBjcmVhdGVkIHdpdGggYSBzaXplIGFs
aWduZWQgdG8gdGhpcyB2YWx1ZS4NCj4gKwkgKiBHUFUgdmlydHVhbCBhZGRyZXNzIG1hcHBpbmdz
IG9mIChwYXJ0cyBvZikgYnVmZmVyIG9iamVjdHMgdGhhdA0KPiArCSAqIG1heSBiZSBwbGFjZWQg
aW4gdGhpcyByZWdpb24gbXVzdCBhbHNvIGhhdmUgdGhlaXIgR1BVIHZpcnR1YWwNCj4gKwkgKiBh
ZGRyZXNzIGFuZCByYW5nZSBhbGlnbmVkIHRvIHRoaXMgdmFsdWUuDQo+ICsJICogQWZmZWN0ZWQg
SU9DVExTIHdpbGwgcmV0dXJuICUtRUlOVkFMIGlmIGFsaWdubWVudCByZXN0cmljdGlvbnMgYXJl
DQo+ICsJICogbm90IG1ldC4NCj4gIAkgKi8NCj4gIAlfX3UzMiBtaW5fcGFnZV9zaXplOw0KPiAg
CS8qKg0KPiBAQCAtNTE2LDkgKzUxOCw4IEBAIHN0cnVjdCBkcm1feGVfZ2VtX2NyZWF0ZSB7DQo+
ICAJX191NjQgZXh0ZW5zaW9uczsNCj4gIA0KPiAgCS8qKg0KPiAtCSAqIEBzaXplOiBSZXF1ZXN0
ZWQgc2l6ZSBmb3IgdGhlIG9iamVjdA0KPiAtCSAqDQo+IC0JICogVGhlIChwYWdlLWFsaWduZWQp
IGFsbG9jYXRlZCBzaXplIGZvciB0aGUgb2JqZWN0IHdpbGwgYmUgcmV0dXJuZWQuDQo+ICsJICog
QHNpemU6IFNpemUgb2YgdGhlIG9iamVjdCB0byBiZSBjcmVhdGVkLCBtdXN0IG1hdGNoIHJlZ2lv
bg0KPiArCSAqIChzeXN0ZW0gb3IgdnJhbSkgbWluaW11bSBhbGlnbm1lbnQgKCZtaW5fcGFnZV9z
aXplKS4NCj4gIAkgKi8NCj4gIAlfX3U2NCBzaXplOw0KPiAgDQoNCg==
