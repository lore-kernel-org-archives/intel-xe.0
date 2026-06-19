Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E06CD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 20:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC92410E10D;
	Fri, 19 Jun 2026 20:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YqW3h894";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D4510E10D
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 20:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781900996; x=1813436996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mUW173MKMiv/dvyoOxv4x8ljBipCqxjvZ/P2N9K/goU=;
 b=YqW3h894vVpckTrpasUvnTkEHirjHUyRJXtGcT5Qy9jHDRH/rwpfroLq
 vdd7fmHTuwzr+kjCjKB35ZgE3AOsiTB6gCe/hany/WPrGfvJHwUS/E8oM
 afYCAltteFfJ1AuOQE9VgDsOvBQ8epB0xY887cA7XC1p0av50R2qC6WMs
 OKtcsR53vxJeCGLifHgkiEXyl9Z0muUvXkM5CrHUyiO+QcsSAvqhQmn7Y
 lXM4E+zIVunFsQ2efZQhUJpNFW547qgR2lPmNFxtrXXO9CCgA050egzCc
 JHW0035mTTJJ+o/OvW2VscX5JSVrR92dv/uyKA7ondEaws8bAS6V+GDF5 g==;
X-CSE-ConnectionGUID: FTmUa9ywQfqp5deeeZRwmQ==
X-CSE-MsgGUID: Tm4xXmUZSVCCiHo8J+nYlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="82837386"
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; d="scan'208";a="82837386"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 13:29:56 -0700
X-CSE-ConnectionGUID: TVT6Pu6WT+OenNDN0OEZRQ==
X-CSE-MsgGUID: Yo8ABQqAR9qgOsiItc4RVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; d="scan'208";a="248764093"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 13:29:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 13:29:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 13:29:55 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 13:29:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPcd3+LH92YdSVBpcTKIUnjLpe2z0uRbIhyBjCu4U0bE4h510qCyy2seo/SQPjwJ9/d0ZFugtasglMr1OKqh5pZZAYzsjMHTvsVh+0kCi2zapMUH4xY/DVrOwnETdi6jlFPuRXGaM09oGiOlMkzOkY3tz7UN1G+ljYExMMZxGKLXJkMK84b/2aJmnLXmAsqprqrOZ3xu4kikLLjhE2c9LLDgrA5QPBUy0dGjeA4uyBN1TzvKHgIQ++9Qi7AMdZO9Akz0ybLWqMq+F8trISTQ1U7TYSC5thN2k000kOH2V5W7aXwNvI0Cp0rTMG/+zsg2zaXZsL2jbY602t6PCrcLgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ve7FM7G2WTZn1NAi470q8Z+mX7c/6VkDE9GutCs9HYY=;
 b=PYodc50eq7Vh1d9tw0r5IHV/Tq67TCof/XcOM7cMABMzEtbq/RXtO2s8Esqh2FrAzSQ/eJCbn/d4VxYnpnH8IzgXsCJBwW3shMBJOL8+Wfg1gYbRdSfZxKZrItA5Feyg6vEVmBZM3RHmfgxStVO94FN+UiKGanhmuF3+7DqOx5u1cnXYbnreQsm4XpXVFc47lg4dCOoq1A7PmbhxlgeJtNtpHukv9rFUWyax7Ov7ImpEMvfB6jjjKYFfKrvC8u5AI2QOUUyGoW/1UAlDRqGf4cl9BS1Dc8kFz8+lfKr3bwa5LQ3pLYSM2eikj1tTlb9Ikz4fgf1LvHzqGJxMss0cIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Fri, 19 Jun
 2026 20:29:52 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 20:29:52 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v2 3/7] drm/xe/guc: Decouple the GuC ID manager from the
 submission state
