Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5055C7EE30
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 08:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF1510E108;
	Wed,  2 Jul 2025 08:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C0b8mGWH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3392510E316
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 08:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751445945; x=1782981945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wtsiFp2LaAZehmouKcz89kKUUb0TKVE3BtT79VKf9jk=;
 b=C0b8mGWHmvL/CavwbSJopQOx5KGPd55OhMRIpGCJMZNluUCwyHg48jMF
 uJoI8EQZJAHtB2sVInlGIgylv9hAWdqm1w7yGbRedoBYEoWbR30ZTuDKK
 2z0bOFkgN5rs6RdzxHAVysH69J5ZA+kVudOsYqrUcJcPNOfy1qFgYQINA
 FiWOwtt5mbJXhPvryrFmXyru+EtAh5pv1/7n9QQz2xTdZ10Zug5w67z+s
 fIC4kOmobmw+MdEKmSXzvDqGjzlshjRbqe81B5STsJJAqq6AzgZSQRyKv
 ihUo6wdAkC2lOYQAjZ4nFlIw5IRjTB6d01Jg9/f99KoZcwlOKYbiS448X g==;
X-CSE-ConnectionGUID: MA3EhTddSUa4Vg0LnQDG9A==
X-CSE-MsgGUID: wari0QkrTW6RMgWtB4pl7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53597998"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53597998"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 01:45:44 -0700
X-CSE-ConnectionGUID: j35ydayFSu6E4jLqpeLkSQ==
X-CSE-MsgGUID: jH4gSqb2SvCvuHx8yRRiPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159531589"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 01:45:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 01:45:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 01:45:40 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 01:45:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wc2tNzXi8UmW4Dr2wE0hMA0kh0VjRWoNf3R9s+2yPERa/qXG+9FuKmLtXuSkar5BEQmUx1P1SzJDV34hZzVt/nALyP+uSK1eCRAjUZBxl9EsTJyUpijlyUT4lUx3f40LgDTzd5FDS/auxw1cAWbzrY4PKqy+mPiy+iA5xA0IZ58MFx6x+TxtcCUPYGT5Zgvz0yqW6I1pdDQKH4WtBE5MvjMbICEZFPP3mHi9FKM646Ab+Iysxl6jepT1WuSjfMnUzH83PibQXHMMVI2DsEMSVVn6gnrykk2kRpsCewLHpPkJ2lSLSFI36zIJ5ukg/ktOGemCkc7ZClzdnecvAiKchQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKLzdoa05Q+v8tuNq6OeZr6+TafwzZKDBLwTOl80RSE=;
 b=ddyDekMPSI/ehghCHNOliqhbpPTerz7kJ3/0LWL2mFKUgp7I9MJsh/nePg79sAva8aEq2ZuDFJ9MNAAavP1a7bMxkMkaXRBsykysdCnfNrTtcZtC2rPQDATY5wVPASa6WqKmEb6uHNc5mjMe5azgxEibKIiqJ8Dzniv043P0jnoQehBb3otkBb4BmbxJCqtB3lKAGTe6fmEajkv/wZ1X5XsYOga/214zi1TVPMuM7geVHPFXY9gwydVODWSOtHqrsSuIo5LY6Fw67D1DoI2m8G0u+RfHWnj1pha5gUP+lqWUJvLY5N4Duiv2F+6LZrjTvYT8vsbmBbGLEusJBINeXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by LV3PR11MB8482.namprd11.prod.outlook.com (2603:10b6:408:1bb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 08:45:08 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 2 Jul 2025
 08:45:08 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Jani
 Nikula" <jani.nikula@intel.com>
Subject: [PATCH v8 3/4] drm/xe: Move struct xe_vram_region to a dedicated
 header
Date: Wed, 2 Jul 2025 10:44:23 +0200
Message-ID: <20250702084424.3609863-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702084424.3609863-1-piotr.piorkowski@intel.com>
References: <20250702084424.3609863-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|LV3PR11MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 93e05e16-678d-40f0-c7ba-08ddb944bf71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ukd4bjFQUzFPNWptRFdwOXM3RE5ZMDV5VjJVL3dHTy9qaEhWeWMxNHpaNmJ4?=
 =?utf-8?B?RUYyMTdnNGFSaUQ3bm5DcXZoaTM3SzlDMkNQczFFMFBITVRGMjBWMWhCTVl1?=
 =?utf-8?B?ZWtrckNYSHNySG5VOE4ycmF3WEg3emxXMi9wSDBTOXQzSkRyQjVPSkNPaWVT?=
 =?utf-8?B?UUttREJQWTY3bEVrdHhZUk9oZmJBUDVGaXBVOTRnQnN3RzZ2M29EQjh5VWF5?=
 =?utf-8?B?RVZFc1VsTTdjbERVby9IMnpPd0Z2bFBObjRlekZES0NvYTRMNWRsNktrZFJz?=
 =?utf-8?B?NktzdEhGRFJ4czhvYXNMS3k0TitHdVBuKzRKMERMU1Nrc3J4YksyN092TXhM?=
 =?utf-8?B?eDJiVW1JVGtORVpHU0p1d3VUeEhuc0E3YVFJUFJCQkVYZUkyVDdmc0VuaVVo?=
 =?utf-8?B?L1RFMnZmZkJvc3pFQ2J3Uzc1bmQ5YkQ4Q0FZeGlHSGpjOUs4aGFoa3lseE9P?=
 =?utf-8?B?MnZrc3JPZWswZWFQSTV1TVQrSTdBQ1BxdTFDcm03czZHaFRXdkl1Q0xpVFNE?=
 =?utf-8?B?SUdwWXZMWjU1OXV5Q2svcXhFYWk4OVZrN1FDWEhqWDdCb3dENVFvOWtUSVk1?=
 =?utf-8?B?Wit2ZW5kZ3dXY256Z25xSWhINENMRit3YTR6dG1JWDExS1ZpSThBUVBRTjVl?=
 =?utf-8?B?Y3JaNFd6dis2dGgrUWgrL09mQmVQM0JyR3JqeWoxTzVMcTJrbjMxVnRBY2Fv?=
 =?utf-8?B?UTdlMmFXZXpVSWJnNTNGeGllbEFxM1E4cGpnZE13MTd3V2xTYkM0UXBLMEVq?=
 =?utf-8?B?Z0ZVOUlFVWRNZlpHdVVDc2JGeW9PVTIyb1N1aWV3dnBYWjgwcW9YTlNudHRN?=
 =?utf-8?B?cWNrbTMxR0tLd0p6bEMxbzNHTzdKa3dQRzBtTkVmb2NuU0lxcUdMYU1JWmFZ?=
 =?utf-8?B?eWx2TEIvNkNpZnlpNWN1b1pvMGdrWFZnZzhwTVMvd2pwcHoyQ1ZVeXh2ZDVj?=
 =?utf-8?B?bVBUaXBTTmZtR2p1cjBrWlZvY2VOMVhRSnczcjdyaGl0NFkvQ3Mwc0pZNnJQ?=
 =?utf-8?B?dDNkWmR2NGZXU1RVRm5na3VXZmJLeU5sSk1udFAzb2lpVmsrenhLUmc1TEZh?=
 =?utf-8?B?NGVnY1dYaTExbHpRaTd6WWRFSmxHYVFrcEd4MnEwWktuVGlsM1RRRUozQ3JX?=
 =?utf-8?B?TkJqdmJNWlJjNExuUzhiWG9BdEljbzhIbmFINmUwTituKzUvRi94YjNZYnBY?=
 =?utf-8?B?RW5SNUZsT1RiUTgxSVY2U2lXTURVWnFLM2EydUFEb0l1bUxUaGpNZVdQTmNn?=
 =?utf-8?B?Q3djcks1Q3IzUTBGaFpGclF3dUgzRGQ5ZE9vUkZhRWphTkt2OXVSbTN3OHA3?=
 =?utf-8?B?ZXlpdWR6dFZTNk8vVnVGZWV1Qjc4N3BGRlBEWEhOTHdkOUI2T2tpQW9OcG9q?=
 =?utf-8?B?ZVljMnVkMTRJaC9nKzA4ZU82alhnK2c2dVIvMHBDVEVtMXgxK2NPV3A3VjZL?=
 =?utf-8?B?VTdrT2hwcEVwWWJ3b2w1VWw4ejI4aGk4a3djeG9RdkFXNWxiek9YTkdrRVMx?=
 =?utf-8?B?aGtBRXAvR0NxZklFQXcxcFZ4T1lFUXlDOE9Cdjh2RDQ0Y245emtoV1ZjbjZX?=
 =?utf-8?B?MGZPVVg4V3BOd3FVTkczZW1MeFF3Q1FqN1JMSUFtaHlsallTeHRDSzJnMWFs?=
 =?utf-8?B?c1dFUVNSd0VnOFpaVXpHZFNFeUhOYWdVdEZIK1VnTVgvZWdxZnF4QU1HTGNZ?=
 =?utf-8?B?TDJDbklYT2hMUFhkeGxNMktvZ2Q0bGxmOERTUEQ5VXZpeDVsOXdUcFlQOE1p?=
 =?utf-8?B?OVVhTm15alZLVVpVL0hBbmZoNklrWTBVMzFpODdqVXovU0IwYksvVGRDdVBa?=
 =?utf-8?B?Zm1XUEk1SDlSK0ZaUmc5cWhmTDU0SURlWE56U0V5T2plSG56QVRIY0JpZ010?=
 =?utf-8?B?WGlEb0ZuNUtvVFYrRXNaeXVKM0tMcVNpc09IN1FpRmNPTXN5b0RkZUUwV1h2?=
 =?utf-8?Q?q3Fh8Vhr7T8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm9jNEgyTHBXK3o1cGJrZGNYSDNVVnRUWE9SaFF6TDcxVWFkZmRqenpZcGFy?=
 =?utf-8?B?QnJvYnlEK0V4cUU5RStVYWRxRGFoOTRxUDRBZGpEM01jeG9WK3lqUEJwSFo2?=
 =?utf-8?B?Q3U5U0k5SXU0TTR0OWg2ckszV2ZvL2JqNXdGVkhpMDFSeXBZMElkUzR1eWJm?=
 =?utf-8?B?YnpkSjk0OFZncFRmUmJyNDhkcm1COXVtZE9kRUNXOWdyemVKN2hXRzRoVEVJ?=
 =?utf-8?B?SGhJU3VIam1ZNi9CRk83ZzVvdWluWWIya2JkbWpOZlVZQlM2MmJ4U2ptVDB0?=
 =?utf-8?B?cW92c1QxQ0NHM1hrKzlGVGREV1c3MStGdCtLS0hVeGVaUXNYUDFGUUNtRU9j?=
 =?utf-8?B?OWxDY3dpUVYxMVNyQ0NqVDd6aHcxazRnYkIydldweXk4d0o0amVrenNnTnQz?=
 =?utf-8?B?aWxtZ1AxOGJUdENKNStWRGYvc2djQlNybHBWaUtoenhEY0pocjNBWUZNeTE1?=
 =?utf-8?B?aWJsZ3R2M1pTYjV2aWo4Y2VzRnQ4WHJyUVJkejdCRDRSZm5KdUlZVjg1bVBo?=
 =?utf-8?B?M09Pa1lDZmVEa0lIZ0RtS2RQTW1Ja3JiemZadmlKWUlNcko5TEdjUWZtanpD?=
 =?utf-8?B?T0xtWHZUOVZXVFZOTS9sVmNxYTY4d3dHK1NYcUx6aWpkTk1YcWx2RS9GZy9R?=
 =?utf-8?B?YW14V29FMXozMkk1SVhYOWtsNU5OR0JXNFlMcTVyeGxUZThaK25ibHh6RFM2?=
 =?utf-8?B?QllqeGYzcDNnNjNCOXdjVUhxblNhcVU5b0Q1TWFiV1NNV1JmWFFqNjRTZ2hO?=
 =?utf-8?B?eXBsakEzSHZldDU5aXBvdWdNUjFZTFJhNExEVWhpbFYwbEF5SFFJaWdsYldP?=
 =?utf-8?B?NnZwSTU2Y2xSZWFxYzJHV29sWGl0eU9maFhPTFZ5MHpxUzRvT0Uxc0pHUmhz?=
 =?utf-8?B?NGJMRFV0T2ZHay9hbUM3ZitGeWtCOWRlQ0ozNlZDOUVrVWx1TklzL25hMGlW?=
 =?utf-8?B?ZFFicmxkQUxBblZMMWdreG1oeHRSaHpuYlZmMDQzT0M4dFhLc0ZMTGZUb0Vm?=
 =?utf-8?B?WHdadGNuNG9ZVG51c3M4UTVZUjJwOVZNVjFmQytURzB2U3JBTHN5RDUzS2Q4?=
 =?utf-8?B?SFliVkpvOVRsYis0blpWMzYyNHpwYUJqbU1BYlIxa0d6QzdFZWx3RUNXeVNN?=
 =?utf-8?B?OWFxV0ExMGtnOFVybk04N0NmQ001TVdjbnZGRGpJK3QycWUra2hQanY0WmJU?=
 =?utf-8?B?RmpmcVdpQTlJM0lnb3ZSR3JxU2V5ZCt5OUNSdXRSWU9HRUVYdTliQnBaajA5?=
 =?utf-8?B?OURrN3AvUmlTc1p5VGl2QWx3YmNwY3FZMDFSekI0WEptMmJWZ1RaMVl5bnVF?=
 =?utf-8?B?TnVNV2lMb3BWc0xiWUdDVW11dlNFQUZiWVB5djdWdWpXR3hETHpJU0NTejNr?=
 =?utf-8?B?ZVB4Zm44aXB6TmNHcFp2RStHVGRSRmVzZjR1QW8zcjc0VVV5dUIwdEl6RXp3?=
 =?utf-8?B?eDJ4UGoxRFB4Vlgra0Z2YjdZRTBUN1NTM2lPa0FtQWpXTWFiYTF1eDBGd3RI?=
 =?utf-8?B?R3pWbFprdFVVeFpwaHNGN3BzeEh5MTNESHRiTU9UMWlFN2hiRlA4dWQyY1gv?=
 =?utf-8?B?enh2cWR3aGdjV1FRN21pTEVqSmFwQjIvS1M1YVU5RmJGbVRlVG0xT2FFamNq?=
 =?utf-8?B?U3FZWkErT1I1UllvcnBZc0YyTWoyUFZRamVqY1N4ZWJYMTFwdXpRZzlJQW5m?=
 =?utf-8?B?dE44cWs0ZWtDWEl2Z3VUSWlWZXM2c1dWVnFndVJ5Ly9LQ3I4NmhiczhBOWVz?=
 =?utf-8?B?bTFCRGRrL2E2U0UwUmxTU0VpUVZPK3dQaURjbm5QME9DUkVKbngxTktmczJm?=
 =?utf-8?B?NVpWcTFibFJjTnFLc1FQbHpFckl6NHc0RTFlZ0V6K2NjZnBjNVZ6YnFjZ2Vn?=
 =?utf-8?B?Q0RKaG5DRW9ZMitvOWZmSGpDbC8zSkFwWExNU2Rkc0sweGlpMzhGanU1d0xL?=
 =?utf-8?B?TTVLdFBrK0t3UnpDelZPRitFd2R5NjhVaTNGOU14MTQ3bEg1SzJXaVFuWWxP?=
 =?utf-8?B?TFk5K2txSkJFNzRUaUQreTB0Wjd2MThVQkk2aCtHYkVDdCtjM29LYVlPNkIy?=
 =?utf-8?B?R2ZVMGI5SU5PUEZ1cDZuRUlEaWYzWXNCdS9BNEl5Zm9kYTlnZlRrWFNEdzNH?=
 =?utf-8?B?dWpCSS94S1p1c3R2akhTK3FPS21lc0tDMlpKNkNCZzNibFNNM0syNnZNVEFU?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e05e16-678d-40f0-c7ba-08ddb944bf71
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:45:07.9018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1sfcWjC0se8CpMAMWLKRS8D3c/xvlwHtGy4pVaZrpDxrkotgdLblWq4ZvvkWsm2Ft96RmoYJdfU89JMMczY981WVJ3TKXcSFPsgSAhrZ+r8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8482
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

v2: Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled
v3: Fix build if CONFIG_DRM_XE_DISPLAY is enabled

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  1 +
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  1 +
 drivers/gpu/drm/xe/xe_bo.c                    |  1 +
 drivers/gpu/drm/xe/xe_bo_types.h              |  1 +
 drivers/gpu/drm/xe/xe_device.c                |  1 +
 drivers/gpu/drm/xe/xe_device_types.h          | 60 +--------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  1 +
 drivers/gpu/drm/xe/xe_svm.c                   |  3 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  1 +
 drivers/gpu/drm/xe/xe_tile.h                  | 11 ---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  1 +
 drivers/gpu/drm/xe/xe_vram.c                  |  1 +
 drivers/gpu/drm/xe/xe_vram_types.h            | 74 +++++++++++++++++++
 13 files changed, 86 insertions(+), 71 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 2187b2de64e1..f2cfba674899 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -16,6 +16,7 @@
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_pm.h"
+#include "xe_vram_types.h"
 
 static void
 write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 873f4e18cb2a..a47e3275acb0 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -22,6 +22,7 @@
 #include "intel_plane_initial.h"
 #include "xe_bo.h"
 #include "xe_wa.h"
+#include "xe_vram_types.h"
 
 #include <generated/xe_wa_oob.h>
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7f8470b22dc9..a35a9e0dbfae 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -34,6 +34,7 @@
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
 	[XE_PL_SYSTEM] = "system",
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index ff560d82496f..57d34698139e 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -9,6 +9,7 @@
 #include <linux/iosys-map.h>
 
 #include <drm/drm_gpusvm.h>
+#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 19019b032c78..4bd0619574ff 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -63,6 +63,7 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 #include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
 #include "xe_wa.h"
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bd8aa742618b..619728bba77a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,7 +10,6 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
-#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_devcoredump_types.h"
@@ -24,7 +23,6 @@
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
-#include "xe_ttm_vram_mgr_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -36,6 +34,7 @@ struct intel_dg_nvm_dev;
 struct xe_ggtt;
 struct xe_pat_ops;
 struct xe_pxp;
+struct xe_vram;
 
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
@@ -68,63 +67,6 @@ struct xe_pxp;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
 		 struct xe_tile * : (tile__)->xe)
 
