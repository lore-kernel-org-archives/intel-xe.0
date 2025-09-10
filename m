Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8E5CA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 14:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0A010E92F;
	Wed, 10 Sep 2025 14:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3HJ5+Db";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF0910E935
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 14:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757515077; x=1789051077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wmJSuyC68dvxBLeJws4InYcRGUcB6BUN3BQDGwicK6A=;
 b=W3HJ5+DbLKTTllj4THx5gAvCygy4C4q6vv8+mC3C7wa6M6FgXTU3vd20
 GSmd1U+I94cGD5w6TZ6G7/sKI0yPM9sS8+lOz4l5Cm1VVbZ0LQaDVgOyb
 Kf8m6wj1hd7ffb1S0fcAlT/n6nGBNhpP7zmPvCCTFqA4o3dPrBk2LGXZK
 4hcfwoRuAhc31mVbO+Mktqpz49BPV6vOLhhDYbmSu3HFRrPgcag6Hg0P1
 QqnwKTJ/yQMIku8DPPEwZeWPvG31rhL7lIMjeeft7RdkNruVdMHiou276
 O0ox5K+7ZhN6j197AMAxZ56yRfA1mQUKGleRLkA15Vix5cP22yVF5QYsB w==;
X-CSE-ConnectionGUID: syp6rEhrR1CiIoBe+fWvoQ==
X-CSE-MsgGUID: 5xdEzX1+TXOBRIRMDd8WyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63657799"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63657799"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 07:37:57 -0700
X-CSE-ConnectionGUID: gM7jp3McSD2xgFahwze+zA==
X-CSE-MsgGUID: tey/cEo6RgyKRiBNEDln6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="173791429"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 07:37:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 07:37:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 07:37:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 07:37:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQL4eXyGYdJYgqsB26lQzXebDIUnQvblD47cBTDU1+5cTtdJvS3zZjEslvWpTmNiR2i4nWefeO8NQ+rmQ+RUnROk20KlngPKTA8OKruyfmHqfb+l9cD0FtbmDe6o7DbSzY5Iw9QbmjfRQwVHZEsibncbx+hyDph6Y7NypL5NWRA7srBnqKtY2tUjy3At7jQephKjQgopz9JQajOSfy6DauWWF+cqs5OSTokaDEuf+ZyIQe5KBeMJ1PL53IeIY5vTyxsE4t0C5XWUIL8CM05Iuv8TAIsyS8/i3xO0xTLXDn8F4NbdlkappywdMXqvGkeDGaH0mHwodUT4m5+8vtQkfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmvITtDdpkLbnSVH9MmPCihCNBp3JqHRxly2rSQwH7s=;
 b=Htt50nRuz+G6m5mH8ySlQs07UtmrUNdOVQzQTBCGxrV+OPB+4h6CBd1FqubEw+ekgCz4sKRZgNSxR2dZpltWCBL0vD+Y1QL82u8YHMY8hD2gct8/V4iQJ2JMe/dAtW3dD2OxIM6n8Hdy2k3Y+SqitXoxKWsWARroOwjNe9u3hEJTLO/zqxbHpe7qB0rQI8VER7Lb7EwTT30KaiYb6V0deWF5XS0a0wzBy4MK+kA7NI7lIkKrUeAfSsSmDElwFuOyADAkxlTfQFS2ts6hLLBqqw2vL8pXDWv6xyq+e8s3D/Ql3t29QRGf17bHtaRjF3KJYlEJgOlpnXel2FNZ16FETQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:37:52 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 14:37:52 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v3 2/4] drm/xe: Introduce new BO flag
 XE_BO_FLAG_FORCE_USER_VRAM
