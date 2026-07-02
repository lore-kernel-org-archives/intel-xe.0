Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA473C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 16:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CBC10E4EB;
	Thu,  2 Jul 2026 16:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ByeNwyKT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B75310E4EB
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 16:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783009307; x=1814545307;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ihTC3abLMT7QAUW/jPIz3Z+RXVP2YyxVgU5UfrAC0Gk=;
 b=ByeNwyKTarkn9+DVrW/VH3Ye4eZKNFAZHXJmCRL1TJ2pNYbtl3Sw3NsI
 LNSbuv4MfQwA+anLD8CnbD9Ys8a54BKFqT0+ybPqq1NS6Qj5RlJ2TWu2k
 1pazZF76XUIbSjH25Rz37dwWcMcbuKR0D3JwRmE+5xRhZjgrGou/byKAV
 M/m161WAQWgWST/UqYp8lrMtFU4kqUTkAB5Zvwg8cnOeImkR8Gy8IhF+J
 bqCt9dp1F6+QwMKvhEXsbLRalfC+ZoTPtWuD8qdipC0955iIXbVCOfyRn
 2v7peEChbF8Lne6QVAZZnA57orPv9qV6mpbnb30u38kbnse6GRZY8piLI A==;
X-CSE-ConnectionGUID: 1+pVgA9hTbSuMUWnaebUyA==
X-CSE-MsgGUID: hbNfAKLJRS6Zu1wJn1OGuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83545845"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="83545845"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 09:21:45 -0700
X-CSE-ConnectionGUID: zf+cNcFJRA+F8ZbW1s50fA==
X-CSE-MsgGUID: 0URjME0XSSG6W3DYlPzmgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="256801067"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 09:21:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 09:21:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 2 Jul 2026 09:21:44 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 09:21:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQSby2n8IdIjaxv8MfgPjd+11qxVK3Z48XgYtFGSry4gnvhNKAkDLUx15r4Onqxa7ez7olcLEV6ygflOcD4BWbj5Vh8m2GzvBvkJfkhN2716BM7vFSVRqDhume7+O5A5Iq3IVtp5Ea1mzbDdbYcaI9m1NoZ7+aPWd7et/HzbZDcdKUbss9D/TlMcC7Fadp3NYoLqf3ljDpIktJPIEBHi2XI81wVh2zBZ9Y2Sl2kuJcgrd6x4x7imni0ghoLH5wOu6J36R1If3mNrUjtPZSl4EOFtV3IsF7xao8v94wLdp9Q/BBihiMBNSKFWQZCcmqSsNbEk+9r09KapG8QjPHJtqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihTC3abLMT7QAUW/jPIz3Z+RXVP2YyxVgU5UfrAC0Gk=;
 b=ULCUoVZqYay5e4jNOdLpQjn0TT1kwMBhAai+ntFCJPf5Iv3GjR0HnUb/WKT/PZSIyI1QQBG1vzWZQ/RSQeqKUe4tiXHt9C+fb4sMJyVZMNJxJ/CCIy4ZvZxZRKChsZ+LkTQUAfZF5tt9vTnGj9iELonfltBwP5KSkBTnQqRBtqPeSSPTk5xiNyXDUsddVIdbEInCvv5HsJ6ZDUjY34zPGrzCCw1SkT19rU/V7bDHjhYVF+ho2PVJaNR5VH7u2RHurD6BcE7t/ScgD0tjO+vO0U3VJQbBamPhRyDqu7xhW48ENn41NRdCeW2F4FkOfKcdQ1a4XjwuYfflp6TBRH3X3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18)
 by PH7PR11MB7479.namprd11.prod.outlook.com (2603:10b6:510:27f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 16:21:41 +0000
Received: from BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5]) by BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5%5]) with mapi id 15.21.0159.013; Thu, 2 Jul 2026
 16:21:41 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>, "Luse, Paul E"
 <paul.e.luse@intel.com>, "V, Mohamed Mansoor" <mohamed.mansoor.v@intel.com>,
 "Nasim, Kam" <kam.nasim@intel.com>
