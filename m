Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAC0C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 17:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C254B10E41B;
	Thu, 11 Apr 2024 17:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="drsuqmUw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647E310E41B
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 17:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712856227; x=1744392227;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gF+KFtkePLGlL17Cb8BCSZsGloiVzCJe+USj0T3ibT0=;
 b=drsuqmUwLR3NzD4zSik+Gm6s22WFivQAoX2dRO6Zsq1xR09TS00/VqNH
 aHkMTwDr4Re473cSoD3dYzy2b369UIJ2CLpuHGTMAky5vXvYD9xbC0sY0
 cDLZhG+2vqt3Y20/UGglBHwVuXatWefcI2eLZq+aIKDUyBxL9W/CwXbYU
 O8T2QbXlnNxV7j72cGuFV1+D072+15AHuvMQ5jxRYlAGSkCsxqZo5NK/v
 X+y+sCxBxDvP5ezPsZItqxeEMPMzhEMYW6RSJZQS8Aoe3bD7zzBoozuds
 K6tG5fShBz3Q09e8ZzZt0rC0HQO2WoGf0hIcTHTZIgI8gF1O+slbqeLUf g==;
X-CSE-ConnectionGUID: 5pLhHmKnRuO3suGAbe/hQQ==
X-CSE-MsgGUID: YWe1LWTERByLXyFEov9ubA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8414987"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8414987"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 10:23:47 -0700
X-CSE-ConnectionGUID: GQNz7wJWThiu208qckgY0g==
X-CSE-MsgGUID: xHoekfNQSD6sbG36fgfGtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20938749"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 10:23:47 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 10:23:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 10:23:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 10:23:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7Sjw0YtajopFyGDCyrVMFFXYpQ4yZCbaqd24F0g7G2NqsTsV5LZ/fMiLAwo8g9nmmNQvDYbRIkK8Lf4SJomn32zZHsADeJlcMcLu9EX1pXxL214V1QHi4do8+UZYNvGjqHIqVvLrGgxDCAVcfNXhHydyR7WZFCnwkqFaPpfsIjQmSx+u4nSOJQMz0yjg0yHU57EjwweczSM326fe5P+dsOkS1Yn7mLmsLPugf/t42MLcj/Y6mw+p22SR9yrcqxNC5blc5te8h/hT79PbKjRbihAedpXi6DSmw5l3USE/ZGs8bHM7HaSujvvty+bEVOem0m+fhiv5aIYV8/M3ENVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gF+KFtkePLGlL17Cb8BCSZsGloiVzCJe+USj0T3ibT0=;
 b=TVqbisaHktHxmrU5qBJGkS9mA1jg0tsvKmHaCLlWton+nU6I0Sd2l8X15O6aQd/+EzUzhktzAwaDcrkXkIc2yV8iIIjuJ6J7eMbNkR96TyY6PbNwX9M9+sDp2SXSmhS7jy31YPKGRxTQgIQ4TXdWyn0oKpgZNE/kny6zxm8qWJ59x+j3YHq3nsfSCnZPsJUuvkR+fz0kal7gkIAcjV6aFN3Nm0roJrM9ZUwuZT2bKwDewjzaRIU1P/FCYgcghqKon+KZ8grEDkx4ar9jQA6YG6p33kdMMU+drRtf0EIFzeIQsFWoLK0iWHbBEwQtK3sDbhnXjMhCZMabYwLwJiT9lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by LV8PR11MB8680.namprd11.prod.outlook.com (2603:10b6:408:208::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Thu, 11 Apr
 2024 17:23:43 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Thu, 11 Apr 2024
 17:23:43 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>, "Das, Nirmoy"
 <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Mrozek, Michal" <michal.mrozek@intel.com>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>, "Yang, Fei" <fei.yang@intel.com>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH 0/3] Enable device atomics with a VM bind flag
Thread-Topic: [PATCH 0/3] Enable device atomics with a VM bind flag
Thread-Index: AQHai2ryFhItLVqSkUOdVBkjf+nPzrFjPGowgAAQYQCAAAO9wA==
Date: Thu, 11 Apr 2024 17:23:42 +0000
Message-ID: <SA1PR11MB69917ECA86502D241F8B69BB92052@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410170308.409-1-nirmoy.das@intel.com>
 <SA1PR11MB69919E24A17807B65DB2EA2692052@SA1PR11MB6991.namprd11.prod.outlook.com>
 <545742c9-5f62-46de-a69b-944bc5e6f510@linux.intel.com>
In-Reply-To: <545742c9-5f62-46de-a69b-944bc5e6f510@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: michal.mrozek@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|LV8PR11MB8680:EE_
x-ms-office365-filtering-correlation-id: 74559c4b-623e-4a93-e314-08dc5a4c22f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FDtVmpiv61HK3e6E0Ri5uG8k9IJ5NzbLEfZL8YpzOMRIrQ/ZyIHu2pNci5gMeHhgkKzgO4OmMZyHcXBoPiHZFKIbeV0cXn24Heq5jvxUzas8Oqtmj+hUw+ivjsRGotUa3jLzK5F1lSrDOZWXtPfyhTalsca3o5+k3dBy+K6qHm8EwAJPKJkEid8Lsz9K7xfAz5wdyo2he8Gv2F+djkjRwGt579xqdsuxlJoA2in5bMOS5na0sWrs8I0444wuu04/3z9XlM7FWPRINRy3OOU179gpWRD35nDAvNDUTfuy4HZFbK/nfi3FiAS1PkggYsWG5Pl2W+LuNarVxLk76bdkhUWfNnMr74ibCarG8rayUp4Sq+EzBxvML88FUZLHQRPpfO4J47K49BZyjRC8zTrpPYE0wbcTF0bwwgNmWZxdhh2843roNJ4rZAC5m6SQy8lgfzcrWt1RlvgZevirCSmvGLUTVYCbnAkVMfjUZ6/hWBrhzOlg9Wr/YbGDpNnvTPeyUFyCIuX/HjfaA9/vTSSSLlg4APWdDsPESC8X+D6LXP0NSVn6vYIIo45rI/ydtq0i0Yn6tmIaXxNiKQ14bMfy88d5cmPIyOdvqGMI7VG3F/ZnDQNxWJWhhji6F/Wa6sMF0QQTF/dTG7YXngQmqq8DrkOOBadFq4bMTFq+qKMNq9A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnBCKzlGUE1LQ014R3IwT0NEanFBRnRMQWJGY0NOVVJEU0UrU2JGanNQWU41?=
 =?utf-8?B?MysrM3czZFFJcnZUQTZBY3ZlcU1VSjBqc0piNUhzeEdCazJjanJYU0xkdXJO?=
 =?utf-8?B?b21FVFhPU05rRVcvY1diK05rME1qVXJ1dFlOY3RPU3pQQkp1K0RXSFVNcS9S?=
 =?utf-8?B?ZE5vaitWOUFVMUlueXlEb3RPQWxwa3ZvYkFMUnNBbFFKZ29ESWY0QlhGZkNy?=
 =?utf-8?B?QmZablpWOTRWSGZNdCtkZ1RLYUlEc1Y2MVRUMlN3YjBkL3NUcmRyQ0hhOFNr?=
 =?utf-8?B?SXRKWXZKb3NsejZWQzVpakpPVDRVUnBwRFhuN1MweWEyL3pCbGRDTklmSXR5?=
 =?utf-8?B?WHhEWXRGWEdhZnZRNFVwUFdlaWJKd0xSRTJXeU1vQ1Rnc0V2Z01lSnFlSzRz?=
 =?utf-8?B?bDFBV2YvMEtoTEFiUXNTQm9tK29uVVh3M2VnQk81Z2twSzdrWHB6UFMwMytX?=
 =?utf-8?B?MjJDeWVoc1psQnVWQ21pM29IQVBmRFhZOFViM2RHZUl0NzhxSFlBZ2NPSCs1?=
 =?utf-8?B?WHlCcUw2Y0kxK1dGSVZIY1gzeGdUOWxjWFlKN3ZJeGNaWlJ0ZEJ6aml6ZWR3?=
 =?utf-8?B?amV6eXRjUHlFbW1EZG5XUGZWMittWkpFR1NQU1N5Z24zcEdFenJZS3ZoQy9a?=
 =?utf-8?B?U3RFZXNGRjJCaVcrNTdnV3JsODlDR2NLU1l6citjcnFiVmw5RkpyL3hMdUtp?=
 =?utf-8?B?cGcyVUtlZlZQTjUvVDVUNUZpUWtlaHhvbk12citQTHdaYTMxMWNSMURTbmhQ?=
 =?utf-8?B?U3daR29ZazZhQURWMHFiUlhvcnFaZXdRYi9QRzQxSVBmZTlFVllieHY4UGEx?=
 =?utf-8?B?RXNVQ0JaZWdLcHJGcm4yRzhtcXgyRXhlRWFLall5L0EwaUtBQmRjcURBTDZH?=
 =?utf-8?B?UmR0RFhIRnVDeUpuZzlaUnVoYzhCbjVxb2dEMjkvbkRpS0NCZUVGNFRzTGNP?=
 =?utf-8?B?V3VwZmEyNEw0U2t6dStwbFczWEZkUEZnN1VTZm5SbW1DVXJxTEdWOWhDZytC?=
 =?utf-8?B?K0JUaFZoR1EyOCtjK0JMZXlTaGRNdVJMcm44TmFmUmxqbzdKN0luMTRxcjZR?=
 =?utf-8?B?UVRRQnN6blA1SUZwMFZzRFFJZUpraGtYaDlYYng5TjF1SnA2UG1UeVYrM3gz?=
 =?utf-8?B?L3ZFOFVOYVNnazVvb0pVOVJFY2lzekYvOVJwSndKTEtBZmt2VkZYVGNpKzRS?=
 =?utf-8?B?Rk9CbVREdTJSUjJMaUxTRklCVjd2aVdheXZuTm56YkZad2xzbjdSK05KZWpm?=
 =?utf-8?B?ZW1oRnUyNkdZand0MEo0MjY1WW9scGdpbXBGS3lZTU0yOWpEMC84aGlJekZ2?=
 =?utf-8?B?S2kvYlVKWWhnRE9NQjczMWIyaFJObVdaaEV4MmFRS2tEcUt2MkVkbFRtRUlo?=
 =?utf-8?B?aFRxNjFrOThZcGVwZXQzM251aC9jWmcxeU5lSWl6Y0JnaVhFQ3pGUDdrblZD?=
 =?utf-8?B?YTcvVmV3b09BRzdERFh2Y0ZFZWtWQ0o5NllJSnc1TjBhSVpvSUVyVHJHTU81?=
 =?utf-8?B?MVQ1VFBZUUY5U1o0cWR0M1ZzV3pjc3hldVpDZTZsMm5tVDA3d2VPQ2RqRUZR?=
 =?utf-8?B?cWZ0cGhINFc0b0k0blFka0hPYnlsSTFkYmthU2lkRjFSM1RQdW1kY0l1Z3Zq?=
 =?utf-8?B?TXZUTGhCK2pRUnNza3llSGhVRVdDL0VDaGR3WEMvVXN5WTV6S1lZSkIramcr?=
 =?utf-8?B?NnVOY3dOK3NoQkJjTnE2eFNYNkpzSDVxTXV3d0RacTJjRHVRZDZQeXBLQVdj?=
 =?utf-8?B?aGdVcGtKenFDT1EyNW9XS0dxUkhTSUJjQ2N5YTIvM2c3WXJWRDBoRmVPM0dw?=
 =?utf-8?B?OVB4UGNSbmNmcE1FQVFIWFVpRzdiaDNHSjY2Q1h0R1dYNVpURGpXcUdkdVpY?=
 =?utf-8?B?MUVxZ2RpbDRVMWdvRHR6VHVhYUFWaFQ1dXErVFJrZ3BqNzFkb0U2akkwRDVW?=
 =?utf-8?B?TWw5RTRNM2YzMmlvbEFuTFdUZkMxL09DTGpNTlgrU0J0cFpYbkhvRTZIaHJ2?=
 =?utf-8?B?STE1N3ZUWjhOc1VDMTlNT050aE9VSUdxekZnNmUzdVpyV0FCSnZMWjl5OFRM?=
 =?utf-8?B?bTRQUi9oNUFJRjJJc0tlUnBmRmx2bEtRQ1pvMXRxS2FFMTlCSmxDU09TUnVy?=
 =?utf-8?Q?TnbY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74559c4b-623e-4a93-e314-08dc5a4c22f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 17:23:42.9664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r+XVzOWJ2gmqverLfRyjPVAJcW+4VL4FpjuihE5kmny40TMxzTN2L7lGMej88iA4Qn+SPchkNPsjQJphH4re5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8680
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlybW95IERhcyA8bmly
bW95LmRhc0BsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAxMSwgMjAy
NCAxOjAxIFBNDQo+IFRvOiBaZW5nLCBPYWsgPG9hay56ZW5nQGludGVsLmNvbT47IERhcywgTmly
bW95IDxuaXJtb3kuZGFzQGludGVsLmNvbT47DQo+IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBDYzogVml2ZWthbmFuZGFuLCBCYWxhc3VicmFtYW5pIDxiYWxhc3VicmFtYW5pLnZp
dmVrYW5hbmRhbkBpbnRlbC5jb20+Ow0KPiBXZWx0eSwgQnJpYW4gPGJyaWFuLndlbHR5QGludGVs
LmNvbT47IFlhbmcsIEZlaSA8ZmVpLnlhbmdAaW50ZWwuY29tPjsNCj4gTGFuZHdlcmxpbiwgTGlv
bmVsIEcgPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPjsgUm9wZXIsIE1hdHRoZXcgRA0K
PiA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT47IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJy
b3N0QGludGVsLmNvbT47DQo+IE1yb3playwgTWljaGFsIDxtaWNoYWwubXJvemVrQGludGVsLmNv
bT47IFRob21hcyBIZWxsc3RyX20NCj4gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAvM10gRW5hYmxlIGRldmljZSBhdG9taWNzIHdpdGgg
YSBWTSBiaW5kIGZsYWcNCj4gDQo+IEhpIE9haywNCj4gDQo+IE9uIDQvMTEvMjAyNCA2OjIyIFBN
LCBaZW5nLCBPYWsgd3JvdGU6DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPj4gRnJvbTogRGFzLCBOaXJtb3kgPG5pcm1veS5kYXNAaW50ZWwuY29tPg0KPiA+PiBTZW50
OiBXZWRuZXNkYXksIEFwcmlsIDEwLCAyMDI0IDE6MDMgUE0NCj4gPj4gVG86IGludGVsLXhlQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+PiBDYzogRGFzLCBOaXJtb3kgPG5pcm1veS5kYXNAaW50
ZWwuY29tPjsgVml2ZWthbmFuZGFuLCBCYWxhc3VicmFtYW5pDQo+ID4+IDxiYWxhc3VicmFtYW5p
LnZpdmVrYW5hbmRhbkBpbnRlbC5jb20+OyBXZWx0eSwgQnJpYW4NCj4gPj4gPGJyaWFuLndlbHR5
QGludGVsLmNvbT47IFlhbmcsIEZlaSA8ZmVpLnlhbmdAaW50ZWwuY29tPjsgTGFuZHdlcmxpbiwN
Cj4gTGlvbmVsIEcNCj4gPj4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPjsgUm9wZXIs
IE1hdHRoZXcgRA0KPiA+PiA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT47IEJyb3N0LCBNYXR0
aGV3DQo+IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47DQo+ID4+IE1yb3playwgTWljaGFsIDxt
aWNoYWwubXJvemVrQGludGVsLmNvbT47IFplbmcsIE9haw0KPiA8b2FrLnplbmdAaW50ZWwuY29t
PjsNCj4gPj4gVGhvbWFzIEhlbGxzdHJfbSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5j
b20+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCAwLzNdIEVuYWJsZSBkZXZpY2UgYXRvbWljcyB3aXRo
IGEgVk0gYmluZCBmbGFnDQo+ID4+DQo+ID4+IEN1cnJlbnRseSBkZXZpY2UgYXRvbWljcyBpbiBT
TUVNIG9ubHkgYnVmZmVyIGlzIG5vdCBzdXBwb3J0ZWQgYW5kDQo+ID4+IGdpdmVuIHRoYXQgc2lt
dWx0YW5lb3VzIHVzYWdlIG9mIGRldmljZSBhdG9taWNzIGFuZCBDUFUgYXRvbWljcyBvbg0KPiA+
PiB0aGUgc2FtZSBTTUVNIGJ1ZmZlciBpcyBub3QgZ3VhcmFudGVlZCB0byBmdW5jdGlvbiB3aXRo
b3V0IG1pZ3JhdGlvbiwNCj4gPj4gYW5kIFVNRCBleHBlY3RzIG5vIG1pZ3JhdGlvbiBmb3IgU01F
TS1vbmx5IGJ1ZmZlciBvYmplY3RzLCBzbyB0aGlzDQo+ID4+IHByb3ZpZGUgYSB3YXkgdG8gc2V0
IGRldmljZSBhdG9taWNzIHdoZW4gVU1EIGlzIGNlcnRhaW4gdG8gdXNlIHRoZQ0KPiA+PiBidWZm
ZXIgb25seSBmb3IgZGV2aWNlIGF0b21pY3MuDQo+ID4gSWYgSSB1bmRlcnN0YW5kIGl0IGNvcnJl
Y3RseSwgcGVyIHVtZC1rbWQgY29udHJhY3QsIGttZCBzaG91bGQgYXNzdW1lIGFsbA0KPiBzaGFy
ZWQgYWxsb2NhdGlvbnMgc3VwcG9ydCBzeXN0ZW0td2lkZSBhdG9taWMgYnkgZGVmYXVsdA0KPiAN
Cj4gRG8gd2UgaGF2ZSBhbnkgcmVmZXJlbmNlIHRvIHRoaXMgPyBJIHdpc2ggdGhpcyBpcyBkb2N1
bWVudGVkIHNvbWV3aGVyZS4NCg0KSSBkb24ndCBrbm93IHN1Y2ggZG9jdW1lbnQgZWl0aGVyLi4u
IEkgaGFkIHRoYXQgaW1wcmVzc2lvbiB3aGVuIEkgZGlzY3Vzc2VkIHdpdGggVU1EIHByZXZpb3Vz
bHkNCg0KDQo+IA0KPiBGb3IgTGV2ZWwwLCB0aGUgc3lzdGVtLXdpZGUgYXRvbWljcyBpcyBkZWZh
dWx0IGV4cGVjdGF0aW9uIG9ubHkgd2hlbg0KPiB0aGVyZSBpcyBLTUQgbWlncmF0aW9uIGFuZCBv
biBidWZmZXIgd2l0aCBTTUVNK0xNRU0gcGxhY2VtZW50cy4gVGhpcyBpcw0KPiBteSB1bmRlcnN0
YW5kaW5nDQo+IA0KPiBhZnRlciBsb25nIGRpc2N1c3Npb24gdGhhdCBJIGhhZCB3aXRoIE1pY2hh
bCwgTWF0dCwgYW5kIExpb25lbC4NCj4gDQo+IFRoaXMgcGF0Y2ggaXMgbmVlZGVkIGJlY2F1c2Ug
YSB2dWxrYW4gYXBwbGljYXRpb24gY2FuIGFsd2F5cyB0cnkgdG8gZG8NCj4gY3B1IGF0b21pY3PC
oCBvbiBTTUVNIG9ubHkgQk8gYW5kIHdlIGNhbid0IGFsbG93IGRldmljZSBhdG9taWNzIG9uIHRo
YXQNCj4gYnkgZGVmYXVsdC4NCj4gDQo+ID4gICAoaS5lLiBldmVuIGlmIHRoZXJlIGlzIG5vdCBh
bnkgdXNlciBzZXR0aW5ncykuIFNvIGlmIHdlIHdhbnQgdG8gaW50cm9kdWNlIEFQSSB0bw0KPiBs
ZXQgdXNlciB0byBzYXkgIm9ubHkgZGV2aWNlIGF0b21pYyBpcyBleHBlY3RlZCBvbiB0aGlzIGFs
bG9jYXRpb24iLCB0aGUgQVBJIHdvdWxkDQo+IGJlICJObyBzeXN0ZW0td2lkZSBhdG9taWNzIG9u
IHRoaXMgYWxsb2NhdGlvbiIuDQo+IEkgdGhpbmsgdGhlIGZsYWcgbmFtZSBzdWl0ZXMgd2VsbCB3
aXRoIGV4aXN0aW5nDQo+ICJaRV9NRU1PUllfQVRPTUlDX0FUVFJfRVhQX0ZMQUdfREVWSUNFX0FU
T01JQ1MiLg0KDQpZYWgsIHlvdXIgZmxhZyBtYXRjaGVzIGFib3ZlIEwwIGRlZmluaXRpb24uIA0K
DQpXaGF0IGlzIG5vdCBjbGVhciB0byBtZSBpcywgd2hhdCBpcyB0aGUgZGVmYXVsdCBiZWhhdmlv
ciBvZiBhbiBhbGxvY2F0aW9uPyBJZiB0aGUgZGVmYXVsdCBiZWhhdmlvciBpcyBzeXN0ZW0td2lk
ZSBhdG9taWNzIChtZWFucyBzaW11bHRhbmVvdXMgaG9zdCBhbmQgZGV2aWNlIGF0b21pYyBvcGVy
YXRpb25zIGFyZSBwb3NzaWJsZSksIHRoZW4gd2hhdCBpcyB0aGUgcG9pbnQgb2YgU0VUX0RFVklD
RV9BVE9NSUMuLi4gDQoNCkkgdGhpbmsgdGhlIHVBUEkgZm9ybWF0IGRlcGVuZHMgb24gdGhlIGRl
ZmF1bHQgYmVoYXZpb3I6DQoJSWYgZGVmYXVsdCBpcyBzeXN0ZW0td2lkZSBhdG9taWMsIHRoZW4g
dUFQSSBzaG91bGQgYmUgTk9fU1lTVEVNX0FUT01JQywgTk9fREVWSUNFX0FUT01JQy4uLg0KCUlm
IGRlZmF1bHQgaXMgbm8gYXRvbWljLCB0aGVuIHVBUEkgc2hvdWxkIGJlIFNFVF9ERVZJQ0VfQVRP
TUlDLCBTRVRfU1lTVEVNX0FUT01JQy4uLg0KDQpATXJvemVrLCBNaWNoYWwgY2FuIHlvdSBjb21t
ZW50Pw0KDQpPYWsNCg0KDQo+ID4NCj4gPiBTaW1pbGFybHksIHdlIGNhbiBpbnRyb2R1Y2UgQVBJ
IHRvIGxldCB1c2VyIHNheToNCj4gPiAJdGhlcmUgaXMgbm8gYXRvbWljcyBleHBlY3RlZCB0byB0
aGlzIGFsbG9jYXRpb24NCj4gPiAJbm8gZGV2aWNlIGF0b21pYyBvcg0KPiA+IAlubyBob3N0IGF0
b21pYw0KPiANCj4gV2UgY2FuIGFkZCB0aG9zZSBvbmNlIHdlIGhhdmUgc3VjaCByZXF1aXJlbWVu
dCBmcm9tIFVNRC4NCj4gDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gTmlybW95DQo+IA0KPiA+DQo+
ID4gQnV0IHRoZSBhYm92ZSBhc3N1bXB0aW9uIChhbGwgYWxsb2NhdGlvbiBieSBkZWZhdWx0IHN1
cHBvcnQgc3lzdGVtLXdpZGUNCj4gYXRvbWljcykgZG9lc24ndCB3b3JrIGZvciBkZXZpY2Ugb3Ig
aG9zdCBhbGxvY2F0aW9ucyBvbiBzb21lIHBsYXRmb3JtLCBpLmUuLCBhcw0KPiBleHBsYWluZWQg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlLi4uDQo+ID4NCj4gPiBTbyB0aGUgQVBJIGZvcm1hdCBpcyBz
dGlsbCBhbiBvcGVuIHRvIG1lLiBTaG91bGQgd2UgZGVmaW5lIHRoaW5nIHNpbWlsYXIgdG8NCj4g
dW1kIGFwaSBoZXJlOiBodHRwczovL3NwZWMub25lYXBpLmlvL2xldmVsLXplcm8vbGF0ZXN0L2Nv
cmUvYXBpLmh0bWwjemUtDQo+IG1lbW9yeS1hdG9taWMtYXR0ci1leHAtZmxhZ3MtdA0KPiA+DQo+
ID4gT2FrDQo+ID4NCj4gPg0KPiA+PiBUZXN0LXdpdGg6IDIwMjQwNDEwMTcwMDQxLjI0OTYzLTEt
bmlybW95LmRhc0BpbnRlbC5jb20NCj4gPj4gQ2M6IEJhbGFzdWJyYW1hbmkgVml2ZWthbmFuZGFu
IDxiYWxhc3VicmFtYW5pLnZpdmVrYW5hbmRhbkBpbnRlbC5jb20+DQo+ID4+IENjOiBCcmlhbiBX
ZWx0eSA8YnJpYW4ud2VsdHlAaW50ZWwuY29tPg0KPiA+PiBDYzogRmVpIFlhbmcgPGZlaS55YW5n
QGludGVsLmNvbT4NCj4gPj4gQ2M6IExpb25lbCBHIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3
ZXJsaW5AaW50ZWwuY29tPg0KPiA+PiBDYzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGlu
dGVsLmNvbT4NCj4gPj4gQ2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29t
Pg0KPiA+PiBDYzogTWljaGFsIE1yb3playA8bWljaGFsLm1yb3pla0BpbnRlbC5jb20+DQo+ID4+
IENjOiBPYWsgWmVuZyA8b2FrLnplbmdAaW50ZWwuY29tPg0KPiA+PiBDYzogVGhvbWFzIEhlbGxz
dHJfbSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+ID4+DQo+ID4+IE5pcm1v
eSBEYXMgKDMpOg0KPiA+PiAgICBkcm0veGU6IENvbnNvbGlkYXRlIHNldHRpbmcgUFRFX0FFIGlu
dG8gb25lIHBsYWNlDQo+ID4+ICAgIGRybS94ZTogQWRkIGZ1bmN0aW9uIHRvIGNoZWNrIGlmIEJP
IGhhcyBzaW5nbGUgcGxhY2VtZW50DQo+ID4+ICAgIGRybS94ZS91YXBpOiBJbnRyb2R1Y2UgVk1B
IGJpbmQgZmxhZyBmb3IgZGV2aWNlIGF0b21pY3MNCj4gPj4NCj4gPj4gICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfYm8uYyAgICAgICB8IDE0ICsrKysrKysrKysrKysrDQo+ID4+ICAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2JvLmggICAgICAgfCAgMSArDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3B0LmMgICAgICAgfCAgNCArLS0tDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zt
LmMgICAgICAgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tDQo+IC0NCj4gPj4g
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fdHlwZXMuaCB8ICAyICsrDQo+ID4+ICAgaW5jbHVk
ZS91YXBpL2RybS94ZV9kcm0uaCAgICAgICAgfCAgOSArKysrKy0tLS0NCj4gPj4gICA2IGZpbGVz
IGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiAt
LQ0KPiA+PiAyLjQyLjANCg==
