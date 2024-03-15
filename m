Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6607C54E58
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 23:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8804F1126A9;
	Fri, 15 Mar 2024 23:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xrh6SjDf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E021126A9
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 23:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710544299; x=1742080299;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8e+wqcpd0/uWKChwc5vGHQ0xyIBCnYK3B+RrQ+WSwW0=;
 b=Xrh6SjDfv7Y/D5vbSJCwc7xBf+hBM6EG5CjQ0Zox+gSNKk6rx26lSZm7
 ONaRya2UlgXMl61tCPeo/cCh5tYCc5DsNIteu4iaqTuOrkW18aJY9zj11
 U7GonsjuGPqp1wXQCJ2r+MegLvbcenbaTx/yEAPfAZapYxM/x2K0pq/Cg
 SUtK85Qs4L+on56oWGyTiw3MUN4Iw7EQgtjFwJyX5QC27gxoHNKjjdFuq
 pMBLexM9UWLzVR2+nTPwBT78VeSfqPmP4+oh05PA6E7njmJqfNrwkXUCi
 RKHSYZRsDPPMMaGpKQ40wFPhLSGfHA7m95bdW6Wnn72+J3eTQ3Jo2+nrT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="15982911"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="15982911"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 16:11:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="12754327"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 16:11:35 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 16:11:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 16:11:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 16:11:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eN8ZcxMxAk1o00oANloKIudhZbYCNzeLk2jjWmbp7HUFRM11FbJKko2Gs7OQZ/Fq2n16iOdVObqVC+c5ygCl0R9HavEXU9AqU/hb5JGBCbOlinzDZtUAS3nUP9YgQtQUGLHcMBv97vfv5PQjykWY4HOad6drtmKHMxJcJWJlXvUkJG2DEEL93ASNg9w5+cvCD8fdzlFnMdN4pk+ao9HcYKKXaIfmNvz9vjlghcrZ5Pgf/jZCTBac3DOiSbvGg3lpQlO2bd7nHuZmo25UjD+JF2x2tSLOX9obKQ3lSTxpt5Kj2kuBaqZ67rPQ4AOIw45qBroer7aruClQUeKuMuMrLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8e+wqcpd0/uWKChwc5vGHQ0xyIBCnYK3B+RrQ+WSwW0=;
 b=d0IWrMQfxtmWSd73EU8EST98sxFIA/zK9b6IGOpe/qRoQLJXjsvHvFfaFbd8pR+IuA2prjq9OQkA72PfIGEJCRNG9gw6KabcTXS8/7GAZz+y8mE21NuGce25nTr9rUE2FG9vQVDNHJ3IxECr7xkQO62JbLegvCvZUEhnhSWMoFdaDIYFJAdo+dl2LMyPR1OtYwNNkbg3rZfEJ4VEZw/9GIZ0l8SzapmQaPXQ3e27dGpKkJzmHD5vPqZ3FTJkXWExNyweaeJaTcmTUh75nXWj3ADwO/NK6S4uRKH/R6GR6bz6KwGoucGHuT67bkf3Vaq21nkpoqfWNx2AwfpvePaAzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DS0PR11MB7557.namprd11.prod.outlook.com (2603:10b6:8:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Fri, 15 Mar
 2024 23:11:31 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Fri, 15 Mar 2024
 23:11:31 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for GPU
 vram
Thread-Topic: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for GPU
 vram
Thread-Index: AQHadb8YemanJm4MK0iW0Qj9YyIrJ7E4CXaAgAARuCCAAAcWwIAA+OCAgAA/seA=
Date: Fri, 15 Mar 2024 23:11:31 +0000
Message-ID: <SA1PR11MB6991647D9551DF3071C856CE92282@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-2-oak.zeng@intel.com>
 <fca1e232-89c4-4f39-b754-ad067941d5dc@intel.com>
 <SA1PR11MB6991D7E3792624E06A8334C692282@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991CD16EE87B670DE646D4892282@SA1PR11MB6991.namprd11.prod.outlook.com>
 <893518a5-79b9-4292-bfd4-f7553f948ab8@intel.com>
In-Reply-To: <893518a5-79b9-4292-bfd4-f7553f948ab8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DS0PR11MB7557:EE_
x-ms-office365-filtering-correlation-id: a91bb378-b21d-4255-951d-08dc45454078
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pvvediok4T7qKODDl2oVjeNkQRGDypmdBm6t7VZ/Ws176OzqK3qW1057HFWQeuQeeiSGSW7u0ezpqkWziQrbOdmXqvyeY+NGDStStHbvEPO227w+vk9cB9sPuN1hGDJo8P6Npjtxwg/t+pQREa/exX9FfokY3fUe8hKuA2Bn0i8xaU9grYGHf6BRpbXmNoVk6ySJmqrMaSekAH0aObN+TcX5Z2J0PDKKniSihe9jytdnw7eDc0lu6BwYNoEucGrPG7FlLsFMmT87lj6o6UtmJNz5ExBV6f4cd84JLJ72sx0CC1ENWUwoHEyvyA8lObeTQe3Re80Rcs0AsZHU2f1rRJY6YKZmWIMV55IWkvZe3kB3remkh8ps0zdSgXrFiiUThfWZUanSo+HTdMrg2ZuCRsSGJ1BJESKiiWukAEW2gVXIf09ii1E5zLWzWKMGLcXHpzxJKQxAloXbB2IHbjPbT/ZoYtqN/A2JAq6gIOmmuJiypWojd0Y3crWh0ASKeVH7Hwih5k4MostoDcASM9dNINeCSRhf2pvTGlZv+u5jqy6YuydUJPEPLYILP067Idmr71BUxaWwU2vGJFYWlRM9YVxbSA8edsqzkZbKMao7G/9uA0hmAqoQ3I7mhVFDFO7aEvInJsFTfLsNAegsX47RSxzvXuPSr2L8m44MlgC6RH80IYIgdxAfTujjUhr21JLJLJtq1BNMo4hEOXyJrv8rQYQbOSLthJzRfPjSX6Ct6+8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTRyQXFBN2YwUU52ZGhMdDVqYVlzSnlvTmU5U0hEOVlJVjVVeTgxUHpTa2p3?=
 =?utf-8?B?NHV5UkNCcjRCNWs1eFRYOFhWUVhIeFh5UFBRL3BOQWYxSlJtc0hNYzkzWk9K?=
 =?utf-8?B?dERobXJWc1Q2UjRnMjB2b0Z1TlFOVlZ1RnNOa3JRUEtMbkFodU9EOVZZVHg2?=
 =?utf-8?B?RW1BK1JOS3ovcDlmZXdzUndTdVE5L2RCUG9reWdybzZWdzk3R0doR1VoUkNv?=
 =?utf-8?B?Qi9KSHpQS2FmblFTMGxsUHdUQVZRZEZ2L0NEQ0RzTUtScmhTbHBzaWlaMUtW?=
 =?utf-8?B?U09PZXdhb3JtZDdueTBCYTB0Q0VPTnlKZDM0ZFUyRHVvMUkvdUFJWFJoNU5p?=
 =?utf-8?B?bFZyc3ZWejhtdFR6dkJDMUpIS2JkNHZrL1VpWE1WS3JKR1M5aU90R1hSdm1Y?=
 =?utf-8?B?OXdjKzBBWDJwRnNyWm5DUGlKOFIxTi9TNXlpZll4MGdvUC9lbHZyK0QrZnpz?=
 =?utf-8?B?dG85OEFtc1d3L0Q0RXQ0R0orVndKWG9lekpvTk1QRW0xNHlsWG0rRXc4YnFX?=
 =?utf-8?B?MmRMVlVqZWRiZ0dFMElVaTNxOFNnMjVsRG5xUStIWVNhOGxwN0ZraU52TE5x?=
 =?utf-8?B?NzZHbXFUUEorZWIwemNVbjBQcDJ2WFQwUHVNTVU2NlNCaUdhMnk2QnlFNFo0?=
 =?utf-8?B?b3RMNWt5VEtDY0xDWE9DM1lRWElyMUtpalN5TExqZmhpWDA3WngrLytSS1hZ?=
 =?utf-8?B?UnREVHpYYzRDZzRDaFZTeXE4WHhJcy9OcG5KZ1JzSklnMndYc2NENEIzM0xq?=
 =?utf-8?B?UDYzZS9kejVSTkhWaW1VSWlUclFjcnlldkVmVkZQbzJuVnBORHBpWTBvYlVJ?=
 =?utf-8?B?TTlmRUFNbGxqWWhQQlFPUzRZMVRpV0pqcEJTbmVzQ1ZPU25Yb1E4TitseWdM?=
 =?utf-8?B?aHB0OHIxYlpsUEVuOEEzNktTZDZkeHhrUTRCcmR0QXUwVDFDeTFITUZMUWxz?=
 =?utf-8?B?NUN1NmwxdDJtdTVYTzhXRUp3bmtsYkppcWdFclBrNGZXNWpYVlNENEF0UEpp?=
 =?utf-8?B?dUxsR2pkV2RJOTV2WWhtTjQ5S0NYR2kxc2JuQTRWN09aNFBzeWxaeU1nMllG?=
 =?utf-8?B?UFRQTmlmMTM4N2I2eFlJUmFzdnQrUkQ1TGJNZFFzaWs4bTgzL00yWkxrUW96?=
 =?utf-8?B?SXNZMmxSbVBLRm9GbTRZQkhEdTIxTXRONEt3K2NOeGZ0ZTFONnBQbDhiZ3NL?=
 =?utf-8?B?OWY4NyttbXJiSzNvVHUzU3JSWjBLUklzTkFtMlU3bWUvZjJKWW9COUU0UnIx?=
 =?utf-8?B?ckdvc1FOOWd0ZlFjWExFZkxIWHZRdXRUS0FlYXU4eDBveGRkMWsxNXJtYndy?=
 =?utf-8?B?MW5FalY4OHdNM2xhS2t1eEoxeHV5NzBsZlBOaGJpZlJkVFE4MW5ObmpsOWw4?=
 =?utf-8?B?L1p1SW5yeFNVZE5IN01ZZXo4clN3T1EyV2NpbTcrNnVkVUtCbER5Vkt1bEhP?=
 =?utf-8?B?bHhiZXpVenhMK0Zwa0IyL0RTT3VlVS96ZG1SUXUrMzBtVG9zRHozL1piS1Fs?=
 =?utf-8?B?TGVJbjNtUXFNcytoUXFVb0NGYUcwN2FDM1hsQTB6eVNaTm5JVlNxcXIxRzF6?=
 =?utf-8?B?dnpSMjlSRGlzM1lrU3ppRXR5bk1KT2gwVG55SEFPYm42N3N6WFYybmhTbUk4?=
 =?utf-8?B?VUVCM21ORWE2czUyZVRFc1NiTThsOTc0cldMYkkxSDBzTWg4dnh0VWE0UjFM?=
 =?utf-8?B?L2pTckw3TGJYdWJmVUFrUXFHcHRkV050ZEkvbU1mUUhEQi85aXVxLzdqODd3?=
 =?utf-8?B?STM0cEJMN0JFVXFQMmhMVW41Y2tvSHNxeVp5SmwwTjdoVTJwb0FDU0FIZlNo?=
 =?utf-8?B?STNoU2FUMU0vRTJCZW5xNUl6ekZaTUF6dDE2NlBLMklSNFlhQ0dQUkN5c0Ni?=
 =?utf-8?B?aUVqcTA5dkttaXBuelE2cG5MUmpzS1I2QWl4TDJ4akZ1eEFXSHVJZXZtQ21E?=
 =?utf-8?B?YTdta0VzaDQyUmdXYVo3RCsxbVFXVW45TTkxTisxbGYzZWEwOURUYzNjeWpa?=
 =?utf-8?B?d3hmM1ZuWHRTQ09scTY3ZUlicGZORkpSaUUwdG5FSU9vREtad0lSdm8vSkpw?=
 =?utf-8?B?L1lkbDFyL003UFdUcUtNMWFzTnZDblhRQ3VORURCOWRVa1dMcS9ibjRDRkQy?=
 =?utf-8?Q?hzgo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a91bb378-b21d-4255-951d-08dc45454078
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 23:11:31.5939 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7IZCYGIEp3imNJdyuEaSSK0wnssQJYR2xYODDxoUGLUtjHD/FKiUdPTk/rEUO4zk4kJOK1UFcQGOzYgZhGE1Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7557
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2VsdHksIEJyaWFuIDxi
cmlhbi53ZWx0eUBpbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMTUsIDIwMjQgMjow
NSBQTQ0KPiBUbzogWmVuZywgT2FrIDxvYWsuemVuZ0BpbnRlbC5jb20+OyBpbnRlbC14ZUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEhlbGxzdHJvbSwgVGhvbWFzIDx0aG9tYXMuaGVsbHN0
cm9tQGludGVsLmNvbT47IEJyb3N0LCBNYXR0aGV3DQo+IDxtYXR0aGV3LmJyb3N0QGludGVsLmNv
bT47IGFpcmxpZWRAZ21haWwuY29tOyBHaGltaXJheSwgSGltYWwgUHJhc2FkDQo+IDxoaW1hbC5w
cmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNV0gZHJt
L3hlL3N2bTogUmVtYXAgYW5kIHByb3ZpZGUgbWVtbWFwIGJhY2tpbmcgZm9yDQo+IEdQVSB2cmFt
DQo+IA0KPiANCj4gT24gMy8xNC8yMDI0IDg6MTYgUE0sIFplbmcsIE9hayB3cm90ZToNCj4gWy4u
Ll0NCj4gPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uYw0KPiA+
PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMNCj4gPj4+PiBpbmRleCBlM2RiM2ExNzg3
NjAuLjBkNzk1Mzk0YmM0YyAxMDA2NDQNCj4gPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfbW1pby5jDQo+ID4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uYw0KPiA+
Pj4+IEBAIC0yMiw2ICsyMiw3IEBADQo+ID4+Pj4gICAgI2luY2x1ZGUgInhlX21vZHVsZS5oIg0K
PiA+Pj4+ICAgICNpbmNsdWRlICJ4ZV9zcmlvdi5oIg0KPiA+Pj4+ICAgICNpbmNsdWRlICJ4ZV90
aWxlLmgiDQo+ID4+Pj4gKyNpbmNsdWRlICJ4ZV9zdm0uaCINCj4gPj4+Pg0KPiA+Pj4+ICAgICNk
ZWZpbmUgWEVIUF9NVENGR19BRERSCQlYRV9SRUcoMHgxMDE4MDApDQo+ID4+Pj4gICAgI2RlZmlu
ZSBUSUxFX0NPVU5UCQlSRUdfR0VOTUFTSygxNSwgOCkNCj4gPj4+PiBAQCAtMjg2LDYgKzI4Nyw3
IEBAIGludCB4ZV9tbWlvX3Byb2JlX3ZyYW0oc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4+Pj4g
ICAgCQl9DQo+ID4+Pj4NCj4gPj4+PiAgICAJCWlvX3NpemUgLT0gbWluX3QodTY0LCB0aWxlX3Np
emUsIGlvX3NpemUpOw0KPiA+Pj4+ICsJCXhlX3N2bV9kZXZtX2FkZCh0aWxlLCAmdGlsZS0+bWVt
LnZyYW0pOw0KPiA+Pj4NCj4gPj4+IEkgdGhpbmsgc2xpZ2h0bHkgbW9yZSBhcHByb3ByaWF0ZSBj
YWxsIHNpdGUgZm9yIHRoaXMgbWlnaHQgYmUNCj4gPj4+IHhlX3RpbGVfaW5pdF9ub2FsbG9jKCks
IGFzIHRoYXQgZnVuY3Rpb24gc3RhdGVzIGl0IGlzIHByZXBhcmluZyB0aWxlDQo+ID4+PiBmb3Ig
VlJBTSBhbGxvY2F0aW9ucy4NCj4gPj4+IEFsc28sIEkgbWVudGlvbiBiZWNhdXNlIHdlIG1pZ2h0
IGxpa2UgdGhlIGZsZXhpYmxpdHkgaW4gZnV0dXJlIHRvIGNhbGwNCj4gPj4+IHRoaXMgb25jZSBm
b3IgeGVfZGV2aWNlLm1lbS52cmFtLCBpbnN0ZWFkIG9mIGNhbGxpbmcgZm9yIGVhY2ggdGlsZSwN
Cj4gPj4+IGFuZCBlYXNpZXIgdG8gaGFuZGxlIHRoYXQgaW4geGVfdGlsZS5jIGluc3RlYWQgb2Yg
eGVfbW1pby5jLg0KPiA+Pg0KPiA+PiBHb29kIHBvaW50LiBXaWxsIGZvbGxvdy4NCj4gPg0KPiA+
IFNvcnJ5LCB3aXRoIG15IGNvbW1lbnQgYmVsb3csIGRvIHlvdSBzdGlsbCB3YW50IHRvIGNhbGwg
aXQgaW4geGVfdGlsZV9pbml0X25vYWxsb2M/DQo+ID4NCj4gPiBGb3IgVU1BLCB3ZSBvbmx5IG5l
ZWQgdG8gY2FsbCBpdCBvbmNlLiBJZiB5b3UgZG8gaXQgaW4gaW5pdC1ub2FsbG9jLCB5b3Ugd291
bGQgY2FsbA0KPiBpdCBtdWx0aXBsZSB0aW1lcy4gUmlnaHQ/DQo+ID4NCj4gPiBPYWsNCj4gPg0K
PiANCj4gT2gsIEkgaG9wZWQgeW91IHdlcmUgc3RpbGwgZ29pbmcgdG8gbW92ZSBpdC4NCj4gSSBw
cmVmZXIgaXQgaW4geGVfdGlsZS5jIGluc3RlYWQgb2YgaGVyZS4gIEJ1dCBmZWVsIGZyZWUgdG8g
YXNrDQo+IG1haW50YWluZXJzIGFib3V0IGl0Lg0KPiBJIHRoaW5rIHRoZSBVTUEgd291bGQgYW55
d2F5IGFkZCBjb25kaXRpb25hbCB0byBkaXNhYmxlIHRoZXNlIGNhbGxzDQo+IHdoZXJldmVyIHRo
ZXkgYXJlIHBsYWNlZCwgaW4gZmF2b3Igb2YgY2FsbGluZyBhZ2FpbnN0IHhlX2RldmljZS5tZW0u
dnJhbS4NCj4gQnV0IHRoaXMgaXMgcHJldHR5IG1pbm9yIGFuZCBjYW4gcmV2aXNpdCBsYXRlciB0
b28uDQoNCkxldCBtZSBtb3ZlIHRvIHhlX3RpbGUuYyB0aGVuLi4uIHdlIGNhbiBtYWtlIHdoYXRl
dmVyIGNoYW5nZSB3aGVuIFVNQSBpcyBzZXR0bGVkIGRvd24uDQoNCj4gDQo+IEkgY29tbWVudGVk
IGRvd24gYmVsb3csIHRvIGtlZXAgdG8gb25lIGVtYWlsLg0KPiANCj4gPj4+DQo+ID4+PiBSZWxh
dGVkIGNvbW1lbnQgYmVsb3cuDQo+ID4+Pg0KPiA+Pj4NCj4gPj4+PiAgICAJfQ0KPiA+Pj4+DQo+
ID4+Pj4gICAgCXhlLT5tZW0udnJhbS5hY3R1YWxfcGh5c2ljYWxfc2l6ZSA9IHRvdGFsX3NpemU7
DQo+ID4+Pj4gQEAgLTM1NCwxMCArMzU2LDE2IEBAIHZvaWQgeGVfbW1pb19wcm9iZV90aWxlcyhz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPj4+PiAgICBzdGF0aWMgdm9pZCBtbWlvX2Zpbmkoc3Ry
dWN0IGRybV9kZXZpY2UgKmRybSwgdm9pZCAqYXJnKQ0KPiA+Pj4+ICAgIHsNCj4gPj4+PiAgICAJ
c3RydWN0IHhlX2RldmljZSAqeGUgPSBhcmc7DQo+ID4+Pj4gKyAgICBzdHJ1Y3QgeGVfdGlsZSAq
dGlsZTsNCj4gPj4+PiArICAgIHU4IGlkOw0KPiA+Pj4+DQo+ID4+Pj4gICAgCXBjaV9pb3VubWFw
KHRvX3BjaV9kZXYoeGUtPmRybS5kZXYpLCB4ZS0+bW1pby5yZWdzKTsNCj4gPj4+PiAgICAJaWYg
KHhlLT5tZW0udnJhbS5tYXBwaW5nKQ0KPiA+Pj4+ICAgIAkJaW91bm1hcCh4ZS0+bWVtLnZyYW0u
bWFwcGluZyk7DQo+ID4+Pj4gKw0KPiA+Pj4+ICsJZm9yX2VhY2hfdGlsZSh0aWxlLCB4ZSwgaWQp
DQo+ID4+Pj4gKwkJeGVfc3ZtX2Rldm1fcmVtb3ZlKHhlLCAmdGlsZS0+bWVtLnZyYW0pOw0KPiA+
Pj4+ICsNCj4gPj4+PiAgICB9DQo+ID4+Pj4NCj4gWy4uLl0NCj4gPj4+IGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3N2bV9kZXZtZW0uYw0KPiA+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4+
Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi42M2I3YTE5NjFjYzYNCj4gPj4+PiAtLS0gL2Rldi9udWxs
DQo+ID4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N2bV9kZXZtZW0uYw0KPiA+Pj4+
IEBAIC0wLDAgKzEsOTEgQEANCj4gPj4+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1J
VA0KPiA+Pj4+ICsvKg0KPiA+Pj4+ICsgKiBDb3B5cmlnaHQgwqkgMjAyMyBJbnRlbCBDb3Jwb3Jh
dGlvbg0KPiA+Pj4+ICsgKi8NCj4gPj4+PiArDQo+ID4+Pj4gKyNpbmNsdWRlIDxsaW51eC9tbV90
eXBlcy5oPg0KPiA+Pj4+ICsjaW5jbHVkZSA8bGludXgvc2NoZWQvbW0uaD4NCj4gPj4+PiArDQo+
ID4+Pj4gKyNpbmNsdWRlICJ4ZV9kZXZpY2VfdHlwZXMuaCINCj4gPj4+PiArI2luY2x1ZGUgInhl
X3RyYWNlLmgiDQo+ID4+Pj4gKyNpbmNsdWRlICJ4ZV9zdm0uaCINCj4gPj4+PiArDQo+ID4+Pj4g
Kw0KPiA+Pj4+ICtzdGF0aWMgdm1fZmF1bHRfdCB4ZV9kZXZtX21pZ3JhdGVfdG9fcmFtKHN0cnVj
dCB2bV9mYXVsdCAqdm1mKQ0KPiA+Pj4+ICt7DQo+ID4+Pj4gKwlyZXR1cm4gMDsNCj4gPj4+PiAr
fQ0KPiA+Pj4+ICsNCj4gPj4+PiArc3RhdGljIHZvaWQgeGVfZGV2bV9wYWdlX2ZyZWUoc3RydWN0
IHBhZ2UgKnBhZ2UpDQo+ID4+Pj4gK3sNCj4gPj4+PiArfQ0KPiA+Pj4+ICsNCj4gPj4+PiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBkZXZfcGFnZW1hcF9vcHMgeGVfZGV2bV9wYWdlbWFwX29wcyA9IHsN
Cj4gPj4+PiArCS5wYWdlX2ZyZWUgPSB4ZV9kZXZtX3BhZ2VfZnJlZSwNCj4gPj4+PiArCS5taWdy
YXRlX3RvX3JhbSA9IHhlX2Rldm1fbWlncmF0ZV90b19yYW0sDQo+ID4+Pj4gK307DQo+ID4+Pj4g
Kw0KPiA+Pj4+ICsvKioNCj4gPj4+PiArICogeGVfc3ZtX2Rldm1fYWRkOiBSZW1hcCBhbmQgcHJv
dmlkZSBtZW1tYXAgYmFja2luZyBmb3IgZGV2aWNlDQo+ID4+PiBtZW1vcnkNCj4gPj4+DQo+ID4+
PiBEbyB3ZSByZWFsbHkgbmVlZCAnc3ZtJyBpbiBmdW5jdGlvbiBuYW1lPw0KPiA+Pg0KPiA+PiBH
b29kIHBvaW50LiBJIHdpbGwgcmVtb3ZlIHN2bS4NCj4gPj4+DQo+ID4+Pj4gKyAqIEB0aWxlOiB0
aWxlIHRoYXQgdGhlIG1lbW9yeSByZWdpb24gYmxvbmdzIHRvDQo+ID4+Pg0KPiA+Pj4gV2UgbWln
aHQgbGlrZSBmbGV4aWJpbGl0eSBpbiBmdXR1cmUgdG8gY2FsbCB0aGlzIG9uY2UgZm9yDQo+ID4+
PiB4ZV9kZXZpY2UubWVtLnZyYW0sIGluc3RlYWQgb2YgY2FsbGluZyBmb3IgZWFjaCB0aWxlLg0K
PiA+Pj4gU28gY2FuIHdlIHJlbW92ZSB0aGUgdGlsZSBhcmd1bWVudCwgYW5kIGp1c3QgcGFzcyB0
aGUgeGVfZGV2aWNlIHBvaW50ZXINCj4gPj4+IGFuZCB0aWxlLT5pZCA/DQo+ID4+DQo+ID4+IFRo
aXMgaXMgaW50ZXJlc3RpbmcuDQo+ID4+DQo+ID4+IEZpcnN0IG9mIGFsbCwgSSBwcm9ncmFtbWVk
IHdyb25nIGJlbG93OiBtci0+cGFnZW1hcC5vd25lciA9IHRpbGUtPnhlLQ0KPiA+Pj4gZHJtLmRl
djsNCj4gPj4NCj4gPj4gVGhpcyBzaG91bGQgYmU6IG1yLT5wYWdlbWFwLm93bmVyID0gdGlsZSBm
b3IgTlVNQSB2cmFtIHN5c3RlbQ0KPiBPaCwgb2theS4gIEdsYWQgd2UgY2F1Z2h0IHRoYXQuDQo+
IA0KPiBTdGlsbCwgd291bGRuJ3QgdXNpbmcgJ21yJyBwb2ludGVyIGFzIHRoZSBvd25lciBiZSBz
dWZmaWNpZW50IGFuZCB0aGVuDQo+IGlzIGNvbW1vbiBmb3IgYm90aCBjYXNlcz8NCj4gQXZvaWRp
bmcgdGhlIHN0cm9uZyBhc3NvY2lhdGlvbiB3aXRoICd0aWxlJyBpcyBuaWNlIGlmIHBvc3NpYmxl
Lg0KPiANCj4gQnV0IEkgaGF2ZW4ndCBzdHVkaWVkIHJlc3Qgb2YgY29kZSBhbmQgaG93IHBhZ2Vt
YXAub3duZXIgaXMgdXNlZCwgc28NCj4gbWF5YmUgeW91IGFjdHVhbGx5IG5lZWQgdGhlIHRpbGUg
cG9pbnRlciBmb3Igc29tZXRoaW5nLg0KDQptciBpcyBtb3JlIHVuaWZpZWQuIEJ1dCB3aGVuIEkg
bG9va2VkIGZ1cnRoZXIsIGZvciBub3cgd2Ugc3RpbGwgbmVlZCB0byBzZXQgdGhlIG93bmVyIHRv
IGRldi4gU28gSSB0YWtlIGJhY2sgdGhlIGNvbW1lbnQgb2Ygc2V0dGluZyBvd25lciB0byB0aWxl
LiANCg0KVGhlIHJlYXNvbiBpcywgd2UgYWxzbyBuZWVkIHRvIHNldCBvd25lciBjYWxsaW5nIGht
bV9yYW5nZV9mYXVsdCwgc2VlIHBhdGNoIDUuIEF0IHBhdGNoIDUsIHdlIGRvbid0IGhhdmUgdGhl
IG1yIGFuZCB0aWxlLCB3ZSBvbmx5IGhhdmUgdm1hIGFuZCB2bS4gQW5kIGZyb20gdm0gd2UgY2Fu
IG9ubHkgZ2V0IGRldiwgbm90IHRpbGUgYW5kIG1yLi4uDQoNCkl0IGxvb2tzIGxpa2UgdGhlIHhl
X3ZtIGlzIGRlc2lnbmVkIHBlciBkZXZpY2UsIG5vdCBwZXIgdGlsZS4gSSB3b3VsZG4ndCBjaGFu
Z2UgdGhpcyBwZXJzcGVjdGl2ZSBpbiB0aGlzIHNlcmllcy4gTWFraW5nIHZtIHBlciB0aWxlIGlz
IGRvYWJsZS4gQnV0IHRoZSBtYWluIHB1cnBvc2Ugb2YgdGhpcyBzZXJpZXMgaXMgdG8gcHJvb2Yg
dGhlIHN5c3RlbSBhbGxvY2F0b3IgY29uY2VwdCBvbiBwdmMgYW5kIHBvc2l0aW9uIGl0IGZvciBu
ZXcgcGxhdGZvcm0gd2hpY2ggbWlnaHQgaGF2ZSB1bWEgYXJjaGl0ZWN0dXJlIGIvdCB0aWxlcy4g
U28gb3B0aW1pemF0aW9uIHN1Y2ggYXMgbWlncmF0aW9uIGIvdCB0aWxlcyBpcyBsb3cgcHJpb3Jp
dHkuDQoNClNvIGZvciBub3csIGxldHMgc3RpbGwgZ28gYmFjayB0byBkZXYgZm9yIHRoZSBvd25l
ci4NCg0KT2FrDQoNCj4gDQo+IFdlbGwsIHRoaXMgYWxzbyBzZWVtcyBsaWtlIHNvbWV0aGluZyBt
aW5vciBhbmQgY291bGQgYmUgcmV2aXNpdGVkIGxhdGVyLg0KPiANCj4gLUJyaWFuDQo+IA0KPiAN
Cj4gPj4NCj4gPj4gRm9yIFVNQSB2cmFtLCB0aGlzIHNob3VsZCBiZTogbXItPnBhZ2VtYXAub3du
ZXIgPSB0aWxlX3RvX3hlKHRpbGUpOw0KPiA+Pg0KPiA+PiBUaGlzIG93bmVyIGlzIGltcG9ydGFu
dC4gSXQgaXMgdXNlZCBsYXRlciB0byBkZWNpZGUgbWlncmF0aW9uIGJ5IGhtbS4gV2UgbmVlZA0K
PiB0bw0KPiA+PiBzZXQgdGhlIG93bmVyIGZvciBobW0gdG8gaWRlbnRpZnkgZGlmZmVyZW50IHZy
YW0gcmVnaW9uLg0KPiA+Pg0KPiA+PiBCYXNlZCBvbiBhYm92ZSwgSSB0aGluayB0aGUgdGlsZSBw
YXJhbWV0ZXIgaXMgYmV0dGVyLiBGb3IgVU1BLCBjYWxsZXIgbmVlZCB0bw0KPiA+PiBtYWtlIHN1
cmUgY2FsbCBpdCBvbmNlLCBhbnkgdGlsZSBwb2ludGVyIHNob3VsZCB3b3JrLiBUaGlzIGRvZXMg
c291bmQgYSBsaXR0bGUNCj4gd2VpcmQuDQo+ID4+IEJ1dCBJIGRvbuKAmXQgaGF2ZSBhIGJldHRl
ciBpZGVhLg0KPiA+Pg0KPiA+PiBPYWsNCj4gPj4+DQo+ID4+Pg0KPiA+Pj4+ICsgKiBAbXI6IG1l
bW9yeSByZWdpb24gdG8gcmVtYXANCj4gPj4+PiArICoNCj4gPj4+PiArICogVGhpcyByZW1hcCBk
ZXZpY2UgbWVtb3J5IHRvIGhvc3QgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSBhbmQgY3JlYXRlDQo+
ID4+Pj4gKyAqIHN0cnVjdCBwYWdlIHRvIGJhY2sgZGV2aWNlIG1lbW9yeQ0KPiA+Pj4+ICsgKg0K
PiA+Pj4+ICsgKiBSZXR1cm46IDAgb24gc3VjY2VzcyBzdGFuZGFyZCBlcnJvciBjb2RlIG90aGVy
d2lzZQ0KPiA+Pj4+ICsgKi8NCj4gPj4+PiAraW50IHhlX3N2bV9kZXZtX2FkZChzdHJ1Y3QgeGVf
dGlsZSAqdGlsZSwgc3RydWN0IHhlX21lbV9yZWdpb24gKm1yKQ0KPiA+Pj4+ICt7DQo+ID4+Pj4g
KwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmdG9fcGNpX2Rldih0aWxlLT54ZS0+ZHJtLmRldiktPmRl
djsNCj4gPj4+PiArCXN0cnVjdCByZXNvdXJjZSAqcmVzOw0KPiA+Pj4+ICsJdm9pZCAqYWRkcjsN
Cj4gPj4+PiArCWludCByZXQ7DQo+ID4+Pj4gKw0KPiA+Pj4+ICsJcmVzID0gZGV2bV9yZXF1ZXN0
X2ZyZWVfbWVtX3JlZ2lvbihkZXYsICZpb21lbV9yZXNvdXJjZSwNCj4gPj4+PiArCQkJCQkgICBt
ci0+dXNhYmxlX3NpemUpOw0KPiA+Pj4+ICsJaWYgKElTX0VSUihyZXMpKSB7DQo+ID4+Pj4gKwkJ
cmV0ID0gUFRSX0VSUihyZXMpOw0KPiA+Pj4+ICsJCXJldHVybiByZXQ7DQo+ID4+Pj4gKwl9DQo+
ID4+Pj4gKw0KPiA+Pj4+ICsJbXItPnBhZ2VtYXAudHlwZSA9IE1FTU9SWV9ERVZJQ0VfUFJJVkFU
RTsNCj4gPj4+PiArCW1yLT5wYWdlbWFwLnJhbmdlLnN0YXJ0ID0gcmVzLT5zdGFydDsNCj4gPj4+
PiArCW1yLT5wYWdlbWFwLnJhbmdlLmVuZCA9IHJlcy0+ZW5kOw0KPiA+Pj4+ICsJbXItPnBhZ2Vt
YXAubnJfcmFuZ2UgPSAxOw0KPiA+Pj4+ICsJbXItPnBhZ2VtYXAub3BzID0gJnhlX2Rldm1fcGFn
ZW1hcF9vcHM7DQo+ID4+Pj4gKwltci0+cGFnZW1hcC5vd25lciA9IHRpbGUtPnhlLT5kcm0uZGV2
Ow0KPiA+Pj4+ICsJYWRkciA9IGRldm1fbWVtcmVtYXBfcGFnZXMoZGV2LCAmbXItPnBhZ2VtYXAp
Ow0KPiA+Pj4+ICsJaWYgKElTX0VSUihhZGRyKSkgew0KPiA+Pj4+ICsJCWRldm1fcmVsZWFzZV9t
ZW1fcmVnaW9uKGRldiwgcmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShyZXMpKTsNCj4gPj4+PiAr
CQlyZXQgPSBQVFJfRVJSKGFkZHIpOw0KPiA+Pj4+ICsJCWRybV9lcnIoJnRpbGUtPnhlLT5kcm0s
ICJGYWlsZWQgdG8gcmVtYXAgdGlsZSAlZCBtZW1vcnksDQo+ID4+PiBlcnJubyAlZFxuIiwNCj4g
Pj4+PiArCQkJCXRpbGUtPmlkLCByZXQpOw0KPiA+Pj4+ICsJCXJldHVybiByZXQ7DQo+ID4+Pj4g
Kwl9DQo+ID4+Pj4gKwltci0+aHBhX2Jhc2UgPSByZXMtPnN0YXJ0Ow0KPiA+Pj4+ICsNCj4gPj4+
PiArCWRybV9pbmZvKCZ0aWxlLT54ZS0+ZHJtLCAiQWRkZWQgdGlsZSAlZCBtZW1vcnkgWyVsbHgt
JWxseF0gdG8gZGV2bSwNCj4gPj4+IHJlbWFwcGVkIHRvICVwclxuIiwNCj4gPj4+PiArCQkJdGls
ZS0+aWQsIG1yLT5pb19zdGFydCwgbXItPmlvX3N0YXJ0ICsgbXItPnVzYWJsZV9zaXplLA0KPiA+
Pj4gcmVzKTsNCj4gPj4+PiArCXJldHVybiAwOw0KPiA+Pj4+ICt9DQo+ID4+Pj4gKw0KPiA+Pj4+
ICsvKioNCj4gPj4+PiArICogeGVfc3ZtX2Rldm1fcmVtb3ZlOiBVbm1hcCBkZXZpY2UgbWVtb3J5
IGFuZCBmcmVlIHJlc291cmNlcw0KPiA+Pj4+ICsgKiBAeGU6IHhlIGRldmljZQ0KPiA+Pj4+ICsg
KiBAbXI6IG1lbW9yeSByZWdpb24gdG8gcmVtb3ZlDQo+ID4+Pj4gKyAqLw0KPiA+Pj4+ICt2b2lk
IHhlX3N2bV9kZXZtX3JlbW92ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0DQo+IHhlX21l
bV9yZWdpb24NCj4gPj4+ICptcikNCj4gPj4+PiArew0KPiA+Pj4+ICsJLypGSVhNRTogYmVsb3cg
Y2F1c2UgYSBrZXJuZWwgaGFuZ2UgZHVyaW5nIG1vZHVlbCByZW1vdmUqLw0KPiA+Pj4+ICsjaWYg
MA0KPiA+Pj4+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnRvX3BjaV9kZXYoeGUtPmRybS5kZXYp
LT5kZXY7DQo+ID4+Pj4gKw0KPiA+Pj4+ICsJaWYgKG1yLT5ocGFfYmFzZSkgew0KPiA+Pj4+ICsJ
CWRldm1fbWVtdW5tYXBfcGFnZXMoZGV2LCAmbXItPnBhZ2VtYXApOw0KPiA+Pj4+ICsJCWRldm1f
cmVsZWFzZV9tZW1fcmVnaW9uKGRldiwgbXItPnBhZ2VtYXAucmFuZ2Uuc3RhcnQsDQo+ID4+Pj4g
KwkJCW1yLT5wYWdlbWFwLnJhbmdlLmVuZCAtIG1yLT5wYWdlbWFwLnJhbmdlLnN0YXJ0ICsxKTsN
Cj4gPj4+PiArCX0NCj4gPj4+PiArI2VuZGlmDQo+ID4+Pj4gK30NCj4gPj4+PiArDQo=
