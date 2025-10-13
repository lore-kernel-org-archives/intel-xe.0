Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27F1CCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 17:13:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F2910E051;
	Mon, 13 Oct 2025 17:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+loryaX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A35C10E051
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760375628; x=1791911628;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=e1ibySbokBHp6eurDpwwe6YZb0P7nrOjVUjWDfP83Fc=;
 b=I+loryaXunnyT2svVLYj8KEhdQKawrUhgJ904Niq0WeoSyv2NPYdDaSK
 7wqArTMM+wKarLqOP+/mPa1aGZp129DeMropRzvOPzJLeXQaI6kkBINFJ
 o79S3sfKGw5pFs3vlOn/nr28nB6sJk89JL4xOPiEu0FNVTeKd1Al+Fg9G
 nN1l8JOaOzZvTBex9MIAcK1KFQZDmrBrelhZG8oR0G23bkLL+IXsBkEx2
 4qhL8fmbPsGFBIbUQLGgyhbm9GV3Ra1lrItSWq7INvM4JCE6f+8NvD5LG
 bPeFTRjVQER9+fIfWPs8XsdR+J5h2QJlxM6LWwHRa9P/LLoIYgVgYHq23 Q==;
X-CSE-ConnectionGUID: wHDrHR7gTa+zTQIwDh4xuw==
X-CSE-MsgGUID: WXgurNeCRa28lASMfpmzRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62415018"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="62415018"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:13:48 -0700
X-CSE-ConnectionGUID: JcgEr55GReCWsVdexpkWWQ==
X-CSE-MsgGUID: OUxFO6uAS1iWfoacaBdU/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="186061157"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:13:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:13:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 10:13:46 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:13:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CyPVPxn1jxReyEF546ZG7LoUdvdNB3F6dDHnXdSd5paWSxt9xMjeKMlebTaEjGZ6mpgcbh/7KuZwq/p4/pIqK5RxuYQY/lKZSWB/gwXo6UJKiPBqSc/iN+qSrkUyzZLfUwTWD9NJzlGZFw6jvAfIPvSigVdp8hvDYk7eKg8YsQWev331OuDSpmzg8vv35FOKt9P2EFGLrvkhoGIA5iodCc7BwBGgjOcoXSPNdYvirsbXVfqz9JnuPUkhorc3BUVjBdqr3nbREwEG1O6yCF/gQolyR9Y/dcPz+cGkYpXGOadCW/EmbFictgP9gUwLmo1hX9zb2rUXY7Sr1e5ifNVpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1ibySbokBHp6eurDpwwe6YZb0P7nrOjVUjWDfP83Fc=;
 b=WfeVeJ+W7LBZCnXIsvt5lAZSBjwiZv5BLCoF2fy58yjvkP8uKARWlz332a9B4w35Jt/ae49Q0TqU/ErLA5krYTuprS0nIHgGHoG932VZ0Zf+ClwjhNhfT+8Q2/AFHwD4SGTPTqOrZHM1J5xPw8yD9OlxC8OTGgLSQb3woSGgSk5GfmQdlZZWktvMk27Oa/gpajd1Si9KhHMc8XUzzFe1uYOO36mJ2FOULIe7cf2voJqb+vVnCMtSxbxUnYDVBXT0p+tPstQwYBLKlX1FmmU7dIpusi94njMUkTQEDaTsK4Vh6MInKbuTkELGe1bPlYOgvm5fELwAv3taiXAPfrmcjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB8325.namprd11.prod.outlook.com (2603:10b6:806:38c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 13 Oct
 2025 17:13:42 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 17:13:42 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/7] Fix a couple of wedge corner-case memory leaks
Thread-Topic: [PATCH 0/7] Fix a couple of wedge corner-case memory leaks
Thread-Index: AQHcPF34a4GYp0yTyUmcSAgKr7VLRLTATg8AgAACpoA=
Date: Mon, 13 Oct 2025 17:13:42 +0000
Message-ID: <1bfb886a6e891b249d754b8b0dbbc5be41594f9a.camel@intel.com>
References: <20251013162504.7768-1-stuart.summers@intel.com>
 <aO0xDCa/rTPp9++8@lstrano-desk.jf.intel.com>
