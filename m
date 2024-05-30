Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B09C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 17:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAC810E53C;
	Thu, 30 May 2024 17:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/6M9Nqr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C99510E53C
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 17:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717088478; x=1748624478;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=YPoppvqLiGjIb9DtLjG8y4Cg/LC2JqoNUe1YnqkpxAo=;
 b=H/6M9NqrsO+zmXVN1tdYicnXJc7YNBtiSri1OGcPOVGlfNlNewzbg5In
 lB8YW/4Mhjs7OuVJJa3UKxHeedn7N5n4MmzNCY3b24gCfgtjM9hPhqGRy
 g7ErhJ9z5BaWxDlxXzlRiV8J5mzeMKFXacspyJcdjNXqUjN1dYNNVt0K5
 Ds0jWtbVTYfb/JirvuN10tEAK9xJ0FipJJhrX50VeJyC0YhcWRW98+/ds
 nYb66GDG6CGkUvHPTplPcj52mw3smIQLxyJ+Rj8iTOkft6Bed3FNqi3rP
 XAWojbR7VNo91lh8nt4icJoOKOP8hm2TDGxDdgryJsD6pghjfMgf6E0my g==;
X-CSE-ConnectionGUID: EYFCBDSCRSG1TCdCPW6kaQ==
X-CSE-MsgGUID: zTlLVHngQWOXvwAqnYtCmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13781281"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="13781281"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 10:00:59 -0700
X-CSE-ConnectionGUID: EAIJpyxrQ3WjQGEljGzlbg==
X-CSE-MsgGUID: WVoNSjgQQA2Dhy+74bTtYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="59048739"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 10:00:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 10:00:58 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 10:00:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 10:00:58 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 10:00:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSFe03B4ROxhI91WA5XtL+tRf2M2AmMoOhFlAWkgUMoNFpqCPaoHks3DP6z9LLLyFALcj2UshP5VbJC/0N7fYZ27S5kQnsPJpcKGm/BtXYuvf7eYcIKvPz5OmpKRDs2ySwRZSC5vee6Ja8PBtT5dfqeKuW446djWJuyyI9xdtDXrOF+DepUmZt1BptpxIaJEwZ/X7w/RpbwjfGgmv93cvFCkmYk4bmmgXtWBFXFzfsdEbL1rEdMUdKCdbJNzh3VcXmY5gVein/MnKWpOK54F29FHz2rq/HLgdYO6NOkYsxDUdVjAaGLcQNj8fY2P1PX7mQ/7dQEVuwtqQtSTqmrMeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPoppvqLiGjIb9DtLjG8y4Cg/LC2JqoNUe1YnqkpxAo=;
 b=hwv1S6k/KpXFhd2kD/uI/41lxRnNfzVv6AX9Pq0DNvo0fN9pge/NjnnPIrjaGNeYFA8U87s/xCMea1LWfbdSk49AL/C3US+2PIl2KPsmXrXN+8R4rFMjGhCUoOHqKMFvFQ/8NnPuv953lscj1+jJe6QgXJGuVyxO5whRkUErLOamTRAp+z60KlypfaPiUzI6pSC0dQ5JEJv9BuD2U3XwzPl8A5R3UVxuBYXxudtlR29C4wvYr+3vRw0sBsJf+lVUTw0Gz98sQCajSyeWMy4g1eyRLKF36wF60naRUup7L31AFLmHD1gYqPWicvnJ0vjW8Axyopg3TX2CM+/oOlc/8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 17:00:55 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.7633.017; Thu, 30 May 2024
 17:00:55 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Mishra, Pallavi" <pallavi.mishra@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe2: Enable Priority Mem Read
