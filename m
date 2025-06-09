Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800E8C61DB2
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 07:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE8210E23D;
	Mon,  9 Jun 2025 07:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LFtvirab";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE21810E23D
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 07:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749452420; x=1780988420;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jFvUmkJsW1EC927igmchCI11Lia2oSZ4/T1ciqWcN+8=;
 b=LFtvirabI6BMbOr8geUtkQSQH77ul0eG96iC9WJB9jGyIwj83fVhzCgN
 PBgd0ssBeIYqk6FlFy2VtwGU9d25hOJ4Ph1c90uRHjmr+2vLFkKlbhGoX
 xrkVKsTmGN6j9CebW3NsvYm0WsF5+g9nFe+bzA6k0lbQteqKh0C0IE91j
 aGtvBPPujzlazrY8dJFvbM/grTHTjU+Dgmst0+PfBe4/2jmMZMXr2YJZs
 7NaKXwzB6xkkYqitsfnvg3T5j+hQZ1khjFJgqz6A1irELr7hpRzOsKQu3
 IvXJoI9DcGKTjLpuivd1Ahr398BNlZ5Ut2zX0p8IDHNVxt6sgoyM+UL9j A==;
X-CSE-ConnectionGUID: dBxYQIw5SRCvaCqNBHjWlg==
X-CSE-MsgGUID: XutDh6oHRRKrWiH0eOZw4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="62875056"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="62875056"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 00:00:19 -0700
X-CSE-ConnectionGUID: M2paRlLBSfe6s2vRQYVakw==
X-CSE-MsgGUID: U+7xtUd1RPSjH7kRbr0UIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="151247097"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 00:00:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 00:00:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 00:00:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.62)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 00:00:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxjdUwAtmiUeoJdiAvDE/Hpkd1UmouHBAs/h/sreBYSdU7BnwFLTgkphJH7AFkfazrOOQeCX+cIenq1ACtBDp5VLFRyazYhdoU58MnMq9XfWd3Yt0X7XMO7cutUSVFJJn9f0HyIsKYRoQsGcOYz3MFAFY6y+aIQ6/KREPrQaoxlCrfwHyqGP2mTbTqO8Y1VIKz6LVNHJRUIiz3J72o1bYnxrRHe+b4b/4qxiSq57OX0TZ4ABAjBi632GDkPkp/79UkqDiu/15rBNrFDzOMOPETBOIessqhgKvikPnm99m0xWMRSMt9jqQnO+WV4SdyvDx5zVwbS3fQBxblippkKD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeHY5lObfCE4Qmq4/7TF+c+C9pS9zYUc0OOjg1tndHc=;
 b=TDPaH8n86/oT9QkiKySRl9W94RKpCGE17Kmt32RT2+Zm3kug8Y9CtFElt1R9oDJaglOBz80w0r6iZLT3nQPhXHG1OPYxQjVD1jSFIifH6j6AW/4ps+V0rPmFeJ8AMGyyxLY3tApM42syOpK7ZfZzX0d9bXEPjtKeE/NUX1z6L4hLn7lbqSgGySX0ndfza4JCuy6EOgOW+k03Fvo87BDTM1v9ywJp24x+NLLmBRTYcc9G806PvlQ3n7l+ox1b0xaWu4Kf8nVkXwxDmVBSZZ4zoWWp859HM1TNZpGdinalZ2IKCKrOy2pG7h5pQ0e+u8BMLCZQ9S8N5pBZZbpPEdvzmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by IA0PR11MB7403.namprd11.prod.outlook.com (2603:10b6:208:431::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.28; Mon, 9 Jun
 2025 07:00:16 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 07:00:16 +0000
Date: Mon, 9 Jun 2025 12:30:09 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/9] drm/xe/xe3: Add support for graphics IP version 30.03
Message-ID: <aEaGeVzvD0MwXW81@bvivekan-mob1>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
 <20250606195104.1771715-3-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250606195104.1771715-3-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: MA0PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::17) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|IA0PR11MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e6c58a-e20c-49ef-7979-08dda72349a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amxIS1J4eG5vb3hTdS9vSGdUeWdIV0w4NVVSQ040Z0hmd241NFpsSGlSWWRP?=
 =?utf-8?B?eFBXb0xuNWtlcG01S01lZUNrTjZrUzQ2T1RjTDk3Y0FPak84U2hNdE1NRmZR?=
 =?utf-8?B?aXpET2IyUTAxdFl5MDBEcWtRZTVEQmFPL2FOS2RxczV1cW1DTCtxTGFUdUZQ?=
 =?utf-8?B?N0dWVXpwVit4MDJlOWQycStERWJnS0xpbjRIT1JUZW8xWHB1K1BvS2QrV1dp?=
 =?utf-8?B?U1pLN0RWcHdNakxhNXgxR2NsUTZrZHB3SHRNaGdycUhxcFE4aWZMeUJqd1Bu?=
 =?utf-8?B?TFVCb29WdTdSQnR6RjdaNzF5QXJtQUtrQTR5eDlKc2tKd2FwZmVTVlJCTGlx?=
 =?utf-8?B?RkZkL0tkTkRqbHh2YUlkOVh5VUk0a0hiOGRRVUEwSkxYdDZsYW4vcTV6Tk1W?=
 =?utf-8?B?Y2RPNndaV3Y2dFRxeTVPOUZhQ3ZzUWUwaWd4bUg1c0Z6ZGlPN1krU2gvQVl1?=
 =?utf-8?B?a21GUkgrQ2VCbEd3Q0JBeG5wNUcxVFNJUHhOTTZpOVVRWC9DUEpVR2tub1gr?=
 =?utf-8?B?YTdLcWZ4NkM0Tmd2MTk4Q1Mya3J4WG1BRVNNSUhVSkVtQy9haTlxRjlyK3ln?=
 =?utf-8?B?cnh5Q25nUUZKeDk0K1IrbFV2NG9VSkpNZWMwcm81YTB4V1NuUHhFY25KTTQ5?=
 =?utf-8?B?VGNWOTY5VnVIS3UwU0Vja0lPQWN4NWV2di9uMUZoR0tyN0NMaGM4MDhycVov?=
 =?utf-8?B?cHcwZGJGZDNVSlBROUN5bVdUaWdHRzRyTTBkU0NiK1Brck5UbndlbXJCbUNt?=
 =?utf-8?B?K016UEVQVDk2N3Y0U0dKWE5JRktGOUVxVXR2U1FSNUVyVkFoTzAvaDVDZHpk?=
 =?utf-8?B?Y3ZlV0phL1FONjNlbjBJQUZBNXVCMzIxcmFwSjZ0b1V6clF5dndPVFRqZnda?=
 =?utf-8?B?UXFmckEwWEdVN09QNE5Ic1JmOXg4ZDlkRWFoNmF3WHppTzFjeU9oa0k5eVU0?=
 =?utf-8?B?NHQ5Ym1MMGVsUlltSUlrYzFIK3RiTmwvV3VmS2lkeFMwUktNVHdPVHZwVVgw?=
 =?utf-8?B?RVhoeDgzMHBZVVF2WXo5NWlSRGl1V05SRzJOT0Z3Wk9OcEs3eVBLM0xRcnJq?=
 =?utf-8?B?eERUZUY0UUN0Zno4Zit5Rk5sbGcyd0FSaVIraWpJYzB1azg4VGpBTHVKcTJu?=
 =?utf-8?B?YVRoZUxHRzJ5UUZYeEo0Um1uZENBZG0zRzEzNFIrWkR4MVdCUXEyQUI5MDZD?=
 =?utf-8?B?b25wQXdVamw0TTBJSy9aOFZhTkJFM0dBb0RKZ3FCRXRiZHVuRmhuNnJ1VU54?=
 =?utf-8?B?eCtNMy9ZYnl1TWZCOFBqRXd6UnpzQXdmWWw0WHg1d3NZUkZRMEw4cG1iM0Jw?=
 =?utf-8?B?R3lJeHQybXpUMGMzUm5XTnRYeE9KRmNKaWVkUlArenNIWmpiL3dtRC9NTXV5?=
 =?utf-8?B?cWczLzBhd3d6bGhGZE9TTjdxbDBwaTc3ZWhrR0FMYVd6cW4wTG5oaG5RWFIx?=
 =?utf-8?B?OWw4dmhKdFlSR1BDdlR0NW9Yd2pDaEZKYzA1UjJNbVdPQmpsOGdhT0VjK053?=
 =?utf-8?B?cVhra0J5cjFkUmMzRDJlQkEybHZOeENRdjdKRnMvWGdiemVndTVMODdwOUdN?=
 =?utf-8?B?VWVTSEVUb2daSGRqaXhmVWNwMHZiNU9wMnUzejJLOVpJL0J3clE3SUJuSmc3?=
 =?utf-8?B?UitjcnJwc2dSYXpwR3RZRHJvVHRQdWcweWRmV0JhMitOeEtFTUF3VDd2Z0l2?=
 =?utf-8?B?cnVHTUx3ejR3WVdKMWdYMkRIbXUyQUl2c2lsZk1ua2hCR2NsRHlqRUVqeGJ4?=
 =?utf-8?B?aWs4VjB2aWpZY3hYUnJkeUJGY0YwZDFiTU1tTXpvZnVSZTU1UGdUbENxcTQx?=
 =?utf-8?B?c0hVUTI5Z3U2QU5jaVRsQ1luemhXdWFyeTg4eXhxeTlpb3hJWnhZY1praUNK?=
 =?utf-8?B?a3RpZFkxTTN3RDRZMGQ2RHRzVmF2NGdUSVgxaXZ3YisxbEpXZUFTUnNISkhi?=
 =?utf-8?Q?Exh1My90NCM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3lGLzBWazBZZ1QyaHE2VUFTSEpjcVh0c1dRTjZVRWMzZUdDSVNoV2lMcExp?=
 =?utf-8?B?cUtMY0c0UzdEcG9DeWRJZmszUEtFN3N1OUVwd3RZcTVhK0ZlUjEzOUFlMFJJ?=
 =?utf-8?B?NHptakN3dXE5TkdUUEZKL0ViNXRERzI2OW5NNHNraHcxTUNORWZwWGNHeTVG?=
 =?utf-8?B?VEJ5Y05hVDIzeWlzM2dIWis5NUwrSGd3bEUxS0xDaXpKSk1kQnJTVXRQN3VW?=
 =?utf-8?B?VlROTUdmRW5vRTRFR2puTDYyK3o4cStaaWdsZlVONXVLa1FIUlRjYm9oM1d5?=
 =?utf-8?B?RDJaSVhwQ3IyUDg3bkd6eEIwOU1qRmRubVRWVXF5eFNYOE4wT0VTeEUvK3Zv?=
 =?utf-8?B?M095OFlJSTFzTS9PRGRNL0xZYXp6Rk02OFFaUUIreGZzYTM2QytaT3NyTFU0?=
 =?utf-8?B?dzZjRm02bVZBTG1SWUtpanRGMGhPOWk2TWZxcjNSdTQ4ZnRzdC9Yd2xtaUFE?=
 =?utf-8?B?TVd1MjdjUU4wUFQ2U2RzTktCTlBLd1ZGQ3FuWDVIcGRzOVUvT2hrV0VDaU94?=
 =?utf-8?B?dWJVRVdNYzdaN0xkZ25PeERkNDY4WnFTL2tzbGJDQUxVSkUwZkU3dUNoYldN?=
 =?utf-8?B?TkhJOG11N2I3MTFYbXEwdVlDT3l0SGptamxwaFJlVFVWbHhQeWhDejRESkUv?=
 =?utf-8?B?QlpRRXdZZCtRK1RCMDdQVGNzcGViYWF0Q2o2d2p5UytwUEphQ09reFE3YnJk?=
 =?utf-8?B?VTlmeW0rcWxVK2pPNjRMOVVnTFJmTUplRmR2T3psSk1panVBdzhtNXIrRFhz?=
 =?utf-8?B?R3B5cUs4MHNDN3FPU3N2ZUVsSFRJNnJxMmhkdTNhMmdpUjlBR01tTGZDRkVR?=
 =?utf-8?B?bU5KTUxwOFR5SmhiVDFtTUMwU1lDWWJkNlBOQVUzY1RaY3J6b2Y1T3J5SEZ4?=
 =?utf-8?B?cTlYaWU3SHk0VVExSUdzWllUckk1NStRY1Rkb0JtNGROZTYwSmZRTitOZDVi?=
 =?utf-8?B?UXA1bTVyZVN3TlZvWldZUVY4K2wxYzQzQUR1UGJpTkFsTkhwMHdiT2FNWUhr?=
 =?utf-8?B?UG4vcUN0aU9wdUx0cVJRb3VlOFF4Szk0ZTRmOWwrRmxPWXJiM29HRnhHVUo4?=
 =?utf-8?B?VllyM0xXUTRpdUFqdm9hVmVhQXZCM0RJUUR5bFRySWRsM0wzN09uYTg4OUxy?=
 =?utf-8?B?aVhYbEVqTXEzcG5oWXBNSGNmd3gxeUN2dlVVa0FpVkpTSHREdnk4MWdiMEVr?=
 =?utf-8?B?VVA4MWxoV2pmaVF3dEs3dXpHTERwdVdPOEFuM3l0NFFaSkJHVHpmd0dyU2xw?=
 =?utf-8?B?ZUJ4cjlWMm04cExHeHkvWGhsaDBEU2lLdDVwOUlYN0N3V3FEa0x0TWhLdGtx?=
 =?utf-8?B?WXRvZ1RwQTY4OVFmTEJkWkdLT3NxYlpITUptZGNxVktnbXNZWjBaeFVRWjFm?=
 =?utf-8?B?TkNGOWttTW9LTTZZTVNTLytWak5MSGE1SUdVUXRObnR3RERXM28zbVcva1hR?=
 =?utf-8?B?SmcyK3dJTmdaTkpOZE5MOW5LeGN2YWN0V3o0RmhTNENwYloyNkJJbjhkeHVX?=
 =?utf-8?B?UDd6OFZKaHMrNklzV2tKSUlUSnphTlByd3IzZU96aGwxa3Q5YmFISFJIM1A0?=
 =?utf-8?B?dVZoOUJmeTZOU0RoQXU2ajhwaWN0WjQvdmJ2MzUxQVpja0pkNmdjdFlEUEtU?=
 =?utf-8?B?RCs5ZXZ0ajBCblhxWWM3Q2U2aE13R3NFa3JMMGx3aFMxaTNvQWN4VU15NFFU?=
 =?utf-8?B?Z3hiQjUvemZMTFZScVRKcFpjdHMwb2ovU3ZrTU1ibjRWSHpHRXJQOUJNMzcz?=
 =?utf-8?B?cElXblZRSjBvWGR6dEo2LzdQUTk3dnFRQkRhRHNXOTdOUjlGSnNIcEJ1dGkv?=
 =?utf-8?B?cVRtNmtzMGdPbHA4UFZTWmozT1RUaytac0hFNHRUdHdQZHJ4YWExN3VBREkw?=
 =?utf-8?B?bGNxZjF3bU5Cd3IwNHFtVVZLY3RWaDFvUjRMOENFK2VRWWt0TWxhY25rN3k5?=
 =?utf-8?B?WUVxRmZsQkJVUm0xcTh3SGp5bm1iclRqNVhvNGRUcWQ1Sm12TG94ODdTNnFh?=
 =?utf-8?B?YXZBeDhsK0hOZSt3TjFjL2pxbjdlVWlPbGpzU3c5R05RTUNtNUJ0Q2pFSmhQ?=
 =?utf-8?B?S1VFU0FnUWJ4T2o1WVhLVno2UVhUbTBNNVBRbFBkVlc1NlJwcHNwWG9PN21Y?=
 =?utf-8?B?eVdxVTFRQjF2VXhVVzQ5OUpPZUgzWWdidFBSRGcvK1QzK0tYZDlpcWxFeXd1?=
 =?utf-8?Q?FmXo1hWpUqY5zYsE9YXbl7Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e6c58a-e20c-49ef-7979-08dda72349a0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 07:00:16.1147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+akx2/yH+1bjiiy9iapURnhWPHy+wjiIC0lCL1jAcwHDFzurt4L02EYzoHP/7VBMMziSzhwmOIRz+ha12DXK25wSD+Wh40mGcsrJhoRkIFiiL2FeLVMLCcKF6y2pMyG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7403
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

