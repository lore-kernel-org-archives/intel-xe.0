Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B117FC9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 07:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6689310F8AC;
	Fri, 25 Sep 2026 07:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCDbwcyD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843CE10F8AC;
 Fri, 25 Sep 2026 07:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790320676; x=1821856676;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TFcZ8WYn9H+MYeXy0p/z/I30rIzW1gUhbyR9/dY3PjQ=;
 b=CCDbwcyDzwSpJvQa2l8NVmWNAENOsHvitxMMzQkF7h6qJfs67HlOvtny
 JHQWZxVIqMPhWWcNGqtgtTyOYVt6NbOUqjl6mXtmep34gM1PkWAHt89Wd
 6CUbg/ACdgso2dMPDq8y1MrxbdooSoNU5U5kN3uD71bCGlmR8jCzVHZcv
 avD5NKrMofhW4Xbhz0l+18VbeWDeUd/PlVZ85vlslIml+cKQgqsah21SW
 moz+0X0K7l4nvXGAM2q16aRlGA78RhV9PfjhbuzOrNJlsJNPIhstjSwEo
 dO81Lq3i2z5o8BODS7PrBnIMJp91C1gyMYgG6tVAlJ8yMlVrwK40yapLv w==;
X-CSE-ConnectionGUID: rll8vQiQRoa5YXLfmdh8qA==
X-CSE-MsgGUID: cdJbbbc2Qo6AP3vtjXoxkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90229614"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="90229614"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 00:17:56 -0700
X-CSE-ConnectionGUID: riFshZLQTj2B2djt56uNRg==
X-CSE-MsgGUID: iXuwYRBNSWK9T/bFitSv8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="312189460"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 00:17:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 00:17:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 00:17:55 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 00:17:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTMMw0WOUZxi78LNv/wiCzg29zS92c3y9v+vy6ffsZ381PmAnWPDdlriM+m3ygB9dr2s9/v632SKSjMbR4wGVbK4j25mhvCpEbwa0g/nWjINBCwTJ2WVLv6HYdhZMrz2SXw0CYYWZEguhXRj5fhkkOp1guGukdFN4Jzwieyu9Q1VcmiOhwWVmsibWEKDhC7X0Gr2IEjabixDgEmIyy2nVCOeflBIF9cJY2euerga12s5o9URT0Pm3357MUFo4rTSN5V+FNkVUCANH+601+J1zylgcs5iscqjQIu9sZWBsTkz6PpHAJsdz9UvOMHppjgLDyfVNw2al0E/G6fq89YKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFcZ8WYn9H+MYeXy0p/z/I30rIzW1gUhbyR9/dY3PjQ=;
 b=R1ng5ixwJ7QPeej5DgkLCyzl/Aje0eO8eu8TwEt+m040j0UXZ+fqqT0TuMYA6SdoQ++ODpST/W5hLlDV/+Wa/E3OXe1NS+/EHCo1J8RY8FFRXQUkqrTBiDPOo+ANslmHJesbG4/ObTcNBJ5ZwM+Eth5VCg5skWVA573a+15sF/DMIkzsrN9GvUAOBBaLUon0sRZK781Wg0C/WW3XpauHe/7qkqhgdOY2Zey0qRPhrJtYNcFn84x/ec54yM7S8Vy1S+AZptux/GQVP6VVYJUFmgtuzDjK4PdSbIz3D++6fhLyU96sA6AkgBnnZLDF60fuQ5J19dqNZSvQuO6Ru5iZ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by CH3PR11MB8494.namprd11.prod.outlook.com
 (2603:10b6:610:1ae::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 07:17:46 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::4b5f:a185:133a:f36e]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::4b5f:a185:133a:f36e%7]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 07:17:46 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/psr: Track all joined pipes for frontbuffer
 tracking
Thread-Topic: [PATCH] drm/i915/psr: Track all joined pipes for frontbuffer
 tracking
Thread-Index: AQHdS1MSlnF4URbxYUSS7Qkd5rGwGrbds0KAgAExomA=
Date: Fri, 25 Sep 2026 07:17:46 +0000
Message-ID: <DS4PPF69154114FA8DC16EFF86ED46E84B8EF802@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20260923115941.746934-1-mika.kahola@intel.com>
 <20260923115941.746934-2-mika.kahola@intel.com>
 <346dd60f86bc532f6bff95040c6247b104ea46ba.camel@intel.com>
