Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63560C7115C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 12:23:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E9A10E6FA;
	Wed, 25 Jun 2025 12:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xb5tlKJC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710EA10E6FA
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 12:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750854185; x=1782390185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=izh/JWvTJy5A2fSq2Rt9vb+tpZQHlMVD9W12S+j9Xg0=;
 b=Xb5tlKJCTeF+9KBETXwbxGmnaJ/krfYBSND5RdlJEDM8zRESaLsveWfq
 piulC0oxAbdLJfzitT9z7U69zcIu5wEg+KeboHOwQSpaww7t0PCdyxN2E
 +8pvDdQwhLcUJnqF1fqE7ZEehfq31etG+X+i8d0+6WDvCrQjhoLBkeH7K
 Ujxr8XYqXwHdrPWqiUOCqF9pm8tOe/iBj2t7s3RNRm9RN8Iwo3vVOjZ+i
 Rpi8Fa9OeRymN52zwwTNhdATtgoXF7Ynk8krFU7TahlnifeV6blF4csZR
 tQj/NoFLJkSrnpCpliSuySWu3SgibsPBFtcVDf8PTDJfB3cWUxIojPfDr w==;
X-CSE-ConnectionGUID: N1SyrSRHSM6mzWI61rG7jw==
X-CSE-MsgGUID: DtGYN0j8Qk6erJGMeN1n5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53257543"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="53257543"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:23:05 -0700
X-CSE-ConnectionGUID: pI8/T4IASeOLHSH8AdS3Ig==
X-CSE-MsgGUID: TSp5dxjgRdqpIQSMGIrQZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151962645"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:23:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 05:23:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 05:23:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 05:23:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKthfzOSs5HzxY0pYU66P6Qy67CDAj9/e0nu9wLo0Ey1YHD6JWShBsdPUUCDqrLtJ5Zg2H/nlicxna86sVUuBkEgo3v+/6j8C3/9QAvWYdtxiTFbf726dFMVQl1vtuzNHC8wxM8FtFFtp15zHrL6beAZootmVVkQjTAVhPigg7eJOgFKscDIT5T8M+UM0t+1qt3bT0XATGozUR8uEVeZ7jF+SONDAkgZ99gASPPyvy3PJaU2ftA8rivGsd6gvc9ppcjaID8XLSvBCf/9/R9u7j9bc1b9OW4HAkvszOds+MjIUTJnXHx0NoyOld3lSB/7Q/IA53/wZNA6XPzkzvN4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uyQKxzvt5OtHOkS18GNb67TxmzwztIDjCZvi2v1Osg=;
 b=Au1+6is1j6Tfs6xVaT/KQCkvvpkptVUbylnR58GGU4CrRY5jZpWSaml8GkHJDFN0R3NdktRIzL7Z1X0E2Toal82A6cfLgbyPr+LBj9c6hmtX+x9RYB9dc0NmgmxYFAfRVbgkVhn96HX3Kl8W8Y/BbjCVCu7QAei5LFJZV8w1I1mnjC/lbYiZEjexpo9wnIY2j7Tv1XdffON71ZJ7NDz89d1/n3fNr8flE7ZYG8+WFAu2dFub3GGYqjjn7ALY5BeXyxQE3aBhdVwu4U++YJvZLvXp9j//1dHJsqWJKrSrh27ZdWSAsl472tb0CIpieJQz+DyWU6zkT7fCyVkO9KktTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB6062.namprd11.prod.outlook.com (2603:10b6:8:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 12:22:55 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 25 Jun 2025
 12:22:55 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Jani
 Nikula" <jani.nikula@intel.com>
Subject: [PATCH v4 3/4] drm/xe: Move struct xe_vram_region to a dedicated
 header