Date: Fri, 19 Jun 2026 22:29:31 +0200
Message-ID: <20260619202935.2701499-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
References: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB7PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:10:36::18) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SN7PR11MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 99bad5cc-bb9e-4b09-868c-08dece4184a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 8IljcuCjPRzZZdRecFIbwaI1ImwWRAwfdX6pZp9O1Oy7cltT7aMZ6KTTZb0Y5G72ZPSgGEayxyKAGA/YehM3UC4ILF0ygkN5e6I9zDcOdJj5rWtiPK+ENppJ7Uu+pTZCxvGZYhYWio+Z1zLFIX24LyKX3uvAuIv3O0e91xvtYMd/a3Jb7AL5LoZYAh/zR62Wb7ywJIFlH/xPJvhuitsOf1wfQEpWMceq4oP05YrPYZFzw4MvZBshLWmQHI3fJ+qAdiF/9mWE9lxHxAXlttVoZAzBDzimwB45WEPgEcbXpLgADtkMAWFgu296ZemQmpPYSMlHWDbRKa2Xt1XCFsrXuYHn8tKpjbQNm4nHU7+MvPn2AVHADgR7wVaBcRDTW8ZvhzxMVHQuydwqTwLuvbP7uUZpbZTmerwNQT7l6uyWvlIQPQRqheG8URJNCf514e/dCy5vjE20lDERKXeMAPONOR4rNAgSvWAJLQuq7N+JP579in3dzGYcQYdo7VEWW160bDunU5KEN+HQIHUC8PumMDsDL+xoZJ09RCXExJvW+uLAgy6rrtOHa8MIGuMSfwRnIftUkrRhFHt064uZQ+pDSP5CiZ4WBSRoOpbp25xxXsPHAGLSPEYGXX1OmRiqdvK2QWu7Vebz5sC+qcF9W9wcQWKX0DXOT8Gg2XBd589Qcj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEZrdXR6eGZBRklTWjdFcFVWMGpOb1g5Z1hvS1ROOXM0UzllTlVFb29qT2I5?=
 =?utf-8?B?YmYrb3J4ZFFsM2N0ZHFvbUI1YUZqSzVHdk1YUGZWZUw4UXpBc09xRFdxQlF5?=
 =?utf-8?B?ZzRnUXpTdlZ2anM3dzBab245ZUUwMFQwWkZIZ0szWjRsOUsrWDQ2U1JrcjQ3?=
 =?utf-8?B?ZUwxRnBma0kyTldySlhORWJsWWRJeDM3amhZdldCRkpGajBpVDVRdlZya21u?=
 =?utf-8?B?UmxqMnpVYUNEN1hVRkphOTRSdUdrUHZ2eXRGM2NlZEwwZHh5SkU1Vjc5UVJs?=
 =?utf-8?B?SnBLaGNsRjdSZUp6eHRYcUVoNENtWkRUVTF3d0NQOEVBdFg1QnlvL0dWa1kw?=
 =?utf-8?B?VlhCSVNvUU51NlNJbVg0OVNRMjhkV3ZhVTVaRWIrcXBuSVlKajduWlNWb3FP?=
 =?utf-8?B?UndHY0VNZUJyVytPYU9ZZ1pQc0k0bUtzOTVxMjhpdDdwbmlPbDN3VE9ZaWUx?=
 =?utf-8?B?V3dwRmQ2L3ZZaUNZNEVuZjZodWkwZ0hEaXpYaGVvczVXb2c5Y29hVU1qNHhs?=
 =?utf-8?B?Y2lxYjBaQ2JNcTY4aEdhSUNLdjFPM21QaUYxU25HZ2NtNHdWc2Y5Uk4yVlNO?=
 =?utf-8?B?TG0xdEQvM0NXYmYvSi9YMWk3T3JVTW8xK0dyVU4xZVY5WGMvcjMrUjV2Ri9Q?=
 =?utf-8?B?cGpJNFlJWVhLaEJmMUtFNEREaDFVeUNYQXE2YzhBWmUxZVhoUDU3MGxxQXR5?=
 =?utf-8?B?WWI4VW5hNWZFWlVlR0VVMzIwNGFBT0g2WE9peTlPZHgzbkFHOE5JaXVON0R5?=
 =?utf-8?B?ZHN2bWh3akFGWnN6aE1YSVZCSkUwZVVPUXpUQ3U0WW5SMDlFNDNjVVZVK0ZP?=
 =?utf-8?B?dXNGbWhKUFBtcWtnSHcvYzFMaEpmRzJBbHgyUFJ4Vml5eEttaWhnZVBFd1BY?=
 =?utf-8?B?ZmpXYkU5R25Ka3Nac2FiZzRyby9ZQ3JHajVuWTMwYmdDMDlpWjhpZmNpV0hC?=
 =?utf-8?B?ZitGQlZIdWtBcjhleUNXTGpicGt1cUFHVmw2clRZKzVmcUNwRERaVTdWcm9Y?=
 =?utf-8?B?VVhXZjQ2cjlEOVBaRVhPVHRHZEZzOUpxNExhM01naXl2WVRFVDNIMHE4bkpK?=
 =?utf-8?B?SlE0eitnclo5VWJJWEtCdXM4bHA0aUpvUU0yNElYUW9ZZjFleGFPUWU4NWhZ?=
 =?utf-8?B?NkxlY29abVNyY010UTRNcHBwU1I4TjRqL3g3TWRPdE9sRFRFQmkzaHJMclVB?=
 =?utf-8?B?bXZwYlh5MFI4V0pXUEtTWnYxZ3lvakphK1NMRzdUZFpHK2E3ZGJsTTJGQ0RE?=
 =?utf-8?B?L3BoM3R6MU1CU1VxOHVSN2tqcWtXbHhSY2ZwcFZhZTBFVVVwTmFlRnM0WWY5?=
 =?utf-8?B?QmsxY3R1TXVyT1JuRVJhcW5iZlgwOGpxbEdhbFcxS01mTWVxL3hncU1wYUJG?=
 =?utf-8?B?amR6eThXbEdoL2RIcUhmMXV6cXNJemZHTForeG1MREl4dld0TTZteXpDNHRP?=
 =?utf-8?B?dUN2TXNVK0RDa1FwS0RvNTRLMlNiY3V5b3c2THowNHlobEdMdTl6ZlE2TzRX?=
 =?utf-8?B?VUhjWVIwa1pMdnpBVGFwQ0FvNnExRXNWM2JvUDFMVE5jZTNqc0JJOG9TUENr?=
 =?utf-8?B?SUNGM2RiYUNBUVRSWE9EakRsbjYwZGFLMjFBdFU4VzI0SEtZbWYyUGhlNklX?=
 =?utf-8?B?Z0Q4emhlWnZFZG1KMEJWc1QxcHpocWtlOWVjajFHVy92c2lDTmxTaHdiS1VW?=
 =?utf-8?B?SnMycnkvcVc1akx6c1dXUnpHdVNLMkhwaDkxMGVUTUMwWTZYSVJ6WXE1NFRI?=
 =?utf-8?B?cnNUOU4yNlowWm8wS2F3ZHVrMkdVMFFkVzRzNE9mWklqM2k0enQ3WDU5REg3?=
 =?utf-8?B?TE8wQUZxOVNDeHdKSGpoM2ZHZVpsL2p1RVJvUHhOdW0ra1VXV1Q3WGZRclhs?=
 =?utf-8?B?MDBNN3k1RHRTWmJFMEN5dlpKclpKU3lBbjZvZldkZ01oTS9KSTYzcm1kcmx3?=
 =?utf-8?B?bHNjd2VxYlAxRFlqVnJwMW0vWWx0cDFHTDROUXBCSVk2Uyt2M1JsQmFxZWV4?=
 =?utf-8?B?dHhwcGNBdUpEUy9VaHZrcDJiY1d4akx0VVlNc25rdU5LaEVXRDNJUit5R09k?=
 =?utf-8?B?YlBIT2QvWVNWYXhGdWFKNlFmZ09uRVoweGVROWxCL3puWUlIWGdZN0NoNjlw?=
 =?utf-8?B?cGlFQnFCUUJoY2hNelh0Mml5NVMyT3lPY2hkRVZqdkZJMU02QjZzcU9QMEpC?=
 =?utf-8?B?UjRyNTdSMlVWV0M3d2VnbkJNV1BFSGRqUWFzN25zZ2hscTdjNzk5czRsWWp6?=
 =?utf-8?B?b1JUV3N3bGU2dURKS3VNTVQ0c3RPdERybGFJVGI3aXI5M0VDRk9oU0xUanIr?=
 =?utf-8?B?bDdsMkVRb3hWRTJ6c2dibnVUMy9FVGpoemJqN3pEL3Yzdm5zVkd2enlVVWhE?=
 =?utf-8?Q?UdcibCk1tfTIArd8=3D?=