On 07.06.2025 01:20, Dnyaneshwar Bhadane wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Graphics version 30.03 should be treated the same as other Xe3 IP, but
> will have a slightly different set of workarounds.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c        | 1 +
>  drivers/gpu/drm/xe/xe_wa.c         | 4 ++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 5 ++++-
>  3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b5559800db7a..8824a8016b1c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -183,6 +183,7 @@ static const struct xe_ip graphics_ips[] = {
>  	{ 2004, "Xe2_LPG", &graphics_xe2 },
>  	{ 3000, "Xe3_LPG", &graphics_xe2 },
>  	{ 3001, "Xe3_LPG", &graphics_xe2 },
> +	{ 3003, "Xe3_LPG", &graphics_xe2 },
>  };
>  
>  /* Pre-GMDID Media IPs */
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 67196baa4249..5f750054a9c4 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -640,6 +640,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
>  			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  	},
> +	{ XE_RTP_NAME("14021402888"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3003), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
Instead of adding a new entry, can you extend the range of the already
existing entry -> GRAPHICS_VERSION_RANGE(3000, 3001) ?

Regards,
Bala
> +	},
>  };
>  
>  static const struct xe_rtp_entry_sr lrc_was[] = {
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9efc5accd43d..557d23c1bb9f 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -33,9 +33,11 @@
>  14022293748	GRAPHICS_VERSION(2001)
>  		GRAPHICS_VERSION(2004)
>  		GRAPHICS_VERSION_RANGE(3000, 3001)
> +		GRAPHICS_VERSION(3003)
>  22019794406	GRAPHICS_VERSION(2001)
>  		GRAPHICS_VERSION(2004)
>  		GRAPHICS_VERSION_RANGE(3000, 3001)
> +		GRAPHICS_VERSION(3003)
>  22019338487	MEDIA_VERSION(2000)
>  		GRAPHICS_VERSION(2001)
>  		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
> @@ -57,5 +59,6 @@ no_media_l3	MEDIA_VERSION(3000)
>  		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
>  16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
>  		MEDIA_VERSION_RANGE(1301, 3000)
> -16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
> +		GRAPHICS_VERSION(3003)
> +16026508708	GRAPHICS_VERSION_RANGE(1200, 3003)
>  		MEDIA_VERSION_RANGE(1300, 3000)
> -- 
> 2.34.1
> 
