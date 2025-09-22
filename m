Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FBCCA100F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 17:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6F110E4D1;
	Mon, 22 Sep 2025 17:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LY7O4sfm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA8810E4CD
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 17:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758560866; x=1790096866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5F+r3ZMLZD7UUrkaUr4V77ObJ/01VKoZzLKP2Yo9kC8=;
 b=LY7O4sfm9JJZ79fEpK1nbuGocFfpT/JSfqAJ8Nowl7r3Q4F49JZuRc7F
 oFzHORewpGDwHpoDUitbWis/rrMiEImMCZ8sxOnjic8NLkUPcOPZKhccX
 JATxUHqUQkCTGLOFTnHwrw5qPh/O+Z/DYK+2YT6akiTnd7oQOE0szxOks
 W5K7akdJJbnhjO+YjDR8yCwwqqarQiSrL9Mhl0lFDghQ68Fei1QCJgxuA
 5cdSPpaKF2gyudRVdP2rt6ZtMCIgJDrdE1Bm+RHqxFgScxukpg3wqtR3/
 h5sumJzrZNky1D7cmH0hrvosY/D2GzRg4wdjrmL+Ej6FJgivQHSvGQUg7 g==;
X-CSE-ConnectionGUID: UrDQppEARgmbx8idgMIIJg==
X-CSE-MsgGUID: 8szPd/b5QVik2HdqCxI4Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60527396"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="60527396"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:07:45 -0700
X-CSE-ConnectionGUID: tyxG8QtcTx2jVNG62ptcoA==
X-CSE-MsgGUID: lN/enOtgSdaqKdQq0rKD9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="176456884"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:07:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:07:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 10:07:44 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:07:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gqs4XZ+hyv74WlYZk4uEKX94aQXKVRByFRSh+IYXtGsgge2d8k0BTdqqpoT+4X4HYhAcv0QgEgskypZI+WNT+mOVdI2czUrqx4MRhjbCr1/UMZPglegXMUentZIi4bkKHUik2N30fwX5IAndR71j7qS+J8jCEc5+FGJMbzJX7kuoU/V3yAJ7pYTKaJbaFbUoL+6dBWfWSGaRfDnEHYyc+G4OizOMD74MKC1FFHNT65oTpZGGTjt50mUT9PREQRbCiQgdW4Res7MgR3sT+fgjqHFbQScZdSLoIedS0bdPGNAkKK+Y6FduP806MVxOGeJMxCXiuDILNP8zbswKFtxDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SXMiSW9x2YWE/Eyh9o7SFYDBGVOWap4SkIrr38/i70=;
 b=vBE8fXYVnnrQgrn1vvuglkK7pptCp9wLSlJ5GI9oVDxE6WjWAgtHBea2VyoOXn/b9lKgQNMPQdJpKqfFedB5nYSNvpQ1y9VpzOeRGdjojfYrrkcXps0UZQ8p8CobpWKrOmK8mI2GflQMMM6DIS9YgnsynhOPZQsUL4/OaaiXW6aKmN4ty4jucFFJ/SZL95AhC4HaMbTfBtIURgrDzO7tvXap1O2fQ637qmW1U3X3KIyz6nd/ayD9wuwyimlR3hZ8XRzhN+Wb2BS5q0o8JUp9/wWKxT+PflKauX3qtm064XfsSU5itGf4T7T0P1XsmWMaCAoGru2Ew/cIgtsOCkcARA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 17:07:40 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 17:07:40 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v4 3/5] drm/xe: Force user context allocations in user VRAM