X-Exchange-RoutingPolicyChecked: R51XuLN34YsPD7DxrsdOfxsQ0F2lw9OFOmdNbKPQMWp4Y3t7LOiL2O1b/74AjjPJv51+2QlpQh6MFy/CE/1n+43QYEgFKjxbkB/Aft5CBGxuqz0gor4PAx1xE725c505eAAgMPEGm5sVH6YzU8o1z5PHchTJahMWpDzYkr92laAqzai9vnDZJMCvOLo6osdFmtxbHuzWLQ4xCpDTtGPD02nksOHNIiHU7VFJgRENtUtMohkTV0AXnwjlPCyslhm0qugMSWKU1e1/rFmFhU/e7xG1vNwCJE4fEdPbmiWqlf4v1gT2Y2j2KQjE8doYni9oJgOStwXZuMqWp9GHspkbmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99bad5cc-bb9e-4b09-868c-08dece4184a6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 20:29:52.8144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkC1SrRtwJnZj4JekCqJc3Io7n0lQlaeVYGFEiq+9MzmudPs5u5tfCy613V8SjHWBFbDsOm9ppo9XbRlSL1WahlxNu7J/I3/Kffod74veQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6897
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

Refactor the GuC context ID manager to remove its dependency
on guc->submission_state.
This allows using the ID manager outside of the GuC submission path as
a standalone resource pool, which is needed for future patches where
it will be used as a separate pool of context IDs for SR-IOV VFs
provisioning.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  3 ++-
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 22 +++++++++++++------
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 18 ++++++++++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  5 ++++-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  3 ++-
 drivers/gpu/drm/xe/xe_guc_types.h             | 21 ++++++++++++++++--
 6 files changed, 57 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index dba6e69335d8..c10d2b3f50ea 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -104,7 +104,8 @@ static int pf_gt_config_test_init(struct kunit *test)
 	pf_set_admin_mode(xe, false);
 	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
 	KUNIT_ASSERT_EQ(test,
-			xe_guc_id_mgr_init(&gt->uc.guc.submission_state.idm, ~0), 0);
+			xe_guc_id_mgr_init(&gt->uc.guc.submission_state.idm,
+					   &gt->uc.guc, NULL, ~0), 0);
 	KUNIT_ASSERT_EQ(test,
 			xe_guc_db_mgr_init(&gt->uc.guc.dbm, ~0), 0);
 
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index ee30a1939eb0..4e4b1c890000 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -15,23 +15,31 @@ static int guc_id_mgr_test_init(struct kunit *test)
 	xe_kunit_helper_xe_device_test_init(test);
 	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
 