Subject: RE: [PATCH v3] drm/xe/sysctrl: Add helper to query application status
Thread-Topic: [PATCH v3] drm/xe/sysctrl: Add helper to query application status
Thread-Index: AQHdCic9Rx9M+E/w9UmCQyZRyDsRyrZaWnHQ
Date: Thu, 2 Jul 2026 16:21:41 +0000
Message-ID: <BN9PR11MB524277EB567B5CA2F735382D95F52@BN9PR11MB5242.namprd11.prod.outlook.com>
References: <20260702133201.2164749-2-anoop.c.vijay@intel.com>
In-Reply-To: <20260702133201.2164749-2-anoop.c.vijay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5242:EE_|PH7PR11MB7479:EE_
x-ms-office365-filtering-correlation-id: 77518bda-4ece-4592-e72f-08ded8560002
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|3023799007|56012099006|11063799006|22082099003|18002099003|6133799003|38070700021;
x-microsoft-antispam-message-info: ZTMjSM3RXjd8Du+9u/i8HImKIBsMKFpmQ34tmfIS0qKtVT7zzfgvYdxs1RiFxX5COJoyeFQLb8gHVyB/mSbRmFm6IGsJ8X7hxgP0suDW5OZ6CAggPL69gmb3yarpbTKHJQcxEG5kNEsbK8xG/z6oVoy6j+ZuNZ7hUb5i4V/oNjMqvqKDX2pU2pYON2LRCm5mEJF7daCaaeD/9khE9BnAFPWUYlZKGfjay4RsYRYi49yd1M13I0N760vfXnOv9eP+H0yWnoB9YBmzRqBIzjVcqNqA5D2MPKWcuv5HLOiiRC+kSIGQgeBGBP1Ma8zmFB6fIOWdsf/5No3nrlgG3hcBZDVDxCSesgON8hJyI63zedgOl5EJLPyMct3dSK4POfIGmHor4QSs+tl7tBhHc7yxJE+jTmcc0bVgna3X8qQk8NmPbgdIBZw3nPbXRVOjX/n58e6sFBsRVjUN1n5WFv0593waCCIv698He5eC3/Add8h6CuFpZAfInJexn2d3Jp7O/rdUYej3mNT9azTwMWzRWdIrRUvsYsFS1vsLZ2drL/KOgIutUID/sL1/tDE0l/3BCWj10ZuTn+pojTq5VLFfnrHxQER94RBKrbQvb4Zab0bI8tgLaVfECeZsVs85HiR6jyqqRWn/4ESbjqTNTGOwKROMJE4VSLJ+sjln8zyHuv5mHqOZNnln0UOfa3yc0fxYXszQQDnbunNjkUuFEYPbxHTRKVTH2IhEEXqwBQVzxQE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5242.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(3023799007)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkJhR0IxaEpsYjNMektQQS8zS3lVc05MVjFQT1Zmekp2SEw4NHExL3U2dmZE?=
 =?utf-8?B?WmZOSkY0bmNrRU9jVHI3emxlL09pUk5jdXVpRkdJVDY2QU9qRjV3ejhkYnRa?=
 =?utf-8?B?QkdyZzlycGVFRWN2emR0STVnSm5MSzhXbHVGMUkrOW5wY3RTV3pVenBXdVB3?=
 =?utf-8?B?NWxSOURCWk9EaWU2eWN5MHNJeHYxeWo5QTk2SlEyd3l3ZnlCendtZERqMzhJ?=
 =?utf-8?B?UjU1N1Eyam9HaSs3dVNmNldlRzFlVC9oZFo4Zkg0MVFhMzhaVG85YzZqWVdv?=
 =?utf-8?B?ejFuQVl4RFVieEZ2aXorQTZsSHAxNzI3WVVDK1J3TlBNNGp3ek1tZFVSZFZC?=
 =?utf-8?B?WlpIQzhmT0RnZXlmN1hhOEpYejVNMXRhZTkyNEJPNzFBWDJCWVVzVlNSSVVI?=
 =?utf-8?B?b0k0K2IzaFZCUzhZa1RoU2w2Y0ZTSmozcTNweWtQNFFuKzJvNkRYNnBWZ0U1?=
 =?utf-8?B?cWg2RUpJTFM0Y3l3UDgwRUVPb3J6RVIrTDdFeStIakk5SXZDeHlrWEZSa3ls?=
 =?utf-8?B?b3FEN0NDbFFaQU9jK1N1Q1NNYlRuWnZZbG5zZTdleG8rU2FhOHVYTFVxenVT?=
 =?utf-8?B?S0xULzg0UXcwMDUvUGJucGlwTDBhaTRNT0ZsbklPd1RZUnpyalhYVWhJWHB1?=
 =?utf-8?B?Z1hXVUQyWitqVUxWSHM1NHdITXZtU0phKzhWS3RxcW0xZDdUYkx6aVdFZnJs?=
 =?utf-8?B?VlFjRjRhUVNvd2lrenZ4NzZtKzdzcDI2VitoY1NIZGJPU2JmUnN0NXA0TzUx?=
 =?utf-8?B?TUFTWU11b2owZ3FDeHNZMXkxRUp4b1FSNTVtOVhXaCtGd2o2SCtMWWJIcFJU?=
 =?utf-8?B?UWMrSHErM3VWSC9yQ3NycFA4Tm80K3JMbFFERUpKcDVjMUlrUGxPYnpZckN3?=
 =?utf-8?B?TWwxaFVHWUVHV0hEeHpmam03SzRVUEN5UzhFSkdaelR1aWI0OTI3UDVuWEpv?=
 =?utf-8?B?OTJIbk50UzhzRVhYQVFIQ3JuM00rME5SaVJpWGFMN0dpWVFzNjBWVmdSRTg3?=
 =?utf-8?B?S1FaQXBhRE50UzFydlNYVnNZVjMxcFhEbkwzK0RTQ1B4MjN3Y3hJS21udVVS?=
 =?utf-8?B?V0FtOGtmeGFoUU5iTGhDWkhIOG1KRHJQNmtBTUxNN1lpbXNkTG9JL1ZSK3Ir?=
 =?utf-8?B?QlVDS0I5Z1NUMVR4SU8yL1VVbXlid09PSWFjQWpwTXhFejJQOTk2cHdJNUVC?=
 =?utf-8?B?a3p0eDZnZUZVVEhLMU5FVkczVEF2MldDVmVGTTRvajc5Y1ZrSjBFMXN1TE93?=
 =?utf-8?B?WGpZSHBISjh1aDVLdGxibnMyUWJYQ3BTSTZrQkJFaysvL1NNZTB5dXBhcjlr?=
 =?utf-8?B?bWJCRlJJYktIenVqZm1FcWIrNk1CdTBTZ3NWVFU2Q0pSV2wyYTc2VGVqalEw?=
 =?utf-8?B?UWtUcGZCTXVHSjRSYTNxd2p2bjl2NGZUeTQ1R0pvdWZZV2VrYkJSbWV0N2pQ?=
 =?utf-8?B?Sm41azRuTGZCd2dCcG0wVFJiMVM0d3FJOWxSRS91WWxwQUExWkt2WGlCaHQ1?=
 =?utf-8?B?cWRkTUU2K2gzTEx1YjdHZnNUQXZtbXNSYzIzSTFmYVJENXZUc3ZwYXVWZG4r?=
 =?utf-8?B?V0RUMk54anBUcVBxNnYwL2pwOHZuNWVpTStRa3NhMVcvQ0h2dEtzU3Vyc09s?=
 =?utf-8?B?Tmw2YlBNVFZrMTgwNmtoSnk1YW5TMjVZZUJkUmFWN2g3UjlDTTFGMUhSTERB?=
 =?utf-8?B?YXM0V293SjdXVXNQOHRrUkgrSVZYVCtUWDFLYVJTUFB1Qy9ESnBIQlhxZXM3?=
 =?utf-8?B?cC9rWFBQVVJ6OEpjWFAvMjBldUV2N2htYmFhVTI4cHBFalMvSi90UndhWjVI?=
 =?utf-8?B?VklENXhiU3F6MC80L0ljZW8zZy9kaU1ob1Q4dGtwTlA3VUNJZitTMy94OC9r?=
 =?utf-8?B?enFvOUxseXd3UWQ1KzNZQXg5RGd3dVdjcXFkazRJN1QxQmZmd2lmNTh5V3lU?=
 =?utf-8?B?VDIvYWZxL2RxaGxlMWc3MGIrc2JaUTcxOFgwVCtZWmFkdkFUelJVS3lCWTk1?=
 =?utf-8?B?eW5hZTh0TkhzSFA0b0FBSGhXVWJRZEFUdGNuN1g2SWg2Ly9scEJLUTZBaGcw?=
 =?utf-8?B?RWlOa3ZXczF6ckFzL3BjaUZrYXhMdXoxaExyUThmQU1RbDk4MmJRdnQ5d3Nj?=
 =?utf-8?B?bTlUZm9Qc3Mwdlc4V05jMGsxOEs0V0ZQMWlocDlyUFlPbXdIelRXWHNYSHlW?=
 =?utf-8?B?a0M1TmxDaENETldpS01iRHJYdS9aQXVYdndiMTB2emdYTG0wUmVUdXdSV3FP?=
 =?utf-8?B?djQzUmYvZmszNElUTDVXVHVCaTNCeUZ1L1prOXhVdkhKYllTRWZyUE9yK2VM?=
 =?utf-8?B?OG1GVmh1c0xRZ3c2bjBqYnBSNG1rNEI3SEJ1Q0RNajU2ZXlYMVAxZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HNBSt1w195TcI0k0wQBlnlZC+V0d7SQxY9weT1+6Xd9Q+r44dr3kd/l4mlbrVVn8BhJ3I3d7EBd8Vavr/wJG/ONeQkRNaL81FNRBZqT1B6Yvb3vzBRO56aGA13dzmgyNK6AIpV4pTNje2s97+tuiEr1U5cD+/l4z9r863d+If/8Cwc7Y/dr/f4cgh8OvwKBB0PChDe/xyNvrbRoExfYWA+wZf+Ban3W5a9cqvefWCExKEVxEjpaHlkn3PRMpfphuLJQlxj7ozEFOFkmjQ1EZTWbF7+34OpCSdq62zrFuvQk+sK7EKitkaLv2vSK2smdjo6FiWaExB7eM/2SMqcVREA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5242.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77518bda-4ece-4592-e72f-08ded8560002
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 16:21:41.1541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jvMq3hxGXpJiSGE/wCLNAZqR2i0XtPhKr4vE1XUjs+s+G6PYht1O61EQetsfdTLvtCyPASHzNUTX+V+gD5u4v5b/ICH7AK/W3BK5xVq8VRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7479
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

