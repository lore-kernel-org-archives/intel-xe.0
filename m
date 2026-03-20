Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB081088E6E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 09:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2171010E541;
	Fri, 20 Mar 2026 09:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XxcgU2fq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB6D10E541
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773998658; x=1805534658;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dlxY5LJ5KUksTZzsdnMXCjXw26Y7DZD2Ouq1D4oyEJ4=;
 b=XxcgU2fq6Fw/eLzEw3WVt8HYRJRIulxYknPiwEekdfUhq9joswxNgrep
 bGRyF1XGmnpzz0CyVy1yswH/1T32hW09G58mMii7raCDPWozEsL5En69U
 gNZGUwGZEoCjgRINGCtt9ybxuzePZe7fQ8onH9bm+wMmNeVg160XRcrDg
 p8nWoBB51eKeR2OFe3jX2Wtxwu4yFa92UsewpkOHaI8Z/Gw/2or84KYD8
 De8xnGLpFsJlAhZ7p0OxtILkFBG6tnEorIkz3qO2Rb1m1AWvvzci2MlZt
 DJXwX2fCVs7by50uTooeVb4wlChPjLSc88ReWP0ZWB6mSOhHiFpk0u8VE A==;
X-CSE-ConnectionGUID: 0YsGv0m4Qbuk2U9bE1mdFw==
X-CSE-MsgGUID: VsVm+n/+Q46be7xJ2luQ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75199686"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75199686"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:24:17 -0700
X-CSE-ConnectionGUID: B1nDYwwQQ4y7U1X/S490GA==
X-CSE-MsgGUID: Y3s5q8wOSY+nFPT65hz5UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="223262607"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:24:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 02:24:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 02:24:17 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 02:24:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXe9Czd8r+rWj0oFrgfXZJuKRATYLRTnWKvaR1sac3vrBeQ3iUkZohHhoDn6EEVgVzrXxO1y43sjF7cZ22m9SND/0ZKX5yUESX9WuNEctdFkv7LwXUlqPg7xz9nbqfJjXDlGyDKsmmtGQK0X/icyaGThZnblhyk+xi9r4M9MrLZt6FEbzq1xv0fcUAR6ULMoRWu2yj2BY4FuK/m69VyyV0/H5PPZrUrZvEAGOlXc+/2tiVsK+4WVfhes0Il++h6h/0R73rKP45Q0iwaRjkpSFvZYDw8tpX+neH/GTs/ZIV9GcosASSKAkFqhIEttsfuSlJ6XO0D6BWb4eXQvdLk5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlxY5LJ5KUksTZzsdnMXCjXw26Y7DZD2Ouq1D4oyEJ4=;
 b=cDXHQ+hF5hO8gHzvSNdVbriIq1fqD3LHoQFvqbsLVkYC/5RAgMtAvTQDlYvkEz6Q3DrrG8H/DBfRTsvgEmAG7BGaxPJ7xPoCyUZb533p7qMr8tMTealWszH1ZtLGFXfMQnGwfC4qaImg0BqY88xaLHB6rmkg/7In4671ruZboonJ3NpVyw/lqtkkXDZjEUkr4zK8VFZ+3ViWYDm9FS/ESDkq++KPN8Y38y1cDmMOSpBuLSya1UAM0YyVcTulhwmyVYyNz0TTL/U+lYg3Kdu0k95xgRn5YrDPbvJZ2xc99og/DXKttARl+ActNiRULPaaypNJKUe2D1N/Ha6ppE6hGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DS7PR11MB8855.namprd11.prod.outlook.com (2603:10b6:8:257::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.9; Fri, 20 Mar 2026 09:24:08 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 09:24:08 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "kernel-dev@igalia.com" <kernel-dev@igalia.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, "Ruhl, Michael J" <michael.j.ruhl@intel.com>, 
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: RE: [PATCH v23 11/12] drm/xe/display: Add support for AuxCCS
Thread-Topic: [PATCH v23 11/12] drm/xe/display: Add support for AuxCCS
Thread-Index: AQHct4g6f1zHUSCTLE+i3Y9qbZBYn7W3JwjQ
Date: Fri, 20 Mar 2026 09:24:08 +0000
Message-ID: <DM4PR11MB6360AB8F6229F2275BA3309EF44CA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260319100707.60157-1-tvrtko.ursulin@igalia.com>
 <20260319100707.60157-12-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260319100707.60157-12-tvrtko.ursulin@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DS7PR11MB8855:EE_
x-ms-office365-filtering-correlation-id: e6d8e330-6aff-42b8-a70e-08de86627046
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: nDS00Y4h6vdDZRhL1O2APbXFk7ecJ5Byg7N7o+GOfH12BApXv5x3QnKyEfsbFofXk2lKwC2Qz21lCwm2EN59+Ba4PjneYMiRtPktEsssZGjYuUGvNLZ1rDKSL0cAOlXKV5P1hTph4PRLTXNIctPj3pZAb3ffZjrM48vmXH1Ztm33kcE9qu38BV/W6uRExNNSt2uzwhrlH2dwTXmxAkjZ7Eq/6P3jMKM9mWzfNJxVrCdLaRGIAdFlkMac00RWT/5puHYUZe3Bou0wV9IAsXmkKM4gWoY8LQD8rkOxRedvpduZm5MuWrkHbh1xqgAZhBxP9AMVg/2hXaQyJs/yN23l/CIoGSfsUyMexxwIG5HM1iPJej27DHNyXBMZm6x0PgeFEm/IZ0VBXcVpnhoF0zeSin2LrV+316PeFrdCgsvt8k+MR000BjpTROOJpGSaxC7Nq8u+1BvgqLdNG42t6oWl6pHUrqqTZq0vZ726jU/2yI9C4/lLZ26IGLV0T0zBT4StxuBcqtJWYmR2b2F7va11o/4K0Icfg+kFz5/3JrJGJz8zal8Qqf3vxizhGxYuIb4XTobzl0WmE4oeKm7uO0R7FAPEJmdv6YkeP4P2UyTjFdsWLlUGlPt4uRybrWC6lqppCf3rLvWtKTnsakjlhc6BVd/i0PMWJ8XCCROHJYbaASw7G0mVqWzlReE2zuDH+/pxn1YxBJi3NkwSEjG8oLazOvkIJcMqkUrl3Wu72qcTp9itzGarxZvp2uFSgXIchAD1SAMrqBAETmH71YcLrIYbZKAeIUkDp64acSFBiBPkFBY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTZXSFgvUHQvUXJzUVBacldZQXFGN1R1cGllQmpqd2xoR0FseWQ2K0tkZUUw?=
 =?utf-8?B?QU1TNFJMcDhheHppdERXYXNaUU5YY29KTHphSDJld0tXZ0tZUFNrNkJ2R3Ft?=
 =?utf-8?B?TDlUaSsrTnNGNlRESlpUYjlqcEJ6am9HWktpWEh2UFVtYlBqQWo3ZXJzVmlK?=
 =?utf-8?B?eW5vbHBpSWhGajYwSWlqc1JWM040Q042bmwrcSs5OWR1R1FsWHhCNk5mc0hy?=
 =?utf-8?B?Ym5LcWtQMFUwSE9kcW1NbXBoNUZkL2Z5Z3RBVHNLSnhjL1BsaDY4b0hiRTl6?=
 =?utf-8?B?M1ZQeXNYTHBIclNLZk5HZXJRZFc0MWF2VXN1N0g0V01JVHFQMkUzVTc0T256?=
 =?utf-8?B?eWJ6b001dzBXbTd0c05rcnhlWXdObnZMYlZUTWdKa2p2Q2pLMy9lbktiUS92?=
 =?utf-8?B?YzFSQmoycGdSQkhMR1YrTDBOdzJhMTNvOXN4dDdpcDdFZWpBTjFtcE1tUjhk?=
 =?utf-8?B?S09URElCT2VVbGRtRFJ1M0pmOVFiK0RRNWZsNnRVNHVXQmZ0SklJeHRxME1K?=
 =?utf-8?B?WHN5d2dLWVRDcVVhSEd3aTZoQVZ4ZzEraFBhU3FkN04zK2xhaU1xRUVNbHU2?=
 =?utf-8?B?WXNYRGhrQTRSazFDdXpUV1IwUy9CenYxVkh6L1k3ZFhPdElVaS95d3BWRzlm?=
 =?utf-8?B?dDU2NGJPUXNEL3ZvdkFoeFJvL0NyQ0JCSGp1VlZuTVV1cTBhWUNOOVdQM01B?=
 =?utf-8?B?cW5Gc1BVd3plK2JCSWhIR1FIWlh0di9LV2Z1MUZoL2szTTc5d052Z1FsQzZr?=
 =?utf-8?B?N2d3S2pRWVZjVFhlWlRsdUM4YmZKa2QrYUFlaHloY2dhQWk4NVVMQnZ5QzR0?=
 =?utf-8?B?Rk4ycnAySVN2RWRiUkpRVXpXemtPZFZlaGVudUNtdkxzSHF3elY0VmpCWnBZ?=
 =?utf-8?B?Q3hnaGI0VVpoK3ZZTUg0NXA3U3loTVpJRUdHbDczSmMzbkJoV3VQS20xb2l4?=
 =?utf-8?B?U0dTRExMQTltSUxVV1FZU2hvMkl2NXFreDR6RGJwYXFseSt3djVmS2JzYlBE?=
 =?utf-8?B?dFNzd2NSQXdEVTRBNS9YMjUxVENOYm1oNWsrbUJENE1wQWNLT1pLVEk5TEw0?=
 =?utf-8?B?UVJZb3FUM05OSGtNNHY5cUVBRDA4bFoxUHU3UUpIQ0VvTTlZSy85WlIveFQ2?=
 =?utf-8?B?U1A5RTZHTUYwTXpMSktkOXFNVG5EZlA2d1Y4cTJnM3pIbW55eHpaVWZreWxR?=
 =?utf-8?B?OW9QQ2FCVEl4VHB5QXQwaTJna2RoNHhGaGlFTDUyUDZhbTBncXo1Ylcrc1Jn?=
 =?utf-8?B?WTJtdFNGZnpxN2t4cjg0WVdiR000VUloTmozc1VyTjNpbUF1UGxtM0w0Z1oz?=
 =?utf-8?B?am5GbTRodjZZQTB3SkdOVmVnNTNtOFF6aFVwL3lrV056cU9FZ3lTSnRERlRs?=
 =?utf-8?B?LytQd244aGg5Y3hnYSt1OExqaktyR3FRb0FEelUwcUVPWmhMTEtyQ0RoQ2pM?=
 =?utf-8?B?RzhCUlNtUkh4MnlSeEpxRTlZa0lIODJLSEFxYk5NSjV0bDlZbk1uMnFsYUJ5?=
 =?utf-8?B?UWhML1pUMzBJNHlDZVQ4dnJFelVTWGx2dlRkN2ZtVW5TWHRnaFVISStYYjYr?=
 =?utf-8?B?WjNyNncyZDIxdnJDOVdPczN2bVBydjhLaWZNUXlnMUxweldzQk9DcXFrWGhz?=
 =?utf-8?B?RDdDT0h3MmtBUnVRNmVBTHk0RHVpdmVjQmdvZzNKM3NiN0tqSml0N3V4cEc0?=
 =?utf-8?B?THIzeWkxRlhjMm9NQXdsY3owV2lnT1E1UEE5blFBa1J3bnNzYllYcENYbDcx?=
 =?utf-8?B?UU1acUI5cVIveURQNkNzTE1yMlp5RnF6V3pxNDNBL08yOXJJaFVCYWwvb3Iv?=
 =?utf-8?B?M0NLKzRsM2EzNUxKVjQvT2NmQXlDK2N1MXBSVHFPUVl2Nzk3NncveXdrMzQx?=
 =?utf-8?B?UjYzcnJJOGNxVkZGODlIcXVUT3NIVTVnOWJwUGRsS1dha05nck5ldGJnb05N?=
 =?utf-8?B?MDNNaUg5ZGs2VVVsMTJsSE1XUkluaHdlTmRtY1lEYzgvTDZ1VlJNbHE0bTR0?=
 =?utf-8?B?MzAyeEFBYWNvcU5RcmtkS3A3MXdKV3RpcktHWFRudy9JdzIzcmxkaTR1SFcy?=
 =?utf-8?B?SEZmMDJPZ2lqUHhYMEVnQ3Nvc2h3NTI4SUNTbEQ0K2c2Q1ZJL1JKOFgyaWxk?=
 =?utf-8?B?cENGRzhwOUVTakw0bko3dm5rSDFpZmJnU1FjQWxXWXlBaTdvWXExSEc4VnZt?=
 =?utf-8?B?Rk82Y2VLb1R2ZS9rVXBOREdJZ1NxSXBEQXNnK0twT1Ywd0NzZDZkRnpybEhm?=
 =?utf-8?B?ajBrNStlTThLcy8yVlU2Rm16NGlNSDBkdTV4SFd1bEsyOWtGTVp0dFZ5N0Ry?=
 =?utf-8?B?ZURhMGJQcUZqL1lpZkNEaEdrWmxCcVh4a05Bbmp4ZlIvLzdLbzlQdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DQX/DXsqxdhjg28HzjAyqFCygKgMR+dEtEmnt3JnUPTsO4DnamkuEdRmkruk8KwPz6fmcjsFdpW+25XiwbQeuC0aRhBknNWHHeS0MUK2u7QAeelrQaXT5MUC3nvzooha2GCzPLWXODTKsWAXaJJ51XYkbw9GVBVeqqMruSSNlfFAYFhkHX/cF0T2kmcTWRiExoNbvGQ7PJ7DlpCE7AFYTZVVSQMGA33URo0SSO0aUSc1IWsaTuQF6ZIu2ieGN29PVSeT2hz7/ON0tNP4ecRgJLUBd+Vz4epPBJfWwrLHzb0LwArxBMZkxG32YQgYLjBu/1ap/p4EbqpSLYBM82+m6g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d8e330-6aff-42b8-a70e-08de86627046
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 09:24:08.1341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJJstCNpNIxp6aBzznUm+eTt7Dd/JjoBVl0MEpzlbW/CIPDhAd3Oc6zQJAW3jeoCQgMTNhaBWaahDhbDau9xnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8855
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVHZydGtvIFVyc3VsaW4g
PHR2cnRrby51cnN1bGluQGlnYWxpYS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAxOSwg
MjAyNiAzOjM3IFBNDQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6
IGtlcm5lbC1kZXZAaWdhbGlhLmNvbTsgU2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5j
b20+OyBUdnJ0a28NCj4gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaWdhbGlhLmNvbT47IEp1aGEt
UGVra2EgSGVpa2tpbGENCj4gPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+OyBSdWhsLCBN
aWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT47DQo+IFZpdmksIFJvZHJpZ28gPHJv
ZHJpZ28udml2aUBpbnRlbC5jb20+OyBUaG9tYXMgSGVsbHN0csO2bQ0KPiA8dGhvbWFzLmhlbGxz
dHJvbUBsaW51eC5pbnRlbC5jb20+OyBNYWFydGVuIExhbmtob3JzdA0KPiA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIzIDExLzEyXSBkcm0v
eGUvZGlzcGxheTogQWRkIHN1cHBvcnQgZm9yIEF1eENDUw0KPiANCj4gQWRkIHN1cHBvcnQgZm9y
IG1hcHBpbmcgdGhlIGF1eGlsaWFyeSBDQ1MgYnVmZmVyIGludG8gdGhlIERQVCBwYWdlIHRhYmxl
cy4NCj4gDQo+IFRoaXMgd2lsbCBhbGxvdyBmb3IgYmV0dGVyIHBvd2VyIGVmZmljaWVuY3kgYnkg
ZW5hYmxpbmcgdGhlIHJlbmRlciBjb21wcmVzc2lvbg0KPiBmcmFtZSBidWZmZXIgbW9kaWZpZXJz
IHN1Y2ggYXMgSTkxNV9GT1JNQVRfTU9EX1lfVElMRURfR0VOMTJfUkNfQ0NTDQo+IGluIGEgZm9s
bG93aW5nIHBhdGNoLg0KDQpJIHRoaW5rIHRoZSBjb21tZW50IHdpbGwgbmVlZCBhbiB1cGRhdGUg
dG8gcmVmbGVjdCB3aGF0IGlzIGN1cnJlbnRseSBiZWVuIGFkZGVkIGluIHRoaXMNCnNwZWNpZmlj
IHBhdGNoLg0KDQpIb3dldmVyLCBjaGFuZ2VzIGxvb2sgZ29vZCB0byBtZS4gV2l0aCBhYm92ZSBm
aXhlZCwNClJldmlld2VkLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0K
DQo+IFNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpZ2FsaWEu
Y29tPg0KPiBDYzogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWls
LmNvbT4NCj4gQ2M6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0K
PiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiBDYzogVGhvbWFz
IEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBDYzogTWFh
cnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4gLS0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYyB8IDI4ICsrKysrKysr
KysrKysrKysrKysrKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNw
bGF5L3hlX2ZiX3Bpbi5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGlu
LmMNCj4gaW5kZXggMjNhN2VjNDFmMDFkLi5lNDVhMWU3YTQ2NzAgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2ZiX3Bpbi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS9kaXNwbGF5L3hlX2ZiX3Bpbi5jDQo+IEBAIC01Niw2ICs1NiwyOSBAQCB3cml0ZV9k
cHRfcGFkZGluZyhzdHJ1Y3QgaW9zeXNfbWFwICptYXAsIHVuc2lnbmVkIGludA0KPiBkZXN0LCB1
bnNpZ25lZCBpbnQgcGFkKQ0KPiAgCXJldHVybiBkZXN0ICsgcGFkICogc2l6ZW9mKHU2NCk7DQo+
ICB9DQo+IA0KPiArc3RhdGljIHVuc2lnbmVkIGludA0KPiArd3JpdGVfZHB0X3JlbWFwcGVkX2xp
bmVhcihzdHJ1Y3QgeGVfYm8gKmJvLCBzdHJ1Y3QgaW9zeXNfbWFwICptYXAsDQo+ICsJCQkgIHVu
c2lnbmVkIGludCBkZXN0LA0KPiArCQkJICBjb25zdCBzdHJ1Y3QgaW50ZWxfcmVtYXBwZWRfcGxh
bmVfaW5mbyAqcGxhbmUpIHsNCj4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHhlX2JvX2Rldmlj
ZShibyk7DQo+ICsJc3RydWN0IHhlX2dndHQgKmdndHQgPSB4ZV9kZXZpY2VfZ2V0X3Jvb3RfdGls
ZSh4ZSktPm1lbS5nZ3R0Ow0KPiArCWNvbnN0IHU2NCBwdGUgPSB4ZV9nZ3R0X2VuY29kZV9wdGVf
ZmxhZ3MoZ2d0dCwgYm8sDQo+ICsJCQkJCQkgeGUtPnBhdC5pZHhbWEVfQ0FDSEVfTk9ORV0pOw0K
PiArCXVuc2lnbmVkIGludCBvZmZzZXQgPSBwbGFuZS0+b2Zmc2V0ICogWEVfUEFHRV9TSVpFOw0K
PiArCXVuc2lnbmVkIGludCBzaXplID0gcGxhbmUtPnNpemU7DQo+ICsNCj4gKwl3aGlsZSAoc2l6
ZS0tKSB7DQo+ICsJCXU2NCBhZGRyID0geGVfYm9fYWRkcihibywgb2Zmc2V0LCBYRV9QQUdFX1NJ
WkUpOw0KPiArDQo+ICsJCWlvc3lzX21hcF93cihtYXAsIGRlc3QsIHU2NCwgYWRkciB8IHB0ZSk7
DQo+ICsJCWRlc3QgKz0gc2l6ZW9mKHU2NCk7DQo+ICsJCW9mZnNldCArPSBYRV9QQUdFX1NJWkU7
DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIGRlc3Q7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB1bnNp
Z25lZCBpbnQNCj4gIHdyaXRlX2RwdF9yZW1hcHBlZF90aWxlZChzdHJ1Y3QgeGVfYm8gKmJvLCBz
dHJ1Y3QgaW9zeXNfbWFwICptYXAsDQo+ICAJCQkgdW5zaWduZWQgaW50IGRlc3QsDQo+IEBAIC0x
MDksNyArMTMyLDEwIEBAIHdyaXRlX2RwdF9yZW1hcHBlZChzdHJ1Y3QgeGVfYm8gKmJvLA0KPiAg
CQkJZGVzdCA9IHdyaXRlX2RwdF9wYWRkaW5nKG1hcCwgZGVzdCwgcGFkKTsNCj4gIAkJfQ0KPiAN
Cj4gLQkJZGVzdCA9IHdyaXRlX2RwdF9yZW1hcHBlZF90aWxlZChibywgbWFwLCBkZXN0LCBwbGFu
ZSk7DQo+ICsJCWlmIChwbGFuZS0+bGluZWFyKQ0KPiArCQkJZGVzdCA9IHdyaXRlX2RwdF9yZW1h
cHBlZF9saW5lYXIoYm8sIG1hcCwgZGVzdCwgcGxhbmUpOw0KPiArCQllbHNlDQo+ICsJCQlkZXN0
ID0gd3JpdGVfZHB0X3JlbWFwcGVkX3RpbGVkKGJvLCBtYXAsIGRlc3QsIHBsYW5lKTsNCj4gIAl9
DQo+ICB9DQo+IA0KPiAtLQ0KPiAyLjUyLjANCg0K
