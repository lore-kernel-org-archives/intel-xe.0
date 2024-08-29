Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B81AC83F25
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 13:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A3910E6AC;
	Thu, 29 Aug 2024 13:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7eCZ4xU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E656A10E6AC
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Aug 2024 13:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724938887; x=1756474887;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oMgiW5tkjiPKRjRnQF1zPc/4RTkl++xa00wRkmpRNXQ=;
 b=J7eCZ4xUZA/fU9UDPoGw1QSWVHuTsElgzASXPyOqkQ0UoDahidiTMist
 DdyrL4YEv/FNKAwmo4znxQdi4Dx7TfXjp2/u+laUzxhEOYkMROdNsnsFN
 oSd8J1oXrNJlLxSjM8zil7aknG9lv1shnz7xf3jk44wMCjvxMvp6QySj/
 Oo7Sc8SSFA8GSkK3CRCDm/8NARHluOWjX9BA/cUzWgKVDemFUMCL9OIWl
 xcthjhmtI7VZXrsOBfRVNq1tFQxW9mgRwtzGdV2geSy75odMjknJij4yw
 MgxgI+8jYHU0k2363I+ZK1NoT9yhIy/jIq78IpMumq8+xcdynYspGF4yH w==;
X-CSE-ConnectionGUID: 9TOOWBNjT7K1i5Yh5ySr1A==
X-CSE-MsgGUID: jPJnigTgRXiC7c7Mxjo9kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23047563"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="23047563"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 06:41:26 -0700
X-CSE-ConnectionGUID: +J9tptkjSBK8vzeLWgx6lQ==
X-CSE-MsgGUID: pyqm0tcKS6WuheX7ucnDFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="64281643"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 06:41:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 06:41:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 06:41:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 06:41:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjTIjeRMPPwyNm7HP+hbZWX2TYpukFnDkSxX6GuZn9fSr74zIMNV/sILGgmBp3aB/IPCpB5/aO2t9vI/rpE3OXQQUmXw1515Q2o8jBsLIwM2l3vXEbzCRh34Vh6G4wOXiYx/hPPDMbCE+3fLvV3ufAOIzNQW40DUCe/LRC7qnXbB7glI3gefpXRRF0EgOo4OSSlFpBJ3fOAqfyst1+jpg/zcyYPQ728OGeR95sjE+gYU1vhiGyT1xeVdL/FycPsIAeOcfq2gmj2dPwC1zoYFx94hXeUoJvaWKt+YztY5OX5R710tpDKgyyueEhfcjoaevv+ptg95hSqg/JPx8ZZHSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TX9DneE/UHxS3bPEPs0m79XUUecklUmrOmULQ0wHWw=;
 b=U1fJY/iph+0MWsT/WIkOaHZdGtXgy7zwV0QEim22+k1XV5yR3DcVT9kiP++AkOapcPE92S6RUzjDbZYJVJAOGgNj7vKBIE8+fIjHqV4jGYUEXW5FTMA5zaaCU+Ek2KPoLnD9XbMv0IYLixSDu98tz+tYN+ZJTlePxviqLUFdYBQyt9Y6sZiAGhdaAw0eX44SGDiEfC7gmlXqalEDzLAZ7uszZVxHppR5KaPMLgmo/ntkVOvIEFq1RLr//crqXwTy9wBRUTZ3XG7PPGLBuZgOzCttWKA9N6Nqs6f1Ea2tfm9FlNDeNZGHaY/GsLh3ACub26pp9pp1MVbdz/yD6XPOcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW4PR11MB6809.namprd11.prod.outlook.com (2603:10b6:303:1e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 13:41:16 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 13:41:15 +0000
