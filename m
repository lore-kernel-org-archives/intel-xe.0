Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B99C8303C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 14:57:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE3810E4C6;
	Mon,  7 Jul 2025 14:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8XnHTRK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EC010E4C1
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 14:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751900236; x=1783436236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SjAIL/hfgO4CvENimhmzZwpTQDNksuIg7nh0kr02wUA=;
 b=T8XnHTRK36dEqNKkiWkm2iV2/d+fIBRQ/ydC0NFeZvo+ObK3GuEO6fJt
 cA3+8v/jbdOqYQVdevvantYDAAyHbKd2d4QJGj2G8rydc7GpJWX2obuKd
 uqq6bmCJCWPVOeSwqMTazTqKHf7ur8bJR2o8QlOsJufo3kiJcyhScG8Hn
 cPaHJGFRkyLM7ibDhyhGCyWNBE6c59iNIIvxiG4go+0n26dQEPo06wqeO
 jwanFNLfUrkJ74+qwLH9ITZZhaZfq2r/N23ebePmyl5+DiP4DyWvvjXOy
 M7nziYUJv85dzxRLwuBL2LdV1VN/A8AEajCNRxAKx/bNoXbCGg1ZBELU7 A==;
X-CSE-ConnectionGUID: N9Qa7MuxTZi0A4ClzpMkCA==
X-CSE-MsgGUID: oXx6+QUJQrywCWa0CpXoMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="41746976"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="41746976"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 07:57:04 -0700
X-CSE-ConnectionGUID: EPkqAo1KSKi2rRiCPy9KIg==
X-CSE-MsgGUID: vSmZP36bQJufrPvxJN0EEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="159775921"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 07:57:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 07:57:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 07:57:03 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 07:57:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrMfS7betUiofC83VsfhPy/OK6P90DTT01PUNrVgvKKMkJxvDAf27B3HVsRcj/jiOkcIU9rR+q2DHMmjlEDhswjWyLghA+8+SDgFw78r0lLTA3Gl/UVPEx0xfSf52ebSkB92gWkpaAGCYITSWxR5HIY5NgyrJtxdeGyF0q90WQ9A0w0WpFVWXeFNAZl5Pd5vhlJOReQOaTDScm90D8W/zBB4fHF4xvkBUnt1B2phTUfz8vkMbVTt2l/i1SZINqtyF5bp2pD3V+BIl7eFOpI60N9ecA6c055UqVO60FYu/3G2B9EB7/Mq1MmFw4RZYyQl/uckOGTzaRYoJ/5AU9X/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tsmis1N92bY4miOEYlnri1jh+27RUlVsyk+4GTU/VBc=;
 b=dCmPWSOdS+lHjWUa0w8pjFoIiwn2pupFKOeM0lpfHUL0TOYIU1aea/xV3z2oVey2TqR0YhcIKykG20lLw7TYuySCQS9aOOv0tKDMtEaBBgR+uU8NrblUKhnxo/hF5Ax1HJX69a/NMLrIjgSx9DyDQeYah0FXU74QL78firln9xjWBXgvr1Y5ewLbtPXK2oWMJUH5RqXpwRut3IRYKjb9rPrImm7awt0t74avJ4h7IuTnh49xHyp1szrRDjakCgAIA2F+1gktzLAkTnn7lckf4VWiY5Vf8bAzEHOybyTRAbVrVLxK7mCbV/cy1Ib0UqESx052T6olmGtU1qmSkYFaLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7417.namprd11.prod.outlook.com (2603:10b6:806:345::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Mon, 7 Jul
 2025 14:56:29 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Mon, 7 Jul 2025
 14:56:29 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v9 4/4] drm/xe: Unify the initialization of VRAM regions
