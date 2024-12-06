Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B956E77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 13:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348C910E1A3;
	Fri,  6 Dec 2024 13:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BWuavxvo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F0B10E3EF
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733492387; x=1765028387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Rxo71gtxp/yKASfiftqPS+/0r+RFQ4CWqy4NuMwy25o=;
 b=BWuavxvofw5VNwuRDwAunkb8XiBD0KjpV4EuysHngxnqi+z64X0d5gRe
 6DdWHwkOGgFpNPbEpkhQCIQtIXfQYSIrZ6/h5FSxmJ0ZxjbWgQJHeFyP9
 8BELvgpzwRoQbs9szY5z+80G2AO6mhCvBhHTZ9CWp8Iv+il8FQG0ObJmR
 ix7J+70USozeQSqKmhwIjcBpA75LRuYvxECwd4oMVmolAWFy+oMZ/hzTH
 IyOE7FmCOLBLWCJVmtoZV56jjGbwblYzxfTfw3A5BoC50SHiBs3/mJyb4
 U6t1G9aGzLKHlH05masA8fT8fvQ7E9Y/3Ge1Qv1VRhVJXJQS9k8Ag/ISo g==;
X-CSE-ConnectionGUID: H5r7OkeZTVKFbp+YxpsEMw==
X-CSE-MsgGUID: DTS+efRpRCSD9VpICzUT1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="56338121"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="56338121"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 05:39:47 -0800
X-CSE-ConnectionGUID: BqeG5qktTAu1zyH3xlFdow==
X-CSE-MsgGUID: KbYgc0XfShqw53+DIKpHyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="99362873"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 05:39:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 05:39:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 05:39:44 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 05:39:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6v7Anmr9r5B/uCZ9Jg1jsvFTp1OupIIBz6OxmVEVPUAC64fMPknrxTqfoCgOVjd6XWVC61f3+m70jX2ryG7m2FK20PC6rXm3FN6pxKRmnt7HGY4REH+cxkY6tIWQRCobnav/N0I5sszSFwt3XcimZ3kx0a3Znvljfg6FSDWOYzudUU0O+mbyripUcW+cEyabc7yHMoz+j6HoGqLpXe/qx/KU/mdKn5pSw3SeLfD7qpmDz7ytkzz4c9iUV98mLC42Fh4ldWNDtNuhXstodnpgmocMcN56rcv9MO8h1oMw4l9YhIgsGHFMj/NsnHqIK3SkDQaY6zsdeVy4jbukflDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ry44OqUatADMr+kbKOMH4KLgrbQ4fbEF71dnX11zsDE=;
 b=dS7mCOdXw/NGQka5T3Lqfp1C4h2HSy+vdIPRKFDFHZlcHX7G62lvU7mtjfsH3BOC+u/bL3lMDABf3jQSn4NOLrKUQAU1rNpKrL2Ksd3SFfovKYM5vrq/ceYGb61r0V3RILNZW+RB9jK2LwqO13xO1LeD1YbLHVU3uHSWg3vlJ232gYrBLhMMMHdkY1NmzQuyTAC4TOwtyyt2X+JfJqrXB02PN8WMtO/Iw0rpd569ax5vDhmkFXAq0S2tyNcprW4JZTEI/xzszHHIbCjj0P2HYsHLnNj9HNbojANLI0RiwTUYiZXU9b0fi1/FQO1pzLz/RuGW3IWSkXtWTM0ryNXv9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB6350.namprd11.prod.outlook.com (2603:10b6:8:cd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.12; Fri, 6 Dec 2024 13:39:41 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 13:39:41 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v1 1/1] drm/xe/vf: Allow VF direct access to extended registers