In-Reply-To: <aO0xDCa/rTPp9++8@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB8325:EE_
x-ms-office365-filtering-correlation-id: a43f6581-8413-4815-0e27-08de0a7bdc62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eFcvTmJJdXNZLzl0cjlSL1U2bzhJblZtK0hKeHlUbUlDcUdZcTBtV291Znhl?=
 =?utf-8?B?N2s5SVNQeGNuUFE2dCtOVzlnTVJ6NkNzN0Z1aFhDVEtldGs2YldmdFhLYWZK?=
 =?utf-8?B?Qzg0S21hUndkeXdNNlN2eE5zOVl2ZlIzUmdRaEdtVlNSUmRPQnM2OWgwZ3la?=
 =?utf-8?B?OWRGd3R4U0RmeDRKSWNueGI3MjZMV1R5a3pteElySFl3L0lYSlM2dFVBY0dM?=
 =?utf-8?B?eXBNd0NHN0pRaEJqWGh1N2RFbzVMcVZRRFY2ZXYrTWNVMDYwNTc2RUdHSkxK?=
 =?utf-8?B?R1luMGxtMkhCVUlGMHZCa3pkRk15dGxQTEMyVkt3aVBsaHB1dFJQZ2pLbW9o?=
 =?utf-8?B?ZXRNS2M2Y2lIUFIyR01LSDBBQk90RTk0SUJyUE8wYjAwendLaVZkNXBuMjlS?=
 =?utf-8?B?QVlkU3dCVTVYaE1sVHlFZWswMU51ZURKdWo1bmZ6N1pCT3lmdnpCSm5qNTBU?=
 =?utf-8?B?QzNRL2NkYVk3OEpnaUwwMVc0OVV2U05sUHhUTEducDFXS1ZzN2hSaExaWWd2?=
 =?utf-8?B?SXVLK0NTVVZSb0xWTWJNdlNnYm5CQ1BRSzJEeEFtU2NJU3Y0WVJSUFJ3Mlc4?=
 =?utf-8?B?N1pxZEQ5MWg0b3dDS0hKZnIrOFhyYjRXVEZrcnc5ZG5aZUgvaWdqYXVrMGx0?=
 =?utf-8?B?YTRJS3A0ZUdLSnY4d3ZtdzlkS1VwQWpyNDlVNm5ydUJvbmxQSVhTS3RHeFRz?=
 =?utf-8?B?NWRkd3pmMzg2cldOVFNYcHVhRGxnd2VML2tJTENVVnRhVWJhUGdKVU9RaElV?=
 =?utf-8?B?MzVnR1hXRjdjOGNTOC9VbTJpcXppWTRpMXMvbEE5a1ljQkJjNk5HTndEUjda?=
 =?utf-8?B?ZjB0UDROb0lLMW8vdzZuelFpa21lTjR5N1RoMUptRTU2T21NaXoxUlVvWHZk?=
 =?utf-8?B?R2hSOE1DajNWU1lseW1GeHRSYkF0SUZyazViTkdjUG1VT0dhc1Q5d21QR0tC?=
 =?utf-8?B?cGN5eXlqZUV3T0x1MmpxOVk2Qm96d21IYnZ3TEF2VGtDSFhIN093bFUwTU5l?=
 =?utf-8?B?N1VFQlN6Z3RYK1l4eVUrdmFLSlZqMjRGc0pGRm5ISlV3OTVNNW5RK3pNTTJw?=
 =?utf-8?B?endhdGhJOEEzd0lqaGhjYVhkL2RCYTlKeDBaTFBtd2NmSUswT0ZmLytJRE9n?=
 =?utf-8?B?bEdiNkRhZkxWWlcvRFBrMXBpRGVQT1l4UFQzYXl4c2JidVlXKzJyUHNvUW92?=
 =?utf-8?B?a2gwbnpiSVR0bTRhQzY0SG16cHgvTUFlL0ZBbCtlNlFaZXZkcHJkNkhUaE8r?=
 =?utf-8?B?Q0ZWekMxbEREUE1YRDRReTJjV3B5MGxDTnpDQ2FYa2U5cTlmSWlQZ1ZYOVl4?=
 =?utf-8?B?RlE1OGNMU1lnSEU0YmU4czZtZkJxdHdyWjRWQkh1RlhrT3o3bEg4S0E3MjV6?=
 =?utf-8?B?U0pLeTI0LzUxSEU1NE9ZYWRhYS8veVJTREg2ZE5pNEVMSGpWT28ydkhMRUJM?=
 =?utf-8?B?dm1RQWw4RVNJekdFZk94T3h1VjFkQlhwU0tXMjg3Qy9BNmY4WFRqREVGL1Aw?=
 =?utf-8?B?MUpDczY2UTkveWExODNtbUJleU0vdG56MzdIcGo0cU8rWC8vOHJRZTd4NlRC?=
 =?utf-8?B?ZlNwQmdMMFVWRGFlSDlXOGZPUjQ5ZlpsaW96M3FTN3NSQkIya3h3bmF3QTJO?=
 =?utf-8?B?SXFhd0dUWTBnNVR0QWFRSUpoNmcwNHFZMlNKb0pzVzNaOEtGcXRwMnpCU2tS?=
 =?utf-8?B?Wi8wSmlBUjNTOUxqalRqMTZJclVqSFVkcGl5SGRvZzJuaXcyL3FKVW9ZV0NS?=
 =?utf-8?B?eUo5T2tQZTZjWmZnbHpucVlnbGoxcU5UdEVTNFBUa2hRN01mcFRSUEpIbTFH?=
 =?utf-8?B?OWt3bE5wdG9KTEN5TTNHdXhVL2d3VFp0c044OFhpZUVodmVVQ01qK01NYUg5?=
 =?utf-8?B?N01Ra3hNbmdsU2hDclhiWUdDMGNsN3RFN1I2S0pMMDl2ZDZ3bkZkNWZlMGpz?=
 =?utf-8?B?WElvN3VrZkIzVEVpczBCZFhOdlN5cklueklYR2dmWU1Ea0NiRXJnSDBKd0xD?=
 =?utf-8?B?d3RYeHFuQlRBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2pEZW1ieStwZmljekdvdWRadkIyaFBlNlFPOWJncS9zWGZRNXo3aTJyZmwv?=
 =?utf-8?B?citJRnIvY1RXNFhSZGx6WWUxMDdmeVptamVmeEdLZTRoSnkwOHdFZVR6U01U?=
 =?utf-8?B?VWY5Z1UybnlEWDV1Sy9vZzcwNTdKZWpZcGZRUDBOTHhFcS8yUlpmWmNzQldR?=
 =?utf-8?B?Y0dUOU5MUlE1OE42eFQ4a0VRM1RnT2NPZUZOaTFTZElQWks2UFptak9aMjA1?=
 =?utf-8?B?aXlaUEE0RTFRcjRRNTFEUEFrblA5WGV3eTBuNzVSZzl5MHQ5Y24veW5FT29Z?=
 =?utf-8?B?NldnUGp2dUM5VFhydnduV0t1eE9YSXVWMXhhbFYyNkpWRTh0OSt3dlAwNjF5?=
 =?utf-8?B?TUxnMGlyWDBQamp3K0pIVUpseFQzdHNJY1BSSmE5QWExaHl5N2V3ZFVLVyt5?=
 =?utf-8?B?M21XQjdlWjhjODV6QkNiMnFBd1ByeHljejdobEVEOHFLK05CMSsxTDBpbXow?=
 =?utf-8?B?TGVoejVVQUlnM2JMQkMrM21VKzMxS2lKZTBySU43WVFSSEhKYWdhU1VucWc0?=
 =?utf-8?B?VTBmeC9JQkRIRzg5WTVGQThKQ2NUcW1xNGhib0poN0d3MjdPV2NYZk4yaDlu?=
 =?utf-8?B?a1ZlZHkwUmNXckRSdEh0TnIwL2pZblByMExwRXJ3TVpOd1didEZldHRtV0Rn?=
 =?utf-8?B?TWhGUHFiN3c2VnRLTEcvcUJmUEk2NDhQbVlHL3FEQnRCR2lvc1lUc01VTEVj?=
 =?utf-8?B?S0liUnlxZXpWV0tBdGptQkZqS0RJaTNqYm15NkRJRFJqWnBnek1ST2h6NmRN?=
 =?utf-8?B?Ukk1cTMvUFZCVHdpK2lFb3QxV3NKWktJbHAvQjc4eFd2S3FSdXVUelgxUjlC?=
 =?utf-8?B?T2NYRm1LV2ppd3JmYlVQMmFSVFQ3MklVS2Q0bnE3S1lHdkhuUE5yQ2FUNXlC?=
 =?utf-8?B?WWxmNlcwYW5jUWpKeFlIMVB0SjdCWm9Sdzltc3dqR1BnOWpkOXdBTmpOSDZF?=
 =?utf-8?B?VU9WOWVKdng1TE05eTJJYVJsUy92d1crWEZwV2hkbW5icWd6UWZLOTc0dlJU?=
 =?utf-8?B?R29MUnRMWURHYzJHekNSbEt3NHN2bGpQOUZIaXRDVngvSDZsdFV6a1Z0MjNV?=
 =?utf-8?B?bUF3UVhPaVdnK3M0SnZpb3MrZHhVcFNmME1WQU1mWG8xaWhpWnJQc2w1bWs4?=
 =?utf-8?B?ZVR3Y21uTDZ1UERrbmxQbEZQV1hsR1ZDN3J6WkU0bWFtYTB0b05IdUU4akRm?=
 =?utf-8?B?Z0NING1tVHNUVUxiOUtZYUExNkdPamNiTXc0WnpUSkIvbndMdHMrSGxhQ3dL?=
 =?utf-8?B?MUl6a045TTlucmlRbUhRdnkra2c0NEJKQ3dUWjNoTHVsRXF1aG9rNHJuNHF0?=
 =?utf-8?B?TVBzWXVFU3RIdm1Hck9HNG1jMDZFUHhldVkvTWZIVFBxb1M5ZGpFaVk0TWNE?=
 =?utf-8?B?NWxpMTZaK1FoUXZBUUJiRnJIcU9TUmpPL2dIc1Avd3ZtRkUwOHdxaVhuWU1O?=
 =?utf-8?B?bWVFNXhrY2EvRXJveTR3TUkxL2EvKzNrYVdTVXpBZU9lVEczRnJGa0FQL3Uv?=
 =?utf-8?B?eTVMZGl5RUFNWVB3SkpTUzhTUWJGNUNoeHp1N2cyUEM3ejBQZldEaVZLaDcw?=
 =?utf-8?B?ZFJyWVZBSlNOUTVKR1hiUlpQSG1HOXhYTmgvV0dUOEdQQ2tqSCtHVzdKQUlU?=
 =?utf-8?B?NHptUEdNbVdzZFM2WHM1SW4zUXFSZW9OaE9zRGxBc05HOERyV1hxZ0s1aEpC?=
 =?utf-8?B?WEpGeURCeld0U1FFNnNNUGNDNUR3MXl3Q0VVZ2dOYTFvRjJMSUNzS1RiWUF6?=
 =?utf-8?B?a1FQUldGNnc2aURNTHplb2daaDdLMkVFSnhGQjZwbmo4VHJZZFkyZXoyR0s2?=
 =?utf-8?B?Q1JWdUc1TTFNVGNBa2YrUjRNYXoxVWVRK0pHcWx3OWNOM0srT1kvMzN6cHhB?=
 =?utf-8?B?Rk40RVVBdFY3YW5xQnhBS2Z3d2MrdkZ0dHlSdHJ4bGtyRDd0YXRBOTlyT1Rh?=
 =?utf-8?B?R05mRHhJdXlIM0piS2hialpzWUxyUGlIZTF2Qnc3L25HWTZPZ0JVc0xRZDl0?=
 =?utf-8?B?cjZ6U0hMWVJFVGJlR2V2Z2VIaE1IY2JWeUUzcTlNcmJadmF6dWs0bU1sT1M3?=
 =?utf-8?B?WG5SY0x4WXZiK09aakc5KzlxdUhQK0ZqR3gvaWdLU0lscXVNWVRWbkc1a0t4?=
 =?utf-8?B?RlNiYUJFQUZ3RUhFM1BKSlRScm9wbUR3UHVTUGtoWFFqQjg0TDFKRk5vOElX?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ADB3D3F755C5BC44B375282DD9596C27@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43f6581-8413-4815-0e27-08de0a7bdc62
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 17:13:42.7452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GFQp3w4TAE5RJsLiN3IqVmXC7Gr29E1q4N1rO2p5bPkXYO5yd5KzgUtNOXEsmZI11DVIXmUwn9pVQWPuHN4E9ySVTo1k+vHcQGmRzHmhtvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8325
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