-/**
- * struct xe_vram_region - memory region structure
- * This is used to describe a memory region in xe
- * device, such as HBM memory or CXL extension memory.
- */
-struct xe_vram_region {
-	/** @tile: Back pointer to tile */
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
-#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
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
index e69a05126dae..275ab5f03291 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -33,6 +33,7 @@
 #include "xe_migrate.h"
 #include "xe_sriov.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wopcm.h"
 
 #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e6871734ffa9..ee015e3f5d9e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -17,6 +17,7 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_types.h"
+#include "xe_vram_types.h"
 
 static bool xe_svm_range_in_vram(struct xe_svm_range *range)
 {
@@ -1006,7 +1007,7 @@ int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
 	xe_assert(tile_to_xe(tile), range->base.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
 
-	dpagemap = xe_tile_local_pagemap(tile);
+	dpagemap = &tile->mem.vram->dpagemap;
 	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
 				       xe_svm_range_end(range),
 				       range->base.gpusvm->mm,
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 858ce0183aaa..bd2ff91a7d1c 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -20,6 +20,7 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 
 /**
  * DOC: Multi-tile Design
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index fb0473fa9098..8dd87ccb2aca 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -18,15 +18,4 @@ int xe_tile_alloc_vram(struct xe_tile *tile);
 
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
-#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
-static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
-{
-	return &tile->mem.vram->dpagemap;
-}
-#else
-static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
-{
-	return NULL;
-}
-#endif
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 3de2df47959b..8f9b8a1d2c05 100644
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
index 71f463f2c3be..35fd7f5d7cff 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -20,6 +20,7 @@
 #include "xe_module.h"
 #include "xe_sriov.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 
 #define BAR_SIZE_SHIFT 20
 
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
new file mode 100644
index 000000000000..a01838236036
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_VRAM_TYPES_H_
+#define _XE_VRAM_TYPES_H_
+
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+#include <drm/drm_pagemap.h>
+#endif
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
+	/** @tile: Back pointer to tile */
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
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
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

