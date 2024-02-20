Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E70C5475B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 14:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42ED610E423;
	Tue, 20 Feb 2024 14:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="klJRBucO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72AE10E423
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 14:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708437672; x=1739973672;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=kRImcdXwZqY87WhlyBjLb8gctdCWGHXvDFQImGf7CFI=;
 b=klJRBucOAZ5w/ypMS9478wGkhtVwEXQN9ILa4qUT5US4xTYycNM+Qjv5
 NHDplA3UrWvEBTyDw5q2IVxW2kZq0zbDkxVzyuSaX/GAxL+q6dyyjmbV/
 HAHbYTY3DaZ6tekXjY3VeUBfOO1DHg/WQgwNizcREEUxQmx6OVEU0Lynq
 lb0qo9IdjDSdQfHqGHstx/Hll8cBmMjaAzNU/VuvhOzC5ui+++HhptBuo
 QUQK2Zr3fuo9nah95EH9c89HoW7w94TABzKCp8E8a3mIyAkPB3wgZM57p
 h+mPwb9dt/LCujeliKcs/EGNFHiAfLY+WKEqN40Buyg8n+wSOFGDgvH99 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2683930"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2683930"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 06:01:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="42281309"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 06:01:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 06:01:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 06:01:10 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 06:01:10 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 06:01:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lmwik4G9/O3V917v9ISysbjsU8vMAaZVrBHOW92oHvNOG3D9WDg++yPprM0KKKqvVVxLOykkbXoWw5JttagFb3cn1OCV0zsmtjNDj2ba6G+6XmL26FofGBUQ8Eug8LK5RxG97jOxkkRYY82MtFqaHH9b2cHyhAiDdgapiN/dl/W8xf9w9trcIRBkpsV1IteU/Kk9Ua+YrdQouFpvw86rXTegpzjlCymrZQdf+3ivqt+o66W7CMofh7oBNe077g7XY2XFhSqS3dMPilM1i3DyN/LEwJ9SB821NIcsUowYSLkaA5A3KnVF47uR6/lAPaj98rmZy4QgYrLNP5IWOTGevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRImcdXwZqY87WhlyBjLb8gctdCWGHXvDFQImGf7CFI=;
 b=GgQv7VyXifQQKmXSPd2Y8dIJsIqLqDXfgF2DExMbA8TUMeaQOnkTPOYd3Aes+pIfPs+msvCdq7Qu/J8YFmaEu5ADNavP0hYiw834jjlnaJAEoN6m7xa19UI6kvBMxLCeYPfVHWY+RJ7RqDx66xK669Oh209sRbQ34PKNUU6Gzcp+IBpTkyEYo4eV0LQG1rziBqdsrrWOmgMS1NDj0f6w965tmI5VFElJT1aHVFDs6XR+OXN0eyxvpPgo3r/cW2kO08AJGuoUK65YxKimwYPNAwc3T+U6RxTpqjC08wxhUFZz2QA7O03sEhlsJ56e6AB55qlPhbaE8PtiCOPmQFe9IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH8PR11MB8061.namprd11.prod.outlook.com (2603:10b6:510:250::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 14:01:06 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::9333:bdda:e42a:a662]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::9333:bdda:e42a:a662%5]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 14:01:06 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v4 4/4] drm/xe: Implement VM snapshot support for BO's and
 userptr
Thread-Topic: [PATCH v4 4/4] drm/xe: Implement VM snapshot support for BO's
 and userptr
Thread-Index: AQHaXoxcGsiKAzT4WEOZHcIFQ8Fc+rENQlOAgAYEOYCAAAbWgA==
Date: Tue, 20 Feb 2024 14:01:05 +0000
Message-ID: <74292cd44b0c68c66ac402474130b0519e97caf8.camel@intel.com>
References: <20240213145239.359679-1-maarten.lankhorst@linux.intel.com>
 <20240213145239.359679-4-maarten.lankhorst@linux.intel.com>
 <7886cf58fbe2a6aa2f25f079ecd6c676e5b81d79.camel@intel.com>
 <9b60604a-d703-48d6-b69d-4d9058ceaf5b@linux.intel.com>