Date: Mon, 7 Jul 2025 16:56:09 +0200
Message-ID: <20250707145609.3857467-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707145609.3857467-1-piotr.piorkowski@intel.com>
References: <20250707145609.3857467-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::29) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: ba02d159-7c94-400b-86c4-08ddbd667454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1Q0K3prYmNkMTJHTHhvQWo4eFlZRkp6b2pEZ2VybkF3VGVlWC9lVHNjQ2pY?=
 =?utf-8?B?cHlYS1pKajU3NFZvL0J1Q1FXdExjN1ZWNjRUc1llbDEySmkxNEhNZTdvWWxv?=
 =?utf-8?B?ZmFlWlFCU2hYTmUzMzdPT0NjbGdVRWdxSGxPMXR5bk01d1NwTkZjdU1QdFJJ?=
 =?utf-8?B?YzFvSDhJcWZ6a0U1ajFyWlZrQ1NxKzIvWVJ4Z2IrdTFUdnljd04xUG1YR29j?=
 =?utf-8?B?Vm9NNFVVK0hsUmNsMGo1aEhzTmlhU1V2M2FDZ0pwUUEyWnRpNHM5VU4rRzNI?=
 =?utf-8?B?WEZad1MzTmdHbThkSlFIOXAxS3lPNGhOSHV3TmJiQXNVSzZ4ajd1MzRCTDNO?=
 =?utf-8?B?amI2UVEzUTFsMk02alRzV1hGaVJ6YlJKdStDSVY3R01vYnoyNzFwa3ROc2U4?=
 =?utf-8?B?MEpSazBtTWtnWkM5M0c4VTQxd29lNlRwMEpSbEd4SlhRYUQ1TDlJM3NWMitE?=
 =?utf-8?B?ODhreUVNQ3dNbGplQmQ2aFl0SGRGQWxqUktPWHpRNERXYVhvL1BtdlA5aTVi?=
 =?utf-8?B?V1J5b3Q4THcreVdoWkFxL0hMT05tOFpzc1pDZHRnZ09CVTBzdDkwdzVjQkRY?=
 =?utf-8?B?aWZSRnd6WGRDU0x0SzdaUkloYkZDT2dieXdXM3lHTmxRM1VGSmxHUEl0eXQy?=
 =?utf-8?B?TDlsUy9zVHQrSmpQWkhtcERZaDdJL3k2TXBuSmIyK2NnWVk3RjBHZVVCbUUv?=
 =?utf-8?B?RWZWNjhBQ3lnS09iVkdMV1E3TDUxMVh2dnN4ZG5mODNZVFVsMk9td2FWQ1hw?=
 =?utf-8?B?aDVQUTRydkF6R0lvMzZWOHlwUGRGYklpSnREbHYrbkVWT21hYXRlazRneFZp?=
 =?utf-8?B?REZFWXB0OVBOU0Nqd2EvQmlieW0yZk1hYmIyTnFmcElPZkV3cUdObDJxUmVp?=
 =?utf-8?B?QjJNcmZEeHJaTE9RQTU5VmU3a3NFT24vS2FVVi9VNUVuMm5YUWtxbGdtUzVo?=
 =?utf-8?B?OXgzTnAycFduUloxeWJSRHdkelNUUmVBR01RcGNqS3YrUUdkblEzMHRseGNR?=
 =?utf-8?B?ejVWejRBRStjS1pQYWZIeGZ3YUpidVNZcDRNNmd4eHR2Z1YxeFFPcEwwS0Yv?=
 =?utf-8?B?ZzNQMXV1N1M3RFMwQ0NvYXZteDBJTW9iSENjeHczMGw0QytGUDJJR0dBWEdZ?=
 =?utf-8?B?QWxmdHdMTFBrVzM4RjVzSHh3ZTJKOGRqdGpLa1ZjQkRzckJENFMrSHhBVWU4?=
 =?utf-8?B?aHJPbjhDT29TQ1VZNjE5dG9EZzZYd2Rrd3NRb0pUaFNGc1dZdFFrTjAyQWk1?=
 =?utf-8?B?QlpITTVsZEI2Z1FPZHFIUmc2L0hZdDlBWit4akY0NGZXZ0VIdHA1NVQ1N0xo?=
 =?utf-8?B?cms0SXFtUUZZSytnSjBQQjNVM1FrSGNNV1dXeHFvR0xwV3J1c3Y0cWJBWDZU?=
 =?utf-8?B?VDJrRHQ5NVkxa2tKUHRLUGI5R09aZG9HV0dhbWlNem1JWk9leVV1bC9JcFNN?=
 =?utf-8?B?cXdpMm1sV0UrdWI5eWtiS0lRYy95cXIrR1haVHh2MDNLUTI5Y2d5U0NXV25t?=
 =?utf-8?B?Z1RKSkF0bmNKTGRxL2ZMUlNWcGhoeUFNckdPeERNVG5mMnhoQW9rOEVFUHRF?=
 =?utf-8?B?VVJjWkMvRTFycUdKaUJ2SjRLenh6L29aMEQvc3lXd28zckRURFZOajc1OUd2?=
 =?utf-8?B?NGJyaXRIWG5hMW50T2oxSzBVTjljWEpjbGo4ZlNURzNZQUVBSll6eExWKzZY?=
 =?utf-8?B?V1A5QlNaSlMxQk9McG9KbXp6M0JueWJsdXQ2SUgvU0paK0t0RzQzREtYOGxm?=
 =?utf-8?B?RDU3anBQV0NnNVdSY0g0SXJDM2w2YUVGKzVUaFVVSzZCWENTVTBRUlFmRUJK?=
 =?utf-8?B?ZCtXNHJJcmFER2dWcjlwZUV3aG9FZnRMOVJOaGR2L21HQmlwRDVianpNdTdl?=
 =?utf-8?B?RHlPYUl3ZDE4eHVCT2t3WDVtTUZxOXVMbjRicGRRRjZUTzhZTjEyT2h2SjMv?=
 =?utf-8?Q?XZTa0gfmbF0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OERjSHRWQ0JMeXk1NGF4RGR4cmJ6Z0xBQld3bnE5ZU5QMThUamtNZzVqc05N?=
 =?utf-8?B?ckhwWnpUSmY2czBmb3BsemFadXVWY0xSWXJNTEt5V3ZNdDVnOHJscnA3L2V5?=
 =?utf-8?B?T3k4RnJVajdOWUlCTG0xenhwWEpDbkR0ZFdaU2dGZDBLV01MUXdLaHNjZVc4?=
 =?utf-8?B?NXgzc0tFYWIrdFhRSW1LM2N2RDZoaDQxWHVOdXUzbGNCbHFacDZUcERUWTRs?=
 =?utf-8?B?eEI1N1pGaDN2eEZKWmlkN0dFNWUxSEFrald3RU5xUU04dzlray9ZWkFjekxS?=
 =?utf-8?B?T3JQVmRJSWtnano0cmwzWUg2cCsrN3ZxN1BUV3BnRTduOEJjcVg3WVExTDMv?=
 =?utf-8?B?dndENEgzRGxXNUVrSHZ0OUJFRWlRZ2hOaWR5ZGd5SjZEZUlrTVhPSjVuaVds?=
 =?utf-8?B?TGJVK0VVOUhBSWN0dE95d0dFWlZCczhaSU9HMk9vcTRDMGJ4eU1qVXRnb3Ny?=
 =?utf-8?B?c3dZaW1TNUFFZktqTjk5L3IzVWZZNDRVZmtmMmt2cEwyaW55Mmswd24rYzVV?=
 =?utf-8?B?eWs2R2lUb3pNR1RNNkNJMlg2cmU0YlBNRVI4WmlLVHl0QmhaYlFMU2tnZDNm?=
 =?utf-8?B?QWNRbDVZcTlCOTVGa2JIMWxlLytLRGNIVlhKUjNuVHZ4dDZhNS9xUkF5U0V2?=
 =?utf-8?B?RHh1V3hZODZsRXFRTlIvODlEdWJkU1E5SE1rRXFmVnpOeUt1a2lKNTFsRkVx?=
 =?utf-8?B?RlFWTHpGV2w5VjA3RmtCTlBoUmw5L015Nmp4Z3o3KzEyQ0hrN3B2TjdtRXd2?=
 =?utf-8?B?QUtYaGcrNER5RFNXZlZadlhsaTlHd2RDZlcvUklvSm5OdEUzQ3FsQ05hbkc0?=
 =?utf-8?B?TFpBaDMyOEkyaTFBOWdKamhwbEpSVnBzU05qa0xDRGN0cStTZER6ZmdVNXBL?=
 =?utf-8?B?WG1IT240bUs3VkJJYlpEaVROY0RORDQ1V3VOUUY1QWVqcGxXMTZSanFHM0hT?=
 =?utf-8?B?dVQ5aDBDUVFMZGthTHFPRUpJYldsQ3lWMytlWjRSaGJJZXFpL3d1MEFmUElI?=
 =?utf-8?B?WTZpeFV1WHBjRElSV0JQRW5uYUVjQzdiMGNjT3ExOXdLb0wxZGRKaDRwa3Nu?=
 =?utf-8?B?b01FUkwyYS95QmhJbm9MSXlOaE1qeHBGT1BzazNzTTIzbGU0RWppVHZaRS9Q?=
 =?utf-8?B?Z0xvUjNvZStEQ2EvcHZrdGE2eVJMUWFxTzFHbU1qZUcyZ1BqUGVUTDg0ejFY?=
 =?utf-8?B?dm5GMkNTbHowVm1wb0ZxcEQyZ2ZoVGYzRERyYSs0MmlsbmZhbjNmTzUxR1RW?=
 =?utf-8?B?cXhmTmsrVTYwclBzbUJILzNMREYwU3JBLy9qRmJuZ29KUTdsMlNqbjdHL0VN?=
 =?utf-8?B?eXhKSW5XcUJIa2I2U3NRY0NTbmNCdmxMTDZDZUpleEw0b2g4UnloeklkdUlh?=
 =?utf-8?B?ZDJuWklyY2ZQYlVMVjdkL0tNOEhveWczemc4RW9UT3hFR0tqZ0VOSXlpaWFn?=
 =?utf-8?B?b0d1cE9Mc2pLS0thMnQ0NE85OERrM2FjUlhwZ2xoMUJYRks2cklqUjdPbXp4?=
 =?utf-8?B?UUV5OHFmSVYzcitCamIvVW5NSWQyUnkyY3dKS1FJNnE0Q0NTcWVJUHFGbFhm?=
 =?utf-8?B?c1FaUmJsc0FnZW1PTW9ib3JCUEhMWmE0ZlpmbHpFU0JpV01FWld4RGxnOXg3?=
 =?utf-8?B?aGhXQ3ZEYkMrSTRzOFhWWTJyV0psUmRXdDBoeVRac3dFbGd5YjhMU0VYK3lp?=
 =?utf-8?B?OUluOFgrYkYzWUtmM1pVbEFPRHBHdUM5T0JlL3VkQlRhMEJQMzVqcGtOcngv?=
 =?utf-8?B?Wk1laElYdHFvUFMwU2xNNHllSzZyeEd2S3dDV1djTnF1djFaTUgxVEtFSlJ3?=
 =?utf-8?B?SXpYaVpESVhQMUJrMnV6UHhnRGVybENSWWYxVXd4WEllYXRac1p2cU11UlAz?=
 =?utf-8?B?bkVmT2NCSjIyRzhIVHdIMWJUQzc2YnFBSTlBcVhwTG9mb05IUzBvTHo4Zjlq?=
 =?utf-8?B?L005L0c1bjVvR25MdzVlVXdLakZjTjRkL0REdytQNWJWS2JRVUl1bzk5ekRx?=
 =?utf-8?B?YnBOSlNmbVZkL3U5L0J3L3B1anN0ZCtPSEs0SncxNUtkU0NjNUV5RGdab0Vp?=
 =?utf-8?B?TDd3TVpFUFppMG5EdFRTOWlIcDJMbDAxVFZ5OGVNdkVEc3NpMVJaOGduMHFX?=
 =?utf-8?B?U0lWdW91QzBVQmhkaTBHZzJ6MEQzV3A3Tm83eUErdnZHeCtwcTU4RkxwU2k4?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba02d159-7c94-400b-86c4-08ddbd667454
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 14:56:29.3646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZPM2IVPVF6cwHpmmYDJpbCHNbIm0omaQsP3TGQFurvf7ECgsHflMjy8B/x/VaVytlzktqpW9pphN2EDhPtE0d9Y75sS1WOjMtw3CfVhLbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7417
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