Date: Wed, 10 Sep 2025 16:37:34 +0200
Message-ID: <20250910143736.792426-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910143736.792426-1-piotr.piorkowski@intel.com>
References: <20250910143736.792426-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB6744:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb160e6-58de-4737-421b-08ddf0779f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnY2dWx1dHNBOGFRZ0c0STlPUlNLNlBQZlJNYzl2dnFUY1lXQitHd0JLaW9V?=
 =?utf-8?B?VmxHRmxUR3lnZG4wWDBzTXZmcDR3OXI3VktjOTYzN1Y4S1pqTUxqcytKdEk0?=
 =?utf-8?B?S3hvOGpST013NlJMY0R2aG1uUURvS0ZJcithVm5VdStIeUtzOG9hb29xN1dq?=
 =?utf-8?B?UGFxV3FxM25ocVJ0bWZqZVJIVGlSTUJFV25XU2xwRHhKTWp4OURJNFJtQmdo?=
 =?utf-8?B?S042QWVpaS92NWtWTndiT2E2QU9TcnN6aXFMZzM0aktIM0plTWtuQm5wRFUw?=
 =?utf-8?B?aHNUM0NtcVFpczNrYWpHRElGUlJ0RW45UlRzN043LzVOcytveWJmRW50ZWtX?=
 =?utf-8?B?dHpLYzY1OGlmR1UyRDdiSXl1V3BPRGNIZ2NqVm9kOFJxMjROWXpsYXkrdmdS?=
 =?utf-8?B?YXB0RU9mcS9JVDRSY0RIdXpwRkpjYmt0eFlGVmtJczdNOXp6U29UNXBrTnFu?=
 =?utf-8?B?WXBsZWsxQktSLzhHdHFycVZYcmZVdUZFT0FwTnE3bkFDVHNIOFVWL2RzWU5T?=
 =?utf-8?B?ckxZYXphYXpnRUJxS2pxeUl4ak8wYzFUS2ZTWEJHME9EUnFVYUYwRkNhYkEv?=
 =?utf-8?B?WTVJV2JpTEZ2L0x0V2QxT0dTTnhVVFBHZE1EWUR2S2RXc0ZsMy9EVC9pbWNK?=
 =?utf-8?B?K3A5WWUyOWJkZ0ppdGVGMWhkNnNUZFhwZTZXVGN4aFE3SFArQWptZEU2S3N0?=
 =?utf-8?B?dHJESXdVZ0pYQi9ZYVR5QklBQ1VNeG9lQzhzdTFvUkVnUm9BWjZDNUlrSmk4?=
 =?utf-8?B?SHNJTzlGUlZ3VDh3THZHWCtLTVgzTmdXTldsaWhPcGs1UzhJQW1hK2UxYWta?=
 =?utf-8?B?d0poNlJkdWVUTlZHeGZidXR1cVp6WGcvcC9EaWdreENFWEovVlVEeXpSWXBL?=
 =?utf-8?B?bEd0K1l6QVBtVm9JSlBMZlcwRlVPRkQ5R0UzeTBOMm0wSDY3NUVKMXZOcVN6?=
 =?utf-8?B?NmcxTGhFclJNRUZHcllibEVmemhHM1p4bWdnM1Nuby9zQytOdlZXeTRycUlv?=
 =?utf-8?B?U3hUUG9SbytOUU81d210b2llYzNhQk0xNWFiWnZUMGI1OCtxeG1Od1pFVFdZ?=
 =?utf-8?B?MnJWRU1aSmNCNGUyVFZYR3FwMXhYV0xVWEJTUkNKMzNDK2d2TjZGdm9FWVlQ?=
 =?utf-8?B?c2o3aUtkWkphY2RvYkdoV3JaQXpMVnVPVUxZSEFvMHpoL3R6N083dWl5Witr?=
 =?utf-8?B?ODFMaUxaL2RwT0Jmazk3T1dPSUlTdW1Pd2ptb25IZHVWT0NGMU9GdnhmeFVD?=
 =?utf-8?B?QThqZm9tSXdIeDhrRDFpZnBhK1hGQlEyUVVZeXdOUERXUUJGdFhyL2xvRlJV?=
 =?utf-8?B?RENIZnZWRGM3cEFhY1V2Z1h2c3ZRYldXc2J6WFR6cUN4bE9EMlFKTUYzOE5N?=
 =?utf-8?B?dHhDdHozQUp2K3E4YTcrTnczNXMwa2wvQmNRNUZQOWR4cTZjUXFLelN3Z1Uz?=
 =?utf-8?B?K2xhNHJvNzVQb015aU54WG9zTDBjU1hGNno1NzRKNUI0djJzeDd6WVFzRmsy?=
 =?utf-8?B?ZGVoL211eTB4b21HSGhRaldtZ0k2cUdPNDQyVXZLRHVueUhlMkh2bHlJSVYy?=
 =?utf-8?B?MU12ZUZXSExlWTBONnZIMUNDTEVaeWdROThTN25Ld08raUphS1Z1Z3lJU2Ry?=
 =?utf-8?B?dW5wYTdoNUdXRGI0REtZUDdEUXVxdTc5eHdzcGwva3dOVkdoSzF0cHcrZVht?=
 =?utf-8?B?WCtNcm5mckIrUGlzREIxeUpYSWRNQlhhSHhiNVNIS1VkM21iQ1ZUVTFUcFhB?=
 =?utf-8?B?V3J5Q1IvN1BEWE9xdkoyUUl1TkxJdFVXNy9GTXRFelV1RzNyR3IrYUxtS0hG?=
 =?utf-8?B?ZjZGNmEvU0Z3ZCtrK083eFBoWnhtektUQWJNNVJaeUlVVXQ4M1FEZzBSTldV?=
 =?utf-8?B?dmQ3WnpJN0IrQXRKNlpXelNLTDIxYWVJNHp6TmdsRFRlNng1bmVEazhReE85?=
 =?utf-8?Q?Ljw+pQO+Oc4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnJjRC9VMHA0S0M2a2piZ1daTE5lTEU4QmJaakxBQUtiajhQSEtyTXgrZnNG?=
 =?utf-8?B?MEswZWY4K1BjMzlMRTl2bHFITlEwejM0QnZHSUFpVDRmcjBpS2tHRWk2bjkx?=
 =?utf-8?B?Z0VtcHVKSzA3LzRHRDVMcFE2dWRIODZXTWJQQ2hpY3ltR3pmVnFOaEhPSytV?=
 =?utf-8?B?REg0Qjg4dXhDa25UbFBhSklZbklJaTU5NVVNWEJtNjl0dnUzREpNU280Q1E1?=
 =?utf-8?B?U0dSYVA3dzB6TjZmZGVLYythOTUySzRvaWc3UklRNmhjbTRXS3FGS0Y0U2Nr?=
 =?utf-8?B?a2hzSG84Qk43SnRHK1o2SDMrMEV2ZXI0ZnVhcEljT3VlSEI0a3RXay8rQ3lz?=
 =?utf-8?B?R3g2K0MxQkNQUVpOcmY1NEFiUzJ3U05vWkNMSnpoeStreGxLeW9yOGdQdDBC?=
 =?utf-8?B?S01aUEUzN29pVGdNckVwbmNzUEVNOHczWlJpQmtwcW93Z2FmN1ZWMy9Wejgy?=
 =?utf-8?B?VjgxRkZ6cC8zUWo0NVZkRm9RUTJldlQzbkpXc29QSUgrNlJqN0FtSlV1aDlk?=
 =?utf-8?B?eXdYcGJFSGJlRkc5dVZVWk9LeThjdzd3RzVYODZFeWx1Rm9BQ0RWdjlhQkFR?=
 =?utf-8?B?YlhBcnVWOFZIY21OdVRLaElWMnlnVi8vVEdGQzgwQ0RqU0MvUXlaL0NZS0dB?=
 =?utf-8?B?aXRGdnBXTFp4M3RmSkVXVEpFVGVmc0p2R3RTQVRkUFBSMXpLdldUdGVnRXBN?=
 =?utf-8?B?c2k5Q0RobVp6TUJWVVUydHppYWpxQXlkSnIwYVg2TXZQUTE5NGJRamtsVDJS?=
 =?utf-8?B?eUJ6bnFDK0NMUnBaazl0NVQyVVdYTXY2NDN1REI2UFFXdjlkQjdOdnFjYWNj?=
 =?utf-8?B?NHRSR0d5ZlpWcnhRTUJZdVVYQjVIREdpdXFlQ3NST1FoSXNLeENKZ2hmL2pY?=
 =?utf-8?B?c09DS3hYTGFtSkNQMlBzUXFFQ0dqVTVzVXQyUTZEN2ZqWHVaSGVNWG5wSnR1?=
 =?utf-8?B?WnBCREdia1RnWWRCL280MURRT1Q3ZVQzRUIwNGFLZWw4b1luZzR5MlNaVUw3?=
 =?utf-8?B?cE1BOWh4M09oSGxFelRQdDRTMlM3WU12WS9nYW1RNzZRVVd6V1VaSjRxVS9H?=
 =?utf-8?B?NVdpMlVZR2dzNTFyMWhTTmszNGNObWVOdnlMMVFuTll3RjdIRUMwZkRCUkNO?=
 =?utf-8?B?K3U3UUpFcExVdDVPcU5jZ0JTZUJjWFZmb1Z6NWdVSVl4RXV3Ymx1MERRQnJn?=
 =?utf-8?B?R25vL0pVVDJtZHd2b09jdldxRFoxNUhzMDB2NGw1S05DWDQ0NGdKTjNEUDB6?=
 =?utf-8?B?SUFjL0lORDBMWjNtWVNQTlA1NTZjaW5Ibzk0Y3FTTEl1Q2dMa3ZhVk4wK3ZB?=
 =?utf-8?B?bjdWMGRycHhoekx1Zm1scXo5eHFkcDB3Rk1zS0RpZExCcVNjQldoQnVGL0x1?=
 =?utf-8?B?V1dRWnVVOXdiME9CSDJVWmltakN1MkM3cXZ1dlJaWHY5NUpsZms5cW5JUTJZ?=
 =?utf-8?B?YXFiRHIwTWdiN2VlSDM1TElHdFNEbWRnNFYxb2Zsam5Fam5qUk4wNit0ZFF6?=
 =?utf-8?B?VUhWT0pIM0E0ZTFKbndERUlUL3N3RGZ2UkV4Qnl4b3Q0dzIzTkIxUDNKZmFO?=
 =?utf-8?B?Sk5GdmlJUzFjeW1sR25OeTB0b1VySm8vbE8vKzc0OGVzZ21oaWdoakpabHph?=
 =?utf-8?B?QW5TdTFFNkRHQkVDYUtablQrMUxPSTdGOXl2U1I2WHZSNThVU0ViODludWlJ?=
 =?utf-8?B?eG5FdFhIQTZoSFhpS0VRYlJhMjgwY3RoaHpCWG1RTERrZTZCalZLYmo2bzBz?=
 =?utf-8?B?SHdXZ09Oem54aG9BVzJTSjJxREplcHIvdkRQYUkyazAwUVdrQXd0U0RYbFFL?=
 =?utf-8?B?djg5S1MveWUrbnZtSi9Nd1VLcHY5Q1VNSDdFN2JyWlYzNm1wYURVS2lmaTlm?=
 =?utf-8?B?UnNMOFJEVE02V1l5ZjdFUTRvdVVBK0FWa0VSOFUvYzVnZ2RpaWF0YnBGY2VR?=
 =?utf-8?B?cjk5d284c3ZlRklUQy9LbXo5Ny9adzhYR0hnaFhlcEtIM1oyU0JiYVlEOFpQ?=
 =?utf-8?B?MGFaenJHWjdwOXFMa25QRW5VK0tNclpoSjVRUE5lZWlVcWJaZWttaVVBMXlq?=
 =?utf-8?B?YzRORDlvMUxtNytxQjIvdk9XYVZVSG5UT2diTkZpTERYVDB2d2MrdGplMTNI?=
 =?utf-8?B?cU5VZ0xIa1FPVk1ZdUlNbXordFI0QXllSzVyQ1U4R080UTZ6a3EzR1p0elRQ?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb160e6-58de-4737-421b-08ddf0779f7e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 14:37:52.5822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0i0ZfuEi/Mxj3XAZMYNNOnK5KD2r67W3WBJWYVy66Hclv3ZII8A0u0vcMq82m3FZsC/A3YeXv8VVagkNoDAo8taCOOWx4ZVnADdSXo9ovjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6744
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