Date: Mon, 22 Sep 2025 19:07:05 +0200
Message-ID: <20250922170707.1556781-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922170707.1556781-1-piotr.piorkowski@intel.com>
References: <20250922170707.1556781-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU6P191CA0056.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf8101b-5988-4e57-a59f-08ddf9fa8978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2gxaVdOd3VXWjMvU3FjQjJObEFLV2NZT1BueFlTZ085MjUxeTlQYlBSNkxJ?=
 =?utf-8?B?WnpUY21PSWp0b2crWGw0WGMzNFg0RjU3V0I5ZTdSOFZrNGRSQ2k1dkE3SEtq?=
 =?utf-8?B?aS9qbzFPUGlqdTJqb0Jhc0pVdDJVNE1zMW93ZWlWdU50NEdSQnp5enRKZkla?=
 =?utf-8?B?bGJpdGR3dFl4L3h4L1FCbElieTlsOXQwemd4eVVVNGZrb1RIdFc5MDFIcGdq?=
 =?utf-8?B?WURGOWVqbmxmNDBtSVljOXpRbkZQMWIyT255ZW01UElQeEltUmNZbjF1YzRC?=
 =?utf-8?B?R3Njc3BiQnZhZ1RPbEdIM3lOOVltMHlMZkhqWHk0dHRTVDlOSGNjZG1tOG9J?=
 =?utf-8?B?N3ZjNmdFTE5NaHdERTlSaEVRTHVDdjlEM0cvclBpU2JDekhLZjdCcVJrUjJN?=
 =?utf-8?B?Wkp0dzF6SGY4amFJYUltZS9XZnk2RFR4N1NuMEdiTC9wM214Q0x2b0pTYW9E?=
 =?utf-8?B?V1ZjZHZoVEY5MitDNkI3TExBcjB6dVBJaU9Qa1d1dDQzdFkxZ3p5T0RUaVg4?=
 =?utf-8?B?Z1JrZWZ1dzl2ZlVZcWx0QlhXOU5ZRzYwbzZ4a1Q5eUx4RWhUQXQrL0NGN1Rh?=
 =?utf-8?B?Z0x6RTAzV1Z2ZGVOR2ZLT2lNaU5RVmJsVXFHazVHNnBVa3RJWUw0RTJYRkFo?=
 =?utf-8?B?OVB4ZkNacVphZm56MnFTVGoxWFlsYWFEUm9NRFk3UEUzeXBzVXhBSHh0S2Jm?=
 =?utf-8?B?YUhxZXlWc3pDSFJvTnpCTWZsNU9jNDFNQ0tFVmNqYjhZRnZtbEM1aGFBaEJs?=
 =?utf-8?B?M0NMUXRvVExLVytmMkN0czZaODFreEE0ZXBIZW90YnRHaE43R3pXbUdVZDFl?=
 =?utf-8?B?MURnRmp2THgrTTNldGQyMUlJVG9XYVg1aHN0T2N5dWcxM2Q4QmpVdmtzL2l4?=
 =?utf-8?B?bEgwUnJQQnhYVndSMTlmS3p5ZFl4dHBDNnNpbktLazErWHBXVk5XRU1HQ2d3?=
 =?utf-8?B?WUhLK1JZVlJnOHlaalRBazhFWWFraGxSeTE0eVBCMHRSblJGT1FVU0t5elBF?=
 =?utf-8?B?RWFlU1cxNUZmaUJwNFF1TWlHV1FQdlhYTHRkS1F1dkRLY0R5Q0IzWjlqSTR4?=
 =?utf-8?B?aGgxekN6eUI2Um1uWTVsVVZFNVBpdXBaTTlSU3orbWNmSkF6aUVRTEJjd2ZT?=
 =?utf-8?B?SHVLVlA4c1VOV3VRUDlyaGU4a3BKS1BwSGh3UWhKUlYraGpDLzlXTjMwNDFn?=
 =?utf-8?B?SnRNdFNuS0ZURlZxSFpmU2k4WCszZWVycVdob3dLemM1REw1RGFmenZFRm1n?=
 =?utf-8?B?MWNpSmhiTlVHdlEvdm1ITi8xTE05NWZGT3dWT21XOU9JUGNWM1dCaGw4Qzgx?=
 =?utf-8?B?MGpDL2dCcCt3NS9yRXpXdXVuRDdCZUowR1E1WjdoSzk2TFBuUWVWUERpQ2lO?=
 =?utf-8?B?K0Z4aU5OUS9HVjBNOEhtT25LQ1c3bWt1LzZubHFSK1ZHVjd1K0RqSWJFbkFk?=
 =?utf-8?B?aHpKTHJSQ3l4elB4d0gwQXNTd1BHRldxWVZZUy9kUWFncjhrWnhiSEIrWkRj?=
 =?utf-8?B?d2FxNDN1KzB6dU5CNUdqWkZXVWxhMkpYTnVjMVdkVHZ2UWh1UkwxZThyNkpw?=
 =?utf-8?B?ekY2ZGhxeGZ1QUVGeEZ1NVc0V000RjREYitmOGxBN290dU5ETUNjbENJd1Fa?=
 =?utf-8?B?UTJhRFNWcE5TUFFWMmw2QytwQzhsYkFYWElLTnh6TVRYTUJXMTkzOHEyaWpL?=
 =?utf-8?B?eG5JV2E2MnBMNUhVeXJjMXJkN0J5Vk1ZUWtxNzVlVUZrNXo3RzBYQ1BMano4?=
 =?utf-8?B?TmhMMWp5Rmt1RW1UYytJazJyM1ZTYW1CTVFLYVdQVXdMdVFKL2p3Q2UxaUxs?=
 =?utf-8?B?SUxkYk9lRUVwNFVYMnp1aDVsbnFLR28zQTBwMndHQjNyaWYrZEtQalh4dkNR?=
 =?utf-8?B?TGJsbDRYeHdxUUxkZFpLWDMvVUhKRUZOOUpmTDRiNTFtZnZEV1hiV1hRb0lI?=
 =?utf-8?Q?S5Stv47kb/Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YitlNXhtd0hiOGtaa2t6OE5IUXVnSnhVTEVKTGRWVU92UkRFQ2ZtZmpGelpF?=
 =?utf-8?B?cXdhY3dJYnFybmhuOFk1TjlsNEc3dXpIeC9BWXhCNFh2QWF4UUNzQjc5VVYy?=
 =?utf-8?B?NUdIbncxMGx2TGNNMkc4dU5CR2duM3FIc21nNStmODdtdTVhbkF4RDl5TkNk?=
 =?utf-8?B?MmRRc1NqKzdpZTB4cUcwbVpsQzlIRFNZUTdMQldEaEJzUVhCVzNPTGJsSS9B?=
 =?utf-8?B?Tys2U244ais0R01xUmpzaWdPMzdHU3VtYmwrRVdjeERlSnpGQWdIUGhBekNU?=
 =?utf-8?B?eTc3RXlJdjJuK0FiM3V3d1V1cjdYalluenkwdWVEVHVTWEY2T3RBSHY1cE1h?=
 =?utf-8?B?RFppWWpzRExKbmpOeGJVYzJjclhBY1c0bHhaK0RYdU1ZclF5c1hmbWRJbGtE?=
 =?utf-8?B?ZlRnWmZWQk03eXJLMDJaZUtZNyttUTNaclZQTmV1SWRPQkc3NVprK2wyQkJI?=
 =?utf-8?B?bit6OC9SMXVaUDJnQXljZUxrbDU4Rk9ZWlArNGRhQzhzK25qNWZpbTQwRTFu?=
 =?utf-8?B?MDM4NURUTjZnT0xjUDhPeDBQZ1pqeGo0dGFHdDVwVTUzcEpoVGVNRXh0emF2?=
 =?utf-8?B?bU9CcFpFMzh2QUZneS8rUXBaMWROS0l4TzNyNE15RGRaVmF6WTBRbFZzcDls?=
 =?utf-8?B?RmxaMkxXYlR4Vy9waEdnazJCRzlXNDNSTWduSzJDZTNtWldRTXVtd1U0UEJ0?=
 =?utf-8?B?R0ZHaG1Nb29ia3AwbDd3QS9sRVdGZUtOSWdKa0k5WGo3dzhOTlB3VmhLNEJE?=
 =?utf-8?B?Yy9RZlgxRXVHU3pBQ2IxQm4zdXJpQ1FKUmNoaVJibmFQUlk0aEFJZWVnQjdY?=
 =?utf-8?B?UklaUmZ2YzVGOUJWSnJyaXpSaHErRi9DcmhFbWREN0RRUUU1eWY0N2d1elN4?=
 =?utf-8?B?bWVobUJlVW01V0kwMlp4S09UamwvdkRqYmxGOTI5SUNqWDQ5VzRzbEpRK3RO?=
 =?utf-8?B?MzRqbENLNjlNVjQ2NnQ1ZUlzd2hwUU8yd2QxYjc1clFkMGpmdTdMbVpidEVX?=
 =?utf-8?B?ZHUxQ0l3akpOUkpycFl3UWNWZzduSGgwNnJTTHJ4MzM5aW41YkZoZ20xdVJU?=
 =?utf-8?B?ZGtkREtnWXI2RHlMVWhWL2N3K09wWExoWW5jRERCTllDZ2hmbmpqN3pmYTBh?=
 =?utf-8?B?WjZGQWhOak1Na1JVbEhZanVuRGlnR2x2bVJtMzNRWnFCM0gxN3BFU0RaMHp5?=
 =?utf-8?B?TWhZWU1lM3p0T2J4K2s3MytMOHFKVVhwVGpTeU9vYTNONC9IdXhNZUhlc093?=
 =?utf-8?B?MmN4UDQxZGl5UVFTS3VDMW5rZGx1aTVEVGR5ZnQvNDdjc01xTWZabk9LSFdz?=
 =?utf-8?B?K1JvUkptVzZBWjZuVnRjYXcyb212b2ZCNmZUWG9DdnFSTGZuRWVVb0xxeGtj?=
 =?utf-8?B?SWNSV0pGeUduTE13ZU8xalRuR0xvdGxDK1RwYWh2d0JqU3k5bHVvWlJ5STB2?=
 =?utf-8?B?Um1hWDdMbDEyZ3FNd1A1bmttM0tueXN0Y1ZGQTk2RitZekMzTFBpQU5TVWth?=
 =?utf-8?B?eDFHczJKYVdYYld6UFRRWm5oNlpRWHI2QWlKcVpzOUlXMmZURDBmTnZSVlBO?=
 =?utf-8?B?TGJrcUNnQWhFTzFrQUVZNVlBYjNqTThhUUxnWmxnb1F0ZW96dDIrTi9NcUxY?=
 =?utf-8?B?dVFwdUhKd0UzYkZJYlFlVnkzdWJ6ZklaamREOHdkUU91bS93NnZWVWdtd3Zz?=
 =?utf-8?B?Ky9iUDQ5UHRKTXV3WFBWTGd3aldVNjhCY3dOc3ZLd3BVZFk5SjNJMTJDQXFo?=
 =?utf-8?B?THVvQmkrYWlRU2tXN1UzSHdhRWdDRFU0cVU0UTczZm1ZaU53NVVvenl3R3c4?=
 =?utf-8?B?RWVvd0tnV1NnUm92VkZDbWV5a2ZNQUhsSkNPNmhMVDREU3h0K1dOOTMzOHd5?=
 =?utf-8?B?b2liQ3dsbGw5V2cwN2ZtNkdUbzNaMHVMRFQ4SmVUcjhoZWFaTFp5SERqWDNR?=
 =?utf-8?B?SlBZMjhKOHBOekRJdTZZQWpBWW5EdHZXYzBwbTZxeUFxV0J3dFdNQlNDTmFr?=
 =?utf-8?B?N254WHpoSXFFTzZPM2lEMExIZTNSTHpMZ2VMMmdkUkZuYWhuNThpZnR1bkIr?=
 =?utf-8?B?K21uUzlVNFIzMi81eEpSbDJVNzdXcjB4Mm1KSEVRRldYa0l1MEpyT3ErNFAy?=
 =?utf-8?B?enV6N3NKVXY3TDJlNmxpTmZqK2V2UHJMNnhiVWlXaXZqZ2FkOGc2KzVUOGxl?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf8101b-5988-4e57-a59f-08ddf9fa8978
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 17:07:40.1234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rasT9UuwxdYW1XD96yPXVAoxiX5R1dup+jrrWIYDu5JoIwq4evwF4RzbViQwY6o64eXnpUZoO/ZZD9qnZWmWey1EJ1d8yOetnhSdm/oBqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
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

