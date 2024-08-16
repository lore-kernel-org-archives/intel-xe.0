Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1718FC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 06:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F2210E50B;
	Fri, 16 Aug 2024 06:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AEt+Qokr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F71410E3FB
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 06:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723789923; x=1755325923;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3iFX99P4mKU0+q7R2s+8Lv9NWGyUAKY4k5ysoWsIHAc=;
 b=AEt+QokrG21m6dK2XtcnsSf0sKp4ReYMv4vJYVOf8mELcmKxWkN65YJP
 d44rUQWygUvaHfq1kfIYMJSXRUHYzuc/pzw8GezpDzmd44NfMAD3xOhhP
 4By/4He2FyL0ThkKTovMU8D9+0BUAdI3pvAXSkxrFLs8rtlHfKxG8GqFy
 Yl75pXgBcU+/IHXIRcSPfPli36RGB9ci+Jjhz6jRGqpNhmY3DFdROR1VC
 hYTnWhl4zpNdhtIuvUgxMaNbmvE5SaH57GOENTnOAT0nOmimkULiMENvR
 T8R19xIryscm7SaN2PkOo7Tm5x58Z7SKuaMt00QwPch/f30oGMBCEOvI+ w==;
X-CSE-ConnectionGUID: MN7ectYYQTCsONO2x5dnvw==
X-CSE-MsgGUID: M3z8JqrQRReqGvJOqhHi/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22250140"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="22250140"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 23:32:02 -0700
X-CSE-ConnectionGUID: fPmOg9cHS2Kd1pn087CURA==
X-CSE-MsgGUID: TssiPGdSToSebrGnR9s7FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="64433795"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 23:32:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 23:32:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 23:32:02 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 23:31:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbdZ0rtoQt0s+PCQf0ZdSKmE87icNlEjm7WpFI8h9n+qNcv5XEU7Lz6rkoq2tYaiSNw3wfX1CFqWOG7Z71DuWgDvEhkIewr3eyS6ajJ3ia/syVJssZ3O9lPsljeyLYYHn6yTx/L451nFQVQp3RY3iGMh4rOG6XdZO7GhF8dXu3IDMvTcwwSZvaJr/G+3+gvqZ7gCUOa0KEXH+8nhO1fEPjdww7oFyZMkJHyeroOmAwXnmEx/Myvq2Q2gYGnKHWjv7V+ZteszXamoZ+jSJ279QuapPAtQdLg5ri8x31Xccjqnoh2ydgqXjNnuv9U+uuHccxE0/k0nu49P5eNvzLFTEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iFX99P4mKU0+q7R2s+8Lv9NWGyUAKY4k5ysoWsIHAc=;
 b=QwsB/JbxbPJggu1keDCvBJKm4Nelkoy/6vRojRqjrI+vJIOgEVPKFDkVL/FG5XhMLEE4h7txa175aTaL9OCesr/E0Ol6NLGwgv9klfxnl0WC076zm0sY+MgdnHsopKXbKXKuyp07Ddy7rx4d4oumEM7dwqY6mO/Xf5JeeT9Kn0lLBiWvEtr8MNlNv3556fLx2YR/P9QzdAw3BEod1U8wOxHXrPPS5VaAbI7st5KWh/z3if2JgK1fH6MUbT4j7xL8AO8icHZ3B2bkwTWRDknxoxzlvTKqacufJissh6iLU8iVThiUFRG+pVzMo/SiM7bK0eaeJrbR1I3ORo5Bjqf5hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20)
 by MN2PR11MB4677.namprd11.prod.outlook.com (2603:10b6:208:24e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 06:31:42 +0000
Received: from MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e]) by MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e%3]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 06:31:42 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] drm/i915/display: allow creation of Xe2 ccs
 framebuffers
Thread-Topic: [PATCH 3/3] drm/i915/display: allow creation of Xe2 ccs
 framebuffers
