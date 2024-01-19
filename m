Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736DEC4725D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 03:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E4810E947;
	Fri, 19 Jan 2024 03:49:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E40710E947
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 03:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705636189; x=1737172189;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WKI0kMORI2SpdOrrIAWLupukanst9njTKOevwwECBgc=;
 b=Fq+o4P21AoljOoEqY88ORI/3NkLopNkwOB3yI2k+Ti0li+fjmFraltn8
 z++E/O6lREpC+SiJ7pStZbnFauTRFCizY045jJkIBCqkNBP3w6BQb5b/2
 1IXwSXXnta7kpzCoI3HcWW2peDGOS4DhG8Obm3lQkWloc5U7eWeZruQut
 +oXpWKb6xqnJy5rzAZ0qOONvqUi33zGvGpOylqSxonXaMR880/PbX2ovV
 qUOnYI1R6gTBy+kVm0t1T64VKMyu6ikdi80Am9ILYPufVvXHOakCwRr08
 5A83/VFJf2ICnqGmYUKLdquTvxkiqjyS9ISSdp/8vyW2Ea06L7/37rkFB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7409859"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="7409859"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 19:49:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="958021180"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="958021180"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 19:49:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 19:49:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 19:49:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 19:49:45 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 19:49:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fV3APkNM2v1dRCT17sSOsTk2Bem8ntsE6aK8FxXyATIdcXBpYSL+WreXEd5Q+hAdmseaGDNXGRlO4GqNCgGp0rwB2d0cBjNVi6nH5GVCVB8j2xINgiWIJ2Sl04b/JuAvXrszvxuTo1Y0kaIzLHmarB6yJqs5iB57hLtaHgTpIOn3QdhRzDLdPnLpqHjs/xsuAAue2Xvw4Q0i8iVuwUhndcJZ5bjzWm2TpwL/sqsgTMzKbqSA8T2H9yVlJr9taSmN/py8EPQT5ue1MEXUecELoGBKZdbZ92+n62F4dqer4vTTh8+Np7DYUCusCXzD9xGl3uZtrr2JlzYyxCQZmcJRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKI0kMORI2SpdOrrIAWLupukanst9njTKOevwwECBgc=;
 b=AHOlW0I5wBOEcqPwbsT2gFPOzG+NgjfuInl/tNZRTrT9UCVpwZNQakJzGqaaUNOCQuLzA7lrODAH3WphVpCJSIgAYfD7kMLCwLiOM2hi6VAJ/TzaJ0K03V3FzngLeSv0GB1cxsKuR0Gtr0IxfnOMcgokbV/dUE98l57siq2GZ7Yyxutx5duJmV88W8qaFQ5cpg2LNk8R2RLiqxftBbbKgnYOULlPZOp6/D1QfaEhI8dslJrEHBo/RvOJm4lsyEjaoxdhu3IhDzQ22zql12TRPUu1kYooTy5ONtTBAtMNA2FfvIj/W3if/uXRv83V3GvV26uGTOuQdebMPfIvyZKDuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 by DM4PR11MB6213.namprd11.prod.outlook.com (2603:10b6:8:ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 03:49:39 +0000
Received: from SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::9ea9:5000:eb1d:ca30]) by SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::9ea9:5000:eb1d:ca30%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 03:49:39 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3] drm/xe/xe2: Use XE_CACHE_WB pat index
Thread-Topic: [PATCH v3] drm/xe/xe2: Use XE_CACHE_WB pat index
Thread-Index: AQHaSHKqqtHrqw/Rsk2Qfk3tqfY0t7Dfv5qAgADEJqA=
Date: Fri, 19 Jan 2024 03:49:39 +0000
Message-ID: <SA1PR11MB70381376C0EFE485813CC26FB3702@SA1PR11MB7038.namprd11.prod.outlook.com>
References: <20240116120512.1542167-1-himal.prasad.ghimiray@intel.com>
 <3781d25196a6312bffd46e79a862f5b720533ba1.camel@linux.intel.com>