In-Reply-To: <346dd60f86bc532f6bff95040c6247b104ea46ba.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|CH3PR11MB8494:EE_
x-ms-office365-filtering-correlation-id: 461f5a55-e8e6-487d-7018-08df1ad51916
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10070799003|38070700021|10067099003|56012099006|4143699003|18002099003|22082099003|11063799006;
x-microsoft-antispam-message-info: hGYpQ2Fz8ysf1iAHA4OBvK0SE+4Q8ZpinnwvLZrVeSLIuuIuFcEZwvGOg6VH0kls9rYrfwBKS/I6idZNtp01CgjKpW9jUSlzx82Ry+zp+541hpbx1AFnwNOnHiuyE83YDs3Y4dgicxSCf3PSNS3wKdc+1sq10CXSaVB0zYCuUhIO3sgwcRg0InrLQ2meFTyhRlc/2piwqVI9ii2L7rmYJNGwX9YPhynR6iiH9hX9XDh3knuex1s5L47XERkH8209PiBHa79DMH/lsbHvZHD86x101onTc7xjwp1BUtJOcHm/NCsgLyJOa3cVic/SUztl1wmomOkpzQFSOUqY4cJYsCci/IPF8XtYxElUnyRoI/uUTCXp/1UDtB9UhBRGlow9LFQa+KQTBPZyvX3pqoqjL9sECSna5muC1XsFMlsGeyS5C7zaR/JshObK7P8NXNEXeV/942FjHpwmgtlKA4BY8iOzs/7RZ+DEuCnYynWd5eajF8OZU6nZN+csW/3QCjh0WlJSNk7MfkiFyOEk0H/Os/lfR/kbZVqP+NAJ1laR+dM2CCY71CZ+nyY0OkWOijLJyW5ebF3ld+j0W/4xYLMsEaa5DhG0/aUFnvUTCbPO3DTTfNm0VVMD4zVt8Kki/tcr14bhziOJdzQ8GGgun++OlKG22z+8mMWxdjCHe9Mk4JItaoEW5chFT4X8O6ACyezh88eOGQ6TSEcJI322/ETP9YyzwZIOcGnEjctJ25vHCgQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10070799003)(38070700021)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2ZNTktFclhEZU5ubTZRTU5PWXhsT1RYc0ZTTWU3eTFvbWtFRWdFRWxQbkpL?=
 =?utf-8?B?M2NqOWo5bFBtWEZDUTdSRkZyWi9OT01KRHJoajJwZG5GTkxJb0VpY1QxRmoy?=
 =?utf-8?B?SlZlcE9uYWxrU0RKZE00L2VtYW11Q3hDQUtVNmdabkZhblMvYUo4SVVhZUxa?=
 =?utf-8?B?dHZXWWFUTFBhaHkzdjhnZnM5dU4yN0tHbDR5UGN6T3F5MVVTSFlPc0RBUHNt?=
 =?utf-8?B?YzFUVlQ1V3d5NTZ5Z1o4WGpobWZrMWRycG1saTVCeWY3WVovT3g4Y2tnMGpJ?=
 =?utf-8?B?bVZEcHB6YlVIbjVzUTJvRnFBbHYxL1FWUk43SEVQU1AwcDhiemlYaEhtTEMz?=
 =?utf-8?B?NUVYZ3kzb05EbnZ6MjdMM2VzMmlZNmVZQThjeFM2S1pRR05wQTZQZmgvSWUz?=
 =?utf-8?B?N0liTGtES2IrN3FPVHVBTThMRWNZMGtRWFhBT3M2QzUzTk9oUHdZYjZVWGZO?=
 =?utf-8?B?cVorWVhvLzM3aVMyY2xRQysyaEVXYmNEMGhCRStCZXhqUzlyOFBPMHNHM2lI?=
 =?utf-8?B?VDdZZnBqNnEwTXQ4a3JzVW5YZThPK1lDQ2MxdWdUWkMzT2VYcjIxUjU4ZU9y?=
 =?utf-8?B?UzkzMlI5OFpEVWh5WEVZY3ZraEJ2aThqNW5LTHlmSEwrQ2loV2NYWU51dFZK?=
 =?utf-8?B?YTk3RUc3RmtCK0tQeWlNTjNkd2RjcmpDaUZHRGV1cUZKN2xrS0daQklORXhQ?=
 =?utf-8?B?WVBCVFBua2RyZkZ6UEk1cVk3NlE1NC91VjJ2ZDFYNHR3R05rTERVdGtzWkt3?=
 =?utf-8?B?dnNxUzdnUzE5UjZaOUxlNEpETnZ1OG9mYUQzY0hHenpXcWN1ay9LWHpMaDk2?=
 =?utf-8?B?UVRTSVU3RVBXOElhenM4UDhvTVl1UlBUNkNnazFScmM4Qy9lOTZyTHJpVkZl?=
 =?utf-8?B?TTUzcC81bW9zVEh1NHJRM3JjNDg4RHhtTlJRZWxFemZkM3VwSTlJaDNPbUNS?=
 =?utf-8?B?Y01VUnlUL0dPbmgwUHFkMnVZVzNmbXhvUkJqOEZEVmdlS0ptTEluSzhzeHcz?=
 =?utf-8?B?SHBNRDBRcnFRRkFUNkMvaGZwVFBFUEZ5M1ZsaW1YYWU3dVhhNFdaT1lyay9N?=
 =?utf-8?B?aFgveHFONTNyTEdzdkNhM29LdkxKWEhXaGxYRWg2MmdaaUVTNmdMWWxkQmFj?=
 =?utf-8?B?dGJTaVV1K3BJT1JWVldTWDFkaVdHNUxjZ0hTakpRZU5FcFBxYmExck9wR1F1?=
 =?utf-8?B?RitwNFd3WTAyMXdjVW1Vc2NzMDNhWGhOUGttR3VzUDJaVkVSbWhKcjZiKzg1?=
 =?utf-8?B?Y3E0UFRMRERrMjJVb2FiWDkxTWZ0TmIxV3RXK3I0TWNTZEJGSVJaWWxRQndq?=
 =?utf-8?B?VnZSaSt2ZFBQQUdFdmUxU0V1TlN4cENzZ0FmNURPTklYM3U0Ny81cnJiNjQ2?=
 =?utf-8?B?Y3N1VEI3Qyszc3pPbVFzcnh5aEZRQXZEUUxqN3N4RnZiK0xLVzg1d2tQanMw?=
 =?utf-8?B?R2hqMDdVbElEWmlpeEpLODZuT21USEFzVkZSb0Yza1psZkZIU1l4cFFKZ2xL?=
 =?utf-8?B?US8rOHdraEpUb2FNd0MzVTAzcDJNd1VCd0JVeG53WjBVc3JLYXhWTklMN2xp?=
 =?utf-8?B?TTZLQ1RXYVg1Zkc1aTlRZUViWFZLbndMMVR4empKbmZNM2hnblVRNkQvem9N?=
 =?utf-8?B?aGQ0N3VvVEJQaEdzL1UxV0xDWnFwZGxLSW12LzNzbXdvcGFNODAzZ1ZDWnFj?=
 =?utf-8?B?UFFyaGNNWHkwNHVCMFZZdzdvRXFYbHZuTGpmU2gvNEI0RldDaGFadkROUjh2?=
 =?utf-8?B?RFk3RndieGZmSDluZU9vVkF0dW9RV1FYb0VoakhiejZDa1JTUTUwS1lSR05a?=
 =?utf-8?B?QlRxbnFPcnRYaXhrcG5vb1RESEJPeGpyNTRZdlRwTTZEcE1jN2U4MnV5aXp6?=
 =?utf-8?B?WU9rRC80UjVLNFRsZzZsSldUTFlnRThhdmdGcTZEckw2d3BGemRhbUFPWTcy?=
 =?utf-8?B?YU5mM0ozdTRkMHpnK3Z1ako4dmtidDAvd3J3RVdQRFNzUWI1THYyMlRoVVFk?=
 =?utf-8?B?Rkx6SU9ZYndGRHhzelhBRk9hay80Vk1ubkZ6NWJIRG5qaWtZanVoK25MbzBS?=
 =?utf-8?B?NHYram9hWDFOZ2pHM1JjSVBOVW1leUozUTBlRFdLYlpPU1o0d1pnUUZZbk02?=
 =?utf-8?B?dldjVVEwN2gyOHVTTmpsVWIwMktqM0NPS0hkKy9FUzBRbjEvSEZBOEkrZ1Zy?=
 =?utf-8?B?bnowaWRWcFZRUWpnTzlxeFJjZjNYSitZOGJnWm1ieTUreTlmVUNFaUdGSmJ3?=
 =?utf-8?B?QWNJc1dvNTRCd28yWklrK2R2aFBzSkFmc2lIVHB2clJ4NzZSaExjaE95cWR5?=
 =?utf-8?B?OFRTK2JxcmFUMXlmeGRhNVRNRVdBR1ZudHF0T3c4QThKbjA5MXdNbWZkSkVh?=
 =?utf-8?Q?Y6iV3Kq23gqbkCxpC066EMG3nyBQeyvObJ8hf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xnwrQLzPlThW4IKGfqaOeAO/Ugzdp5tfkObRuwD7UyUv/mPDD+0QQVqwvdBRN3tpBI02lEGajTK6c7LHV3q8Et/sP9hTWIMwhjQKUlPPJ2JIQ2GotTTEEZx/sX46fIORY9P/UYID8wsfVwE38rCzPndl5nSecUx5WStsbBYMlv8qUV8HoJm1CPzyGVfbMkw0h90W/6LgNeg2fEGfzw9oiNVkBrL2GoDpU/1XvosEKszXb+dMchb3lpSjBZqjMk+7e1Zit84z17Q/1dDA4rE9pdA+98dNiwY4WgCK+n6eoFcF4qbSXiQVPDSGaI0vNL/ZZipmCEE1xYAMdAzQ+M8tbQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 461f5a55-e8e6-487d-7018-08df1ad51916
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 07:17:46.1063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WocA3BVU6O3zgedqefnEfV2XQa2cMBR8q2z5eyFcaF4P+hIFXMMBd2jo6ezWlYS+OlUaDCQmdlIjjbB3Y4xrUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8494
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIb2dhbmRlciwgSm91bmkgPGpv
dW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIDI0IFNlcHRlbWJlciAy
MDI2IDE2LjAyDQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEthaG9sYSwg
TWlrYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPjsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vaTkxNS9wc3I6IFRyYWNrIGFsbCBqb2lu
ZWQgcGlwZXMgZm9yIGZyb250YnVmZmVyIHRyYWNraW5nDQo+IA0KPiBPbiBXZWQsIDIwMjYtMDkt
MjMgYXQgMTE6NTkgKzAwMDAsIE1pa2EgS2Fob2xhIHdyb3RlOg0KPiA+IHBzci5waXBlIGlzIHRo
ZSBqb2luZXIgcHJpbWFyeSBvbmx5LCBzbyBmcm9udGJ1ZmZlciBiaXRzIGNvbWluZyBmcm9tDQo+
ID4gYQ0KPiA+IHNlY29uZGFyeSBwaXBlIGdldCBtYXNrZWQgb3V0IGFuZCB0aGUgdXBkYXRlIGdv
ZXMgdW5ub3RpY2VkLiBBZGQNCj4gPiBwc3IucGlwZV9tYXNrIGNvdmVyaW5nIGV2ZXJ5IGpvaW5l
ZCBwaXBlIGFuZCB1c2UgdGhhdCBpbnN0ZWFkLg0KPiA+DQo+ID4gTm8gZnVuY3Rpb25hbCBjaGFu
Z2UsIGpvaW5lciBpcyBzdGlsbCByZWplY3RlZCBpbiBjb21wdXRlX2NvbmZpZygpLg0KPiA+DQo+
ID4gQXNzaXN0ZWQtYnk6IENvcGlsb3Q6Y2xhdWRlLW9wdXMtNQ0KPiA+IFNpZ25lZC1vZmYtYnk6
IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqAuLi4v
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmjCoMKgwqAgfMKgIDEgKw0KPiA+
IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuY8KgwqDCoMKgwqAgfCAy
NyArKysrKysrKysrKysrKy0tLQ0KPiA+IC0tDQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDIxIGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgNCj4gPiBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oDQo+ID4gaW5kZXgg
NzlmMzA2NjBjMmI2Li4yZTZlMzY2MTY3NWMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaA0KPiA+IEBAIC0xNzk4
LDYgKzE3OTgsNyBAQCBzdHJ1Y3QgaW50ZWxfcHNyIHsNCj4gPiDCoAlib29sIGVuYWJsZWQ7DQo+
ID4gwqAJaW50IHBhdXNlX2NvdW50ZXI7DQo+ID4gwqAJZW51bSBwaXBlIHBpcGU7DQo+ID4gKwl1
OCBwaXBlX21hc2s7DQo+ID4gwqAJZW51bSB0cmFuc2NvZGVyIHRyYW5zY29kZXI7DQo+ID4gwqAJ
Ym9vbCBhY3RpdmU7DQo+ID4gwqAJc3RydWN0IHdvcmtfc3RydWN0IHdvcms7DQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gPiBpbmRleCA4NzJlMjUz
ZGIxNzguLjc2MjYwY2ViNDljYiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9wc3IuYw0KPiA+IEBAIC0zNiw2ICszNiw3IEBADQo+ID4gwqAjaW5jbHVkZSAi
aW50ZWxfY3Vyc29yX3JlZ3MuaCINCj4gPiDCoCNpbmNsdWRlICJpbnRlbF9kZGkuaCINCj4gPiDC
oCNpbmNsdWRlICJpbnRlbF9kZS5oIg0KPiA+ICsjaW5jbHVkZSAiaW50ZWxfZGlzcGxheS5oIg0K
PiA+IMKgI2luY2x1ZGUgImludGVsX2Rpc3BsYXlfaXJxLmgiDQo+ID4gwqAjaW5jbHVkZSAiaW50
ZWxfZGlzcGxheV9yZWdzLmgiDQo+ID4gwqAjaW5jbHVkZSAiaW50ZWxfZGlzcGxheV9ycG0uaCIN
Cj4gPiBAQCAtMTc5OCw2ICsxNzk5LDE5IEBAIHN0YXRpYyB2b2lkIHBzcjJfZGMzY29fZGlzYWJs
ZV93b3JrKHN0cnVjdA0KPiA+IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+IMKgCW11dGV4X3VubG9j
aygmaW50ZWxfZHAtPnBzci5sb2NrKTsNCj4gPiDCoH0NCj4gPg0KPiA+ICsvKiBGcm9udGJ1ZmZl
ciBiaXRzIGZvciBldmVyeSBwaXBlIGRyaXZpbmcgdGhpcyBQU1IvUGFuZWwgUmVwbGF5DQo+ID4g
aW5zdGFuY2UuICovDQo+ID4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgcHNyX2Zyb250YnVmZmVyX21h
c2soc3RydWN0IGludGVsX2RwICppbnRlbF9kcCkNCj4gPiArew0KPiA+ICsJc3RydWN0IGludGVs
X2Rpc3BsYXkgKmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KGludGVsX2RwKTsNCj4gPiArCXVu
c2lnbmVkIGludCBtYXNrID0gMDsNCj4gPiArCWVudW0gcGlwZSBwaXBlOw0KPiA+ICsNCj4gPiAr
CWZvcl9lYWNoX3BpcGVfbWFza2VkKGRpc3BsYXksIHBpcGUsIGludGVsX2RwLT5wc3IucGlwZV9t
YXNrKQ0KPiA+ICsJCW1hc2sgfD0gSU5URUxfRlJPTlRCVUZGRVJfQUxMX01BU0socGlwZSk7DQo+
ID4gKw0KPiA+ICsJcmV0dXJuIG1hc2s7DQo+ID4gK30NCj4gPiArDQo+ID4gwqBzdGF0aWMgdm9p
ZA0KPiA+IMKgcHNyMl9kYzNjb19mbHVzaF9sb2NrZWQoc3RydWN0IGludGVsX2RwICppbnRlbF9k
cCwgdW5zaWduZWQgaW50DQo+ID4gZnJvbnRidWZmZXJfYml0cykNCj4gPiDCoHsNCj4gPiBAQCAt
MTgxMyw4ICsxODI3LDcgQEAgcHNyMl9kYzNjb19mbHVzaF9sb2NrZWQoc3RydWN0IGludGVsX2Rw
DQo+ID4gKmludGVsX2RwLCB1bnNpZ25lZCBpbnQgZnJvbnRidWZmZXJfYml0cw0KPiA+IMKgCSAq
IEF0IGV2ZXJ5IGZyb250YnVmZmVyIGZsdXNoIGZsaXAgZXZlbnQgbW9kaWZpZWQgZGVsYXkgb2YN
Cj4gPiBkZWxheWVkIHdvcmssDQo+ID4gwqAJICogd2hlbiBkZWxheWVkIHdvcmsgc2NoZWR1bGVz
IHRoYXQgbWVhbnMgZGlzcGxheSBoYXMgYmVlbg0KPiA+IGlkbGUuDQo+ID4gwqAJICovDQo+ID4g
LQlpZiAoIShmcm9udGJ1ZmZlcl9iaXRzICYNCj4gPiAtCcKgwqDCoCBJTlRFTF9GUk9OVEJVRkZF
Ul9BTExfTUFTSyhpbnRlbF9kcC0+cHNyLnBpcGUpKSkNCj4gPiArCWlmICghKGZyb250YnVmZmVy
X2JpdHMgJiBwc3JfZnJvbnRidWZmZXJfbWFzayhpbnRlbF9kcCkpKQ0KPiA+IMKgCQlyZXR1cm47
DQo+ID4NCj4gPiDCoAltb2RfZGVsYXllZF93b3JrKGRpc3BsYXktPndxLnVub3JkZXJlZCwgJmlu
dGVsX2RwLQ0KPiA+ID5wc3IuZGMzY29fd29yaywNCj4gPiBAQCAtMTg0NSw3ICsxODU4LDcgQEAg
dm9pZCBpbnRlbF9wc3Jfc2V0X25vbl9wc3JfcGlwZXMoc3RydWN0DQo+ID4gaW50ZWxfZHAgKmlu
dGVsX2RwLA0KPiA+IMKgCWFjdGl2ZV9waXBlcyA9IGludGVsX2NhbGNfYWN0aXZlX3BpcGVzKHN0
YXRlLCBhY3RpdmVfcGlwZXMpOw0KPiA+DQo+ID4gwqAJY3J0Y19zdGF0ZS0+YWN0aXZlX25vbl9w
c3JfcGlwZXMgPSBhY3RpdmVfcGlwZXMgJg0KPiA+IC0JCX5CSVQodG9faW50ZWxfY3J0YyhjcnRj
X3N0YXRlLT51YXBpLmNydGMpLT5waXBlKTsNCj4gPiArCQl+aW50ZWxfY3J0Y19qb2luZWRfcGlw
ZV9tYXNrKGNydGNfc3RhdGUpOw0KPiANCj4gVGhpcyBjaGFuZ2UgaXMgbm90IHJlbGF0ZWQgdG8g
ZnJvbnRidWZmZXIgdHJhY2tpbmcuDQoNCkdvb2QgY2F0Y2ghIFRoaXMgc2hvdWxkbid0IGJlbG9u
ZyB0byBmcm9udGJ1ZmZlciB0cmFja2luZyBwYXRjaC4gSSB3aWxsIHNwbGl0IHRoaXMgaHVuayBh
cyBhIHNlcGFyYXRlIHBhdGNoLg0KDQpUaGFua3MhDQotTWlrYS0NCg0KPiANCj4gQlIsDQo+IA0K
PiBKb3VuaSBIw7ZnYW5kZXINCj4gDQo+ID4gwqB9DQo+ID4NCj4gPiDCoHZvaWQgaW50ZWxfcHNy
X2NvbXB1dGVfY29uZmlnKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ID4gQEAgLTIxNzUs
NiArMjE4OCw3IEBAIHN0YXRpYyB2b2lkIGludGVsX3Bzcl9lbmFibGVfbG9ja2VkKHN0cnVjdA0K
PiA+IGludGVsX2RwICppbnRlbF9kcCwNCj4gPiDCoAlpbnRlbF9kcC0+cHNyLnBhbmVsX3JlcGxh
eV9lbmFibGVkID0gY3J0Y19zdGF0ZS0NCj4gPiA+aGFzX3BhbmVsX3JlcGxheTsNCj4gPiDCoAlp
bnRlbF9kcC0+cHNyLmJ1c3lfZnJvbnRidWZmZXJfYml0cyA9IDA7DQo+ID4gwqAJaW50ZWxfZHAt
PnBzci5waXBlID0gdG9faW50ZWxfY3J0YyhjcnRjX3N0YXRlLT51YXBpLmNydGMpLQ0KPiA+ID5w
aXBlOw0KPiA+ICsJaW50ZWxfZHAtPnBzci5waXBlX21hc2sgPQ0KPiA+IGludGVsX2NydGNfam9p
bmVkX3BpcGVfbWFzayhjcnRjX3N0YXRlKTsNCj4gPiDCoAlpbnRlbF9kcC0+cHNyLnRyYW5zY29k
ZXIgPSBjcnRjX3N0YXRlLT5jcHVfdHJhbnNjb2RlcjsNCj4gPiDCoAkvKiBEQzUvREM2IHJlcXVp
cmVzIGF0IGxlYXN0IDYgaWRsZSBmcmFtZXMgKi8NCj4gPiDCoAl2YWwgPSB1c2Vjc190b19qaWZm
aWVzKGludGVsX2dldF9mcmFtZV90aW1lX3VzKGNydGNfc3RhdGUpICoNCj4gPiA2KTsNCj4gPiBA
QCAtMjM5NCw2ICsyNDA4LDcgQEAgc3RhdGljIHZvaWQgaW50ZWxfcHNyX2Rpc2FibGVfbG9ja2Vk
KHN0cnVjdA0KPiA+IGludGVsX2RwICppbnRlbF9kcCkNCj4gPiDCoAlpbnRlbF9kcC0+cHNyLnBz
cjJfc2VsX2ZldGNoX2NmZl9lbmFibGVkID0gZmFsc2U7DQo+ID4gwqAJaW50ZWxfZHAtPnBzci5h
Y3RpdmVfbm9uX3Bzcl9waXBlcyA9IDA7DQo+ID4gwqAJaW50ZWxfZHAtPnBzci5wa2dfY19sYXRl
bmN5X3VzZWQgPSAwOw0KPiA+ICsJaW50ZWxfZHAtPnBzci5waXBlX21hc2sgPSAwOw0KPiA+IMKg
CWNhbmNlbF9kZWxheWVkX3dvcmsoJmludGVsX2RwLT5wc3IuZGMzY29fd29yayk7DQo+ID4gwqAJ
aW50ZWxfZHAtPnBzci5kYzNjb19hbGxvd2VkID0gZmFsc2U7DQo+ID4gwqB9DQo+ID4gQEAgLTM2
MjcsOCArMzY0Miw3IEBAIHZvaWQgaW50ZWxfcHNyX2ludmFsaWRhdGUoc3RydWN0IGludGVsX2Rp
c3BsYXkNCj4gPiAqZGlzcGxheSwNCj4gPiDCoAkJCWNvbnRpbnVlOw0KPiA+IMKgCQl9DQo+ID4N
Cj4gPiAtCQlwaXBlX2Zyb250YnVmZmVyX2JpdHMgJj0NCj4gPiAtCQkJSU5URUxfRlJPTlRCVUZG
RVJfQUxMX01BU0soaW50ZWxfZHAtDQo+ID4gPnBzci5waXBlKTsNCj4gPiArCQlwaXBlX2Zyb250
YnVmZmVyX2JpdHMgJj0NCj4gPiBwc3JfZnJvbnRidWZmZXJfbWFzayhpbnRlbF9kcCk7DQo+ID4g
wqAJCWludGVsX2RwLT5wc3IuYnVzeV9mcm9udGJ1ZmZlcl9iaXRzIHw9DQo+ID4gcGlwZV9mcm9u
dGJ1ZmZlcl9iaXRzOw0KPiA+DQo+ID4gwqAJCWlmIChwaXBlX2Zyb250YnVmZmVyX2JpdHMpDQo+
ID4gQEAgLTM3MDgsOCArMzcyMiw3IEBAIHZvaWQgaW50ZWxfcHNyX2ZsdXNoKHN0cnVjdCBpbnRl
bF9kaXNwbGF5DQo+ID4gKmRpc3BsYXksDQo+ID4gwqAJCQljb250aW51ZTsNCj4gPiDCoAkJfQ0K
PiA+DQo+ID4gLQkJcGlwZV9mcm9udGJ1ZmZlcl9iaXRzICY9DQo+ID4gLQkJCUlOVEVMX0ZST05U
QlVGRkVSX0FMTF9NQVNLKGludGVsX2RwLQ0KPiA+ID5wc3IucGlwZSk7DQo+ID4gKwkJcGlwZV9m
cm9udGJ1ZmZlcl9iaXRzICY9DQo+ID4gcHNyX2Zyb250YnVmZmVyX21hc2soaW50ZWxfZHApOw0K
PiA+IMKgCQlpbnRlbF9kcC0+cHNyLmJ1c3lfZnJvbnRidWZmZXJfYml0cyAmPQ0KPiA+IH5waXBl
X2Zyb250YnVmZmVyX2JpdHM7DQo+ID4NCj4gPiDCoAkJLyoNCg0K
