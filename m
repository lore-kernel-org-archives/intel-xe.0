Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B58ECAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 16:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3092E10E051;
	Fri,  3 Oct 2025 16:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="erFeI/3/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD1010E051
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 16:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759508798; x=1791044798;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=AoiBcUIUG6MHFtutrmY0Ei12yg6OmdC7GmzrR+9nTn4=;
 b=erFeI/3/+0vtYV8tVUstG9pOEUYYeJn5GQ8KxgThy98m+ElM1JpDwz28
 fPEeQv7hGhogLS3XO6bAR9E7KiYWpDQxDaDdXN3FHlhLeIKSFiUG4ueDH
 LSWLxwEPCcRvWlRlLfrglvGRAW3NajEoVxpCoCFVe0jnhQvtI9EL8qIhl
 O74DNM2M58H64zuJ+K2xdjjYkUAv0+eOKe2gSugH3EkEkGwoO7toFRyup
 wZeJ0R4FdKOgy8KhmWHd0+XG/F1lNpip4fWCfCkA7ECWBYJT17xSMyRv+
 tVRAjRqyjum4U/3z/kp8o/+c1pevd1pbwlKx+3Sz5cyj7jZSSCbPyo+fU g==;
X-CSE-ConnectionGUID: zYSOpuIbTIm5Jnfck3vf4w==
X-CSE-MsgGUID: 6v47sQgDQ+6aEuPAwEr33w==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="73147097"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="73147097"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 09:26:38 -0700
X-CSE-ConnectionGUID: zYGT4sXESN21DE9IbdUTDw==
X-CSE-MsgGUID: hGdzJsGKQpej04PqB92K1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="183345693"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 09:26:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 09:26:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 09:26:37 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 09:26:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5Ou/bEB65hFutAuclGUTtA0wTYTliRAKDcFtTwn9GSpHdklzzEhv6EscgRJynpmOzzILzcyVOMU9EZ6Tysxm+3MVe6b+0sq1Ik3rCOVoBPr7+SyJu4fgmDDUAvv3inXqH6fN6h7+F/vrQ/DpglsQvIwjra77mrHWrvm4yTvdQjxC2+NGUyMQtfCBuetn4HMzYusFyOjC0Pw/rQQ7OrjJhSCRvcgo+c869sxx5KERwRFVuF8A27qzx0nk01cIr5ZvJSgFn1/UqBDR4QaA/fE7vqc1zmfOG9Zg58dfAshROLBFzslF0eLTZwurmRQXVKYPwvzKakdCgVoTbvUoN1zTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2Yn+xuCMmeXblQ3CYoKuSbNNlAhFWGH/ufF6H7KRQQ=;
 b=JQfzeQnfL4bIovrwF+nXCtAtWPdEZY+USTZsf2zeY8QWzgQo7wh8UJGOluTaCges7U+vdjUAELlJu0aNNBgHkTRFBadQKEDySncOR4Cwft5wK+LZRpbjHK0Zxu66ET6M8w+LR7wuuue+vYzO5a4mB6dhL/CLExfw1PMspdx6/uUfj632hJ2f4YBTB5cCxzKtGmutgyflFWDpkjPyu9Hqo8KpNmb7QHBjLfB2UqxHFJoURpyjJgHkUsV3M4LgkBA77trED+tWZwgQr9bxgDdmQ1td3kL8XFKPu1R796Fh7QDvYn3oTHIi5i7g8JxzFeNHyiVRTjZQ8i2kmujF5ULw9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Fri, 3 Oct
 2025 16:26:34 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 16:26:34 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v5 0/5] Preliminary support for separate VRAM region for
 kernel allocations on tiles
