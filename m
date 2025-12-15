Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E480AD5B17D
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 15:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A164F10E5EA;
	Mon, 15 Dec 2025 15:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJCdMu75";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5685410E5D1
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 15:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765811519; x=1797347519;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wjmh7DYvhjgahnz4AEs0tvFjdU+qAePY5/E69mZYm6I=;
 b=JJCdMu75fh/xKeAS4p0dQBF07Ys7ceG2JNWX36FemsvtQv+QTNjmy9/J
 IpVNvKwT/9BrDBFjqjJ1foX5ofYiEGZ04Npkl0+xLdqo+TvDQEtDXAbyA
 eMdN6ankgF7hqOgssxpRHLU5JaJcztNg8sey1K/T7bEx1uuOHSL10oI4w
 7uuTT4/YGIz4I6XiKBziiGokOSHBxNSay+Jw6mGKcdw6TtLy1vA/iBA2b
 eaRPsxKSIbHIvQOqdkl3FM4OObCMHCDrn7+H+lBRnU2TqZwkj1DummTa9
 mW7HyYfGVBsOvHPPI0hrPsV4+ODMaxnFt3BrG54zHfWP/dQ+7b6L+oQQ6 Q==;
X-CSE-ConnectionGUID: YTdFPpLbRvKws4siOFkwFQ==
X-CSE-MsgGUID: +f0utmWeS3OU67/eBW2j+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67652321"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67652321"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 07:11:59 -0800
X-CSE-ConnectionGUID: Ri0rtargTNy2F1ibk8WA1w==
X-CSE-MsgGUID: 8lwGUgcXR0CiO2teA6zPLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="201928467"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 07:11:59 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 07:11:57 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 07:11:57 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 07:11:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFH+9/spGdSE0W5gtIBtb4mmTgUZo1P29p+gDhJo77PYWcjLs1yOCvFqW+S7kqmp7Q90aX+wxHTNXahu1kSNct0XNJg96DLM4QskKI6QK56pP29hIdw3rO1dkGNseFpuXB755LoEcCm2boHjam+JzG2himC8Dy8H5J+nM+o6JR0jSLAmhcxlfAwz9wKhyPOkXNsaDAiq1StUaQup2A+0vfePfYo462hthJWdOqJHiNJUY8Ili7QhOqvhXPMQNKoOYpp6MOHGneX1rhvWrhtuq6jKCg8k5FjcNWXVQxYIBVkX9s5N/ZHBtHcbQ1/Fm2Sr9YQS7bbV+9xCfxjMQ0tCEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wjmh7DYvhjgahnz4AEs0tvFjdU+qAePY5/E69mZYm6I=;
 b=mtEmW1F+wbvp6aGHZWw0QC9Lmu+MsCMLsDM8EBi1KiSbnHkpbxD+XpEJqISBQNwMeH9rBmCcEcKoSMdMWDQ+KXvUgi8fx2mmEIScjwhFNcozQWamgV/hqcoisNgOOZaEcZEPgkjkOiylB5ag/cBRusP5xn4wMFP9uiUcCF+MD4rF1i9C6XQurLQOrb2YAYpbSbyZbrlTgSTkaIOZC0ZyFvoGQSXqZpBmdNSm4npNq/75/Kp44wvyClFi3gJP1OFufE/zE5I86ZUAgSTSso5WNKOE10qFzOsSeqEKwYgrs6X81NI9QryT6Iw5zwsaVV9V5t9gizysPzevB1Pk7uk5Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SJ0PR11MB4973.namprd11.prod.outlook.com (2603:10b6:a03:2de::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:11:55 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%5]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 15:11:54 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Abliyev, Reuven"
 <reuven.abliyev@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/nvm: enable cri platform
Thread-Topic: [PATCH] drm/xe/nvm: enable cri platform
Thread-Index: AQHcbcUvAiV40f437EyxJxK1gQfCHbUiuwGAgAATNBA=
Date: Mon, 15 Dec 2025 15:11:54 +0000
Message-ID: <CY5PR11MB636602B9B547F832F8E1B084EDADA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20251215125928.1931951-1-alexander.usyskin@intel.com>
 <aUAUqTdroGS2L4gi@black.igk.intel.com>