-	mutex_init(idm_mutex(idm));
 	test->priv = idm;
 	return 0;
 }
 
+static struct xe_guc *test_idm_to_guc(struct xe_guc_id_mgr *idm)
+{
+	return container_of(idm, struct xe_guc, submission_state.idm);
+}
+
 static void bad_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, 0));
-	KUNIT_EXPECT_EQ(test, -ERANGE, xe_guc_id_mgr_init(idm, GUC_ID_MAX + 1));
+	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0));
+	KUNIT_EXPECT_EQ(test, -ERANGE,
+			xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, GUC_ID_MAX + 1));
 }
 
 static void no_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
+	mutex_init(&idm->internal_lock);
+	idm->lock = &idm->internal_lock;
+
 	mutex_lock(idm_mutex(idm));
 	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_locked(idm, 0));
 	mutex_unlock(idm_mutex(idm));
@@ -43,7 +51,7 @@ static void init_fini(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, -1));
 	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
 	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
 	__fini_idm(NULL, idm);
@@ -56,7 +64,7 @@ static void check_used(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 2));
 
 	mutex_lock(idm_mutex(idm));
 
@@ -78,7 +86,7 @@ static void check_quota(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 2));
 
 	mutex_lock(idm_mutex(idm));
 
@@ -102,7 +110,7 @@ static void check_all(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, -1));
 
 	mutex_lock(idm_mutex(idm));
 
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index 0738fc277bd2..f1e69650fb7e 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -16,7 +16,7 @@
 
 static struct xe_guc *idm_to_guc(struct xe_guc_id_mgr *idm)
 {
-	return container_of(idm, struct xe_guc, submission_state.idm);
+	return idm->guc;
 }
 
 static struct xe_gt *idm_to_gt(struct xe_guc_id_mgr *idm)
