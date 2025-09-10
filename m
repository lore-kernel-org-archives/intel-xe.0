Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A597FCA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 07:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCB910E87C;
	Wed, 10 Sep 2025 07:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5a1rLOH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840F010E878
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 07:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757489732; x=1789025732;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=PmPi1h6sNaTg8KiKVvnrBMflYf/z2Ir0lGYVu713N+w=;
 b=Y5a1rLOHGhhK7UeiaD6diiC+IjH54SaquzryI9BB7QnMj0omKD6UHSXM
 gCacWYp41JGEuhv1ywWlVAjc40lYzecV4lXnhDBAP3tHMNij+idtgIjr+
 3g6T2Hdyp530u5BhEecJGpoSY2avgZg7RtSSgANXxpKrLxdxbjxHmY1as
 8XGMChUicRbF/0ppGMve1ChyUPSO7obbO7OmWhT9j3xr4j7jBYAw4JANI
 2O3/h2YL/S7pRuoP3LcXUy0+ZS5aVyL6rgJSRyq3Jp5Ob4BvIYb2zkAPR
 chkW44Ahk8TVzgpWs/KGIUNmxofDBIiGjQ/O2Y4idkBZiqB9f7HX+OoNu A==;
X-CSE-ConnectionGUID: hACqMehhQQG+4JfBvU8Mfw==
X-CSE-MsgGUID: +R8uGy8PRUuqV2WtunLkrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="77245164"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="77245164"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 00:35:31 -0700
X-CSE-ConnectionGUID: wpMpeSamRbeXyJ8BP/3LYg==
X-CSE-MsgGUID: ucvFMUsETKCFg+tlNzd/2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="173699266"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 00:35:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:35:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 00:35:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.40)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:35:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZENmP9ynBDDz8aBYuKyv32tBMSeoIHCQe2biDyB9g7+MqkScGX1Z78i/HAo9ihyQtBHwSancjJd7ibuAjp0pD3Cqo+6CUupc4gBjcm5ILqQA3h6OHlEVqdMGUkY4Vwz1aLRSFbtIv0T+8uc3mJ76U+EHGReloxIF7qPbMqRuMPvcWC9alFHM41LRLSaoH/zwjqJ6SRf6BLevqb7lgMupILPONlDIXfYcEYG0gQ0KRO3o9NogzzLjsc+3zIddsIK0Ybo5dMF1HowIZwKFgAzXNhkkUzB8FB+4FqwrjsLx7AZxSI9rfxOVlYFW0RSD6Moq89U1jXbDmw9vTS30LQZgoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmiTD2rnO9iUUmYmaQmTlWp/YsCrTQiAgywjrHii7AI=;
 b=Q1ie4YOXGaHHHzyYi/Vn3GlhTeh3DZOgIV5o27VfCkXNUM3PcXbHqFUthhxeZVPgSBojDmIZ/PZpBZDx0p27xt592lgukWLmYBCttXA7LdbGFTASWhQ0oAnrVYcZ0EML0QfBfitn10KLs2eY0AQTZwgwP86QVoE8gdo4oiU4rpSO25nQ4V3tF0JeO0ugwLjcWlkonb1s86JeQXiPEbEEC3ZrEO/8cG34+vaVcIi8/YohtFXpdTUOX/mTBuVowe2QLets4GvRYpyimxD8a9v5U0sMgZQJpc8Ks1y5MOZwvaXRLF9ulQpkfE5oVeN0N83+hdq0glQBY2YexkL0JlNjMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Wed, 10 Sep 2025 07:35:26 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 07:35:26 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 0/4] Preliminary support for separate VRAM region for
 kernel allocations on tiles