In-Reply-To: <aUAUqTdroGS2L4gi@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SJ0PR11MB4973:EE_
x-ms-office365-filtering-correlation-id: 91fd6a83-5684-4a4e-c938-08de3bec4848
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?L0s3TW5RVjZVS3pzSkltL1RhaGtqZWxIRU9mYnhla04yV2dnRFR4dkJLVjlN?=
 =?utf-8?B?bVJ6cmZIMEt1eVorTm5XRzltNmZkUUMwZ01LdjBqVytsQjN4eElzZVI3R0JL?=
 =?utf-8?B?ZUxsbm9oWmI5WmVRczU5Y3RVZGJtRG5rNEx2U3lhd2ZuNk81SHMxK0U5M1V6?=
 =?utf-8?B?NTFyNE4zYnRsRkJHNUV2OE5DSW14enpkSDY4S1F0cFlhb21VTWVidVZVSVly?=
 =?utf-8?B?KzlKRDB6MU00UXdXUENpVnNpYlI2MDltcDQ3SGhVNlNMRDVXaGdqMCtIdVNu?=
 =?utf-8?B?S0FkT2tuN2pyRzE4R3ArZ25YU0xiOWJKRWFZTVp5ejk1dEF2a0pwVEdQVVlB?=
 =?utf-8?B?WjNYbVVOY2taNDZ3RWVKNmR5c1FEeEFEZWlTUXlxR1hxOGtzVFJyVGczaU5o?=
 =?utf-8?B?UGNIWjh4dzhPUVU0UTZNczNtSldtZnhkV01OYWNtaVV3dUh4VzduYzFwRUVB?=
 =?utf-8?B?LytyM2Y5dUFEVHk1cGJDYmtyYnloWE0rcDdlN00vR3hicjNwQmsxQkJsNlUz?=
 =?utf-8?B?TEZJSzQ0NXhLNjVRczk0TmJSUWoxSGZqTGFwME5xZzZtMndqMlJyR2llQlNM?=
 =?utf-8?B?TVRvT3dXVkxOS1lnOWNjWFlsaDV4dWJ1bUZueW8xVTRxTU9XeGZubEJNamxZ?=
 =?utf-8?B?enZVcHFoY0FGSTByN3FYdlVTNSt6a1BuQmw4MGhIOTBvVGRITTIyNS9PMm8z?=
 =?utf-8?B?M3ZVL3ZyODBuTXgwNkd5ZEZOeGZ0TWFjc3RwbWJFMENkQXB1Wnp1OWY5Tnhl?=
 =?utf-8?B?b3V1MzAvU1pDSDFTTHlZSCtWY0czTkVTbHprQ0FLTStHLzFUdHNYUE8rQkM0?=
 =?utf-8?B?Zit0QXdmbjliSjBLdkFLZW1XcHl0UUtKbjR5U3UrMWVWUEVDcmt1UURqaVQr?=
 =?utf-8?B?bWZ1K2lHS3hpeVBYeWhLa1N4MjhSUHZoNHg3emZVTy9PTys0MTdYOU9YVWJv?=
 =?utf-8?B?Q0dPYVF0UERRRGdXUFl2aUtrT1pVL2lpekgxOTZja2ZKdWxpU0p4RURuSTZG?=
 =?utf-8?B?ZGpoYWVkVGcxZW5CMDB5enJYVTNJd3Bxc1ZITU8xa3V1dUUxUDZueDV1aXBG?=
 =?utf-8?B?SFhIUDZGK1VXQ3BxT0NoRWJFU2o0cGZaQjB4VXpxc09rUjhXYi9DSDQxMmx5?=
 =?utf-8?B?T09XQ1MybUVJaTdrWEtOcTExTTRxTUplb054YmViWmVlMlBFS2hSQ2FHYVpQ?=
 =?utf-8?B?SWRNdGhMT015TUdENGJ4cC9sdGIvcHJmd2IvTU1LbkNIemJIUWZoc3hQM0xI?=
 =?utf-8?B?eUdGcnZ6ejJIS1M4L1VWQXc5NVkwQ2NwSittQlZQeWpqRkVKZzR0Vlo1ait3?=
 =?utf-8?B?Vkd0UkN5YnNiWGpQSVVLZjBKSjVzM0NwTTN5OGxWMnhnL09lT1dIbzREejdq?=
 =?utf-8?B?Ky9zUkJuUkUyaU9VRzFRNzRRL2dmYmF4TG92TjVCdFdoUVlQWk5hVlN0WEEy?=
 =?utf-8?B?TFpUQWQvS05UYjZmUlJNa0g0V0Y0U2ZrQmpOOWFSbDlRa1lOL3QyUzNaUnZw?=
 =?utf-8?B?NXRybXpFZ0FuK0lvejU2SlZRb2FTSk11elBKRFhCVDExVzZrZ01TWER4SUd1?=
 =?utf-8?B?eG9UOHQ2SDQ2THI4ZXY0YnYvRzFDN2NIM1hhOWE3WjVsT3pmZEN1WVJ0d0tK?=
 =?utf-8?B?c1dDa21KcUZiNWJZN0RhSkRsQU91QmQ1Y1dPOUVhV3JoSldQRjhhV2tMZVBW?=
 =?utf-8?B?YittS2xyS1lwSjIvSTYrbWV4YXJxYjhjdjZmZ3lpdmM0Mnp4Q2xRS0drdU5s?=
 =?utf-8?B?OGNYMC9LNHlDcyt0eGJrVWt6YXFpZmFvb2QyLzF0LzgwbE9qM01WVlNGTTRy?=
 =?utf-8?B?b29CNkpEdWlQaG5pbmFCMDdqQ1YwM1ZuUE1vaVpscHE1RHRsTUxYNUk1R2E0?=
 =?utf-8?B?YzZXSVhrYmM2ZUdDTWZNZkdQN1ZTeGVWK0s2ZzlmT2V3RjBndEY4cVRIZHZJ?=
 =?utf-8?B?cEhMRjdNSHljbkxZOTVCVm11OG0xdjV0YzlTcnNpQWc4MmRGSjJOR2JRMnp2?=
 =?utf-8?B?L1d3dWVabmFjd21wSElDTHVzSnl1TlpseFNFMndjeUhFSnNZK1lhZlIvYjlT?=
 =?utf-8?Q?hd9hem?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTh5YUpRVUVPUVB3ZnN1RndNZG9yeDE1YjBHeS9iby9CM2VDZ3dOeGoyUVha?=
 =?utf-8?B?aG11U2dmaUUwOWg2Qjh5TkR6QWdmOE03anovK3BXTStMelNkblVXM0NFejhU?=
 =?utf-8?B?U3B0SWUwdWZ6NlNVeWFIYmRYYWJ0YmhYWGkwSWp4RjJjUkwvQnpiS1hyNHVz?=
 =?utf-8?B?Q0tyUTAvK2hOdVdINElnVHlSNldETXhGZWhzQk5zMEpkQkdObTYyRmtTNStN?=
 =?utf-8?B?MlMvb0xLamR5OEV5TGs2b0Q5RFVVOC9PS1Uvek1HM0dvVGl6b3dIUTdnYnox?=
 =?utf-8?B?UWRtQnBhellFQkNQQzV5VzZ1YU9hVm9Cd25HVTB6SjQzTURObHpzRHM1cG15?=
 =?utf-8?B?cUovZFFGS2lOTi8wbU4xTEpQeTgwcGo2eWpaREZManRXZDdTTlQyQXJ1NmxV?=
 =?utf-8?B?dXFROTQ5eWMzTkFqbXBIcUxheW13Rjgyb3l4all0ZFk0dHp1K3hpYTZEMzFH?=
 =?utf-8?B?UFRtbmFOZ09GK2h6WGMzOU9ocEpIOEtqNjJjeWlPSjJEWTE1Y2NZNTVKK3NQ?=
 =?utf-8?B?bTVSV1JHaFRzYmxweXR3WkprdDc0elFTRnFQNnlLWjlTaXpvNEJzK3BscVl5?=
 =?utf-8?B?RExQUDlUV0V2OWdxZkE2SGpUVXNwVDJqSFM2Tm9WNTk0WnFISk9vbTZMZkty?=
 =?utf-8?B?ZXpVM3NIOUo4cTA5a2pzZ0YwS3dWZzl2R1BQYVdETmJJT1FsR09QYjNTcWZQ?=
 =?utf-8?B?d0oxeERzaEQyVzlvNHpzbE5oZnk2WkszWjZBVXU0L25lZEIxa2dFSjl2SU5v?=
 =?utf-8?B?cFlxU0k1NFBNWnpaRmZDZTk1d1k0dGxHU05XbjQ5UXhYS2pBQ2VHaGxXeE9l?=
 =?utf-8?B?YldMVHVSSFViYVZXSndRZEh6VUQzR3p5ZkVVL1oxcUVHcWJ6MHBaNE9ZOThG?=
 =?utf-8?B?UDM2Vkp5ajNlQ20yVC81SUZUbFNsVS9pb0YydlIvUWhIQ1l5M3pCOWVxaXkz?=
 =?utf-8?B?UVlGUXJ0NnEwbzYwUjVZNGFOMkF3Y1h2V3MyRURDRDZWMGpqaXBHMTk1Z2E5?=
 =?utf-8?B?ZlQ2WENramU5U2ZoejN5NUlNOFh4eFVPWXFneEozREppR3F6bEliZW0zaDRF?=
 =?utf-8?B?cUwyT2FwYVBlRGFpNFZPODM5aGh5WHVYbU9YbUJnVlZVcUFxZXNXZXF0clNa?=
 =?utf-8?B?V05qZ0pkN1lzWm43bUdjNThVNVFBUjZDY05oTjE1MjNqb1hRaVJ1V3Nkelhu?=
 =?utf-8?B?SXN4NnorQmxlRDUyQUxob1AzTzFkZlpIM1ZEUE1FUUFRelllVzdCT0hWL2NS?=
 =?utf-8?B?M3R5bGhKSFFDOElDWk1YOGlZb1l6OXdVM3RMTWp2Z3NzbEM2bGpRKzI3bWV4?=
 =?utf-8?B?OG9Sb2xtY25lUnhwNlpyZU91bHF2OE9IcXVBRHpoVHlLelJxOEQ1SkhvaUlp?=
 =?utf-8?B?d2VJMGNXWmxTb1B4U01mME9QQjhzMmpQYnQ0NzFETTgrellQK2lQTjhWbXRK?=
 =?utf-8?B?aG1PdEFhb3VaN1Jid1NjbnJYVGZ0NWc2TXBDcGFuWlpSTkNheXFYU1gvTmls?=
 =?utf-8?B?TzF2NVM4UDU2M0NwcXJBTFFWeWFzQlVnamZWM2Q2RTZtRGRHdEFwdW45VUpK?=
 =?utf-8?B?VXB1emRHYW5tZU1MeVA2Yk9lQytHc01BMWh2WWpXMVZ3c2U4bGtybWpDbDBi?=
 =?utf-8?B?c2FjK1FZWVpET2swSk9JeUNDd3lxWERBSkVLTE5VcUlsSHFMbFJaOEloRU9u?=
 =?utf-8?B?aXdsbmhDU2tJU1dEU1NqVHRQaS80K0VFWEhkSThyeUFNNVR0NWZJMmhoVGNx?=
 =?utf-8?B?Mk9qbDJzWkx2NWkzNWtDMUoveTNjbjAzTjVXdis3Q1FBTm5EYlFUZktMb0pn?=
 =?utf-8?B?UHJJdUYzR1p6azFmMjNZdmJ1bS8xVFA0c2wyTWthLzVhVVpkZDV2M0JqM1k1?=
 =?utf-8?B?eFI5ZzFEQ2w0NnQ5OEhPbkJrN0pGSFYxT2dQN2RYdDlQZ3pEWFgybmNtL2kx?=
 =?utf-8?B?NTZ3ZjdDNzFtYzhvK2U0ZWxrSTlFZ0Z2SmJwWVJVcEhuZDc4RkhwY2FXSEIy?=
 =?utf-8?B?cjc5ZDNOYWVwYWpxdTZBaVZZOUVzdlRhWi9nNng0MU1hTFRuSG1tNXJmeTF5?=
 =?utf-8?B?Y2NDcmdCSnAwV2hpRURMcDEvYkhWdUFJVU91OUZ3MkpNU21adE85RFlKRldZ?=
 =?utf-8?B?cENTaU5KVXpTLytiUUdPdGp6MFhVTml2ZTV2ZzNBT2srcDl4cFdudWRPZmNI?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fd6a83-5684-4a4e-c938-08de3bec4848
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2025 15:11:54.3932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ExtMtIO7zoe9/NSxGgwXCW7Ea6dOUcOV8Zhd3ZBL6Sgptkemyy62L8oME+xOh4yjOIUsqXyEbc7iz1j/qkgxIAMBuvxtcaEEmkEEPxr00bE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4973
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

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0veGUvbnZtOiBlbmFibGUgY3JpIHBsYXRmb3JtDQo+
IA0KPiBPbiBNb24sIERlYyAxNSwgMjAyNSBhdCAwMjo1OToyOFBNICswMjAwLCBBbGV4YW5kZXIg
VXN5c2tpbiB3cm90ZToNCj4gPiBNYXJrIENSSSBhcyBvbmUgdGhhdCBoYXZlIENTQyBOVk0gZGV2
aWNlLg0KPiA+IFVwZGF0ZSB0aGUgd3JpdGFibGUgb3ZlcnJpZGUgZmxvdyB0byB0YWtlIHRoZQ0K
PiA+IGluZm9ybWF0aW9uIGZyb20gc3Vydml2YWJpbGl0eSByZWdpc3RlciBmb3IgQ1JJLg0KPiAN
Cj4gUXVpdGUgYSBiaXQgb2YgdHJhaWxpbmcgc3BhY2UsIHBsZWFzZSB1c2UgaXQuDQo+IA0KT2ss
IHdpbGwgcmVmb3JtYXQNCg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBVc3lza2luIDxh
bGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9udm0uYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0NCj4g
LQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMgfCAgMSArDQo+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX252bS5jIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX252bS5jDQo+ID4gaW5kZXggMzNmNGFjODJmYzgwLi44N2I3YjAxMjBmN2MgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX252bS5jDQo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX252bS5jDQo+ID4gQEAgLTEwLDYgKzEwLDcgQEANCj4gPiAgI2luY2x1ZGUg
InhlX2RldmljZV90eXBlcy5oIg0KPiA+ICAjaW5jbHVkZSAieGVfbW1pby5oIg0KPiA+ICAjaW5j
bHVkZSAieGVfbnZtLmgiDQo+ID4gKyNpbmNsdWRlICJ4ZV9wY29kZV9hcGkuaCINCj4gPiAgI2lu
Y2x1ZGUgInJlZ3MveGVfZ3NjX3JlZ3MuaCINCj4gPiAgI2luY2x1ZGUgInhlX3NyaW92LmgiDQo+
ID4NCj4gPiBAQCAtNDUsMzkgKzQ2LDUxIEBAIHN0YXRpYyBib29sIHhlX252bV9ub25fcG9zdGVk
X2VyYXNlKHN0cnVjdA0KPiB4ZV9kZXZpY2UgKnhlKQ0KPiA+ICB7DQo+ID4gIAlzdHJ1Y3QgeGVf
bW1pbyAqbW1pbyA9IHhlX3Jvb3RfdGlsZV9tbWlvKHhlKTsNCj4gPg0KPiA+IC0JaWYgKHhlLT5p
bmZvLnBsYXRmb3JtICE9IFhFX0JBVFRMRU1BR0UpDQo+ID4gKwlzd2l0Y2ggKHhlLT5pbmZvLnBs
YXRmb3JtKSB7DQo+ID4gKwljYXNlIFhFX0NSRVNDRU5USVNMQU5EOg0KPiA+ICsJCWZhbGx0aHJv
dWdoOw0KPiANCj4gSXMgc3RhbmRhbG9uZSBmYWxsdGhyb3VnaCBhIHRoaW5nPw0KPiANCj4gUmFh
Zw0KPiANCg0KSSBzZWUgaXQgaW4gc29tZSBrZXJuZWwgZHJpdmVycyBhbmQgY2hlY2twYXRjaCBq
dW1wcyBvbiAvKiBmYWxsdGhyb3VnaCAqLyBjb21tZW50Lg0KSXMgaXQgZGlzY291cmFnZWQ/DQoN
Ci0gLSANClRoYW5rcywNClNhc2hhDQoNCg==