Date: Fri, 3 Oct 2025 18:26:14 +0200
Message-ID: <20251003162619.1984236-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0655.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CO1PR11MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd249dc-9221-4b04-faf2-08de02999e26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXh2bURYV1FaT0QzcnIvZXAxN0tIemt4dVlWRkJFejg3MlB5MEdlSDhJRFV6?=
 =?utf-8?B?dzNPRlkvL2d3eGQvZzFmYk9sL1ZkdUxSdllOV1BobWxEUjR5QzVIRXlqbWhh?=
 =?utf-8?B?WWhza0JTOXZ4WSsva1J1aHVjaTZ5SnhIdnoxUndVcGNvM0JJODRnQmdDekE4?=
 =?utf-8?B?Q1pZWmVrMEVkZ25EQWwvRTkyMXFZd3UzWlNia0UrZkZXSFlSTGFHRll0S0tN?=
 =?utf-8?B?cGNDZ2g0SnR3c2xYbnczdGVqV0tGenhqVXVnSk9OTzVLdDQ1Vk9NSFozQU41?=
 =?utf-8?B?STNJSlhVL2l0Y3hteVRod0s5WnJPQ2laL1ZFWWg4aDVHN1VEVjh4c1VqS2Vm?=
 =?utf-8?B?T2wzUGRHQVhyd3J4SHNIa0lhTThMU0ZqYVF4ZngwZGNhUUdMSWJwL09wdDJr?=
 =?utf-8?B?Zm10b0o0R2xXZFlKYWxTM1dCVmV6U2x4Q3FTa2EwQ2Rncnp1bVdoUno5UmVs?=
 =?utf-8?B?VmZKSVlDVi9ROWd3QTJ6L2hhcWtKOTdITTBnUWZmMlNXaDV5dExEM0ZSV0Zv?=
 =?utf-8?B?K2pFcXpNZ20zK0Z1QVFkb0FRSWdHeWtKTzBzRzVCTU5QTzVHemNudE92K05J?=
 =?utf-8?B?dmRYN3JzQk8weEw1bUdZTzJKOGZ0Q3o4eUtsZjBJL21GbjFHdFp6dXhhK3ds?=
 =?utf-8?B?dkxvWDRadnhLSjJpUU5RQXV0TnlOWGxQS0VSdFFXM0kxNjVZaGZRSXVXdkpt?=
 =?utf-8?B?eTZDblNpblJ4UVQxUjNMVzR4RzZhL3VvSWR0dkNJR24weWZZRGE4S24yTUQ4?=
 =?utf-8?B?M0M1aXJsVCtSUDdHS0VqZURlTEtRSjJhU1dQeThwbHhFMmNQL1NUbjAvd1VD?=
 =?utf-8?B?WUd1bnhpTnJya0dLaEdJSmZZY09HaFoxL250TG8ycVJoL3Q2WVo0VmNHaEZT?=
 =?utf-8?B?MTRhUWVrWTZFR2w3N1NDNGRhR2Jja20zSDR2STl2bzhaZ214a0JQbGRIL0N2?=
 =?utf-8?B?ZGxJbUdzOWx4eHNkSEI5SXMxVTV3UmhKVDgyRUNTM0tBSjdCVHdMb2x0Njdy?=
 =?utf-8?B?ZkFKSWZuSktoV1B5Q2RZMFhKZzdCeWdTcG9tbEhlU2ZPNnkzTXB5Yy9xZ3d6?=
 =?utf-8?B?b3JZS2hSRnhvOThBcE1Dbnp2UExOZ0ZrZVozcGJ2RmNPblo0WjFja202ZFB4?=
 =?utf-8?B?M0gvMWNjZnlGWmJRRHk4SzlzVDlzTG9reVM0NWpsanZkdk1Na0hLdDFFZU9W?=
 =?utf-8?B?Sy9oK2prbjRuVkxoQitpYzZJdlRZL0k0L3R2MmVFSUNlTXR5ZnFHZ3lic3Rs?=
 =?utf-8?B?Tmx6d1ZNWlY3cFFWVmNId25CbmxwcmZmdGpoR0J3TnljcGQvNFZxZTRUNHVY?=
 =?utf-8?B?VlRSVTRCT3QzNTk3QW51OHljdjA4Q0R0QVVsWmZRWmZLTVBGRlJxemtwS2Rr?=
 =?utf-8?B?WGs1V2NTV2ZqT1ZoWHJFRkNzamdLZHlrMXQ1ZXJlMlhYRWEvZGhqWXYvMHBD?=
 =?utf-8?B?REdWZmhNR1RGb0ZoZW91KzNKWU10WTBhWDhjbDhmUnpJRVhUd1Z6U21NaXRL?=
 =?utf-8?B?UlA4RDc1c1BnSWFmUlBDWjhzYmRsVEVDMVZIY3RDSjlncTZGRU54K1hoeUJV?=
 =?utf-8?B?cVlwVURyQWhoN1hmbHo3NjVOQXRlNkVOaXUzZStPS3E2aHRiUmt5RkpndHh2?=
 =?utf-8?B?NUlrT1ZiYUEyd3JrUmhONXBObWV2d3FSUHRHbXZ3UUVDL21TV0Y1R2paK3Rs?=
 =?utf-8?B?d212T2x4WlU4OUVLZmNqTXRPaDVhd3dJWWVZeENkYkppY0ROa0Mxc2k3ZWhq?=
 =?utf-8?B?c0pxbEN5U1o3eGhPTDc2RG14RkNURGpOZTJxVzcvWlBkTDcwSFBnV3lJdktD?=
 =?utf-8?B?Qnd4cEZHVU1JeWlpUGlCa0pzUzNQWWlYcG5qMzAwV2pBZ3Yyd1ZuSmNQemN5?=
 =?utf-8?B?VWoyaDBrVUVyUFpVSFo4RmZ2MEhQOCtVcWJSUFhEQ3BzVlpnakRNZm0wVTZx?=
 =?utf-8?Q?Ar4BC04tu/2fflo5GzQHZdkqAWtbsUSG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXdKclVQT0UvT1pLZ2JHUElVSjZSRHFDS0lUL1ZnQnNKeTJiT2xzYXRCVTVV?=
 =?utf-8?B?VVFSVU8zUkhxakIwSk1RR0dHdE8xeVBzMUNtVTRyMi82b0p2VjdjRU95bTBj?=
 =?utf-8?B?YnpaZmdyWWxVTlczRkFBaWRXQnZWOEtJZThKc2k3d0o3VXFLbDNBcGpKcVl0?=
 =?utf-8?B?bWNHSU9RK0piWEVWYm1VZk5QVUdlakQ0SHNHS3diYXdtU3pkTGN0eUFKUjcx?=
 =?utf-8?B?TTRvdGtlTVhqNDZwOWZJbk03dk5haVZoMVB3Qmo2amY3b2MvVi8rQnh2amY1?=
 =?utf-8?B?R2tCQnVBalcrc0M3ZUVTT1A0NlRVWTFwL0xRYlFaRDlUdGIwSm1KU0RtMzMr?=
 =?utf-8?B?dzdzMzYxSlFRUnhGM3d5ZUdyNWZMTlpOWWFXRXdMdzhFQzNpajN3T0l1TjFs?=
 =?utf-8?B?Rm10RFNodzVYVmxRd08ybGdudHBlcmZrUnEwYTNRRFVLZkJiY1RPS1AwYll1?=
 =?utf-8?B?ZmZFN3E4dWVYajNXNE1jZE5pdHZ3UkVLditxZUNNdGladnJQTzFHQlZCdlNI?=
 =?utf-8?B?bEdpcjNpdGJXdWJRZ28zeE8wU25Gc2Q3V2U4Y3YwWmd1ckUvMXFDVWM5L014?=
 =?utf-8?B?N3ZYenQyanE4SmI2SnNRNCtnc1pPMDkyWnhKSXdxeCtFZzVUQWVjN2JMVTlv?=
 =?utf-8?B?RTI4bndNRFNqTFJCTElOVUtxNnp0WXUxdUtDOGVudkRMa0ZoVHA5S3ZPNHpu?=
 =?utf-8?B?V3hOeVdGK0ZMeTN1NFhMaVZNR2FpVmpSOUVrMXN2bzNJMmM3QkQ2eU1kM1Ns?=
 =?utf-8?B?amZTbjR2aWp3eGN2NklIbTZuUTNsNktucDNBUU5wWE9zYXh4RXZmdzFhT3k3?=
 =?utf-8?B?OW5hOXJZb0Qwd3lORllBV005TTZaT0h5cElOOWErVVRQRzR6TDhVNjhUdHht?=
 =?utf-8?B?UmtJbDluZlNvMVRHbG9UYUJRei9hdWNXL2xHS052anFEUU1CdVAyUnAxZm9B?=
 =?utf-8?B?RTZ2aFROU1hrWmpBT09OTUJDWEhnZjJiR1RrUEIzaURkT21TS2JxUDZVS1V4?=
 =?utf-8?B?aWpDWFRNMDFkNmdvczZ0d2Z3MFlqbVpvNG5tSlNNbUw2SVlLcFRTZFErdVph?=
 =?utf-8?B?TW40MHFnRWhzek1mWUVkWGJ3VUZtOEdSWjFCeSs1ck5oUGJNLzIzSnlESlor?=
 =?utf-8?B?bExFcVVXN2ViZ2dYNzhOVzlsYkRINm5qS1NYYWUvem1nSFdYZTc3djkwRlU2?=
 =?utf-8?B?SmRBcVNUL0oxWnZXQUtUUEt4cllyNzBXTWlSMnpRTmU5SE42bGY0dXN3eTFS?=
 =?utf-8?B?VTM2d0JsK2FpZ2ttSjMrbXMyRGNIZXVtNWNkVU5aZDI3aDJrejlmTURPTkMw?=
 =?utf-8?B?dXJwRmJ2K1ZMazNYQzl0WkZ1b0Y0UUdwdzlJeExXTXN4OElhMjl0YitMN0Nm?=
 =?utf-8?B?ajdNZWpSQzFSTG1RaDdwSUw0L2hPdCt4bHNNVk1ra1hrcTMvRzlGMFczREU3?=
 =?utf-8?B?REZuVHVmdmdHbFNvVWxPVXJqS0h2TjYya25kdE84MEVzUHNUbEtCUW1mL3J4?=
 =?utf-8?B?ZmtiSWk5WTNuck9Bd2tpNzBqczBINytSTkdwSWdxRUlQeXBEREVCRHk0cURH?=
 =?utf-8?B?YWJNb3Y1aTYrNmhyRnFuU2pvYnY2cG9HcEdZb0dBM01iWnYxaGxBTkprQVRH?=
 =?utf-8?B?M250Y3JtcXVadDdQR3ZaQUhVNlNOcDB4TStwNTNORVRXSjgxbm9OVkRXczhX?=
 =?utf-8?B?Mk1JRWplNW5ISCt1ME1FUUxJUko5ejM2WjBLc2toQXowYlMySFcwVTRHTisz?=
 =?utf-8?B?amkrOUhjRU96dkZhTUsyQjlnTmxydDlqUWxCRHo2MG43Z2pYN2tiU1BiZi81?=
 =?utf-8?B?bzhHUUVVbUlEYjlINnFiTXdNU3ZFZmtmNEtRL0t1QjUxMmxmdHJyYjRBVUNS?=
 =?utf-8?B?aVQvaTRZcmlLL2Y5dDJUeWVzRDN1QXUvUzM0dTZjaXVqSkt3MVVBY2hnWHlC?=
 =?utf-8?B?SEwxelhXeDljUzN6ZEQ2MmxBc1lhMlI2MCtlN3JCTDZYL1YvK3MrWEpDZURS?=
 =?utf-8?B?c3VrWXVRZ2tOdVlsbTZKeUcxODl3VDVTekFvQ3poaG9TaVIvalFqNnE4eXNy?=
 =?utf-8?B?ZXJTajZFcDBUTW5hUU5vL1h1K3hQeHFlK2RGQjZJRG5xTGpjdEdJM3FyRE1l?=
 =?utf-8?B?dkdFOCtsek5IKzhRVEFkbzVuTEhrOVI5cWFBeHRITnVNL3VKSkttZzNVdkUy?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd249dc-9221-4b04-faf2-08de02999e26
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 16:26:34.1358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1cdITIQGcnWz9Vx/IM6RbsvDKo3JLLeb1j4o036B8tbjeAs1jbu992uFYzkFKyngIFscgXJwsL+RbGawSrwWbi0mf9kYYdRrmSz1dIlhyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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

