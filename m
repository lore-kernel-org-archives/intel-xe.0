Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557A4CEB2FD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 05:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C3310E5D0;
	Tue,  1 Oct 2024 05:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TlUOUavs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFC310E5D0
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 05:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727759204; x=1759295204;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y/JddQh9PamKmuvE8KFLvmittUp3xbD74PqrgsoxJxc=;
 b=TlUOUavsgCHhe87nuO2MHtqOyyZr0KB3zz/SSYd4uYzKtl80HZVRjrOd
 O+bCCYtaPf6UoTq2SmKeTNrrdBKYi2BJy8R1Qyjvmzxme8sQW5FryJS20
 r8/VGPBF7XwNwuIXX/ESUxkLDwHw+JmP65/R0/JTF2pG+6yWXd4bxCFWC
 0MOxdkNZ2CHaW18s5djgQDK1IqtWH0ZJytBvirxIjZBSC19P+VHsEoV4c
 j/HJDIHZvDX0uq0A5fEh5O0/6vgJ9v5HJ8g73yeQbpNM9LEbHoDrftipV
 8SUFdannNiiBDraZ0baE82i01uQjO2u2Fm/01p8z5UxZ0LscR56ARzOAg g==;
X-CSE-ConnectionGUID: LAOwMQTiS1GnHi4ou3hOrg==
X-CSE-MsgGUID: 53ye3ts7QkOs8Yv5HY7ZFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="44394432"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="44394432"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 22:06:43 -0700
X-CSE-ConnectionGUID: DjsEHktNTBGO0Jt3IUMvPw==
X-CSE-MsgGUID: +Ggxj/5vSnqPGvoLdzuJAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="78382269"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 22:06:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 22:06:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 22:06:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 22:06:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2eJCSOuaX6rEDxiTzaaBtDJ7+apQjg8u6oVHqhqkXCDoxKnjLg8H9m/XqSQCcgZlKaSYezTPud/2ooFpFNKeDIBNWSMFCF+BFwu9RAD4CnPqT776r1utjJN4z77c1FulK6m95wYACahLmoZ9mujPjwAHjs73p8EuQW+/mF1disUkAq9W+uRl4VisUgoeWn/VnzoQ3bDVs7beDF63ABichKepkXHg3wzCniDCslbv1GaWVR0u1MssgXKRhceIhx+Bg6kH36vXjsLJvvlIVbsPb4HFbmC3uDPSWv9tDXBGPg8WJk5xnTU5NX4D1D3wt0riO0k3n7vHWxvGbyKsgpvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eyb5SuZONLXFRflOSgHYTcOK7b0I5bVPydol6ecp8v0=;
 b=GrcYUJ0gG+/XP34XGsM1z/r+Tpu0NMU6MLlu67dmTdWNRDSNwfHsgbQcp5pshETQkyrY7xzMNCszYUTE+y66WxGf47HwSOlukWkZudXTYwU/n71k6cPmXdGbLBBKbCPH3kydOEpgrx0uq1pbxdPP9NX5pLBrp/CgCyhiiuU1TCG0hWrZ1OneXE6Amtk8RwFbhykKY2W1SkonkFCvs2gH9ZMlI1B8swdSwFL/K7tCQmrKN4Jsp12gCIR9eE0n0M4rqNhI+Cc/oyANnuMb2nG0XiDFH0O7nGmmyKhv5Y7dMD42gg9AAw2fqYybEHB4YD2gfDDCC1+X3tOmBKYA4BJdnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB6369.namprd11.prod.outlook.com (2603:10b6:208:3af::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 05:06:40 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 05:06:40 +0000
Message-ID: <a165e8a1-76d7-413a-87bf-d74a52c314a2@intel.com>
Date: Tue, 1 Oct 2024 10:36:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/25] drm/xe/forcewake: Add a helper
 xe_force_wake_ref_has_domain()
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
 <20240930053149.1246339-3-himal.prasad.ghimiray@intel.com>
 <f6e6ebd2-de76-4466-9374-9bba7e5d2ae0@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <f6e6ebd2-de76-4466-9374-9bba7e5d2ae0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::21) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA1PR11MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e6755df-f6b8-4215-5bd3-08dce1d6d53b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEZwbC9GWFdBRnV0RWlQVGFWdUhoeFlNUEcwL1pGSTREVU02bnRGbnJVSkZL?=
 =?utf-8?B?RFNkWHhzaE9aN0dndjB1RkxXZVhocXB5TE93SDRvc0ZNUkhYNG5LbDdRTTVh?=
 =?utf-8?B?KzRhc21HRXNpUzF2M1FXUjhPMDBoZ2FBaGFZTTlPa3gwYTBTUFJBelQxdi9P?=
 =?utf-8?B?cCtYeVRENmtSNkl3Y0xuZldGV3lWQmZTNU1RRkQ2UGdoQ3Qrc0p0RWV5OUpn?=
 =?utf-8?B?OGg1MlIweXprVjhkNjRCTFI5Mm5BWjBoUG5IOUNpdjZidDRueEpuLzM4eFRK?=
 =?utf-8?B?QnVOZ1dNMjUyKzZUU3ltQlhMTG5TaG1seW5DRWMwUitHUzFNd1BUUTZmbUJW?=
 =?utf-8?B?dFZoWXhlWkhKTnBsZitQNmZxOFNvMGIzMEtoM3VmNDBoakl6OFB4OG9RVFlq?=
 =?utf-8?B?OGpoOTQ0cEJlMFV4eXFYSkNoRWdMSXMxdVBNdEt3UFFvbTIxVzZEVkpydXVm?=
 =?utf-8?B?bFVybU1nWm1LVHZXcEhWK1NneXM3VGtXZHR4UnE2YTZIWmNYdGYvUWhWUzB3?=
 =?utf-8?B?NUJTeHFPZncydE95UThWTkdhbzZEWVExTGFuQjlLNFR2R2xUZDZUREowVi9y?=
 =?utf-8?B?RW9hVnh3WTZOYTc1VWxaMUlqRXAwMTFjSW1NMFRXSndRdlY0QjJGaTBkV0xU?=
 =?utf-8?B?R00yNVZhd1lrSnpLMmgwOFdqYVRZUGRXRnkvMDBzbHpYb3JRd1J6MW1YTXpt?=
 =?utf-8?B?WGRrdXQ1THdCQjE1K0NkcDRLSkFDeU5ld29UT0hKcW1BeG1jbmQyUkZ2U0Fj?=
 =?utf-8?B?N085WWhtZ1BGWW5VR2tXQ3FvVkZwdTQwTzJqLytlWVhGQjNWUGVUV0xKbGd3?=
 =?utf-8?B?NzRxOSs5TzlVN0xoVE5ORnZyYW4vTi9aSWZxZms0aXJaN2hqSlY5aGJhQVoz?=
 =?utf-8?B?eFMvVHdCRlpVUUJEL1VCWmMrbnZuL1pYVEhvdEMzeU4ydzYvejdaYjk0SFlj?=
 =?utf-8?B?SDdBNG43QjdUc0hUR00reklSSVRYMXVaZVRrdU8yamVkcHJXalhxQjkwTTNM?=
 =?utf-8?B?bDY4NnpGSGhJK1NWNHEwOUlnUnl6ZW9TRmNPalgxYWNGVTJCQy9SdzJ1dUs3?=
 =?utf-8?B?Zkk1eE92eUpVaWJaTHBEa05WWnBTZEhibmIyUXZHWm5jUmhqNFd0R2dDVE83?=
 =?utf-8?B?TmNCNmpWYkptb05SRGMzQ3VvSkNUaitRSWI0RXlEN1NOVHB5Z2FXZW16QjdK?=
 =?utf-8?B?dkhMWVd1UU1LOGtZRHc1RlBQZjViRHFGMVI1aWpZVk5VME12NkVQR2xVN0hI?=
 =?utf-8?B?N3g0UW0wZ0JCN3FsVVBvSkJBT0RZTUNHU0pWa255MjJBNEYrZkp6SGJ4b3Fi?=
 =?utf-8?B?dUkzaFRxNjZHYWp2TnpCZHNmcUEyQlc5RVZQR1FHZS9aZjFTeWVEa3Z0TjR6?=
 =?utf-8?B?OHBnclVLeDZuQ3JteERQcXZCWUV0MnNEeFVVQUEveXJoLzN6eFQ2NE9Cb2hq?=
 =?utf-8?B?L3B4MVc1aDRwUHN6US9SQ0p6cGJ1Z3JrQngrMXZXTnVNYlJjSEt2dFB1K1R6?=
 =?utf-8?B?c2hIYkVHSTI5SytuV3FYbGdpTnk2MUx4KzQxdXZNM2ZxSHc1dDZzbXJMa2pV?=
 =?utf-8?B?OUVQTHNBaXVSRjd2cFhGZnFSaWFZSERqU0xVSDM2OHpKUUFYa0JtZHBTdnA3?=
 =?utf-8?B?MmEzYTJDcjVPa3Y4Q0hsajY2VEVrNmJWdkZKYjBLS0x3Qm12c2ZnM2gyazBR?=
 =?utf-8?B?ampiREp2Wm9MNWZ1dFJSWjRvaHUrMjRuU1h1Ukg2SERkeTh2TEhvcDZ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ky9YSGMyMGdpMWNuZm1BY094Y2JXYXVwbDJZMlBKTU9ZcHJ3dXFieDhYbTJ1?=
 =?utf-8?B?S0JRdFBvTHlVQXpyZVNOYXIxZ0dITlk4Ris2T2tpeit2OWJObEVhVlFhUmJa?=
 =?utf-8?B?aENlZ2xDalB3QlcrWHYxNDlXdGZmaTZwczhCc0dLM0d3MGR0bFlVN1I5M281?=
 =?utf-8?B?ZGQwbjl3NGNoUzFWTlhiazR2QVJScUJBUkV5aVMvL0p1M2NZdExpbnZWTkVV?=
 =?utf-8?B?N2FETlEzWEE2eUlXU24wTlZiUE1HYW9nUXppalZ1OThXeGNRR1dnV1ExNlRy?=
 =?utf-8?B?emhGUnJ3SWM0Y2JpTlp3UG1IVXFsOWU4VnB5cFNRTnBYdHRoS3ltdXA4Sld6?=
 =?utf-8?B?UXZLNXA0WHFLcWJlNC9KbUx6Q1o3czdMWXd4T0JpeFdWQlUxbU12bVV0dDVN?=
 =?utf-8?B?ZHpOZHR3NXhnSGhaNStFY3E3WGVYWnkzUDZ3K2FNQXNaVHBNNkE5M09xOUtY?=
 =?utf-8?B?akg2ZEZLNFlQcWlWdDEwTCtOUGZ1K2VzTUxYYTRaWjc2UGtEeXlyRUQxanY4?=
 =?utf-8?B?YTkwaEl2dUNNSktxcFhNOXgyb1R6bjR3UHZFYmRjZVJXWjV3cjBZTGpiSkc3?=
 =?utf-8?B?Q1dkc2FRenFLU3N0ODFrVnpudVpwTTdqZm5NbmptWWtZOXZDa2hWbEJ0Wnh4?=
 =?utf-8?B?K3J5cjJBcDdGN3EyS3RaRWRIbStiL09vQ2VySWsrVEJZWDEwdzVESTV3RkZH?=
 =?utf-8?B?My91Ky9VYWxyTXFMNkZHVEZkQi93SUdVTFJrM1IxbFNLalN0eVBZYlVnaFk4?=
 =?utf-8?B?NXY4VUZIQlo4Z043THMvOW1DakZQL2xEc0VVRTlrN0tLZE82N2xrbXdSa0xh?=
 =?utf-8?B?WXFJb3JyK01KeG5PaExVR0l4azVzYjl4UWVacVdKZFMzNEExKzkwY0wvOTF0?=
 =?utf-8?B?UUc1WWpud3VWMWs3bng2K3BKN1VnVG5lbUUyeDZZSDdGQmpUbW84bnAxZWk0?=
 =?utf-8?B?MStxZVFtbnFwS0FZU3pDUDVhMFkyVnYyUGRMQ2xka0dISTV4MUxPOUFIQ0hY?=
 =?utf-8?B?bU9vVzM5WENITFAyWURsWFBqd0dxTnZxbC9TcUVWUXg2WHM0dHhUMUV4b1BD?=
 =?utf-8?B?NzBJMUZmSmFZZk9tbHJmQTJYTmp3VUxBZjk2Y1BYMCtZZDZ2bVBPWmdzRGRa?=
 =?utf-8?B?aVloM2pORFVHanFwTGd5Q0xlZXZadzNaODVPQmV6aWI2clRvTTVZeXRSVE4y?=
 =?utf-8?B?eTNjVm9wT1kxM2FBQ3dMWDhFRk54N2ZMUlJIVERDV3J4QUtPV243T0t2NUw3?=
 =?utf-8?B?ZWhwQkd2cHRjUWVwdys3WkZ6SVNJZlZidFZVbDdCVDdhRm5CZDVzeGExTElP?=
 =?utf-8?B?b3E2UHlCcmF4SGU0Y2NUM3M5WEJqTW9aWFdRdWFPS2tPRWxyM1dBRjFEYVNQ?=
 =?utf-8?B?QXBoSVJxMHFMNHBDUUtyMWIzSWV5VXVoQ2tRdTgyZkhjYS9ZV2FwNFRMSEds?=
 =?utf-8?B?R3dzQ3Urb0d6V3NVd1Q4Zyttb1ZRdzF2d1FvdE56NHhnd1kxYjVHSkw4YW9G?=
 =?utf-8?B?YkhtUTlVNVRQYUZpTzVxdFhxMGE0b3VtVXQzVVFkemd6TnVHSk1Mb1ZDaHV4?=
 =?utf-8?B?RVlDV0Fnc2x0d0YxZmxkK3lkK0l5MTVhQjd3d1B3c0FqbDNtc1ZHSVhobnRQ?=
 =?utf-8?B?aithUEhkY0hHWXlMMlppWmxsQ3RQaE1qU0NHMktDM0V0cDd2dXA1SW9vUXY4?=
 =?utf-8?B?N2RVZEtlTzFoaWJ3YmkxcUgrUklDWFFyVlIxSk05cWgrdy8rcWhZTTBHdHJm?=
 =?utf-8?B?cEh6d2FkWEFka2E2UTQ4eXVYSHl5V3ZXb3VSWmJRcGVCSmtINVFta0xZUkNx?=
 =?utf-8?B?dTZxQmVjRk9rbFNCQk5ISW44OFVzOTBQalZGaFN4QmpHRWVsM1R5Y2J1L1hr?=
 =?utf-8?B?NWdNaUMxYTNuN1o3TEhpRnZhdjBveFVWMjhDcWdIYjZPQXdldFVwYWZhNWlt?=
 =?utf-8?B?MWRjQ3MrYitxb3hhRW9KNHFsN3ZDY2pFbEF2cTFWT1FXU0JRV3hWMU1HWDVI?=
 =?utf-8?B?R1ZMeGpxV0FpOGIyVWNOb2VmV29KNWtoSmxIbkxJVkFtV0MxVUZrRW9jMlJC?=
 =?utf-8?B?VXJ0cFFMcUl2NVVycm4rdmo4QW5JK244ZGFOWmRPYVByMWowdkJNc21wbkFP?=
 =?utf-8?B?MSt0SC9FTDg4RDV0enBvdExzSk5qdlVYN3V2REhwVHhIY1ZlaTdyR0V2RHdD?=
 =?utf-8?Q?/7Phl1Ye1gtZlNw5FykU9KI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6755df-f6b8-4215-5bd3-08dce1d6d53b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 05:06:39.9164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VviusAuRgKYnbb66hmG9mnhpjX8rbobbRGRPv5ceXvpkSE8l8gDlpmy9beFn02gBWOw4Q4gRatCeQ5S//TCuOx9zcae9kbbsSd56AdyWADo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6369
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