Thread-Index: AQHa7wFIHVgPWUPkgE66xzCzQcsUybIpbcaQ
Date: Fri, 16 Aug 2024 06:31:42 +0000
Message-ID: <MW4PR11MB705452E2E146D9F6C1A0E0BAEF812@MW4PR11MB7054.namprd11.prod.outlook.com>
References: <20240812201549.2014168-1-juhapekka.heikkila@gmail.com>
 <20240812201549.2014168-4-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240812201549.2014168-4-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7054:EE_|MN2PR11MB4677:EE_
x-ms-office365-filtering-correlation-id: 6b1a1a8b-d976-45e5-ff9c-08dcbdbd17e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RVJ2aDJrTHQ5NktuM1I1WUVFTVRmWUJnbzNBS0trdEZpdXBXNml1c3l3YkpE?=
 =?utf-8?B?N1JLVmtvYWR4TGo1ZStrakVobDhNS1RHV2tPQzNLb0ZkTDVDcGJkUmlnUWp3?=
 =?utf-8?B?VVNZdzdlOHo3dndzMUphcVE2djF1RlNLYTNoVkV5RkF2WVJublZaMGNiNmJI?=
 =?utf-8?B?bWMxaTgrd0JoZjdnQWN4V2FWclAyU3F0YVdvYzN5TFlEcXZoWjZkdWd0VkND?=
 =?utf-8?B?Z3J3cm00OVd2S29MTStrd3hIUk5NblUzNk9qeFZvNUtCdjA3UUlocmhBa1lM?=
 =?utf-8?B?Y1Z5TUhLeHczSE1nd3RmdzlKNnJzTCtWWjNJU3RCTUtMcGFYNVpJdWFJMEUr?=
 =?utf-8?B?bk9vS0ZiUHpRbHVVaWVSTVU2bXVyNk9DcDFySm8rNlpEOElUdnE2RDU1VGt1?=
 =?utf-8?B?SkdyajJsVzAyVEU5STBFNlVaMUZrVVNhMkpobWJ6b0VPZlpDYWl1UnV6SmtH?=
 =?utf-8?B?R0d0L2hudmdFS0UrdmcxZVhqMGl1cCsyMnNhQVB0dWdVWlJ2YW5Gbml0MkRa?=
 =?utf-8?B?K3QyNUNCb0FnbkxtZWtUaUtZbkZFR0JTakVoWXAwbVlqOUcvL0RsRFYzcXFG?=
 =?utf-8?B?bTJqTkh6RzVFRWZHZi9KdkJpaGY3bkpRRUxpOEF3dDdnOWJuZHMrRWw5L0tv?=
 =?utf-8?B?NWV0SWZNM0ZyK2ZpZDFKS2t1L0U2YkNHTHZQTGdiMDNPU3E4ZkxOR3JuOXlj?=
 =?utf-8?B?SC9KOEFVZk9Ub0E2RHd4L0tTSU1VbXgzRGhVYVh3VlNZQVVLS3dDVG4xUENO?=
 =?utf-8?B?ek55akVYd0R2THJUc1h4THBZbGM5RTlIeTFjUkFHSEZSdlJCMDROUnZNS0to?=
 =?utf-8?B?OGJQNndybjkzRnJLYkp6R3ZKQUsrSkI1T2VPUUYybmFBNmhHdmo2cU1xQzdR?=
 =?utf-8?B?RVJzSS8xbGo0YWlqMi9wNm5XWVhVT2pISU9NbDhaKzk5QmFMM0lsYTdTOTNm?=
 =?utf-8?B?QW9EZ2d5SGxwVlVxOVNXcTVyTDVJUjhzUktTSzBXeUlwVnNGZE5ZWExzM3pX?=
 =?utf-8?B?cWJJZFA3emlQbzMwTC9GZThyYTQyY2dqM2drbjFpTVRIcXhrVVBFUmVTZWNo?=
 =?utf-8?B?b0FlcVZxbHRiZjdCN2MwMHNqRjZ0clMzMHk5SXpva0E2MFFHcnE2anV4ejJB?=
 =?utf-8?B?b21DMHFZb0xnNkxtd0tKODNQL09FVTBtT1BNV3Q4VHd6RFFBeko4dDdDUjBq?=
 =?utf-8?B?dkxXMFZtRzlTRjFFZEx6Ym5DazJybmNmb3VzMm9BMlhWK1Z4UzRhM25tYUFn?=
 =?utf-8?B?SVlnVTZCK2NBR3YrVHg1dHJnbk1ZcGh5MHFIZytUeWxzZVdVR1J2Uno1MjlR?=
 =?utf-8?B?RUpDaWZEd2g4UWRLWkM0S2l3MVltNVZxajRTWFdpTlIwVExXbFhkWksvb0lz?=
 =?utf-8?B?SktIM3hOcmxjNEc5MllOQ25CbEVEV0pHbVEwNjROcVlQQkhuODdYY1p1bFRY?=
 =?utf-8?B?OHh2d01RMnBvK2lCc2dWc0o4dVVOVDBVSWsvR3h1dmtpWlJHb1FEd3BIVDFz?=
 =?utf-8?B?V0Q5Ty95eU5QYTM3YTJERFFaQm5tM3FvRjZaZFNrUHAvNTZLNFdqTjZWN1RB?=
 =?utf-8?B?OHl2cDBoWFlNWXVpcnVUVVl5Umo5b052WGR0MmhRUWdrNHhMVGNmNGRWMWx5?=
 =?utf-8?B?THpSQzM2UzFrSERlenMxWHFEcWlpNzU3Q0IvZmJaK3UyTXhjZGlrdmFUZU5w?=
 =?utf-8?B?bUZTYTJpcm82ek1NNkVGN1A1WDRGZ29XditkbmJXajUrdERNMXFnalp1WGRZ?=
 =?utf-8?B?M2RqTzhjTjg5UEVnYTdURDJCeTc4MGd2Q1QwbHNXb0o0Yy9PYUVHTmJneExT?=
 =?utf-8?B?UVVuRnJBeVVwYkV1UHhiWVI3ajlSZjlzcmFNU1VqdVd3cjZHOHV0bUpkaElz?=
 =?utf-8?B?SVNOUmFuVG94a09KZ2RXS09JV09HS2tNaXBLdk0wdSs2T0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mm9aU3ZKZ3NYY2xsNk84ODhDSnFod3g4MmhZaE1xeHRYS3BvNGgvbkdwK2Uv?=
 =?utf-8?B?WjRwQ2FrZlR6ck1BOUQ5MXRLdC9EMENlZkVkMUVKVXBIOEZsSmkrT1BUQmdo?=
 =?utf-8?B?em1oR1dvcjdRTEVWaERjckRTYXVEVVhWN1FObWRzc1hkMENyRnRoRDdISkZ6?=
 =?utf-8?B?Z09hblp0VnlST0hiZWZvUC9LRTJnMTlIMGJVM3Fud0FxR1ZhSG5GSGtYOVpL?=
 =?utf-8?B?NWorN21qUW92VXQ0M0k5S05tQzd1dkRSVzJreDI2dkRUSVY0VFloTFI1NG1j?=
 =?utf-8?B?VURvajlSL1FidU4waXRUdVpXdUdHZmJUdEhZVmFnR080TjhUazRtSXFzSGhR?=
 =?utf-8?B?K1J4UnV4RUgvd09ray9XSTZjMHhBa2JxdUVWWXpJWFNrMFFRa0pjdkVXUEFJ?=
 =?utf-8?B?TzNVYzVZOXZsQ3pOUjRXVm9KUkpPSWQ1R3FEMHZvaG5NbUdTcE9SZktLNHo0?=
 =?utf-8?B?K2xXcUdORE5QZXhhYi9lSWRsVzhMaHFDMTFRZEZONlZ0S2FwcTV6YmYvTjFN?=
 =?utf-8?B?Z2ZBN3JNVWtrYjZ4ZjlLQ2pVNzR1OEFzUEtKS29CT1EwTFpST3pZREU3blM1?=
 =?utf-8?B?aXRkaUJld09RQVF5OVFGdWwvalFYZ21ZbThkdFBpNDFDV3FqYXpLZzh6REor?=
 =?utf-8?B?R0pXVnZDVEhlc3M5bXVaUkFnQkFWdEhDKy9OclZNekVCcVhnMEVVR1FmZW84?=
 =?utf-8?B?eDFvTm15QlptVkQ4RzFGVDJnSHA2WlFlR2dwMXdGb01NZ0lBbG9MSDk1Y0lE?=
 =?utf-8?B?TE5sVU01cFkxT0dCb2hnQnUyaUYwRi9ZVXNKT2pDQWFPYnhra0wxcnROZjR2?=
 =?utf-8?B?Qk5yeGNBbU9XdzFUS2dJK1YzZlgvZ3NKc2twNGs1TlpLaTk3N2VnZWxiS2xH?=
 =?utf-8?B?Q2JYU1NIL0VXSHFhMm5vbjNONWJUSE9xR2ZRU0pGNE16RUtaTlBqOEhaOEdo?=
 =?utf-8?B?ZWpiQmJOTG1vYXI0NVQ5WjFsaENJd3E4WXRINldYeGpPZHNPclhIOXJxeG9t?=
 =?utf-8?B?SzhzVGNvbEY5NW5aMnhxK2NsbEE4RnBybkpjbjh6SnRjUGtTV0FnOEREVFhr?=
 =?utf-8?B?ZVhmQzBiL3QrMHVzOXB3VE5IVHYxMTZsMkRGRTMyQUdhejBlM3RreGM2b1cy?=
 =?utf-8?B?eVhyRldvcjBiSnk1OFpPVWtWRHV3T0IxSDZlWTE2dUl3a2NrS2pDYlhPcFZS?=
 =?utf-8?B?YitDNkQ1NDZrenlyMG9KekxIRkZidWxkcHc4VHVvcTJzMWpYUVhjelpPNFU5?=
 =?utf-8?B?aHM2Tkt6Y29OWDFYWjF2RzdNT2JwZFVKa2JtZmxDVzNoaDc5ZVQ4T1VzZ3Fs?=
 =?utf-8?B?cGhMVDFHeG5qbCttMUx2Rk4vb0pkbmM0ZG44ZmFQdzhIUG1TeHkzRng4RVhD?=
 =?utf-8?B?WW1yVWExNXhSdllUcFRPcjkzdmwyMGNMR1NVenlHTGdRUFdLVGsvR3VoZHBR?=
 =?utf-8?B?bTBCMGNQUVlYNlE0cFc4NDliVUErcjdndFNYR2hkb2RFY1p3dzZEQjVGaEtx?=
 =?utf-8?B?dDZ2b0xkcnJUM2tEWnQ5RkNZYnFXUjNvTWgyNVF2TjV5NjQycVhMMjkwSmRU?=
 =?utf-8?B?K0dEMWJxNkN6YVR6cEU1cHc5RzFzZXR0OXRaWmcxVnRnSHlmbFFXMXk1dkxi?=
 =?utf-8?B?Rzh5VEd0UlhLYjdmZFdaTlBVYjBlZ0h1OElodGcyNXo0VTFyOG8xNDUvNnNV?=
 =?utf-8?B?ZWNxQjVrZTNJQWhtZEladnlsZ1owcmd5WlF3RjBOYTNBeGdHMVNhVDR3RURV?=
 =?utf-8?B?OG01NnY4TXhVaEhxN2dFUFErVjRkUFdtVXBIbDNzY3NtMTFJdkFZbFUzVTRT?=
 =?utf-8?B?L085U0NCUWtPVnNzTUt5V1lLdlNtRnF0d0JrNUQ2WmJvaTBCbXFoendvOHNk?=
 =?utf-8?B?VkNkQnFMQWM4Y0p4ZzBVNzQ0QmFsZXNrUlgzZzRBVmNTTk5mSUhUalhtczZq?=
 =?utf-8?B?NXY1VHYwTXpCOTk2c2xGQ0U1VHdlcmJ6NEplWnhkQW5UREV5dktITnRqaTJJ?=
 =?utf-8?B?TUEzbmFtUW92YWk5TFdSaDI4N1FTc1FjeEVXd2ZRUEFwS3RHQkRVaHQ4cTc3?=
 =?utf-8?B?MXV0VEZHV3Zzc0ppMWF0VzgvZDh1bWRSMGFnN2d1ZlNiS1E5S0R1aE5jajAr?=
 =?utf-8?Q?rBl/pZJ1/wo2tZkjnguLEAy6v?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1a1a8b-d976-45e5-ff9c-08dcbdbd17e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 06:31:42.6982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5NDC6ztCPtSNwCBu8/OVl4EyMALv61lG9v4B6rlNmz8LO3TNWfYSig+WioLeVhsTpo0vgmm2S7i6zW4sGxPTDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4677
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWhhLVBla2thIEhlaWtraWxh
IDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPg0KPiBTZW50OiBNb25kYXksIEF1Z3VzdCAx
MiwgMjAyNCAxMToxNSBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0ggMy8zXSBkcm0vaTkxNS9kaXNwbGF5OiBhbGxvdyBjcmVhdGlvbiBv
ZiBYZTIgY2NzIGZyYW1lYnVmZmVycw0KPiANCj4gQWRkIEk5MTVfRk9STUFUX01PRF80X1RJTEVE
X0JNR19DQ1MgYW5kDQo+IEk5MTVfRk9STUFUX01PRF80X1RJTEVEX0xOTF9DQ1MgdG8gcG9zc2li
bGUgY3JlYXRlZCBtb2RpZmllciBmb3IgbmV3DQo+IGZyYW1lYnVmZmVyIG9uIFhlIGRyaXZlci4N
Cj4gDQoNClJldmlld2VkLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0K
DQo+IFNpZ25lZC1vZmYtYnk6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2ls
YUBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kaXNwbGF5LmMgICB8ICAyICsrDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2ZiLmMgICAgICAgIHwgMTggKysrKysrKysrKysrKysrKysrDQo+ICAuLi4vZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jIHwgIDUgKysrKysNCj4gIDMgZmlsZXMg
Y2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMNCj4gaW5kZXggOWYyYTRhODU0NTQ4Li4xMDQyZjY1
OTY3YmEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheS5jDQo+IEBAIC02MjYwLDYgKzYyNjAsOCBAQCBzdGF0aWMgaW50IGludGVsX2FzeW5jX2Zs
aXBfY2hlY2tfaHcoc3RydWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsIHN0cnVjdCBp
bg0KPiAgCQljYXNlIEk5MTVfRk9STUFUX01PRF9ZX1RJTEVEOg0KPiAgCQljYXNlIEk5MTVfRk9S
TUFUX01PRF9ZZl9USUxFRDoNCj4gIAkJY2FzZSBJOTE1X0ZPUk1BVF9NT0RfNF9USUxFRDoNCj4g
KwkJY2FzZSBJOTE1X0ZPUk1BVF9NT0RfNF9USUxFRF9CTUdfQ0NTOg0KPiArCQljYXNlIEk5MTVf
Rk9STUFUX01PRF80X1RJTEVEX0xOTF9DQ1M6DQo+ICAJCQlicmVhazsNCj4gIAkJZGVmYXVsdDoN
Cj4gIAkJCWRybV9kYmdfa21zKCZpOTE1LT5kcm0sDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2ZiLmMNCj4gaW5kZXggZjIzNTQ3YTg4YjFmLi5kMjcxNjkxNWQwNDYgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmIuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiLmMNCj4gQEAgLTE2Myw2
ICsxNjMsMTQgQEAgc3RydWN0IGludGVsX21vZGlmaWVyX2Rlc2Mgew0KPiANCj4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgaW50ZWxfbW9kaWZpZXJfZGVzYyBpbnRlbF9tb2RpZmllcnNbXSA9IHsNCj4g
IAl7DQo+ICsJCS5tb2RpZmllciA9IEk5MTVfRk9STUFUX01PRF80X1RJTEVEX0xOTF9DQ1MsDQo+
ICsJCS5kaXNwbGF5X3ZlciA9IHsgMjAsIC0xIH0sDQo+ICsJCS5wbGFuZV9jYXBzID0gSU5URUxf
UExBTkVfQ0FQX1RJTElOR180LA0KPiArCX0sIHsNCj4gKwkJLm1vZGlmaWVyID0gSTkxNV9GT1JN
QVRfTU9EXzRfVElMRURfQk1HX0NDUywNCj4gKwkJLmRpc3BsYXlfdmVyID0geyAxNCwgLTEgfSwN
Cj4gKwkJLnBsYW5lX2NhcHMgPSBJTlRFTF9QTEFORV9DQVBfVElMSU5HXzQsDQo+ICsJfSwgew0K
PiAgCQkubW9kaWZpZXIgPSBJOTE1X0ZPUk1BVF9NT0RfNF9USUxFRF9NVExfTUNfQ0NTLA0KPiAg
CQkuZGlzcGxheV92ZXIgPSB7IDE0LCAxNCB9LA0KPiAgCQkucGxhbmVfY2FwcyA9IElOVEVMX1BM
QU5FX0NBUF9USUxJTkdfNCB8DQo+IElOVEVMX1BMQU5FX0NBUF9DQ1NfTUMsIEBAIC00MzcsNiAr
NDQ1LDE0IEBAIHN0YXRpYyBib29sDQo+IHBsYW5lX2hhc19tb2RpZmllcihzdHJ1Y3QgZHJtX2k5
MTVfcHJpdmF0ZSAqaTkxNSwNCj4gIAkgICAgSEFTX0ZMQVRfQ0NTKGk5MTUpICE9ICFtZC0+Y2Nz
LnBhY2tlZF9hdXhfcGxhbmVzKQ0KPiAgCQlyZXR1cm4gZmFsc2U7DQo+IA0KPiArCWlmIChtZC0+
bW9kaWZpZXIgPT0gSTkxNV9GT1JNQVRfTU9EXzRfVElMRURfQk1HX0NDUyAmJg0KPiArCSAgICAo
R1JBUEhJQ1NfVkVSKGk5MTUpIDwgMjAgfHwgIUlTX0RHRlgoaTkxNSkpKQ0KPiArCQlyZXR1cm4g
ZmFsc2U7DQo+ICsNCj4gKwlpZiAobWQtPm1vZGlmaWVyID09IEk5MTVfRk9STUFUX01PRF80X1RJ
TEVEX0xOTF9DQ1MgJiYNCj4gKwkgICAgKEdSQVBISUNTX1ZFUihpOTE1KSA8IDIwIHx8IElTX0RH
RlgoaTkxNSkpKQ0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsNCj4gIAlyZXR1cm4gdHJ1ZTsNCj4g
IH0NCj4gDQo+IEBAIC02NTMsNiArNjY5LDggQEAgaW50ZWxfdGlsZV93aWR0aF9ieXRlcyhjb25z
dCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwgaW50DQo+IGNvbG9yX3BsYW5lKQ0KPiAgCQkJ
cmV0dXJuIDEyODsNCj4gIAkJZWxzZQ0KPiAgCQkJcmV0dXJuIDUxMjsNCj4gKwljYXNlIEk5MTVf
Rk9STUFUX01PRF80X1RJTEVEX0JNR19DQ1M6DQo+ICsJY2FzZSBJOTE1X0ZPUk1BVF9NT0RfNF9U
SUxFRF9MTkxfQ0NTOg0KPiAgCWNhc2UgSTkxNV9GT1JNQVRfTU9EXzRfVElMRURfREcyX1JDX0ND
UzoNCj4gIAljYXNlIEk5MTVfRk9STUFUX01PRF80X1RJTEVEX0RHMl9SQ19DQ1NfQ0M6DQo+ICAJ
Y2FzZSBJOTE1X0ZPUk1BVF9NT0RfNF9USUxFRF9ERzJfTUNfQ0NTOg0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxfcGxhbmUuYw0KPiBpbmRl
eCBhMWFiNjRkYjAxMzAuLjBlODFkNTQwZWNjOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4gQEAgLTUzNyw2ICs1
MzcsOCBAQCBzdGF0aWMgdTMyIHRnbF9wbGFuZV9taW5fYWxpZ25tZW50KHN0cnVjdCBpbnRlbF9w
bGFuZQ0KPiAqcGxhbmUsDQo+ICAJY2FzZSBJOTE1X0ZPUk1BVF9NT0RfNF9USUxFRF9ERzJfUkNf
Q0NTOg0KPiAgCWNhc2UgSTkxNV9GT1JNQVRfTU9EXzRfVElMRURfREcyX1JDX0NDU19DQzoNCj4g
IAljYXNlIEk5MTVfRk9STUFUX01PRF80X1RJTEVEX0RHMl9NQ19DQ1M6DQo+ICsJY2FzZSBJOTE1
X0ZPUk1BVF9NT0RfNF9USUxFRF9CTUdfQ0NTOg0KPiArCWNhc2UgSTkxNV9GT1JNQVRfTU9EXzRf
VElMRURfTE5MX0NDUzoNCj4gIAkJLyoNCj4gIAkJICogQWxpZ24gdG8gYXQgbGVhc3QgNHgxIG1h
aW4gc3VyZmFjZQ0KPiAgCQkgKiB0aWxlcyAoMTZLKSB0byBtYXRjaCA2NEIgb2YgQVVYLg0KPiBA
QCAtOTQ4LDYgKzk1MCw5IEBAIHN0YXRpYyB1MzIgc2tsX3BsYW5lX2N0bF90aWxpbmcodTY0IGZi
X21vZGlmaWVyKQ0KPiAgCQlyZXR1cm4gUExBTkVfQ1RMX1RJTEVEXzQgfA0KPiBQTEFORV9DVExf
UkVOREVSX0RFQ09NUFJFU1NJT05fRU5BQkxFOw0KPiAgCWNhc2UgSTkxNV9GT1JNQVRfTU9EXzRf
VElMRURfTVRMX01DX0NDUzoNCj4gIAkJcmV0dXJuIFBMQU5FX0NUTF9USUxFRF80IHwNCj4gUExB
TkVfQ1RMX01FRElBX0RFQ09NUFJFU1NJT05fRU5BQkxFOw0KPiArCWNhc2UgSTkxNV9GT1JNQVRf
TU9EXzRfVElMRURfQk1HX0NDUzoNCj4gKwljYXNlIEk5MTVfRk9STUFUX01PRF80X1RJTEVEX0xO
TF9DQ1M6DQo+ICsJCXJldHVybiBQTEFORV9DVExfVElMRURfNCB8DQo+IFBMQU5FX0NUTF9SRU5E
RVJfREVDT01QUkVTU0lPTl9FTkFCTEU7DQo+ICAJY2FzZSBJOTE1X0ZPUk1BVF9NT0RfWV9USUxF
RF9DQ1M6DQo+ICAJY2FzZSBJOTE1X0ZPUk1BVF9NT0RfWV9USUxFRF9HRU4xMl9SQ19DQ1NfQ0M6
DQo+ICAJCXJldHVybiBQTEFORV9DVExfVElMRURfWSB8DQo+IFBMQU5FX0NUTF9SRU5ERVJfREVD
T01QUkVTU0lPTl9FTkFCTEU7DQo+IC0tDQo+IDIuNDUuMg0KDQo=