Thread-Topic: [PATCH v2] drm/xe/xe2: Enable Priority Mem Read
Thread-Index: AQHasljTNLcFRRGQFkyYbD/fJreQ8LGwARKA
Date: Thu, 30 May 2024 17:00:36 +0000
Message-ID: <ce9f3893305f99323f79f0ee39f179543f11483f.camel@intel.com>
References: <20240530062509.1529357-1-pallavi.mishra@intel.com>
In-Reply-To: <20240530062509.1529357-1-pallavi.mishra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB7146:EE_
x-ms-office365-filtering-correlation-id: ea46991b-7f12-49a8-6215-08dc80ca067f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?WHZtaTBzeGpqTVFpK0ZXcFBZUnowNXpzeDZNeGREZ0VYZ1RwKzhlTUJieXpU?=
 =?utf-8?B?MjhlVXh2QUpEZzI0RzB3UnF1V2xIMzRsa05ISUU4MnhTTEU5M3Q1aDVodjBN?=
 =?utf-8?B?cVNXV0R2UnFNN1VKcXZpOWtaUFc4UXAwNTlkeXJxWnpDSUJhOUo5NVB2T0hB?=
 =?utf-8?B?VWhhNFJRTW9NSUtIN3h3c1pRSlZOamhPOEdhdEZ4bmhPMFllcHJSaFloVDRr?=
 =?utf-8?B?U1ZmcGViYkRub2FOUEQ0OTdZUll3ZE9KUTlEdVN2azNCeGt6YzBVVFU1N1I2?=
 =?utf-8?B?bkwwV1JsTCszaXVQek11ZW9zTlA0NlJLcHh4QnF5R2RQNHc5ZGJLZDZUbVNI?=
 =?utf-8?B?KzdpYVNMRmoySlk4WkhyUDg1YmFqSTFCcFBNc244ZUJ0bDF5TWZJbFdsNEFL?=
 =?utf-8?B?VDFTSEQyM0RHR3lLOWVscUk3Qy9rTmJVRXorU3ZJRGZGeDRFMjkyVXE0R3RJ?=
 =?utf-8?B?Y1pZQVpsNW9IdmtXNnkxK2lGU2oxNkRuY3RrUDNqV1RjZXhGVEZBbU4xVW5i?=
 =?utf-8?B?U1g2bHcvdXZ5T01ua3dyeGZieUVzSXNneVl4RFNmYmlQRXQ3UTlqR04ya0Fu?=
 =?utf-8?B?MkVrWFFweEU1V0FMNmJJVjJJbURGd2VlMk1xSk9SbHR2QmtLeHVnUnNHRHNB?=
 =?utf-8?B?enUvT0RjSm90cHNtWVlic3grNTVTNzdBRmlKOWgwVzRJenlVaTBmaWFvczdC?=
 =?utf-8?B?U1g1cUE2UGg3M2wrUmNQNHJsRVJYZnhJdTh0ajlmYzlveitsME9kaGdJYkVL?=
 =?utf-8?B?Z0VodGo0d0RPeS9XY0ZaeGlzOVBFK3h6QkVWVElibjc0bkZGZitGZWpDbTdK?=
 =?utf-8?B?UnFHVjV4cWs2S3Y2UlNRajRXQWlMellKTDI5ZzBaYkltaWJlL2xUNWZRRXJs?=
 =?utf-8?B?OTVlUWJ2N2JtLzcreml4OU5Wd1VDVDVTK3NVb2pGMDh6L2RXSEp6b1hQSGky?=
 =?utf-8?B?UWhBTXV0Tyt2R2dISXd6emNNSTV1VnhqYWdXeS81VTBsY3B2OE1WQWtYSGI0?=
 =?utf-8?B?RUdTL1dIRDZTSjNpTlltSHhCZEFLdU91eW5XSklsbG9seVFjTDB4TGFkbzZl?=
 =?utf-8?B?Sk9sOFJBUldGbzBPZ1FzNWpsd2dmNGNlMnl5cHNWL3JKRDRGZmM1b2lLdjcw?=
 =?utf-8?B?bFoxYjhlNkdGdHBha0hXT1NhclFOVmFEWWR0eVZvd0hmTnZKc0E4MW5ZVE5Z?=
 =?utf-8?B?RnZjS3ZUcFBvWUphaSs2S0toakM1V3dESm54MktkZzV4WCs2akVkcktUUG10?=
 =?utf-8?B?ZnE3S3BzejIwcHREQk92ZVJFY1h2a3Jtd1R0Ynh5bzU3M0ZaMEFOWjRWQTVj?=
 =?utf-8?B?aUplbVh1d1JPS1kwV1B1MVVBQ0ZlT2p0NXRpbDZUY1l1eEFjeFNBWGx3Mis2?=
 =?utf-8?B?QkFxTzVCRVBnS0VIb1ltRWJvdHBVVlh1dmdpVk9sWVFWeTg3UGlOaFJ0UlRQ?=
 =?utf-8?B?VUxnd3AyVVNFSlJWN1JUZDdoTVExeWo1QzVFOEZ0Nm9WUVQ5cXZBN0Y3TzVz?=
 =?utf-8?B?UXN4NnFsZHdFU2hpL0F6M3NVK3A2ZThibHFnekMrV0JhVlNnR0tITjlhQ0hB?=
 =?utf-8?B?OU5NNzJGSjYxU21QWWpUYzZsUlkvN2F4a2c4bndLMEhnTEQ2VGZkT3FwZ09E?=
 =?utf-8?B?bFRRWkY2dldCd0VMZHk2L1ltdVhUOVhkcXZ1SEFMeUNRb0MxajNXYkRzeGoy?=
 =?utf-8?B?QWx1NlJxdDk4N0phNm5IU3k5QWlXdmE5MVRLam5yVHI4ZkVPTzBjZFphK1Jy?=
 =?utf-8?B?b1BKeVI4ODQwUjF6cWlySWlaNEFxWkNYcDU5VXVGbnRLK3BwdXF6VW1sa3M4?=
 =?utf-8?B?NnVjRTc2Vi9WZXp6a2Zzdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDVjbzVUMEJ1c0pTeW01MUNCbFNPdWlYaHNKRGp3MzNVT1U3a01hbmxYdWt4?=
 =?utf-8?B?dGhsTGVCcGZ1L2x3WUJUSHBrUnYxdWRCS2lVRUxYQXJaU1dFdllaemlSMnd6?=
 =?utf-8?B?dGwrK1VFTWRlQjFJbE03aW1kSENPN3p1UzRqZEZ5dDVONC9rdGMrbUZzZnIx?=
 =?utf-8?B?VkJPaFBpVDVqU29sUlZQYnV5MGJBMmdRTmhJK01adk9pRytFSzBmMFpRVDhQ?=
 =?utf-8?B?NnpLUFZLT0U5UkRDZUF5MW9nSTBLczZvbWZKM0VrOEU2bDN2ZlZCcndlWCt5?=
 =?utf-8?B?cHlZOXlLTmV5M29tTER0MUhjbUFsQzFsU0JTTmhXcW9VT20wY1NGWmc1SU1U?=
 =?utf-8?B?REZHZStmTy9DUkwzblA3TDNmRDNqUDU2cnRya3lVN0JYQXRDa1AxUFZML3dG?=
 =?utf-8?B?aURjNTV2a0hWMkVZbFZ5b25kMlg4a3lvZENKeEI0MnVzMVIxenJDWTF6Kzkx?=
 =?utf-8?B?RnZrbitkVkZmNGFaUm5naEpHMkhCSHp0M2k4U29jOWd4aE8reVAwRERUYjFs?=
 =?utf-8?B?THAxWGpJcVoyMFJIQnJzRS9PUk9aN3NtTkhSMUg0aE1CTERiK0Rwd3BTNWJX?=
 =?utf-8?B?ZlY5SlBvOFNRWEk1WUMxd0lmMm83cGh5WTllem10bkFXZTZoU1JEMkpGVVRI?=
 =?utf-8?B?VkxaSVhITUJWMnFqSHZZTjZ0ZmE1QStOakpVTjgwN3Q3VXdNZmNHQWptVXJm?=
 =?utf-8?B?S2I4cDcyamRRaVJyQ0lKaldGZVlmenFDeGpKcFpDWVk0N0ZKcDVtbngwcEVt?=
 =?utf-8?B?blhDY00vaHAxbEtkNm5tQUpnS1lwaEFsL00vcGd1UHRFU09Cc0hML08wU094?=
 =?utf-8?B?VktCOHoxTFl1UFdTNVF2WGpDb1R5cFF0cDVNajRqTm9mc1dxRXI1WFBLcXNI?=
 =?utf-8?B?cDI5QkVKM0pYMmpmQnRsMU1XNlRpZlUyRjJpZGh4WXVSOFNqMCtQZkYxc0to?=
 =?utf-8?B?ZHY0RXFtTEYyaDJOOHd4RWEvcHBhc2lpb0NwK1VwSk44a29xcExNcVhSdVB0?=
 =?utf-8?B?YmJQRG5HTWVRUEpBVWd0cFB5TUlDdWJvRHhzaXR3cFBFUFFOcW5qYm10QzNC?=
 =?utf-8?B?dmNSRUJSU3J3TGxNdCs2YXd2NThuVVdvb1JRWWdpalBKUWtrZ3JOOEYxcTJU?=
 =?utf-8?B?bFhIaStjOWlQTUZmUFNneWpFQldTWndaTFZNY2I3WEU0dlp0ZmU5SzRTRWdu?=
 =?utf-8?B?ZDlVOGs3aVpwM3QvYlFIdU5DL1BxNGpxMTMrQnNZc0NoWkN0eTRSL3NQNnAv?=
 =?utf-8?B?ZjNMT0JRQTl3Wnp1Sng5UmJUc2p0ejY0QVVqWVZYdXFNcmsxRm5QYVAwWVFa?=
 =?utf-8?B?QjZhU0trVGxoMXlWc090aFBhYyt4WlpFWlErSEx3anNWMVFkZER1T3NHSEhX?=
 =?utf-8?B?T2hJbGtPclFORnQ3OEw1aGczaXlTWGZkazVWVFRMVVorSFQySU9zWVZ4QnND?=
 =?utf-8?B?T1FDVm9jZEdUbFd1aDFwREhyZE9wekpiT3dhTmwyTnpLT00xYTFoQjRIWVNI?=
 =?utf-8?B?L2ZSNWZRSVFVbjk0U1RYS3NXRnJITW1tNlR2OERyMDVTSlptNUZUTVJVdGI0?=
 =?utf-8?B?d2p3MHppQU1IOUd1MThjU3FRSjJwQ0tseHVCOEdONHg4Q1BEVjkwM1FMKzd1?=
 =?utf-8?B?YjBXSmtlZGtHUnhzS2Q4dEZ3b2xIRjN6alI5Q296MSt0Ty8yUGtoS24rMWtV?=
 =?utf-8?B?VlZtVUJURldtbWdydUQ3NFpJYlBCelN5UzYzRVorYmIxMHRTaDVlV3kyWEMr?=
 =?utf-8?B?T1pZOUMxaDNrdDZSUXppU2ZrWHdlcG1RZFl6dlRTaUZVV2VFZ1gyckJjbDZC?=
 =?utf-8?B?QlE3WmJFNS9rS3dqdkFMb2lqMUczbGFNR0ptQXlYRjV1cnU0UUpSTlo3d2ta?=
 =?utf-8?B?c2Z1M1FGOFNrZVprR2thNFpkR1FlQjQ3WnhVODJEYkFWMVI3dU5wNDh6Szho?=
 =?utf-8?B?d081dEQzRWoyRjBZSlVoSzdhU2xuZzZQZDNaV0IvZkRDV1dkdE9yaElBSlFi?=
 =?utf-8?B?NERKZ3pnSm8rblpIRmp3STNTMXpuakRoeTNBNlFPV29Xc3BYT0k1bFZMYW5Y?=
 =?utf-8?B?U25OSVI4dkxiVmx4MEVkMkJyQ3BTT0gvcjBNclRaSDN3OGlVVDFqbzU1QWQx?=
 =?utf-8?B?ZERYZnRrR2xRV3drcVZpREZkaWNpcGxVSkh0d0JSZEk3cDlOK2xMdUNnaUZm?=
 =?utf-8?B?UkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7CF1DE366B8254E90CE105626908E0A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea46991b-7f12-49a8-6215-08dc80ca067f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2024 17:00:36.0482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o7R6j4KMBWyp9raqE/mbMvqoZUsLQ4M+CjtApRtaHmksHwvdeB5uEmMVo4KlzkbhPcqe1gmRtzJsk6HEbXccYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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