Until now, all VRAM BO allocations, whether from userspace or the kernel,
were placed in the same VRAM region assigned to a tile. However, in some
scenarios, it may be necessary to separate these allocations and place
kernel BOs in a dedicated VRAM region.

This series introduces initial support for such separation by allowing
an additional VRAM region for kernel BOs to be assigned to tiles. In this
implementation, such BOs are identified by the ttm_bo_type_kernel flag.

To maintain flexibility, this series introduces a new BO flag:
XE_BO_FLAG_FORCE_USER_VRAM. It forces BO allocations into the
general-purpose VRAM region, overriding the new default behavior.
This override currently applies to BOs associated with user contexts
and BOs used for VF memory.

To preserve backward compatibility on platforms that do not have a
dedicated kernel VRAM region, the kernel_vram pointer will fall back
to the general-purpose VRAM region.

v1 -> v2:
- update commit message of "drm/xe: Introduce new BO flag XE_BO_FLAG_FORCE_USER_VRAM"
- replaced for_each_bo_flag_vram with the improved
  for_each_set_bo_vram_flag helper
- moved the VRAM flag iteration macro definition into xe_bo.c
- drop unused bo_flgas from bo_vram_flags_to_vram_placement in
  "drm/xe: Add initial support for separate kernel VRAM region on the tile"