Date: Wed, 25 Jun 2025 14:22:20 +0200
Message-ID: <20250625122221.3061437-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625122221.3061437-1-piotr.piorkowski@intel.com>
References: <20250625122221.3061437-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P195CA0014.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::25) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 401e465c-521b-4f05-20b4-08ddb3e30354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUdyN2RjTHJpTVFCYi9BNEYwbkU2Ukd2REVPcTZrUkRLNEU4czMyWDA0eG8x?=
 =?utf-8?B?UFJVQ0s1cWMzWHFsWDJRYVViNjF1R2tKMWU5VFU3Wk5IT2l1c0RCNmkrdEtw?=
 =?utf-8?B?Y3VjOHQySHl3OFV0ZEpiRkVCSFdSaThjaG1GeFFhQkRndlhqcUZvdTdzZmZv?=
 =?utf-8?B?Q3phZjM4NTNERVNqaFBoNWZLRGxkWmlLMndWeEgzNVZPYWxCNlpmcVZsK3ZU?=
 =?utf-8?B?VUNuVE9JdzNRVTFTb1lNU0txUjE2bzRQMEhGWE1rMmZISnpneUdtdDJhRGdx?=
 =?utf-8?B?bFJ2RUNCdG5ZVytCWFdSdXIzYS80Mlk2bzBqb1lSY2VMRDAwMGs2T2R5bDVN?=
 =?utf-8?B?YXo0dHhKSHZqVHdMeEpSSXZvdGFTZSswK0luS1l2WFNSUlNpU0tZME9RSUVI?=
 =?utf-8?B?ajYyRG1QSzRtMTBLNGFxaFlIbmIyZ1NhaWhmY0RTQlExd29QbDlYbEhzY211?=
 =?utf-8?B?M3p2SlhUNUZXUmRDWVV5Ry8rUG9QekJRdm5UQVJBZVhoUGRhUmVCRHhTYTNn?=
 =?utf-8?B?SzJzWnFEcEtoVzUxd1NydGtRVUxCTEozWHhPNnphZ2doall2czg5NXVMSmpm?=
 =?utf-8?B?RDBlM0NIYTV0WnM1OVFDMnNkbk9oOWhyNmlZK2Izd21DYjhMOWcxUHBvZlhx?=
 =?utf-8?B?ZmowaHVVREFYMDF4dGExaHZYaFBueGF0WFBJL2MxWlpxTjdkYzQxUHZzTmhS?=
 =?utf-8?B?WkJlOWhYaUsydVh3MzI3aFl1Uy9jcGVTbjBXMDFHUitDZjRXN291L2VqYktF?=
 =?utf-8?B?R1kxdFRLaVNIN2xUdDdIT3dHOGk5b3dkZ2RrbDJJOEZjTjdyaWtiZ3ArdXBk?=
 =?utf-8?B?RHE0WUU2aXdEU282YUVQQzJ2TGtwd1hqai8xNHlDR0FhZzVmYk5ZaVFPbkc5?=
 =?utf-8?B?TEpsTFBMcTdyQnAya1IrdTlSU1R6c2hVMkFHREtCb1F3bzdHaDNZSkIvVFQ4?=
 =?utf-8?B?QndyUEx3b2ZrUlF6TUlTbXpQK1RZTTFDbG40L2NHaG84UlA1eGcyd1ZzUHA0?=
 =?utf-8?B?Tm5JMTlJMGdYOSsxUXVFK1pXc2k2cnNuckQ2Q1NUWE5PUzU3ZGd4TG54d2pX?=
 =?utf-8?B?a2U1SDhGZUpadmFUMGJsa0l4d2ZaWnRzaW9qL1lkbjAxWHNia0k4em0rRHYr?=
 =?utf-8?B?UEcvbnhnWlVIaFo1U1Eyc00veVI1SEd3WHg4VWRrak93TkVySk14SVlaRkRB?=
 =?utf-8?B?emdwcVk2Y0ZOMDc4L0gxN3pjRzdIUXMwS2UzTmdWWWhaZG5IWmI4NUtEVWZI?=
 =?utf-8?B?R0d3cDROalRBNkNXMU01K1FYTmVjYUpHQXJtdXJGek9lUnJGYmhXNG5MYnFC?=
 =?utf-8?B?eXdKZ2dySWZIbVUyRGtCdEdMSGRFeVpZL21vd1p4bEgyNUxGTXhIQTkvdkhV?=
 =?utf-8?B?eUxpNTJsckduMXo5c2RSQzMrbm0vUXZhRFVqSkQ0d1FJdFlvbGtEQjQ2R0lP?=
 =?utf-8?B?TFh2elRCOWRmVDFmMExYRjUrT1FHSFBxZTYvZXdXM1FMek1ERjBrdDVaZlZM?=
 =?utf-8?B?RkRaRmpNMG5FK2JwZE10SGl2S1hkVlVSaWRyYjNURnkveWJWNWRsRi81elNs?=
 =?utf-8?B?ZmFaV24vL3F0eVZnQVV6dzR5S0tSdWg0RVp0WThFdDVYZDVQb2Z1YklZazZU?=
 =?utf-8?B?VnExbmRYTk1wL043dWNxQUkzMWR0amhNd0QydmphV0NuU1M4cSt0eUN1VGdW?=
 =?utf-8?B?MktObjBQVGNMdkx5TjVwSVkzamRHb24rT2hNYTVCR2NvcnBGWGJ1SGpZOHM5?=
 =?utf-8?B?bDloaHB6aUNoUWcxNTJ1L25HWWkzVEsrQUxkeFZ1K3NQaGNvNnlkSW9tMUdM?=
 =?utf-8?B?QUJWaEUvR3VYNjc1WXdJd2FEOHQyUG5PMW5TT21sMTNicmxKeHNMN3p1cmk5?=
 =?utf-8?B?UlRkY3lpc0d3VGRBZCthZ2dnUE1veXNWZWQvYzNucFhkc2xjYlgvR3ZNUFBo?=
 =?utf-8?Q?KVWn3TMXipI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjNIbklVa3V1RUdTL1lVdCs2UE14Ymt2WEl4alF6V1l5MnFDRE5yelZ5V3RM?=
 =?utf-8?B?bXh3V2N3aU80OWRvVFVRWW12aTNVMll0anRjb3NaMXhBZFRsUUsvTW50RUJj?=
 =?utf-8?B?dElMZ3BITVdQNFdUbmhIcnUxSjl3MHhETzBRVDc1ZGFwSmdRUXF2T2ZkeHNz?=
 =?utf-8?B?YmlCbnVqbFd5WVVzcHFDNWxDMEdWdWZuVUpmMW80MWhjbXZKNW90MXlCSUVR?=
 =?utf-8?B?eTVoTXF0SjBmck9TNGkvcUtldXF5NWhSRSsvMEM1cmkwNGNlcUNTWWRRaTUv?=
 =?utf-8?B?UWRNQjVNeXBZejVxZ25velRtak1MTExObE1pOFc4TW5wNWZNWGZvcHk4TXdC?=
 =?utf-8?B?V0R6alJaWHB2OUxVaHZQd0lPZGtTT1UxRFNwaFJReVBIUUJWVWFrWmhaazB2?=
 =?utf-8?B?MmFIM2w2T3BnUG1BM1RKMGFVZFQ1K0k4NmJFODFudEdKQm9qbXA4UGQ4MEt6?=
 =?utf-8?B?QXhOU2gvOHZaQUJLTXhMTDd5c3A0U3A2RGJzMmRXbC91cUVTRVE4RVZQMnVV?=
 =?utf-8?B?aGhIR1hUT2NyT0l0eTQzb2tDZG8xakpZR3cwRk1BOUo2YkhYU21veXF1b0Jv?=
 =?utf-8?B?ZllQVzMveXlwUytYME1ERnBsam11NlpiSmJSUnpRWW1HOEczTXFDWWlKWEUz?=
 =?utf-8?B?RndhNHdwbjNWZFZPMWpuYlRJTEI5bjhYK3h4MUIrZ05PSGxVU2JGOTR6K2ZD?=
 =?utf-8?B?Q3JINWNXTy9tdmVkSFpHWTRyb0xmaFZ2clNCeEtTRURyL3Q5alBUcE43Qmcv?=
 =?utf-8?B?d2dzUGw4Ulp5c1VsYzhma3BWTSt5elF0SytSbXYxNnFjeTFTOHJOOVdxUEYx?=
 =?utf-8?B?WUFXUHZEaWRwaGNnUnBmV0d2QVZjWFVPclFiU0NvS2k5Z3BOUHVqZUNLWG5h?=
 =?utf-8?B?OUlsazBMdm9OZVMveDJaVklBOGpjUnN5SDlXVGNtQTUxb0FRSEJsL3lYQ2xn?=
 =?utf-8?B?UnlsdW53WmJEK2tTUmpKSlBFRGlOR3BzclE5V0R3UUkrQmdPOExKS1FOdWZN?=
 =?utf-8?B?NUw3SWJPUjVPeXc1c1E0OUpDUXVVYjdCeUNYdGNHa2lZSlhWZE1HNEVRODFM?=
 =?utf-8?B?eXIzem5OREZmcm5DdFB4bENKc25WN2hvZlFicnhKR1FhMWp5YnZ6TGcrdy9O?=
 =?utf-8?B?VW5JWEFMTll2c2FIaTcvcDcwWlhrbVNRTDl1akpGMUFqQmtVT3U3eU5lMHJ3?=
 =?utf-8?B?aUNtY2FyMXVhdE1ZUUtkWmlUSFgyS0JmWVgyZG1udFVkL3J2SXg3NUhFd1pv?=
 =?utf-8?B?a0xiNTJRV2NVblhIbDR6dmlYenIwc1YzajgxVUkxQ1NWeUVhdmRacXFNK1d6?=
 =?utf-8?B?MEhGS1FFYTVIdXF0SkJ6M0NxSGt5cXNScEpBZUJEd0JQc1UvdFRXWWJZcTIz?=
 =?utf-8?B?elJTaDJ4U2J6aXEzWVgxMzV0SEF0MDMySVFmbjV2YS9HZGpRVkVCa1lhRnJP?=
 =?utf-8?B?L3lsdDRLME9oNVZSSlZhemRxbWZ0Y21pYjFlcUNCR1NPeXFsVm10SFh5MGtT?=
 =?utf-8?B?b3VqaEdSaXBLVW5qL090ODcveTZmU1ZVS3NialpySjlSc1d2N0x6bHVDSHB5?=
 =?utf-8?B?M0gzQTBHTjF6WURXYmkwajBBVHBnbmhVcWlJOU5oS09YT3JDT0dpU2F0cndX?=
 =?utf-8?B?ckhKMkNIN2lXckl6empYNVNXYlhlR1VHa2NlRW05RlA2eDQrZFVydUwwZ01j?=
 =?utf-8?B?SGsxSEhIU1hlbUlsRnpGODV6cm9wNXhFdkxFdFZUNDZBNjRKVmwzTXhVeTVV?=
 =?utf-8?B?UzZEUkxVZG5IWHBHRnZmOFN5TDFKdWM2VWZiUmlSTjdtYVk4SXZlV3dnamNi?=
 =?utf-8?B?KzFoa2Uwem1GU3BKUVFSSlltWG81ejJucXFUMGlvMU1mNjVFRjQvYUxtb0cw?=
 =?utf-8?B?RmN5Y0JZT1pybFBsUkVFajVjcHhyQnVheWJraHliZzU2TVpRTit2d1ZkSk9w?=
 =?utf-8?B?WXJVTnBWMko0RzhBZlE3L3AvUEk2SW9NbUhZMDdoTitjWXNLNVo0d1lLZGJU?=
 =?utf-8?B?QlpBM1E1eEZ2dTZrZFl3RXN3bzRJRG9YWFBIM1FqcFBkQUlObjBwQ21DQ2M1?=
 =?utf-8?B?MnJvOTZlcTlwV3RnWEYxTkNOaFk1ZjhhcEhUb08vbG9jektlK3l0K040WFJD?=
 =?utf-8?B?WUxqdE5oMDJ1L2VOUTdOMFZpUGFtSzhYa3hhdEpXL2hRRXFoR1hHTzBhTGFD?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 401e465c-521b-4f05-20b4-08ddb3e30354
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 12:22:55.3280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+Aljfg+sp9LrAJa+gSo394y8HsWqXjExD2stszA4w/xfzrjd40yb/rCRyhONyfI92DX7ZHD1VJxwvTdvhJbv8bPgy2kujq4Q0ecCATfjzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6062
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

