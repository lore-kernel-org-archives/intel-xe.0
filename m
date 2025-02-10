Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4DDC02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 08:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5123610E4C5;
	Mon, 10 Feb 2025 08:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWnkfnIR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA01910E4C4
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 08:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739175497; x=1770711497;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=k6s1mJiDJIoEPzU6f8HLG/P3oX09/ZQwBD2RG5NzlKI=;
 b=ZWnkfnIRs7Px3d4p+8b13H8NP2ItLF31d0X0rMwdQ/CH0kaEUXnXVMzz
 yUNx2Urg63ahlZ54bhHslY6GB615Z5xufmsjkTRTMuVt69kqJadUU/hPD
 s0NyI0KGrPEO7jKje52+5zIfzk5flgGLJ3VjyLg2AoLys4xfXHKJQLHvp
 pNlMs9HaE6PdhkObR96C4LeN3P3vMhKcv6NxczbtHoEngSrv3aFgUwKiI
 NEQ2Qi/Vyc8uBMi6cWmBz0PJ9sd2rj/d7pCW4QiGFG2ywcBz+aZPg+DuZ
 5hZmxQwa67HjoiHnol3iNYYIdGr2eTZQjvshRGeA7S7iWC98OaumI/imt Q==;
X-CSE-ConnectionGUID: 9/JNAX2DRh+CRfLR8Lh/uA==
X-CSE-MsgGUID: lrQfYwb1Q4uTspkdaEUiyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="51136515"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="51136515"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 00:15:59 -0800
X-CSE-ConnectionGUID: RrA/eXoHQteJfBTGGTSe/g==
X-CSE-MsgGUID: o3A9xHd2Ry6hviSF+Mg+Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111956236"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 00:16:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 00:15:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 00:15:58 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 00:15:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwjErTHnNVPpVuahJILs5kEp96vozhKNabR/H6nxUa/5hD5/JfMUiC6PFDZsROsomlKIjw/7h9q+DIVvbpQ3tdd5HFyUrCkGNXXqyX3Yh30ZLX/pquvd5UlvEL1gWW+tmP0oTIs6InDApP/feD141YIV+kTqKCAZWlKwEb6LXgi1XXyz1jMEOVOUeFboAGpQdaX6Vj3fb8I83thWbIL72wmFa4RSFiDBgdAGuFtQykncfo+wTcAFyfFgk/ayHIscDvpCnHXY51LBswWDlKCu2gmYvF0/3w61dLjDAgTLSXe3EVNYMMOn2H1c/4pKubB1rabyC8HbzdJVmmjzl+v17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwheR+sfTV3at7pyoasTiKOUxB3B+u/rKNTEmPM/Apg=;
 b=KWYWT+ItH/BXWR8RxdBzeS29a62Ho0DxVv2EAtEGyKPvWq8YQMPXdrOETCE9KVqPCCIv7hLcTe1kmarP+ap9nkk51c8504SYMppBSKYViJr/lnHLM8U9C9ElVoeihl4LplPeMNGcyqLAanYNl13WED9O9GPvz1k2zb1H+RiJ8/Cs6WC0FrXVzKgxIy6nfNLxhRqdzhcO9ySNQvcGp5tHP7FbZRrQE68Zp4FPtKL5ofy6ZFFlXlws6ybUb7siJ/VOukPPxq0KL5R6FXDT/v6NPhPZooeXeQxWua7DjFTXm+wkSd7D1X2eM3vJI3bp0xr5jfwQU1nGMzEyVtVbG4LwBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 08:15:38 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 08:15:38 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v3 2/2] drm/xe: Move VRAM manager to struct xe_vram_region