Currently in the drivers we have defined VRAM regions per device and per
tile. Initialization of these regions is done in two completely different
ways. To simplify the logic of the code and make it easier to add new
regions in the future, let's unify the way we initialize VRAM regions.

v2:
- fix doc comments in struct xe_vram_region
- remove unnecessary includes (Jani)
v3:
- move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
  (Matthew)
- replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
  (Matthew)
- Replace the tile id parameter with vram region in the xe_pf_begin
  function.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  13 ++-
 drivers/gpu/drm/xe/xe_query.c        |   3 +-
 drivers/gpu/drm/xe/xe_tile.c         |  37 +++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  16 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |   3 +-
 drivers/gpu/drm/xe/xe_vram.c         | 149 ++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_vram.h         |   2 +
 drivers/gpu/drm/xe/xe_vram_types.h   |   8 ++
 8 files changed, 134 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 5a75d56d8558..ab43dec52776 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -23,6 +23,7 @@
 #include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 struct pagefault {
 	u64 page_addr;
@@ -74,7 +75,7 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 }
 
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
-		       bool atomic, unsigned int id)
+		       bool atomic, struct xe_vram_region *vram)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -84,14 +85,16 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	if (atomic && IS_DGFX(vm->xe)) {
+	if (atomic && vram) {
+		xe_assert(vm->xe, IS_DGFX(vm->xe));
+
 		if (xe_vma_is_userptr(vma)) {
 			err = -EACCES;
 			return err;
 		}
 
 		/* Migrate to VRAM, move should invalidate the VMA first */
-		err = xe_bo_migrate(bo, XE_PL_VRAM0 + id);
+		err = xe_bo_migrate(bo, vram->placement);
 		if (err)
 			return err;
 	} else if (bo) {
@@ -138,7 +141,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = xe_pf_begin(&exec, vma, atomic, tile->id);
+		err = xe_pf_begin(&exec, vma, atomic, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (xe_vm_validate_should_retry(&exec, err, &end))
 			err = -EAGAIN;
@@ -573,7 +576,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		ret = xe_pf_begin(&exec, vma, true, tile->id);
+		ret = xe_pf_begin(&exec, vma, true, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (ret)
 			break;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 66ea3403afbe..56ef3ee2806f 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -27,6 +27,7 @@
 #include "xe_oa.h"
 #include "xe_pxp.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 static const u16 xe_to_user_engine_class[] = {
@@ -410,7 +411,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 			gt_list->gt_list[iter].near_mem_regions = 0x1;
 		else
 			gt_list->gt_list[iter].near_mem_regions =
-				BIT(gt_to_tile(gt)->id) << 1;
+				BIT(gt_to_tile(gt)->mem.vram->id) << 1;
 		gt_list->gt_list[iter].far_mem_regions = xe->info.mem_region_mask ^
 			gt_list->gt_list[iter].near_mem_regions;
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index bd2ff91a7d1c..68b84111f26b 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
@@ -114,11 +115,9 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
-	if (!vram)
-		return -ENOMEM;
-
-	vram->tile = tile;
+	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
+	if (IS_ERR(vram))
+		return PTR_ERR(vram);
 	tile->mem.vram = vram;
 
 	return 0;
@@ -156,21 +155,6 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 }
 ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
 
-static int tile_ttm_mgr_init(struct xe_tile *tile)
-{
-	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	if (tile->mem.vram) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
-		if (err)
-			return err;
-		xe->info.mem_region_mask |= BIT(tile->id) << 1;
-	}
-
-	return 0;
-}
-
 /**
  * xe_tile_init_noalloc - Init tile up to the point where allocations can happen.
  * @tile: The tile to initialize.
@@ -188,17 +172,20 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	err = tile_ttm_mgr_init(tile);
-	if (err)
-		return err;
 
 	xe_wa_apply_tile_workarounds(tile);
 
 	if (xe->info.has_usm && IS_DGFX(xe))
 		xe_devm_add(tile, tile->mem.vram);
 
+	if (IS_DGFX(xe) && !ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {
+		int err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
+
+		if (err)
+			return err;
+		xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
+	}
+
 	return xe_tile_sysfs_init(tile);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 8f9b8a1d2c05..9175b4a2214b 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -338,12 +338,18 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr);
 }
 
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
+/**
+ * xe_ttm_vram_mgr_init - initialize TTM VRAM region
+ * @xe: pointer to Xe device
+ * @vram: pointer to xe_vram_region that contains the memory region attributes
+ *
+ * Initialize the Xe TTM for given @vram region using the given parameters.
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram)
 {
-	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = tile->mem.vram;
-
-	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
+	return __xe_ttm_vram_mgr_init(xe, &vram->ttm, vram->placement,
 				      xe_vram_region_usable_size(vram),
 				      xe_vram_region_io_size(vram),
 				      PAGE_SIZE);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index cc76050e376d..87b7fae5edba 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -11,11 +11,12 @@
 enum dma_data_direction;
 struct xe_device;
 struct xe_tile;
+struct xe_vram_region;
 
 int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 			   u32 mem_type, u64 size, u64 io_size,
 			   u64 default_page_size);
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr);
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram);
 int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      struct ttm_resource *res,
 			      u64 offset, u64 length,
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 35fd7f5d7cff..002059b2dbdb 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -19,6 +19,7 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_sriov.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
@@ -137,7 +138,7 @@ static bool resource_is_valid(struct pci_dev *pdev, int bar)
 	return true;
 }
 
-static int determine_lmem_bar_size(struct xe_device *xe)
+static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *lmem_bar)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
@@ -148,17 +149,16 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram->io_size)
+	lmem_bar->io_start = pci_resource_start(pdev, LMEM_BAR);
+	lmem_bar->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!lmem_bar->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram->dpa_base = 0;
+	lmem_bar->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram->mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram->io_start,
-						xe->mem.vram->io_size);
+	lmem_bar->mapping = devm_ioremap_wc(&pdev->dev, lmem_bar->io_start, lmem_bar->io_size);
 
 	return 0;
 }
@@ -286,6 +286,65 @@ static void vram_fini(void *arg)
 		tile->mem.vram->mapping = NULL;
 }
 
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
+{
+	struct xe_vram_region *vram;
+	struct drm_device *drm = &xe->drm;
+
+	xe_assert(xe, id < xe->info.tile_count);
+
+	vram = drmm_kzalloc(drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return NULL;
+
+	vram->id = id;
+	vram->placement = placement;
+	vram->tile = &xe->tiles[id];
+
+	return vram;
+}
+
+static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
+{
+	struct drm_device *drm = &xe->drm;
+
+	if (vram->io_size < vram->usable_size)
+		drm_info(drm, "Small BAR device\n");
+
+	drm_info(drm,
+		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
+	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
+		 &vram->io_start, vram->io_start + (u64)vram->io_size);
+}
+
+static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
+			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
+			    u64 region_size, resource_size_t remain_io_size)
+{
+	/* Check if VRAM region is already initialized */
+	if (vram->mapping)
+		return 0;
+
+	vram->actual_physical_size = region_size;
+	vram->io_start = lmem_bar->io_start + offset;
+	vram->io_size = min_t(u64, usable_size, remain_io_size);
+
+	if (!vram->io_size) {
+		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		return -ENODEV;
+	}
+
+	vram->dpa_base = lmem_bar->dpa_base + offset;
+	vram->mapping = lmem_bar->mapping + offset;
+	vram->usable_size = usable_size;
+
+	print_vram_region_info(xe, vram);
+
+	return 0;
+}
+
 /**
  * xe_vram_probe() - Probe VRAM configuration
  * @xe: the &xe_device
@@ -297,82 +356,52 @@ static void vram_fini(void *arg)
 int xe_vram_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
-	resource_size_t io_size;
+	struct xe_vram_region lmem_bar;
+	resource_size_t remain_io_size;
 	u64 available_size = 0;
 	u64 total_size = 0;
-	u64 tile_offset;
-	u64 tile_size;
-	u64 vram_size;
 	int err;
 	u8 id;
 
 	if (!IS_DGFX(xe))
 		return 0;
 
-	/* Get the size of the root tile's vram for later accessibility comparison */
-	tile = xe_device_get_root_tile(xe);
-	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
-	if (err)
-		return err;
-
-	err = determine_lmem_bar_size(xe);
+	err = determine_lmem_bar_size(xe, &lmem_bar);
 	if (err)
 		return err;
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
 
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->io_size);
+	remain_io_size = lmem_bar.io_size;
 
