Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BA0C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 20:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC0D10E2C8;
	Thu, 16 Nov 2023 20:53:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7421710E2C8
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 20:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700167997; x=1731703997;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=4MpTL+mRADTDeXORczMX4sTyRSuiVqFA9/4jmQgNQOI=;
 b=Z2wbB7RbGGEUcA9oN7kNm05DjKDjnvra0ehsU9iqTpgP6RnL87GhOegH
 iBMbmYZnbB4cJyOQH17a35V4lsFpQaPt2C1QhLCqpJx2TiXIXoZ4DNl9i
 k6UPrk8t0celAfuYSb77IMxNc8vICfugE79mZApv9dqNi0pAXjTQLAwIq
 PYL45f7Do4ZUGKjfQr3ALajIqa56eidDyB/LKPUrsd1l3xff/CuY9QPhH
 kPOJscFpy/MMcsDdI3YsvC9sjJhDvVmgaI+Yhg8uagI+wDWEf8pc5m2aO
 DK5DlJqJHJHNE7SR1rZX4+RZ2PFuDxYMBtavVRA4cP03UmJwhqT8AdT3F Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="388338309"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="388338309"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 12:53:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="13250023"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 12:53:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 12:53:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 12:53:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 12:53:15 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 12:53:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpSXp6e1fKTLrtgZSxyOQput/DuFvFKdj4Py87/iTxuKVxj1arIQF2IazStefXn8tQzx8EMygJsTf5ohIb9Y4TjelAGQfjgTZUfVB73I/VBFaSlv6I56sgJr7HCL4pt4It+mXJS4ve8D1fDisErngoB3JA6qG2q7wU28wzqTh6vG4G35jIokAFJiYMXqFgP12lS1gr1FtAFs5068xCR/tNeGASRyVPzs4SPRrnzno31WbIl2+jl+pwpb7OOP21bvDS8rwAJ8gxdsNwtzyGQzPhMHIROoVQmd78xTRTmUEOAXjntgTubDet1d2UCsIDEBksbPLVsmxT+A7iHLQHJGVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MpTL+mRADTDeXORczMX4sTyRSuiVqFA9/4jmQgNQOI=;
 b=UpczoEEDeAJXp+OkEbMIojRgtXTsKcfieE0YrYRMAT/LNPs+Z6wR2rk3Da3FF4UP0I5oR+aaX74rkie1LBwGX/8p91dQD2A+0kI30p26C//k7VtkF+Yn+48Ary1DXy4L5+IHM2J65wy4xKjfOft9v5ngUv0QfUljFAos7Iq6z+dVZFSTNX5itkRT+/Eqd8OgN0agP2MPQ37JnHLx7yxl+YiVzyuP5RgVIyEkLcR/aEaAsfS1EenjaMYP8wmdaLc8B/Kd9/X0KvVc4E95D4wf/LSGtmHnFWMubK+vscfYk+8+IJBs5qXISAfZ/Lo+ymTmiK3jKKd9Oig+R+LQ/mWpRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MW5PR11MB5929.namprd11.prod.outlook.com (2603:10b6:303:194::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.36; Thu, 16 Nov
 2023 20:53:04 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 20:53:04 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Zanoni, Paulo R"
 <paulo.r.zanoni@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/5] drm/xe: Allow num_binds == 0 in VM bind
 IOCTL
Thread-Index: AQHaGMTl4fhE6KT17kiTyYyxFid5UrB9bDyA
Date: Thu, 16 Nov 2023 20:53:04 +0000
Message-ID: <5071488434e6018bf1ca7deef03434cbf70d4291.camel@intel.com>
References: <20231116194047.214330-1-matthew.brost@intel.com>
 <20231116194047.214330-2-matthew.brost@intel.com>