- use hweight32 helper in __xe_bo_fixed_placement for readability

v2 -> v3:
- rebase

v3 -> v4:
- add 'drm/xe: Combine vm->xef and XE_LRC_CREATE_USER_CTX checks to detect userspace context'
- remove unnecessary VRAM fixup id
v4 -> v5:
- rename "Combine vm->xef and XE_LRC_CREATE_USER_CTX checks to detect userspace context"
  to "Combine userspace context check"
- remove unused function xe_tile_has_separate_kernel_vram
- Simplify the conditions in __xe_bo_fixed_placement

Piotr Piórkowski (5):
  drm/xe: Add initial support for separate kernel VRAM region on the
    tile
  drm/xe: Introduce new BO flag XE_BO_FLAG_FORCE_USER_VRAM
  drm/xe: Force user context allocations in user VRAM
  drm/xe/pf: Force use user VRAM for LMEM provisioning
  drm/xe: Combine userspace context check

 drivers/gpu/drm/xe/xe_bo.c                 | 78 ++++++++++++++--------
 drivers/gpu/drm/xe/xe_bo.h                 |  3 +-
 drivers/gpu/drm/xe/xe_device_types.h       | 10 ++-
 drivers/gpu/drm/xe/xe_exec_queue.c         |  7 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  3 +-
 drivers/gpu/drm/xe/xe_lrc.c                |  5 +-
 drivers/gpu/drm/xe/xe_lrc.h                |  6 +-
 drivers/gpu/drm/xe/xe_pt.c                 |  2 +-
 drivers/gpu/drm/xe/xe_tile.c               |  8 +++
 drivers/gpu/drm/xe/xe_vram.c               |  6 +-
 10 files changed, 91 insertions(+), 37 deletions(-)

-- 
2.34.1