-	io_size = xe->mem.vram->io_size;
-
-	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
-		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+		u64 region_size;
+		u64 usable_size;
+		u64 tile_offset;
+
+		err = tile_vram_size(tile, &usable_size, &region_size, &tile_offset);
 		if (err)
 			return err;
 
-		tile->mem.vram->actual_physical_size = tile_size;
-		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
-		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
+		total_size += region_size;
+		available_size += usable_size;
 
-		if (!tile->mem.vram->io_size) {
-			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
-			return -ENODEV;
-		}
+		err = vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, usable_size,
+				       region_size, remain_io_size);
+		if (err)
+			return err;
 
-		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
-		tile->mem.vram->usable_size = vram_size;
-		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
-
-		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
-			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm,
-			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
-			 id, tile->id, &tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
-			 id, tile->id, &tile->mem.vram->dpa_base,
-			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->io_start,
-			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
-
-		/* calculate total size using tile size to get the correct HW sizing */
-		total_size += tile_size;
-		available_size += vram_size;
-
-		if (total_size > xe->mem.vram->io_size) {
+		if (total_size > lmem_bar.io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram->io_size);
+				 &total_size, &lmem_bar.io_size);
 		}
 
-		io_size -= min_t(u64, tile_size, io_size);
+		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
 	}
 
-	xe->mem.vram->actual_physical_size = total_size;
-
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &available_size);
+	err = vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size, total_size,
+			       lmem_bar.io_size);
+	if (err)
+		return err;
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index d4bf1f9c2a72..72860f714fc6 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -13,6 +13,8 @@ struct xe_vram_region;
 
 int xe_vram_probe(struct xe_device *xe);
 
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
+
 resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index a01838236036..c4ac868e5205 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -22,6 +22,12 @@ struct xe_tile;
 struct xe_vram_region {
 	/** @tile: Back pointer to tile */
 	struct xe_tile *tile;
+	/**
+	 * @id: VRAM region instance id
+	 *
+	 * The value should be unique for VRAM region.
+	 */
+	u8 id;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -54,6 +60,8 @@ struct xe_vram_region {
 	void __iomem *mapping;
 	/** @ttm: VRAM TTM manager */
 	struct xe_ttm_vram_mgr ttm;
+	/** @placement: TTM placement dedicated for this region */
+	u32 placement;
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
 	struct dev_pagemap pagemap;
-- 
2.34.1

