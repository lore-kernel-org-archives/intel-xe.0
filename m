Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD46D70E1A
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 04:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72FF10E2A8;
	Fri, 29 Nov 2024 04:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bnM25Y8g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF6A10E2A8
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Nov 2024 04:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732854723; x=1764390723;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q9CXFLU1u9NMVkaG3AITGeY4S1PcSm8RPKfNI3zLLMs=;
 b=bnM25Y8grvuzeBsEcTCM8A7jaZWwm6spWGXhg+UwgbJxF0q+Ta/Zru33
 fY0UUdEiEXxvHsiwXmZbAxam/mWazxWGAMe/5BEir23r2oZjk4DalBtH5
 szol1PIBgWO3OtC4CNoDosWJRx/xuRNQPeFN9lcuxDi7o5VZ/5AecbRqr
 GWynYJEn4XHO8lUMwO6VbAYqlCmHMTkbtv8dqWS/kEri22KUwtEyLIKkp
 EwlMDramBPgb6EkDlyuv2kZtLCVnf4ytB25bLkqK7+tTgBu8okmzn8jmB
 dkeRVanXm7b4FAN33F8aoT3qtb3I4qNrngk2FO0KmJa2knrDWoqk06RzT A==;
X-CSE-ConnectionGUID: 8tESdKTWRe2SdvB4XTxkCA==
X-CSE-MsgGUID: T04sD1gqRk6ipxMtRFB1cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="37019858"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="37019858"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 20:32:03 -0800
X-CSE-ConnectionGUID: LMhAqmK3T12F6XZ83Y9DEA==
X-CSE-MsgGUID: 8iWrOwldSM+xI99lvpwYVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="97152314"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 20:32:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 20:32:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 20:32:02 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 20:32:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fj5oGRAfMq3ADImIolnPhXVao3BEajWWXFgeJKEzJIND383kmRbuMqII1Om8cCWp4/BwncHPdUMOSrhPabf1Y/EZ8B3QKMN2zBheFALbbJoz2zDxiiC5eD1mSQoPO/ZBdcT5vmYvDwqS9xwFDxYii/K2am7LDubEq5rh580LYeOowkCks+YCvMP+IaTYhbvv4tSMOUhSR43rptnWxet5vYTAelS6qXi1W86qwneSc5tOrIZV+dHjBI3eW7XdrJBMtHhfxv5dXT/3x3smcM8Za6EEddnkVqBi3cX4qMaGhh2+K7doMgEmm1JbaJtlv+BbbmVrKW7sv1ENCJksJamGrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9CXFLU1u9NMVkaG3AITGeY4S1PcSm8RPKfNI3zLLMs=;
 b=u1w6v58m7JUfau4BZXmo1u22bJkh2SHztJ6SEEdfdOJ60upc7tTC0C2fE/9AF9PVX4YBE6E5VS9SwBqIYd4p1cYVbLt+uQ0qBW9veGGfTnLrMEd8DMmjVbuW+cuH2+HKrd21Volle5TKs8naOcyRiQGfL/ZwJXXyK/SbFtP677t4rpMUO5OhNAspnYCjNr23Qg2yMPg92/0flNTk+4v757GH35Fv4aV6RQrGiqx58G+TEJFf4qVZDMJyDVhOIqj995pOEb65jB6/eVgjFDcYalJ4m9ZzoxXRWIoJNuRrmlETX5WogeBJHLo+GoJJHZbCzKE3YoZS/R1BE4TMurUnuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22)
 by SA1PR11MB8521.namprd11.prod.outlook.com (2603:10b6:806:3ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 04:31:59 +0000
Received: from PH8PR11MB8105.namprd11.prod.outlook.com
 ([fe80::b751:4be6:4838:79ab]) by PH8PR11MB8105.namprd11.prod.outlook.com
 ([fe80::b751:4be6:4838:79ab%7]) with mapi id 15.20.8182.018; Fri, 29 Nov 2024
 04:31:59 +0000
From: "Kumar, Shubham" <shubham.kumar@intel.com>
To: "Chegondi, Harish" <harish.chegondi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Ausmus,
 James" <james.ausmus@intel.com>, "Degrood, Felix J"
 <felix.j.degrood@intel.com>, "Souza, Jose" <jose.souza@intel.com>, "Cabral,
 Matias A" <matias.a.cabral@intel.com>, "Ranjan, Joshua Santhosh"
 <joshua.santosh.ranjan@intel.com>
Subject: RE: [PATCH v4 2/5] drm/xe/eustall: Introduce API for EU stall sampling
Thread-Topic: [PATCH v4 2/5] drm/xe/eustall: Introduce API for EU stall
 sampling
Thread-Index: AQHbHf6LBpf9TKExlkenyX9risvBXbK3JveAgAhbGwCAAT/8AIAAZNuAgAAlJgCAAo2+AIAH4/WAgAImeoA=
Date: Fri, 29 Nov 2024 04:31:59 +0000
Message-ID: <PH8PR11MB8105A7687409097A34C6E5C3E92A2@PH8PR11MB8105.namprd11.prod.outlook.com>
References: <cover.1728884074.git.harish.chegondi@intel.com>
 <a4ca443e9dc0e25ff4d77908f785cdfdf6c80f7f.1728884074.git.harish.chegondi@intel.com>
 <ZzYj53waEWwK/5za@orsosgc001> <Zz0mUGCKzLXI5Y13@intel.com>
 <851pz5loar.wl-ashutosh.dixit@intel.com> <Zz6HV+/Ya1nOReZE@orsosgc001>
 <85zfltjmv3.wl-ashutosh.dixit@intel.com>
 <85r073jfo9.wl-ashutosh.dixit@intel.com> <Z0dpXQ0JXwtRbqO0@intel.com>
In-Reply-To: <Z0dpXQ0JXwtRbqO0@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: harish.chegondi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8105:EE_|SA1PR11MB8521:EE_
x-ms-office365-filtering-correlation-id: 6d2c9c62-4788-47a4-e56d-08dd102ec399
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NndZYytveGZ1REg4d1NjNHFNdWhjNDE5VmJLYnBHUnBDOUhXQ21rZ090aVl4?=
 =?utf-8?B?NjN1RDc0UHRkSnFEbjR4UHRtempBYTJUZWR1TGxvaVgwTmJUdDFyVG5HdjA2?=
 =?utf-8?B?NStEV2J2U1dJRUU3MkdaL0l2MzhLR09nNHd3Q05neThlMktWRUYwMDFOaEhQ?=
 =?utf-8?B?V0FyOTFhTVJnNDZjL2xtV0c1bVJJdzF3VkV2VU1JSFhVOWp0LytXbjZtYy8r?=
 =?utf-8?B?ZHF5ZmJMVXlDUFQ0aExTOHhXRDBlVVJ5dkJNWCtQN3lEclBGWWlzZkRsaXNW?=
 =?utf-8?B?SGYxYUcxYnVWNk5ZNEhDVmY3OFB4UUIwZ2x1bUVDaSsvZjZwNGFWVjN5YlRM?=
 =?utf-8?B?SzRKd3FNVjlMVmp5cDJqTVZkZGQrb3YzZlI0ZDExNURkc2NiWFk1aVFybVdi?=
 =?utf-8?B?Tmx5T2YyZ25nSW1PcTVRb0RHMXRJSUxvanAzRHN4TEhod1Y4U0lrWXB6Nytt?=
 =?utf-8?B?bnFlVU5YaVNvT3gwMzJyQVNsRC9VcHRMdVBkcEpTalF5MVdMdWdOTjNkbTJU?=
 =?utf-8?B?cndrNlJaVTJZSTNqSjhUd0Z0eHdodE9jUmNDcVpjNXkxSTFZUVRZZm1DU0RC?=
 =?utf-8?B?eVVkZVdRdVJOU3hsUEVMTkw3cEMrUDc5UG1GdjVWLzZFUGlERlNWVnh3Zklk?=
 =?utf-8?B?SFE4OWFjM1NzYkoxSHFYWEw3LytmdFlobWhocTQrdk0rcnJGSkg2WWRKR3JL?=
 =?utf-8?B?V0Y3WFhoMGlENU55Zmduc00yWkhHVFVnVXJYN05PeEFJNHlncGQrSjJUalRU?=
 =?utf-8?B?QVNzNTJJdjMzSkxjQjAraVRCL2VhY0JzRUJ1b3RYaWN2YTdIZEJoTmdBaHVt?=
 =?utf-8?B?aXlzSEdZVVd3U2NON3FyaUFGc09SQzRQZlV2ZUNReU01bHdSSXVTTjcxU2gv?=
 =?utf-8?B?djdLcUNjV1FRWWRMQmZuQUdPbGxZNzAyRDVMS0xjaUNSSjhRQlRkYkVNV0NL?=
 =?utf-8?B?ellhK2NsVU9DTHMrSWlkQnpKUE55SjFwSnlreEs3aGJoSXkvWEE4aVRmK2hK?=
 =?utf-8?B?NUM5SWpQNTFiTXdHcWdDc05Kbnc1QXJCT2gzeFlpWFg3aGxHL091RzVYcVcw?=
 =?utf-8?B?OE5MTVZPdTZWc3NaQVphdjl4SGZ2azd0QTJxZURxaVU0WGQ1R0t6aUlQRW51?=
 =?utf-8?B?VHNOVjR3Mk14SHcrcUtCWUNuTkNTZ09MTUw0QkcxTlFqMldsZ2t3Z1lONFdy?=
 =?utf-8?B?YnBQcHFoanNwYUtNWnlWU1BENkp3Z1Y5SUVHMUhKREoycjVBSlQxN3NWSFpi?=
 =?utf-8?B?c1BFbmhoY2JVTjJWQ3dYUjAzZXdMNHJPcm15MlhQbHBsK0RSVG9TWVc5NVVn?=
 =?utf-8?B?cThtQXlkK1UxYWFjYXRiWkxsT2JoMG9tTXdleStraFRJcytSWjRBa0t1cmRa?=
 =?utf-8?B?TlZuR1pIMDRURXlCRVBPNUEvUC95WmFKSklEVk5mZ3prUXFEdGFyVStGMElB?=
 =?utf-8?B?K0Z4VG5GUmNHK1R2WHZmd0NtTWpDRzFMdHAxK2VKRndIVTVTZGhtTkZuOGxj?=
 =?utf-8?B?a2ZEY2FDWmp5bFFCTVQ4NFlrekZFYjAwSkxCVldCcC91V01iZTJLUWtNQ0hL?=
 =?utf-8?B?U2s1YWVhVTV3ZE8xb291UGUrWVROWjhNQTFxaTN2MTZQRlJRb0swYVN4S3hJ?=
 =?utf-8?B?WEdCbExBRkhLQzdDSFdwMkMyczY0aHlyTmRYRFpGU1NwaE93bmZDZ3JaSzIx?=
 =?utf-8?B?Yk43Mnl6MXN5Uk5KKzgrTVBibFV2QWRkMHY4c3BvSjY3TXphR3p1azVYaXA3?=
 =?utf-8?B?ZDBZR1NvTllBdDV6Y0lVQlhremprMVBWZXpOaE1lNzB2bmFHclo5Mm5Rak1o?=
 =?utf-8?B?RHZNd3lOUEV5MWhpOGNWc1VlU3ZrbXppdjFqSUQ5UnFjQ0x1TjFSZ2VGdGRv?=
 =?utf-8?B?L3JoOGFhbTRydTJFbjJhdHFSYmJQVnpZVVRXWTVUbUNuelE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8105.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWRhQU9wbWYvaDIvUnNXN0NPeVZsRWMrYXFrNXFLb2Z2cDdvcGtjSXZNRkYz?=
 =?utf-8?B?eWVXMWxabHRacUl4OERKSEljY2FrRFFrNmNpY3pIR0htTzhFVHhBVVh3V3BU?=
 =?utf-8?B?Ti9vMnFObVZ4UExIL25NTmlyRGxaNEI0NzNFd2ZxN1drTGhTMzdDNWRndmQz?=
 =?utf-8?B?eWFuczFyaldlK2VIY2U0djkvb2VDNHc3dm9aRHFXd0VnNHFzVzdId3pUK3Ix?=
 =?utf-8?B?cXRkVkFsME93V2V5UGphM1JZekthSG9TbTIzeGJSSmYvUW1UbGJ1VXFsRXEv?=
 =?utf-8?B?bzhpTFEzWW8vSncwR294YWhLdHlnbFR6K2VVUExNWXpERklPczBNMnExY1BV?=
 =?utf-8?B?Q0dsQXdpWmdIT0MyVCtmZUxIbzF6cE4xMVZUZ05XMW55Q1NRRmh0WW5DblAw?=
 =?utf-8?B?N1F2YWYrL3pSSVdNbUtBWU0vRmUwUWJ2TWl4Rm85RXkvcnJNVC9OM3RGWlN3?=
 =?utf-8?B?VGRWc0hoMGhRNEFZL0lPb202NmZ0OGNLNzZ1Z2VaZUJqQjJaRUg0MVcrd3VF?=
 =?utf-8?B?T3RWWDFtaytZZ3BKQUJIMnJmWmxrMnR1N3JERElHVXpGRlJYZzV5VjNqeG5H?=
 =?utf-8?B?dmp0cnJ0WjRVWko3Qlc5R0FIbzFIZFlhZjhNTXNFUWFqN0lnOTRMV0lhRXNk?=
 =?utf-8?B?aXB6eFJqbDFzdmZobmRtOHVQM3JzdjlOSWdYZkJuQTQrdVcxbEgzQ3pCUm5M?=
 =?utf-8?B?bEQyS2lSQlRVVDdna2MzbWJ6U1JlRmp1aW1rRER5czdnbzZodmkxNHE2SmFN?=
 =?utf-8?B?bWpjRkF0d0hhMHBsUURLSGMwT0ZaeWpkalMzQXVob0o1bURvU0o3c2JtcDVN?=
 =?utf-8?B?ZGMySDVINWhQUW1jRGRqblBqSnZ3aUg0aHc3UHVTbVRNUlI0NE1rcFNSYTd3?=
 =?utf-8?B?aklXYWs1clM2Wm9FS3U2VzducHdvaXEwZEkzOTJpL0lDaEVEeDk4Y2MxclZl?=
 =?utf-8?B?Tm1qM3VtTGszRkZTWS84TTFEQnRKaHlYUS9hblB6YWkyMUxDdFJQaEdSS0pa?=
 =?utf-8?B?aTZNTGsxV2crOGErWUNHZEo1emwvUEhYdE5FVTRyS3pmS0MwdzN5VGpVWDkw?=
 =?utf-8?B?OGpLSExCeDJ1Sk4zdTlIRnluZGxQenBWU0FadG8xNm45K3J6UmdPTVN2Uml4?=
 =?utf-8?B?L3lBeXJ5Q21CSTZ3MDdzbWhTdlVmc21jWmZkelduUkgycVpRUk9LRnhoSCt2?=
 =?utf-8?B?Y3BuTUFtWjJQTHBlei9LdkUxR3hWdVdyZG93TmJkMjVVVDhZYlpFb0hlK2g3?=
 =?utf-8?B?Q2t3TjJXNVJ3Y3Q5Njc5MkM5NE9tUlZSLzJwRGVGakVBN1lxL05SREhRYnoz?=
 =?utf-8?B?bzJXRkpndHZ4UVNoYy9QMTM3b3A4TWM3ZldyUUoxZmxnUis1U0Y0TDRQcUZa?=
 =?utf-8?B?dFV6NkpMSlVEYzZuajFmeWlMSzJISFZWNnFQVTUxWm9XdlRYTHFvVFVhUDl1?=
 =?utf-8?B?bjdhZ3lmcmovUVc3anE2VXJjMTRzM0s0MzVaMXQrWlhodTNPWVIraE0wQW1B?=
 =?utf-8?B?dE4xUVllU2dldWNCUHd4aytXNnhaaXZiZjEyVStsVVdMUlhSY1FJdVc4aXUw?=
 =?utf-8?B?T1p1UWFtTFRPS0kyaVVtZjE4aks4K201cklJUGtoQkVhdVpqSjRDQU4wTVp4?=
 =?utf-8?B?NlhBa1lZd0FuWDhvcGlqUkZUTktOTEU1c3krd3F3OWVnR05xNm9rMlFpUjg2?=
 =?utf-8?B?c1gwSU1TRTI5VkVsbnB5QWdkZXBPekpiNnU4TmZkK3BydzUyczBiWW5hZTZv?=
 =?utf-8?B?czlCVHNFcFZyZHpJWDNLY0drUDFLUzljdmxLSndPUFJQWUdhdEVVeVU0MkpN?=
 =?utf-8?B?L2JpWW11UkVHbE54b3RGbkY4WDFrbGpmSURENXZjMFFxS21ZeEpUSzR6disw?=
 =?utf-8?B?cmlaUHRHNk56NVN3bnQ3Y0lSWE12VVRIdnNmQmd4L2RRR2cxQ1VPbWV2ZlR5?=
 =?utf-8?B?L1hPbjgvVUVjY3FXenByaStWYUVQY2ovM2VWL2NaakpVdG9yMk9sN1E0Ykxp?=
 =?utf-8?B?QnVyMkFYRlY0RFJyYUZlMXVFbXgxY3lNL29MMXlEa2hlK0pyanpMZUswYWUv?=
 =?utf-8?B?WnR2WlZkVVFwMlFubzdKb0lOaEorSUJWUWQ3eGJEUWtzaEx2TlYyai9xQ2Nh?=
 =?utf-8?Q?No6XaAM98gU7K6Z26/EVt3mas?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8105.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2c9c62-4788-47a4-e56d-08dd102ec399
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 04:31:59.2161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eEt7ETC7UbJQER6BZjwl07x/wH7JeVy9WnsAXqhvyUWZtIbpC61gmtHj/3vc/PjjSrSQYAxqMbriTdjLNwKpMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8521
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

SGkgQENoZWdvbmRpLCBIYXJpc2gsDQoNCkZyb20gTDAgVU1EIHNpZGUgd2Ugd291bGQgcHJlZmVy
IHRvIGNhbGN1bGF0ZSB0aGUgc3VwcG9ydGVkIHNhbXBsaW5nIHJhdGVzIGFuZCBwYXNzIGl0IG9u
IHRvIEtNRC4gRm9yIHRoaXMgd2UgbmVlZCBhbiBxdWVyeSB0aGF0IGNhbiBleHBvc2UNCg0KMS4g
U2FtcGxpbmcgY2xvY2sgZ3JhbnVsYXJpdHkgaW4gbmFub3NlY29uZHMgLSBFLmcgMjUxICogZ3B1
Q2xvY2tQZXJpb2ROcw0KMi4gTWluIGFuZCBtYXggc2FtcGxpbmcgaW5wdXQgcmF0ZXMgc3VwcG9y
dGVkIC0gWzEsIDddDQoNClRoYW5rcywNClNodWJoYW0NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IENoZWdvbmRpLCBIYXJpc2ggPGhhcmlzaC5jaGVnb25kaUBpbnRlbC5jb20+
IA0KU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDI4LCAyMDI0IDEyOjE4IEFNDQpUbzogRGl4aXQs
IEFzaHV0b3NoIDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+DQpDYzogTmVybGlnZSBSYW1hcHBh
LCBVbWVzaCA8dW1lc2gubmVybGlnZS5yYW1hcHBhQGludGVsLmNvbT47IGludGVsLXhlQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgQXVzbXVzLCBKYW1lcyA8amFtZXMuYXVzbXVzQGludGVsLmNvbT47
IERlZ3Jvb2QsIEZlbGl4IEogPGZlbGl4LmouZGVncm9vZEBpbnRlbC5jb20+OyBTb3V6YSwgSm9z
ZSA8am9zZS5zb3V6YUBpbnRlbC5jb20+OyBDYWJyYWwsIE1hdGlhcyBBIDxtYXRpYXMuYS5jYWJy
YWxAaW50ZWwuY29tPjsgUmFuamFuLCBKb3NodWEgU2FudGhvc2ggPGpvc2h1YS5zYW50b3NoLnJh
bmphbkBpbnRlbC5jb20+OyBLdW1hciwgU2h1YmhhbSA8c2h1YmhhbS5rdW1hckBpbnRlbC5jb20+
DQpTdWJqZWN0OiBSZTogW1BBVENIIHY0IDIvNV0gZHJtL3hlL2V1c3RhbGw6IEludHJvZHVjZSBB
UEkgZm9yIEVVIHN0YWxsIHNhbXBsaW5nDQoNCk9uIEZyaSwgTm92IDIyLCAyMDI0IGF0IDEwOjE4
OjE0QU0gLTA4MDAsIERpeGl0LCBBc2h1dG9zaCB3cm90ZToNCj4gT24gV2VkLCAyMCBOb3YgMjAy
NCAxOToxODoyNCAtMDgwMCwgRGl4aXQsIEFzaHV0b3NoIHdyb3RlOg0KPiA+DQo+ID4gT24gV2Vk
LCAyMCBOb3YgMjAyNCAxNzowNToyNyAtMDgwMCwgVW1lc2ggTmVybGlnZSBSYW1hcHBhIHdyb3Rl
Og0KPiA+ID4NCj4gPiA+IE9uIFdlZCwgTm92IDIwLCAyMDI0IGF0IDExOjA0OjI4QU0gLTA4MDAs
IERpeGl0LCBBc2h1dG9zaCB3cm90ZToNCj4gPiA+ID4gT24gVHVlLCAxOSBOb3YgMjAyNCAxNTo1
OToxMiAtMDgwMCwgSGFyaXNoIENoZWdvbmRpIHdyb3RlOg0KPiA+ID4gPj4NCj4gPiA+ID4+ID4g
PiArLyoqDQo+ID4gPiA+PiA+ID4gKyAqIGVudW0gZHJtX3hlX2V1X3N0YWxsX3Byb3BlcnR5X2lk
IC0gRVUgc3RhbGwgc2FtcGxpbmcgaW5wdXQgcHJvcGVydHkgaWRzLg0KPiA+ID4gPj4gPiA+ICsg
Kg0KPiA+ID4gPj4gPiA+ICsgKiBUaGVzZSBwcm9wZXJ0aWVzIGFyZSBwYXNzZWQgdG8gdGhlIGRy
aXZlciBhcyBhIGNoYWluIG9mDQo+ID4gPiA+PiA+ID4gKyAqIEBkcm1feGVfZXh0X3NldF9wcm9w
ZXJ0eSBzdHJ1Y3R1cmVzIHdpdGggQHByb3BlcnR5IHNldCANCj4gPiA+ID4+ID4gPiArdG8gdGhl
c2UNCj4gPiA+ID4+ID4gPiArICogcHJvcGVydGllcycgZW51bXMgYW5kIEB2YWx1ZSBzZXQgdG8g
dGhlIGNvcnJlc3BvbmRpbmcgDQo+ID4gPiA+PiA+ID4gK3ZhbHVlcyBvZiB0aGVzZQ0KPiA+ID4g
Pj4gPiA+ICsgKiBwcm9wZXJ0aWVzLiBAZHJtX3hlX3VzZXJfZXh0ZW5zaW9uIGJhc2UubmFtZSBz
aG91bGQgYmUgDQo+ID4gPiA+PiA+ID4gK3NldCB0bw0KPiA+ID4gPj4gPiA+ICsgKiBARFJNX1hF
X0VVX1NUQUxMX0VYVEVOU0lPTl9TRVRfUFJPUEVSVFkuDQo+ID4gPiA+PiA+ID4gKyAqLw0KPiA+
ID4gPj4gPiA+ICtlbnVtIGRybV94ZV9ldV9zdGFsbF9wcm9wZXJ0eV9pZCB7DQo+ID4gPiA+PiA+
ID4gKyNkZWZpbmUgRFJNX1hFX0VVX1NUQUxMX0VYVEVOU0lPTl9TRVRfUFJPUEVSVFkJCTANCj4g
PiA+ID4+ID4gPiArCS8qKg0KPiA+ID4gPj4gPiA+ICsJICogQERSTV9YRV9FVV9TVEFMTF9QUk9Q
X1NBTVBMRV9SQVRFOiBTYW1wbGluZyByYXRlDQo+ID4gPiA+PiA+ID4gKwkgKiBpbiBtdWx0aXBs
ZXMgb2YgMjUxIGN5Y2xlcy4gVmFsaWQgdmFsdWVzIGFyZSAxIHRvIDcuDQo+ID4gPiA+PiA+ID4g
KwkgKiBJZiB0aGUgdmFsdWUgaXMgMSwgc2FtcGxpbmcgaW50ZXJ2YWwgaXMgMjUxIGN5Y2xlcy4N
Cj4gPiA+ID4+ID4gPiArCSAqIElmIHRoZSB2YWx1ZSBpcyA3LCBzYW1wbGluZyBpbnRlcnZhbCBp
cyA3IHggMjUxIGN5Y2xlcy4NCj4gPiA+ID4+ID4gPiArCSAqLw0KPiA+ID4gPj4gPiA+ICsJRFJN
X1hFX0VVX1NUQUxMX1BST1BfU0FNUExFX1JBVEUgPSAxLA0KPiA+ID4gPj4gPg0KPiA+ID4gPj4g
PiBXaGF0IGlzIHRoZSByYXRlIG9mIDI1MSBjeWNsZXM/IElmIHRoYXQgY2FuIGJlIGNsZWFybHkg
DQo+ID4gPiA+PiA+IGRlZmluZWQsIHRoZW4gYXQgZmlyc3QgZ2xhbmNlLCBJIHdvdWxkIHRoaW5r
IGl0J3MgYmV0dGVyIHRvIA0KPiA+ID4gPj4gPiBkZWZpbmUgdGhpcyBpbiB0ZXJtcyBvZiBmcmVx
dWVuY3kuIFRoZSBpbXBsZW1lbnRhdGlvbiBjYW4gDQo+ID4gPiA+PiA+IGRlY2lkZSBob3cgdG8g
dHJhbnNsYXRlIHRoYXQgdG8gSFcgY29uZmlndXJhdGlvbi4NCj4gPiA+ID4+ID4NCj4gPiA+ID4+
IFNpbmNlIHRoZSBkdXJhdGlvbiBvZiBhIGN5Y2xlIGRlcGVuZHMgb24gdGhlIEdQVSBjbG9jaywg
aXQgY2FuIA0KPiA+ID4gPj4gdmVyeSBmcm9tIEdQVSB0byBHUFUuIFNvLCBpZiB0aGVyZSBpcyBh
bnkgdHJhbnNsYXRpb24gaW4gdGhlIA0KPiA+ID4gPj4gZHJpdmVyLCBpdCB3aWxsIGhhdmUgdG8g
YmUgZGlmZmVyZW50IGZvciBlYWNoIEdQVS4gSSB0aGluayANCj4gPiA+ID4+IGtlZXBpbmcgdGhp
cyBpbnB1dCBhcyBhIG11bHRpcGxpZXIgb2YgY3ljbGVzIG1heSBiZSBtb3JlIGZ1dHVyZSANCj4g
PiA+ID4+IHByb29mIGZvciB0aGUgdUFQSS4gSSBhbSB0cnlpbmcgdG8gZ2V0IG1vcmUgaW5mb3Jt
YXRpb24gYW5kIGZlZWRiYWNrIGZyb20gdGhlIHVzZXIgc3BhY2UgcmVnYXJkaW5nIHlvdXIgc3Vn
Z2VzdGlvbi4NCj4gPiA+ID4+IElmIGl0IGlzIGZlYXNpYmxlLCBJIHdpbGwgaW1wbGVtZW50IGlu
IHY2Lg0KPiA+ID4gPg0KPiA+ID4gPiBVbWVzaCBoYXMgYSBwb2ludCBidXQgSSBzb3J0IG9mIGFn
cmVlIHdpdGggSGFyaXNoIGJlY2F1c2UgdGhpcyANCj4gPiA+ID4gdmFsdWUgaXMgZGlyZWN0bHkg
ZmVkIGludG8gYSByZWdpc3Rlci4gQnV0IHdlIGRvIG5lZWQgc29tZSBjaGFuZ2VzOg0KPiA+ID4g
Pg0KPiA+ID4gPiAxLiBUaGlzIDI1MSB2YWx1ZSBzaG93aW5nIHVwIGhlcmUgZG9lc24ndCBtYWtl
IGFueSBzZW5zZSBhbmQgbmVlZHMgdG8gZ28uDQo+ID4gPiA+IDIuIEFjY29yZGluZyB0byBCc3Bl
YyA2NDAzNiwgSFcgc3VwcG9ydHMgIjEyNyAqIE4iIHNhbXBsaW5nIHJhdGVzDQo+ID4gPiA+ICAg
KGluIHRlcm1zIG9mIGN5Y2xlcyksIHNvIHdlIHNob3VsZCBzdXBwb3J0IHRob3NlIHRvby4NCj4g
PiA+ID4gMy4gRXZlbiBoaWdoZXIgc2FtcGxpbmcgcmF0ZXMgKHNheSAxMHgpIGFyZSBiZWluZyBw
cm9wb3NlZCBmb3IgdGhlDQo+ID4gPiA+ICAgZnV0dXJlLiBTbyB0aGVzZSBzaG91bGQgYWxzbyBi
ZSBzdXBwb3J0ZWQuDQo+ID4gPiA+DQo+ID4gPiA+IFNvIG15IHByb3Bvc2FsIGlzIHNpbXBsZSwg
YnV0IGxldCdzIHNlZSBpZiBpdCBjYW4gYmUgbWFkZSB0byANCj4gPiA+ID4gd29yay4gVGhlIHVh
cGkgd2lsbCBkaXJlY3RseSBpbnB1dCB0aGUgc2FtcGxpbmcgcmF0ZSBpbiBudW1iZXIgDQo+ID4g
PiA+IG9mIGN5Y2xlcyAoc28gdGhlIHZhbHVlIGNvbWluZyBpbiBpcyB3aGF0IHRoZSBHUFUgZnJl
cSBpcyANCj4gPiA+ID4gZGl2aWRlZCBieSkuIFNvIGUuZy4gaWYgIjMgKiAyNTEiIGlzIHJlcXVp
cmVkICIzICogMjUxIiB3aWxsIA0KPiA+ID4gPiBjb21lIGluIHRocm91Z2ggdGhlIHVhcGkuIElm
IFVNRCB3YW50cyAiNyAqIDEyNyIsIHRoZXkgd2lsbCBzZW5kIA0KPiA+ID4gPiBpbiAiNyAqIDEy
NyIuIFRoZSBkcml2ZXIgd2lsbCBpbnRlcm5hbGx5IG1hcCB0aGlzIHZhbHVlIGludG8gdGhlICJj
bG9zZXN0IiBzYW1wbGluZyByYXRlIHN1cHBvcnRlZCBieSBIVy4NCj4gPiA+ID4NCj4gPiA+ID4g
SSBhbSBhc3N1bWluZyB0aGF0IFVNRCdzIGFscmVhZHkga25vdyB3aGF0IHNhbXBsaW5nIHJhdGVz
IGFyZSANCj4gPiA+ID4gc3VwcG9ydGVkIGJ5IGEgcGFydGljdWxhciBIVyBwbGF0Zm9ybSBzbyB0
aGV5IGNhbiBzZW5kIGluIHRoZSANCj4gPiA+ID4gZXhhY3QgdmFsdWUgdGhleSBuZWVkLiBPdGhl
cndpc2UgdGhlIGRyaXZlciBjYW4gYWx3YXlzIG1hcCB0aGUgDQo+ID4gPiA+IHZhbHVlIHNlbnQg
YnkgdXNlcnNwYWNlLiBTYXkgVU1EIHNlbmRzIGEgdmFsdWUgMTAsIHRoaXMgd2lsbCBiZSANCj4g
PiA+ID4gbWFwcGVkIGludG8gIjEgKiAxMjciIHdoaWNoIGlzIHRoZSBjbG9zZXN0IHNhbXBsaW5n
IHJhdGUgc3VwcG9ydGVkIHRvIDEwLg0KPiA+ID4gPg0KPiA+ID4gPiBTbyB0aGlzIHdheSBhbGwg
c2FtcGxpbmcgcmF0ZXMgY2FuIGJlIHN1cHBvcnRlZC4gVU1EIGp1c3Qgc2F5cyBJIA0KPiA+ID4g
PiB3YW50IGEgc2FtcGxpbmcgcmF0ZSBvZiAiR1BVX2ZyZXEgZGl2aWRlZCBieSAxMCIgYW5kIHRo
ZXkgDQo+ID4gPiA+IGF1dG9tYXRpY2FsbHkgZ2V0IHdoYXRldmVyIGlzIHRoZSBjbG9zZXN0IGF2
YWlsYWJsZS4gVGhleSANCj4gPiA+ID4gcHJvYmFibHkgZG8gbmVlZCB0byBoYXZlIGFuIGlkZWEg
b2Ygd2hhdCByYXRlcyBhcmUgc3VwcG9ydGVkIG9uIA0KPiA+ID4gPiBhIHBhcnRpY3VsYXIgSFcg
cGxhdGZvcm0sIEkgYW0gYXNzdW1pbmcgdGhleSBoYXZlIHRoaXMgDQo+ID4gPiA+IGluZm9ybWF0
aW9uIGZyb20gQnNwZWMsIHNvIHRoZXkgY2FuIHNlbmQgaW4gZXhhY3QgdmFsdWVzIGlmIHRoZXkg
a25vdyBhbmQgZHJpdmVyIHdpbGwgYmUgYWJsZSB0byBzZXQgdGhlIGV4YWN0IHZhbHVlIFVNRCBo
YXMgc3BlY2lmaWVkLg0KPiANCj4gVGhpcyBpcyBhbiBpbXBvcnRhbnQgcG9pbnQgaGVyZS4gQ2Fu
IHdlIGFzc3VtZSBVTUQncyBhbHJlYWR5IGtub3cgdGhlIA0KPiBzYW1wbGluZyByYXRlcyBhdmFp
bGFibGUgb3Igbm90PyBLTUQgY2FuIGhhbmRsZSB3aGF0ZXZlciB2YWx1ZSBVTUQgDQo+IHNlbmRz
IGluIGJ1dCBVTUQgc3RpbGwgaGFzIHRvIGhhdmUgYW4gaWRlYSBvZiB3aGF0IHNhbXBsaW5nIHJh
dGVzIGFyZSANCj4gc3VwcG9ydGVkIGJ5IEtNRCwgdG8gYmUgYWJsZSB0byBzZXQgYW4gYWNjZXB0
YWJsZSBzYW1wbGluZyByYXRlLg0KPiANCj4gT3RoZXJ3aXNlLCBLTUQgd2lsbCBuZWVkIHRvIGV4
cG9zZSB3aGF0IHNhbXBsaW5nIHJhdGVzIGFyZSBzdXBwb3J0ZWQgDQo+IHRvIFVNRC4gVGhlcmUg
c2VlbSB0byBiZSBhIGNvdXBsZSBvZiB3YXlzIG9mIGRvaW5nIHRoaXM6DQo+IA0KPiAxLiBLTUQg
Y2FuIGV4cG9zZSB0aGUgYXZhaWxhYmxlIHNhbXBsaW5nIHJhdGVzIGluIA0KPiBkcm1feGVfcXVl
cnlfZXVfc3RhbGwNCj4gDQo+IE9yLA0KPiANCj4gMi4gVGhlIFVNRCBjYW4gc2V0IHRoZWlyIHNh
bXBsaW5nIHJhdGUgYW5kIHRoZSBhY3R1YWwgc2FtcGxpbmcgcmF0ZSBzZXQgYnkNCj4gICAgS01E
IGZvciB0aGF0IHN0cmVhbSBjYW4gZXhwb3NlZCB0aHJvdWdoIERSTV9YRV9PQlNFUlZBVElPTl9J
T0NUTF9JTkZPDQo+ICAgIGlvY3RsLiBJZiBVTUQgZG9lc24ndCBsaWtlIHRoZSBzYW1wbGluZyBy
YXRlIHNldCBieSBLTUQgdGhleSBjYW4gY2xvc2UNCj4gICAgdGhlIHN0cmVhbSBhbmQgcmVvcGVu
IGEgbmV3IHN0cmVhbS4gQmFzaWNhbGx5IHRoZXkgd291bGQgbmVlZCB0byBpdGVyYXRlDQo+ICAg
IHRvIGFycml2ZSBhdCBhbiBhY2NlcHRhYmxlIHNhbXBsaW5nIHJhdGUuDQo+IA0KPiBPciwNCj4g
DQo+IDMuIEtNRCBkb2VzIG5vdGhpbmcsIGFzc3VtZXMgVU1EJ3Mga25vdyB0aGUgc2FtcGxpbmcg
cmF0ZSAib3V0IG9mIGJhbmQiIHZpYQ0KPiAgICB0aGluZ3Mgc3VjaCBhcyBCc3BlYy4NCj4gDQo+
IEknbSB0aGlua2luZyBtYXliZSBzaG91bGQgZXhwb3NlIHRoZSBtaW4gYW5kIG1heCBzYW1wbGlu
ZyByYXRlcyB0aHJvdWdoIDEuDQo+IGFuZCBVTUQncyBjYW4gc2VsZWN0IHNvbWV0aGluZyBpbiBi
ZXR3ZWVuIGFuZCBLTUQgY2FuIG1hcCB0aGF0IHRvIG9uZSANCj4gb2YgdGhlIHNhbXBsaW5nIHJh
dGVzIGF2YWlsYWJsZSBpbiBIVyBhbmQgbWF5YmUgYWxzbyBleHBvc2UgdGhlIGZpbmFsIA0KPiBz
YW1wbGluZyByYXRlIHRocm91Z2ggMi4NCj4gDQo+IFNvIGUuZy4gZm9yIG5vdyBtaW4gYW5kIG1h
eCBleHBvc2VkIHdvdWxkIGJlIDEqMjUxIHRocm91Z2ggNyoyNTEgDQo+IChpZ25vcmluZyB0aGUg
MTI3IHN0dWZmIGZvciBub3cpLiBNaW4vbWF4IG1pZ2h0IGJlIG1vcmUgZnV0dXJlIHByb29mIA0K
PiBzaW5jZSBIVyBjaGFuZ2VzIHRvIGEgZGlmZmVyZW50IHNjaGVtZSwgcmF0aGVyIHRoYW4gaGF2
ZSA3IG9yIDE0IGZpeGVkIA0KPiBzYW1wbGluZyByYXRlcyB0aGV5IGhhdmUgbm93Lg0KDQpBcyBv
ZiBub3csIHRoZSBkcml2ZXIgc2V0cyBhIG1lZGl1bSBzYW1wbGluZyByYXRlIGFzIGRlZmF1bHQg
aWYgdGhlIHVzZXIgZG9lc24ndCBwYXNzIGFueSBzYW1wbGluZyByYXRlIHRocm91Z2ggdGhlIHBy
b3BlcnRpZXMuIEluIHRoaXMgcGF0Y2ggc2VyaWVzLCA0IGlzIHRoZSBkZWZhdWx0IHNhbXBsaW5n
IHJhdGUgd2hpY2ggaXMgdGhlIG1pZCBwb2ludCBiZXR3ZWVuIDEsIHRoZSBmYXN0ZXN0IHNhbXBs
aW5nIHJhdGUgYW5kIDcsIHRoZSBzbG93ZXN0IHNhbXBsaW5nIHJhdGUuIEl0IHdvdWxkIGJlIGdv
b2QgdG8gZ2V0IGZlZWRiYWNrIGZyb20gdGhlIFVNRHMgb24gd2hpY2ggc2FtcGxpbmcgcmF0ZXMg
YXJlIHR5cGljYWxseSB1c2VkLiBBcyBvZiBub3csIE1lc2EgaXMgc2V0dGluZyB0aGUgc2FtcGxp
bmcgcmF0ZSB0byB0aGUgZmFzdGVzdCAtIDEuDQpJZiB0aGUgZHJpdmVyIGV4cG9zZXMgdGhlIG1p
biBhbmQgbWF4IHNhbXBsaW5nIHJhdGVzIGFuZCBzZXRzIHRoZSBtaWQgcG9pbnQgYXMgdGhlIGRl
ZmF1bHQgc2FtcGxpbmcgcmF0ZSwgdGhlIHVzZXIgY2FuIG92ZXJyaWRlIHdpdGggdGhlIGZhc3Rl
c3Qgb3IgdGhlIHNsb3dlc3Qgc2FtcGxpbmcgcmF0ZSBvciBhbnkgb3RoZXIgcmF0ZSBpbiBiZXR3
ZWVuLg0KDQpUaGFua3MNCkhhcmlzaC4NCj4gDQo+ID4gPg0KPiA+ID4gSSBhbSBva2F5IHdpdGgg
d2hhdGV2ZXIgbWFrZXMgc2Vuc2UgZnJvbSBhIFVNRCBwZXJzcGVjdGl2ZSBhbmQgDQo+ID4gPiB3
aGF0ZXZlciBjYW4gYmUgZXh0ZW5kZWQgZWFzaWx5IGluIGZ1dHVyZS4gSnVzdCB0aGUgY3ljbGVz
IGFzIHlvdSANCj4gPiA+IGFyZSBzdWdnZXN0aW5nIHNob3VsZCBiZSBnb29kIGFzIHdlbGwuDQo+
ID4NCj4gPiBNeSBzdWdnZXN0aW9uIGlzIGp1c3QgdGhlIGludmVyc2Ugb2Ygc2FtcGxpbmcgZnJl
cSwgaW4gYSBzZW5zZSwgaS5lLg0KPiA+DQo+ID4JZXUgc3RhbGwgc2FtcGxpbmcgZnJlcSA9IGdw
dSBmcmVxIC8gTg0KPiA+DQo+ID4gU28gd2UgZ2V0IE4gdGhyb3VnaCB0aGUgdWFwaS4NCj4gPg0K
PiA+ID4gSnVzdCBjdXJpb3VzLCBzaW5jZSB0aGUgZ3B1IGZyZXF1ZW5jeSBpcyBtYXkgdmFyeSwg
YW55IGlkZWEgaG93IA0KPiA+ID4gdGhlIFVNRHMgbWFwIHRoaXMgZGF0YSB0byB0aGVpciB0aW1l
bGluZT8NCj4gPg0KPiA+IE5vdGUgdGhhdCB3ZSBhcmUgZGVhbGluZyB3aXRoIHRoZSBzYW1wbGlu
ZyBmcmVxIGhlcmUsIHRoZSBmcmVxIGF0IA0KPiA+IHdoaWNoIGV1IHN0YWxsIGRhdGEgaXMgc2Ft
cGxlZCwgc2F5ICAxIC8gbiAqIDI1MSBvciAxIC8gbiAqIDEyNyBvZiANCj4gPiBncHUgZnJlcS4g
QnV0IHllcyBzYW1wbGluZyBmcmVxIGNhbiB2YXJ5IHdpdGggZ3B1IGZyZXEuDQo+ID4NCj4gPiBC
dXQgb3RoZXJ3aXNlIFVNRCdzIGRvbid0IGRlYWwgd2l0aCB0aW1lIHZlcnkgbXVjaCwgb25seSB0
aGUgSVAgDQo+ID4gKGluc3RydWN0aW9uIHBvaW50ZXIpLiBTbyBlLmcuIGV1IHN0YWxsIGRhdGEg
Y29udGFpbnM6IGJhc2ljYWxseSBJUCANCj4gPiB4IHdhcyBzdGFsbGVkIGZvciB5IGN5Y2xlcyBp
biB0aGlzIHNuYXBzaG90L3NhbXBsZS4gU2luY2UgSVAgaXMgDQo+ID4gdW5pcXVlLCBpdCBjYW4g
YmUgbWFwcGVkIHRvIGEgbGluZSBvZiBjb2RlIGZvciBhbiBldSBrZXJuZWwgZS5nLg0KPiA+DQo+
ID4gU28gSSBndWVzcyB0aGVyZSBpcyBhbHNvIGFuIGFwcHJveGltYXRlIG5vdGlvbiBvZiB0aW1l
LCBzbyB3aGVuIHRoaXMgDQo+ID4gZXUga2VybmVsIHdhcyBzYW1wbGVkIChvciByYW4pIHRoZSBm
aXJzdCB0aW1lLCBJUCB4IHdhcyBzdGFsbGVkIGZvciANCj4gPiB5IGN5Y2xlcywgd2hlbiBpdCB3
YXMgc2FtcGxlZCB0aGUgbmV4dCB0aW1lLCBJUCB3IHdhcyBzdGFsbGVkIGZvciB6IA0KPiA+IGN5
Y2xlcy4gU28geW91IHdvdWxkIGhhdmUgYSBraW5kIG9mIG1vdmluZyB3aW5kb3cgZm9yIHRoZSBz
dGFsbCANCj4gPiB0aW1lcyBmb3IgYSBwYXJ0aWN1bGFyIElQLiBTbyBpdCdzIGJhc2VkIG9uIElQ
LCByYXRoZXIgdGhhbiB0aW1lIGRpcmVjdGx5Lg0KPiA+DQo+ID4gQXQgbGVhc3QgdGhhdCdzIGhv
dyBJIHRoaW5rIGl0IHdvcmtzIDovDQo=