In-Reply-To: <20231116194047.214330-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MW5PR11MB5929:EE_
x-ms-office365-filtering-correlation-id: 904801d6-a5ba-4d29-9f13-08dbe6e6073d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bghjMZry7vyCc+z2x7E9DAowQkn9SZcfPjx8JcZ11vPKJAvHs0KUzFY/q3Jqvbir01ucYcL0v4H/GKts0XRvdSNt0s4WNXkl+l3LOxtTyvVBcKBIaCfS1FpP02pDHIhQkiFXZpfHek3oO6jF2nT3SpUTYvVtNVMysWEM+7IFxEdh8FxNyE7Gl4qTsWrY058kh53+hAFHN3DvAE87c3TSWvNkJ77rv8+VQyxyadC04QhCjlMskEpUp6rTGINolFaVPFogvLpbfWtHZjufRrzGepm9Q90WaAPHK0QOG/sMfOKifPWP4yzpz3SbY1fVM2qDQTcsG0wmS2coAQGaLlnmuR2KoiP4c0n6hiTPxjOP1tLo7zLRsy7ftt+fALjIs5pb1HcIp4giGlUf6ahLq3k3eDrlCBHkc8e0GKEpurWkU/JxkhIhAiBiFOYayy8PQdKq3gqXiByA4Xa3C7brEluQfMrcMT+vLLx6pHSxd/XU0RD/YtTaPb64Jt4T5telGkyKdu++oSD8xba/6m+qHWsdoWEwqMu1ZQWqttJZyMHnYwZVLwcZDGpHD9MLjfC7w/jbhUCJx39QkPs4gAmgyDC4avzoOzC8StNqTbUDlYBF3wjrjOWN3CA0cgPIYyHWwLIb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(39860400002)(346002)(396003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(2906002)(6486002)(478600001)(6512007)(4001150100001)(6506007)(2616005)(86362001)(91956017)(71200400001)(5660300002)(6636002)(316002)(64756008)(66556008)(66476007)(8676002)(66446008)(66946007)(76116006)(8936002)(110136005)(122000001)(38070700009)(38100700002)(83380400001)(41300700001)(82960400001)(26005)(36756003)(66574015);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlpTTjNockZyckp0aWtROEY5aHpJbkloMlppWm9GeTk0WnN4OGpSWUVRNkxo?=
 =?utf-8?B?cW82MGNQYXEyTDlXcjZ0bkNBdXZPelczZEF1dUhHdFIxOGo4OHRsYzJFRThJ?=
 =?utf-8?B?d1hqdjB0TWZ6LzAreXJLU3I2dis3MWdhUUhIcG5QTUFrcnNyZ29Mb0s4Y3Bo?=
 =?utf-8?B?eFVON0FTb1RBejQ0NzUyVXduNGptNGt3aDhNY3Ivb0htcDM0d0FFZ2NoM1ht?=
 =?utf-8?B?NWlKc0dDeFRoUWlxMU0zVGVob09saTR0U0dLM25VQUYxVnQ0SzZpYXhNbEV0?=
 =?utf-8?B?MFhIeGxIZlZwcjUyZXAvVkM4YStMbGwzSXE2bThyNHNhTkFmUnR2cmpYQ0l6?=
 =?utf-8?B?eXdVNHBJeC83UUwwV2tQOHp4ekx1Mk5UVGxoQmlacWJWbGxkN0JFUFo2R240?=
 =?utf-8?B?bGZmdmg1NUFDYTB1MzRRbUFXNEVSWlFORVhhV2VNcjN0aHRwaWNZZWs0cG5a?=
 =?utf-8?B?QU56OUFxalY2M3U2dTd1UUlKVHNKNkhlT1ZXanBycExtVktzM0IyNUVkemVz?=
 =?utf-8?B?UU05YnRUSTNFOHJEckdyMmRhSjJZdmhUOTFCUVFscWt1bXJyQUFFTUl2NkhI?=
 =?utf-8?B?a05IcHRFRCt0M1d3bXExOHBRRlQyNWlhNVpZckJhNmo0d1M4R3Z0RXloMi9w?=
 =?utf-8?B?dHlyZkh0QVd5SnZpQnRBdmUzY0JQZ0RJYUZkS3hNZ2thYlg1ZVM5M29tQnJx?=
 =?utf-8?B?SGxRVEJySTNsRHExcHBMOTZUbEthbWZPZnpnRWI5WkdhRUExSDkyUUFhQ3VD?=
 =?utf-8?B?cHEwSUFoaHl2NXBaRTl2UGFHZjg2bVZLelczQVFlVWJDdkhsSWJkci9CN0Zo?=
 =?utf-8?B?bkVKNXVOQi92WjFNOTlvejQ1R2dRZGdaTmExWmR5N1NRakZsbnVDbmptbkww?=
 =?utf-8?B?aXNGc09Jei9BSWZGTW1DcWVKYVMyL1V1WXFBVnlnU1ZWSmljUUxnRStReWlq?=
 =?utf-8?B?bFVBdDF4aGNHZTVWdHlzOE1LQnpzTEJzYTF3aGhlOUFia2pSUEZTL0FVNVNr?=
 =?utf-8?B?U0JrOFFWUk1DNTFmRXdPM2Erb2V1dmdCVXdjY1FNc2o2WEFMbzFySHBkQVFw?=
 =?utf-8?B?bFZzYUdBYXgySUdGWlZlK05MbXEvb05wNnhJNDc2N2IzYWkwaS9zQW9JdXc0?=
 =?utf-8?B?bXFOMHpRVzNIMTQ0K0I0UUllVUNwTG9hNXVvOStxWGdTRUlMZVYwZFc3bjU5?=
 =?utf-8?B?Z1ZUVWluNXFhYVlUV2RMc2ZkUDAzTzlDZ25lUjVha1pqZGM5dmExdTlINDI1?=
 =?utf-8?B?aC9UL3BBR2cxS25CaTFabi80cEs3RVMvTEI3a1JUazNydUFXQUw0b3JlM2Np?=
 =?utf-8?B?V3pOSXVUYk5zTnM4L21mbWNpWlArUW14SWRRZVBzNGs2THZIVVQ0c1pScGRC?=
 =?utf-8?B?cm5jeUR2YXpRQUFSNjdQMkRjb1FzTDJNTFA4U2Z3bGRkNmsxZFUxNFFpMEFL?=
 =?utf-8?B?Tm4zSFl2UEhPWmN2aitDWURuM0pLc2ROdXJ2N2tlM1I5ZW5EMS9IdVdDaHZl?=
 =?utf-8?B?ZVlOZ1F2SngvRzFZNTFjS1owb0I1aHZuNWlzeTk1a24rSWtCaS9ldmNtSGor?=
 =?utf-8?B?aGZ0Z0dWZ1hpMTMrNmpnNjBuNjIyaDIrODRkaE56ejZpdkZkL296WVJBbnFH?=
 =?utf-8?B?WC9ZTitKaDRiMWkwa29FMjdReUNuZ3J1OWF1Vk9TQ3J6WlFmNHIvekZPR2dO?=
 =?utf-8?B?MGVKMkpnaU9BRitTMjl1ejIzd09BNmpxcHgvOXpweVRMWGNOaGtqK1JjaWtC?=
 =?utf-8?B?SGZTQkJwOC9wR1pmOTNCUzlqRmRjYTVwMm5uZ0lPVnQ3c3dmM0NlY3M1OHYx?=
 =?utf-8?B?dkpWajZUOERJaVNiQlJlWkQ1dXlLbTlyNEoya0hNS3N5czNtQUhRRGs2Z3BZ?=
 =?utf-8?B?a0tEbjJpRUFXYy91NG5oWllsRDZ0cFFja2VjTFZaallGSy96TnBDRkRwR2ZR?=
 =?utf-8?B?ZFdsWDFvbGgzd3ZqMGdtM1RYcHhGYitIa2tMY05wL0kxMk9jNmtCQjljRDJF?=
 =?utf-8?B?V0w0S2lleVJoczF1ZzNIazYzQ2dxNFd3TzQ0a1BSazNpTUpTUTgxNXFZckhP?=
 =?utf-8?B?S1dOSnIvRUFDSll2RHJpdTBneU42TDNVdnd4Z2luTmpoVlJWT1gxMzN4SVhL?=
 =?utf-8?B?WFpVOHNaNWRLQk9xaXZIT0czUVJDM1kzQWJlV3NKdldkM0NXNzVuUy9iUmZL?=
 =?utf-8?B?WkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <569C8E5B8B9EC049924B0DA9F763B0E2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 904801d6-a5ba-4d29-9f13-08dbe6e6073d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 20:53:04.1153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: naqpvRi9buRsM/ULlMnqXZr75kAsoJxo5t3RVl65gbZOjZcRZP8WKbEu9ghYbGJHzaVFTVZ61y13t3Pi041Vjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5929
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/5] drm/xe: Allow num_binds == 0 in VM bind
 IOCTL
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