Date: Mon, 10 Feb 2025 09:15:11 +0100
Message-ID: <20250210081511.906452-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210081511.906452-1-piotr.piorkowski@intel.com>
References: <20250210081511.906452-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0017.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::27) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM6PR11MB4595:EE_
X-MS-Office365-Filtering-Correlation-Id: fa8e3c9f-c2f0-4337-b584-08dd49ab1a1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VU1JdTZuNzd6YTBqQXVTL1A3anAzMHpEb2tza0c1M0VZYUlIOTZmQ3NXd29t?=
 =?utf-8?B?QkVZVUsvK0V4ZlJCN2NBbzg0RkJLNklBVHk4Qm5XbHo5Q3BmOWZrVU10cFg0?=
 =?utf-8?B?R01NNUYvUHFTUU4rSlJXcmZ1c0tPZDMzRkRaS1JhNEVWUFFIRkEyMTdwb0lN?=
 =?utf-8?B?bHByRjZWVG5DOXFDMzIwQno4Uk9oeGgrYmFTN01GUVR4d0FZYTVHNERGZ1pI?=
 =?utf-8?B?eENqc3gxaCtjZUpxOEtla2JPZkh5V0I0MVNHK0FkR3RoUFJuM3RiMFN2SDJu?=
 =?utf-8?B?RG41N1pFT0ZUNnJxWjRNbFNmRXJURTFOU2I2MnorNWQ3aEVDeHlzYS9TbW9Q?=
 =?utf-8?B?RlB2bEcrRENTQ2dBZU9nZEExSWpOMUdaQjVmN2RKOEtLeGlLV3UxL3ppZWd3?=
 =?utf-8?B?RGhBT1BGSi9KaldhOWlNZlp6ZGVvWjl2K3poc29PYUlCdGJ3NWVYNVM4a1Vq?=
 =?utf-8?B?enh2a2UxQzd1d3dEUFhxRnFoS25SckN2c013YkhZMFJCV2dWN0YxMFQxem1W?=
 =?utf-8?B?bjVYdkhod1Z5cjhjVUxxeU93dmN2TGhJTS9MeXN5YmFEOXJDTUFmZG9JTEdP?=
 =?utf-8?B?QWZGU0NYMUhyeFd3VUl6VkE1azFDQ0pLMTlRUW81SXF4UUVvR3NicmRIZWNE?=
 =?utf-8?B?UWJXdlNCNlFhN3QrL0ZSRXZXWE5MUWZTYkdoVGlmTjJMWmEzRVVDOENMUGJy?=
 =?utf-8?B?aW4wR1p3UFhyM2V1YXlBQVhUbi9sK1B5NzVHRXg0bTl2T3R6eVJORXA0ZlRN?=
 =?utf-8?B?NUdIR09MenJkRTdTTkdyU3ZwWVVwNzRHRVJFbDBialRtYUVad3JFUjdDRXZh?=
 =?utf-8?B?U2dOV2dURmJwWVBXRkdNVThMNGRUR2JENTdqY1hsL2hoNVJsbUFDUk10OHdT?=
 =?utf-8?B?TVJ4dm5vMlRqVmk5c0RCbVNmQlFxNm5JOHZyWVFnQmY3R2pNR0dHQWlVTklv?=
 =?utf-8?B?RVhZaHg5MmpKSEFKQXpkOTJnMGlqU3B1RDNQNC9YTWIxY0RPZVREU1hQYk1r?=
 =?utf-8?B?L0ptNmJEK1Q4MkhNVjVXRkVKSGdpa01TNy9pKzdQNjRzdXlpbUx0R0RvMjFH?=
 =?utf-8?B?c2lyY0xjdUk0ZElvUmtyVGxVNVhzU3UvVHE2cU9ONzNkeHZ2b0drWWZ6TzlF?=
 =?utf-8?B?NjNsTktSWWp0bFZ0dGNGY0tpdGZtdklaRlJSSUI0WDF5NFZIUHIvYll3U2NM?=
 =?utf-8?B?Z3E1L05SVjR1azY5T1VBeUVvaktYTytEVkhKRkU4ZUR4elpySjZJUEtzQTEx?=
 =?utf-8?B?ajZtUlJzOXJYblhnQk9GUzNwbUUrUDM2Kzl0NHlhUUx4ZXpXeDNuNURNelVk?=
 =?utf-8?B?T2hCYjd6ZGthbzlZVERIYnhHOXNMa09maE90RUlidFpvcllUWkFMTUgvc0xC?=
 =?utf-8?B?VTJOUFhZZlU0QzFpVWV3UTFRSGxRRkJFeUpNZVpscUNvTThNR2YvSVU2RUxj?=
 =?utf-8?B?dlNkK2gzWnpLdFE5VExPaW1BVG9peDIyMkIxOVUvNUJTenRiTVk4aUMzRFBW?=
 =?utf-8?B?L0d4U3lDUXlVMTJlL1orTkRERXRTTmh0QnZOckwyNGprbS9zQ3cwRzAvOFJi?=
 =?utf-8?B?YThGYUp5dXVnS2U4ZGtDWEdoQ0lRQzY0MDM1N1ZKTER1MDlDU25pQVdLMTh1?=
 =?utf-8?B?Y3JTdmhvaXhZYStPY05jdnJXZlR2cUlMczhUOTJzZ2ZkcGxMaWdCOUthNnY0?=
 =?utf-8?B?L3ZTbWtJbm52YWo4WTBqL3lPL25KYUMrUU5RdFVCNWZSa3liVnVSZ1RKaFRn?=
 =?utf-8?B?VGpsaFg5bVVGcjBZaGtabUw3VVNKSm5PR3dzbXkrbWpvc3lMVFdqZ1E0L1hr?=
 =?utf-8?B?NGRhTHVwVU03RE8zYU1hTUxVS3hiT3JURUhXVUg2b0FGdW5nTEtuWUJRYm1Z?=
 =?utf-8?Q?8+6f4h6pPH0+N?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGRMRVg5RTlDakg0STlaeS9rZThoL2JuRGRnVER6amhkRWtrbE5WeWIrd3k2?=
 =?utf-8?B?Zk1WQ0lYUlNsN2VmeDRWVWxpWGxYZklMZnB2UHoyM1FTSDVZbk1KM0pobnI3?=
 =?utf-8?B?Yk9UUkIwajA1Z1lNa2dKL2RLUXNQaWplWTdHbGRWUGozdFJUTVBDZFFkOTJj?=
 =?utf-8?B?SjBvSWhGc0I1Z1pYaDNZQmJvdlNoMW41dmJMaWZKMm84dU5Rd1M1NGhWN00w?=
 =?utf-8?B?U3FOakdNeW92R0dEejFJdkowdjZpNFp4VVlrUTJCaCtaNENPRUNGSTRPdG9n?=
 =?utf-8?B?azlwN0V1UklqV3NUdlBQbFJibWpabG9PZ2Z5U2FJajRTTC9nM2J0alh6WHB1?=
 =?utf-8?B?S2x6T2RKR2tLMzBiUHo0b3dGa3h3cDAvd28yaytESndJUGE1WGEvMGo5YXc5?=
 =?utf-8?B?VitPMlM2bnE3SUNEdmxBNXI0clB3czVyT2ZmZnlCMnJUZU9xaWo3YTJLUGd5?=
 =?utf-8?B?NVNZQzN2MUZ1L3grZUM5YWtwa3hpdHRIZkNiODg2SHRYQzN3Ykw1WUZkRVNJ?=
 =?utf-8?B?SlhEcGFsSXlaRDdZekxOS1N4N0l4R1hnZnNVYzRqUzVuM1g1VjgzUmh4bWZn?=
 =?utf-8?B?ZVZYc2VZb1I2cGFGRGVranV2dGNnVkd3TGNhU2xVV2pkZUVvQWh0NDRnTDFV?=
 =?utf-8?B?ZlNzMnJIVm51alVURk5oK2FGYjRodjZIMnZVZFpVZUlPSDR5YkxMUjBoNUsw?=
 =?utf-8?B?cVMvN3NGTDRwTk1XdWZ6Yks3VEpmNnljVUpMOW9YWmpMbVFFTnpaazRtc25p?=
 =?utf-8?B?eEpRZXB6bzVqUmRwbEFiT1lBaFY1cndra0xpeWxJSVZEREwvSm8zbzNaK1Jv?=
 =?utf-8?B?TlA5OUV6V1dJRFJLTGFDUS8wa3AvOFlUcXR1L21EaHVYdFBBNFc2STdSTHNj?=
 =?utf-8?B?Sm1kemxZWFMyZFVCeUo0a2JiczNySkFtVU9KbFJXbTRWZ0hraXk3ZWg1Q0d2?=
 =?utf-8?B?a2NZSktCNEZDeUQxTTdSRG16Yk1ieVhxVVorSEpGdGxoQTlYdTVSbjc4OWk0?=
 =?utf-8?B?MlF4TnNFUWNwbURuZ3J4cU5yV095b3pCU3RtZ09VNzRTaWNZWmluODM3eHBz?=
 =?utf-8?B?eUVmQmdRRDQ4aFpjM0dGZ0pVRmNKSDgyTElnWi84L3RGZG9JSWZ2NHkyays5?=
 =?utf-8?B?QXcwb3o3OTVxM2tWQmcyaUY5c3dOODJKelFpNGVhKys1bENGdnJmK0pWRGdw?=
 =?utf-8?B?L2x0U3N3cUR3MnNkYzNsMXJHclZ4Wjh5MjBFSzVoRzIvR1M0Z2ZuU20vNWZD?=
 =?utf-8?B?WkE0Z2dDaDB4OTZoMVAxTXY0NUtWNy9ZalFaT2lmcEtGYjdJQUMzcDlVVnpn?=
 =?utf-8?B?bXhjSEpPS2laVitXbHpFWk0vWjNXYWpLaGZCTlVHV3ROVFdqV3BiTko0Nksw?=
 =?utf-8?B?K1ZIc2NxeXV2RzhpbEtjY1J2L2VMOVVMWVdnR1Q5dmpjbXI0S1ZyMndDQUdR?=
 =?utf-8?B?QVV2OWxhRGZsMndPbmZyZURXRm51dlFyWXpsNXFmcms5U2VONXY2eXoxVjFV?=
 =?utf-8?B?a3dnUUlVTWlxcXc0bWZMWG4xUGZhSHlhQ25KMG00S0FOalBaOG4rRnNPWkdy?=
 =?utf-8?B?VjFTNVhZSzFPRGlJRTgzMmhRZ05hdnhsbk0welBuZ3RVaThmdk5RQ3BCTGxW?=
 =?utf-8?B?TlNScU9TNXBtN3RLNFdUL0hpV0hKcWxFMlFOajhLbEc4cUtNeG44V1Q2V2tW?=
 =?utf-8?B?Wm9GS1dud0JuZjBSWTJ1bmk1WWxEdTZ1Mi9idWhDRzF6ZytMREN0ZkpwRTNs?=
 =?utf-8?B?Ri92TVZaUE1YZEtBN1NpeTRTQTA4WmhDMHZJYm1FOXNHWUk0UVd4b2FWQXd4?=
 =?utf-8?B?ZmtkVXRqdk9NVUdaUzdrN1IwSUkrMHNWZXZHRUVCT3FpckZkZzdIYmh2dWFT?=
 =?utf-8?B?MmRkR3VuUkJJTmVxK3VTY2Y3WHU4N0o3OTFmVk15dU5EOCtkUERRTklpVDBZ?=
 =?utf-8?B?aktoQ29JdVE0dGh0SXhWRXBtZHNmaXo2ODFha2RKTDZRdE9VbUIvWUUvaTNU?=
 =?utf-8?B?ck45QXJDb2IwWklVbllDTGJRenZsZGxhb3dXZE1jNjZiSTliYkxmaXJaMk5l?=
 =?utf-8?B?bHY2clFOZmdhOWQ4TVhhV0haL2ZNalZuNkhsRGEvR1B4bklOYi9pQmNTTVlO?=
 =?utf-8?B?S1FEaEF2Q2RwWW1BdUZqdnVReUlUR1JzY05JWHJsbkdQY040L01jRUg5UG8y?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8e3c9f-c2f0-4337-b584-08dd49ab1a1c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 08:15:38.3583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6Bpm3Ww9qcRnM9QX7TQQelXI41un2PY2xCPnQPwWxUa7/Okomo4ZjFj/fNT9wtlqVbnGQXA3wLgRSGc1Gt7G71t1mjghJ2CQW+DMcJuw7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