Date: Wed, 10 Sep 2025 09:35:06 +0200
Message-ID: <20250910073510.732250-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::7)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: ab3e5dde-2f9b-4633-e085-08ddf03c9ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjJQclNuUDRSRzBXU1Q0ZzQ1VHkzeFRmLzlZZDJRdkZmR0Rub0pPVyt3aEI4?=
 =?utf-8?B?UTYvQ2x0NVovdkYxMWg5MzJOdkRDWVB2UTBlZ1FYVy9SdnpMdjB1MEtLUS90?=
 =?utf-8?B?TXZ2WWhtSXZqQUZOY0h5TklQUWF2MVJ3VzZjd09VK0EzakFLcFpaQ3NIOUJx?=
 =?utf-8?B?S2FaV3kxRis5VjQ1K0F5Y3A1RG9QU2dYaVdhUDFYVVUrZEhjZFkrTFEyNmd1?=
 =?utf-8?B?TVlsWk5qRHd3OE5PNnZrZlh1b3J3UnN6V1h0QjRTWm9CSEord0ZIVlpuNVAz?=
 =?utf-8?B?VldFVE15MTZNNjlTYm5qUmVNY1FwazBqRWh1VldKTW12Z2VVZU1FQUJpUE90?=
 =?utf-8?B?clBNbjhWTGdsYkRJZk1rSElPWUVMOURxOVlhN0tTVTZ0L1RsbVplNFVDeWRF?=
 =?utf-8?B?Sms1dm9JR1huSkdxRnNHTUEvTjRveTJ0ZjV4ZGlaWkxVK0F5dklHOXpIc0dG?=
 =?utf-8?B?cXhZQnBBUG9relVPcmFkR2t5NlUveWRsMHJQaVgySDVqczEvZmk5VGRvdm1N?=
 =?utf-8?B?ajlmVEtSQXRNZkN0ZExpT2h4OHBLTHRRZkZFRDJIckFqbStSZGlQdkprT1R2?=
 =?utf-8?B?WmtMTUJtVFE1eHdvMlBCZ3V3dUlVRlJQV1kwMVJoQ0wrNC83aFovbDdFaDVQ?=
 =?utf-8?B?SW9pbWp5T1dVUFZkYTl1QlZmd2RaN3R5L3hsN3RxYjVYUGNPNXhIN3VZMTE5?=
 =?utf-8?B?RFdpQkhYWkg4RjlXdWJOZ05ZcDEwR3VDdUwwRlg4MEZMWWkvZTlwSDJzdlZO?=
 =?utf-8?B?SUF3SmkzZ1JjdkloRjh6b1pSVHc0aVkwNmJYdEhyMFlxbTFjOE1JZUIxeS9s?=
 =?utf-8?B?aTdlTHZzNUQxM1RKS1ZmSWNOU2ZtcUFjczA1cXFtV053c3dwNEFYcHM1Znhs?=
 =?utf-8?B?MFJLblU4UURyQURwL1M5NjUrVWIwOEw1WmxQenI1L3VyWVB6SGFRb0R6ZTJt?=
 =?utf-8?B?NG9PWlBxVzJRRDdMVDNDczhkdTFPNjUyL3RBOE1LMU1QZ2xjRmQxRTlyckhz?=
 =?utf-8?B?SXloNkVOSjZBWUhkbEF5dys4Z3d5WFhTYnVOT3JMZGFzZWtvdWJZNm9GbmIz?=
 =?utf-8?B?SEVoU1piakVNRHplZ1d0UUI0QjBMQXZnMG9KZDVid2FMODZvNGlDV21KS2Ru?=
 =?utf-8?B?TnRXdHJLTFEwWHMvL0JzMlVYamFjcmQrN1pBb0lqSWhMTWJJRFJtb2QrYkpQ?=
 =?utf-8?B?S0FQNEhNbnVBOEpqcExpRk5YNEZLY3FmZTk3SzlxR0R1eXg0NUVMZFdBV1Zn?=
 =?utf-8?B?RENLOHR0UG5iQ1pUTDlSUmZoRVozR21CR3piSGxwQzB4cTNURjV4cmFQRC9t?=
 =?utf-8?B?dS9IZkFSbVlEWElkLzE1NHhkT0k3QUxVWHdlaGdoT2VoVnN5Zkp4eU83YlVR?=
 =?utf-8?B?QmZOUjdqL2JRZzdxZUcrWUM4MEY5QnJWcklsdEd3eFc0K1d2RWppR2Z0T2Zn?=
 =?utf-8?B?VG5PV01tbkYxbThJM0xZZmxtbW9XWDd5Q3pvRDBxbTRVb3EwMUlMZXdBM0V1?=
 =?utf-8?B?TVpGdU1aTlF3MVVlOTB2cGlMRnQrOVh0dlV1d3lmb2ZYY2haUHI2V3dwc2E1?=
 =?utf-8?B?K3BmNXZ2YTBPRjFPbUNqRHFMVWpmR3M3K2tCdFlNZkZvLzZ1aDdCUFdSVjVn?=
 =?utf-8?B?MS9nZTFPUlQwOEl1MXA1emVWTi9NMk9ZVGxYNUpub0E4SmRybGx2SWJFa2p1?=
 =?utf-8?B?K2J1K0pTbmJhYnNXREk1ajU0REh4S0p5eTMxVzEyTldLazF5U1VIb1lDbUt2?=
 =?utf-8?B?OUJmUUFzT2RnbGo0VjgvSDhLSzZ6bUNpNDBKSDNNM1BkdTcwNlRUYjhQKzhz?=
 =?utf-8?B?ejlNSnY3YklFQ2oxNENLT29uSVdWZXpHdThONnlJR0Y0ejZ5WjhqbVdFc2xY?=
 =?utf-8?B?d0p3VXhMSDlQdEZrRHpsMldjRHIyaHc5QkdQbHJpVnRiNHpNWk0wbjUyajhD?=
 =?utf-8?Q?VswB/9r57w0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SElxemhOdkpzejJNZ2FRY3ZpeEwyTVhFU0ZnaDAvRFFiNWJLeGZBYnJkNnNF?=
 =?utf-8?B?aWNYV01CbG81d1d0Ynd3QmlIaFV1cTJKejQ2TnhEaEJyc09mVzNuMGVDUkdD?=
 =?utf-8?B?ZUtPbTVRV21zUnVkaEhFbmRLSGZtRGxlWFlVUllmTHY4Q0xKb25tQ2xmT1c1?=
 =?utf-8?B?cUlTcDhkRi9DTXFFOEp4ZzhWRVJaWG5zWG4zdXcxQ2t4MHYrOVZDRUlrd09z?=
 =?utf-8?B?d1FWamFLZjlTck5hdGtMbXpNM2kyR01lelBrN1RlZDY5RG9lRXhKVTc5S1pu?=
 =?utf-8?B?ZEpHcXdHc3JJWFNrTXRVdXFvS1pHNHZnUkt6cTI3SVlab0VOTHVjdEl6Mms2?=
 =?utf-8?B?blZxV0Z5WENSb0dpZmZBcGswRUR1ZURVK1c2dHJGSGM2T1gxSHV2S0UxY3dX?=
 =?utf-8?B?QXgzSHRrRmU0Y1Z6RHNaM29UTHp3cDZVcGxPMkN5WTZlVzNmT1FVZ1d0K1Jz?=
 =?utf-8?B?SEpFY1R1akRHZE0zMDRpY2F0aEhNWlU1eXUyNG1KcW9KZEY2bklVVm5ZMXdH?=
 =?utf-8?B?SC9oVjBHb0w1RFU3UHQvdEJGWXR4SEFhbmEzN0pDcE5SVThKRG1oak4zSG8v?=
 =?utf-8?B?MEQ1aG9kdWt6QmNsNUgva2JFdkI4R0RUOXRkRlhuY2t1NHFZTXMvSGYxa1Fa?=
 =?utf-8?B?R2xVZHYydURydy8zcW1kZ2thMnlKOEhwZVI2VlJIbnJuSmxLNC85TmZBN0xs?=
 =?utf-8?B?UGFMYXdFUTFTSkZMUkZsUFZ3N3N3Wm1pVmRCdGZOby92R1lndEk0YUsxeUEy?=
 =?utf-8?B?Ry9kOGFWSzQwYUt4NDcyZjBqM2lLVkVJOGt4dTFuV0lkcERlNitRUGFIeFhn?=
 =?utf-8?B?REtKT0MwYXArZkNXWDJ3bzRtOEwzNTNtSlppVVdrVEErN2J4M29OU2hLRm8v?=
 =?utf-8?B?YTZGY1FPeXR4UTVTWGFDV0JqbkFpREw2d3RQOXVFaTJuSGVQUXBVVFJNQlZC?=
 =?utf-8?B?T2RUdXI5eUhKZWRqUGlod2tyekFWRmo1VFA3NDhaTndJNklydlMycnppak0r?=
 =?utf-8?B?c2ZxK3BvWHhzakRsVmxEd3pueU5JNFNJQ0tiWGFDcUoydWVzU0pnUUhhNVJK?=
 =?utf-8?B?VEVhcUZTUi94dDd0cGxVZzlHcUtKaUlrdWVJbU5kZ1hBSnJqVUpITE1iM0Zp?=
 =?utf-8?B?QzczZUt6SlBWQkZqZlZLV0wwYVFubWtKTnVwVG4zU2pjcVZOQ0xTb3FrclU3?=
 =?utf-8?B?aGdmL3h4MDMrRzdXbEZSQ2VDTjJzc0QwMGFVdHlHWU53TkhVWTVFUHptV25S?=
 =?utf-8?B?bGtpR0ZxTDZpV0lNSkFEcit1YmNMRmxBOFN2cDRWVkIxL1pjTWtLTGRwdHR4?=
 =?utf-8?B?UnVybExjK2pPanRBRlB2ZERNamlnWEpUOXVDblkzcnNiV3RPNHl6R1I3QnQv?=
 =?utf-8?B?dE9WUk05OElzdjBQSnRKUVdRK2dmSTRQR3V1eHN4R1h4RjRhMEwzSFVORjE5?=
 =?utf-8?B?YXNTV3orb01VUE4vS1o3amV3WG5ETVhtdDhCZDhtbmlCYTliQVhNVldrYjN0?=
 =?utf-8?B?RTdka1J6L0t2QmZGbWNVVUwraUYzd2k5R0J6U0tZRmZ6WFRPYVN1WkFNVVR4?=
 =?utf-8?B?cFRrT2dGc0U2RGUxWUkxbG5xVER1Z1AzeEswMFBQNG1RS25KdGx3K3p0K3Ns?=
 =?utf-8?B?SU5aUk9OUEpFMVdQa0xpUnYyTjhpZDc1ejdydFhYVzFwbmNScDlTZFdQSjQ4?=
 =?utf-8?B?THJIajRSdFRCbVJHZ3V5V04zTldKTStiK21QRU5CU3ZZbWxhQnVrOFBBbHpQ?=
 =?utf-8?B?L3BOemduWkZBTktEdWVydU5IT3E1azJnY0JZZnlmVXpJNW45Yk9TT3F2dnE1?=
 =?utf-8?B?WHpKSFNYQzBHbWtlalVVVFJBRURwbGF0bFh5RVhzbW1BRE5McHdBMW1UMmZV?=
 =?utf-8?B?QXZuNjRZamJxdnJKNDBLbkROY2tHYnJkU0ZCK1BocTZtNnJ1cG1waDR5WGtH?=
 =?utf-8?B?ZUpPMTlZa0IyOURDN2lhdURwN3d1NVREcDZwbktrK0puSUxJQU5aSXZKNk5t?=
 =?utf-8?B?SDUyekFHNStOaFAwRWxtUFdvQkhzR240ejhpZExXWGpxQmhLd05OOXBLbVhI?=
 =?utf-8?B?ZWdLTmZqMEdUeklSVHVLS2tZMmtKL3BIT3M0M3c5cC8rWHZ0ZjloaVJPYUdz?=
 =?utf-8?B?SFdxM3R5clh6MTFFRU5HUU52RnJzOHpQRXJIYUtNZnVXREZ3T2l4bkZCNXBY?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3e5dde-2f9b-4633-e085-08ddf03c9ba2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:35:25.9143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+fmBmxHMy/6pVIU6QJjAV6FSKoFzKReqbAnndKoi3COyQBwmLvxyFOIO3vc4GYbmaWBmcipQP6nLUjgpsT9VKWcrmjBDv+O08WixEXE02Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
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


Piotr Piórkowski (4):
  drm/xe: Add initial support for separate kernel VRAM region on the
    tile
  drm/xe: Introduce new BO flag XE_BO_FLAG_FORCE_USER_VRAM
  drm/xe: Force user context allocations in user VRAM
  drm/xe/pf: Force use user VRAM for LMEM provisioning

 drivers/gpu/drm/xe/xe_bo.c                 | 90 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_bo.h                 |  3 +-
 drivers/gpu/drm/xe/xe_device_types.h       | 10 ++-
 drivers/gpu/drm/xe/xe_exec_queue.c         |  7 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  3 +-
 drivers/gpu/drm/xe/xe_lrc.c                |  3 +
 drivers/gpu/drm/xe/xe_lrc.h                |  6 +-
 drivers/gpu/drm/xe/xe_pt.c                 |  2 +-
 drivers/gpu/drm/xe/xe_tile.c               |  8 ++
 drivers/gpu/drm/xe/xe_tile.h               |  5 ++
 drivers/gpu/drm/xe/xe_vram.c               |  6 +-
 11 files changed, 109 insertions(+), 34 deletions(-)

-- 
2.34.1