In-Reply-To: <9b60604a-d703-48d6-b69d-4d9058ceaf5b@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH8PR11MB8061:EE_
x-ms-office365-filtering-correlation-id: 4e8875aa-97d9-494b-5fcb-08dc321c61ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2q3hKnwQKkyFMn5u622mgtJK3JH5pfam4wHD74yLb8kELLA5egAlpsRglg+wig7pRbCS32BPrcxBgGJVQH4lCosmVvVBCn3z5xXPU7DCJAPwPq5ie0mT2BIlrbrcbh90Ul+Y5f2wwB//HSKsMi0RWwCs0DIJZ2upUeoe2Kek/Abop6Vi/EdT+Q1pvum6qAu80HHZbJAncMunqR8zvqy1u7OG2wnXYMD9bl9Apl8xltvlCffUTQS3IsB9i4rnkVMi/PMHfF3ZiKT7WHlTbaEwRwTwKaGl0YTvtuZjus8oBleMMmaKaTJu2jy9CqICWzJlO+PFd/AAgo3G0tp1rqU5L8Sxv2Q8WNxIOae8Uh1ByP+z98zScvgNAiVXhXFeh122Mhqkd7sJCc3BrpuCy7XdOaL9Hdc9KphwAGasn7tZm7WoclxHjPNyFsQP/u6fTtCdDAg61kvqY2L8RYd3SFhfXo1pZQTjBXBL9ttfq6h1jMDzYum+XXM50+0jZs5C2zzCa09kS1PIPnVSP6CaWXQZM+XoLV5u99Fu/MxJqaxK8eLx+YOgmRnwG/KRKhXIQXRPGz7qLJblsfF5HNAfr8/JkqkjkvGtnZHGIrFWaP5tjy9pzy73UrkVMCZv2lANbexb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDVyZmV0dDB2Qy96Z1czc3J3cmYxbnVuMnR3dmVPenJHZ1JtME9GLzNDYkVr?=
 =?utf-8?B?dEVoUEw2RGJjZWliWk9VT0J4bVdvcys0UWxRTzJXa3pvRUxmL08xL05HejZH?=
 =?utf-8?B?WmROWERVYUkzL2xDR2hCT2ljL1dtSmpWK2lxYnAzb1EzWWQ0SUV5dW5HczdR?=
 =?utf-8?B?V2NlSXJYWDlvNGh2WEJEL1Rkb3d3RzM3UXA5ejMybmt4L09BSTRlODZHR1Ba?=
 =?utf-8?B?L1lLNEh3eW53V3FFb3hiaDFrQk1ROWZtUlBES2FmN0J5b05ITy90NTgzc2Vz?=
 =?utf-8?B?eHFYSEczclJWOFFvTUtodTFCS3lmTGY1M0tSbFZiaUl2L0ZDakd1L0FuUXVw?=
 =?utf-8?B?bFBOK3pRY3pERVZDL1o3V2hTU0UvVC9vTzNQUEV6YlFrd05rOW9VTHNwajU0?=
 =?utf-8?B?YlZDdC8zSnVjOTh2UU8vVlZDV05XWmc1RXJrNlRkNWlLY3pVQ3hIcW13K1hO?=
 =?utf-8?B?dGk2SGhjOGpJNzd3TERMUklLQnluaHJER0hjTjRpeWxLMmJrTU51eFllOHpU?=
 =?utf-8?B?OFV1V1JLYTZaTzNEaWZuSFlXWm56Y2ZtK0IwVHJUay9zVHhCTG9xSDVpd25F?=
 =?utf-8?B?TjRENXJXMkZ6a0JReGVZMVhJSzgwQ0NlcTJpdWM4ek1mVi9PZ1JXOW9yOHJX?=
 =?utf-8?B?NFlsdUhwZWk3SUt6UDRpek5UeUVkZHFFcTBXdHVIdGgrQ3VRR1M2dmQrUVQ2?=
 =?utf-8?B?cmFHd1NnTUp0RVNiTTloMTVQaUNkSlJMcUxBaUx0UXRvL3JnMms2YWZOVFBl?=
 =?utf-8?B?WWlQUmRZRi9ZUldEU2pKdWZPcVh6ekl0K0Q5VHZrRjJYZVdJUTJCVmJjM09m?=
 =?utf-8?B?K0pNOTRPaWIwTHhyT0lwN2NCVkQzdktweWNGdk1YTGQvZUhJTitPZUJ1R1oz?=
 =?utf-8?B?YitCVVg0SEgvd3QxRHJDUFdSb2QxQnZ1alpDQ0h2NnQxc2pDc0xZQ3QvYTlI?=
 =?utf-8?B?eE51dG16OUs0ZUJ2YUkwcnNienpSTDh6K09INll0YWIrbll3MUZ3d2tJbGpw?=
 =?utf-8?B?YjBFUWd4UGhXL3FESFBtcmp5UXI2OWVCc25xdmRMbWF0ZGg2K1JkQ0hxUG1v?=
 =?utf-8?B?T0RocFdqc1VoK2VXY0RuR0lPYXo3VzlsS0NJOW13d051clNmb0Z4TzhOdkpK?=
 =?utf-8?B?U1BZZGdDVW90NlZoOEEzWGM3T3FrNVQwWUwvS2x2VEo0N1EvNXVENVNaMEVt?=
 =?utf-8?B?Z2lqZ3JsNktrcGNQR3ViRUJmWThNbVIwcEFoRE1XY24zMm01cUhIeWpEQVhO?=
 =?utf-8?B?TVlxK0E0akVKbDBHV0tQQVlrMXdYUDBrdW5OcWREN281cEZtWDB3eHAzaG9G?=
 =?utf-8?B?ZEI4UXZzN3UyT0ZjNjI4R0RhR2NYUm1VclJVZ3AvOTYrRXNnbC9HRkV5c0Rt?=
 =?utf-8?B?Y3ExTnd2WG5CRUM4SmRjSTEyekIzYzBWWTdUZHl4ZzhkNXBmemNOQUF5b0Fi?=
 =?utf-8?B?bzh4TTNRd3FNWS94N1FYMGYzNUc5V0FndFY4dEdCMFdHTjhrdFo4ODJFRDc3?=
 =?utf-8?B?MmtHSThMUVliT2NsMXM4S1c4M1RUVDdFSXByek00VUZZTjJTblkwWnVmdzhv?=
 =?utf-8?B?YU1QNTM1RlFLemM0R1dxMEhVdXBEc1lQbEZkczZlRklaNUdKdW14SnNray9w?=
 =?utf-8?B?Nm1lbnZ4cDFmLzRtd2lJKzd5UU9LVXpvZmhmblozamIzUjl4bVJXdEdBS2V0?=
 =?utf-8?B?RDFNU1lZS25GYjlYcFFlemNEY1NaWlhDZExMM3JzaHh4dXBUVWl3Vk03TU8y?=
 =?utf-8?B?eGNvTm5XSkc0WmNlTVVyMG1qWGlvM0tpN3FORjJHUUV2M2dMdW5ncTYzcWR5?=
 =?utf-8?B?SkdKQW9RV0VrODZ6MzZ1TWZ2cHFmNkR2TUg0Q1g2WnlMY3hjWkVNNGZUcEdI?=
 =?utf-8?B?bjg1bkRDUFBBM3ZTTDdKYTRoNzIyQ0tBL3dZZ2xTM2JtRTErelZKa01naWRh?=
 =?utf-8?B?TGdtdXN2RXJnOWlWMVVPSXBxcVhhOWYyejhuN05KZUVub0NxY2R5Y0ZpYnFr?=
 =?utf-8?B?eUIzRE5qR240V011by9wQzdWSnU0amF3TWxnOEN2V1lRbnY4eVp1UmhBOW9y?=
 =?utf-8?B?N0ZqWi9JSE5qVy90Y2V6RkdkVFJUTENFdlBVaDhnaGJvd2sxRy9lRE5zVk1K?=
 =?utf-8?B?eTVWbEJETFpQMXlWd01yYmxCWmZ3eFVjZmJLYTh4WjlVdjQ0ZTNKS3BUWWJi?=
 =?utf-8?B?UHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B0D8BB0A16C6A4CBF46380BEA794300@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8875aa-97d9-494b-5fcb-08dc321c61ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 14:01:05.8593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s1gqhPNfrRT2QexztaPrUdLwHidNX4wU6iRZIkgiORawnQk+mgF3nDSAC9SyVs0g0XH+r+5ymyu3pgpF9r+vHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
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