VRAM manager is related directly to struct xe_vram_region so it
should be inside this structure.
Let's move the VRAM to struct xe_vram_region.

v2:
 - remove xe_vram_region pointer from xe_ttm_vram_mgr
 - stop use dynamic alloaction for xe_ttm_vram_mgr in xe_vram_region
 - rename struct xe_ttm_vram_mgr vram_mgr to ttm
v3:
 - fix "'ttm' not described in 'xe_vram_region'"

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c                 | 10 ++++++++--
 drivers/gpu/drm/xe/xe_device_types.h       |  6 +++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  2 +-
 drivers/gpu/drm/xe/xe_tile.c               |  6 +-----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |  1 -
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  4 ----
 6 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index a202d5525822..78d09c5ed26d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -147,10 +147,13 @@ static struct xe_vram_region *res_to_mem_region(struct ttm_resource *res)
 {
 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
 	struct ttm_resource_manager *mgr;
+	struct xe_ttm_vram_mgr *vram_mgr;
 
 	xe_assert(xe, resource_is_vram(res));
 	mgr = ttm_manager_type(&xe->ttm, res->mem_type);
-	return to_xe_ttm_vram_mgr(mgr)->vram;
+	vram_mgr = to_xe_ttm_vram_mgr(mgr);
+
+	return container_of(vram_mgr, struct xe_vram_region, ttm);
 }
 
 static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