In general, kernel structures should be allocated in the kernel-dedicated
VRAM region. However, userspace context data - while used by the kernel -
does not need to reside there.
Let's force the allocation of such data in the general-purpose VRAM region
accessible to userspace.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 7 +++++--
 drivers/gpu/drm/xe/xe_lrc.c        | 3 +++
 drivers/gpu/drm/xe/xe_lrc.h        | 6 ++++--
 drivers/gpu/drm/xe/xe_pt.c         | 2 +-
 4 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 37b2b93b73d6..9b1e70e20565 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -160,7 +160,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	return q;
 }
 
-static int __xe_exec_queue_init(struct xe_exec_queue *q)
+static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 {
 	int i, err;
 	u32 flags = 0;
@@ -179,6 +179,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 			flags |= XE_LRC_CREATE_RUNALONE;
 	}
 
+	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
+		flags |= XE_LRC_CREATE_USER_CTX;
+
 	for (i = 0; i < q->width; ++i) {
 		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
 		if (IS_ERR(q->lrc[i])) {
@@ -225,7 +228,7 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 	if (IS_ERR(q))
 		return q;
 
-	err = __xe_exec_queue_init(q);
+	err = __xe_exec_queue_init(q, flags);
 	if (err)
 		goto err_post_alloc;
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 47e9df775072..c88e90175f59 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1415,6 +1415,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (vm && vm->xef) /* userspace */
 		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
 
+	if (init_flags & XE_LRC_CREATE_USER_CTX)
+		bo_flags |= XE_BO_FLAG_FORCE_USER_VRAM;
+
 	lrc->bo = xe_bo_create_pin_map_novm(xe, tile,
 					    bo_size,
 					    ttm_bo_type_kernel,
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 188565465779..21a3daab0154 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -44,8 +44,10 @@ struct xe_lrc_snapshot {
 
 #define LRC_WA_BB_SIZE SZ_4K
 
-#define XE_LRC_CREATE_RUNALONE 0x1
-#define XE_LRC_CREATE_PXP 0x2
+#define XE_LRC_CREATE_RUNALONE		BIT(0)
+#define XE_LRC_CREATE_PXP		BIT(1)
+#define XE_LRC_CREATE_USER_CTX		BIT(2)
+
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     u32 ring_size, u16 msix_vec, u32 flags);
 void xe_lrc_destroy(struct kref *ref);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index a1c88f9a6c76..e39da95f3a05 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -122,7 +122,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 		   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
 		   XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
 	if (vm->xef) /* userspace */
-		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
+		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
 
 	pt->level = level;
 
-- 
2.34.1

