Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CFACA0EC4
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 10:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC5710E039;
	Tue, 12 Aug 2025 10:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lf3k26GH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446CA10E039
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 10:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754994265; x=1786530265;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N8a4/zgLZWKssjIYmNAmZ8ZSIEaQ92tG0x2kADbDtGY=;
 b=Lf3k26GHfb5hAVluzEO4dZhy26Q56LfUNtqZ2n1DXP8Oq/t3cksLemNf
 xtwMxOpys4O3uv9wwaYuiWt7VuEWgAbT7i3GSPx3UdSg8T3taUlpx6tSY
 M0o0vxZpYa/l9smMeVk/72Djk1TwZPUX5X0yEF4uHyXb4gjTDIN1aeQNT
 EExaVduo8mW/1O4AmvgqjRX5uRXOZ/7lGlcU3ubQyIpZtz2yQ80bzkseA
 Vxhm4TM8w+tGR8QLaNFo2ms+ClqQh8Y4X5gP8Xt4yAybDlFVGMCMdP5eW
 jPFleBg68DXZ0MldzZJPBJc6OBYmVSP+TJMPppdnHWcID6O3pEfkaSDDN A==;
X-CSE-ConnectionGUID: 8rq8tvRcQES8sK9y0g10ww==
X-CSE-MsgGUID: CpWPAxhNRZS2lYiTTyXNQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57129972"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="57129972"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 03:24:25 -0700
X-CSE-ConnectionGUID: dXaolLnfQVC0SOKPx5U1dw==
X-CSE-MsgGUID: gD5iDAjgSL2ZMiEgP+gCIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="166053233"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 03:24:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 03:24:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 12 Aug 2025 03:24:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.56)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 03:24:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEwosAZSP8J/EGJshlcUKVDtJc44lGb5NuEhDQknSBRsspLLwaZCuacelBWzeRG7anNsoCXYd5ISd0KRJ6INJMaYVQtF1jTPG6ACG/gPVeUQiEQBxuM6m/p/mogKqFvS/FGWQiJJK90PWlSm1f8y+wLJoRwguNrdnXWtFhQjSYuMhQH23/X5G1Y9BplZb+ms7f76FVA6p4vxjbk90+sWrT/wzm0kF24R9EBXjnoYBA+qOhoqofm0F4bPIFTXcQdaWnMGlf32XHoX00BeSA3MGAXmQEpej1vlijybGRimqbS5i89s6R/BneJD5KjiL4WH7Xg/0lZrcSwtHpwbFfKIfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8a4/zgLZWKssjIYmNAmZ8ZSIEaQ92tG0x2kADbDtGY=;
 b=anrCQH1G5/TnA27ig5iEmFyJuZnrTQvOflnXJXKhZfFZv/LZlmGF6IY2qv6N308wtvjiGFt7Kx9IjWiXEh/Lj05XIpRbdHttMpiFtfavm4g9+q2PNwpUsmzZzqNfp7EDP8HKLK4wjMAw2lU8TI/LSvwTBcTgMduDj1im2gf3x9aVX0tIjT9RbdRStKs+CqbHE+KlJXABCKc+XPGGQhaFVA4CSa6ER/9y4uZW4ttGXPLRAtH8YNS3DVNz6R4ULAWG1d895Uhxrt7Eqb9NnCV5NFBfO2bLdwH2CxJM1bUv1y8ZfbLGys46x8VA422dmhnxWzmAzWG3BIsfweZs+U9xiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by MN0PR11MB6060.namprd11.prod.outlook.com (2603:10b6:208:378::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 10:24:21 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%6]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 10:24:21 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Kumar, Prashanth" <prashanth.kumar@intel.com>
