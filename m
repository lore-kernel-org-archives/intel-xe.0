Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1256CA6015
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 05:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A47310FE87;
	Fri,  9 Oct 2026 05:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TQrNOvLc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE7410E0FD;
 Fri,  9 Oct 2026 05:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791523856; x=1823059856;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fVCPBgs7UHclCePCmnNKG2b05wWoi3nBEsPFDcqQl6c=;
 b=TQrNOvLcasKyLvXTShLKg8M2QsTIbx5Ww/YK/ugn3sE0BS+WkQOCzih0
 SoOuGG46mLFsaTfReWEsFkDItga3ATWA5q8Gfzwgsl90fVtapni/SmAef
 igoPKD2C3b8/ImRr21b+D4IU0pwwhnETaOHYPGXPjpDlgkJuAf7R+zlUn
 bVQPgxTslWCeLjU/jHiQ0jCoaCrwawkqnf38RPNoI7TszubP115eaW+te
 R9b2nTHD8eNxSm66FJN4s0byptWL34S+cW8pFNY3hpsi8tRrhtqTqJMTn
 LCgypi/0lBd8nr4w+2tjlot9cPYhMnTtJRuS1lQ6RIqN5yb6yeq9KgnLm A==;
X-CSE-ConnectionGUID: X+tyRm5SRAy7XucfaEL26w==
X-CSE-MsgGUID: t7Kg3SRHQ1i2wJx7ovwlTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="345116"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="345116"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 22:30:56 -0700
X-CSE-ConnectionGUID: jaBpionwTBqIdlWYGPmPCA==
X-CSE-MsgGUID: WUqdE7YTTOqrJhLUfesQyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="549911"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 22:30:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 22:30:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 22:30:54 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.19)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 22:30:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZY0xgBWgXC0oR3Qltb1JTdhaWEgpC42/vi7LSfdLZGvUswm3qjvi705Ewk4HSl/qsJV5K9tcGhsBmGQbQ+AIfa/ipjDzO3bEdMxKeYyiYjKGCHGXkLeoGAxq9sS2mXyIKgIZU7ywzC4cZO+Vl37cs6vybNTsdJct8fA9kklXQBQ3K038SKbYCgGApon2tBhJtfouLMUXWnziYYZYk8JlTUSJb28nYvbzR3uuiNwKD2Z9v1pCcs6Sk1gDNx0SKPSvm96qHujscdSyBX2j/Qg/rSawAlrKMqOGN55O8YSE0xj65TWKrblHB5J7fe9sYFNF6jg2CBrU4YA4lFlyojOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVCPBgs7UHclCePCmnNKG2b05wWoi3nBEsPFDcqQl6c=;
 b=AEC0odg8y3Cj7IlsUVqZDRARwNQfquSCq1Qkwp0PPykdmxZdtRxJgfY9WPA8755cj58kxzju9TzN4w4TuZnVx8oOFt2S1mo2rp0MPy2ni8otfgUISikgykR7kx2fAa8vG7aBYFpClxqm1INfxQl290A81OaDbFi0UCfqfJN0hNw/Uv6GOWRoxNmw1L4mvL/1IlCAedydZmKEFdgKEnF5f87epXDz15+qxgkxMPhwqwNHw5N/eKmYXkFe/VB+tYGiSr7ZkG+P2Tm18M9W1pokkQt0c1slc4pDmyIubDs+Rd/RgGiAxtmAqfF679lU7i0LU/v2mZnzdFw2ZiQ/LSn+Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM4PR11MB6334.namprd11.prod.outlook.com (2603:10b6:8:b5::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.15; Fri, 9 Oct 2026 05:30:50 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 05:30:50 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "j@metarealtyinc.ca" <j@metarealtyinc.ca>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not
 valid for eDP
Thread-Topic: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not
 valid for eDP
Thread-Index: AQHdVjbCLSRiLaGB10Sxp/I/rx57u7b0lVGAgAAc7wA=
Date: Fri, 9 Oct 2026 05:30:49 +0000
Message-ID: <d592bde4b15a1c283f04e9412f46069f8a4926d5.camel@intel.com>
References: <20261007083443.647649-1-jouni.hogander@intel.com>
 <20261009034715.10894-1-j@metarealtyinc.ca>
In-Reply-To: <20261009034715.10894-1-j@metarealtyinc.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM4PR11MB6334:EE_
x-ms-office365-filtering-correlation-id: 12c0a443-4289-4b52-4d55-08df25c67aa4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|38070700021|56012099006|10067099003|18002099003|11063799006|4143699003|22082099003;
x-microsoft-antispam-message-info: hkqm+mBLymW8oaQz8HWrmzBzYhTFNo1ojFpv+Iz8hDkJERMGzillcroIkhoKYcC7PmUGe1A61RUkoZFinxLQ6q43Vf5AO8Ht0laIaur4Ucc1lVKdFN/HQTCZy/oIIDl/dlVLPem4NMMNdYhXSnQyZ3BxgZ908CCRyackiXtJpqyiroVLyvhlUsFiKnB/byCju5KphuWUVMoRWWQfyq39ernJJm5WtkT3NhLpJtWj7GN/hexTQKwjJjgb1XN7jJ6Q+llRGV6b7OtcJXX25FOK4FKhxL/VPTLRhSoXjv1wLhy06MRbuIJJcwR5sidG/SdFDyrn//WZkYtyLxAiuu9LGS6lckcGYqhNh9Nxd+LAA7FbXFF6jMQipQVGQAY1ST5EMKgAg/8IWhYoKEBrOISd1+BUEAEDk0B53Trp3BeS9Nq7mVcSiycr8WFCLrvswWlXMgiilhDYL7MlZ60srB0V/VRRPMOw9rZGu9m8WhELTj4QIyEMZl9rtWDfKIT3k/LsWt6J5toQTyGMHfuSmNQM5UGL9+ipgedc6hkTjErs9+ckLiGIazaglPRoc5VjFdDIhDpSr3HPaIDSZPfnBrf69giSITwyW7kAV65xFauD+0rMV+bYiKW2o/pxiIwuJtKMhIp8blnXBUiyj50TGOKkvH+AIWi4bybwjhfnEbGU7G96OkEOuLRPykhEnQyjSBQT8zziz/x1y922LDsBXYqubLNpfEFCt3S5WUrrqLmEro0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(56012099006)(10067099003)(18002099003)(11063799006)(4143699003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjY3TUJhMS9CQjk5R2Q5LzhyWm5OZ3lmOTJJeUFKVmJ4K28wbFdndXFYRzRX?=
 =?utf-8?B?ci9zQjk0WmdCUmNSL2xEbVRCbFlvNlYyUFJrVit5eG9TWU0za3dGTThEc29S?=
 =?utf-8?B?RUE2alkvUTRUVzJTdnZqTmZDSGRRQmZCVXpGc3lqdlN5akhGUThoN1FKYldv?=
 =?utf-8?B?allkSGVNN3l1M0cwUWRGMUtNU2F1dUhmdXNFMG9XL2h6M0hRRTBIRzBOODBH?=
 =?utf-8?B?RUlibFl2SW5uRlV0WEZIOTdZd21LaDlscE16K2huZ0lhcUNIU1VpQmRCWU00?=
 =?utf-8?B?cFNDTU00dGdKNHc1dUthNmtKeXZGR0trM3hKWGlJTFpPeTF6Y2o4RmFwcWZC?=
 =?utf-8?B?M3MxTWFWWHBEcGtnNEE1UTJFSThocFM1K2k1SEZmd2R5cm9BblNqbncwdlFQ?=
 =?utf-8?B?cVBZbWFDWHlCczJjOGdMd2gyVFdremxndUIxTXhNUTZQTVdSenI4V3JyNitC?=
 =?utf-8?B?Wk5OZGF6VUdkYzI4ckNtVWVlYWdnSFlCSzVLRTRTVmxhaWJoRlBqN21qRGNr?=
 =?utf-8?B?dDA5QU5SL00zTDZzUThCdVp3bG01TVd5MVVZYUhtbEdqc3VoRGhvZWFOTzF4?=
 =?utf-8?B?MFJaa3JBbkp2UGVsZzh4MTMzcEZSalVmTFZnNEU3NnEzRTYyOGpIRDN2RDNw?=
 =?utf-8?B?MGZwTGp5MUhaNGZjb2FkVm8wd0I0ekpSRThjdnRnWEl6ODFNUlRyanE5d29Z?=
 =?utf-8?B?RE8raWF6RDVwWEY2czRsZGdlK2QyVFc5MHlVNFNmOTh5d0wwYTNxckhLQkgw?=
 =?utf-8?B?aWNaVkNnK1YxU2Z5bjFFcHBKNXM0OUY4VkV3RzUwN3hXb1lnOGJST1Q4cEJF?=
 =?utf-8?B?OEMrZ3NNdDcrdjdWQ1laS1NGNFVkY2R6bzBGd2tlWFlQanpZaDAyOUtDQkxr?=
 =?utf-8?B?Wk5JSGtTWmJsVUlwU1lNcFlUZFlTZ2VEYlZydWQ2LzBOSnp2bzRoRFFBbi9E?=
 =?utf-8?B?Y2tjcFI4VzZ4TlE5ZGVHTDFhQm1tbk1JY0tMK2w5RVllQUFvalVRVEtnUkF6?=
 =?utf-8?B?VUo2UG4vMmlpNEZadVR6ODRzSTFDdmw3NXBMaHBQN01wUlhNMjM0N2hYekFp?=
 =?utf-8?B?djh5di8wNEFja1h0WWNLQjBsQjZkTFk1THlIUlMvbSt3L0NRbFZhNWxuL0E2?=
 =?utf-8?B?RythTXVkd051TzFhellsNkoyejd0SVpsU2VkaFp2Wk84RGRGRVJkZGJVZEs0?=
 =?utf-8?B?cm5KdWZCNXY4MzRYdUVrcVFIMHQ2d1gvS0lUV1BPb3oyQ0pvb1phbHhCNUs2?=
 =?utf-8?B?RVg3MXoxaVFudnhRSDlic25TVVE5Z2NVMXVWU3FkWW9TMHFKMnQxbERuMlpv?=
 =?utf-8?B?TUlmSmxzY1ZhWnQxQThVQnhoVkJobFRQZk9lcUJKOTN5NXVjUHBZT3BDQVNC?=
 =?utf-8?B?cEdHaXh3KytpMkRQcHV3S0NRQU1BTWdkR0dHZGkwNUNocHUzQmhXcTltNmhq?=
 =?utf-8?B?WTFFQVhZREpvTTVzL1c4U1hpZzdua2RPV0psODdKekNldEFXZk1wVkJDRUVs?=
 =?utf-8?B?b0FsdXFOSVVJUTZLd1RDVk1HWnU5N2MxRVZCdGhjZ3l0dEI5K0d6c1kxY0JE?=
 =?utf-8?B?RkZISzlncTZPcmJhamtJVERONWo0K2JXdFo5WlZsdnNKWGNGa0V3SG9GdnZr?=
 =?utf-8?B?dUpGMTR3S0w0dklCa3hXd3VaNWV5eTNGTkhxMVB4MGdYT0tFQUxoaGtlVlZI?=
 =?utf-8?B?cG5qdU5Gak5DNlFGendIMjBFQVhOSjM3UktXZmxwVGRmazhzREV3RmRNVCts?=
 =?utf-8?B?d2xHOUZ1aFlJMDRRWFZUY251T2JBd0UrbzVQMjI1NW1TMVdxVlJTamh6MDlM?=
 =?utf-8?B?TzRZeExFZDBKU1ZoUEhCeTRYQmxMa0lrQXlBSG9Xc1lRRDIrMm5VOUIzVHNL?=
 =?utf-8?B?ejZkajNKUnh0cEY5M0p1M2lOcEhJRHZoMFMwSEF2czVvTUdMcUtIZDdsM1Nm?=
 =?utf-8?B?OWFCZlgvTlhpZ0dPZVdZSU1sN0JXcWowSXVJY3RqVExqSjFqc0ozZGV0VG5Y?=
 =?utf-8?B?OERSMUprRXBGMFZ5SmRNdGhqcTdWNDcxOEtMYVZYU0N4RlVUbHpXUkd1d0RV?=
 =?utf-8?B?SC9CTVl5a3VSYWJGTUNtWVZFOGZzeFkzMzdmRjN5c2Y5MnNZdHJMckRBWjEr?=
 =?utf-8?B?S003WnFZRUY1akdVSUluRjJuQk1zMWhwSTQxM1pCR1NXRnJ1QXlWK1NLYlZa?=
 =?utf-8?B?ZzNRMUhENVNxa3dZWC9Gd3JlWGlTLzBOTWEwODRXa2tJa3pER1AxcUxXWURl?=
 =?utf-8?B?NTl0NjZkaWRuNTlpL3czcXFVYnVDeGZNNHVudEc0bDRuc3dBUENweTkzUVhs?=
 =?utf-8?B?eDVUTU52SmQrNklWekRtVVljTTRZMEVqcEkrd0J2QU04RnFzaTY0eGd3Y1Rp?=
 =?utf-8?Q?OG/D34drf3+5xiJY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5475875328B62C44BD52A60931F51A98@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vgnuF6YgpJG1gOMO4Ds3f7JG2YQLSnVMP4GXDZcFCEvfG/knSsWUGD6X3UEX+nDK2oxzy9srlJc7SEsNQ40NGC+fPOdRcqpaL2IkABo46paqkJLulejqlTjV0hX4vSE8b9L8o+2XmLKK1SnmSB6HsCMd/nOkld+FnwlPKKTKnlEL6L2ZHoIX2CERifzMCLn+IhDLIgqWwcD8jMd7MM5nz7OZ72mrh/UO9kDD47o437reD+ccJ9uqXscsiOsDGWkkcc/h+gqtZA5wOsyfRNwG/X4hhw7M17p5Bj2+cxt+gch5PPT0QUgq7FyIOd7eEo6dZEAn0x7Df/GDlpf6k+gqrg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c0a443-4289-4b52-4d55-08df25c67aa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 05:30:50.0630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K2eg9TPBVxk26pQB0HaX27lZDff/4eQipmvF4iQeFfvDzwHgDIt5vcXOTepTNo06B5ZLjbRvgiMlGhtI4qQisteC6A6/tJHAHI85V61zhQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6334
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

T24gVGh1LCAyMDI2LTEwLTA4IGF0IDIzOjQ3IC0wNDAwLCBKYWtlIFN0ZWlubWFuIHdyb3RlOg0K
PiBIaSBKb3VuaSwNCj4gDQo+IFRlc3RlZCBvbiB0aGUgWFBTIDE2IERBMTYyNjAgKFBUTCwgeGUs
IDcuMy1yYzUsIERBMTYyNjAgUFIgcXVpcmsNCj4gcmVtb3ZlZCwgbm8gb3RoZXIgY2hhbmdlcyk6
IFBhbmVsIFJlcGxheSBTVSBpcyBzbW9vdGggd2l0aCB0aGlzDQo+IHBhdGNoLg0KPiANCj4gVGVz
dGVkLWJ5OiBKYWtlIFN0ZWlubWFuIDxqQG1ldGFyZWFsdHlpbmMuY2E+DQo+IA0KPiBUd28gdGhp
bmdzIGl0IGxlYXZlczoNCj4gDQo+IC0gVGhlIHBhbmVsIHN0aWxsIGp1ZGRlcnMgZm9yIGEgZmV3
IHNlY29uZHMgYWZ0ZXIgcGFuZWwgcG93ZXItb24NCj4gwqAgKERQTVMgb24pLiBIb2xkaW5nIFBS
IGluYWN0aXZlIGFmdGVyIHBvd2VyLW9uIGZpeGVzIHRoYXQgaGVyZTsgOCBzDQo+IMKgIGlzIGNs
ZWFuLCAzIHMgaXMgbm90IHF1aXRlIGVub3VnaC4NCj4gDQo+IC0gTm8gREM1IG9uIGEgc3RhdGlj
IHNjcmVlbiB3aGlsZSBQUiBpcyBhY3RpdmU6IDAgZW50cmllcyBhZ2FpbnN0IDU1MA0KPiDCoCBv
biBhIHN0YXRpYyBWVCB3aXRoIHRoZSBBUyBTRFAgc3VzcGVuZGVkLg0KPiANCj4gU2luY2UgdGhp
cyBwYW5lbCBuZWVkcyBhIHNwZWNpZmljIGNoYW5nZSBmb3IgdGhlIGZpcnN0IG9uZSBhbnl3YXks
DQo+IGNvdWxkIHRoZSBBUyBTRFAgYWxzbyBiZSBzdXNwZW5kZWQgd2hpbGUgdmJsYW5rIGlzIGRp
c2FibGVkIG9uIHBhbmVscw0KPiB0aGF0IGhhbmRsZSBpdCwgYXMgaW4gdGhlIFJGQz8gVGhhdCBr
ZWVwcyBEQzUvREM2IG9uIGEgc3RhdGljIHNjcmVlbi4NCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI2MTAwNjIyMDUwMC4zNDE3NTcyLTEtakBtZXRhcmVhbHR5aW5jLmNhDQoNCkkgZG9u
J3QgcmVhbGx5IHNlZSB3aHkgd2Ugc2hvdWxkIGJpbmQgaXQgdG8gdmJsYW5rLiBJIHRoaW5rIHZi
bGFuayBpcw0KYWxzbyBkaXNhYmxlZCBtb3N0IG9mIHRoZSB0aW1lcyBhbnl3YXlzIHdoZXJlIHdl
IGNvdWxkIGJlbmVmaXQgZnJvbQ0KaGF2aW5nIEFTIFNEUCBkaXNhYmxlZC4NCj4gDQo+IElmIHlv
dSByZXNwaW4sIGEgUmVwb3J0ZWQtYnkgd291bGQgYmUgYXBwcmVjaWF0ZWQuDQoNCk9mIGNvdXJz
ZS4gSSBhbHJlYWR5IGFkZGVkIGl0LCBidXQgbXkgY2hlY2twYXRjaCBjb21wbGFpbmVkIGFib3V0
DQptaXNzaW5nwqBDbG9zZXMgdGFnLiBJIHdhc24ndCBzdXJlIGlmIHRoaXMgcGF0Y2ggaXMgY2xv
c2luZyBhbnkgZ2l0bGFiDQp0aWNrZXQuIEkgd2FzIHRoaW5raW5nIGFkZGluZyB0aGVtIGJvdGgg
d2hlbiB0ZXN0ZWQuDQoNCkkgc3RpbGwgbmVlZCB0byBtb2RpZnkgYWxzbyB0aGUgY29tbWl0IG1l
c3NhZ2UgYW5kIGNvbnNpZGVyIGV2ZW4gdXNpbmcNCnRoZSBjaGFuZ2UuIGVEUCBzcGVjIGlzIHNh
eWluZyB0aGF0IEFTIFNEUCBjYW4gYmUgZGlzYWJsZWQ6DQoNCiJUaGUgU291cmNlIGRldmljZSBt
YXkgZGlzYWJsZSB0aGUgQWRhcHRpdmUtU3luYyBTRFAgdHJhbnNtaXNzaW9uIGJ5DQpzZXR0aW5n
IGl0cyBBZGFwdGl2ZSBTeW5jIFNEUCBUcmFuc21pc3Npb24gRGlzYWJsZSBpbiBQUiBBY3RpdmUg
U3RhdGUNCmJpdCAoREIwWzJdID0gMSkgaW4gdGhlIEFkYXB0aXZlLVN5bmMgU0RQLiBEUENEIDAw
MTA3aFs2XSBzaGFsbCByZW1haW4NCnNldCAoRFBDRCAwMDEwN2hbNl0gPSAxKS4iDQoNCkV2ZW4g
aWYgImNydGNfc3RhdGUtPmRpc2FibGVfYXNfc2RwX3doZW5fcHJfYWN0aXZlID09IDEiIGl0IHNo
b3VsZCBiZQ0Kb2sgdG8gZGlzYWJsZSBBUyBTRFAgc2VuZGluZyAocmVmZXJyaW5nIHlvdSBSRkMg
cGF0Y2gpLiBJJ2xsIGd1ZXNzDQpoYXZpbmcgaW52ZXJzZSBsb2dpYyBpbiBBU1lOQ19WSURFT19U
SU1JTkdfTk9UX1NVUFBPUlRFRF9JTl9QUiBtZWFucw0KZURQIHNpbmsgc2hvdWxkIGFsd2F5cyBz
dXBwb3J0IGl0Lg0KDQoNCkJSLA0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gDQo+IFRoYW5rcywNCj4g
SmFrZQ0KDQo=