@@ -30,7 +30,7 @@ static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
 }
 
 #define idm_assert(idm, cond)		xe_gt_assert(idm_to_gt(idm), cond)
-#define idm_mutex(idm)			(&idm_to_guc(idm)->submission_state.lock)
+#define idm_mutex(idm)			((idm)->lock)
 
 static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
 
@@ -63,6 +63,8 @@ static void __fini_idm(struct drm_device *drm, void *arg)
 /**
  * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
  * @idm: the &xe_guc_id_mgr to initialize
+ * @guc: the owning &xe_guc
+ * @lock: mutex protecting this manager, or NULL to use an internal lock
  * @limit: number of IDs to manage
  *
  * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
@@ -73,10 +75,20 @@ static void __fini_idm(struct drm_device *drm, void *arg)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, struct xe_guc *guc,
+		       struct mutex *lock, unsigned int limit)
 {
 	int ret;
 
+	idm->guc = guc;
+
+	if (!lock) {
+		mutex_init(&idm->internal_lock);
+		idm->lock = &idm->internal_lock;
+	} else {
+		idm->lock = lock;
+	}
+
 	idm_assert(idm, !idm->bitmap);
 	idm_assert(idm, !idm->total);
 	idm_assert(idm, !idm->used);
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index 25c6f026449a..d0ce8ce85b7a 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -7,9 +7,12 @@
 #define _XE_GUC_ID_MGR_H_
 
 struct drm_printer;
+struct mutex;
+struct xe_guc;
 struct xe_guc_id_mgr;
 
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, struct xe_guc *guc,
+		       struct mutex *lock, unsigned int count);
 
 unsigned int xe_guc_id_mgr_total(struct xe_guc_id_mgr *idm);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 537985f4d3b7..154d6129ea44 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -311,7 +311,8 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 	if (err)
 		return err;
 
-	err = xe_guc_id_mgr_init(&guc->submission_state.idm, num_ids);
+	err = xe_guc_id_mgr_init(&guc->submission_state.idm, guc,
+				 &guc->submission_state.lock, num_ids);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index c7b9642b41ba..0850918c28b0 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -7,6 +7,7 @@
 #define _XE_GUC_TYPES_H_
 
 #include <linux/idr.h>
+#include <linux/mutex.h>
 #include <linux/xarray.h>
 
 #include "regs/xe_reg_defs.h"
@@ -33,11 +34,14 @@ struct xe_guc_db_mgr {
 	unsigned long *bitmap;
 };
 
+struct xe_guc;
+
 /**
  * struct xe_guc_id_mgr - GuC context ID Manager.
  *
- * Note: GuC context ID Manager is relying on &xe_guc::submission_state.lock
- * to protect its members.
+ * Note: GuC context ID Manager uses the lock supplied at init time to
+ * protect its members. If no lock is supplied (NULL), an internal lock
+ * is initialized and used.
  */
 struct xe_guc_id_mgr {
 	/** @bitmap: bitmap to track allocated IDs */
@@ -46,6 +50,19 @@ struct xe_guc_id_mgr {
 	unsigned int total;
 	/** @used: number of IDs currently in use */
 	unsigned int used;
+	/** @guc: back-pointer to the owning &xe_guc, set at init time */
+	struct xe_guc *guc;
+	/**
+	 * @internal_lock: own mutex, used when no external lock is provided at init.
+	 * Do not use directly; always access through @lock.
+	 */
+	struct mutex internal_lock;
+	/**
+	 * @lock: active mutex protecting this manager.
+	 * Points to @internal_lock when initialized without an external lock,
+	 * or to the caller-supplied mutex otherwise.
+	 */
+	struct mutex *lock;
 };
 
 /**
-- 
2.34.1