@@ -179,12 +182,15 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
 	struct ttm_place place = { .mem_type = mem_type };
+	struct ttm_resource_manager *mgr = ttm_manager_type(&xe->ttm, mem_type);
+	struct xe_ttm_vram_mgr *vram_mgr = to_xe_ttm_vram_mgr(mgr);
+
 	struct xe_vram_region *vram;
 	u64 io_size;
 
 	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
 
-	vram = to_xe_ttm_vram_mgr(ttm_manager_type(&xe->ttm, mem_type))->vram;
+	vram = container_of(vram_mgr, struct xe_vram_region, ttm);
 	xe_assert(xe, vram && vram->usable_size);
 	io_size = vram->io_size;
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 1f27ed2c0448..28d10a1d7b64 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -23,6 +23,7 @@
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
+#include "xe_ttm_vram_mgr_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -105,6 +106,8 @@ struct xe_vram_region {
 	resource_size_t actual_physical_size;
 	/** @mapping: pointer to VRAM mappable space */
 	void __iomem *mapping;
+	/** @ttm: VRAM TTM manager */
+	struct xe_ttm_vram_mgr ttm;
 };
 
 /**
@@ -199,9 +202,6 @@ struct xe_tile {
 		 */
 		struct xe_vram_region vram;
 
-		/** @mem.vram_mgr: VRAM TTM manager */
-		struct xe_ttm_vram_mgr *vram_mgr;
-
 		/** @mem.ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index b1d994d65589..af788c147ca8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1560,7 +1560,7 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
 
-	return xe_ttm_vram_get_avail(&tile->mem.vram_mgr->manager);
+	return xe_ttm_vram_get_avail(&tile->mem.vram.ttm.manager);
 }
 
 static u64 pf_query_max_lmem(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 2825553b568f..d9a7a04ff652 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -94,10 +94,6 @@ static int xe_tile_alloc(struct xe_tile *tile)
 		return -ENOMEM;
 	tile->mem.ggtt->tile = tile;
 
-	tile->mem.vram_mgr = drmm_kzalloc(drm, sizeof(*tile->mem.vram_mgr), GFP_KERNEL);
-	if (!tile->mem.vram_mgr)
-		return -ENOMEM;
-
 	return 0;
 }
 
@@ -139,7 +135,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 	int err;
 
 	if (tile->mem.vram.usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, tile->mem.vram_mgr);
+		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram.ttm);
 		if (err)
 			return err;
 		xe->info.mem_region_mask |= BIT(tile->id) << 1;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index a8c37fb4fec0..9e375a40aee9 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -342,7 +342,6 @@ int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_vram_region *vram = &tile->mem.vram;
 
-	mgr->vram = vram;
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
 				      vram->usable_size, vram->io_size,
 				      PAGE_SIZE);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 4c52ced4ee44..1144f9232ebb 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -9,8 +9,6 @@
 #include <drm/drm_buddy.h>
 #include <drm/ttm/ttm_device.h>
 
-struct xe_vram_region;
-
 /**
  * struct xe_ttm_vram_mgr - XE TTM VRAM manager
  *
@@ -21,8 +19,6 @@ struct xe_ttm_vram_mgr {
 	struct ttm_resource_manager manager;
 	/** @mm: DRM buddy allocator which manages the VRAM */
 	struct drm_buddy mm;
-	/** @vram: ptr to details of associated VRAM region */
-	struct xe_vram_region *vram;
 	/** @visible_size: Proped size of the CPU visible portion */
 	u64 visible_size;
 	/** @visible_avail: CPU visible portion still unallocated */
-- 
2.34.1