L3NuaXANCj4gKy8qKg0KPiArICogeGVfc3lzY3RybF9jaGVja19hcHBfc3RhdHVzKCkgLSBRdWVy
eSBsaWZlY3ljbGUgc3RhdGUgb2YgYSBTeXN0ZW0NCj4gK0NvbnRyb2xsZXIgYXBwbGljYXRpb24N
CklNTyB5b3UgZG9uJ3QgbmVlZCB0byBleHBvcnQgdGhpcyBBUEkuIEFzIHlvdSBhcmUgYWxyZWFk
eSBoYXZpbmcgQVBJIGV4cG9ydGVkIGZvciBib3RoIE9PQk1TTSBhbmQgRElBRyBmaXJtd2FyZSBz
ZXBhcmF0ZWx5Lg0KIE9uZSBtb3JlIGNvbW1lbnQgYmVsb3cuDQovc25pcA0KPiArLyoqDQo+ICsg
KiB4ZV9pc19kaWFnX2Z3X3JlYWR5KCkgLSBDaGVjayBpZiBkaWFnIGZpcm13YXJlIGlzIGZ1bGx5
IGluaXRpYWxpemVkDQo+ICsgKiBAeGU6IHhlIGRldmljZSBpbnN0YW5jZQ0KPiArICoNCj4gKyAq
IFJldHVybnMgdHJ1ZSBpZiBkaWFnIGZpcm13YXJlIGhhcyByZWFjaGVkIHRoZSBpbml0aWFsaXpl
ZCBzdGF0ZSwNCj4gK2luZGljYXRpbmcNCj4gKyAqIGl0IGlzIHJlYWR5IHRvIGhhbmRsZSByZXF1
ZXN0cy4gUmV0dXJucyB0cnVlIGFsc28gb24gcGxhdGZvcm1zDQo+ICt3aXRob3V0IFN5c3RlbQ0K
PiArICogQ29udHJvbGxlciBzdXBwb3J0LCBhcyB0aGVyZSBpcyBubyBmaXJtd2FyZSBnYXRlIHRv
IHdhaXQgb24uDQo+ICsgKg0KPiArICogUmV0dXJuOiB0cnVlIGlmIGRpYWcgaXMgaW5pdGlhbGl6
ZWQgb3Igc3lzY3RybCBpcyBub3QgcHJlc2VudCwgZmFsc2UNCj4gK290aGVyd2lzZSAgKi8gYm9v
bCB4ZV9pc19kaWFnX2Z3X3JlYWR5KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKSB7DQo+ICsJZW51bSB4
ZV9zeXNjdHJsX2Z3X3N0YXR1cyBzdGF0dXMgPQ0KPiArCQl4ZV9zeXNjdHJsX2NoZWNrX2FwcF9z
dGF0dXMoeGUsIFhFX1NZU0NUUkxfQVBQX0RJQUcpOw0KPiArDQo+ICsJcmV0dXJuIHN0YXR1cyA9
PSBYRV9TWVNDVFJMX0ZJUk1XQVJFX0FQUF9JTklUSUFMSVpFRCB8fA0KPiArCSAgICAgICBzdGF0
dXMgPT0gWEVfU1lTQ1RSTF9GSVJNV0FSRV9BUFBfTk9UU1VQUDsgfQ0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N5c2N0cmwuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9zeXNjdHJsLmggaW5kZXggMDkwZGZmYjZkNTVmLi43MzM3ZDlmN2MzYWUNCj4gMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJsLmgNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3N5c2N0cmwuaA0KPiBAQCAtOSw2ICs5LDcgQEANCj4gICNpbmNsdWRlIDxs
aW51eC9jb250YWluZXJfb2YuaD4NCj4gDQo+ICAjaW5jbHVkZSAieGVfZGV2aWNlX3R5cGVzLmgi
DQo+ICsjaW5jbHVkZSAieGVfc3lzY3RybF9tYWlsYm94X3R5cGVzLmgiDQo+ICAjaW5jbHVkZSAi
eGVfc3lzY3RybF90eXBlcy5oIg0KPiANCj4gIHN0YXRpYyBpbmxpbmUgc3RydWN0IHhlX2Rldmlj
ZSAqc2NfdG9feGUoc3RydWN0IHhlX3N5c2N0cmwgKnNjKSBAQCAtMjAsNSArMjEsOQ0KPiBAQCB2
b2lkIHhlX3N5c2N0cmxfZXZlbnQoc3RydWN0IHhlX3N5c2N0cmwgKnNjKTsgIGludCB4ZV9zeXNj
dHJsX2luaXQoc3RydWN0DQo+IHhlX2RldmljZSAqeGUpOyAgdm9pZCB4ZV9zeXNjdHJsX2lycV9o
YW5kbGVyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1MzINCj4gbWFzdGVyX2N0bCk7ICB2b2lkIHhl
X3N5c2N0cmxfcG1fcmVzdW1lKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4gK2VudW0geGVfc3lz
Y3RybF9md19zdGF0dXMNCj4gK3hlX3N5c2N0cmxfY2hlY2tfYXBwX3N0YXR1cyhzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSwgZW51bQ0KPiAreGVfc3lzY3RybF9hcHBfaWQgYXBwX2lkKTsgYm9vbCB4ZV9p
c19vb2Jtc21fZndfcmVhZHkoc3RydWN0IHhlX2RldmljZQ0KPiArKnhlKTsgYm9vbCB4ZV9pc19k
aWFnX2Z3X3JlYWR5KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4gDQo+ICAjZW5kaWYNCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJsX21haWxib3hfdHlwZXMuaA0K
PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJsX21haWxib3hfdHlwZXMuaA0KPiBpbmRl
eCA2ZTM3NTM1NTQ1MTAuLmViYWE0OGZjNjY3YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3N5c2N0cmxfbWFpbGJveF90eXBlcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9zeXNjdHJsX21haWxib3hfdHlwZXMuaA0KPiBAQCAtMTQsOSArMTQsMTEgQEANCj4g
ICAqIGVudW0geGVfc3lzY3RybF9ncm91cCAtIFN5c3RlbSBDb250cm9sbGVyIGNvbW1hbmQgZ3Jv
dXBzDQo+ICAgKg0KPiAgICogQFhFX1NZU0NUUkxfR1JPVVBfR0ZTUDogR0ZTUCBncm91cA0KPiAr
ICogQFhFX1NZU0NUUkxfR1JPVVBfQ09SRTogQ29yZSBncm91cA0KPiAgICovDQo+ICBlbnVtIHhl
X3N5c2N0cmxfZ3JvdXAgew0KPiAgCVhFX1NZU0NUUkxfR1JPVVBfR0ZTUAkJCT0gMHgwMSwNCj4g
KwlYRV9TWVNDVFJMX0dST1VQX0NPUkUgICAgICAgICAgICAgICAgICAgPSAweEZGLA0KPiAgfTsN
Cj4gDQo+ICAvKioNCj4gQEAgLTMyLDYgKzM0LDcxIEBAIGVudW0geGVfc3lzY3RybF9nZnNwX2Nt
ZCB7DQo+ICAJWEVfU1lTQ1RSTF9DTURfR0VUX1BFTkRJTkdfRVZFTlQJPSAweDA3LA0KPiAgfTsN
Cj4gDQo+ICsvKioNCj4gKyAqIGVudW0geGVfc3lzY3RybF9jb3JlX2NtZCAtIENvbW1hbmRzIHN1
cHBvcnRlZCBieSBDb3JlIGdyb3VwDQo+ICsgKg0KPiArICogQFhFX1NZU0NUUkxfQ01EX0dFVF9B
UFBfU1RBVFVTX0JZX0lEOiBSZXRyaWV2ZSBhcHBsaWNhdGlvbg0KPiBzdGF0dXMgYnkNCj4gK0lE
ICAqLyBlbnVtIHhlX3N5c2N0cmxfY29yZV9jbWQgew0KPiArCVhFX1NZU0NUUkxfQ01EX0dFVF9B
UFBfU1RBVFVTX0JZX0lECQk9IDB4MDUsDQo+ICt9Ow0KPiArDQo+ICsvKioNCj4gKyAqIHN0cnVj
dCB4ZV9zeXNjdHJsX2dldF9hcHBfc3RhdHVzX2J5X2lkX3JlcSAtIEdldCBhcHBsaWNhdGlvbiBz
dGF0dXMNCj4gK3JlcXVlc3QNCj4gKyAqDQo+ICsgKiBAYXBwX2lkOiBBcHBsaWNhdGlvbiBJRCBm
b3Igd2hpY2ggdG8gcmV0cmlldmUgc3RhdHVzICAqLyBzdHJ1Y3QNCj4gK3hlX3N5c2N0cmxfZ2V0
X2FwcF9zdGF0dXNfYnlfaWRfcmVxIHsNCj4gKwl1OCBhcHBfaWQ7DQo+ICt9IF9fcGFja2VkOw0K
PiArDQo+ICsvKioNCj4gKyAqIHN0cnVjdCB4ZV9zeXNjdHJsX2dldF9hcHBfc3RhdHVzX2J5X2lk
X3Jlc3AgLSBHZXQgYXBwbGljYXRpb24gc3RhdHVzDQo+ICtyZXNwb25zZQ0KPiArICogQGZsYWdz
OiBBcHBsaWNhdGlvbiBzdGF0dXMgZmxhZ3MgKHNlZSBYRV9TWVNDVFJMX0FQUF9SRVNQXyoNCj4g
K2RlZmluaXRpb25zKSAgKi8gc3RydWN0IHhlX3N5c2N0cmxfZ2V0X2FwcF9zdGF0dXNfYnlfaWRf
cmVzcCB7DQo+ICsJdTMyIGZsYWdzOw0KPiArfSBfX3BhY2tlZDsNCj4gKw0KPiArLyoqIFhFX1NZ
U0NUUkxfQVBQX1JFU1BfVkFMSUQgLSBhcHBfaWQgaXMgcmVjb2duaXplZCBieSBTeXN0ZW0NCj4g
Q29udHJvbGxlciBmaXJtd2FyZSAqLw0KPiArI2RlZmluZSBYRV9TWVNDVFJMX0FQUF9SRVNQX1ZB
TElECQlCSVQoMCkNCj4gKy8qKiBYRV9TWVNDVFJMX0FQUF9SRVNQX0JPT1RFRCAtIGFwcGxpY2F0
aW9uIGhhcyBjb21wbGV0ZWQgaXRzIGJvb3QNCj4gc2VxdWVuY2UgKi8NCj4gKyNkZWZpbmUgWEVf
U1lTQ1RSTF9BUFBfUkVTUF9CT09URUQJCUJJVCgxKQ0KPiArLyoqIFhFX1NZU0NUUkxfQVBQX1JF
U1BfSU5JVElBTElaRUQgLSBhcHBsaWNhdGlvbiBoYXMgY29tcGxldGVkIGFsbA0KPiBwb3N0LWJv
b3QgaW5pdGlhbGl6YXRpb24gKi8NCj4gKyNkZWZpbmUgWEVfU1lTQ1RSTF9BUFBfUkVTUF9JTklU
SUFMSVpFRAkJQklUKDIpDQo+ICsNCj4gKy8qKg0KPiArICogZW51bSB4ZV9zeXNjdHJsX2Z3X3N0
YXR1cyAtIFN5c3RlbSBDb250cm9sbGVyIGZpcm13YXJlIGFwcGxpY2F0aW9uDQo+ICtsaWZlY3lj
bGUgc3RhdGVzDQo+ICsgKg0KPiArICogQFhFX1NZU0NUUkxfRklSTVdBUkVfQVBQX0lOVkFMSUQ6
IGFwcF9pZCBpcyBub3QgcmVjb2duaXplZCBieQ0KPiArZmlybXdhcmUNCj4gKyAqIEBYRV9TWVND
VFJMX0ZJUk1XQVJFX0FQUF9OT1RfTE9BREVEOiBhcHBsaWNhdGlvbiBpcyBrbm93biBidXQNCj4g
aGFzDQo+ICtub3QgeWV0IGJvb3RlZA0KPiArICogQFhFX1NZU0NUUkxfRklSTVdBUkVfQVBQX0JP
T1RFRDogYm9vdCBzZXF1ZW5jZSBjb21wbGV0ZWQsDQo+IHBvc3QtYm9vdA0KPiAraW5pdCBwZW5k
aW5nDQo+ICsgKiBAWEVfU1lTQ1RSTF9GSVJNV0FSRV9BUFBfSU5JVElBTElaRUQ6IGFwcGxpY2F0
aW9uIGZ1bGx5DQo+IG9wZXJhdGlvbmFsDQo+ICsgKiBAWEVfU1lTQ1RSTF9GSVJNV0FSRV9BUFBf
Tk9UU1VQUDogU3lzdGVtIENvbnRyb2xsZXIgbm90DQo+IGF2YWlsYWJsZSBvbg0KPiArdGhpcyBk
ZXZpY2UNCj4gKyAqIEBYRV9TWVNDVFJMX0ZJUk1XQVJFX0NPTU1fRkFJTFVSRTogY29tbXVuaWNh
dGlvbiB3aXRoDQo+IFN5c3RlbQ0KPiArQ29udHJvbGxlciBmaXJtd2FyZSBmYWlsZWQgICovIGVu
dW0geGVfc3lzY3RybF9md19zdGF0dXMgew0KPiArCVhFX1NZU0NUUkxfRklSTVdBUkVfQVBQX0lO
VkFMSUQsDQo+ICsJWEVfU1lTQ1RSTF9GSVJNV0FSRV9BUFBfTk9UX0xPQURFRCwNCj4gKwlYRV9T
WVNDVFJMX0ZJUk1XQVJFX0FQUF9CT09URUQsDQo+ICsJWEVfU1lTQ1RSTF9GSVJNV0FSRV9BUFBf
SU5JVElBTElaRUQsDQo+ICsJWEVfU1lTQ1RSTF9GSVJNV0FSRV9BUFBfTk9UU1VQUCwNCj4gKwlY
RV9TWVNDVFJMX0ZJUk1XQVJFX0NPTU1fRkFJTFVSRSwNCj4gK307DQo+ICsNCj4gKy8qKg0KPiAr
ICogZW51bSB4ZV9zeXNjdHJsX2FwcF9pZCAtIEtub3duIFN5c3RlbSBDb250cm9sbGVyIGFwcGxp
Y2F0aW9uDQo+ICtpZGVudGlmaWVycw0KPiArICoNCj4gKyAqIEBYRV9TWVNDVFJMX0FQUF9HRlNQ
OiBHRlNQIGFwcGxpY2F0aW9uIChmaXJtd2FyZSBJRCAxMSkNCj4gKyAqIEBYRV9TWVNDVFJMX0FQ
UF9PQ09ERTogb0NvZGUgYXBwbGljYXRpb24gKGZpcm13YXJlIElEIDEyKQ0KPiArICogQFhFX1NZ
U0NUUkxfQVBQX0RJQUc6IGRpYWcgYXBwbGljYXRpb24gKGZpcm13YXJlIElEIDEzKSAgKi8gZW51
bQ0KPiAreGVfc3lzY3RybF9hcHBfaWQgew0KPiArCVhFX1NZU0NUUkxfQVBQX0dGU1AJPSAxMSwN
CkRvIHdlIG5lZWQgYWJvdmUgYXBwIGlkIGluIFhlS01EID8gRG8gWGVLTUQgaGFzIGFueSBidXNp
bmVzcyB0byBrbm93IHRoaXMgQXBwIGlkIHN0YXR1cyA/DQpJZiB0aGlzIGlzIHJlZHVuZGFudCwg
bXkgc3VnZ2VzdGlvbiB3aWxsIGJlIHRvIHJlbW92ZSBpdC4NClRoYW5rcywNCkFuc2h1bWFuDQo+
ICsJWEVfU1lTQ1RSTF9BUFBfT0NPREUJPSAxMiwNCj4gKwlYRV9TWVNDVFJMX0FQUF9ESUFHCT0g
MTMsDQo+ICt9Ow0KPiArDQo+ICAvKioNCj4gICAqIHN0cnVjdCB4ZV9zeXNjdHJsX21haWxib3hf
Y29tbWFuZCAtIFN5c3RlbSBDb250cm9sbGVyIG1haWxib3gNCj4gY29tbWFuZA0KPiAgICovDQo+
IC0tDQo+IDIuNDMuMA0KDQo=
