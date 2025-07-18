Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320B1C83F17
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 08:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB3210E925;
	Fri, 18 Jul 2025 08:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTq2+SEP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0ECD10E925
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 08:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752826716; x=1784362716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=IaJfvsaezIePQClxxp4UXdW9ebbcjO8yK6VpCym4PpU=;
 b=MTq2+SEPY3SFsYnLNrOBbtGeurGUZaSb5novMDbR9y8QQrh+I2l22bVu
 rzdvC5dSyi5xknVvZj4o3CEI2AxN8u7y4TznbdpUgPJnvskbPd+JtyM3g
 XQKbsF2nXvgJXYZ2ZFtryYM20XcqtIE7whmgh11pkDBwf303CkxF8lCs7
 yhmNcHqQ7W1nVTklbyPhGsKbTV8l5hwte5I8I9vWgSOl0CN/rAgAheynE
 Wsw6XWxdbv5MK4QP6kmrZCgnkFha5QnWSRST2MbkeuQkBOBDVRFgTGJiW
 tkkrOVZs/ULS7DPE434kyeJzUJr/yKilMURvzDoyJLSubm20yxaAdMnwc Q==;
X-CSE-ConnectionGUID: qVFeObxgRhGZQgnMsi+ZuQ==
X-CSE-MsgGUID: 8qzOzoVVRiaVzIqcNUhw2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="77653046"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="77653046"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 01:18:35 -0700
X-CSE-ConnectionGUID: uwmRa0fuRvuh1VcWsIVJHA==
X-CSE-MsgGUID: x/TLLhX0RP6TLUlUjGQ+jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="158358831"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 01:18:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 01:18:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 01:18:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.44)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 01:18:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAUvIXc14kSUfyeLgn8zFGm5yItrXJUju5+UC724OQPG0yNBCkJq5gLuPDAidXBPh7VqETHowTojD6Hn229d8p1ekFpk583a/QuOOnnze541o/Rq9JiDLdCzuUUwpLnn0npIv94z03X4WUtT8p0LYuvAcMGcjlNHUcGOULRpFrabvGJ49kjTiB0kOM2797DCTWlRTjcZX/kdEYUKdan33q0ySbMa5LQAyeiq/g5g6WFpBcifOHLrwJkMWmA63qHxGTNn1Kb5ENQbAcx28ZNvjoqLmoTwjDRLRoEUoqk2kecgpyRrO66W1n++eyjdAkTioDis1N0eq039CgV1YmLapA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcOhmUoMhMFGAYzd18fKNml6fmKbtzPZPyHj3CO6mOY=;
 b=SWRLcOlrJ3XzTItijlKpojGi8adOTgt+iKS5TzCrMrOhMjSDbYkTx/iBM4rKsL3VwqH7556Gflhog5X2YerELCB+WPegaVq3J4m4AT1DoblYkc+fnPsiDXkQVXc2JRLMSQwCPbXxydQhf+sHQpzYfONELtVt9aZYzDr+we3x8YRaZqCw0q5fH3JfmwRJQZBQ090msOOL1sRp8VH6jaU98ihaazm+lPEUS182J1DFkxiWqNAsbGe7kDIQkvzA65/BPs/OdmT0wPqpoWEzI6lNNR4hEhVcporQn6EZ6uiVkYWypUKs54M4NV+1DNtE/gpgoWb4Y1rg5Eb+pWToN9XDHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB4807.namprd11.prod.outlook.com (2603:10b6:510:3a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 08:18:17 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 08:18:17 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 4/4] drm/xe/pf: Force use user VRAM for LMEM provisioning