T24gTW9uLCAyMDI1LTEwLTEzIGF0IDEwOjA0IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBNb24sIE9jdCAxMywgMjAyNSBhdCAwNDoyNDo1N1BNICswMDAwLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiBNb3N0IG9mIHRoZSBwYXRjaGVzIGluIHRoaXMgc2VyaWVzIGFyZSBqdXN0
IGFkZGluZw0KPiA+IHNvbWUgZGVidWcgaGludHMgdG8gaGVscCB0cmFjayB0aGVzZSBkb3duLiBJ
IHNwbGl0DQo+ID4gdGhlc2UgdXAgaW4gY2FzZSB3ZSB3YW50IHRvIHBpY2sgYW5kIGNob29zZSB3
aGljaCBvbmVzDQo+ID4gdG8gaW5jbHVkZSBpbiB0aGUgdHJlZS4gSSBmb3VuZCB0aGVtIHVzZWZ1
bC4NCj4gPiANCj4gPiBUaGUgbWFpbiB0d28gaW50ZXJlc3RpbmcgcGF0Y2hlcyBhcmUgdGhlIGxh
c3QgdHdvIGluIHRoZQ0KPiA+IHNlcmllcyB3aGljaCBhcmUgZml4aW5nIHNvbWUgY29ybmVyIGNh
c2VzIHdoZW4gdGhlDQo+ID4gZHJpdmVyIGJlY29tZXMgd2VkZ2VkIGluIHRoZSBtaWRkbGUgb2Yg
ZWl0aGVyIGNvbW11bmljYXRpb24NCj4gPiB3aXRoIHRoZSBEUk0gc2NoZWR1bGVyIG9yIGluIHRo
ZSBldmVudCB0aGUgR3VDIGJlY29tZXMNCj4gPiB1bnJlc3BvbnNpdmUuIEluIGJvdGggb2YgdGhl
c2UgY2FzZXMgdGhlcmUgaXMgYSBjaGFuY2UNCj4gPiB3ZSBjb3VsZCBsZWFrIG1lbW9yeSBhcm91
bmQgdGhlIGV4ZWMgcXVldWUgbWVtYmVycw0KPiA+IGxpa2UgdGhlIExSQyBhbmQgdGhlIExSQyBC
Ty4gVGhlc2UgcGF0Y2hlcyBmaXggdGhvc2UNCj4gPiBzY2VuYXJpb3MuDQo+ID4gDQo+IA0KPiBP
aywgSSB0aGluayBJIHNlZSB0aGUgcHJvYmxlbS4gSSBiZWxpZXZlIHRoZSBjb3JyZWN0IGFwcHJv
YWNoIGlzOg0KPiANCj4gLSBBcHBseSBbMV0NCg0KSSBnZXQgdGhlIG5lZWQgZm9yIFsxXSwgYnV0
IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBnb2luZyB0byBzb2x2ZSB0aGUNCmlzc3VlIEknbSBmYWNp
bmcgc3BlY2lmaWNhbGx5IHNpbmNlLCBpbiBteSBjYXNlLCBHdUMgaXMgYWxpdmUgYXQgdGhlDQp0
aW1lIG9mIHNjaGVkdWxlIGRpc2FibGUgYW5kIGJlY29tZXMgdW5yZXNwb25zaXZlIG9ubHkgYWZ0
ZXIgdGhhdCBIMkcNCmlzIHNlbnQuDQoNCkJhc2ljYWxseSBJIHRoaW5rIHRoZXJlIGFyZSBhIGZl
dyB0aGluZ3MgZ29pbmcgb24gaGVyZS4NCg0KSSdtIHB1bGxpbmcgWzFdIG5vdyB0aG91Z2ggYW5k
IEknbGwgdGVzdCBhbmQgZ2V0IGJhY2suDQoNCj4gDQo+IC0gRW5zdXJlIGFsbCBzY2hlZHVsZXJz
IGFyZSBub3Qgc3RvcHBlZCBpbiBndWNfc3VibWl0X3dlZGdlZF9maW5pDQo+IA0KPiAtIENsZWFu
IHVwIGFueSBsb3N0IEgyRyBpbiBndWNfc3VibWl0X3dlZGdlZF9maW5pIHNpbWlsYXIgdG8gYSBH
VA0KPiByZXNldA0KPiANCj4gLSBXYWl0IG9uIGFsbCBhc3luYyBzY2hlZHVsZXIgd29yayBxdWV1
ZSBvcGVydGFpb25zIGNvbXBsZXRlDQo+IHNvbWV3aGVyZQ0KPiDCoCAodGhpcyBpcyBwYXJ0IG9m
IFZMSy04MDI2MywgSSB3YXMgZ29pbmcgdG8gdHJ5IHRvIGxvb2sgYXQgdGhpcyBwYXJ0DQo+IMKg
IHNvbWV0aW1lIHRoaXMgd2VlaykuIA0KDQpPaCB0aGFua3MgZm9yIHRoZSBsaW5rIGhlcmUgdG9v
ISBJJ2xsIHNlZSBpZiB0aGlzIGZpdHMgaW4gdG8gbXkNCnNjZW5hcmlvIGFzIHdlbGwuDQoNClRo
YW5rcywNClN0dWFydA0KDQo+IA0KPiBNYXR0DQo+IA0KPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTU0MTcvDQo+IA0KPiA+IHYyOiBBZGRyZXNzIGZlZWRi
YWNrIGZyb20gTWF0dDoNCj4gPiDCoMKgwqAgLSBMZXQgdGhlIERSTSBzY2hlZHVsZXIgaGFuZGxl
IHBhdXNpbmcvdW5wYXVzaW5nDQo+ID4gwqDCoMKgIC0gU3RpbGwgZG8gdGhlIHdhaXQgYWZ0ZXIg
c2NoZWR1bGluZyBkaXNhYmxlL2RlcmVnaXN0ZXINCj4gPiDCoMKgwqDCoMKgIGFzIHdpdGggdGhl
IHByZXZpb3VzIHBhdGNoLCBidXQgc2tpcCB0aGUgaW50ZXJtZWRpYXRlDQo+ID4gwqDCoMKgwqDC
oCBzb2Z0d2FyZS1iYXNlZCBzY2hlZHVsZSBkaXNhYmxlIHVzaW5nIHRoZSAiYmFubmVkIg0KPiA+
IMKgwqDCoMKgwqAgZmxhZyBhbmQgaW5zdGVhZCBqdXN0IGp1bXAgc3RyYWlnaHQgdG8gdGhlIGRl
cmVnaXN0ZXINCj4gPiDCoMKgwqDCoMKgIGhhbmRsaW5nIHdoaWNoIHdpbGwgZnVsbHkgcmVzZXQg
dGhlIHF1ZXVlIHN0YXRlLg0KPiA+IMKgwqDCoMKgwqAgTm90ZSB0aGF0IGZvciB0aGlzIGNhc2Ug
SSBhbSBzZWVpbmcgYSBoYXJkd2FyZSBmYWlsdXJlDQo+ID4gwqDCoMKgwqDCoCBhZnRlciBzdWJt
aXR0aW5nIHRvIEd1QyBidXQgYmVmb3JlIHJlY2VpdmluZyB0aGUNCj4gPiDCoMKgwqDCoMKgIHJl
c3BvbnNlIGZyb20gR3VDLiBTbyBldmVuIGlmIHdlIHdlZGdlIGluIHRoaXMgY2FzZQ0KPiA+IMKg
wqDCoMKgwqAgKG1vbml0b3JpbmcgdGhlIGhhcmR3YXJlIHN0YXRlIGNoYW5nZSksIHRoZSBxdWV1
ZQ0KPiA+IMKgwqDCoMKgwqAgaXRzZWxmIGlzIG5vdCB3ZWRnZWQgYmVjYXVzZSBvZiB0aGUgYWN0
aXZlIEd1Qw0KPiA+IMKgwqDCoMKgwqAgc3VibWlzc2lvbiAoQ1QgaXMgbm90IHN0YWxsZWQgYXQg
dGhhdCBwb2ludCkuDQo+ID4gDQo+ID4gU3R1YXJ0IFN1bW1lcnMgKDcpOg0KPiA+IMKgIGRybS94
ZTogQWRkIGFkZGl0aW9uYWwgdHJhY2UgcG9pbnRzIGZvciBMUkNzDQo+ID4gwqAgZHJtL3hlOiBB
ZGQgYSB0cmFjZSBwb2ludCBmb3IgVk0gY2xvc2UNCj4gPiDCoCBkcm0veGU6IEFkZCB0aGUgQk8g
cG9pbnRlciBpbmZvIHRvIHRoZSBCTyB0cmFjZQ0KPiA+IMKgIGRybS94ZTogQWRkIG5ldyBleGVj
IHF1ZXVlIHRyYWNlIHBvaW50cw0KPiA+IMKgIGRybS94ZTogQ29ycmVjdCBtaWdyYXRpb24gVk0g
dGVhcmRvd24gb3JkZXINCj4gPiDCoCBkcm0veGU6IERvbid0IGJsb2NrIG1lc3NhZ2VzIHRvIHRo
ZSBHUFUgc2NoZWR1bGVyDQo+ID4gwqAgZHJtL3hlOiBDaGVjayBmb3IgR3VDIHJlc3BvbnNlcyBv
biBkaXNhYmxpbmcgc2NoZWR1bGluZw0KPiA+IA0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2V4ZWNfcXVldWUuY8KgwqDCoCB8wqAgNCArKysNCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ncHVfc2NoZWR1bGVyLmMgfMKgIDYgKy0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19zdWJtaXQuY8KgwqDCoCB8IDI0ICsrKysrKysrKysrKy0tLQ0KPiA+IMKgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2xyYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKysrDQo+ID4gwqBk
cml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyArKw0K
PiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuY8KgwqDCoMKgwqDCoCB8wqAgMiAr
LQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNlLmjCoMKgwqDCoMKgwqDCoMKgIHwg
MjIgKysrKysrKysrKysrLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZV9iby5o
wqDCoMKgwqDCoCB8IDEyICsrKysrKy0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdHJh
Y2VfbHJjLmjCoMKgwqDCoCB8IDQyDQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+
ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDIgKysNCj4gPiDCoDEwIGZpbGVzIGNoYW5nZWQsIDEwNiBpbnNlcnRpb25zKCspLCAxNSBkZWxl
dGlvbnMoLSkNCj4gPiANCj4gPiAtLSANCj4gPiAyLjM0LjENCj4gPiANCg0K