On 01-10-2024 01:34, Michal Wajdeczko wrote:
> 
> 
> On 30.09.2024 07:31, Himal Prasad Ghimiray wrote:
>> The helper xe_force_wake_ref_has_domain() checks if the input domain
>> has been successfully reference-counted and awakened in the reference
>> returned by the xe_force_wake_get() call.
> 
> hmm
> but at this point of the series, xe_force_wake_get() still returns errno

Yup, will remove  returned by the xe_force_wake_get() call.

> 
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.h | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>> index a2577672f4e3..de720881a300 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -46,4 +46,23 @@ xe_force_wake_assert_held(struct xe_force_wake *fw,
>>   	xe_gt_assert(fw->gt, fw->awake_domains & domain);
>>   }
>>   
>> +/**
>> + * xe_force_wake_ref_has_domain - verifies if the domains are in fw_ref
>> + * @fw_ref : Return of xe_force_wake_get()
> 
> for now you may only refer to this only as: "the force_wake reference"
> and once you update xe_force_wake_get() you may say there that it
> returns "a force_wake reference" that could be checked by this helper

Ok

> 
>> + * @domain : forcewake domains to verify
> 
> domain or domains ?
> 
>> + *
>> + * xe_force_wake_ref_has_domain() confirms whether xe_force_wake_get()
>> + * is success or not for @domain.
> 
> This function confirms whether the @fw_ref includes a reference to the
> specified @domain.

OK

> 
>> + * In the event of a failure, if the caller chooses to abort or return,
>> + * they must call xe_force_wake_put(fw, @fw_ref) if the @domain
>> + * parameter is XE_FORCE_WAKE_ALL
> 
> hmm, this last sentence is IMO not applicable here, it should be rather
> placed in xe_force_wake_get() doc that may refer to this function

Sure

> 
>> + *
>> + * Return: true on domain is refcounted.
> 
> s/on/if

ok

> 
>> + */
>> +static inline bool
>> +xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains domain)
>> +{
>> +	return (fw_ref & domain);
> 
> you don't need these ( )

ok

> 
>> +}
>> +
>>   #endif
> 

