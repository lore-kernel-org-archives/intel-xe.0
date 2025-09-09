Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0DDCA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 19:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBA310E7CA;
	Tue,  9 Sep 2025 19:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S90tKGxh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F34710E7CA
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 19:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757444887; x=1788980887;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=j1kfk73fAEofnYsy8j70WYEW6ZITJfrIRFXhwYYJYII=;
 b=S90tKGxhTz+L+DDoJVKRlh6u+vKWnEcjDqE4VFWuaFCAZUDbFCaaNqEV
 WBXjuEaNm7tmRfwrszjwWcGuwWxai3p71SzWnBJ/UmIEvHc1O/98z9j4d
 0F4hoF1PzuSqDpzaXDpaiuORz4BPTbzyNiH4RL94ljcQogDIvjOkFUG6E
 yhg9i4J0Mg8fI1KO2icmdlcYfrTVakKsQtgIqD6BqZbafekRfAvFnjYdZ
 pDTHcVbfYwh/ZRZY1mO4C5gJA1XL6c6rGNsJT+5+KqxjZrsE4+fGhVBhY
 lp9SGAOvAjot4hDN0I1ADIRHqtl5wu9BQ8GEKqiDGunHoFhUJuA+87RTt w==;
X-CSE-ConnectionGUID: tP6S6j2KQdKw+yfPQ0/Nsw==
X-CSE-MsgGUID: +ngXCrR9Q5Wf3adGXoHcPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59600450"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="59600450"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 12:08:06 -0700
X-CSE-ConnectionGUID: STB7JzJbSTyy2tqey3FDzA==
X-CSE-MsgGUID: 5jzCHiHjTBGx+vLGfJc8rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="203941103"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 12:08:06 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 12:08:05 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 12:08:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.84) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 12:08:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AD+Oj6nMkWr68tnYNnX/zhH0h/Gba6iV28nrSo/GyyLS0Zv+/c2jbD4LJz9j/tu6O8DkEbsmCkCceWV4ErIqsWY5f0AXO7HYh8VMRhEeFW0QdWAo5vhZp6QyrQQzQys4bPHsV7gkTzGEQNBiLryiTxMvvhpZ2WJclxpcZac5GGbsC++jhx/017VbkHTZjiCkEeSLUYKpdW8C+eKkE2eo3g/3XlLyDUVRwfRO2wJI22gYso0HefnR/xD3TlbIAj6Y7JXtGVAf3lve5A4Xdq8aRjC9GeGs5XRfHH9rAkGZi5mXeOx+7HFLadbmtUPsLfxnyUgzJ6qOpq2OVH39UgMBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1kfk73fAEofnYsy8j70WYEW6ZITJfrIRFXhwYYJYII=;
 b=p5B4Zl1ASEs7vG5ssduOxpRqv23O3ixIgSL57/Xvq+V6W9mP6r8VNzlxF2oF+2UaJ9rokN0E1u6rLeySFxmi7cB47EmBdgj9aCs0VRpv+T4Qgbntziwbub5CGfCYxH7ed5mXcBI/EZTLeYKFy/5C+BJ5Yz1hLYyzvVLD7DCr7WsUFOUbLJ7n0Vb2kDLPIt5HjWb2jVGg44SB5VmkS1qkHoz3IeN2y/Xw+z0bmNKJB13daPtfaDwg4FkSCv34cRXnWPk1Q856kiK8ZvbcmJNwE0SokmHX1RMCM6xy3OkH73ANLDDDBORxp0iaJsPQfcB6bKSTsqhmgX/+H0LStO4lLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH0PR11MB5015.namprd11.prod.outlook.com (2603:10b6:510:39::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Tue, 9 Sep 2025 19:08:03 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 19:08:03 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>
Subject: Re: [RFC 2/2] drm/xe/gt_pagefault: Add tracepoints when handing page
 faults
Thread-Topic: [RFC 2/2] drm/xe/gt_pagefault: Add tracepoints when handing page
 faults
Thread-Index: AQHcIZsyVRELalHG0UmNU0YiA5xEj7SLNucA
Date: Tue, 9 Sep 2025 19:08:03 +0000
Message-ID: <8fd9e885a3b8cbaa422ff7825fa93c8083aa36c8.camel@intel.com>
References: <20250909150437.986365-1-francois.dugast@intel.com>
 <20250909150437.986365-3-francois.dugast@intel.com>
In-Reply-To: <20250909150437.986365-3-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH0PR11MB5015:EE_
x-ms-office365-filtering-correlation-id: ba524fda-63ac-45aa-41bc-08ddefd43366
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dlY5b1E0b25YN2NqbVdGMHE2S2NaQ0hFU3JQZ21sTVQ4MGNIK2h5ZHJGdlpS?=
 =?utf-8?B?dUtTZGdyaUw2NWNhUXZFNVFqQUxtVW1Xa2QyNlo4bTFPWVlWeUJwbFEvM0dJ?=
 =?utf-8?B?SlVXQXRNd1NXTHlZWldFcCtGbCs5Si9DTHllMVU1bEd6SDYvOVNjN2UzZjYy?=
 =?utf-8?B?bzFTaSt0VUxidk1aRFIwT2FJNGRDdXBqRCttYWJnRTAvd1NoaC9RZkJSRitP?=
 =?utf-8?B?Z3dpNmIwR0JESG1PYXBKVENXcmJVMUM5RVVrS3lJbUtKTFBYZnBGcEZ1KzFu?=
 =?utf-8?B?U2lTcWM5T0VZQlVYM2ZZZ3d5S0N0Qi9MZDlkVWZFdDlzbHgycWFZaUNDa1Fa?=
 =?utf-8?B?M3V1V0FYVGVQcWd5cUhtSmlNdi9CcjMyT296SllEdFhzVDl0Rzl1NEF3bEV2?=
 =?utf-8?B?M3NiK2g4Z2ZQTUNHZXg4UDJLK2RyUzByQ2p0eVd6aDFzOVBzY0Yxb2R0Wkli?=
 =?utf-8?B?eVFUd2xSSWkvYThtenM4RU9TbWFxd3ZaYWp0ZFBSblV5bEdjUTYzR2NNZnoz?=
 =?utf-8?B?dnNyanVoakJUdXhiOFBTdUNSTWFVK3lwamRhTDNFYkJIaVhtQkVTNm40TGZr?=
 =?utf-8?B?NDVJWUlleUozc0MwR091WHNoZWhoUXZZNXZHdVQ1T09nNW1FVW5wZnVOajI0?=
 =?utf-8?B?TFptSytxUm5ubkpwSUVHZ0pRYjFQdmFMWU8wdnF0QllLQllPKzkzUW1qOGRN?=
 =?utf-8?B?cDZyM3p6YlQ5a3dCWFJzb3VjY1FvcGlhaFRBSkpoaFh2WGFhand6Mk16UzZu?=
 =?utf-8?B?Z0RxcStxM1JzbU9qUHQ0dUdUT1E0ZDRRNzBRbVQ4V0xsRlhTM092Wm8rckpC?=
 =?utf-8?B?SEhKdHJ2VkpOTGZ0czBZemY4dWs5Wmt5Q2N6M2pjZ29XdjlMOVl1Rk95RmZR?=
 =?utf-8?B?elkvL1JMcHVmVXpRbWxJZkFibzFwcEJSajVYbDlXV3Z4YWFxTDBDeXRWbWF4?=
 =?utf-8?B?SUcxV0U0ZUxMUjNzSWYrbitBZ2MwTGtONXFRUUk3NlZaMlovWGdya1EyN2xK?=
 =?utf-8?B?RzBLZU5lUm1rUkRQR3FMU1Z6a0x0RVBMR1RUVFdVanIxZGdpVzBNeFU1UWN3?=
 =?utf-8?B?YVFxTTh2cG55U1c5QUk1L2E2UUNNUStiNEpDRWF6S01PVjJsS0hNdlZpYW1i?=
 =?utf-8?B?S0F3V0NtVDh1NzV6UHJNcGpBbFJKNmVJVklPMllMdVZBRGNZYU05NXR2TmJ4?=
 =?utf-8?B?NERiWEM3blRzZDFLdVpDRGFoaU8rSDdJa0ZyS09kMElkdnhJV1dZRzJVREZP?=
 =?utf-8?B?U2lxTFNXemtuTzZpeEZlUzdTRTRLbTdHRWJzUHN0SGk1SnVJM0FaQUlBbDkv?=
 =?utf-8?B?akg3eFZacmlGODZWdnlsRUNBZ1VyWElyNzdnRko4TW9Gemxwbkgvd2preDFN?=
 =?utf-8?B?SS9jRit4dDdxVjZ2dlhUUTFmZHpieFlhN3Fwcm5reG1yQTRHdWNxQ3B4amFG?=
 =?utf-8?B?b3N4ZUs0T0lycXAyOTFlaTkvK3lDWG1YL0lvOE9qd1Q5UW1GZmw1VlFWSXZv?=
 =?utf-8?B?ZURLRkJxdXpJdnBpWVlvWnlnZU93d2hHS083NnpJOGlwclNsS3g2RC9UUXcx?=
 =?utf-8?B?WXVYRzN2RmRtQ2VyNDVDSHV0TmRZc1hHekZxZGd3VUcyU0V2ZFlKc2Y4ak1z?=
 =?utf-8?B?SFU0Q1lDTCtRYVJ5WCtCU1JtUGhkN2pqWmRBR1ZsU3Z3cXRQclJXQlRYMFQ5?=
 =?utf-8?B?eW9WUkJSYmNxdjhJMXhkbm1seHlLcEVnTGhIbHZ6VWVkL3FQcEtTN1I1aThh?=
 =?utf-8?B?N1lYeHVIZXp1NnRzRUFNSmhlWVlRNXRTcEFKQURTN214Q29mK3NFaVQ5RXFR?=
 =?utf-8?B?QjRoUUpHRGJ4YkxWWVp3RkdQV012RTNlSnFQZ0VCS0lBQmhmS1FCR0REeFBk?=
 =?utf-8?B?YXFnSGJiUS9mVnFEZHpkbTlKVFlNQklPYkxRTTBuVFhXUDc5V1pMT3RNSUJU?=
 =?utf-8?B?azFyK2RxNnBJY3BGd3UrYlhxdW93NytWZlhoczlVdWlFbnhTWDE3aVZVeWpz?=
 =?utf-8?Q?i1K43JScFR4043mzf9oejywmccSoDo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGtzb2NhQ2x5UDEwSzJRNUFndU5kb0JXcFpmN0l3Um0vam16L3hVclNxYVRV?=
 =?utf-8?B?R1pib1ZyNmo2NFhpcFZ1dC8yZ2t2YWV5YVFXZmFXV1ZKaWUrNHYyWVRKL3Zx?=
 =?utf-8?B?ak5IMG5KN3g0WjBNOU5VZ3M1U2pVY2NFaWxOMWNsZDN3WVM3UnZxUDlYWkpE?=
 =?utf-8?B?WGdnZjhzLytMbkJrZzRIaStDK1dnTjFqajVKZXlYazcvQlJHMzVvVG8xQi9H?=
 =?utf-8?B?MlF2MSs4anZFbzNGOU5mNURucEpkTUM3M3BtcXlRd3h2dDRPelVSblIzakhy?=
 =?utf-8?B?cFEwMmhJMEErazBuY3BtUExYSUpLOHRyMGFpUGlCQkdOdEhEVHJRK0FzUURH?=
 =?utf-8?B?U0dMRmFQTUFPMGNiL3Y5WDJzSjJXNGxmVFNvQW1RNUFraG12RXAvNG55N0Uz?=
 =?utf-8?B?SXYwOEVWYzRCbXBERzF3bzljdUxJN2cxU2QwSWhPZ2M2Z0pqdXhFNGZ4cHJO?=
 =?utf-8?B?Q0QyMHovQXJCL3hRcVpyM09IbTJmRmNCbzRvcW9WeVUxY01ibmNjQ2tJMjVR?=
 =?utf-8?B?WkwyUXE2RnpTcnY4YloxYU9rMW45T0svTjdOQ0hRNHA2QnVrSzcrRUVRYTFz?=
 =?utf-8?B?VHJhVlZZRVowRFhDK25vVSt1K200MGZnditTekdmd3pEZTdvME1Md3F1SjY4?=
 =?utf-8?B?elltWDNMR3F6K2NhUWhGQjVJbWI0VmxrZm53Q2wvaE02ck04R1AvY1NrMm8x?=
 =?utf-8?B?RzY4LzdnN3YvaVNYYXlaKzNSU0UxMk1jRTF2VmNoU1AxRFVQR1hTZTNuVjds?=
 =?utf-8?B?aUJVWTVpSzNRZTJ3c1lleEtMRHhWZGo1RUx1M2NlY1h4dHhuTW45QTRTZjBw?=
 =?utf-8?B?N3gwa2tQL2pqT2VUUmZlY2FhTlEvRyt6SnJwVWkveHpWMDc2SGJkaUhTc0Uv?=
 =?utf-8?B?d1Q4cnFHT2tPTUQrWFNSTENkZHRoV09tNFVTc3FrM09TM1NHQkZ0ZStjQnBD?=
 =?utf-8?B?S1lpN0dsczF0eDdlbWtORjlPdjkrVkJZb1BrRTZqOVFNRklhTVpMTlljSWdl?=
 =?utf-8?B?dmxhZVRHdkdlVlJZbzFSQzFYc21vNUpic01CejNIVUgrTHFBSURodUZaT29E?=
 =?utf-8?B?V25RQzhxRjlHU0hNYjlzbUFOck1CYU52cDJYQjROVk1UM0pIeXB6bHJuQUMr?=
 =?utf-8?B?aUtyYkJ5UjBxM2kyYkM1UlVMUEdtNlpock8vWXRxOGZIaGhKN2orUW5INnFT?=
 =?utf-8?B?OElKekFEbzB0ajFPWWJ0cVNLOXBDc0EwSmp3akw5NW5NNld5K2JmK2ZwTVhX?=
 =?utf-8?B?Q0pkU2pKazVEaUFMVXNKUHdrK0V0U2pSMVNXZlpTWEh2WFErcGdWZ0cwTWM1?=
 =?utf-8?B?WllBZitSL1liNGVXMFdhdHJ4TUlEZkZFOEVXdWs2VmdXUC9oTTBvZmtmVFhw?=
 =?utf-8?B?QXZWb0lwUmlxZkxkUmpDem82cDZIWXFGdHZkaVowQnY0RitqdlhGY095RlVS?=
 =?utf-8?B?QXNwVURSRnoySlVuUC9TRHlDcEpQQTdHSDJuM01FeHg4aTFka0Y0ZzdvdVdj?=
 =?utf-8?B?TmQvbWJWeTkzODhqcU1OZVVLalI1Wks0VlU3QWxjakZBbEYwSWlHK243eTF6?=
 =?utf-8?B?SytlWFpLQnErYjNURDFtVVBpY0tWYlRQM3RkN0N0MUVZc1J1M1pmQ3krbisr?=
 =?utf-8?B?czJ2VXFSblA0SmRwK0ZGMjR5SDFBOTdQUU1LSUgzdDAvSEF3aVl1U1VtclBS?=
 =?utf-8?B?S20wdk42dFY4dGJpaHBYalhXdTBjSlY1VzE2dGgyNmZ1eCtrcExLUXlkV0J4?=
 =?utf-8?B?QkNZdXdLT1dVNlFxdTFQN3NDRFA5RjErZ01ZOVk4V2tVT0dlWDVCR2hwWmJN?=
 =?utf-8?B?akdhWHkyRUx2eHovQ3VnVDFmQ1lscU1wQ3c3NzZRVzZBRUkwcnFKMGZRNnFN?=
 =?utf-8?B?OG1tdG93d2p4aHBmZTRQdTdyclBpdkp5eXJFZlU5YUlLQjJXbno1RmhINzNN?=
 =?utf-8?B?WE9uZUpET1QxaXVGMU1jbXhmZk8xdEs4S096K3l1VzdscXNhWjBvUExES3pM?=
 =?utf-8?B?QXozaUl6ZEFXT2ZUZktzckNiZnJpblNRandYQlhEQVQ5L1FhNHErNE45Ni9u?=
 =?utf-8?B?dTRvdXdVekJLcHZHbEVvM0kwL044MFRZUWR4RFdzSGI3eG1RQUFqT0o5SVJL?=
 =?utf-8?B?bWYyVlZaaU5IMzlIVGxYbnUzbTNjR016NXdRM0U3NVE1QmhualJRN2RjZnRR?=
 =?utf-8?B?ZWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E71C5C0488EF842B2CFCD2FB31FDB09@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba524fda-63ac-45aa-41bc-08ddefd43366
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 19:08:03.0538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R7u47qdXzNiHBBxYhLW4JwTLFJ6XfwVqS+rDCT4z3SwaGKLoWYGTLHFJ+v+Q0cBHS5vDuDAtgBo3tla5XoT44gN4VrakBU6w13Tg+HMP8rY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5015
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

T24gVHVlLCAyMDI1LTA5LTA5IGF0IDE3OjAzICswMjAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
Cj4gQWRkIGEgbmV3IHRyYWNlcG9pbnRzIHdoZW4gaGFuZGxpbmcgVk1BIGFuZCBTVk0gcGFnZSBm
YXVsdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdh
c3RAaW50ZWwuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVs
dC5jwqDCoMKgwqDCoMKgIHwgMjIgKysrKy0tLS0tLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3RfcGFnZWZhdWx0X3R5cGVzLmggfCAyNSArKysrKysrKysrKysrKwo+IMKgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3RyYWNlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDQwCj4gKysr
KysrKysrKysrKysrKysrKysrKwo+IMKgMyBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCsp
LCAxNiBkZWxldGlvbnMoLSkKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3RfcGFnZWZhdWx0X3R5cGVzLmgKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFn
ZWZhdWx0LmMKPiBpbmRleCBkMDJkMjJmYjM2NTkuLjUwODM2ZGY3OTk1MCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmMKPiBAQCAtMjAsMjQgKzIwLDExIEBACj4gwqAjaW5j
bHVkZSAieGVfZ3VjX2N0LmgiCj4gwqAjaW5jbHVkZSAieGVfbWlncmF0ZS5oIgo+IMKgI2luY2x1
ZGUgInhlX3N2bS5oIgo+ICsjaW5jbHVkZSAieGVfdHJhY2UuaCIKPiDCoCNpbmNsdWRlICJ4ZV90
cmFjZV9iby5oIgo+IMKgI2luY2x1ZGUgInhlX3ZtLmgiCj4gwqAjaW5jbHVkZSAieGVfdnJhbV90
eXBlcy5oIgo+IMKgCj4gLXN0cnVjdCBwYWdlZmF1bHQgewo+IC3CoMKgwqDCoMKgwqDCoHU2NCBw
YWdlX2FkZHI7Cj4gLcKgwqDCoMKgwqDCoMKgdTMyIGFzaWQ7Cj4gLcKgwqDCoMKgwqDCoMKgdTE2
IHBkYXRhOwo+IC3CoMKgwqDCoMKgwqDCoHU4IHZmaWQ7Cj4gLcKgwqDCoMKgwqDCoMKgdTggYWNj
ZXNzX3R5cGU7Cj4gLcKgwqDCoMKgwqDCoMKgdTggZmF1bHRfdHlwZTsKPiAtwqDCoMKgwqDCoMKg
wqB1OCBmYXVsdF9sZXZlbDsKPiAtwqDCoMKgwqDCoMKgwqB1OCBlbmdpbmVfY2xhc3M7Cj4gLcKg
wqDCoMKgwqDCoMKgdTggZW5naW5lX2luc3RhbmNlOwo+IC3CoMKgwqDCoMKgwqDCoHU4IGZhdWx0
X3Vuc3VjY2Vzc2Z1bDsKPiAtwqDCoMKgwqDCoMKgwqBib29sIHRydmFfZmF1bHQ7Cj4gLX07CgpJ
J2QgcmF0aGVyIHdhaXQgdG8gYWRkIHRoaXMgb24gdG9wIG9mIHRoZSBwYWdlIGZhdWx0IHNlcmll
cyBNYXR0IGhhcyBvbgp0aGUgbGlzdC4KCj4gLQo+IMKgZW51bSBhY2Nlc3NfdHlwZSB7Cj4gwqDC
oMKgwqDCoMKgwqDCoEFDQ0VTU19UWVBFX1JFQUQgPSAwLAo+IMKgwqDCoMKgwqDCoMKgwqBBQ0NF
U1NfVFlQRV9XUklURSA9IDEsCj4gQEAgLTIwOSwxMSArMTk2LDE0IEBAIHN0YXRpYyBpbnQgaGFu
ZGxlX3BhZ2VmYXVsdChzdHJ1Y3QgeGVfZ3QgKmd0LAo+IHN0cnVjdCBwYWdlZmF1bHQgKnBmKQo+
IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGF0b21pYyA9IGFjY2Vzc19pc19hdG9taWMocGYtPmFjY2Vz
c190eXBlKTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoGlmICh4ZV92bWFfaXNfY3B1X2FkZHJfbWly
cm9yKHZtYSkpCj4gK8KgwqDCoMKgwqDCoMKgaWYgKHhlX3ZtYV9pc19jcHVfYWRkcl9taXJyb3Io
dm1hKSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0cmFjZV94ZV9oYW5kbGVf
c3ZtX3BhZ2VmYXVsdCh4ZSwgcGYpOwoKQ2FuIHlvdSBhZGQgdGhpcyBkaXJlY3RseSBpbnRvIHRo
ZSB4ZV9zdm1faGFuZGxlX3BhZ2VmYXVsdCByb3V0aW5lCmluc3RlYWQgb2YgaW4gdGhlIG91dGVy
IGxheWVyIGhlcmU/Cgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXJyID0geGVf
c3ZtX2hhbmRsZV9wYWdlZmF1bHQodm0sIHZtYSwgZ3QsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHBmLT5wYWdlX2FkZHIsIGF0b21pYyk7Cj4gLcKgwqDCoMKgwqDCoMKgZWxz
ZQo+ICvCoMKgwqDCoMKgwqDCoH0gZWxzZSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHRyYWNlX3hlX2hhbmRsZV92bWFfcGFnZWZhdWx0KHhlLCBwZik7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBlcnIgPSBoYW5kbGVfdm1hX3BhZ2VmYXVsdChndCwgdm1hLCBh
dG9taWMpOwo+ICvCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgdW5sb2NrX3ZtOgo+IMKgwqDCoMKg
wqDCoMKgwqBpZiAoIWVycikKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
X3BhZ2VmYXVsdF90eXBlcy5oCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0
X3R5cGVzLmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNDMx
YjE0NjlkNzliCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dF9wYWdlZmF1bHRfdHlwZXMuaAo+IEBAIC0wLDAgKzEsMjUgQEAKPiArLyogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IE1JVCAqLwo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgwqkgMjAyNSBJbnRlbCBD
b3Jwb3JhdGlvbgo+ICsgKi8KPiArCj4gKyNpZm5kZWYgX1hFX0dUX1BBR0VGQVVMVF9UWVBFU19I
Xwo+ICsjZGVmaW5lIF9YRV9HVF9QQUdFRkFVTFRfVFlQRVNfSF8KPiArCj4gKyNpbmNsdWRlIDxs
aW51eC90eXBlcy5oPgo+ICsKPiArc3RydWN0IHBhZ2VmYXVsdCB7Cj4gK8KgwqDCoMKgwqDCoMKg
dTY0IHBhZ2VfYWRkcjsKPiArwqDCoMKgwqDCoMKgwqB1MzIgYXNpZDsKPiArwqDCoMKgwqDCoMKg
wqB1MTYgcGRhdGE7Cj4gK8KgwqDCoMKgwqDCoMKgdTggdmZpZDsKPiArwqDCoMKgwqDCoMKgwqB1
OCBhY2Nlc3NfdHlwZTsKPiArwqDCoMKgwqDCoMKgwqB1OCBmYXVsdF90eXBlOwo+ICvCoMKgwqDC
oMKgwqDCoHU4IGZhdWx0X2xldmVsOwo+ICvCoMKgwqDCoMKgwqDCoHU4IGVuZ2luZV9jbGFzczsK
PiArwqDCoMKgwqDCoMKgwqB1OCBlbmdpbmVfaW5zdGFuY2U7Cj4gK8KgwqDCoMKgwqDCoMKgdTgg
ZmF1bHRfdW5zdWNjZXNzZnVsOwo+ICvCoMKgwqDCoMKgwqDCoGJvb2wgdHJ2YV9mYXVsdDsKPiAr
fTsKPiArCj4gKyNlbmRpZsKgLyogX1hFX0dUX1BBR0VGQVVMVF9UWVBFU18gKi8KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNlLmgKPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV90cmFjZS5oCj4gaW5kZXggYjlmNTk2NTE3NzFlLi44NTg3OTgyZTdlZWUgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNlLmgKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfdHJhY2UuaAo+IEBAIC0xNCw4ICsxNCwxMCBAQAo+IMKgCj4gwqAjaW5jbHVkZSAi
eGVfZXhlY19xdWV1ZV90eXBlcy5oIgo+IMKgI2luY2x1ZGUgInhlX2dwdV9zY2hlZHVsZXJfdHlw
ZXMuaCIKPiArI2luY2x1ZGUgInhlX2d0X3BhZ2VmYXVsdF90eXBlcy5oIgo+IMKgI2luY2x1ZGUg
InhlX2d0X3R5cGVzLmgiCj4gwqAjaW5jbHVkZSAieGVfZ3VjX2V4ZWNfcXVldWVfdHlwZXMuaCIK
PiArI2luY2x1ZGUgInhlX2h3X2VuZ2luZS5oIgo+IMKgI2luY2x1ZGUgInhlX21pZ3JhdGVfdHlw
ZXMuaCIKPiDCoCNpbmNsdWRlICJ4ZV9zY2hlZF9qb2IuaCIKPiDCoCNpbmNsdWRlICJ4ZV90bGJf
aW52YWxfdHlwZXMuaCIKPiBAQCAtNDczLDYgKzQ3NSw0NCBAQCBERUZJTkVfRVZFTlQoeGVfbWln
cmF0ZSwgeGVfbWlncmF0ZV92cmFtLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9BUkdT
KHhlLCBsZW4sIHZyYW1fYWRkciwgZGlyKQo+IMKgKTsKPiDCoAo+ICtERUNMQVJFX0VWRU5UX0NM
QVNTKHhlX3BhZ2VmYXVsdCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFRQX1BST1RPKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgcGFnZWZhdWx0Cj4gKnBmKSwK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRQX0FSR1MoeGUsIHBmKSwK
PiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9TVFJVQ1RfX2Vu
dHJ5KAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIF9fc3RyaW5nKGRldiwgX19kZXZfbmFtZV94ZSh4ZSkpCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19maWVsZCh1NjQsIHBhZ2VfYWRk
cikKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBfX2ZpZWxkKHU4LCBmYXVsdF90eXBlKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZmllbGQodTgsIGFjY2Vzc190eXBlKQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZmllbGQo
dTgsIGZhdWx0X2xldmVsKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIF9fZmllbGQodTgsIGVuZ2luZV9jbGFzcykKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2ZpZWxkKHU4LCBlbmdp
bmVfaW5zdGFuY2UpCgpBbHNvIHRoaXMgaW5mb3JtYXRpb24gaXMgbW9yZSBwYWdlZmF1bHQgc3Bl
Y2lmaWMgYW5kIG5vdCByZWFsbHkgdG8gU1ZNCnNwZWNpZmljYWxseS4gSW5zdGVhZCBvZiBtb3Zp
bmcgdG8geGVfc3ZtLmMsIHlvdSBjb3VsZCBqdXN0IHB1dCB0aGlzCm91dHNpZGUgb2YgdGhlIHN2
bSBpZiBjb25kaXRpb24gYWJvdmUgdG8gY292ZXIgYWxsIGNhc2VzLgoKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCApLAo+ICsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRQX2Zhc3RfYXNzaWduKAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fYXNzaWduX3N0
cihkZXYpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIF9fZW50cnktPnBhZ2VfYWRkciA9IHBmLT5wYWdlX2FkZHI7CgpBbmQgeWVhaCBzb21l
dGhpbmcgYWJvdXQgdGhlIFZNIHdlIGZvdW5kIHdvdWxkIGFsc28gYmUgaW50ZXJlc3RpbmcKaGVy
ZS4KCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKSwKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9wcmlu
dGsoImRldj0lcyBhZGRyPSVsbHggZmF1bHRfdHlwZT0lZAo+IGFjY2Vzc190eXBlPSVkIGZhdWx0
X2xldmVsPSVkIGVuZ2luZV9jbGFzcz0lZCAlcyBlbmdpbmVfaW5zdGFuY2U9JWQiLAo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2dl
dF9zdHIoZGV2KSwgX19lbnRyeS0+cGFnZV9hZGRyLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5mYXVsdF90eXBlLCBf
X2VudHJ5LQo+ID5hY2Nlc3NfdHlwZSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+ZmF1bHRfbGV2ZWwsIF9fZW50cnkt
Cj4gPmVuZ2luZV9jbGFzcywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfaHdfZW5naW5lX2NsYXNzX3RvX3N0cigKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIF9fZW50cnktPmVuZ2luZV9jbGFzcyksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZW50cnktPmVuZ2luZV9pbnN0
YW5jZSkKPiArKTsKPiArCj4gK0RFRklORV9FVkVOVCh4ZV9wYWdlZmF1bHQsIHhlX2hhbmRsZV92
bWFfcGFnZWZhdWx0LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRQX1BST1RPKHN0cnVjdCB4
ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgcGFnZWZhdWx0ICpwZiksCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgVFBfQVJHUyh4ZSwgcGYpCj4gKyk7Cj4gKwo+ICtERUZJTkVfRVZFTlQoeGVfcGFnZWZh
dWx0LCB4ZV9oYW5kbGVfc3ZtX3BhZ2VmYXVsdCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBU
UF9QUk9UTyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IHBhZ2VmYXVsdCAqcGYpLAo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRQX0FSR1MoeGUsIHBmKQoKWWVhaCBJIGp1c3QgZG9uJ3Qg
c2VlIHdoeSB3ZSBuZWVkIGJvdGggb2YgdGhlc2UgZnJvbSB5b3VyIHBhdGNoLCBvdGhlcgp0aGFu
IGp1c3QgdG8gdGVsbCB3aGV0aGVyIHRoZSBjcHUgbWlycm9yIHN1cHBvcnQgaXMgc2V0LgoKVGhh
bmtzLApTdHVhcnQKCj4gKyk7Cj4gKwo+IMKgI2VuZGlmCj4gwqAKPiDCoC8qIFRoaXMgcGFydCBt
dXN0IGJlIG91dHNpZGUgcHJvdGVjdGlvbiAqLwoK