Date: Fri, 18 Jul 2025 10:17:52 +0200
Message-ID: <20250718081752.630122-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718081752.630122-1-piotr.piorkowski@intel.com>
References: <20250718081752.630122-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0163.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB4807:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a657c3-cfd4-4c79-1b9b-08ddc5d3a5fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVZleWx2WHZnSTVEdThacjNrR3QvMWxpYUhucDA3bHowY3g1c3hzNlowZlZk?=
 =?utf-8?B?UDZyVDJrU1RnL1FYb1hXaENVNExySDBISXRvQzNuek0xNWx1bVhCbFNPY0Ew?=
 =?utf-8?B?MU82UHJvektrZkRxT3RrSlVubVZROTlqY2h2TWJiTTY1RHMya0FuS28rTTFm?=
 =?utf-8?B?NE9ia1NWWmwwcnd6VHVHQXdJc1AraS9seTFiWXdhbFhvQ1lMR1JtbHY0czBL?=
 =?utf-8?B?dUlldnpha3kvRGdFR2YvdjJ6VjN4VWhQZlI4ZThmTGRjc000cUltbmx1SHcy?=
 =?utf-8?B?aHl6YXR1T29JREZwVDE3eFNCdUpwWGQvQUNyWC9qS2JEZmtGRklWV09CM01V?=
 =?utf-8?B?WEpFVjJLbHVPVnQxTTFwb085M1l1TjBGb3hlL0h3dkZZUjhRZlNHKzNYbFBm?=
 =?utf-8?B?SVZlenhvRUd3dlVBOVhYQTBITmtlaGpLWTh2dHVzOEdOLzc5MFhRcHdLWVBD?=
 =?utf-8?B?Q2JiSDdOek8rMC96UFpnTmZJWWlQWXlaOEJuSVpFYU12dGhUWEl6UzFDam41?=
 =?utf-8?B?TEVMYWJaK0IzRGZnV3krZCsxVHczb0NSMEt6MHhzZ2pFc1crbTUrd2drcUpX?=
 =?utf-8?B?dWZnUUdkMFpQeTNTeTBoeTVoNWNpNjNYR05nb0kwSTQ5YSsrYnJxMVpLRStN?=
 =?utf-8?B?dGFrbTV0K3R6YzV3b2NCQkxmU0k2U0NQamtYVnpCSitYc0pxM2wzVWp1WHlj?=
 =?utf-8?B?YUdyNllQSG1UQjR4a0RKV1FZWmo5d0FSK0t6U00yOTJ1WkFOUXFlcXJjRk02?=
 =?utf-8?B?NTliU3oycXA1T2VBdFBhbmY5b3hLNGdMYkVBaUp5cndZOVpsOTIyUTM2MGhy?=
 =?utf-8?B?aE92ZG5nbCt5U2dYNEVVQTgyWG1HK1JEbkZZYUlCYXhpRnVRM1RvQnFvL200?=
 =?utf-8?B?M1VmRXFqTnR4MGJVbXl3b0FSMW14MWNXOVdBQXhDZXdXbW1UMlRveGc3NUUw?=
 =?utf-8?B?cjZnRHhERHZIbDdyNmdFNisrcThISmlXbUE5UCt1SEU3SG9GRkU0NWExUzBy?=
 =?utf-8?B?UUIwN1V6dHlZMld4WEROV0M5MG91Z0N4OVZlVU5GN2gyc1ZWTlZOejdVK0lo?=
 =?utf-8?B?Q3NaWDBxNnpJeDR4OTE0Mk1BMGhUSXFldVd2UlFtTEg0S2l3blBxYzhTTHI4?=
 =?utf-8?B?U2g1NHpvMGNlb0Rhb0NPYkEyMFNHbWxSUjJpdDZ5MzArM0pJTmVnMjVHRjZR?=
 =?utf-8?B?eDd3ajc5eU1qbndEd0ZnL2l2TTVHUTFSYWkxNlFyT3E2STkwSHlxSmVuVEdI?=
 =?utf-8?B?MFBSVEl1L1FtdGtBYlJRV0h6NVdqTjdKLzVNRkpoZDc4YVkrWS9GTW1QNTBX?=
 =?utf-8?B?aXFnYW1NLzhadmpXMm43T0hLRXFGdW1KVDkvNkNKU043c055VWFvVE0xbjg1?=
 =?utf-8?B?YlJsbGZBZElCZ2xWQk9XbkY5eUxFRjNTTW0yNFFNbHVPV1JsaHl3V1dBMHJI?=
 =?utf-8?B?cU9yT2kyUTEyU1hmMGRURnY2SkhxdEpPWWc3cjBoOWxoR2wydDF4Vkw3QTUr?=
 =?utf-8?B?YWorckd5WFpCNUx3TlU0cU1hRVQweFlEaEtHcTdjTjJBVTMybFpGeFppLzF1?=
 =?utf-8?B?ZGFMV1NTZjFIN3ZrcjJoVldWNWJ5ZjZtVFlQRkIremFnUVQ0RXZETUxqckt3?=
 =?utf-8?B?R0JZeGRQNFcrZ2NTQkNDZnN0SFlxNGgyb0dXcm55cGFmMmlzYjhNM1lCVEJP?=
 =?utf-8?B?T1ByWnlqajJsQ2tINmwxTlE1aXBxWFJlamNWdmR3RUYyTlNPNHM3S1BoK1d5?=
 =?utf-8?B?NURvQ0pWMVhRTG5zc0lhdVQrNUx6c1gzRCtlY1ZTOVJsN3hYSFo1VWdSTHAz?=
 =?utf-8?B?Q2Y0SnJJbnhPWGhRVGhUSS8wTFZDbHVnaGFMbUEra241MFQvK2t6eGU3ZU5a?=
 =?utf-8?B?am43VWFidENIK0x1NlRneldHaXFlQVY5dHhhcWg0TFhRNUJvRmdwTFRxMy9z?=
 =?utf-8?Q?EzbnSdw7+fA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHJxRWNXa002VkZrWnJKUTFBSUZrYmZ6WGdCZ3dYaGljRzgzcU5COTVFODBY?=
 =?utf-8?B?TmxHcWUwODVDb2FkQ2Vtc0h2dXNVVmxUaElWdVl4SWgwSmJtR2RaOGNIZlVv?=
 =?utf-8?B?ME9aV1B5SlhDeS9wRzFNdkcrL29xNDI0dEJpOWFsdHppYlZKa0ZaQnczaHBM?=
 =?utf-8?B?c3JyVmtleUE3M1NnVVV4VjJYNWdLYU9sZkNwb0FETWhCdithUGgvbWZTRCtZ?=
 =?utf-8?B?M0UyelJmbVVNZ2lvSHBpMy9TWExqRk4xNjVPVXo3Z3FETys1SEwwU1ZHZEk1?=
 =?utf-8?B?K3ZuMk9JUjdaaklXbGpsdGs1OEtUb2JRdjlHRzhZSGRTcmp4Y1FUd08xSDFG?=
 =?utf-8?B?WTkwczJWSEFubmhLOEdvVVo2bUp4MWw2QXRobVJieXI4RFhPZnlSQ1VqcTdZ?=
 =?utf-8?B?a1ltS1ZQd1l1M2Z1b2JtRjE4cXFJN0VpMEliU1FqZTlGTmlOTWlpSnJGUVZn?=
 =?utf-8?B?T2RQZDExeUFGVy9nN3FZTml0aWlUY29lYmhwOE5URHNwRzZDMjdiQ053Ly9B?=
 =?utf-8?B?d1lZNzFsbWYxbWRmdVJUUnl4dGZRSDl6SGt3TnFLeFJuamZPTk9zL1RJTjVN?=
 =?utf-8?B?aTUwdUJRWUE5eHY4SGcxSDVrZVZCSkpDVzVGWE1TbFgzR3NPTytKVzllaG9Q?=
 =?utf-8?B?VE9RNURxaU9XamtteExwRG9rRk9mQ2p2WWhYSzkxUk9kQnRoWVhxd3R6cHJJ?=
 =?utf-8?B?RVE4djJEZXBlM3Q5MEpNemVteFA1b1Rvay9ORm0reGh3N21FUC9OT0EvelQr?=
 =?utf-8?B?VUZFdVF3cEtaWldsbWxUeXRNRHFNMEJNNmR1Zit3RTladUloMW9QTktBaVhx?=
 =?utf-8?B?TFhHZlc5NkVqZlhNSlBCZmttb29RZ2RMUXl1MkxWSldvWGppSkFTS05WclJU?=
 =?utf-8?B?bTFzQXFzeEMvMmtCSHJmakRUS2o3OFUxQ1VBVFNpNWUrc0lUT0xnbFc5cHhO?=
 =?utf-8?B?VksvVkFjZHVvbzhZZlkwQ3g3MFBpbVFHc0dIbGptdExqYkhJRldMMHpicmdV?=
 =?utf-8?B?bEJkRVk2bjUvdEQ2MUQ0b1VkN0lIQ0YvazVURURhbEh6dGdIM0dNOW14Wkd1?=
 =?utf-8?B?Z2gwcE9YMEtlaXlacU1talBLaFROWFp2ZUJUVVg5NjNYY1ZBdVN5c3p1Tjhi?=
 =?utf-8?B?WmhRVkp2K1c0RnVRUWN3UDFaanI1VDNCVVpGU1VlVlNmbjE0Z01QaHc1R2JD?=
 =?utf-8?B?OTdMRnJ1MlNqV0l0cEQ5Mlk5alMyTTdQemt3VDlmbEszcTFkWHY4UUNIeVZa?=
 =?utf-8?B?MWVNeUF4b0RCZjlhaS9hUHRYY2JERytCZlVJVDNSMTlKbUVTSUdOUW1Idm54?=
 =?utf-8?B?QWE1TzRJZkhxOHRucGNKNXNxd0xGUXNmMnpJd1F6SmVvK2wxMTFSZWJSd0dY?=
 =?utf-8?B?NjdCV2ZNRjl2VzFLbENyMTRuc1hNWmxFd3p6dDN1NXBlek5ZL1F1UXEzaW1x?=
 =?utf-8?B?Ym5rWk9hMmhWcU1kb0E5QVgyejlwdXZMa2s5bFNLdjYrcnBoYWZVUWN1cDNu?=
 =?utf-8?B?cEpkZWJ3QzBOMDlBWklXcXQ2dERLTkZrWWxXSFQ5alpwczQ0LzhNS3Axd0hB?=
 =?utf-8?B?bWZ1NTd5MlI0aCt0a0Z6K1dMWEdSNGVNeVNvcTZIMEVVQXJjcFVVbFhIL1lW?=
 =?utf-8?B?NjdFd3oyallTWTZ1Y1lDTEhhSnk5T2hBUDlocXhVTFd4aFhtYitCblRZUjdx?=
 =?utf-8?B?VVRIam9DaTVNWTMxTDYxWjZxKzhuR1oza0dENkl5d1pUVFdnWEJIRzlpVVRu?=
 =?utf-8?B?SlJBVXZsdzAyT3RGb1M3Y2ZVNzFiY0tnSDlFU1cyK200ekNkeE1Td0pHaEVa?=
 =?utf-8?B?aWJVWEdwWm9DdEpQNlR6NTlEaWpkamQ4ckxlcURobXpMQ3NhRHpIVjF5bG1E?=
 =?utf-8?B?V3Z2c2FPZmcxMUplSnliNy95YUxzN25KcHJGMmVQSGM0cWViTWdXZTk1TnVz?=
 =?utf-8?B?Ukg2ZkJRa2c0MHErWVRyZ3p3dEUzWlZjaHhaeEx2anlQdjg3YW9Yd1l6YkM3?=
 =?utf-8?B?Vlk3ckd1c2kvR1ppcUZ5UlljYjBuZUVCNmZvdVVGVXFaaWlNUnFYRmh1Smli?=
 =?utf-8?B?TzVOWlFab3AwVVZZZjBtdmdUd2Y1elM1cVBPWHRUR2d0ZGVkd3NzT0I2KzNP?=
 =?utf-8?B?cHlBUFV3WmFmN1RMcmhOOEM2RzBXYVRBQm5LeW5CMUZXczRRRjNQakI5VldU?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a657c3-cfd4-4c79-1b9b-08ddc5d3a5fd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 08:18:17.1653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKYjUsLvy9ytQpS61sG4oLQuAT+kEmmHDoE5jcDqluRD/idAELrXhs9XNmL5XAX/sy2iM/uQXXYT29LoMcNXoBPcL8YHec9kDqAflH6/WHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4807
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

The LMEM assigned to VFs should be allocated from the general-purpose
VRAM pool, not from the kernel-reserved region.
Let's force the use of general-purpose VRAM for BOs intended for VFs.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index f00cce81f1ff..38be18777658 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1481,7 +1481,8 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				 XE_BO_FLAG_NEEDS_2M |
 				 XE_BO_FLAG_PINNED |
-				 XE_BO_FLAG_PINNED_LATE_RESTORE);
+				 XE_BO_FLAG_PINNED_LATE_RESTORE |
+				 XE_BO_FLAG_FORCE_USER_VRAM);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-- 
2.34.1