When using a separate VRAM region for kernel allocations,
some kernel structures, such as context userspace data,
should not reside in the VRAM region dedicated to the kernel.
The VRAM kernel region is intended only for allocations necessary
for driver operation. Allocations created via ioctl are long-lived
and not easily evictable. If this region runs out of space,
there may not be a fallback, which could cause failures.
To prevent this, add a new BO flag that explicitly forces the BO to be
allocated in the general-purpose VRAM region accessible to userspace,
avoiding the kernel-only VRAM region.

v2:
 - update commit message (Matthew)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 11 ++++++-----
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 97b242715ae1..5d5e7608d64d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -226,14 +226,14 @@ static u8 vram_bo_flag_to_tile_id(struct xe_device *xe, u32 vram_bo_flag)
 	return __ffs(vram_bo_flag >> (__ffs(XE_BO_FLAG_VRAM0) - 1)) - 1;
 }
 
-static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 vram_flag,
+static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 bo_flags, u32 vram_flag,
 					   enum ttm_bo_type type)
 {
 	u8 tile_id = vram_bo_flag_to_tile_id(xe, vram_flag);
 
 	xe_assert(xe, tile_id < xe->info.tile_count);
 
-	if (type == ttm_bo_type_kernel)
+	if (type == ttm_bo_type_kernel && !(bo_flags & XE_BO_FLAG_FORCE_USER_VRAM))
 		return xe->tiles[tile_id].mem.kernel_vram->placement;
 	else
 		return xe->tiles[tile_id].mem.vram->placement;
@@ -276,7 +276,7 @@ static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
 	u32 vram_flag;
 
 	for_each_set_bo_vram_flag(vram_flag, bo_flags) {
-		u32 pl = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
+		u32 pl = bo_vram_flags_to_vram_placement(xe, bo_flags, vram_flag, type);
 
 		add_vram(xe, bo, bo->placements, bo_flags, pl, c);
 	}
@@ -2263,7 +2263,7 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 	if (flags & XE_BO_FLAG_STOLEN)
 		place->mem_type = XE_PL_STOLEN;
 	else if (vram_flag)
-		place->mem_type = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
+		place->mem_type = bo_vram_flags_to_vram_placement(xe, flags, vram_flag, type);
 	else
 		return -EINVAL;
 
@@ -2294,7 +2294,8 @@ __xe_bo_create_locked(struct xe_device *xe,
 	 * that we are using unified VRAM and we need fix VRAM BO flags.
 	 */
 	if (tile && type == ttm_bo_type_kernel && xe_tile_has_separate_kernel_vram(tile) &&
-	    (flags & XE_BO_FLAG_VRAM_MASK) && tile->mem.vram->id != tile->mem.kernel_vram->id) {
+	    (flags & XE_BO_FLAG_VRAM_MASK) && tile->mem.vram->id != tile->mem.kernel_vram->id &&
+	    !(flags & XE_BO_FLAG_FORCE_USER_VRAM)) {
 		flags &= ~XE_BO_FLAG_VRAM_MASK;
 		flags |= (XE_BO_FLAG_VRAM0 << tile->mem.kernel_vram->id);
 	}
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 21c8741126c9..9be762e2f251 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -49,6 +49,7 @@
 #define XE_BO_FLAG_GGTT2		BIT(22)
 #define XE_BO_FLAG_GGTT3		BIT(23)
 #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
+#define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
-- 
2.34.1