T24gVGh1LCAyMDI0LTA1LTMwIGF0IDExOjU1ICswNTMwLCBQYWxsYXZpIE1pc2hyYSB3cm90ZToN
Cj4gRW5hYmxlIGZlYXR1cmUgdG8gYWxsb3cgbWVtb3J5IHJlYWRzIHRvIHRha2UgYQ0KPiBwcmlv
cml0eSBtZW1vcnkgcGF0aC4gVGhpcyB3aWxsIHJlZHVjZSBsYXRlbmN5DQo+IG9uIHRoZSByZWFk
IHBhdGgsIGJ1dCBtYXkgaW50cm9kdWNlIHJlYWQgYWZ0ZXINCj4gd3JpdGUgKFJBVykgaGF6YXJk
cyBhcyByZWFkIGFuZCB3cml0ZXMgd2lsbCBubw0KPiBsb25nZXIgYmUgb3JkZXJlZC4NCj4gDQo+
IFRvIGF2b2lkIFJBVyBoYXphcmRzLCBTVyBjYW4gdXNlIHRoZSBNSV9NRU1fRkVOQ0UNCj4gY29t
bWFuZCBvciBhbnkgb3RoZXIgTUkgY29tbWFuZCB0aGF0IGdlbmVyYXRlcw0KPiBub24gcG9zdGVk
IG1lbW9yeSB3cml0ZXMuIFRoaXMgd2lsbCBlbnN1cmUgZGF0YQ0KPiBpcyBjb2hlcmVudCBpbiBt
ZW1vcnkgcHJpb3IgdG8gZXhlY3V0aW9uIG9mDQo+IGNvbW1hbmRzIHdoaWNoIHJlYWQgZGF0YSBm
cm9tIG1lbW9yeS4NCg0KVGhpcyBoYXMgdGhlIHBvdGVudGlhbCB0byBjYXVzZSBpc3N1ZXMgaW4g
VU1EcywgTWVzYSBmb3IgZXhhbXBsZSBkb24ndCBoYXZlIGFueSBNSV9NRU1fRkVOQ0UgaW5zdHJ1
Y3Rpb24gaW4gdGhlIGNvZGUgYmFzZS4NCg0KU28gcGxlYXNlIGJlZm9yZSBtZXJnaW5nIHRoaXMg
c3luYyB3aXRoIGFsbCBVTURzIG9yIG1lcmdlIGl0IGJlaGluZCBhIHJ1bi10aW1lIG9yIGJ1aWxk
IHRpbWUgcGFyYW1ldGVyIHdpdGggaXQgZGlzYWJsZWQgYnkgZGVmYXVsdC4NCg0KPiANCj4gTm8g
cGF0dGVybiBpZGVudGlmaWVkIGluIEtNRCB0aGF0IGNvdWxkIGxlYWQgdG8gYQ0KPiBoYXphcmQu
DQo+IA0KPiB2MjogTW9kaWZ5IGNvbW1pdCBtZXNzYWdlLCBlbmFibGUgcHJpb3JpdHkgbWVtDQo+
IHJlYWQgZmVhdHVyZSBmb3IgbWVkaWEsIG1vZGlmeSB2ZXJzaW9uIHJhbmdlLA0KPiBtb2RpZnkg
YnNwZWMgZGV0YWlsIChNYXR0IFJvcGVyKQ0KPiANCj4gQnNwZWM6IDYwMjk4LCA2MDIzNywgNjAx
ODcsIDYwMTg4DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQYWxsYXZpIE1pc2hyYSA8cGFsbGF2aS5t
aXNocmFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2Vu
Z2luZV9yZWdzLmggfCAgMSArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMg
ICAgICAgIHwgMTEgKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9u
cygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2lu
ZV9yZWdzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oDQo+IGlu
ZGV4IDI2M2ZmYzdiYzJlZi4uNGU4ZjlhNjFmMGJmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmgNCj4gQEAgLTEwNCw2ICsxMDQsNyBAQA0KPiAgI2RlZmlu
ZSBDU0ZFX0NISUNLRU4xKGJhc2UpCQkJWEVfUkVHKChiYXNlKSArIDB4ZDQsIFhFX1JFR19PUFRJ
T05fTUFTS0VEKQ0KPiAgI2RlZmluZSAgIEdIV1NQX0NTQl9SRVBPUlRfRElTCQkJUkVHX0JJVCgx
NSkNCj4gICNkZWZpbmUgICBQUEhXU1BfQ1NCX0FORF9USU1FU1RBTVBfUkVQT1JUX0RJUwlSRUdf
QklUKDE0KQ0KPiArI2RlZmluZSAgIENTX1BSSU9SSVRZX01FTV9SRUFECQkJUkVHX0JJVCg3KQ0K
PiAgDQo+ICAjZGVmaW5lIEZGX1NMSUNFX0NTX0NISUNLRU4xKGJhc2UpCQlYRV9SRUcoKGJhc2Up
ICsgMHhlMCwgWEVfUkVHX09QVElPTl9NQVNLRUQpDQo+ICAjZGVmaW5lICAgRkZTQ19QRVJDVFhf
UFJFRU1QVF9DVFJMCQlSRUdfQklUKDE0KQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2h3X2VuZ2luZS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+
IGluZGV4IDllZWY3ODliZTg5Ny4uZjAzZTVjYzkwNjNlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2h3X2VuZ2luZS5jDQo+IEBAIC00MjQsNiArNDI0LDE3IEBAIGh3X2VuZ2luZV9zZXR1cF9kZWZh
dWx0X3N0YXRlKHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSkNCj4gIAkJCQkJICAgMHhBLA0KPiAg
CQkJCQkgICBYRV9SVFBfQUNUSU9OX0ZMQUcoRU5HSU5FX0JBU0UpKSkNCj4gIAkJfSwNCj4gKwkJ
LyogRW5hYmxlIFByaW9yaXR5IE1lbSBSZWFkICovDQo+ICsJCXsgWEVfUlRQX05BTUUoIlByaW9y
aXR5X01lbV9SZWFkIiksDQo+ICsJCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT05fUkFO
R0UoMjAwMSwgWEVfUlRQX0VORF9WRVJTSU9OX1VOREVGSU5FRCkpLA0KPiArCQkgIFhFX1JUUF9B
Q1RJT05TKFNFVChDU0ZFX0NISUNLRU4xKDApLCBDU19QUklPUklUWV9NRU1fUkVBRCwNCj4gKwkJ
CQkgICAgIFhFX1JUUF9BQ1RJT05fRkxBRyhFTkdJTkVfQkFTRSkpKQ0KPiArCQl9LA0KPiArCQl7
IFhFX1JUUF9OQU1FKCJQcmlvcml0eV9NZW1fUmVhZF9Gb3JfTWVkaWEiKSwNCj4gKwkJICBYRV9S
VFBfUlVMRVMoTUVESUFfVkVSU0lPTl9SQU5HRSgxMzAxLCBYRV9SVFBfRU5EX1ZFUlNJT05fVU5E
RUZJTkVEKSksDQo+ICsJCSAgWEVfUlRQX0FDVElPTlMoU0VUKENTRkVfQ0hJQ0tFTjEoMCksIENT
X1BSSU9SSVRZX01FTV9SRUFELA0KPiArCQkJCSAgICAgWEVfUlRQX0FDVElPTl9GTEFHKEVOR0lO
RV9CQVNFKSkpDQo+ICsJCX0sDQo+ICAJCXt9DQo+ICAJfTsNCj4gIA0KDQo=
