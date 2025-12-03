Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3061BD1CDAB
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 23:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FEF10E163;
	Wed,  3 Dec 2025 23:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XCTRtQ8V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D7C10E163
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 23:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764803481; x=1796339481;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xKEnlstrpVu1PnTQXpB/3c4695UdWhZzZcn+2qFQGlI=;
 b=XCTRtQ8VcZPmvH3pKicHL5x6D34/dpttzSMNtx3fQxHK8b1pu81eLMUa
 G6YHT0JD+I3XeQxLM40yLF0CEGsS/pB5ewbztN1TFwZyE4uZWxMArkk+H
 MEUFJlPYiRfaZ0s3A/HwZBhcCkW5Z0eS3hHahwkY8AwJVLpygZIHDMymT
 juWPmRUCuz3orSnVYcrQXvZ8jArRUU3KBQ/sasxHduagGjG5mhVj9FARx
 xGdG1vvfhzEGaxawkJJq9COr/rxwx79NFOSRDUmK3u69bNryQ4ar0cuk4
 cO/BkqjaAlBhHr3Sa9U2YIu/aOtSzU61DxBjY10BOHtgRh6uXwnB+tDHe w==;
X-CSE-ConnectionGUID: 2Q7FUUZVTJiKWIFrN8IUgg==
X-CSE-MsgGUID: ZwT3ZT/NTdafXR6bit4v9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78282492"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="78282492"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 15:11:20 -0800
X-CSE-ConnectionGUID: Aa/79PcWRDaGk6LHaCcM7A==
X-CSE-MsgGUID: poKFGwuRSJuM19qc4m8zpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="194860609"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 15:11:20 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 15:11:19 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 15:11:19 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 15:11:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRGOMQ1d1nSMlf4cppl0txFMKDA1C3Roz+nWupLmMUDlWBsDTmJBn7/pKigpBL1yEcOphpILXsJ/2VQrBNqwmbO2EwumwOVy+r1ahQTK009zMn3/K8NZxIQLN7Drqp6RkFXSdNjEZ4kfkV1HO8jNM+X4usQoGOBl7lOIxgOPEebF2ir6wmLyoX+3tbazTMkOH+JKui3S1q7dV9AgcIKnEXqsBC/gdV3hqlMtZzv49k7xgKwja6kP9i7FlCqQYYI6K2lclFyDpXxvCQ7o+OSO6DIjK2RNIHPbdlNJpdFoAwl4gjWYnEU+RGFGvLWYpFLyvL364FqDuhoBtBUbhZgkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34ZEMdoGpDMYJ50tHXCBUJxGeDvu8bHWY/hK3nEYxto=;
 b=OIrLqydKfqNVF9S1Y6M3cOXrXAPvbcKf6GP4c7waTmoOuaC7NJYPuSVpgk59sOyT2d7GBsmR6IpiM9NtDOqaOzKV9259wdSA41lmXyTESIRCanS4Vi27hKh90PH0RP2UUnFpgrEju6UwD+qpBccTC2L2plM6fyzfOENmFBChj5AX2CirdFoGxY/0eSWWFZJzYZLuFgFqE9h6xytI3U/XWVhGsfGBQip6s8XgS9JYmFyFtoaNpM/+Xe6x2SoMhrcfl7r74hG/SElgTkk5dmhwRg6BkwwrPy2z/BxAlVlZDkD9O/9qApnWoXDoExMrBmhm6GuzWyyYw4Jtri3feiQhyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA0PR11MB4720.namprd11.prod.outlook.com (2603:10b6:806:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 23:11:17 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 23:11:17 +0000
Date: Wed, 3 Dec 2025 15:11:15 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <shuicheng.lin@intel.com>,
 <alex.zuo@intel.com>, Jani Nikula <jani.nikula@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe: expose PAT software config to debugfs
Message-ID: <20251203231115.GQ4065316@mdroper-desk1.amr.corp.intel.com>
References: <20251117230156.366860-1-x.wang@intel.com>
 <20251203225355.24972-1-x.wang@intel.com>
 <20251203225355.24972-2-x.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251203225355.24972-2-x.wang@intel.com>
X-ClientProxiedBy: BY3PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA0PR11MB4720:EE_
X-MS-Office365-Filtering-Correlation-Id: f78de789-76e3-4506-3999-08de32c14353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0ZxcXZoTHhMQitkNjV0L3kvY3l1MC92ZU5hTzdVWlhhN3hHTkNmVk5mcmpK?=
 =?utf-8?B?MVN0MkFXTk1jcVlHeVVDSXdscHZMZ1RWS1R3bGRmY3pwaXNINkthb1laWlZD?=
 =?utf-8?B?UTVURmZwU2tROVpOOENqV3E1bUJDWVJ1VEZKZGhaSWNWSUZab1FNZlRPbHpN?=
 =?utf-8?B?cGREajZVWlZtUFlldktNZFZhQkdXZStJN3NhbTRza0liWGQ2dkxtbGI5WkY4?=
 =?utf-8?B?NFc1Zks4Q3lya2laY3ZSUG5zQTBFUzRjZHVDcE9ucGNYREQ5VnU1bDlEWUlC?=
 =?utf-8?B?VVNGUkxONlJuelBJRS9nelhZS05ZdU5aMkNFTUVHa1JSd0J3UzJjVW1naXNy?=
 =?utf-8?B?dE1hbWNtSCtUZFplMHo0KzJEUHFPN1lQVFhWb216TEt5ZHhEMGJmTGE5ZEdm?=
 =?utf-8?B?L21CZ1FKYVFBREVueUJaejJvUWFvSE01SjFPQllVd3RRdVJZZW9kempGQlVl?=
 =?utf-8?B?ZDIwU3J4NlNYREIvTUtmWG5LMFluRlV4TnkxWDQxV1U0Q3pJaHNZQlZXT0Fh?=
 =?utf-8?B?blV3MXNuWjVoTlVKcjVreitteUZaLzdoV2RkYmlySldHQzZ2S2tOVXZmVUt1?=
 =?utf-8?B?WnJlSVQ4eC91ZVp1Vlp0U01QRDMrRG1tS1pOOU1TVFJET2tybHdJYnBHVmYw?=
 =?utf-8?B?RzF2ajNGOXNzcVhaeVlNNDZRQllsT29TaXhIaHNsZ3FrNWJxNC95WnZIQThp?=
 =?utf-8?B?YnczVGNXUHcrM1haVjZnenBkdUpFQmJ4bDhZdFhZRTltY3Y5Sk1IZElMRlgz?=
 =?utf-8?B?QlorMlNvcnk4a09ac3VSTVVTa1ZSbGo3a0dTMFN4RUg3SnBRSGJiRWd6UWFx?=
 =?utf-8?B?ZG40dFpYR0dnaXZpNjRMT09nMERoak5IRlhQbVJobmcvSTUxRURHNzlSMGJr?=
 =?utf-8?B?bE0vazAxVWNjSmM4VytzZmpUL3B4UEhnTVZPc0xwNS8zM2laTXdoV0p1OWVX?=
 =?utf-8?B?bUlwOG5rbDk2N25XNElHaUxkZ1ViSzl6MXNBZTQ1cWxheEQvR2RUd0Naa2tE?=
 =?utf-8?B?SlVJQXhHNTBNNy9tejUrd2ZFOWMrRGw2eS9pUVFtV0pEeWl4dWNUWTA4aVFY?=
 =?utf-8?B?OTVMS2k3cVRTNW1kdmgwVDdRUHE0blo4dTRUckVZRVJ1MHhURVZZN1NnbVB6?=
 =?utf-8?B?K29YaWUxTEpkcDMzQk1KVnY0bzJMOXZ6M2NMUkhVQjQvZ251M1hGbjgxakNO?=
 =?utf-8?B?d0hHRkplQmJRTVBNaEdOSDZoajFOT2llTzBJS01OeUJLT0J4TS9Va2FPL1ZY?=
 =?utf-8?B?SHVPaTdQbHZTakxkYzdCbHhTejMweDZ3MHhrMm9RbjA2bkJxZ3BZK0o5K051?=
 =?utf-8?B?VFBIWEdhMGl5eHZ4UGRZTTg2enZCNUFSTG05Mk9abnlGbUhVYy9KeEE2bDhZ?=
 =?utf-8?B?eHdMQ2FITVhqalowTjFqVmdpK3FNdmF0TC9ESUUrVGN0MUFjc0tIakZCQ2I0?=
 =?utf-8?B?ZzA5ZDZGZnFPV2dHcVZiTlJ2dUdZVmUyMDRKYXRhczNxTlBpZEptVlNhNzRw?=
 =?utf-8?B?SkJNWXVuMURkL013c2laMjhTb3FKcHhzbWVBMnhKR3ZKUEQrQWNRS0E2bnha?=
 =?utf-8?B?b3M4eTlOREowN2RkMzZqZWdpTGFJbXZJZE91Mno5UjM1U01qVThDQ094SVJP?=
 =?utf-8?B?M0NUY01iZS9acHNmamJYL2YwRkpPcEF2QkgzK0RCdWpqM3Z0aHF0TjZQeDBp?=
 =?utf-8?B?M3puZU9nQUZpelJoL0JIVmlocUl5bm1GT3gxOTNqSldyRlpqVmk1SnFCd3Vx?=
 =?utf-8?B?RWNiYzJvTWVoVFpFS3FCZ1pDTXJaVEM0d3NneHliNko0U1krRFFyLzQxMlhH?=
 =?utf-8?B?SFdnby9ZMkxYMnNrWmVlbVFQcDNZYnI0cmlPdmI1d0ljYm5oNVNxT2VBejNE?=
 =?utf-8?B?dzFXSVdKT240ZkJrTzRJQy85aURrditRZTZqV3J6YzlBRkxyMGhFVDFFSTNN?=
 =?utf-8?Q?LCrtgJK2DaTEM6WKZVyQtjqByElM/hYy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LytnNE5qV0dSN1o4ZkgvOThKemI1K000ZERUcjRsS1BqcDhYZVorVUtSRmpX?=
 =?utf-8?B?L1RXbW5BY3Nsc3lhZE5qTjF2MUZjVVV2V3UyY2tQa2JWWkExZ2FNM1p3Q2c5?=
 =?utf-8?B?eityRE9xWWpqTjZwZ0hpM2prWnNhMjB5VXlGMSs4UzlTTGM2R3NtMmZBcU9C?=
 =?utf-8?B?dGFXNkhKMk1NMUlqSWY1RTUyeDY4UjA4ZFhzcHhBRW84K1F5ZVRKd0tYQ2tN?=
 =?utf-8?B?dllDdXE5N0N6TGV0Tkc1bHk0Zy9GYnZMWjFDYWlhRTl1MFVwa3NQVnlNdXVK?=
 =?utf-8?B?NStIWllXOHRCSy9MOURMVWJCRnJZYUp5RnM5RWhyTzcraFVnSHhVZXJnZ1VO?=
 =?utf-8?B?d2JwWWNaOEJ1OWRGNVB5S2RyOE11RSsvVW1oNjJxU0ovUysvYTR6S1ZTbFdT?=
 =?utf-8?B?eW9kSXhueVhsRkFLQjRuTzg4aTZRYWlpa2NVV2pIb2phL2hGRVo4aFU1WDky?=
 =?utf-8?B?QXhCZWVzSWx2VTZCc0VxVnR6MGtVSFA2ZEMyUTN5Rmd0TXdsTXVTSk9LZUVG?=
 =?utf-8?B?M0w1U2pEenhmY1gzYlNhUmtvM2pJalp0azVId3FlQlNtaXFQTzZOSUtiWURT?=
 =?utf-8?B?NlNXaElQTnNCamFFeWpyaXBralpJb0ZOcVVycmpQbVpkUi9Ka211T00zWWFq?=
 =?utf-8?B?T3VrdHRHdSs4ekxyU1NKZ29GT2dmWGlnVnNRR3pZREc5eEVWeUlPNStqNFRj?=
 =?utf-8?B?UFd1cU9VYlRBZUkrS1dEeWx0WHR4cHN1UzZoYk12ZHcrTFBEY2Jwa2N0aEZY?=
 =?utf-8?B?d2RwWkYvR1ZVeEpLZTA3Z0c1c1FVVFYzN3BsdHRaVGxHZ09SdTEweEpkNlow?=
 =?utf-8?B?ZzFrU2Fyckkva0k3bDRueTRKblRwZGJlSERZUDNoaDlLY01EdTZJQlNYQmw4?=
 =?utf-8?B?aTdQNE5FT2hUQ0dJdm9QMnJTTnJUZElycDBVYnNEN2x4R0JJZnc1QTd1cWk2?=
 =?utf-8?B?enJEbHZ1MVh4UThoUFkvMXRGL0dHeks4RDJldzgxT3ZpZkhDMFZyT2xNSm94?=
 =?utf-8?B?NEhidG9zVEk3NUpoSnZJeUNJT0ljSDhDZmpwLzhiaW1WUkgvaWs1azBRcHZw?=
 =?utf-8?B?bnh0bkRoTFdmcGpjeHhWYmN3SGsyNjU4ekpkdXJoUmllMDlBSVQvaVpGdXls?=
 =?utf-8?B?UTlaaVZxd0Y5Z0ZrYitvSWUwMFp5QW9nTHdma05FaGNrb3JodzVMSDBTNW9G?=
 =?utf-8?B?RFFjMTJjRGVEWVVGTExsd3NtandUUnRRUW9JdHhIN2x4YitlMzVjdFVSbGYy?=
 =?utf-8?B?T0VHNEhhN0p0RGI4b1lBdG9jRWtCZ093a2dYVTArWEF0bnRmaTdZdjg4WE1R?=
 =?utf-8?B?T2JMbG8rVnhkc2ZnbWFkWXFvZHI3ckUvL1FUa2pKWTY2YVlzSE1lYnZpMXg5?=
 =?utf-8?B?aW5FamFpbDJoa2Rvc0V4UWoxanlPdlBaTHkwcllpMTVsZHNhOXVMR2ZzVm5k?=
 =?utf-8?B?bm51UnNlRmg4ekQ0RytzS2ZCSjZPZGtIUmxUUHdRMHBUbFNXeURzQzNPR1dL?=
 =?utf-8?B?VVZla2UyS0VqOXNWQXJ3VU5YeUtQb3JZdkVvUm5sbEJEd3dZSXRtTzlMK05p?=
 =?utf-8?B?VXZvazg2TGM3aFBIa2hsb0lSY2ZJVTJDb0RDcWI2azhaRGh6U3dNYUE1bWIy?=
 =?utf-8?B?UlRLNUVKVTZVQTlnWmdjc1pSZW1FSXJDc05MUTM5aGxvekRoY0FUN2V0Q3Va?=
 =?utf-8?B?aWRsNGhNV3c3dFROU2tyNHFFaktIZnNlODg5bC9xN1lKMUthdFBMcjU1Rmpn?=
 =?utf-8?B?ZnY1WXVZbUROa3VKZW93SkFUYmpWQnVGanEyTzZjcUxlaTIyeWVjU1VvZHpr?=
 =?utf-8?B?eTlTQnRJcTR0UjBFSVh6aVZMSWdXcjd0N1ZuUHIzd0FzWGgyTW9ZMVZkRGZU?=
 =?utf-8?B?UnJldXhEL25zSUpnRTY5L2J6SHVUb1Qyd25CYVpXQ3ppODNrQWljVldNVVMr?=
 =?utf-8?B?dkdaQjN1ZXdYNTh2cVBsaGdwankxb2FMYWoyREp5K29XWEdiRkpPTGRzWTFI?=
 =?utf-8?B?Wkt2N1lqLzBHTEtpSWZ6ellsM1dOZyt6NXlMUjM0bDZ6VkpVd2Uwd3k0ZWpK?=
 =?utf-8?B?elk3c0hkcVo3eHRqeEpoZThFRUFORWpGUjVvNkdETUdYM3pJdTNYbU8zTHhh?=
 =?utf-8?B?K2xza1RZeU5WdmlXdHI5VGU2dFAxL2hHQkpaK3BKa0xWR251R01xSTBuNUhT?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f78de789-76e3-4506-3999-08de32c14353
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 23:11:17.4286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kANUEhrV82+X0nnsGHHK7aGfeeBf+UXpT4Lfn4sNuADNoWLigIkK4a1SBIVkVpsUHVEexSTePslQdCtXKca2vr5gFEMLW20jpU3/R57Vec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4720
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

On Wed, Dec 03, 2025 at 10:53:55PM +0000, Xin Wang wrote:
> The existing "pat" debugfs node dumps the live PAT registers. Under
> SR-IOV the VF cannot touch those registers, so the file vanishes and
> users lose all PAT visibility. Add a VF-safe "pat_sw_config" entry to
> the VF-safe debugfs list. It prints the cached PAT table the driver
> programmed, rather than poking HW, so PF and VF instances present the
> same view.
> 
> This lets IGT and other tools query the PAT configuration without
> carrying platform-specific tables or mirroring kernel logic.
> 
> v2: (Jonathan)
> - Only append "(* = reserved entry)" to the PAT table header on Xe2+
>   platforms where it actually applies.
> - Deduplicate the PTA/ATS mode printing by introducing the small
>   drm_printf_pat_mode() helper macro.
> 
> v3: (Matt)
> - Print IDX[XE_CACHE_NONE_COMPRESSION] on every Xe2+ platform so the
>   dump always reflects the value the driver might use (even if it defaults
>   to 0) and future IP revisions don’t need extra condition tweaks.
> 
> v4:
> - Drop the drm_printf_pat_mode macro and introduce a real helper
>   xe2_pat_entry_dump(). (Jani)
> - Reuse the helper across all PTA/ATS/PAT dumps for xe2+ entries to keep
>   output format identical.
> 
> v5: (Matt)
> - Split the original patch into two: one for refactoring helpers, one for
>   the new debugfs entry.
> 
> CC: Jani Nikula <jani.nikula@intel.com>
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  1 +
>  drivers/gpu/drm/xe/xe_pat.c        | 59 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pat.h        |  1 +
>  3 files changed, 61 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 7c3de6539044..e4f38b5150fc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -209,6 +209,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>  	{ "default_lrc_vcs", .show = xe_gt_debugfs_show_with_rpm, .data = vcs_default_lrc },
>  	{ "default_lrc_vecs", .show = xe_gt_debugfs_show_with_rpm, .data = vecs_default_lrc },
>  	{ "hwconfig", .show = xe_gt_debugfs_show_with_rpm, .data = hwconfig },
> +	{ "pat_sw_config", .show = xe_gt_debugfs_simple_show, .data = xe_pat_dump_sw_config },
>  };
>  
>  /* everything else should be added here */
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index b8146724a60e..21f053c41899 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -581,3 +581,62 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
>  
>  	return xe->pat.ops->dump(gt, p);
>  }
> +
> +/**
> + * xe_pat_dump_sw_config() - Dump the software-configured GT PAT table into a drm printer.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	char label[PAT_LABEL_LEN];
> +
> +	if (!xe->pat.table || !xe->pat.n_entries)
> +		return -EOPNOTSUPP;
> +
> +	drm_printf(p, "PAT table:%s\n", GRAPHICS_VER(xe) >= 20 ? " (* = reserved entry)" : "");
> +	for (u32 i = 0; i < xe->pat.n_entries; i++) {
> +		u32 pat = xe->pat.table[i].value;
> +
> +		if (GRAPHICS_VER(xe) >= 20) {

I think we're missing a "GRAPHICS_VERx100(xe) == 3511" check at the top
of this ladder that would use the xe3p_xpc dumping function.

For consistency with xe_pat_init_early()'s logic, you might want to make
this condition "GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20" so
that both are using the same selection logic.


Matt

> +			xe_pat_index_label(label, sizeof(label), i);
> +			xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
> +		} else if (xe->info.platform == XE_METEORLAKE) {
> +			xelpg_pat_entry_dump(p, i, pat);
> +		} else if (xe->info.platform == XE_PVC) {
> +			xehpc_pat_entry_dump(p, i, pat);
> +		} else if (xe->info.platform == XE_DG2 || GRAPHICS_VERx100(xe) <= 1210) {
> +			xelp_pat_entry_dump(p, i, pat);
> +		} else {
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	if (xe->pat.pat_pta) {
> +		u32 pat = xe->pat.pat_pta->value;
> +
> +		drm_printf(p, "Page Table Access:\n");
> +		xe2_pat_entry_dump(p, "PTA_MODE", pat, false);
> +	}
> +
> +	if (xe->pat.pat_ats) {
> +		u32 pat = xe->pat.pat_ats->value;
> +
> +		drm_printf(p, "PCIe ATS/PASID:\n");
> +		xe2_pat_entry_dump(p, "PAT_ATS ", pat, false);
> +	}
> +
> +	drm_printf(p, "Cache Level:\n");
> +	drm_printf(p, "IDX[XE_CACHE_NONE] = %d\n", xe->pat.idx[XE_CACHE_NONE]);
> +	drm_printf(p, "IDX[XE_CACHE_WT] = %d\n", xe->pat.idx[XE_CACHE_WT]);
> +	drm_printf(p, "IDX[XE_CACHE_WB] = %d\n", xe->pat.idx[XE_CACHE_WB]);
> +	if (GRAPHICS_VER(xe) >= 20) {
> +		drm_printf(p, "IDX[XE_CACHE_NONE_COMPRESSION] = %d\n",
> +			   xe->pat.idx[XE_CACHE_NONE_COMPRESSION]);
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index b8559120989e..5749a488d9a9 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -49,6 +49,7 @@ void xe_pat_init_early(struct xe_device *xe);
>  void xe_pat_init(struct xe_gt *gt);
>  
>  int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
> +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p);
>  
>  /**
>   * xe_pat_index_get_coh_mode - Extract the coherency mode for the given
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
