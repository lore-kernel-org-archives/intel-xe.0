Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1D0C54E68
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 18:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4812F10E60B;
	Tue, 19 Mar 2024 18:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YnizTsBh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729A910E60B
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 18:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710872867; x=1742408867;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JGtRiHngrHvSz7NWbYPG4zuCfBwAQtpwtzHEb4X3z8A=;
 b=YnizTsBh5Xe6cny5gjJpgz2dI44nQ7VCcaOkaWLRjo7GmSP5LNoc3Q5M
 hI7GR8cRd3nFclw03a9+PNj4v2Bbuq7sn3kQx4MoWXRWh/I1UJuX15zT9
 su6qOEzU5aXZzKf7UcqJu9U8b56M90fKviy/A2uKsbabIjPinQZgD0QLx
 DMzS60EcGmHQl+lcgy0zkq3Jg97+Z1fdZpdA3xH4saeDdI3qljXwUw5JO
 HvL7s1/tavE6rHVIDEOmH2TVmRLKbdT/fRQO7CJD8Q8SaNzw0LiwT5sta
 AIuTMSnFu9MSsE9URtxZqEDrnewmJwWhw/5EoClvzSrF7WIbZC829oeNx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="6372218"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="6372218"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 11:27:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="14565929"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 11:27:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 11:27:46 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 11:27:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 11:27:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 11:27:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgCmkHnsGx167513ek3OOCe/pClL0yFoWTio0/sEM64tapNrDQntJVf5CDqCsf+dWjV6zOUTQUY4jnRJsYzMlbOPNPpwGUnNiB5yCb93xAP+5aSvaGCDrWCQra9nNyDBMOfwPXebNTRHMT9LYEa3gIvz8srsl4k0smOUJWRCHsbEh8/XYLlCpwLRQ/irXrpQG3wSurkepNy6KmKhusA2khL5bUjGbyBr+KbFmNpFlm7uOFHug2yVIMpqOH2YLz7aH7D8lJcg4eJKnwBKoJjbJeyHQRj9OLXqEB9GfrjGn+AxPxh74DyTAhIFkUOQ/iEfk6nhPXUm1OrLEBE/VsE9rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGtRiHngrHvSz7NWbYPG4zuCfBwAQtpwtzHEb4X3z8A=;
 b=AFb4ePJkbr1uJ18Xg9hOMIoKmFTE2Zz4rl4RSLvA34dzvRW5sGDW3x/jPkFjBGfJ4B30xwC7qSN5eevTAaIFNioKqZeN1qsXO6gMJn0SMjxGrC1q1fwHSF9XlOi4vbDE12+rR8zEhSQDFb7AkDhazXSJcnZbxAjdeoO2liwKycJLGQTvBP06CQuVVBSyCBfzd+x9TAOFlKmQ9d4kUULU54WyV1DZc31jWPCUgybBagdUk3Wk6sossiD/sEwSlKxgZ3k+FsVoJmd8lpbpKnsonPdKYl9+xCcSp1OzDkyaayGHdSAW5FXL3yzu3a/YwUP3gQNPAw0xGHl+9izsY7YJEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH8PR11MB6925.namprd11.prod.outlook.com (2603:10b6:510:227::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Tue, 19 Mar
 2024 18:27:43 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Tue, 19 Mar 2024
 18:27:43 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 2/8] drm/xe/svm: Add DRM_XE_SVM kernel config entry
Thread-Topic: [PATCH 2/8] drm/xe/svm: Add DRM_XE_SVM kernel config entry
Thread-Index: AQHaeacxKgRabut9JEWqNc03FaMkm7E+y4wAgACWMeA=
Date: Tue, 19 Mar 2024 18:27:43 +0000
Message-ID: <SA1PR11MB69918186B365F1599C96B38C922C2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240319025511.1598354-1-oak.zeng@intel.com>
 <20240319025511.1598354-3-oak.zeng@intel.com>
 <b467523d7a1e3153f01e6a1b036f5db2ac5760ea.camel@intel.com>