Date: Thu, 29 Aug 2024 15:41:12 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/4] drm/xe/pf: Improve VF control
Message-ID: <20240829134112.qbsgaouvhvqiie53@intel.com>
References: <20240828210809.1528-1-michal.wajdeczko@intel.com>
 <20240828210809.1528-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240828210809.1528-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI0P293CA0007.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::10) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW4PR11MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e67b5f-6f73-4037-87f4-08dcc8304119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0oxNjZrVFlFbnR2MzI5UXZla0NlZC9pL1k1ZUl1T3Q4emp6OGdYWmw3dVJD?=
 =?utf-8?B?bzR5YzRPd0pURXhMbjF0Z2FVK05LdVk1SkIwZFh6WVUyNTdwY0s3b0JkanE1?=
 =?utf-8?B?VTRTZkIvMVoyRFNqYTJHZmZmUFUyYnUwY3lYMXVRdW1JdGZPd2R3UWsyN0Vn?=
 =?utf-8?B?K0ZnQytQeWpzcG9lanBoMndnN3lzamNZSEJTQjNEUWtHN1B0Tzc3NDRYSTBS?=
 =?utf-8?B?Y2FSL2NZVlg2eWx5d0lkMzUzVUM5cE5XeTNobU9iR2NmMG1LS2tzeUR3ejVJ?=
 =?utf-8?B?Vm00TTl5OGM3dis0MTJ6ZkRVZkQxWTZza2g2L1ltT2RaOG9sODB2N2pFSmQr?=
 =?utf-8?B?YkxXKzV5eUVYWjgzMzZNYzZRZVVZMklxbGYvTGJvNHpKTDRqK0V0NlphZG5L?=
 =?utf-8?B?aHpvRUJiVm9ZSFUySi9PUEFxMGJzclpKSkxUZFJZWjJPQVZmUTg0OUNWZ1pj?=
 =?utf-8?B?TE5qNTRXMHhDY3VWeGdyQy9pUWJYeTJIV1pIeDdnQWpuVlpNd2FHS2orcERp?=
 =?utf-8?B?Z1ZmYzFoWURFSncxRTVCRVpxWUp4bGVsdFQyRXVvY1ZWUjQzV0ZmUFQzWWJ1?=
 =?utf-8?B?NW5xcGV2RXB3d3ZkOWFXdzRPcFFYa2JNMWREdy95T003S2syVnVscTBrY01H?=
 =?utf-8?B?M2dMaG9OYjl2eGNtM01YTnVmaktyNEtCV0lrT2FpUnRJR1JWMWNNeTJVL0w5?=
 =?utf-8?B?YTFORkVpSWxaR2lOQVU0YkhIR3BGZnFLakQrYzU3QnlUOHhHOG9XSlJuK0xr?=
 =?utf-8?B?ZDlBTFBjODNBUVpWVjlqN1dzSVdVZmNleHp0QXV0ZG1WYzJxMVNRRS93NlBq?=
 =?utf-8?B?b3RrdzBBNTRSVmFJTkl6c1dHd1djQ2RWRnN0VHdSYmFsNHlQa1dTV0hmRTVO?=
 =?utf-8?B?TjR6c1FWdk1rdFRGOC9zeVI0dERKdHVLTUpJeURRMWhTQWh0UkdHdEtmT1ZQ?=
 =?utf-8?B?eGY0M2xMRVVXcmJuUmZKZGxmNTJSdTlZYVlaUS9RVzdoWXgvNDhaOVUzOEJh?=
 =?utf-8?B?RUliWjFDYnZ2M20wTjRIMHc1dUZqRkNxaUg2SkRYVWNNNDJndVpNWHozUFN5?=
 =?utf-8?B?UEdpSWhZOWRNbmFHaVREdmRwL2xQMVRIMUJKV1FkUVNGNGt5dWtuNUwvRWFI?=
 =?utf-8?B?UUpxOXhnbWFsVmR5L29rUDBIMGdjMmhJWW5ROVdkaVNEVy9vc3pMT2NhaTFt?=
 =?utf-8?B?eWxUNkY1RHIzeVVhYzl5cVpCVGVQYXl1VU1heUpPVVJqRlQzS3pJU0l1Z0Ur?=
 =?utf-8?B?Wk5WTExMUU9WQUVzOHVHcFNkSzBNY0hadzBhSzl1dHJCd3NkMFpjc1lSMEhj?=
 =?utf-8?B?d3lQY0VGb0JzaUJGVUEwcnNneFhONjBCNmdwUDVoL2R6VDMzbnRJOEdZbWQ0?=
 =?utf-8?B?YjlIcTRYbHF2OEJpM01aT0h3bUw0UzhrSmpseElPMndUUVBvanFxWERCL1ZE?=
 =?utf-8?B?aGp1TWtwTnJHbEJZTjhtVWZrb0hRczhRSDZPMUJZclRsVFhBT3N0cDNVOEtL?=
 =?utf-8?B?bndXWE94NWNaa1Y5TVpaWSs3L0xreTlLZmdnQTFTMmdIdm0yZmRnaGEzY3B0?=
 =?utf-8?B?VjQzUTlza1UrRXJtdzBjTFdGNFZ0TUpNemducTNtcFZoeGtESHlZSDFDWGtU?=
 =?utf-8?B?Ym91T01kc0ZOL0xhLzd2MmlmNjFJdUdjMnkvRGtab1hWUE1lc203alkvRi9s?=
 =?utf-8?B?aGtTQ2NQOFVudm1XZnZXSm0waURLK0RIVlFaai85dXpQaGo1aE5sOXZZQU5B?=
 =?utf-8?B?UTNmVC9BZDRIM2lxYjhhT3hiTFAwVVE2T2tYZlJxMWlwcXV2ZXM0RENoOWEr?=
 =?utf-8?B?QWU1VU0waDhxQmNuUEsyZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnhhdDY3VFV1cEYvbytiUXBuTTAwM0pYTEpoSWg0dVFzeC9BMGhYUXhCSkFW?=
 =?utf-8?B?MnZUWEMxUG5zaXFibjhpeWl1VDhRcGhtZzM5MGRQMDJSbE5FQTViM0NGRVZB?=
 =?utf-8?B?TzlEdnY1OXF4SVJ5T3BiZEhsc3pPOVdVZ0NLcFNqc0NrTzlRazAzUUNybkc2?=
 =?utf-8?B?Vzc0blk0WTUwKzZDNkk5MlJEQi9uOGR6NWI4STJZQkIxZjdEakJyQyswU1dT?=
 =?utf-8?B?QTNqb2o3ZS9ua0hzT3FvaFRsZzlQUkRQWHBVTk8rUTBEaFlDTzQ2NjdPN2NY?=
 =?utf-8?B?bWdGZFdrMXJsWHMydkx3ajhFWEdWZC9SYmU3Y0ozMks5V1F5d3JvWEVWbDZW?=
 =?utf-8?B?bXBkZXZ6MzJ0SkN1RzNTTjZZcW92Z1FxVXhlYUsvQW11MndOZUs5bEtybmxE?=
 =?utf-8?B?dTJXcEY2NFR6dnI2K3FZTWIzdHVhYk1pdXcveE9VNVZOK3BDYUpFT1Y5VDJr?=
 =?utf-8?B?aTlFajRGNmp6RjNzREMxdE9ucWN2WDhrOXg3dkc1QXJuWm5LRlcyeU5GN0xN?=
 =?utf-8?B?Qy9FWk9QMUc4UzJ5clZaSHpJemx1aFJzRVlrMkhBbzl3eGRoKzkxZEUwRXhW?=
 =?utf-8?B?aHQ5RGdJOTg0ZDZhRXMvUERiZXU1dnBuUEIzSnJ2YmIxcUtjbVM4VVV5ZFk0?=
 =?utf-8?B?YmNJNFhKVEFSbjBkbzRRdVhyc0c5cnVCeVd0NGViZmdZM21sOUdhUlJPRkNP?=
 =?utf-8?B?c2hsLzlzV09VZzNsNGVBalhLcW5pVWpWSHpnbmtMUGMxVHlmZnVlV2xKamo3?=
 =?utf-8?B?Z0t5Ri9vUURuWWI2VnI4YSsxMGZ1a1NxUnlCMDZzZDZnQWtPcDJlMndDNEdM?=
 =?utf-8?B?SG5MdXJBRGhzeXZzdTNnMVRkSnN5QjVNMUVxY1JjamU0c1RCdkJsL05VYUlS?=
 =?utf-8?B?S1FCQWNMNVNoZFJHSTh2WDFJZE1PcmlvWHgvRHZSZGFpbjA4NUdqR2Zac1Mx?=
 =?utf-8?B?QlVpaG82NHkrT1dSTzFqUzZQNks0a1RGZjdabFZSNzlNVUFhb0prZit2U2VU?=
 =?utf-8?B?OHQ5ZnNjY0pQZDBkbHo2V2h4TFA4VHRyaXV1c0hwcVV2TzlrczZiRGlKVFVs?=
 =?utf-8?B?dEQwb3M0Qlljc0plQXI1TGc1UEhDOVZ0ZG1jM0dVUWFSaHZLbk1sSkdTMzBU?=
 =?utf-8?B?K1NSMTNKY2VhT2J2NnJVclhvQllZTXNvaXFKcmI0VWJ3MnB2dzk1VE4raDVH?=
 =?utf-8?B?bEp1ZndhdHBMRXhLcGg1bG1qQnpuNEhYcVpndEZQZVd0WitKa0JxcUc4OTcy?=
 =?utf-8?B?WGhXZDdMMmF4aFlpbGpyUXpybFpYYUFrdFhkS2FGQ0FJN0MzMjJYV3h6ZkRt?=
 =?utf-8?B?Z0x1ZE9TN2VUczhEK2dMemkvcWpGQUFTMXFQQ01rcjRYNkJRUFA3U3llL1pq?=
 =?utf-8?B?WlpaOEhKTmQ3UW5ZbTBzYlBhd0tSVnBya3pDSkVVTU5NbXQrNG9vaG5pVXdo?=
 =?utf-8?B?UUpqblB6S0ZENk15cXJMTVYySEF5VVRsQnBGY1BaZEYzWVkxdjFOQ1JEREFx?=
 =?utf-8?B?eDBDamxoZUgyVW1QQXBRQUp4QzFMQit2NzJQWW0zd1Y4Q2NreFB6UkNLMVBQ?=
 =?utf-8?B?WllQWE4yVmtFSGxJbVZsTzl2blJrZGYraGhhRHF4SmNaQ0lmTHIrTy9ldGc3?=
 =?utf-8?B?My8walJib2Z5b052TmNCcWh0Zk9kbXA5bGhqZGFrUDJ6Wm9RdjdDT25kaXc5?=
 =?utf-8?B?UlFmMTZUb2lrMWoyRk1DU2FUTngvcFprb08xWTlYckR2UHhjYW5OWmhXODU5?=
 =?utf-8?B?eVFXejRHOVlVZk1OekFuOGp1cmpTSTJLVmVjWWpWclVsVkt4MjZXMGhBTjZP?=
 =?utf-8?B?TDA4OHVSQkM3eTBvNk8ybWNRZVg5S2N1YWI4R2l4WVF5ZUNYN0hkZHVLUFU0?=
 =?utf-8?B?ZWdWekltQjhlNWFmeGpCT1UvZ1RLQytnbDR0R05QUHFzc3R3d3FqRUdnMU95?=
 =?utf-8?B?L01wR0MvL1A5SzhNTGJGcFdKRk9tUEEycXR3Q0JWSUY2em04YlRtczVrTlc2?=
 =?utf-8?B?TzNZQ0I3ak5XN2JNYms3RDNWSk9SL2k2VUpjek9US0ZybUE5MTBUMmhQWVUv?=
 =?utf-8?B?MUJ1dHJjQlppTEw3VFlVREZwTkxONzExZnd1TDRaSEhzSHhiN2Z5VExWNHVP?=
 =?utf-8?B?b2dPZUVPL3BOT09rZFhTVmsxb3l2Ukx1RCtuN0ZoZ2ZzWE1rdGVkNEZZdENT?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e67b5f-6f73-4037-87f4-08dcc8304119
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 13:41:15.8426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bL0zEEEFvrpilCMhJ15n3x5++zhcctUFEdUYybXiEJ02q1De18JI6JjW8woK2+/OTy/Erk0ExoA8E4Fhj6MrM8zq5dCLsmnksrYD5PbZKzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6809
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-sie-28 23:08:09 +0200]:
> Our initial VF control implementation was focused on providing
> a very minimal support for the VF_STATE_NOTIFY events just to
> meet GuC requirements, without tracking a VF state or doing any
> expected actions (like cleanup in case of the FLR notification).
> 
> Try to improve this by defining set of VF state machines, each
> responsible for processing one activity (PAUSE, RESUME, STOP or
> FLR). All required steps defined by the VF state machine are then
> executed by the PF worker from the dedicated workqueue.
> 
> Any external requests or notifications simply try to transition
> between the states to trigger a work and then wait for that work
> to finish. Some predefined default timeouts are used to avoid
> changing existing API calls, but it should be easy to extend the
> control API to also accept specific timeout values.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
> v2: fix duplicated functions calls (Piotr)
>     put RESUMED state on the main diagram (Piotr)
>     fix missed use of default timeout helper (Piotr)
>     increase severity of the FLR timedout message (Piotr)
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |    6 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 1198 ++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |    3 +
>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  107 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |    6 +
>  5 files changed, 1305 insertions(+), 15 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index ef239440963c..905f409db74b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -9,6 +9,7 @@
>  
>  #include "xe_gt_sriov_pf.h"
>  #include "xe_gt_sriov_pf_config.h"
> +#include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_service.h"
>  #include "xe_mmio.h"
> @@ -57,6 +58,10 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	err = xe_gt_sriov_pf_control_init(gt);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> @@ -93,4 +98,5 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
>  void xe_gt_sriov_pf_restart(struct xe_gt *gt)
>  {
>  	xe_gt_sriov_pf_config_restart(gt);
> +	xe_gt_sriov_pf_control_restart(gt);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index ad447d867e51..02f7328bd6ce 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -3,12 +3,17 @@
>   * Copyright © 2023-2024 Intel Corporation
>   */
>  
> +#include <drm/drm_managed.h>
> +
>  #include "abi/guc_actions_sriov_abi.h"
>  
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_gt_sriov_pf_config.h"
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_helpers.h"
> +#include "xe_gt_sriov_pf_monitor.h"
> +#include "xe_gt_sriov_pf_service.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
> @@ -42,10 +47,6 @@ static int guc_action_vf_control_cmd(struct xe_guc *guc, u32 vfid, u32 cmd)
>  	};
>  	int ret;
>  
> -	/* XXX those two commands are now sent from the G2H handler */
> -	if (cmd == GUC_PF_TRIGGER_VF_FLR_START || cmd == GUC_PF_TRIGGER_VF_FLR_FINISH)
> -		return xe_guc_ct_send_g2h_handler(&guc->ct, request, ARRAY_SIZE(request));
> -
>  	ret = xe_guc_ct_send_block(&guc->ct, request, ARRAY_SIZE(request));
>  	return ret > 0 ? -EPROTO : ret;
>  }
> @@ -55,6 +56,8 @@ static int pf_send_vf_control_cmd(struct xe_gt *gt, unsigned int vfid, u32 cmd)
>  	int err;
>  
>  	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_sriov_dbg_verbose(gt, "sending VF%u control command %s\n",
> +				vfid, control_cmd_to_string(cmd));
>  
>  	err = guc_action_vf_control_cmd(&gt->uc.guc, vfid, cmd);
>  	if (unlikely(err))
> @@ -88,6 +91,456 @@ static int pf_send_vf_flr_finish(struct xe_gt *gt, unsigned int vfid)
>  	return pf_send_vf_control_cmd(gt, vfid, GUC_PF_TRIGGER_VF_FLR_FINISH);
>  }
>  
> +/**
> + * DOC: The VF state machine
> + *
> + * The simplified VF state machine could be presented as::
> + *
> + *	               pause--------------------------o
> + *	              /                               |
> + *	             /                                v
> + *	      (READY)<------------------resume-----(PAUSED)
> + *	         ^   \                             /    /
> + *	         |    \                           /    /
> + *	         |     stop---->(STOPPED)<----stop    /
> + *	         |                  /                /
> + *	         |                 /                /
> + *	         o--------<-----flr                /
> + *	          \                               /
> + *	           o------<--------------------flr
> + *
> + * Where:
> + *
> + * * READY - represents a state in which VF is fully operable
> + * * PAUSED - represents a state in which VF activity is temporarily suspended
> + * * STOPPED - represents a state in which VF activity is definitely halted
> + * * pause - represents a request to temporarily suspend VF activity
> + * * resume - represents a request to resume VF activity
> + * * stop - represents a request to definitely halt VF activity
> + * * flr - represents a request to perform VF FLR to restore VF activity
> + *
> + * However, each state transition requires additional steps that involves
> + * communication with GuC that might fail or be interrupted by other requests::
> + *
> + *	                   .................................WIP....
> + *	                   :                                      :
> + *	          pause--------------------->PAUSE_WIP----------------------------o
> + *	         /         :                /         \           :               |
> + *	        /          :    o----<---stop          flr--o     :               |
> + *	       /           :    |           \         /     |     :               V
> + *	(READY,RESUMED)<--------+------------RESUME_WIP<----+--<-----resume--(PAUSED)
> + *	  ^ \  \           :    |                           |     :          /   /
> + *	  |  \  \          :    |                           |     :         /   /
> + *	  |   \  \         :    |                           |     :        /   /
> + *	  |    \  \        :    o----<----------------------+--<-------stop   /
> + *	  |     \  \       :    |                           |     :          /
> + *	  |      \  \      :    V                           |     :         /
> + *	  |       \  stop----->STOP_WIP---------flr--->-----o     :        /
> + *	  |        \       :    |                           |     :       /
> + *	  |         \      :    |                           V     :      /
> + *	  |          flr--------+----->----------------->FLR_WIP<-----flr
> + *	  |                :    |                        /  ^     :
> + *	  |                :    |                       /   |     :
> + *	  o--------<-------:----+-----<----------------o    |     :
> + *	                   :    |                           |     :
> + *	                   :....|...........................|.....:
> + *	                        |                           |
> + *	                        V                           |
> + *	                     (STOPPED)--------------------flr
> + *
> + * For details about each internal WIP state machine see:
> + *
> + * * `The VF PAUSE state machine`_
> + * * `The VF RESUME state machine`_
> + * * `The VF STOP state machine`_
> + * * `The VF FLR state machine`_
> + */
> +
> +#ifdef CONFIG_DRM_XE_DEBUG_SRIOV
> +static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
> +{
> +	switch (bit) {
> +#define CASE2STR(_X) \
> +	case XE_GT_SRIOV_STATE_##_X: return #_X
> +	CASE2STR(WIP);
> +	CASE2STR(FLR_WIP);
> +	CASE2STR(FLR_SEND_START);
> +	CASE2STR(FLR_WAIT_GUC);
> +	CASE2STR(FLR_GUC_DONE);
> +	CASE2STR(FLR_RESET_CONFIG);
> +	CASE2STR(FLR_RESET_DATA);
> +	CASE2STR(FLR_RESET_MMIO);
> +	CASE2STR(FLR_SEND_FINISH);
> +	CASE2STR(FLR_FAILED);
> +	CASE2STR(PAUSE_WIP);
> +	CASE2STR(PAUSE_SEND_PAUSE);
> +	CASE2STR(PAUSE_WAIT_GUC);
> +	CASE2STR(PAUSE_GUC_DONE);
> +	CASE2STR(PAUSE_FAILED);
> +	CASE2STR(PAUSED);
> +	CASE2STR(RESUME_WIP);
> +	CASE2STR(RESUME_SEND_RESUME);
> +	CASE2STR(RESUME_FAILED);
> +	CASE2STR(RESUMED);
> +	CASE2STR(STOP_WIP);
> +	CASE2STR(STOP_SEND_STOP);
> +	CASE2STR(STOP_FAILED);
> +	CASE2STR(STOPPED);
> +	CASE2STR(MISMATCH);
> +#undef  CASE2STR
> +	default: return "?";
> +	}
> +}
> +#endif
> +
> +static unsigned long pf_get_default_timeout(enum xe_gt_sriov_control_bits bit)
> +{
> +	switch (bit) {
> +	case XE_GT_SRIOV_STATE_FLR_WAIT_GUC:
> +	case XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC:
> +		return HZ / 2;
> +	case XE_GT_SRIOV_STATE_FLR_WIP:
> +	case XE_GT_SRIOV_STATE_FLR_RESET_CONFIG:
> +		return 5 * HZ;
> +	default:
> +		return HZ;
> +	}
> +}
> +
> +static struct xe_gt_sriov_control_state *pf_pick_vf_control(struct xe_gt *gt, unsigned int vfid)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid <= xe_gt_sriov_pf_get_totalvfs(gt));
> +
> +	return &gt->sriov.pf.vfs[vfid].control;
> +}
> +
> +static unsigned long *pf_peek_vf_state(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, vfid);
> +
> +	return &cs->state;
> +}
> +
> +static bool pf_check_vf_state(struct xe_gt *gt, unsigned int vfid,
> +			      enum xe_gt_sriov_control_bits bit)
> +{
> +	return test_bit(bit, pf_peek_vf_state(gt, vfid));
> +}
> +
> +static void pf_dump_vf_state(struct xe_gt *gt, unsigned int vfid)
> +{
> +	unsigned long state = *pf_peek_vf_state(gt, vfid);
> +	enum xe_gt_sriov_control_bits bit;
> +
> +	if (state) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u state %#lx%s%*pbl\n",
> +					vfid, state, state ? " bits " : "",
> +					(int)BITS_PER_LONG, &state);
> +		for_each_set_bit(bit, &state, BITS_PER_LONG)
> +			xe_gt_sriov_dbg_verbose(gt, "VF%u state %s(%d)\n",
> +						vfid, control_bit_to_string(bit), bit);
> +	} else {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u state READY\n", vfid);
> +	}
> +}
> +
> +static bool pf_expect_vf_state(struct xe_gt *gt, unsigned int vfid,
> +			       enum xe_gt_sriov_control_bits bit)
> +{
> +	bool result = pf_check_vf_state(gt, vfid, bit);
> +
> +	if (unlikely(!result))
> +		pf_dump_vf_state(gt, vfid);
> +
> +	return result;
> +}
> +
> +static bool pf_expect_vf_not_state(struct xe_gt *gt, unsigned int vfid,
> +				   enum xe_gt_sriov_control_bits bit)
> +{
> +	bool result = !pf_check_vf_state(gt, vfid, bit);
> +
> +	if (unlikely(!result))
> +		pf_dump_vf_state(gt, vfid);
> +
> +	return result;
> +}
> +
> +static bool pf_enter_vf_state(struct xe_gt *gt, unsigned int vfid,
> +			      enum xe_gt_sriov_control_bits bit)
> +{
> +	if (!test_and_set_bit(bit, pf_peek_vf_state(gt, vfid))) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u state %s(%d) enter\n",
> +					vfid, control_bit_to_string(bit), bit);
> +		return true;
> +	}
> +	return false;
> +}
> +
> +static bool pf_exit_vf_state(struct xe_gt *gt, unsigned int vfid,
> +			     enum xe_gt_sriov_control_bits bit)
> +{
> +	if (test_and_clear_bit(bit, pf_peek_vf_state(gt, vfid))) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u state %s(%d) exit\n",
> +					vfid, control_bit_to_string(bit), bit);
> +		return true;
> +	}
> +	return false;
> +}
> +
> +static void pf_escape_vf_state(struct xe_gt *gt, unsigned int vfid,
> +			       enum xe_gt_sriov_control_bits bit)
> +{
> +	if (pf_exit_vf_state(gt, vfid, bit))
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u state %s(%d) escaped by %ps\n",
> +					vfid, control_bit_to_string(bit), bit,
> +					__builtin_return_address(0));
> +}
> +
> +static void pf_enter_vf_mismatch(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MISMATCH)) {
> +		xe_gt_sriov_dbg(gt, "VF%u state mismatch detected by %ps\n",
> +				vfid, __builtin_return_address(0));
> +		pf_dump_vf_state(gt, vfid);
> +	}
> +}
> +
> +static void pf_exit_vf_mismatch(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MISMATCH))
> +		xe_gt_sriov_dbg(gt, "VF%u state mismatch cleared by %ps\n",
> +				vfid, __builtin_return_address(0));
> +
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_FAILED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED);
> +}
> +
> +#define pf_enter_vf_state_machine_bug(gt, vfid) ({	\
> +	pf_enter_vf_mismatch((gt), (vfid));		\
> +})
> +
> +static void pf_queue_control_worker(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> +
> +	queue_work(xe->sriov.wq, &gt->sriov.pf.control.worker);
> +}
> +
> +static void pf_queue_vf(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_pf_control *pfc = &gt->sriov.pf.control;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	spin_lock(&pfc->lock);
> +	list_move_tail(&gt->sriov.pf.vfs[vfid].control.link, &pfc->list);
> +	spin_unlock(&pfc->lock);
> +
> +	pf_queue_control_worker(gt);
> +}
> +
> +static void pf_exit_vf_flr_wip(struct xe_gt *gt, unsigned int vfid);
> +static void pf_exit_vf_stop_wip(struct xe_gt *gt, unsigned int vfid);
> +static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid);
> +static void pf_exit_vf_resume_wip(struct xe_gt *gt, unsigned int vfid);
> +
> +static bool pf_enter_vf_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_WIP)) {
> +		struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, vfid);
> +
> +		reinit_completion(&cs->done);
> +		return true;
> +	}
> +	return false;
> +}
> +
> +static void pf_exit_vf_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_WIP)) {
> +		struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, vfid);
> +
> +		pf_exit_vf_flr_wip(gt, vfid);
> +		pf_exit_vf_stop_wip(gt, vfid);
> +		pf_exit_vf_pause_wip(gt, vfid);
> +		pf_exit_vf_resume_wip(gt, vfid);
> +
> +		complete_all(&cs->done);
> +	}
> +}
> +
> +static int pf_wait_vf_wip_done(struct xe_gt *gt, unsigned int vfid, unsigned long timeout)
> +{
> +	struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, vfid);
> +
> +	return wait_for_completion_timeout(&cs->done, timeout) ? 0 : -ETIMEDOUT;
> +}
> +
> +static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
> +	pf_exit_vf_mismatch(gt, vfid);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +/**
> + * DOC: The VF PAUSE state machine
> + *
> + * The VF PAUSE state machine looks like::
> + *
> + *	 (READY,RESUMED)<-------------<---------------------o---------o
> + *	    |                                                \         \
> + *	   pause                                              \         \
> + *	    |                                                  \         \
> + *	....V...........................PAUSE_WIP........       \         \
> + *	:    \                                          :        o         \
> + *	:     \   o------<-----busy                     :        |          \
> + *	:      \ /              /                       :        |           |
> + *	:       PAUSE_SEND_PAUSE ---failed--->----------o--->(PAUSE_FAILED)  |
> + *	:        |              \                       :        |           |
> + *	:      acked             rejected---->----------o--->(MISMATCH)     /
> + *	:        |                                      :                  /
> + *	:        v                                      :                 /
> + *	:       PAUSE_WAIT_GUC                          :                /
> + *	:        |                                      :               /
> + *	:       done                                    :              /
> + *	:        |                                      :             /
> + *	:        v                                      :            /
> + *	:       PAUSE_GUC_DONE                          o-----restart
> + *	:      /                                        :
> + *	:     /                                         :
> + *	:....o..............o...............o...........:
> + *	     |              |               |
> + *	  completed        flr             stop
> + *	     |              |               |
> + *	     V         .....V.....    ......V.....
> + *	 (PAUSED)      : FLR_WIP :    : STOP_WIP :
> + *	               :.........:    :..........:
> + *
> + * For the full state machine view, see `The VF state machine`_.
> + */
> +
> +static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WIP)) {
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE);
> +	}
> +}
> +
> +static void pf_enter_vf_paused(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
> +	pf_exit_vf_mismatch(gt, vfid);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static void pf_enter_vf_pause_completed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_paused(gt, vfid);
> +}
> +
> +static void pf_enter_vf_pause_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static void pf_enter_vf_pause_rejected(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_mismatch(gt, vfid);
> +	pf_enter_vf_pause_failed(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_pause_guc_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE))
> +		return false;
> +
> +	pf_enter_vf_pause_completed(gt, vfid);
> +	return true;
> +}
> +
> +static void pf_enter_vf_pause_guc_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE))
> +		pf_queue_vf(gt, vfid);
> +}
> +
> +static void pf_enter_pause_wait_guc(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +}
> +
> +static bool pf_exit_pause_wait_guc(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC);
> +}
> +
> +static void pf_enter_vf_pause_send_pause(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_queue_vf(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_pause_send_pause(struct xe_gt *gt, unsigned int vfid)
> +{
> +	int err;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE))
> +		return false;
> +
> +	/* GuC may actually send a PAUSE_DONE before we get a RESPONSE */
> +	pf_enter_pause_wait_guc(gt, vfid);
> +
> +	err = pf_send_vf_pause(gt, vfid);
> +	if (err) {
> +		/* send failed, so we shouldn't expect PAUSE_DONE from GuC */
> +		pf_exit_pause_wait_guc(gt, vfid);
> +
> +		if (err == -EBUSY)
> +			pf_enter_vf_pause_send_pause(gt, vfid);
> +		else if (err == -EIO)
> +			pf_enter_vf_pause_rejected(gt, vfid);
> +		else
> +			pf_enter_vf_pause_failed(gt, vfid);
> +	} else {
> +		/*
> +		 * we have already moved to WAIT_GUC, maybe even to GUC_DONE
> +		 * but since GuC didn't complain, we may clear MISMATCH
> +		 */
> +		pf_exit_vf_mismatch(gt, vfid);
> +	}
> +
> +	return true;
> +}
> +
> +static bool pf_enter_vf_pause_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WIP)) {
> +		pf_enter_vf_wip(gt, vfid);
> +		pf_enter_vf_pause_send_pause(gt, vfid);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_control_pause_vf - Pause a VF.
>   * @gt: the &xe_gt
> @@ -99,7 +552,140 @@ static int pf_send_vf_flr_finish(struct xe_gt *gt, unsigned int vfid)
>   */
>  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid)
>  {
> -	return pf_send_vf_pause(gt, vfid);
> +	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_PAUSE_WIP);
> +	int err;
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
> +		return -EPERM;
> +	}
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u was already paused!\n", vfid);
> +		return -ESTALE;
> +	}
> +
> +	if (!pf_enter_vf_pause_wip(gt, vfid)) {
> +		xe_gt_sriov_dbg(gt, "VF%u pause already in progress!\n", vfid);
> +		return -EALREADY;
> +	}
> +
> +	err = pf_wait_vf_wip_done(gt, vfid, timeout);
> +	if (err) {
> +		xe_gt_sriov_dbg(gt, "VF%u pause didn't finish in %u ms (%pe)\n",
> +				vfid, jiffies_to_msecs(timeout), ERR_PTR(err));
> +		return err;
> +	}
> +
> +	if (pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
> +		xe_gt_sriov_info(gt, "VF%u paused!\n", vfid);
> +		return 0;
> +	}
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u pause failed!\n", vfid);
> +		return -EIO;
> +	}
> +
> +	xe_gt_sriov_dbg(gt, "VF%u pause was canceled!\n", vfid);
> +	return -ECANCELED;
> +}
> +
> +/**
> + * DOC: The VF RESUME state machine
> + *
> + * The VF RESUME state machine looks like::
> + *
> + *	 (PAUSED)<-----------------<------------------------o
> + *	    |                                                \
> + *	   resume                                             \
> + *	    |                                                  \
> + *	....V............................RESUME_WIP......       \
> + *	:    \                                          :        o
> + *	:     \   o-------<-----busy                    :        |
> + *	:      \ /                /                     :        |
> + *	:       RESUME_SEND_RESUME ---failed--->--------o--->(RESUME_FAILED)
> + *	:       /                \                      :        |
> + *	:    acked                rejected---->---------o--->(MISMATCH)
> + *	:     /                                         :
> + *	:....o..............o...............o.....o.....:
> + *	     |              |               |      \
> + *	  completed        flr            stop      restart-->(READY)
> + *	     |              |               |
> + *	     V         .....V.....    ......V.....
> + *	 (RESUMED)     : FLR_WIP :    : STOP_WIP :
> + *	               :.........:    :..........:
> + *
> + * For the full state machine view, see `The VF state machine`_.
> + */
> +
> +static void pf_exit_vf_resume_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_WIP))
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_SEND_RESUME);
> +}
> +
> +static void pf_enter_vf_resumed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +	pf_exit_vf_mismatch(gt, vfid);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static void pf_enter_vf_resume_completed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_resumed(gt, vfid);
> +}
> +
> +static void pf_enter_vf_resume_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static void pf_enter_vf_resume_rejected(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_mismatch(gt, vfid);
> +	pf_enter_vf_resume_failed(gt, vfid);
> +}
> +
> +static void pf_enter_vf_resume_send_resume(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_SEND_RESUME))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_queue_vf(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_resume_send_resume(struct xe_gt *gt, unsigned int vfid)
> +{
> +	int err;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_SEND_RESUME))
> +		return false;
> +
> +	err = pf_send_vf_resume(gt, vfid);
> +	if (err == -EBUSY)
> +		pf_enter_vf_resume_send_resume(gt, vfid);
> +	else if (err == -EIO)
> +		pf_enter_vf_resume_rejected(gt, vfid);
> +	else if (err)
> +		pf_enter_vf_resume_failed(gt, vfid);
> +	else
> +		pf_enter_vf_resume_completed(gt, vfid);
> +	return true;
> +}
> +
> +static bool pf_enter_vf_resume_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_WIP)) {
> +		pf_enter_vf_wip(gt, vfid);
> +		pf_enter_vf_resume_send_resume(gt, vfid);
> +		return true;
> +	}
> +
> +	return false;
>  }
>  
>  /**
> @@ -113,7 +699,134 @@ int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid)
>   */
>  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
>  {
> -	return pf_send_vf_resume(gt, vfid);
> +	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_RESUME_WIP);
> +	int err;
> +
> +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
> +		return -EPERM;
> +	}
> +
> +	if (!pf_enter_vf_resume_wip(gt, vfid)) {
> +		xe_gt_sriov_dbg(gt, "VF%u resume already in progress!\n", vfid);
> +		return -EALREADY;
> +	}
> +
> +	err = pf_wait_vf_wip_done(gt, vfid, timeout);
> +	if (err)
> +		return err;
> +
> +	if (pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED)) {
> +		xe_gt_sriov_info(gt, "VF%u resumed!\n", vfid);
> +		return 0;
> +	}
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u resume failed!\n", vfid);
> +		return -EIO;
> +	}
> +
> +	xe_gt_sriov_dbg(gt, "VF%u resume was canceled!\n", vfid);
> +	return -ECANCELED;
> +}
> +
> +/**
> + * DOC: The VF STOP state machine
> + *
> + * The VF STOP state machine looks like::
> + *
> + *	 (READY,PAUSED,RESUMED)<-------<--------------------o
> + *	    |                                                \
> + *	   stop                                               \
> + *	    |                                                  \
> + *	....V..............................STOP_WIP......       \
> + *	:    \                                          :        o
> + *	:     \   o----<----busy                        :        |
> + *	:      \ /            /                         :        |
> + *	:       STOP_SEND_STOP--------failed--->--------o--->(STOP_FAILED)
> + *	:       /             \                         :        |
> + *	:    acked             rejected-------->--------o--->(MISMATCH)
> + *	:     /                                         :
> + *	:....o..............o...............o...........:
> + *	     |              |               |
> + *	  completed        flr            restart
> + *	     |              |               |
> + *	     V         .....V.....          V
> + *	 (STOPPED)     : FLR_WIP :       (READY)
> + *	               :.........:
> + *
> + * For the full state machine view, see `The VF state machine`_.
> + */
> +
> +static void pf_exit_vf_stop_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_WIP))
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_SEND_STOP);
> +}
> +
> +static void pf_enter_vf_stopped(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +	pf_exit_vf_mismatch(gt, vfid);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static void pf_enter_vf_stop_completed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_stopped(gt, vfid);
> +}
> +
> +static void pf_enter_vf_stop_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_FAILED);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static void pf_enter_vf_stop_rejected(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_mismatch(gt, vfid);
> +	pf_enter_vf_stop_failed(gt, vfid);
> +}
> +
> +static void pf_enter_vf_stop_send_stop(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_SEND_STOP))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_queue_vf(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_stop_send_stop(struct xe_gt *gt, unsigned int vfid)
> +{
> +	int err;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_SEND_STOP))
> +		return false;
> +
> +	err = pf_send_vf_stop(gt, vfid);
> +	if (err == -EBUSY)
> +		pf_enter_vf_stop_send_stop(gt, vfid);
> +	else if (err == -EIO)
> +		pf_enter_vf_stop_rejected(gt, vfid);
> +	else if (err)
> +		pf_enter_vf_stop_failed(gt, vfid);
> +	else
> +		pf_enter_vf_stop_completed(gt, vfid);
> +	return true;
> +}
> +
> +static bool pf_enter_vf_stop_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_WIP)) {
> +		pf_enter_vf_wip(gt, vfid);
> +		pf_enter_vf_stop_send_stop(gt, vfid);
> +		return true;
> +	}
> +	return false;
>  }
>  
>  /**
> @@ -127,7 +840,280 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
>   */
>  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid)
>  {
> -	return pf_send_vf_stop(gt, vfid);
> +	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_STOP_WIP);
> +	int err;
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u was already stopped!\n", vfid);
> +		return -ESTALE;
> +	}
> +
> +	if (!pf_enter_vf_stop_wip(gt, vfid)) {
> +		xe_gt_sriov_dbg(gt, "VF%u stop already in progress!\n", vfid);
> +		return -EALREADY;
> +	}
> +
> +	err = pf_wait_vf_wip_done(gt, vfid, timeout);
> +	if (err)
> +		return err;
> +
> +	if (pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
> +		xe_gt_sriov_info(gt, "VF%u stopped!\n", vfid);
> +		return 0;
> +	}
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_FAILED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u stop failed!\n", vfid);
> +		return -EIO;
> +	}
> +
> +	xe_gt_sriov_dbg(gt, "VF%u stop was canceled!\n", vfid);
> +	return -ECANCELED;
> +}
> +
> +/**
> + * DOC: The VF FLR state machine
> + *
> + * The VF FLR state machine looks like::
> + *
> + *	 (READY,PAUSED,STOPPED)<------------<--------------o
> + *	    |                                               \
> + *	   flr                                               \
> + *	    |                                                 \
> + *	....V..........................FLR_WIP...........      \
> + *	:    \                                          :       \
> + *	:     \   o----<----busy                        :        |
> + *	:      \ /            /                         :        |
> + *	:       FLR_SEND_START---failed----->-----------o--->(FLR_FAILED)<---o
> + *	:        |            \                         :        |           |
> + *	:      acked           rejected----->-----------o--->(MISMATCH)      |
> + *	:        |                                      :        ^           |
> + *	:        v                                      :        |           |
> + *	:       FLR_WAIT_GUC                            :        |           |
> + *	:        |                                      :        |           |
> + *	:       done                                    :        |           |
> + *	:        |                                      :        |           |
> + *	:        v                                      :        |           |
> + *	:       FLR_GUC_DONE                            :        |           |
> + *	:        |                                      :        |           |
> + *	:       FLR_RESET_CONFIG---failed--->-----------o--------+-----------o
> + *	:        |                                      :        |           |
> + *	:       FLR_RESET_DATA                          :        |           |
> + *	:        |                                      :        |           |
> + *	:       FLR_RESET_MMIO                          :        |           |
> + *	:        |                                      :        |           |
> + *	:        | o----<----busy                       :        |           |
> + *	:        |/            /                        :        |           |
> + *	:       FLR_SEND_FINISH----failed--->-----------o--------+-----------o
> + *	:       /             \                         :        |
> + *	:     acked            rejected----->-----------o--------o
> + *	:     /                                         :
> + *	:....o..............................o...........:
> + *	     |                              |
> + *	  completed                       restart
> + *	     |                             /
> + *	     V                            /
> + *	  (READY)<----------<------------o
> + *
> + * For the full state machine view, see `The VF state machine`_.
> + */
> +
> +static void pf_enter_vf_flr_send_start(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SEND_START))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_queue_vf(gt, vfid);
> +}
> +
> +static void pf_enter_vf_flr_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WIP)) {
> +		xe_gt_sriov_dbg(gt, "VF%u FLR is already in progress\n", vfid);
> +		return;
> +	}
> +
> +	pf_enter_vf_wip(gt, vfid);
> +	pf_enter_vf_flr_send_start(gt, vfid);
> +}
> +
> +static void pf_exit_vf_flr_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WIP)) {
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SEND_FINISH);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_MMIO);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_CONFIG);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_GUC_DONE);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WAIT_GUC);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SEND_START);
> +	}
> +}
> +
> +static void pf_enter_vf_flr_completed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_ready(gt, vfid);
> +}
> +
> +static void pf_enter_vf_flr_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED))
> +		xe_gt_sriov_notice(gt, "VF%u FLR failed!\n", vfid);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static void pf_enter_vf_flr_rejected(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_mismatch(gt, vfid);
> +	pf_enter_vf_flr_failed(gt, vfid);
> +}
> +
> +static void pf_enter_vf_flr_send_finish(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SEND_FINISH))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_queue_vf(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_flr_send_finish(struct xe_gt *gt, unsigned int vfid)
> +{
> +	int err;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SEND_FINISH))
> +		return false;
> +
> +	err = pf_send_vf_flr_finish(gt, vfid);
> +	if (err == -EBUSY)
> +		pf_enter_vf_flr_send_finish(gt, vfid);
> +	else if (err == -EIO)
> +		pf_enter_vf_flr_rejected(gt, vfid);
> +	else if (err)
> +		pf_enter_vf_flr_failed(gt, vfid);
> +	else
> +		pf_enter_vf_flr_completed(gt, vfid);
> +	return true;
> +}
> +
> +static void pf_enter_vf_flr_reset_mmio(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_MMIO))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_queue_vf(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_flr_reset_mmio(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_MMIO))
> +		return false;
> +
> +	/* XXX: placeholder */
> +
> +	pf_enter_vf_flr_send_finish(gt, vfid);
> +	return true;
> +}
> +
> +static void pf_enter_vf_flr_reset_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_DATA))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_queue_vf(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_flr_reset_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_DATA))
> +		return false;
> +
> +	xe_gt_sriov_pf_service_reset(gt, vfid);
> +	xe_gt_sriov_pf_monitor_flr(gt, vfid);
> +
> +	pf_enter_vf_flr_reset_mmio(gt, vfid);
> +	return true;
> +}
> +
> +static void pf_enter_vf_flr_reset_config(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_CONFIG))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_queue_vf(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_flr_reset_config(struct xe_gt *gt, unsigned int vfid)
> +{
> +	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_FLR_RESET_CONFIG);
> +	int err;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_CONFIG))
> +		return false;
> +
> +	err = xe_gt_sriov_pf_config_sanitize(gt, vfid, timeout);
> +	if (err)
> +		pf_enter_vf_flr_failed(gt, vfid);
> +	else
> +		pf_enter_vf_flr_reset_data(gt, vfid);
> +	return true;
> +}
> +
> +static void pf_enter_vf_flr_wait_guc(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WAIT_GUC))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_flr_wait_guc(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WAIT_GUC);
> +}
> +
> +static bool pf_exit_vf_flr_send_start(struct xe_gt *gt, unsigned int vfid)
> +{
> +	int err;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SEND_START))
> +		return false;
> +
> +	/* GuC may actually send a FLR_DONE before we get a RESPONSE */
> +	pf_enter_vf_flr_wait_guc(gt, vfid);
> +
> +	err = pf_send_vf_flr_start(gt, vfid);
> +	if (err) {
> +		/* send failed, so we shouldn't expect FLR_DONE from GuC */
> +		pf_exit_vf_flr_wait_guc(gt, vfid);
> +
> +		if (err == -EBUSY)
> +			pf_enter_vf_flr_send_start(gt, vfid);
> +		else if (err == -EIO)
> +			pf_enter_vf_flr_rejected(gt, vfid);
> +		else
> +			pf_enter_vf_flr_failed(gt, vfid);
> +	} else {
> +		/*
> +		 * we have already moved to WAIT_GUC, maybe even to GUC_DONE
> +		 * but since GuC didn't complain, we may clear MISMATCH
> +		 */
> +		pf_exit_vf_mismatch(gt, vfid);
> +	}
> +
> +	return true;
> +}
> +
> +static bool pf_exit_vf_flr_guc_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_GUC_DONE))
> +		return false;
> +
> +	pf_enter_vf_flr_reset_config(gt, vfid);
> +	return true;
> +}
> +
> +static void pf_enter_vf_flr_guc_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_GUC_DONE))
> +		pf_queue_vf(gt, vfid);
>  }
>  
>  /**
> @@ -141,14 +1127,22 @@ int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid)
>   */
>  int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid)
>  {
> +	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_FLR_WIP);
>  	int err;
>  
> -	/* XXX pf_send_vf_flr_start() expects ct->lock */
> -	mutex_lock(&gt->uc.guc.ct.lock);
> -	err = pf_send_vf_flr_start(gt, vfid);
> -	mutex_unlock(&gt->uc.guc.ct.lock);
> +	pf_enter_vf_flr_wip(gt, vfid);
>  
> -	return err;
> +	err = pf_wait_vf_wip_done(gt, vfid, timeout);
> +	if (err) {
> +		xe_gt_sriov_notice(gt, "VF%u FLR didn't finish in %u ms (%pe)\n",
> +				   vfid, jiffies_to_msecs(timeout), ERR_PTR(err));
> +		return err;
> +	}
> +
> +	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED))
> +		return -EIO;
> +
> +	return 0;
>  }
>  
>  /**
> @@ -200,15 +1194,32 @@ static void pf_handle_vf_flr(struct xe_gt *gt, u32 vfid)
>  
>  	if (needs_dispatch_flr(xe)) {
>  		for_each_gt(gtit, xe, gtid)
> -			pf_send_vf_flr_start(gtit, vfid);
> +			pf_enter_vf_flr_wip(gtit, vfid);
>  	} else {
> -		pf_send_vf_flr_start(gt, vfid);
> +		pf_enter_vf_flr_wip(gt, vfid);
>  	}
>  }
>  
>  static void pf_handle_vf_flr_done(struct xe_gt *gt, u32 vfid)
>  {
> -	pf_send_vf_flr_finish(gt, vfid);
> +	if (!pf_exit_vf_flr_wait_guc(gt, vfid)) {
> +		xe_gt_sriov_dbg(gt, "Received out of order 'VF%u FLR done'\n", vfid);
> +		pf_enter_vf_mismatch(gt, vfid);
> +		return;
> +	}
> +
> +	pf_enter_vf_flr_guc_done(gt, vfid);
> +}
> +
> +static void pf_handle_vf_pause_done(struct xe_gt *gt, u32 vfid)
> +{
> +	if (!pf_exit_pause_wait_guc(gt, vfid)) {
> +		xe_gt_sriov_dbg(gt, "Received out of order 'VF%u PAUSE done'\n", vfid);
> +		pf_enter_vf_mismatch(gt, vfid);
> +		return;
> +	}
> +
> +	pf_enter_vf_pause_guc_done(gt, vfid);
>  }
>  
>  static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
> @@ -226,6 +1237,7 @@ static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
>  		pf_handle_vf_flr_done(gt, vfid);
>  		break;
>  	case GUC_PF_NOTIFY_VF_PAUSE_DONE:
> +		pf_handle_vf_pause_done(gt, vfid);
>  		break;
>  	case GUC_PF_NOTIFY_VF_FIXUP_DONE:
>  		break;
> @@ -284,3 +1296,159 @@ int xe_gt_sriov_pf_control_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32
>  
>  	return vfid ? pf_handle_vf_event(gt, vfid, eventid) : pf_handle_pf_event(gt, eventid);
>  }
> +
> +static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_exit_vf_flr_send_start(gt, vfid))
> +		return true;
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WAIT_GUC)) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> +					control_bit_to_string(XE_GT_SRIOV_STATE_FLR_WAIT_GUC));
> +		return false;
> +	}
> +
> +	if (pf_exit_vf_flr_guc_done(gt, vfid))
> +		return true;
> +
> +	if (pf_exit_vf_flr_reset_config(gt, vfid))
> +		return true;
> +
> +	if (pf_exit_vf_flr_reset_data(gt, vfid))
> +		return true;
> +
> +	if (pf_exit_vf_flr_reset_mmio(gt, vfid))
> +		return true;
> +
> +	if (pf_exit_vf_flr_send_finish(gt, vfid))
> +		return true;
> +
> +	if (pf_exit_vf_stop_send_stop(gt, vfid))
> +		return true;
> +
> +	if (pf_exit_vf_pause_send_pause(gt, vfid))
> +		return true;
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC)) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> +					control_bit_to_string(XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC));
> +		return true;
> +	}
> +
> +	if (pf_exit_vf_pause_guc_done(gt, vfid))
> +		return true;
> +
> +	if (pf_exit_vf_resume_send_resume(gt, vfid))
> +		return true;
> +
> +	return false;
> +}
> +
> +static unsigned int pf_control_state_index(struct xe_gt *gt,
> +					   struct xe_gt_sriov_control_state *cs)
> +{
> +	return container_of(cs, struct xe_gt_sriov_metadata, control) - gt->sriov.pf.vfs;
> +}
> +
> +static void pf_worker_find_work(struct xe_gt *gt)
> +{
> +	struct xe_gt_sriov_pf_control *pfc = &gt->sriov.pf.control;
> +	struct xe_gt_sriov_control_state *cs;
> +	unsigned int vfid;
> +	bool empty;
> +	bool more;
> +
> +	spin_lock(&pfc->lock);
> +	cs = list_first_entry_or_null(&pfc->list, struct xe_gt_sriov_control_state, link);
> +	if (cs)
> +		list_del_init(&cs->link);
> +	empty = list_empty(&pfc->list);
> +	spin_unlock(&pfc->lock);
> +
> +	if (!cs)
> +		return;
> +
> +	/* VF metadata structures are indexed by the VFID */
> +	vfid = pf_control_state_index(gt, cs);
> +	xe_gt_assert(gt, vfid <= xe_gt_sriov_pf_get_totalvfs(gt));
> +
> +	more = pf_process_vf_state_machine(gt, vfid);
> +	if (more)
> +		pf_queue_vf(gt, vfid);
> +	else if (!empty)
> +		pf_queue_control_worker(gt);
> +}
> +
> +static void control_worker_func(struct work_struct *w)
> +{
> +	struct xe_gt *gt = container_of(w, struct xe_gt, sriov.pf.control.worker);
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	pf_worker_find_work(gt);
> +}
> +
> +static void pf_stop_worker(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	cancel_work_sync(&gt->sriov.pf.control.worker);
> +}
> +
> +static void control_fini_action(struct drm_device *dev, void *data)
> +{
> +	struct xe_gt *gt = data;
> +
> +	pf_stop_worker(gt);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_init() - Initialize PF's control data.
> + * @gt: the &xe_gt
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int n, totalvfs;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> +
> +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> +	for (n = 0; n <= totalvfs; n++) {
> +		struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, n);
> +
> +		init_completion(&cs->done);
> +		INIT_LIST_HEAD(&cs->link);
> +	}
> +
> +	spin_lock_init(&gt->sriov.pf.control.lock);
> +	INIT_LIST_HEAD(&gt->sriov.pf.control.list);
> +	INIT_WORK(&gt->sriov.pf.control.worker, control_worker_func);
> +
> +	return drmm_add_action_or_reset(&xe->drm, control_fini_action, gt);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_restart() - Restart SR-IOV control data after a GT reset.
> + * @gt: the &xe_gt
> + *
> + * Any per-VF status maintained by the PF or any ongoing VF control activity
> + * performed by the PF must be reset or cancelled when the GT is reset.
> + *
> + * This function is for PF only.
> + */
> +void xe_gt_sriov_pf_control_restart(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int n, totalvfs;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> +
> +	pf_stop_worker(gt);
> +
> +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> +	for (n = 1; n <= totalvfs; n++)
> +		pf_enter_vf_ready(gt, n);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> index 405d1586f991..c85e64f099cc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> @@ -11,6 +11,9 @@
>  
>  struct xe_gt;
>  
> +int xe_gt_sriov_pf_control_init(struct xe_gt *gt);
> +void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
> +
>  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> new file mode 100644
> index 000000000000..11830aafea45
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> @@ -0,0 +1,107 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_PF_CONTROL_TYPES_H_
> +#define _XE_GT_SRIOV_PF_CONTROL_TYPES_H_
> +
> +#include <linux/completion.h>
> +#include <linux/spinlock.h>
> +#include <linux/workqueue_types.h>
> +
> +/**
> + * enum xe_gt_sriov_control_bits - Various bits used by the PF to represent a VF state
> + *
> + * @XE_GT_SRIOV_STATE_WIP: indicates that some operations are in progress.
> + * @XE_GT_SRIOV_STATE_FLR_WIP: indicates that a VF FLR is in progress.
> + * @XE_GT_SRIOV_STATE_FLR_SEND_START: indicates that the PF wants to send a FLR START command.
> + * @XE_GT_SRIOV_STATE_FLR_WAIT_GUC: indicates that the PF awaits for a response from the GuC.
> + * @XE_GT_SRIOV_STATE_FLR_GUC_DONE: indicates that the PF has received a response from the GuC.
> + * @XE_GT_SRIOV_STATE_FLR_RESET_CONFIG: indicates that the PF needs to clear VF's resources.
> + * @XE_GT_SRIOV_STATE_FLR_RESET_DATA: indicates that the PF needs to clear VF's data.
> + * @XE_GT_SRIOV_STATE_FLR_RESET_MMIO: indicates that the PF needs to reset VF's registers.
> + * @XE_GT_SRIOV_STATE_FLR_SEND_FINISH: indicates that the PF wants to send a FLR FINISH message.
> + * @XE_GT_SRIOV_STATE_FLR_FAILED: indicates that VF FLR sequence failed.
> + * @XE_GT_SRIOV_STATE_PAUSE_WIP: indicates that a VF pause operation is in progress.
> + * @XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE: indicates that the PF is about to send a PAUSE command.
> + * @XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC: indicates that the PF awaits for a response from the GuC.
> + * @XE_GT_SRIOV_STATE_PAUSE_GUC_DONE: indicates that the PF has received a response from the GuC.
> + * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
> + * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
> + * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
> + * @XE_GT_SRIOV_STATE_RESUME_SEND_RESUME: indicates that the PF is about to send RESUME command.
> + * @XE_GT_SRIOV_STATE_RESUME_FAILED: indicates that a VF resume operation has failed.
> + * @XE_GT_SRIOV_STATE_RESUMED: indicates that the VF was resumed.
> + * @XE_GT_SRIOV_STATE_STOP_WIP: indicates that a VF stop operation is in progress.
> + * @XE_GT_SRIOV_STATE_STOP_SEND_STOP: indicates that the PF wants to send a STOP command.
> + * @XE_GT_SRIOV_STATE_STOP_FAILED: indicates that the VF stop operation has failed
> + * @XE_GT_SRIOV_STATE_STOPPED: indicates that the VF was stopped.
> + * @XE_GT_SRIOV_STATE_MISMATCH: indicates that the PF has detected a VF state mismatch.
> + */
> +enum xe_gt_sriov_control_bits {
> +	XE_GT_SRIOV_STATE_WIP = 1,
> +
> +	XE_GT_SRIOV_STATE_FLR_WIP,
> +	XE_GT_SRIOV_STATE_FLR_SEND_START,
> +	XE_GT_SRIOV_STATE_FLR_WAIT_GUC,
> +	XE_GT_SRIOV_STATE_FLR_GUC_DONE,
> +	XE_GT_SRIOV_STATE_FLR_RESET_CONFIG,
> +	XE_GT_SRIOV_STATE_FLR_RESET_DATA,
> +	XE_GT_SRIOV_STATE_FLR_RESET_MMIO,
> +	XE_GT_SRIOV_STATE_FLR_SEND_FINISH,
> +	XE_GT_SRIOV_STATE_FLR_FAILED,
> +
> +	XE_GT_SRIOV_STATE_PAUSE_WIP,
> +	XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE,
> +	XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC,
> +	XE_GT_SRIOV_STATE_PAUSE_GUC_DONE,
> +	XE_GT_SRIOV_STATE_PAUSE_FAILED,
> +	XE_GT_SRIOV_STATE_PAUSED,
> +
> +	XE_GT_SRIOV_STATE_RESUME_WIP,
> +	XE_GT_SRIOV_STATE_RESUME_SEND_RESUME,
> +	XE_GT_SRIOV_STATE_RESUME_FAILED,
> +	XE_GT_SRIOV_STATE_RESUMED,
> +
> +	XE_GT_SRIOV_STATE_STOP_WIP,
> +	XE_GT_SRIOV_STATE_STOP_SEND_STOP,
> +	XE_GT_SRIOV_STATE_STOP_FAILED,
> +	XE_GT_SRIOV_STATE_STOPPED,
> +
> +	XE_GT_SRIOV_STATE_MISMATCH = BITS_PER_LONG - 1,
> +};
> +
> +/**
> + * struct xe_gt_sriov_control_state - GT-level per-VF control state.
> + *
> + * Used by the PF driver to maintain per-VF control data.
> + */
> +struct xe_gt_sriov_control_state {
> +	/** @state: VF state bits */
> +	unsigned long state;
> +
> +	/** @done: completion of async operations */
> +	struct completion done;
> +
> +	/** @link: link into worker list */
> +	struct list_head link;
> +};
> +
> +/**
> + * struct xe_gt_sriov_pf_control - GT-level control data.
> + *
> + * Used by the PF driver to maintain its data.
> + */
> +struct xe_gt_sriov_pf_control {
> +	/** @worker: worker that executes a VF operations */
> +	struct work_struct worker;
> +
> +	/** @list: list of VF entries that have a pending work */
> +	struct list_head list;
> +
> +	/** @lock: protects VF pending list */
> +	spinlock_t lock;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> index 40cbaea3ef44..28e1b130bf87 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  
>  #include "xe_gt_sriov_pf_config_types.h"
> +#include "xe_gt_sriov_pf_control_types.h"
>  #include "xe_gt_sriov_pf_monitor_types.h"
>  #include "xe_gt_sriov_pf_policy_types.h"
>  #include "xe_gt_sriov_pf_service_types.h"
> @@ -23,6 +24,9 @@ struct xe_gt_sriov_metadata {
>  	/** @monitor: per-VF monitoring data. */
>  	struct xe_gt_sriov_monitor monitor;
>  
> +	/** @control: per-VF control data. */
> +	struct xe_gt_sriov_control_state control;
> +
>  	/** @version: negotiated VF/PF ABI version */
>  	struct xe_gt_sriov_pf_service_version version;
>  };
> @@ -30,12 +34,14 @@ struct xe_gt_sriov_metadata {
>  /**
>   * struct xe_gt_sriov_pf - GT level PF virtualization data.
>   * @service: service data.
> + * @control: control data.
>   * @policy: policy data.
>   * @spare: PF-only provisioning configuration.
>   * @vfs: metadata for all VFs.
>   */
>  struct xe_gt_sriov_pf {
>  	struct xe_gt_sriov_pf_service service;
> +	struct xe_gt_sriov_pf_control control;
>  	struct xe_gt_sriov_pf_policy policy;
>  	struct xe_gt_sriov_spare_config spare;
>  	struct xe_gt_sriov_metadata *vfs;

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>



> -- 
> 2.43.0
> 

-- 