In-Reply-To: <3781d25196a6312bffd46e79a862f5b720533ba1.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB7038:EE_|DM4PR11MB6213:EE_
x-ms-office365-filtering-correlation-id: 8d144ab3-fdf0-44ba-c99e-08dc18a1a974
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SB39yfoEWLeN8DZ9f1iOFUcLMg8tOED7iDEUxBzXLvoPbL+xPQszxPbiTSc6q0iRXPMBORh1M6GhXCLU1KkTfulXbfua19STxw+tDjKeBtgQKbS9thvgp+thkrcDx/pAeIfnswjQPRZopxmL/Qr9OUscI94XCtpB297LU+zY0EzS6N7W9u6hVz6Kna3o2GZa1NUhK2Bh48VugJuvrrZM9VyRzfpbaBqU13J1z2bEkXBwKsPnas44ou7BAoGqNLNyQzvgmRPW6uxQencnbz0U21C9PcHzVN6bjftkW8XY2aDCsIYJxzYDCt9XobdHuRyG2tNFGKlxQ0PsBrg5UqrnebSPfUl69UIfteRLy1qxIWzOUOfvTVFiKly45ApWpxY6wIiF8B4uz/rYPp5J8yU5yQwLDVNB6zhA1RwPJrJVl5pcncdmydVANmspD31Ky716/7WwMZwfGwUrpo4PT4jNpZnxODzg/QLIKohX9gOOUAgWQFRX51WugP3jBSMfKKo/9fxM0B2JzFC2i0C681tuE49vXyJ1CQJYwdn9TQuI4gjdPw6OrnEi9UAQos7XBJghGL1PoWCXmnjbNy1ycI/tzLOoIi1D1OZyVsCyozcBeqQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7038.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(39860400002)(366004)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(55016003)(7696005)(6506007)(9686003)(26005)(53546011)(71200400001)(66574015)(38100700002)(86362001)(82960400001)(33656002)(38070700009)(41300700001)(8936002)(8676002)(52536014)(4326008)(966005)(2906002)(83380400001)(122000001)(5660300002)(316002)(478600001)(110136005)(76116006)(66556008)(66476007)(66446008)(64756008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wk5qR3RCb0lsb0lFZUVrYmtVWjN1cWY4NmJlSG9DUFpJQWpsNFovRjV0bkZy?=
 =?utf-8?B?SVVVSUdpczdMQXN0cWtuYTBUYVJUQTh5K3FTTzdOdEo1SXpFR2Q2eTZ2eE1a?=
 =?utf-8?B?OUsvZUkzcTZYWjFEUVRtaG1mbURGQ3R2S1M1b0NBMHFyQ3NveCtaOWJ2Y25m?=
 =?utf-8?B?VmsrTFRqMzFEbzhlWDVodUEzUGVzaHMxSmdRRXB5RVBlRisyUWlUVkRkZ1Fh?=
 =?utf-8?B?YW5GQkk4OFBZSDF4dmxEbVZpcmcvVUY3T0pDVU9HeW10NkZJY2U3MFdQdlJa?=
 =?utf-8?B?N0hLeEhQRWVtVDhkSDFvZHlWTkxaTmJxUFFDekFYN2JtNVR5Y0kzTmlnbGw2?=
 =?utf-8?B?QktTLzBRZjFFV2czL25TemdPZGhrRkhKU2NnbmRsQTg2NDZURUYvb2N2QVd2?=
 =?utf-8?B?MksrbnVsS2JlaURSdGRHeUhvU0Z6bVltczRDQkRqSWp3U040aW1xWmlhRk5k?=
 =?utf-8?B?bjdTM0lJYXVLeVZma0E2VGorWjNFOEhnZ1NETmFndGVEbHpUak9ENTV0a0RI?=
 =?utf-8?B?K0tKZkdBUFZSWStKbVA1dUlzdWVidjl6SFJRMzQ1a0ZSdEJyeUhnV0lML1Zi?=
 =?utf-8?B?dlovK0RnUkZHUVdCVmt5amx5bHFPeVRCZHVGS3pNdlh6cVRnajJUbys5bXhM?=
 =?utf-8?B?UlRCYWJCSWxkUTI4V2E3dFhOWVNPRGUzWFZLWGVEWDdHZFVlRHpaWnVhbGhF?=
 =?utf-8?B?UmdieTZaaEdrS2R3ZXpjZTgrR3JmR2ZHMCtzNlp2NzZKaE9GZVNtdm5JRjFi?=
 =?utf-8?B?RHhmSURsVTBGdE41MG5CQTdRdFhnWTRmM1FpeEx5U1lwRGM2VG5Ra3BrdUZx?=
 =?utf-8?B?NmR1LzZzWDVFQzZTSU5yTVhBTWV3b0tKRXluZkVzYzVnWkd5bnM1bzh1amlO?=
 =?utf-8?B?YXpmNW5Rd0llZ0ZzRGxQMjlLRkNFMHJ3b1kxSnNJTUVVb3AvYy93am1aK05V?=
 =?utf-8?B?WGlpNWRpWTg3R2pxNXVjUkZGNld0TjFiUFZEWmVDbHVpMndIOFVVNUltT3BT?=
 =?utf-8?B?QTlwSzcrTm1oZFl5WWV6ZnNUb1BvVlZtMDJrQ0h5TnpmQW1WTGtmVEJHbGVU?=
 =?utf-8?B?RWRJTTJpWjNITXd4U3VsWTdjTkprTWxwU0dKaHROOUhKRk1TSnBwb3JGblFY?=
 =?utf-8?B?ZkJtbUw1Y0JhZzkyRHNMdEF0WjFKdHdZeEhDczZQSzFEMDdhRTNXbzlNU0Zn?=
 =?utf-8?B?cll4UlFHak8rU0FqVE93bHNZck9hUjhYK3lVZFRGSXRFck56VXJlRitLU1Fl?=
 =?utf-8?B?eURUbEVIbk1GOWRjQkc1ZXpVcFh0aFBYRS80eTZRdkg2WVRCOCt4dmowWVFC?=
 =?utf-8?B?ckFWWk44SzFwZEFEZjRSZnRHdXNwOTJNcTROb3N3dTZRRHV0Y3EvTmt5VWls?=
 =?utf-8?B?ckRFaUsveEkvdDFUR2IyVlhQUS9TSG5XZ1MrWnpxZHdpVU5hTzNKenFUWStV?=
 =?utf-8?B?SzB1ZmVqZEtoMzdsTFM5bzBuZDhPZythN0l0WER6RGFuMzgzVCsyb1BrV3Rv?=
 =?utf-8?B?T1hxcVVGUGhqTGRYOUdsYjhqb1A5TFRjVkJxSVIyakJRZnFpWFVlTDRKWEpG?=
 =?utf-8?B?clM1dmZ5MFJJV0VLallieFptRVhjTER1L3VkZG1SeVRjR05VTmIvZDF2Mllm?=
 =?utf-8?B?RUVLR0VtNDhHUVRNQXIrbmdxQXdNUUR1VGdqV0phNGRyRjg5UlcwTDRIWmZX?=
 =?utf-8?B?K01VTjBwZDBtNzRsYUpsRnBRcVVISXF3ZndQT3pKS1c4SEJEQlFsbjFXQzlk?=
 =?utf-8?B?QTFGTWVnb2dEWUF4Zm05V0crMkovNW1oSnAzaGJtVGVGS1A3Qlc5dFFxZVN0?=
 =?utf-8?B?UnJpVXNQWll5VUozekQ2Y0x4N1NpVFViZytMZmJ5YmY1bS85ZVR6RFNuSHRB?=
 =?utf-8?B?a1dPZGJJMCt1dTAwMzhHRDNkaytOVkZXY1NDVzFmd2dMakdjSHp0ZmRjRTJy?=
 =?utf-8?B?N1FQNUFHaUY5MmZXTHZ2L1MybzNBTmJaMk5JL0paMzU0TUFnUmdMakN2dGJJ?=
 =?utf-8?B?bEFBSWljSGpYTjQvczZoNEx6SFAzeWNaTjZta2VKTmp0U1NyQXliTVoxSWF0?=
 =?utf-8?B?TUtwOU5jaCtNcXdGUW9hbUlHZUo0WnBFODAxZFB4S3hLc0xtNFNxdExNOVkr?=
 =?utf-8?B?WW05STk3bkZCaWp2bEduV0VqY2tpbzVNSjd1QU9EUDVNSmN6c2N6Ni9vdVRy?=
 =?utf-8?B?V2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7038.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d144ab3-fdf0-44ba-c99e-08dc18a1a974
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 03:49:39.1038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Z/P6nycn6qmJ1AnpfF7tmqe0BfqW8bUmVTIRd46yaSafDG6Szzifk3gykk7FZVdsHVN5BgY9cnGPD895UVqdTSMhuGaIYebhFjNFNCXDOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6213
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAxOCBKYW51YXJ5
IDIwMjQgMjE6MzYNCj4gVG86IEdoaW1pcmF5LCBIaW1hbCBQcmFzYWQgPGhpbWFsLnByYXNhZC5n
aGltaXJheUBpbnRlbC5jb20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBSb3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYzXSBkcm0veGUveGUyOiBVc2UgWEVfQ0FDSEVfV0IgcGF0IGluZGV4
DQo+IA0KPiBPbiBUdWUsIDIwMjQtMDEtMTYgYXQgMTc6MzUgKzA1MzAsIEhpbWFsIFByYXNhZCBH
aGltaXJheSB3cm90ZToNCj4gPiBUaGUgcGF0IHRhYmxlIGVudHJ5IGFzc29jaWF0ZWQgd2l0aCBY
RV9DQUNIRV9XQiBpcyBjb2hlcmVudCB3aGVyZWFzDQo+ID4gWEVfQ0FDSEVfTk9ORSBpcyBub24g
Y29oZXJlbnQuIFVzZSB0aGUgY29oZXJlbnQgZW50cnkgWEVfQ0FDSEVfV0INCj4gZm9yDQo+ID4g
YnVmZmVycyBub3Qgc3VwcG9ydGluZyBjb21wcmVzc2lvbi4NCj4gDQo+ICJzaW5jZSB0aGF0IGlz
IHdoYXQgdGhlIG1pZ3JhdGUgY29kZSBjdXJyZW50bHkgZXhwZWN0cyI/DQoNClRoYXQgaXMgcmln
aHQuIFdpbGwgdXBkYXRlIGl0IGluIGNvbW1pdCBtZXNzYWdlIHRvby4NCj4gDQo+ID4gRm9yIHJl
YWQvd3JpdGUgdG8gZmxhdCBjY3MgcmVnaW9uDQo+ID4gdGhlIGlzc3VlIGlzIG5vdCByZWxhdGVk
IHRvIGNvaGVyZW5jeSB3aXRoIGNwdS4gVGhlIGhhcmR3YXJlIGV4cGVjdHMNCj4gPiB0aGUgcGF0
IGluZGV4IGFzc29jaWF0ZWQgd2l0aCBHUFVWQSBmb3IgaW5kaXJlY3QgYWNjZXNzIHRvIGJlDQo+
ID4gY29tcHJlc3Npb24gZW5hYmxlZCBoZW5jZSB1c2UgWEVfQ0FDSEVfTk9ORV9DT01QUkVTU0lP
Ti4NCj4gPg0KPiA+IEZpeGVzIHRoZSBicm9rZW4gInhlX21pZ3JhdGVfdGVzdCBrdW5pdCB0ZXN0
IiBvbiBMTkwuDQo+ID4NCj4gPiB2Mg0KPiA+IC0gRml4IHRoZSBhcmd1bWVudCB0byBlbWl0X3B0
ZSwgcGFzcyB0aGUgYm9vbCBkaXJlY3RseS4gKFRob21hcykNCj4gPg0KPiA+IHYzDQo+ID4gLSBS
ZWJhc2UNCj4gPiAtIFVwZGF0ZSBjb21taXQgbWVzc2FnZSAoTWF0dCkNCj4gPg0KPiA+IENjOiBN
YXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiA+IENjOiBUaG9tYXMgSGVs
bHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiBUaGVyZSBu
ZWVkcyB0byBiZSBhIEZpeGVzOiB0YWcgaGVyZS4gUGxlYXNlIHVzZSAiZGltIGZpeGVzIiB0byBn
ZXQgaXQNCj4gcmlnaHQ6DQo+IA0KPiBodHRwczovL2RybS5wYWdlcy5mcmVlZGVza3RvcC5vcmcv
bWFpbnRhaW5lci10b29scy9kaW0uaHRtbA0KDQpTdXJlLg0KPiANCj4gDQo+ID4gU2lnbmVkLW9m
Zi1ieTogSGltYWwgUHJhc2FkIEdoaW1pcmF5DQo+ID4gPGhpbWFsLnByYXNhZC5naGltaXJheUBp
bnRlbC5jb20+DQo+IA0KPiBPdGhlcndpc2UgTEdUTS4NCj4gDQo+IC9UaG9tYXMNCj4gDQo+IA0K
PiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYyB8IDE0ICsrKysr
KystLS0tLS0tDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdy
YXRlLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMgaW5kZXggNDQ3MjVm
OTc4ZjNlLi41ZGU4ZWU0MjQ1YzMNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfbWlncmF0ZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3Jh
dGUuYw0KPiA+IEBAIC00ODEsNyArNDgxLDcgQEAgc3RhdGljIHZvaWQgZW1pdF9wdGUoc3RydWN0
IHhlX21pZ3JhdGUgKm0sDQo+ID4gwqAJLyogSW5kaXJlY3QgYWNjZXNzIG5lZWRzIGNvbXByZXNz
aW9uIGVuYWJsZWQgdW5jYWNoZWQgUEFUIGluZGV4ICovDQo+ID4gwqAJaWYgKEdSQVBISUNTX1ZF
UngxMDAoeGUpID49IDIwMDApDQo+ID4gwqAJCXBhdF9pbmRleCA9IGlzX2NvbXBfcHRlID8geGUt
DQo+ID4gPnBhdC5pZHhbWEVfQ0FDSEVfTk9ORV9DT01QUkVTU0lPTl0gOg0KPiA+IC0JCQkJCcKg
IHhlLQ0KPiA+ID5wYXQuaWR4W1hFX0NBQ0hFX05PTkVdOw0KPiA+ICsJCQkJCcKgIHhlLT5wYXQu
aWR4W1hFX0NBQ0hFX1dCXTsNCj4gPiDCoAllbHNlDQo+ID4gwqAJCXBhdF9pbmRleCA9IHhlLT5w
YXQuaWR4W1hFX0NBQ0hFX1dCXTsNCj4gPg0KPiA+IEBAIC03NjksMTQgKzc2OSwxNCBAQCBzdHJ1
Y3QgZG1hX2ZlbmNlICp4ZV9taWdyYXRlX2NvcHkoc3RydWN0DQo+ID4geGVfbWlncmF0ZSAqbSwN
Cj4gPiDCoAkJaWYgKHNyY19pc192cmFtICYmIHhlX21pZ3JhdGVfYWxsb3dfaWRlbnRpdHkoc3Jj
X0wwLA0KPiA+ICZzcmNfaXQpKQ0KPiA+IMKgCQkJeGVfcmVzX25leHQoJnNyY19pdCwgc3JjX0ww
KTsNCj4gPiDCoAkJZWxzZQ0KPiA+IC0JCQllbWl0X3B0ZShtLCBiYiwgc3JjX0wwX3B0LCBzcmNf
aXNfdnJhbSwNCj4gPiB0cnVlLCAmc3JjX2l0LCBzcmNfTDAsDQo+ID4gLQkJCQkgc3JjKTsNCj4g
PiArCQkJZW1pdF9wdGUobSwgYmIsIHNyY19MMF9wdCwgc3JjX2lzX3ZyYW0sDQo+ID4gY29weV9z
eXN0ZW1fY2NzLA0KPiA+ICsJCQkJICZzcmNfaXQsIHNyY19MMCwgc3JjKTsNCj4gPg0KPiA+IMKg
CQlpZiAoZHN0X2lzX3ZyYW0gJiYgeGVfbWlncmF0ZV9hbGxvd19pZGVudGl0eShzcmNfTDAsDQo+
ID4gJmRzdF9pdCkpDQo+ID4gwqAJCQl4ZV9yZXNfbmV4dCgmZHN0X2l0LCBzcmNfTDApOw0KPiA+
IMKgCQllbHNlDQo+ID4gLQkJCWVtaXRfcHRlKG0sIGJiLCBkc3RfTDBfcHQsIGRzdF9pc192cmFt
LA0KPiA+IHRydWUsICZkc3RfaXQsIHNyY19MMCwNCj4gPiAtCQkJCSBkc3QpOw0KPiA+ICsJCQll
bWl0X3B0ZShtLCBiYiwgZHN0X0wwX3B0LCBkc3RfaXNfdnJhbSwNCj4gPiBjb3B5X3N5c3RlbV9j
Y3MsDQo+ID4gKwkJCQkgJmRzdF9pdCwgc3JjX0wwLCBkc3QpOw0KPiA+DQo+ID4gwqAJCWlmIChj
b3B5X3N5c3RlbV9jY3MpDQo+ID4gwqAJCQllbWl0X3B0ZShtLCBiYiwgY2NzX3B0LCBmYWxzZSwg
ZmFsc2UsICZjY3NfaXQsIGNjc19zaXplLA0KPiBzcmMpOyBAQA0KPiA+IC0xMDE4LDggKzEwMTgs
OCBAQCBzdHJ1Y3QgZG1hX2ZlbmNlICp4ZV9taWdyYXRlX2NsZWFyKHN0cnVjdA0KPiA+IHhlX21p
Z3JhdGUgKm0sDQo+ID4gwqAJCWlmIChjbGVhcl92cmFtICYmDQo+ID4geGVfbWlncmF0ZV9hbGxv
d19pZGVudGl0eShjbGVhcl9MMCwgJnNyY19pdCkpDQo+ID4gwqAJCQl4ZV9yZXNfbmV4dCgmc3Jj
X2l0LCBjbGVhcl9MMCk7DQo+ID4gwqAJCWVsc2UNCj4gPiAtCQkJZW1pdF9wdGUobSwgYmIsIGNs
ZWFyX0wwX3B0LCBjbGVhcl92cmFtLA0KPiA+IHRydWUsICZzcmNfaXQsIGNsZWFyX0wwLA0KPiA+
IC0JCQkJIGRzdCk7DQo+ID4gKwkJCWVtaXRfcHRlKG0sIGJiLCBjbGVhcl9MMF9wdCwgY2xlYXJf
dnJhbSwNCj4gPiBjbGVhcl9zeXN0ZW1fY2NzLA0KPiA+ICsJCQkJICZzcmNfaXQsIGNsZWFyX0ww
LCBkc3QpOw0KPiA+DQo+ID4gwqAJCWJiLT5jc1tiYi0+bGVuKytdID0gTUlfQkFUQ0hfQlVGRkVS
X0VORDsNCj4gPiDCoAkJdXBkYXRlX2lkeCA9IGJiLT5sZW47DQoNCg==