In-Reply-To: <b467523d7a1e3153f01e6a1b036f5db2ac5760ea.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH8PR11MB6925:EE_
x-ms-office365-filtering-correlation-id: a6bab5e6-b186-4436-85e8-08dc48424485
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CqZBEfkI9bcijnG6AePBT1Sw5Ty3VaQsEOe4ejI0eVglkVgTzC92uEWcow4flF8bWQusAF4C9enPsFAFJ3XzAuiNj884MffTH5i2G2OnSxRSit0AF3iJay0Qxxr5D30oaqYSBZ4Z8xbojDeocvEj2lr0C2CN0QvyUKCVhnlwp8aw5n3QGu5d6G/4jmDyuHvCWq2923WlBmsRP7TiZeHntsAW3bDZyZG4DmTA7o4FnbhS+TIg7IkWr3ql2F6/fXpOIErP7XpV2nSq9mpphdTZjcH/KuulRnjbL8u1WNgBgiyMJhxHJYTPKYHIp1iuqll75AXOHGbaSlVHuFJC6gpKkuxf3QQNMSTdF4NPyR4/xzXhHtTUUgtvXs4XxirT6kUQ78Iha8nQE8VhvvI2urbkorrAKh88x3e6oA57fAkozip3fIf0X7/vCBba215B0Y3jQ+eD40MuMREx5Q3nslhigWWUFRyP4Ypx0Dud7KEGbY6FNDewPYGZ5nHyiJVp3LhlhC4uKRRDHC4VMw4KzNtx1yp8j/D6PLu8DUFfMZR5AWAaux/M61pRUrBwIdAP91kWsqRFHVQbgWtL3rfOn2EQ/z96yZqE4v2Q7+4bfyoNYhjMKYSGoMJgROuiz+GFHNPCXxNBqVaqCOI0xn4sl7UHxx5aWBpI0F2tBAzk4nVJdG2MsFzcP49CSplnsLQd7XWzE7XQJR7RO/p8pNOaOk4C84pQtK/7fitIivmT/E9pakY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUM5OEo5VW1XTENUR0JXOHFpbFZSZk5uMUgwak1WSkdvUnI4Slhtb3VMOVNv?=
 =?utf-8?B?MGtjWis0V2hzcTdlYWswT0NnR0pTcDUzb3h1Z1FNUS9yeFdBeDRmU0NDR2Nh?=
 =?utf-8?B?Rks2RG5TSERpUmR3OWl6amRCR25YR25rb3hEakE0eFZXQjJ6T0t4RDQ0cm9W?=
 =?utf-8?B?cFp1eFl6N2dsZGpNeHRYbTkwVmRKNmI1ZXNRZHoxZ243aUdoL0VKSkF4Q1Vz?=
 =?utf-8?B?akpkekI5SThDTFRvRlI0OHp1Wmxzak1Tanl0TENHOFMySlBqUGtWZWwxUWhR?=
 =?utf-8?B?bmsxc01pZ1h3OTkrenlSNTF6akFGYWFJUC9mbXBBYzFkQisrSnZ3L1d3N29l?=
 =?utf-8?B?cXVEdU1Cd3NZT2k3UkhsSE5udDhFSURCZnN5cFVlVVZyUGlzeU5FbGo2VS9l?=
 =?utf-8?B?bE45R0lqUEN5WDBOU0pMRitOc2pSbTdDaE9pc0NmMGlWMXFROTFIaCtWdUFu?=
 =?utf-8?B?dUVEUVcra0s2bzdVcTR3STNvSnlPTW9zMkJGUW5DYUo2Nk9VdzNhZmh3ZUdQ?=
 =?utf-8?B?VDM1bjZzZTVuRkg4VlZVbHVUL1lTeUhIM1hYc1BvMkJXSVBXRVZGalhxdzcy?=
 =?utf-8?B?SThhZmdzTVNEQmlxMGhiaVdxeDFIdmtMTmdnZmVwK29JanArSGs5bWNndXNZ?=
 =?utf-8?B?ZjFuSkw4R3lNbHg0SFF5ZUxRdXk5MFhEQWU0NlRXMmlkR2pwMk9WZm9oYXRC?=
 =?utf-8?B?WjVJaW85ZnYyRDg4QXA1Y01Xb1krUW4yS21KYlZqUHpBdUpGS1NBZEpvWmFP?=
 =?utf-8?B?ZVdkV1R2c1ZKRjNYOHhUQ1NkSnRDWHZlVWxBaGRyNnZEYlJ1R3VpbTYzSGFl?=
 =?utf-8?B?cnI5bFRUdDRoazFkOVNRYzRNdVVHbzRMNlJuQ0lrb3RxQW44SE11VEs0MmFL?=
 =?utf-8?B?b2MrQ1ZSMkVKZ2tKV0YzUlU2MnVQRzBmYTA0QXZNU1YwY21iNXNIRHJoaHU0?=
 =?utf-8?B?L0FsczJNeCtZd0tROU1hWGlDbGVMNGJlQ0p1bVBvVFQ3OVFneFRmdjI1cTdv?=
 =?utf-8?B?WWZwNjh3S3h5djhLS1ZjQW95K0FFTUJLdk1kUWxnVjJHb0VxQTFicWZyK0s3?=
 =?utf-8?B?M2lkajFXQ0NuZ2NGZGwweWFTc2FZTUsyaDl3YVVNSi9QeHpOSWdjWTExWWtx?=
 =?utf-8?B?WkFXWFMwcE1keUEzak5UNlFaTnF3bktuRUFVMTBDWGNBUUFPeUdNRC9oTkRa?=
 =?utf-8?B?N21aT0tQWnhjZDNGS0xkOUNBa3BKRlYxaTdkd3lUbmt1eGI4SjhsWmdSV0Vy?=
 =?utf-8?B?QXVrMVR2ZnI1dkZBTVFoQk4xQzAyQm5nbWhHSGtLelJKZHRvSmw5RVd5cHR6?=
 =?utf-8?B?cjFMckxESHpSZzcxVHpVRzRqbDlJdlRtTDNva25pN3JZQSswNzZQdUVrL3Fw?=
 =?utf-8?B?ZWcreEc5dWx5eEpwcEVNUE9LSGQydHN3VUt5SSt1VGlFNzVQdi9KYmFGVThY?=
 =?utf-8?B?YlhuYXk0cjVNOEpuYnNBdUh0N1lVMGdvMkJjcDdpd2dBWXZvK2l1M0ZJVTNR?=
 =?utf-8?B?MS96elRiY3R5YXROVVd6WGtjUXlqREZNYTlsSGhXY2k3b3hzb1gzdWNTNlVk?=
 =?utf-8?B?ZnJCMDZyNEtob3NZTG1iWGg3b1IyWVJsNnRRSGpBMEx2Qkd3Y0c5RmMxSmdj?=
 =?utf-8?B?Y3ZRV0l1enZBQTR3TzlKcG1yemRlMjNnVnZlbXhJTCtZS3YzU3pXbENtU204?=
 =?utf-8?B?eC9vY2FEOEJXakxXbmR0dUxUdWdxemxoT2FlcGxnSXY3SWRCd2lDT0ZiQ1Bm?=
 =?utf-8?B?NWtpVXhKd3V2cUMxUjgzUmNEQXRURWEwRzZYOWhMb2xvK3lpbVRXWVVJdk1n?=
 =?utf-8?B?MUtoNzY2czAvMExjYjBSSkxxMWpBSW1rcStVME5ZdU1yQzN6RHh5aXc1ajFt?=
 =?utf-8?B?L3ExVE1hN3dVTVduY3JuV0VlbkMrb1laTGp1Q2Q0QksvRmNnMWt2Y2lDRmdn?=
 =?utf-8?B?S082MEF6SkNGQ0xxMkFVY3hRNHlaVy9Ob2duM01TT2l4NXdTdGZYTzJPOHd2?=
 =?utf-8?B?UkEwQUt4TXRoQjlLT3lxSWRmVnpWQTJqSVNtV0hUNmdnVllJQ096WDF0WVF6?=
 =?utf-8?B?azM3UmsyZm9JVGZYZkVmbitDTFp4MHhKZFZ2dXFXZnhtdkZlV3BHL1BVNDkz?=
 =?utf-8?Q?mqUw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bab5e6-b186-4436-85e8-08dc48424485
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 18:27:43.4207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N0RO+9Gnkro/1ecZYPY/3Dh8PaoFR+t7keQ0OOimH17kg193TgDAR20jzYsqPEBIjlGcCGbsXjar9+SNnTxm/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6925
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGVsbHN0cm9tLCBUaG9t
YXMgPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAx
OSwgMjAyNCA1OjI2IEFNDQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpl
bmcsIE9hayA8b2FrLnplbmdAaW50ZWwuY29tPg0KPiBDYzogQnJvc3QsIE1hdHRoZXcgPG1hdHRo
ZXcuYnJvc3RAaW50ZWwuY29tPjsgV2VsdHksIEJyaWFuDQo+IDxicmlhbi53ZWx0eUBpbnRlbC5j
b20+OyBHaGltaXJheSwgSGltYWwgUHJhc2FkDQo+IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50
ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvOF0gZHJtL3hlL3N2bTogQWRkIERSTV9Y
RV9TVk0ga2VybmVsIGNvbmZpZyBlbnRyeQ0KPiANCj4gSGksIE9haywNCj4gDQo+IE9uIE1vbiwg
MjAyNC0wMy0xOCBhdCAyMjo1NSAtMDQwMCwgT2FrIFplbmcgd3JvdGU6DQo+ID4gRFJNX1hFX1NW
TSBrZXJuZWwgY29uZmlnIGVudHJ5IGlzIGFkZGVkIHNvDQo+ID4geGUgc3ZtIGZlYXR1cmUgY2Fu
IGJlIGNvbmZpZ3VyZWQgYmVmb3JlIGtlcm5lbA0KPiA+IGNvbXBpbGF0aW9uLg0KPiANCj4gUGxl
YXNlIHVzZSBpbXBlcmF0aXZlIGxhbmd1YWdlIGluIGNvbW1pdCBtZXNzYWdlcy4NCj4gDQo+IA0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPG9hay56ZW5nQGludGVsLmNvbT4NCj4g
PiBDby1kZXZlbG9wZWQtYnk6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmENCj4gPiA8bmlyYW5q
YW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogTmlyYW5q
YW5hIFZpc2h3YW5hdGhhcHVyYQ0KPiA+IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVs
LmNvbT4NCj4gPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+
ID4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGludGVsLmNvbT4NCj4g
PiBDYzogQnJpYW4gV2VsdHkgPGJyaWFuLndlbHR5QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS9LY29uZmlnwqDCoCB8IDIxICsrKysrKysrKysrKysrKysrKysr
Kw0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGUuYyB8wqAgNCArKysrDQo+ID4gwqAy
IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9LY29uZmlnDQo+
ID4gaW5kZXggMWE1NTZkMDg3ZTYzLi5lMjQ0MTY1NDU5YzUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvS2Nv
bmZpZw0KPiA+IEBAIC04Myw2ICs4MywyNyBAQCBjb25maWcgRFJNX1hFX0ZPUkNFX1BST0JFDQo+
ID4gwqAJwqAgNDU3MS4NCj4gPg0KPiA+IMKgCcKgIFVzZSAiISoiIHRvIGJsb2NrIHRoZSBwcm9i
ZSBvZiB0aGUgZHJpdmVyIGZvciBhbGwga25vd24NCj4gPiBkZXZpY2VzLg0KPiA+ICtjb25maWcg
RFJNX1hFX1NWTQ0KPiA+ICsJYm9vbCAiRW5hYmxlIFNoYXJlZCBWaXJ0dWFsIE1lbW9yeSBzdXBw
b3J0IGluIHhlIg0KPiA+ICsJZGVwZW5kcyBvbiBEUk1fWEUNCj4gPiArCWRlcGVuZHMgb24gQVJD
SF9FTkFCTEVfTUVNT1JZX0hPVFBMVUcNCj4gPiArCWRlcGVuZHMgb24gQVJDSF9FTkFCTEVfTUVN
T1JZX0hPVFJFTU9WRQ0KPiA+ICsJZGVwZW5kcyBvbiBNRU1PUllfSE9UUExVRw0KPiA+ICsJZGVw
ZW5kcyBvbiBNRU1PUllfSE9UUkVNT1ZFDQo+ID4gKwlkZXBlbmRzIG9uIEFSQ0hfSEFTX1BURV9E
RVZNQVANCj4gPiArCWRlcGVuZHMgb24gU1BBUlNFTUVNX1ZNRU1NQVANCj4gPiArCWRlcGVuZHMg
b24gWk9ORV9ERVZJQ0UNCj4gPiArCWRlcGVuZHMgb24gREVWSUNFX1BSSVZBVEUNCj4gPiArCWRl
cGVuZHMgb24gTU1VDQo+ID4gKwlzZWxlY3QgSE1NX01JUlJPUg0KPiA+ICsJc2VsZWN0IE1NVV9O
T1RJRklFUg0KPiA+ICsJZGVmYXVsdCB5DQo+ID4gKwloZWxwDQo+ID4gKwnCoCBDaG9vc2UgdGhp
cyBvcHRpb24gaWYgeW91IHdhbnQgU2hhcmVkIFZpcnR1YWwgTWVtb3J5IChTVk0pDQo+ID4gKwnC
oCBzdXBwb3J0IGluIHhlLiBXaXRoIFNWTSwgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGlzIHNoYXJl
ZA0KPiA+ICsJwqAgYmV0d2VlbiBDUFUgYW5kIEdQVS4gVGhpcyBtZWFucyBhbnkgdmlydHVhbCBh
ZGRyZXNzIHN1Y2gNCj4gPiArCcKgIGFzIG1hbGxvYyBvciBtbWFwIHJldHVybnMsIHZhcmlhYmxl
cyBvbiBzdGFjaywgb3IgZ2xvYmFsDQo+ID4gKwnCoCBtZW1vcnkgcG9pbnRlcnMsIGNhbiBiZSB1
c2VkIGZvciBHUFUgdHJhbnNwYXJlbnRseS4NCj4gPg0KPiA+IMKgbWVudSAiZHJtL1hlIERlYnVn
Z2luZyINCj4gPiDCoGRlcGVuZHMgb24gRFJNX1hFDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV90aWxlLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlLmMN
Cj4gPiBpbmRleCBmMWM0ZjlkZTUxZGYuLmI1MmEwMGE2YjVkNSAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3RpbGUuYw0KPiA+IEBAIC0xNTksNyArMTU5LDkgQEAgc3RhdGljIGludCB0aWxlX3R0bV9t
Z3JfaW5pdChzdHJ1Y3QgeGVfdGlsZQ0KPiA+ICp0aWxlKQ0KPiA+IMKgICovDQo+ID4gwqBpbnQg
eGVfdGlsZV9pbml0X25vYWxsb2Moc3RydWN0IHhlX3RpbGUgKnRpbGUpDQo+ID4gwqB7DQo+ID4g
KyNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fWEVfU1ZNKQ0KPiA+IMKgCXN0cnVjdCB4ZV9kZXZp
Y2UgKnhlID0gdGlsZV90b194ZSh0aWxlKTsNCj4gPiArI2VuZGlmDQo+IA0KPiBBdm9pZCB1c2lu
ZyBjb25kaXRpb25hbCBjb21waWxhdGlvbiBpbiB0aGlzIHdheSBpbnNpZGUgZnVuY3Rpb25zIGlm
DQo+IHBvc3NpYmxlLCBwbGVhc2Ugc2VlIGJlbG93Og0KDQpCZWxvdyBpcyBkb2FibGUuDQoNCkZv
ciBhYm92ZSwgZG8geW91IHdhbnQgc29tZXRoaW5nIGxpa2U6DQoNCiNpZiBJU19FTkFCTEVEKENP
TkZJR19EUk1fWEVfU1ZNKQ0KICAgICBzdHJ1Y3QgeGVfZGV2aWNlICp4ZTsNCiNlbmRpZg0KDQpJ
ZiAoSVNfRU5BQkxFRChDT05GSUdfRFJNX1hFX1NWTSkpDQoJWGUgPSB0aWxlX3RvX3hlKHRpbGUp
Ow0KDQpJdCBsb29rcyBsaWtlIHdlIGhhdmUgdG8gdXNlICNpZiBpbiBhYm92ZSBjb2RlLi4uIG90
aGVyd2lzZSwgdGhlIGRlZmluaXRpb24gb2YgeGUgd2lsbCBiZSBub3QgdXNlZCB3aGVuIERSTV9Y
RV9TVk0gaXMgbm90IGRlZmluZWQuLi4NCg0KTWF5YmUga2VlcCB0aGUgb3JpZ2luYWwgZm9yIGFi
b3ZlPw0KPiANCj4gPiDCoAlpbnQgZXJyOw0KPiA+DQo+ID4gwqAJeGVfZGV2aWNlX21lbV9hY2Nl
c3NfZ2V0KHRpbGVfdG9feGUodGlsZSkpOw0KPiA+IEBAIC0xNzcsOCArMTc5LDEwIEBAIGludCB4
ZV90aWxlX2luaXRfbm9hbGxvYyhzdHJ1Y3QgeGVfdGlsZSAqdGlsZSkNCj4gPg0KPiA+IMKgCXhl
X3RpbGVfc3lzZnNfaW5pdCh0aWxlKTsNCj4gPg0KPiA+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdf
RFJNX1hFX1NWTSkNCj4gPiDCoAlpZiAoeGUtPmluZm8uaGFzX3VzbSkNCj4gDQo+IENvdWxkIGJl
Og0KPiAJaWYgKElTX0VOQUJMRUQoQ09ORklHX0RSTV9YRV9TVk0pICYmIHRpbGVfdG9feGUodGls
ZSktDQo+ID5pbmZvLmhhc191c20pDQoNCldpbGwgZml4Lg0KDQpPYWsNCj4gDQo+IC9UaG9tYXMN
Cj4gDQo+IA0KPiA+IMKgCQl4ZV9kZXZtX2FkZCh0aWxlLCAmdGlsZS0+bWVtLnZyYW0pOw0KPiA+
ICsjZW5kaWYNCj4gPiDCoGVycl9tZW1fYWNjZXNzOg0KPiA+IMKgCXhlX2RldmljZV9tZW1fYWNj
ZXNzX3B1dCh0aWxlX3RvX3hlKHRpbGUpKTsNCj4gPiDCoAlyZXR1cm4gZXJyOw0KDQo=