T24gVHVlLCAyMDI0LTAyLTIwIGF0IDE0OjM2ICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gDQo+IE9uIDIwMjQtMDItMTYgMTg6NDMsIFNvdXphLCBKb3NlIHdyb3RlOg0KPiA+IE9u
IFR1ZSwgMjAyNC0wMi0xMyBhdCAxNTo1MiArMDEwMCwgTWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6
DQo+ID4gPiBTaW5jZSB3ZSBjYW5ub3QgaW1tZWRpYXRlbHkgY2FwdHVyZSB0aGUgQk8ncyBhbmQg
dXNlcnB0ciwgcGVyZm9ybSBpdCBpbg0KPiA+ID4gMiBzdGFnZXMuIFRoZSBpbW1lZGlhdGUgc3Rh
Z2UgdGFrZXMgYSByZWZlcmVuY2UgdG8gZWFjaCBCTyBhbmQgdXNlcnB0ciwNCj4gPiA+IHdoaWxl
IGEgZGVsYXllZCB3b3JrZXIgY2FwdHVyZXMgdGhlIGNvbnRlbnRzIGFuZCB0aGVuIGZyZWVzIHRo
ZQ0KPiA+ID4gcmVmZXJlbmNlLg0KPiA+ID4gDQo+ID4gPiBUaGlzIGlzIHJlcXVpcmVkIGJlY2F1
c2UgaW4gc2lnbmFsaW5nIGNvbnRleHQsIG5vIGxvY2tzIGNhbiBiZSB0YWtlbiwgbm8NCj4gPiA+
IG1lbW9yeSBjYW4gYmUgYWxsb2NhdGVkLCBhbmQgbm8gd2FpdHMgb24gdXNlcnNwYWNlIGNhbiBi
ZSBwZXJmb3JtZWQuDQo+ID4gPiANCj4gPiA+IFdpdGggdGhlIGRlbGF5ZWQgd29ya2VyLCBhbGwg
b2YgdGhpcyBjYW4gYmUgcGVyZm9ybWVkIHZlcnkgZWFzaWx5LA0KPiA+ID4gd2l0aG91dCBoYXZp
bmcgdG8gcmVzb3J0IHRvIGhhY2tzLg0KPiA+ID4gDQo+ID4gPiBDaGFuZ2VzIHNpbmNlIHYxOg0K
PiA+ID4gLSBGaXggY3Jhc2ggb24gTlVMTCBjYXB0dXJlZCB2bS4NCj4gPiA+IC0gVXNlIGFzY2lp
ODVfZW5jb2RlIHRvIGNhcHR1cmUgQk8gY29udGVudHMgYW5kIHNhdmUgc29tZSBzcGFjZS4NCj4g
PiA+IC0gQWRkIGxlbmd0aCB0byBjb3JlZHVtcCBvdXRwdXQgZm9yIGVhY2ggY2FwdHVyZWQgYXJl
YS4NCj4gPiA+IENoYW5nZXMgc2luY2UgdjI6DQo+ID4gPiAtIER1bXAgZWFjaCBtYXBwaW5nIG9u
IHRoZWlyIG93biBsaW5lLCB0byBzaW1wbGlmeSB0b29saW5nLg0KPiA+ID4gLSBGaXggbnVsbCBw
b2ludGVyIGRlcmVmIGluIHhlX3ZtX3NuYXBzaG90X2ZyZWUuDQo+ID4gPiBDaGFuZ2VzIHNpbmNl
IHYzOg0KPiA+ID4gLSBEb24ndCBhZGQgdW5pbml0aWFsaXplZCB2YWx1ZSB0byBzbmFwLT5vZnMu
IChTb3V6YSkNCj4gPiA+IC0gVXNlIGtlcm5lbCB0eXBlcyBmb3IgdTMyIGFuZCB1NjQuDQo+ID4g
PiAtIE1vdmUgc25hcF9tdXRleCBkZXN0cnVjdGlvbiB0byBmaW5hbCB2bSBkZXN0cnVjdGlvbi4g
KFNvdXphKQ0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jICAgICAgIHwgIDMzICsrKystDQo+ID4g
PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcF90eXBlcy5oIHwgICA4ICsNCj4g
PiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgICAgICAgICAgICAgICAgfCAxNjkgKysr
KysrKysrKysrKysrKysrKysrLQ0KPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uaCAg
ICAgICAgICAgICAgICB8ICAgNSArDQo+ID4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgMjExIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZXZjb3JlZHVtcC5jDQo+ID4gPiBpbmRleCAwOGQzZjZjYjcyMjkyLi4zZTg2M2U1MWI5ZDRkIDEw
MDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMNCj4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jDQo+ID4gPiBAQCAt
MTcsNiArMTcsNyBAQA0KPiA+ID4gICAjaW5jbHVkZSAieGVfZ3VjX3N1Ym1pdC5oIg0KPiA+ID4g
ICAjaW5jbHVkZSAieGVfaHdfZW5naW5lLmgiDQo+ID4gPiAgICNpbmNsdWRlICJ4ZV9zY2hlZF9q
b2IuaCINCj4gPiA+ICsjaW5jbHVkZSAieGVfdm0uaCINCj4gPiA+ICAgDQo+ID4gPiAgIC8qKg0K
PiA+ID4gICAgKiBET0M6IFhlIGRldmljZSBjb3JlZHVtcA0KPiA+ID4gQEAgLTU5LDEyICs2MCwy
MiBAQCBzdGF0aWMgc3RydWN0IHhlX2d1YyAqZXhlY19xdWV1ZV90b19ndWMoc3RydWN0IHhlX2V4
ZWNfcXVldWUgKnEpDQo+ID4gPiAgIAlyZXR1cm4gJnEtPmd0LT51Yy5ndWM7DQo+ID4gPiAgIH0N
Cj4gPiA+ICAgDQo+ID4gPiArc3RhdGljIHZvaWQgeGVfZGV2Y29yZWR1bXBfZGVmZXJyZWRfc25h
cF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCj4gPiA+ICt7DQo+ID4gPiArCXN0cnVj
dCB4ZV9kZXZjb3JlZHVtcF9zbmFwc2hvdCAqc3MgPSBjb250YWluZXJfb2Yod29yaywgdHlwZW9m
KCpzcyksIHdvcmspOw0KPiA+ID4gKw0KPiA+ID4gKwl4ZV9mb3JjZV93YWtlX2dldChndF90b19m
dyhzcy0+Z3QpLCBYRV9GT1JDRVdBS0VfQUxMKTsNCj4gPiA+ICsJaWYgKHNzLT52bSkNCj4gPiA+
ICsJCXhlX3ZtX3NuYXBzaG90X2NhcHR1cmVfZGVsYXllZChzcy0+dm0pOw0KPiA+ID4gKwl4ZV9m
b3JjZV93YWtlX3B1dChndF90b19mdyhzcy0+Z3QpLCBYRV9GT1JDRVdBS0VfQUxMKTsNCj4gPiA+
ICt9DQo+ID4gPiArDQo+ID4gPiAgIHN0YXRpYyBzc2l6ZV90IHhlX2RldmNvcmVkdW1wX3JlYWQo
Y2hhciAqYnVmZmVyLCBsb2ZmX3Qgb2Zmc2V0LA0KPiA+ID4gICAJCQkJICAgc2l6ZV90IGNvdW50
LCB2b2lkICpkYXRhLCBzaXplX3QgZGF0YWxlbikNCj4gPiA+ICAgew0KPiA+ID4gICAJc3RydWN0
IHhlX2RldmNvcmVkdW1wICpjb3JlZHVtcCA9IGRhdGE7DQo+ID4gPiAgIAlzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSA9IGNvcmVkdW1wX3RvX3hlKGNvcmVkdW1wKTsNCj4gPiA+IC0Jc3RydWN0IHhlX2Rl
dmNvcmVkdW1wX3NuYXBzaG90ICpzczsNCj4gPiA+ICsJc3RydWN0IHhlX2RldmNvcmVkdW1wX3Nu
YXBzaG90ICpzcyA9ICZjb3JlZHVtcC0+c25hcHNob3Q7DQo+ID4gPiAgIAlzdHJ1Y3QgZHJtX3By
aW50ZXIgcDsNCj4gPiA+ICAgCXN0cnVjdCBkcm1fcHJpbnRfaXRlcmF0b3IgaXRlcjsNCj4gPiA+
ICAgCXN0cnVjdCB0aW1lc3BlYzY0IHRzOw0KPiA+ID4gQEAgLTc0LDEyICs4NSwxNCBAQCBzdGF0
aWMgc3NpemVfdCB4ZV9kZXZjb3JlZHVtcF9yZWFkKGNoYXIgKmJ1ZmZlciwgbG9mZl90IG9mZnNl
dCwNCj4gPiA+ICAgCWlmICghZGF0YSB8fCAhY29yZWR1bXBfdG9feGUoY29yZWR1bXApKQ0KPiA+
ID4gICAJCXJldHVybiAtRU5PREVWOw0KPiA+ID4gICANCj4gPiA+ICsJLyogRW5zdXJlIGRlbGF5
ZWQgd29yayBpcyBjYXB0dXJlZCBiZWZvcmUgY29udGludWluZyAqLw0KPiA+ID4gKwlmbHVzaF93
b3JrKCZzcy0+d29yayk7DQo+ID4gPiArDQo+ID4gPiAgIAlpdGVyLmRhdGEgPSBidWZmZXI7DQo+
ID4gPiAgIAlpdGVyLm9mZnNldCA9IDA7DQo+ID4gPiAgIAlpdGVyLnN0YXJ0ID0gb2Zmc2V0Ow0K
PiA+ID4gICAJaXRlci5yZW1haW4gPSBjb3VudDsNCj4gPiA+ICAgDQo+ID4gPiAtCXNzID0gJmNv
cmVkdW1wLT5zbmFwc2hvdDsNCj4gPiA+ICAgCXAgPSBkcm1fY29yZWR1bXBfcHJpbnRlcigmaXRl
cik7DQo+ID4gPiAgIA0KPiA+ID4gICAJZHJtX3ByaW50ZigmcCwgIioqKiogWGUgRGV2aWNlIENv
cmVkdW1wICoqKipcbiIpOw0KPiA+ID4gQEAgLTEwNCw2ICsxMTcsMTAgQEAgc3RhdGljIHNzaXpl
X3QgeGVfZGV2Y29yZWR1bXBfcmVhZChjaGFyICpidWZmZXIsIGxvZmZfdCBvZmZzZXQsDQo+ID4g
PiAgIAkJaWYgKGNvcmVkdW1wLT5zbmFwc2hvdC5od2VbaV0pDQo+ID4gPiAgIAkJCXhlX2h3X2Vu
Z2luZV9zbmFwc2hvdF9wcmludChjb3JlZHVtcC0+c25hcHNob3QuaHdlW2ldLA0KPiA+ID4gICAJ
CQkJCQkgICAgJnApOw0KPiA+ID4gKwlpZiAoY29yZWR1bXAtPnNuYXBzaG90LnZtKSB7DQo+ID4g
PiArCQlkcm1fcHJpbnRmKCZwLCAiXG4qKioqIFZNIHN0YXRlICoqKipcbiIpOw0KPiA+ID4gKwkJ
eGVfdm1fc25hcHNob3RfcHJpbnQoY29yZWR1bXAtPnNuYXBzaG90LnZtLCAmcCk7DQo+ID4gPiAr
CX0NCj4gPiA+ICAgDQo+ID4gPiAgIAlyZXR1cm4gY291bnQgLSBpdGVyLnJlbWFpbjsNCj4gPiA+
ICAgfQ0KPiA+ID4gQEAgLTExNywxMiArMTM0LDE2IEBAIHN0YXRpYyB2b2lkIHhlX2RldmNvcmVk
dW1wX2ZyZWUodm9pZCAqZGF0YSkNCj4gPiA+ICAgCWlmICghZGF0YSB8fCAhY29yZWR1bXBfdG9f
eGUoY29yZWR1bXApKQ0KPiA+ID4gICAJCXJldHVybjsNCj4gPiA+ICAgDQo+ID4gPiArCWNhbmNl
bF93b3JrX3N5bmMoJmNvcmVkdW1wLT5zbmFwc2hvdC53b3JrKTsNCj4gPiA+ICsNCj4gPiA+ICAg
CXhlX2d1Y19jdF9zbmFwc2hvdF9mcmVlKGNvcmVkdW1wLT5zbmFwc2hvdC5jdCk7DQo+ID4gPiAg
IAl4ZV9ndWNfZXhlY19xdWV1ZV9zbmFwc2hvdF9mcmVlKGNvcmVkdW1wLT5zbmFwc2hvdC5nZSk7
DQo+ID4gPiAgIAl4ZV9zY2hlZF9qb2Jfc25hcHNob3RfZnJlZShjb3JlZHVtcC0+c25hcHNob3Qu
am9iKTsNCj4gPiA+ICAgCWZvciAoaSA9IDA7IGkgPCBYRV9OVU1fSFdfRU5HSU5FUzsgaSsrKQ0K
PiA+ID4gICAJCWlmIChjb3JlZHVtcC0+c25hcHNob3QuaHdlW2ldKQ0KPiA+ID4gICAJCQl4ZV9o
d19lbmdpbmVfc25hcHNob3RfZnJlZShjb3JlZHVtcC0+c25hcHNob3QuaHdlW2ldKTsNCj4gPiA+
ICsJeGVfdm1fc25hcHNob3RfZnJlZShjb3JlZHVtcC0+c25hcHNob3Qudm0pOw0KPiA+ID4gKwlt
ZW1zZXQoJmNvcmVkdW1wLT5zbmFwc2hvdCwgMCwgc2l6ZW9mKGNvcmVkdW1wLT5zbmFwc2hvdCkp
Ow0KPiA+IA0KPiA+IHdoeSB0aGlzIG1lbXNldCgpPw0KPiBJIHdhbnRlZCB0byBlbnN1cmUgbmV4
dCBzbmFwc2hvdCBzdGFydHMgYXQgdGhlIHNhbWUgc3RhdGUgYXMgdGhlIGZpcnN0LCANCj4gdGhl
IHNuYXBzaG90IGlzIG5vdCBmcmVlZCBoZXJlIGFuZCBzdHJ1Y3QgaXMgcmUtdXNlZC4NCg0KSSBk
b24ndCB0aGluayBpdCBpcyBuZWNlc3NhcnkgYWxsIGZpZWxkcyB3aWxsIGJlIG92ZXJ3cml0dGVu
Lg0KQnV0IGlmIHlvdSByZWFsbHkgd2FudCB0byBnbyB3aXRoIHRoaXMsIGl0IHNob3VsZCBiZSBp
biBhIHNlcGFyYXRlZCBwYXRjaC4NCg0KPiANCj4gQ2hlZXJzLA0KPiB+TWFhcnRlbg0KDQo=