Let's move the xe_vram_region structure to a new header dedicated to VRAM
to improve modularity and avoid unnecessary dependencies when only
VRAM-related structures are needed.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_assert.h             |  6 +-
 drivers/gpu/drm/xe/xe_bo.c                 |  1 +
 drivers/gpu/drm/xe/xe_device.c             |  1 +
 drivers/gpu/drm/xe/xe_device_types.h       | 59 +-----------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  1 +
 drivers/gpu/drm/xe/xe_migrate.c            |  1 +
 drivers/gpu/drm/xe/xe_tile.c               |  1 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c     |  1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |  1 +
 drivers/gpu/drm/xe/xe_vram.c               | 12 ++++
 drivers/gpu/drm/xe/xe_vram.h               |  4 ++
 drivers/gpu/drm/xe/xe_vram_types.h         | 70 ++++++++++++++++++++++
 12 files changed, 97 insertions(+), 61 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h

diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index da357dd42546..a818eaa05b7d 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -12,6 +12,7 @@
 
 #include "xe_gt_types.h"
 #include "xe_step.h"
+#include "xe_vram.h"
 
 /**
  * DOC: Xe Asserts
@@ -145,9 +146,8 @@
 	const struct xe_tile *__tile = (tile);							\
 	char __buf[10] __maybe_unused;								\
 	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
-		      __tile->id, ({ string_get_size(__tile->mem.vram ?				\
-						     __tile->mem.vram->actual_physical_size :	\
-						     0, 1,					\
+		      __tile->id, ({ string_get_size(						\
+				     xe_vram_region_actual_physical_size(__tile->mem.vram), 1,	\
 				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
 })
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4e39188a021a..196acffe0180 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -34,6 +34,7 @@
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
 	[XE_PL_SYSTEM] = "system",
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 86f8ca6a96e9..126faf560909 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -64,6 +64,7 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 #include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
 #include "xe_wa.h"
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a7bcda67d05f..6cd2e96ae984 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -24,7 +24,6 @@
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
-#include "xe_ttm_vram_mgr_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -36,6 +35,7 @@ struct intel_dg_nvm_dev;
 struct xe_ggtt;
 struct xe_pat_ops;
 struct xe_pxp;
+struct xe_vram;
 
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
@@ -68,63 +68,6 @@ struct xe_pxp;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
 		 struct xe_tile * : (tile__)->xe)
 
-/**
- * struct xe_vram_region - memory region structure
- * This is used to describe a memory region in xe
- * device, such as HBM memory or CXL extension memory.
- */
-struct xe_vram_region {
-	/** @tile: Backpointer to tile */
-	struct xe_tile *tile;
-	/** @io_start: IO start address of this VRAM instance */
-	resource_size_t io_start;
-	/**
-	 * @io_size: IO size of this VRAM instance
-	 *
-	 * This represents how much of this VRAM we can access
-	 * via the CPU through the VRAM BAR. This can be smaller
-	 * than @usable_size, in which case only part of VRAM is CPU
-	 * accessible (typically the first 256M). This
-	 * configuration is known as small-bar.
-	 */
-	resource_size_t io_size;
-	/** @dpa_base: This memory regions's DPA (device physical address) base */
-	resource_size_t dpa_base;
-	/**
-	 * @usable_size: usable size of VRAM
-	 *
-	 * Usable size of VRAM excluding reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t usable_size;
-	/**
-	 * @actual_physical_size: Actual VRAM size
-	 *
-	 * Actual VRAM size including reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t actual_physical_size;
-	/** @mapping: pointer to VRAM mappable space */
-	void __iomem *mapping;
-	/** @ttm: VRAM TTM manager */
-	struct xe_ttm_vram_mgr ttm;
-#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
-	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
-	struct dev_pagemap pagemap;
-	/**
-	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
-	 * pages of this tile.
-	 */
-	struct drm_pagemap dpagemap;
-	/**
-	 * @hpa_base: base host physical address
-	 *
-	 * This is generated when remap device memory as ZONE_DEVICE
-	 */
-	resource_size_t hpa_base;
-#endif
-};
-
 /**
  * struct xe_mmio - register mmio structure
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index a33a6f3a6731..140d55ebd476 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -33,6 +33,7 @@
 #include "xe_migrate.h"
 #include "xe_sriov.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wopcm.h"
 
 #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c0bd23aaaa23..0989c45d3e9f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -34,6 +34,7 @@
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 /**
  * struct xe_migrate - migrate context.
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index c64a4d1a5bb9..6f50c15d0cfc 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -17,6 +17,7 @@
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 19bfc22b9706..dc94d133310d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -24,6 +24,7 @@
 #include "xe_sriov.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 struct xe_ttm_stolen_mgr {
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index d9afe0e22071..585bc1232658 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -15,6 +15,7 @@
 #include "xe_gt.h"
 #include "xe_res_cursor.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 
 static inline struct drm_buddy_block *
 xe_ttm_vram_mgr_first_block(struct list_head *list)
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 7e3980bcb4e6..cf92a9aa2435 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -20,6 +20,7 @@
 #include "xe_module.h"
 #include "xe_sriov.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 
 #define BAR_SIZE_SHIFT 20
 
@@ -375,3 +376,14 @@ int xe_vram_probe(struct xe_device *xe)
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
+
+/**
+ * xe_vram_region_actual_physical_size() - Get the actual physical size of a VRAM region
+ * @vram: the xe_vram_region struct
+ *
+ * Return: the actual physical size of the VRAM region, or 0 if @vram is NULL
+ */
+resource_size_t xe_vram_region_actual_physical_size(struct xe_vram_region *vram)
+{
+	return vram ? vram->actual_physical_size : 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index e31cc04ec0db..9092ae86df22 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -6,8 +6,12 @@
 #ifndef _XE_VRAM_H_
 #define _XE_VRAM_H_
 
+#include <linux/types.h>
+
 struct xe_device;
+struct xe_vram_region;
 
 int xe_vram_probe(struct xe_device *xe);
+resource_size_t xe_vram_region_actual_physical_size(struct xe_vram_region *vram);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
new file mode 100644
index 000000000000..b0807f5af1d8
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_VRAM_TYPES_H_
+#define _XE_VRAM_TYPES_H_
+
+#include "xe_ttm_vram_mgr_types.h"
+
+struct xe_tile;
+
+/**
+ * struct xe_vram_region - memory region structure
+ * This is used to describe a memory region in xe
+ * device, such as HBM memory or CXL extension memory.
+ */
+struct xe_vram_region {
+	/** @tile: Backpointer to tile */
+	struct xe_tile *tile;
+	/** @io_start: IO start address of this VRAM instance */
+	resource_size_t io_start;
+	/**
+	 * @io_size: IO size of this VRAM instance
+	 *
+	 * This represents how much of this VRAM we can access
+	 * via the CPU through the VRAM BAR. This can be smaller
+	 * than @usable_size, in which case only part of VRAM is CPU
+	 * accessible (typically the first 256M). This
+	 * configuration is known as small-bar.
+	 */
+	resource_size_t io_size;
+	/** @dpa_base: This memory regions's DPA (device physical address) base */
+	resource_size_t dpa_base;
+	/**
+	 * @usable_size: usable size of VRAM
+	 *
+	 * Usable size of VRAM excluding reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t usable_size;
+	/**
+	 * @actual_physical_size: Actual VRAM size
+	 *
+	 * Actual VRAM size including reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t actual_physical_size;
+	/** @mapping: pointer to VRAM mappable space */
+	void __iomem *mapping;
+	/** @ttm: VRAM TTM manager */
+	struct xe_ttm_vram_mgr ttm;
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
+	struct dev_pagemap pagemap;
+	/**
+	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
+	 * pages of this tile.
+	 */
+	struct drm_pagemap dpagemap;
+	/**
+	 * @hpa_base: base host physical address
+	 *
+	 * This is generated when remap device memory as ZONE_DEVICE
+	 */
+	resource_size_t hpa_base;
+#endif
+};
+
+#endif
-- 
2.34.1