T24gVGh1LCAyMDIzLTExLTE2IGF0IDExOjQwIC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBUaGUgaWRlYSBiZWluZyBvdXQtc3luY3MgY2FuIHNpZ25hbCBpbmRpY2F0aW5nIGFsbCBwcmV2
aW91cyBvcGVyYXRpb25zDQo+IG9uIHRoZSBiaW5kIHF1ZXVlIGFyZSBjb21wbGV0ZS4gQW4gZXhh
bXBsZSB1c2UgY2FzZSBvZiB0aGlzIHdvdWxkIGJlDQo+IHN1cHBvcnQgZm9yIGltcGxlbWVudGlu
ZyB2a1F1ZXVlV2FpdEZvcklkbGUgZWFzaWx5Lg0KDQpzL3ZrUXVldWVXYWl0Rm9ySWRsZS92a1F1
ZXVlV2FpdElkbGUNCg0KU28gdGhpcyBpcyBqdXN0IGZvciB0aGUgYmluZCBxdWV1ZS4NCk5vdCBz
dXJlIGlmIGl0IGlzIHVzZWZ1bCwgTWVzYSB3aWxsIGV2ZW50dWFsbHkgbW92ZSB0byBhc3luYyB2
bSBiaW5kIGFuZCB3ZSB3aWxsIHVzZSBhIHNpbmdsZSBUSU1FTElORV9TWU5DT0JKIHRvIHRyYWNr
IHdoYXQgYmluZCBvcGVyYXRpb25zIGFyZQ0KY29tcGxldGVkLg0KUGF1bG8gZG8geW91IHNlZSBh
bnkgdXNlIHdpdGggc3BhcnNlPw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0
IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ry
w7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfdm0uYyB8IDMwICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZtLmMNCj4gaW5kZXggZDQ1ZjRmMWQ0OTBmLi5jZDhjMjMzMmEyMmUgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV92bS5jDQo+IEBAIC0yODUwLDcgKzI4NTAsNiBAQCBzdGF0aWMgaW50IHZtX2Jp
bmRfaW9jdGxfY2hlY2tfYXJncyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gIAlpbnQgaTsNCj4g
IA0KPiAgCWlmIChYRV9JT0NUTF9EQkcoeGUsIGFyZ3MtPmV4dGVuc2lvbnMpIHx8DQo+IC0JICAg
IFhFX0lPQ1RMX0RCRyh4ZSwgIWFyZ3MtPm51bV9iaW5kcykgfHwNCj4gIAkgICAgWEVfSU9DVExf
REJHKHhlLCBhcmdzLT5udW1fYmluZHMgPiBNQVhfQklORFMpKQ0KPiAgCQlyZXR1cm4gLUVJTlZB
TDsNCj4gIA0KPiBAQCAtMjk3Nyw3ICsyOTc2LDcgQEAgaW50IHhlX3ZtX2JpbmRfaW9jdGwoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWxlKQ0K
PiAgCQkJZ290byBwdXRfZXhlY19xdWV1ZTsNCj4gIAkJfQ0KPiAgDQo+IC0JCWlmIChYRV9JT0NU
TF9EQkcoeGUsIGFzeW5jICE9DQo+ICsJCWlmIChYRV9JT0NUTF9EQkcoeGUsIGFyZ3MtPm51bV9i
aW5kcyAmJiBhc3luYyAhPQ0KPiAgCQkJCSAhIShxLT5mbGFncyAmIEVYRUNfUVVFVUVfRkxBR19W
TV9BU1lOQykpKSB7DQo+ICAJCQllcnIgPSAtRUlOVkFMOw0KPiAgCQkJZ290byBwdXRfZXhlY19x
dWV1ZTsNCj4gQEAgLTI5OTEsNyArMjk5MCw3IEBAIGludCB4ZV92bV9iaW5kX2lvY3RsKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkNCj4g
IAl9DQo+ICANCj4gIAlpZiAoIWFyZ3MtPmV4ZWNfcXVldWVfaWQpIHsNCj4gLQkJaWYgKFhFX0lP
Q1RMX0RCRyh4ZSwgYXN5bmMgIT0NCj4gKwkJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgYXJncy0+bnVt
X2JpbmRzICYmIGFzeW5jICE9DQo+ICAJCQkJICEhKHZtLT5mbGFncyAmIFhFX1ZNX0ZMQUdfQVNZ
TkNfREVGQVVMVCkpKSB7DQo+ICAJCQllcnIgPSAtRUlOVkFMOw0KPiAgCQkJZ290byBwdXRfdm07
DQo+IEBAIC0zMDI4LDE2ICszMDI3LDE4IEBAIGludCB4ZV92bV9iaW5kX2lvY3RsKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkNCj4gIAkJ
fQ0KPiAgCX0NCj4gIA0KPiAtCWJvcyA9IGt6YWxsb2Moc2l6ZW9mKCpib3MpICogYXJncy0+bnVt
X2JpbmRzLCBHRlBfS0VSTkVMKTsNCj4gLQlpZiAoIWJvcykgew0KPiAtCQllcnIgPSAtRU5PTUVN
Ow0KPiAtCQlnb3RvIHJlbGVhc2Vfdm1fbG9jazsNCj4gLQl9DQo+ICsJaWYgKGFyZ3MtPm51bV9i
aW5kcykgew0KPiArCQlib3MgPSBremFsbG9jKHNpemVvZigqYm9zKSAqIGFyZ3MtPm51bV9iaW5k
cywgR0ZQX0tFUk5FTCk7DQo+ICsJCWlmICghYm9zKSB7DQo+ICsJCQllcnIgPSAtRU5PTUVNOw0K
PiArCQkJZ290byByZWxlYXNlX3ZtX2xvY2s7DQo+ICsJCX0NCj4gIA0KPiAtCW9wcyA9IGt6YWxs
b2Moc2l6ZW9mKCpvcHMpICogYXJncy0+bnVtX2JpbmRzLCBHRlBfS0VSTkVMKTsNCj4gLQlpZiAo
IW9wcykgew0KPiAtCQllcnIgPSAtRU5PTUVNOw0KPiAtCQlnb3RvIHJlbGVhc2Vfdm1fbG9jazsN
Cj4gKwkJb3BzID0ga3phbGxvYyhzaXplb2YoKm9wcykgKiBhcmdzLT5udW1fYmluZHMsIEdGUF9L
RVJORUwpOw0KPiArCQlpZiAoIW9wcykgew0KPiArCQkJZXJyID0gLUVOT01FTTsNCj4gKwkJCWdv
dG8gcmVsZWFzZV92bV9sb2NrOw0KPiArCQl9DQo+ICAJfQ0KPiAgDQo+ICAJZm9yIChpID0gMDsg
aSA8IGFyZ3MtPm51bV9iaW5kczsgKytpKSB7DQo+IEBAIC0zMDkyLDYgKzMwOTMsMTEgQEAgaW50
IHhlX3ZtX2JpbmRfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgc3Ry
dWN0IGRybV9maWxlICpmaWxlKQ0KPiAgCQkJZ290byBmcmVlX3N5bmNzOw0KPiAgCX0NCj4gIA0K
PiArCWlmICghYXJncy0+bnVtX2JpbmRzKSB7DQo+ICsJCWVyciA9IC1FTk9EQVRBOw0KPiArCQln
b3RvIGZyZWVfc3luY3M7DQo+ICsJfQ0KPiArDQo+ICAJZm9yIChpID0gMDsgaSA8IGFyZ3MtPm51
bV9iaW5kczsgKytpKSB7DQo+ICAJCXU2NCByYW5nZSA9IGJpbmRfb3BzW2ldLnJhbmdlOw0KPiAg
CQl1NjQgYWRkciA9IGJpbmRfb3BzW2ldLmFkZHI7DQoNCg==