Date: Fri, 6 Dec 2024 14:39:29 +0100
Message-ID: <20241206133929.891568-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241206133929.891568-1-piotr.piorkowski@intel.com>
References: <20241206133929.891568-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0014.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: 44164b01-72a9-4845-0f12-08dd15fb6fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2MvVUx2U1E4eE1tL0k0QUdEazh3WG1tWjNwWG81aHkyNEd6ZmlXK1lrRnZU?=
 =?utf-8?B?ZG50WC92bG92NzNOWUpqdzJJQkJWc1NKUjZlSHZVYUxnL1FOZDA1OUNWQlRB?=
 =?utf-8?B?SkQxRG45Uk45K0wwSVJVeHgyaWc0aUp5d0RrQTFnRTBrcHNsVjIwL0MwNyta?=
 =?utf-8?B?WXJtU2hXTG5VUmhuNkdYaTlPUkNmczhWNW5aNFJIRWVnbVo0NWhtVE1KYUp4?=
 =?utf-8?B?U2VJN3ZwdUI4TFVpakJkbUY4NUVCTEpkU2Y3OEM1cWJiMmtnS3Y5Q3VuRXNn?=
 =?utf-8?B?bTZQWWViZ0U3NThtOXd1YnNoWFZVcnhYUkdFYTM5ZFVQSDhuajJ6b0dCNzlp?=
 =?utf-8?B?MWhLR3ljaHBDd2JtSUE3elRmUEpNdVd1NENqNG40TlJLUjFVUUJVK3F4R0Nx?=
 =?utf-8?B?cWlGeEcyMGZiYzE3TWNsK1dqNktZVEZjQXowR1NmNFllaTdzSzdnb0xQemVE?=
 =?utf-8?B?OXF0bm53TUhvNnVVOXZFeVAyNWZnRTRHNEdZdml6ZjFiODJUclBrZFdqNldI?=
 =?utf-8?B?a0QyR2liV25CTlN4ZUJDK2hPc1NLSE9FZGJWMHMvQjdYNUpYazBPd0ZYTUZJ?=
 =?utf-8?B?Yzg3S3BOdFFrVE1sazFOUzZpZ1dCNkhDZElhbnlNOGNqNEN6YWh0VmdyTXhV?=
 =?utf-8?B?K0srNmpLazZYS01zSUtSZVBNci9pVk11cTNNM2FUanNDekg4VjhlZWRQR1RS?=
 =?utf-8?B?aEF4cHM1aGN3V2ZaQldxcHJtbTRyM3N5TklwNmRyVWlwQkpvVlBTMjU2TFda?=
 =?utf-8?B?c3grM0tvSFNwQXFFYnVpRlA0aXVxbkVHTUFsdWZHQlAzWHlDMTd6QS9QTVd5?=
 =?utf-8?B?RTFiRlJaQkQrRkpGWDRvMVNlWm01LzlPN3hCdW40TzJSZFNxNjBPOGVNdnA5?=
 =?utf-8?B?ZkhtWFoxeDRzcDZlY053NGJDNXRra2FqN21XaEpnTm1zdTZxS0EzOFcyalVa?=
 =?utf-8?B?Y3ZkSjdqTnZqWnFBUzN2TTlGbDJOSG9TZEFyZTFDWFJHcWZKbk92TTZaT29I?=
 =?utf-8?B?VkVGc0tCQVdmNU5Pdkp4YmZIcGhjcS8rNGdJSHlQV2ZIMnlwZDVIbUphTFEy?=
 =?utf-8?B?TG02akxYazhZSDZmYllCKzEvM0lGME0wUVcxUi9TKzZHN1RJMG1lUkpaY3pR?=
 =?utf-8?B?a3d3U1RrTlV2SkU1OFVtWkc0eUZCY2grN2dhdDAxQkVLaHkxUkNjdXFwVkEx?=
 =?utf-8?B?T1RGNm5ZUCtuZXZ2bmU3RmNTQjJ0MTlDYllKYzVqYmtyNHY2ZVNia0dMWlRC?=
 =?utf-8?B?eXNFRGJkTkJlRExidU94ZS82TlpTWkRqR1JUcGl0QXNjOWNSbTc4ZmZOM3ZG?=
 =?utf-8?B?clE5cHFZRkdwalJwUW9NcjJRaVBlVHVvbVM0S25KdTVWTjVWcXZLbVl2bUxT?=
 =?utf-8?B?d0VkUjhwamw3RjNZN3BSWStVVTg5KytXRm53OXE4Y0Q5QTl6cmc1bDZCbkUr?=
 =?utf-8?B?N0ZGQzk1emZrbTA0d3R0cEQ4ZWFsem1SRUNSbHN3TVpqWnlUaWVYcHFOU3la?=
 =?utf-8?B?MFJYeU52a1U1dkdFR3NLcjRTc3FBdVNpK1g3QmxDR2ZNUEdpS1FPeS9BQVNH?=
 =?utf-8?B?c3p4VXVYTy95WTN2Ymh2cDBpSnJ6Rm1Bbzl4ZlBQcEpJNFh4U2dMRnhURUhP?=
 =?utf-8?B?SHBXK2FXWWZjU2JjK1NKdml1dXd0SHRRSEUzSkJZbzU1Z0JyZDRwaEFuem5O?=
 =?utf-8?B?NGV5Rm0vYXZ0bzdhT0JYbmxCVjFvYzVib0Qwc0JkSVJmMEN4T2NVZHk1cUlz?=
 =?utf-8?B?QXhiK3pKZ25KUWdQV0xYYWFHTmpMLzZEcE9HRzZaaWd6MjJ3NUpyWUpkbzJr?=
 =?utf-8?B?N3ozTmZGNnY1L29UMk1RQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTBnVVpvdjhMNFliY0hCU3U3bFdHTk9Db2hWK0pjQ2ZxaFF2SmQydXY3dDFl?=
 =?utf-8?B?dTJGV21laU1JVExhUjFONXBlNWFxbU9idHdyNExOcnJDenFRaElMWXdHYWpv?=
 =?utf-8?B?VkR1ckJWS3Y1TnE0V0J2V0laa0JEbUZDK0J4YVltbEUzS3hQcDdNZlVYWHZi?=
 =?utf-8?B?L2dHN1FmOHZxYWMyaWRWZmZUT1BuS2RSanAvd3pEdVFnVFkxQXVzY3RoelJP?=
 =?utf-8?B?K2xJbzZ5R09pWEE5UlZVQXI4ek14Z1J0NGIwQlZnam9hTTVYemM2bGxJU25x?=
 =?utf-8?B?K0ZnTmxsNDFsTHFJeVU3VFp5VUUzMUQ2QmhqK0JIaUErT1BjdWo0NTRWdnU3?=
 =?utf-8?B?ejdNdDUrYjNLcTY4NXlWSGpPeUJNRk5BZytWYWF6SVg3TXVRQXcyUGFLWmpi?=
 =?utf-8?B?WmxqQVN4ZE03MmNsWFhFdnpSVDNxV0QzNDZCek41MXhtbnhLdSsvaUc5SVJX?=
 =?utf-8?B?QzZoL3VqcjUxYXpKcVB0SDdIYk1GY2tMWFhILzMrMmlXcExCTzVsbEY2Rmdy?=
 =?utf-8?B?WVNvSGxzZngxVkJsQmNVVmJEVDYvL3Jvcy8vK3pTOGRUdkREQWFRdUtCa3Bu?=
 =?utf-8?B?MEszZTlDZlNVSkw5cUVoMjVNL3dhZktMeVlaRTk3ZUhyRUVsWGVXQnZrT05k?=
 =?utf-8?B?Z29qWm4wcXE0YWZZQ1pvZjhrdkltRkpmZjgvQ1UzMytNczRDc0dvd1hMa3BB?=
 =?utf-8?B?Mmh0NHVjUDFVcVhodWFWcVE2UEQxZ3pPQTBuclI2WllickRDN01zWVNHNnpR?=
 =?utf-8?B?WENwZ0s4SzZsWTM3czZEWDVvY3FyL2Y5Z2tCcHFoY3RxelBmcEpWOTlwUFpS?=
 =?utf-8?B?WHBiWE1mZ2svNEdUWmZPS0piNVoyV2RmTFNCb0UxL0hhT2NWdnUvZlowN05D?=
 =?utf-8?B?elZLLytnRUh5VEpNU2tVQXNQSnExa2xGK3RuUURnY1dCeFQrdlk2eTlMVWl1?=
 =?utf-8?B?RjJsdHhDbDk4Q3A2dkhNNVlWOU01M3ZDdG1UTHpvRHRrQUJJMjB5NkYwcy9P?=
 =?utf-8?B?aGRJQUFUS2dPcXhHblZGUHRkMFhnTWN4L1YvQUJyVW9TNFdiUGVFY1lSVHRT?=
 =?utf-8?B?L1ZIOHhhanF2NGNiM3RoVFNiN0haZ1o1SEluOGx1RTB3ZnlFSGZFUkVCU28z?=
 =?utf-8?B?UTZsOEVyTHFyZVc5V0pISWdVaHJwSGg4aDVsbk9OZS9sdE1hUldIcEJUTUN6?=
 =?utf-8?B?MW1rTXphWklLTEQ1c2JuS2R1RXZTeUdEVE54UkwvSTFSQTFBK1VLcG9GYnVS?=
 =?utf-8?B?SEF1a3ZEYlJFbWRGVnhqV2RKRTgzYUk0VzJ2ZzdHOTJaalo5dHVCNVlyZTVa?=
 =?utf-8?B?MU1kenM4cFhQYUMrb2xPQzB5RU1LcWMyK2grRlpKZFlDU0xLeFo5K3FzNjJC?=
 =?utf-8?B?a0MrVWlWaWI0c2l0MzlpT2hJQ0dqZjd0aExXeXFEc2UvMUtML0lUM1E5U2VC?=
 =?utf-8?B?bGZmZHJTRm5PVGxjYjJuL3Ntb3JwdzlWN29jT1grZXJlU0dMZUdZRW9MaE1z?=
 =?utf-8?B?NUFnRlJlb2ZOR1NadStyRHJucXhCMzRkT3lKNk5Ua2IrVjZTS0VHM2FpOTU3?=
 =?utf-8?B?OFZVaDZCbEhUY043Q1QzdkVvOXpFMU95Tlo1WFg3eFdjeitwbGFMd1VNd2FM?=
 =?utf-8?B?Qm1SZGxhRXA4T0FOV29xcEY0cko5WVBzN2VwYTNLMVhjREhaaHUwbUQ3dFFV?=
 =?utf-8?B?OUdjTTJEbkUzcjFxaE92SUNoL0lNa2NvSWhDbU5XUUpwNTNjZzFSSVE1SXk2?=
 =?utf-8?B?RTJHeHlzWlVKZjljekkxdEEyUlpZTkk1Y0pXSUhvOG5yaVlVTU45R1hnamlo?=
 =?utf-8?B?VW00ZnNmekJoRk13UEdlZm1kYkhBc2RmNmxUZUR1Y1hiMHV5eVNaVWwyRnNl?=
 =?utf-8?B?bGZkKzZZMmhYVHRUUERtMUp3bS9zUTRCTG5VZmRJU3dVZ2lMSFdXNW95d2dk?=
 =?utf-8?B?L3YrVDJDUDQ3QVVNQUt0QmVnS3lseXFNNkh5YmorQlNFb1J4S1lLL3JsQUln?=
 =?utf-8?B?dUJ4Q3lQQWtRWkUzam5SejNVMmhSNG9zbkZiSFRtNmc3Mm9vTllwQkFjWTJq?=
 =?utf-8?B?ZkNJMkVMYWVHbjFGNG9ZS21oT1BEbTN0NUI4cmxNYll5OGdWZDMzRW5MOWJY?=
 =?utf-8?B?UGhVSTlkRFdqTnhqOE9IQ3hvS1N3UGFzZGRxMXlnZjA2TTA1bGFiOTJOVkZN?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44164b01-72a9-4845-0f12-08dd15fb6fc2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 13:39:41.3458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdQPR+DY/LCJTIFhSgQP4tWctxS0AKpJPDe/3yHEQ8wfpSj24jEYuonJXbXGTb13cA/PJPaZVXzOYVlBi3qQLeEjukxSya1EFGuoxCr8SjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6350
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

While VF by default does not have access to regular registers except
allowed ones, the rule is reversed for extended registers - VF has
access to all except forbidden ones.
So let's allow direct access for extended registers by default.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index a48f239cad1c..b6f64b78deda 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -233,7 +233,7 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
 
 	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
 
-	if (!reg.vf && mmio->sriov_vf_gt)
+	if (!reg.ext && !reg.vf && mmio->sriov_vf_gt)
 		xe_gt_sriov_vf_write32(mmio->sriov_vf_gt, reg, val);
 	else
 		writel(val, mmio->regs + addr);
@@ -247,7 +247,7 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
 	/* Wa_15015404425 */
 	mmio_flush_pending_writes(mmio);
 
-	if (!reg.vf && mmio->sriov_vf_gt)
+	if (!reg.ext && !reg.vf && mmio->sriov_vf_gt)
 		val = xe_gt_sriov_vf_read32(mmio->sriov_vf_gt, reg);
 	else
 		val = readl(mmio->regs + addr);
-- 
2.34.1