Subject: RE: [PATCH v3 12/13] drm/xe/configfs: Minor fixes to documentation
Thread-Topic: [PATCH v3 12/13] drm/xe/configfs: Minor fixes to documentation
Thread-Index: AQHcCIoeZ9bX6RUCe0+78NhEMg78DbRe1Wrg
Date: Tue, 12 Aug 2025 10:24:21 +0000
Message-ID: <IA1PR11MB6266AD6F586237319708A5E4E22BA@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-12-a111e9f1e4b7@intel.com>
In-Reply-To: <20250808-psmi-v3-12-a111e9f1e4b7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|MN0PR11MB6060:EE_
x-ms-office365-filtering-correlation-id: 9d1079ef-f5f5-4a14-9e0d-08ddd98a670e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?YlhDK1pIRGF4elN1N2Juc1pPYWxIOWhaNG9HSGViOGovY2NCVGNhVlpjVnRr?=
 =?utf-8?B?YUxMR285VE5EVFZVa0Z5MW44dThaNXBRT1dWT2Q0M0pQV1lYcExXMjZYUEpB?=
 =?utf-8?B?bUlhSnJoRkxLbjlQQVBxaUh1NktTQTFWeTRNYnQxV0t1bHp1TUFxTVJvb2hW?=
 =?utf-8?B?RmtHRjltY1N0SC96T2RQdW05eU5JZklyOEx0Rk9WMjNRU1VPRGNCbWlLVFpS?=
 =?utf-8?B?TW0zSFN6MXlDUElIWXEzY0U5UVB0ZXl4K3M1UFVqcksrZC84ZzNwUGpkWFJy?=
 =?utf-8?B?VDBhaW04ODBtMnYzeVA1VVpRNVZYaE9NbmN1YmRaRFltS1BUNlo3cVRQbkx5?=
 =?utf-8?B?OTQ4ekNrSmV1YXUzRnNEeW0vcXQ0ajB6ZlFUWjlUc1UwdDVVL2NxV2I0Mi9v?=
 =?utf-8?B?dSt4RVhKWDhUR2NJdVdKdSswZ002Z0hzM3NaTkQyNW8raGY3RlRTMkU2VVpa?=
 =?utf-8?B?d0dNNkdhbXgrM1d5bS8xczlTaU9sWTNxNXlDeVgvVE1XL1RhME50c3ZGeThH?=
 =?utf-8?B?NkZ5RC84WUljKzBhUHNUK2c4SzdnTU9CVjg0aEV5RFl1Y05yYnEwZGI4K3Qr?=
 =?utf-8?B?SWQ3anFPdWpENGFlTlV0Mi9neHNvbEdRREU2dUhpSURnaDlTS1U2Uk1RdjZK?=
 =?utf-8?B?SUZoeXhleWpTZlNWd0xjKzdUQlVNU214dXFRTkc3YTBza0h5WEZVSEZka2Uz?=
 =?utf-8?B?aDBvRW9qeHJIclhJRGlyY0kxblZETitiSkxZNExEMXM5QjBPZWpnZUZ4clJx?=
 =?utf-8?B?M1dGNzVMQ3BGS2pqVXVBOG9MUUJ0SXhROHRaUkVuMzc5VWpWZjlJTG1mcUlz?=
 =?utf-8?B?RWtXbXBnRFB1eDVnNTZXbWEzaFlRWUFhZ1lsOUJpVmYxUGI4S3MvUG1CYmpF?=
 =?utf-8?B?N3k4RnZtYUtlZ2orbUQvMnc0WGd3SDQvU24venJHTEhRZ1JkM0Z0VEpOaVdk?=
 =?utf-8?B?eTljY2c4YURhZEN5SEpjb2NwMVhCQlRsWk9tU0t1S1VPYU1KSzgva3hWOXl5?=
 =?utf-8?B?UE5QMjlmdWlkNWV2VlZySVRDbHlWR2Q4Uk5lRVpXS01KZGVyU3RwTG5sdEtI?=
 =?utf-8?B?L3FIdTYvVFZXeitHTUROWTJTZDZjRzl3M3pwaFpoMVlKNTMzQXRtVjdvSUcw?=
 =?utf-8?B?WENuQStiWHYzZG5IWjdiRHg3NlBUN21ab1JtaFBPV1pnSUtuWUJWOURWSUtv?=
 =?utf-8?B?cVphUmNDSTV5YnFadlVQS3BrbTZadjR1dm5nRGpaTys3Zk9iNmpZdXVNODBz?=
 =?utf-8?B?QXVaSnB1c1hUbVdiTDlVNFRlYmhmeG5YNHZYU0xVY1kwVmxrZElrdlpwZTZi?=
 =?utf-8?B?N0R5YVE1NEhRU3k3NE94aVJNTWNMOEFLc21ueURhYWl4M1VaNFdwVVpHcitJ?=
 =?utf-8?B?VzJYVDMxWUpBUWZnc0xyUWVTZktSUXlseDNKenpuVldFMVRrRFJsZjJNYkRI?=
 =?utf-8?B?cU5SdmErSVNjelZBRDBRMmVKVG03SVVHSUFua0RLUi9qc2xtdGNscFJXaGsy?=
 =?utf-8?B?NWE4M2N3MkVESVpoMzA5YWw0bmJQQ083b2J6U28ycUg1VkNUSkRwSVBBRGtJ?=
 =?utf-8?B?bHNSV3YvRUVBL1RldGxJbVl1c0I4cmV5aWZOam12ZFpSVFFaWG1vRjc5NkxB?=
 =?utf-8?B?VkU0RHoxVE51TmVIeXZWNWxUdm9KNUUrMFB4UThkMzJRSlJ6Q0luc0xubzZh?=
 =?utf-8?B?cHFxKzh0cndRTE5jZlNEeVY5NVZob1dYK0N3dStrdUlhL0VWMnlGVXp5bVA3?=
 =?utf-8?B?WGo4ZWwrYUVUU0NuVDJzVTdOeWx3bWR0bEliNmIrR2lPVmFrUG56UzdkdDR0?=
 =?utf-8?B?djlCM2g0SkxKOEowNFNSd281RVFpdkdzVWRmc3UvTWM1eWFuaHlmaDhod2lj?=
 =?utf-8?B?SVgwMFZMUzJBNEs1amZocFNrdWVXT1B5NDZqNm9uS0dXMC9qc3VsRmNWK0RV?=
 =?utf-8?B?UTJ6ZjBUbVJxekdGcnNTRXdheUVvSlBUdHhRNDRwT2ZoSW5zdlFxRDVqdXpY?=
 =?utf-8?B?MC9tK0lpREpnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXFvZHdmd0hNS1hTUzJqY0xlVEJLd2NxOUtCbUlRb1Q3aVR2S2dKV0dLOU1y?=
 =?utf-8?B?TWNiREpIOEoremk3QzZuR0RmMWlPSWF6N0p0cEZ4SktkYlBvLzdzeUxJNHJo?=
 =?utf-8?B?Qmp2WDVmcEdBTlQwREpuV3hISDJRQ3ZnUFVMMDg1MndsQlE1T1c2dnM4NFJR?=
 =?utf-8?B?Vi8rdVdZb1VzY0hmNTNOUk9pWTZPdCtHS1RhNmVQNEExak9VcU4rSXloZDBQ?=
 =?utf-8?B?OGR5blczTjJlWTBQWWVYWU5vT29kenB4T1lxOXoyQnJ4TlVkeFNMSFlJMzlV?=
 =?utf-8?B?c0Z2NzA2T0EybjdWY1c4aDFhUThqM3o2ekpya0VvenNOOUh5bXpQUDcvdjFw?=
 =?utf-8?B?SzBxNk1sbEJocW1lMTBRVFFnbGRDYjB5L2lHMEc1TXZNREVwTkl0TnFNdWdR?=
 =?utf-8?B?dFlSMGNTMmRIZ3FETWVrUW9HMEcxQmhsZzNyK1FZbGV5WStBeVNobWxUeGxl?=
 =?utf-8?B?UzRETHFVMUdLbllmYjZMYW1NUk16azZMcDBGaHh0QVo5NWxKSWx4aGxCNHlK?=
 =?utf-8?B?NGpXNS9HcjJZQ3dLQjVhQnh3ZDVYcHBEakZxQU1ETURGSWRSbUNjTG9hOEhO?=
 =?utf-8?B?M29HRElMQ21jTnRHNmUrWlM0cUhVOWZ4REszRHZDMEp2Zk45MERNVVFTRm1L?=
 =?utf-8?B?SXNSK2tobVAwNVFleUwrNU1NYmZXZXF6bGlUUXZSTXhMcVAreGRLeGJkaHA3?=
 =?utf-8?B?R0krREhMenQreEtneTE0aUt2TUpBalkrNVFVVUxSRzNYemdyNHBBMmtrcjYr?=
 =?utf-8?B?NUlhUFVQVFY5ZUdOaGU3TEd2ZXNQS3pGNGdzWEh5SzdWSURsRjNTK0NST0VK?=
 =?utf-8?B?ajZnKytTQzg4eGZhYlluV2JwNTJzWXo1YzhHYmcyUHlPTVRtZG4yK0xWemNo?=
 =?utf-8?B?ajE0TnlzYlU5TEhTajBDUXZDaVhOc1RGSnZuUnJuOW5GaVNCdW1CdUNETHF1?=
 =?utf-8?B?S3hkQnF6aGlOdTAxZkhoNWJ4RWxQV0VsaFZqNmRaQ3FTQlJUYjRKTnBlOTg4?=
 =?utf-8?B?K1k1Nzk4bGozV2xOdDQxYnpTN0ZiRmh1TDFnQU1EZElTUDJFK0FYS0lFcnV0?=
 =?utf-8?B?MG1zU0htaHd5UEpaTzI0WGp6WE53YTVYVnR2Smg2dEUzY25zS3ZLYWh4bnlk?=
 =?utf-8?B?a2lvVXpjQlpQRjYveElxOGppT0NMWCtueXRRM0JSK1NLS0tkck4wWlVpSEZI?=
 =?utf-8?B?azFpQVZPZXVTZHl3aFMwMWxMU0dzWGxOdlUvVm1HSU1qd0E0eWNhU3ZqaFVl?=
 =?utf-8?B?V3hNTm1XaVRBNUc0YWcwejlSM25YeS91VisvNnlnaTBuYzQyMzdxejhOUnY2?=
 =?utf-8?B?ZE9jWFB0dThSM0NyNmU1SmFjYSttUHVjUGRYOTg1MTFkaVVNRTBRSzk0OGgw?=
 =?utf-8?B?c2tla3daQ2xIM1BmVU1YSXNPODhOeFM2MzA4eVA2L2xXY3ZwZlBrZmJIdFMx?=
 =?utf-8?B?TWdCTnczUHhPWWJtQ3EzM3VUSG51TG44WnhHZFkrdW1wd2wrL0hGY29XZWlP?=
 =?utf-8?B?WWxOSmVxWkYyeHN5cC9STENDOFNrYkZPeWtieFFqb2w1Rk03cVRLNjhXRCtK?=
 =?utf-8?B?aWhLOUV6U3VQNW1YVFVNQTNQVFlDNHZqWEE0REkyWVl5aGFUeENUNGM3K3V5?=
 =?utf-8?B?d0lML3VGVGtlK0pMRjI2WTMrNzBjU09aQld3amN0YVBVc1dRS05CSmFuVTd2?=
 =?utf-8?B?aUpRMktpOGc4MkFGa3VGd0NEeC8rZUJKcWhOalVNT0Nscmo3WThDb3Q0UGsr?=
 =?utf-8?B?RHBOSFdBK2sxOHlVN3JnVEpXWmtCMFFQK3lRZGZrQ3VlMER2Unc2Tmp5c2xO?=
 =?utf-8?B?c3B6Z2RJNDhFSXZ5L1A5TjJ0bzhjQ1JEdjU0M0w5bHloMllqdzNRSzl0TWxa?=
 =?utf-8?B?RXpsbUNXVEYzL0lGN1F2VjNqNFgxeXhLNXdteEVjUEZmYStpbktUVlpJWFFY?=
 =?utf-8?B?ay8wQTA5WjEvMEN0STVLSUlCS1pyRUlIQUg1YUpielZCd0ZnekdFV2RudGZH?=
 =?utf-8?B?TG93Q1VmZjM4bmt4OEozcStWRjhRRmhtaUNiWlltalAycVJiRWs3cjBvbTR4?=
 =?utf-8?B?Z04yYjYxMWtlL2xMMmduNEhwTkVwQjZIc3VMelJwam8zdlExTVBOYWRuV0pO?=
 =?utf-8?B?eWxLRk4yUmpXbm0xTVluKzBOdmFKdlBXNm9rWUZtMDFXSFd6NnNrS2ZRa2NP?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1079ef-f5f5-4a14-9e0d-08ddd98a670e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 10:24:21.3798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lKHAIxFvF1QnxX7SNXV1nnEK/uEkUCn8rSp31/ksJedksWEzEWc5hMnOGf3hoEHJCoWgQ/4I94M7EQ9hlSLDTGvwXcNbCPYCDYH5NxTyBYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6060
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGUgTWFyY2hpLCBMdWNh
cyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCA4LCAy
MDI1IDExOjAwIFBNDQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6
IERlIE1hcmNoaSwgTHVjYXMgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT47IEt1bWFyLCBQcmFz
aGFudGgNCj4gPHByYXNoYW50aC5rdW1hckBpbnRlbC5jb20+OyBCaGFkYW5lLCBEbnlhbmVzaHdh
cg0KPiA8ZG55YW5lc2h3YXIuYmhhZGFuZUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2
MyAxMi8xM10gZHJtL3hlL2NvbmZpZ2ZzOiBNaW5vciBmaXhlcyB0byBkb2N1bWVudGF0aW9uDQo+
IA0KPiBBZGQgYSBmZXcgbWlzc2luZyBwdW5jdHVhdGlvbiBhbmQgbGluZSBicmVha3MgYW5kIG1h
a2UgdGhlIHN5bnRheCBmb3IgY29kZQ0KPiBzbmlwcGV0cyBjb21tb24gdG8gYWxsIG9mIHRoZW0u
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGlu
dGVsLmNvbT4NCg0KTEdUTSwNClJldmlld2VkLWJ5OiBEbnlhbmVzaHdhciBCaGFkYW5lIDxkbnlh
bmVzaHdhci5iaGFkYW5lQGludGVsLmNvbT4NCg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2NvbmZpZ2ZzLmMgfCA5ICsrKysrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfY29uZmlnZnMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdm
cy5jDQo+IGluZGV4IDU4MTk2Yjc1NzEyMzkuLjNiOWQyNGMwYmI1ODggMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9jb25maWdmcy5jDQo+IEBAIC0yNCw5ICsyNCwxMCBAQA0KPiAgICogPT09PT09PT09
DQo+ICAgKg0KPiAgICogQ29uZmlnZnMgaXMgYSBmaWxlc3lzdGVtLWJhc2VkIG1hbmFnZXIgb2Yg
a2VybmVsIG9iamVjdHMuIFhFIEtNRCByZWdpc3RlcnMNCj4gYQ0KPiAtICogY29uZmlnZnMgc3Vi
c3lzdGVtIGNhbGxlZCBgYCd4ZSdgYCB0aGF0IGNyZWF0ZXMgYSBkaXJlY3RvcnkgaW4gdGhlIG1v
dW50ZWQNCj4gY29uZmlnZnMgZGlyZWN0b3J5DQo+IC0gKiBUaGUgdXNlciBjYW4gY3JlYXRlIGRl
dmljZXMgdW5kZXIgdGhpcyBkaXJlY3RvcnkgYW5kIGNvbmZpZ3VyZSB0aGVtIGFzDQo+IG5lY2Vz
c2FyeQ0KPiAtICogU2VlIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvY29uZmlnZnMucnN0IGZv
ciBtb3JlIGluZm9ybWF0aW9uIGFib3V0DQo+IGhvdyBjb25maWdmcyB3b3Jrcy4NCj4gKyAqIGNv
bmZpZ2ZzIHN1YnN5c3RlbSBjYWxsZWQgYGB4ZWBgIHRoYXQgY3JlYXRlcyBhIGRpcmVjdG9yeSBp
biB0aGUNCj4gKyBtb3VudGVkDQo+ICsgKiBjb25maWdmcyBkaXJlY3RvcnkuIFRoZSB1c2VyIGNh
biBjcmVhdGUgZGV2aWNlcyB1bmRlciB0aGlzIGRpcmVjdG9yeQ0KPiArIGFuZA0KPiArICogY29u
ZmlndXJlIHRoZW0gYXMgbmVjZXNzYXJ5LiBTZWUNCj4gKyBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0
ZW1zL2NvbmZpZ2ZzLnJzdCBmb3INCj4gKyAqIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgaG93IGNv
bmZpZ2ZzIHdvcmtzLg0KPiAgICoNCj4gICAqIENyZWF0ZSBkZXZpY2VzDQo+ICAgKiA9PT09PT09
PT09PT09PQ0KPiBAQCAtMTE5LDcgKzEyMCw3IEBADQo+ICAgKg0KPiAgICogVGhlIGNyZWF0ZWQg
ZGV2aWNlIGRpcmVjdG9yaWVzIGNhbiBiZSByZW1vdmVkIHVzaW5nIGBgcm1kaXJgYDo6DQo+ICAg
Kg0KPiAtICoJcm1kaXIgL3N5cy9rZXJuZWwvY29uZmlnL3hlLzAwMDA6MDM6MDAuMC8NCj4gKyAq
CSMgcm1kaXIgL3N5cy9rZXJuZWwvY29uZmlnL3hlLzAwMDA6MDM6MDAuMC8NCj4gICAqLw0KPiAN
Cj4gIHN0cnVjdCB4ZV9jb25maWdfZ3JvdXBfZGV2aWNlIHsNCj4gDQo+IC0tDQo+IDIuNTAuMQ0K
DQo=
