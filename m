Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E617CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 11:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70DF10F031;
	Mon, 12 Oct 2026 11:52:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D8610E8FA
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 11:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791805942; x=1823341942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=F/jaEirH/fiu7XkbNNPZpWDoDE4qZliVJhbqFgD6sLw=;
 b=DDya2qrDAr0vTlGys5/CqkfVoomx61T31MLP9JKrrgfhHNORDS1dxWW1
 mhzjvnCXWOtAh6A3NQA0Pq4CzsC5cHkFoEWTNYMVUjOF7kHnqSS9AeJ1h
 mlmNqlFDwRhMYIScFyMlJ8ykjD5m7R0U0xbJHrsILI//Pw4y0PvtkArwW
 Ss89hqeaIfOOk9cb0bQgIT4KTLXkGBM/wcsH33j5qTUf7S/1yNahXKCYE
 A4oykODHxSkKSPtaxRoEaaUonXc87DKIkHP+YyKEZCxHMp7xeSkFBfweq
 sW+cg9wx7nItwBOMi8pkT40Grh3zzWAcQ9sNbl0Wk1ROjdOdT9lEyNQfA Q==;
X-CSE-ConnectionGUID: oGh1eqc7Qw2yFZprnXUpFg==
X-CSE-MsgGUID: EAteQfgbQgObFmqyROEcgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="411770"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="411770"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 04:52:22 -0700
X-CSE-ConnectionGUID: wysNgDrgT3q1uBwFS2v0NA==
X-CSE-MsgGUID: 3kiYzl1+RAi894cMXZjunw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1190824"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 04:52:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 04:52:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 04:52:20 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.41)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 04:52:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFtZSg06zKOkhVlI43zrAy8dYa+tCTNuZYTC5h30XMLLYeQLxlhPhFiIao5hQsQnPRtlaoX4qBsgjQbbEWQWGuD/2ABP1rOxy0oLddmYre9VlwVFLKbipBMj4aQIcz1/k8JGvUKK3q9YO211m5za/fsSqwQxWQUNOVIJE3hzbwJXUW3GvHO1as1L3d9UYnRtag+GJBXpUV15ikY7NKOS6wpCYv9E12CPQjo85nrD09kexrt2Xj56LJ8uVpT7kVuj/NdGREoCvy8RFGpYu5O28INQYUqu6UB4q8Oz2FVuxqE3H7wmTGKcPAqVV9Lo4WpTCeekGRLMROuzBKcMeBhR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JpNnK9qgl+8ukcMsLpQ3obQb9q+0BYHUOUfhbqmJJk=;
 b=VWXRyUfHs9zSvMlacMSoVBYUW/N062E18jrTB4J6DTswQ6bt2MwflUQqnV8JeDu30S+3w1sBz+GXIio3XCQkFj7DecKyZA5hm+LJQOzZ7qBTMoA5zEVFRIAdEs7815tYzFBBKIdAF83s2/d4Qut3zdDvj/cOGEClyd3QP2N1D/lIJq3CPce4aNpQRBe3Wvp0llhmt6qGGbNYNIbY+lEjct5q4O3U2HpcXdAVTYpG8U/ChPOrYfeYYuoxABJW6PqFWr6bxa3OjXGJJVh3jfLcFN8K8T2S4nDRZeKBSlLPgzVzAyOY/iruNfD9SztmXyL69Y5oRAgCK9BNVwBLKDf28Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB5047.namprd11.prod.outlook.com (2603:10b6:510:3c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 12 Oct
 2026 11:52:19 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 11:52:18 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v6 3/4] drm/xe/guc: Start use explicitly usable GuC IDs for
 for submission
Date: Mon, 12 Oct 2026 13:51:42 +0200
Message-ID: <20261012115143.4100364-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261012115143.4100364-1-piotr.piorkowski@intel.com>
References: <20261012115143.4100364-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0326.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::25) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB5047:EE_
X-MS-Office365-Filtering-Correlation-Id: 171ca3d6-f397-4a06-d59f-08df2857448d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|10067099003|6133799003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7U2vmyrcbiL7x3m+wN94443mqPydbOGFMiYhvQOOw1zGYjPG/kL1H717LM8CKMPj0LUcMFo5whsm38KHoxaqx9YmI4XG23lUh9ekB3l2QGkO5ET+Miuf7g0Z/yAK8jPdMZapdkMvp8HJsWm68yfJLAN4pUqKxMhFkYUGrsdu9mJw2qqCKIPRPf8c+9IcHmifLTV/vLx13T8b09xzsw79adAWMcwr0eHSqwDFJ8DiiskJYtzQJk7PXCpiN2fLg51+6jrDWWiKlGhqMMJoxz2HvwOA+EfKsJBHwTe3VIlj6M293whFPvgRiorVummdgItw89Eu7TN9ai2UIUSGrIifQwyRkC0nGCvCz0ruH0xMKmOKupVGbJWGhtVRcoVf4CbmL/F7qx3Gintmx6RCabHv0bJ6NmQQaZxtSceRuGHb1xje1cezGrB7EyrpprC8G3DkpvurAPzqW3bsSToITYj+SdUCYnrUkM18WzwG6+jvS7PPyZT8kUt8rIOV68o0+CqzUfBc9WgQsBHsIr9T15rookZcKxhnXXhImVIUnYpjRc1/VsaDxvCxmjgL77gR6Pfvtl6XyDYH2qRrRnr59y5YJhUDV/p0sKpxycYei/KnYadi2arfvG9GEnrbZzGsUvdruBWDoTY+aPS/+mIHmVNA0TLS9iY+oRmK58bXNe5of10=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(10067099003)(6133799003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVk1aDlMem1VQ2E0RGgwQnNuYlo2TkNjdlFyenFvQnB0YTB1aWljUzF0UjVI?=
 =?utf-8?B?ZVY3bjNGWEtrNGNsdnE0b01USENiWUNXY3FQTzNjQXhlRWhBTUVjeC8yT0RN?=
 =?utf-8?B?eHVDdGZtTFMvKy9vWC9sM2F0UU9MRWk3dkpUT2lTaHlwMFM1RWtzZ3ZMa3Bm?=
 =?utf-8?B?T3B4ZmVGeHJoUTNNd2JKbTUzSTJkVlcrQTJkVWIxMHV5b2Q5S3I1RWE5Qjlo?=
 =?utf-8?B?Y2dIRFVYNStodkZmQmF4Qms4RXBiRUVia1QrZWk5dEwxc0RzUEtQZkpDMlBo?=
 =?utf-8?B?eG5KNmRLeWVrK0xwMHZvZTlUaGxCbVA5YUhMTTdNZW1JQmRORXpWL0srUHVs?=
 =?utf-8?B?aWhHdGxuTDFMdk5FcVRRai9sUzIyVDJnOUJDZzFxQzNpT3hmNks3aVFrUWJ0?=
 =?utf-8?B?ZHpCVktra2Vwck5tYUF2ck9CNTB5SDhRUCswK3poY2tVNGVLbmNJNzBrNUx1?=
 =?utf-8?B?aDFCWTdTRGFUYi9VVXFLUUJESllTQ3Fsc0gvMWE4bW91bzI0OUM4TVpxSGVF?=
 =?utf-8?B?R21KSGVSSkd4aVdiNTVob1dIYWpMb3drODZsWTBmalZYWUZ3Rko1bjd5NHU0?=
 =?utf-8?B?dklESlpOUUlvOHNGZnROaUJhVk96clNiUHhhalpuN0lpN0hGYlUyYXlpYnlR?=
 =?utf-8?B?VktENkJEM0szcFVNMUxGZEdJU0hTREJtZFU3aVUzby9ZcG9WM25BRkJpMTVr?=
 =?utf-8?B?VEtyU1hPWDUxbGpucUdEWjEwK3dTRWVxRUFwVG1Tc290b2JueE1ZcFE0Nmlo?=
 =?utf-8?B?ekl2Z1RUYXVqVnRQaGI4LzJ1Mm4yS2ZIWTdQRHl5UUl5dDFDZ3NvaWtHUGpj?=
 =?utf-8?B?SFZlRGdxUVpTUVk0K29nTU9vUTVHSnR6bTRZQVVpcDhpRlRETVZPVHl1cHJm?=
 =?utf-8?B?RFRxMW1ja2x5dVNWNlBhVzlzTkRlalZqZFVjenpGUDhZd21ocTRNcmZIaEZH?=
 =?utf-8?B?YmR0MWF3OXhsaVRESDhGUUpoTjhKZUpaUXI1RGxTQXNmbG5tdGJTWklrbUZk?=
 =?utf-8?B?a0Q3clY4N3d1UCtkWGZjTXVDa2ZLRjJTMlZ4N3hhVUhGazdGYmJsckRFTFVB?=
 =?utf-8?B?aU5RdkFqc1kzSWluVzF1ekw4R1BZc25CQ05EZGZla1dXeTUyYk01ekRTSEw5?=
 =?utf-8?B?Mlg0cHAwQWkzcWV1WEY3WWpaRXJBYzR6Z3RDcU1Bc0RDd1ZGRGVlVzk4eDY1?=
 =?utf-8?B?NFdwc0FFUERFRVA3OU5QRkZDZFd5MGtHYjFLYlFDNDlQRUFWa1BlOGlpcmNl?=
 =?utf-8?B?d2NDckk4RE9SQldXTnVTMHVCRE5USFV4UUlyU3lTMUY4aWlYek9OZTZwb2tX?=
 =?utf-8?B?djhmK1RsdUw3NjhDSHpmVTdwekhPdFZEVmkvdFJobTVBTENXZWtVMnFrLzd0?=
 =?utf-8?B?cldTVmlaV3FZa01YN0tNeXVtK2dhVGpZRWJwVWc3cGFJTVZ6TkUvMko2MWFm?=
 =?utf-8?B?MXRCbGpnNDN1NGJDK2kvVWVqeDJ4T1hrZTJxSEdxWTlTcnpWNGR1dE0yY2hu?=
 =?utf-8?B?UHp0U0U4Qmh5Nk9ZbFJLZy9GSVYvNEpuYmJYb0NCMDA0NklNV2YrT3kwZHY1?=
 =?utf-8?B?cWtFTjZYekVkL3RrRXJmTVA5TFlqajhLUWZPdlRZTEYrZHhiYmkwVjFOL2tZ?=
 =?utf-8?B?K1p6TXVDTGt4RUV6Smk1MXZxQnFXWmU3Zkl6a0hJc2N4WGdUZE1oL2xEMjhp?=
 =?utf-8?B?S3V5eFNXMFUzOUdtTzZIOWZSVUNlY3hvY1RUdVk2VHUzWTVXT2NNcUFpTGNT?=
 =?utf-8?B?eE5LUDBNYWczd0x2ZGliMDV5RERoV1FobWp1cXpTb3JuUzkxcm1RWkh5bTN4?=
 =?utf-8?B?NWthaHkxbFFFWlB2YTF4Q2p6SzVSc2xwTlhselgvdzZnWUhPWWNMN3IwRWhB?=
 =?utf-8?B?b0lFdytrdHZudUVCM1dObXJ3ZzA3MjAvNFJIUW5qRlNxNFRCeVFHY3YybDlF?=
 =?utf-8?B?MzBkTThPS3VZL2Z4ak9NNzdUU251ZlVjK0dNVk1SbjAvYXFENWdRdjBLRGFi?=
 =?utf-8?B?bmxzSG1YNUhITkdsSGs0VDVyTnZnMnd6OFc4aUNtaERFbm1pZGVFbkdYZG45?=
 =?utf-8?B?YnpkY0hOTGd5a2daTHVMWEU2NUZzL2N0ei9QUnFmalRGY0pmVXh3aTZpS2Zh?=
 =?utf-8?B?UGNmYW1ZbWNOTHNDa0o4TWtHTFgzK3Z0Z3AvRld5bHI5eWIwK3dSeWZEN2tO?=
 =?utf-8?B?b3RTdEdKTTRRM1lidmdrSWRJQmZhK3E1akRTamhwSENoeXAwdTVMczJ1M2Rt?=
 =?utf-8?B?TXNGeFpMbSt1dmhYaVRTdkRqaTR0NUVYTkJtRkQySjVZZytOKzQyK0Z0WFNk?=
 =?utf-8?B?NUY4WUp3aHVQUHY2NUk2WUorbHgzUThOZWZhY004MElxcExpQkFhSlh0YTZu?=
 =?utf-8?Q?YpWUHuRhwbL9utO8=3D?=
X-Exchange-RoutingPolicyChecked: QC+SE9MeUh9tB4979woTCqaGxi98b3KZwM85QZcUbPKJkZZYSXdJpntbZwEkzC33LZnecPtBAbGj8UCvNnvX+PZmBQlyGwkZRAQg18MTqtD3Ty6dQHoWafzdcZXoxPI7RhabUn+nurRH28D4g1pQSDrB8KMbbf3pfKazEKiuqn0NJKV8lHzo6pXVJCjqSQJhiEUn4YI9T7x2WbKQ04xMfEjkVJoosmkc745NmUZjjWF+vWxsXDaQgONH/5wNDqyxHK6pYSjI6pnWKvGYhninR/QlCqjsc3vqGbDi4dU6JhzFwXC2zYBFpIizt/rY4o41/lVKexgZboF5A42tlZQruQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 171ca3d6-f397-4a06-d59f-08df2857448d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:52:18.8710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: liftBIU5YWWmcqO5TrttDC+/FjoOgAAUWgzQLUt1b18384lAGzksJDEP2U655ZWaBbWjcqsAa9yBQuAPeN3UA2iQ1Sp6auAxYrUkumTydWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5047
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

Switch GuC submission to explicitly allocate IDs from the usable
ID pool.
Also lets configure the GuC ID manager according to the device operating
mode during submission initialization. Use dedicated initialization
paths for native, PF and VF modes to expose the appropriate usable and
shareable GuC ID ranges.

v2: Use xe_root_mmio_gt() to get the primary GT so no NULL check is
    needed (Sashiko).

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 33 +++++++++++++
 drivers/gpu/drm/xe/xe_guc.c                   |  4 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 49 ++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            | 13 ++++-
 drivers/gpu/drm/xe/xe_guc_submit.c            | 27 +++++-----
 drivers/gpu/drm/xe/xe_guc_submit.h            |  2 +-
 6 files changed, 105 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index 48a962de5abcb..d1710899a359a 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -65,6 +65,23 @@ static void init_fini(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
 }
 
+static void check_init_small(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int count = 8;
+
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_small(idm, count), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), count);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), count);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, count), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, count), 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable(idm, 1, 0), -ENODATA);
+}
+
 static bool require_iov_config_or_skip(struct kunit *test)
 {
 	if (!IS_ENABLED(CONFIG_PCI_IOV)) {
@@ -75,6 +92,20 @@ static bool require_iov_config_or_skip(struct kunit *test)
 	return true;
 }
 
+static void check_init_shared(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_TRUE(test, IS_SRIOV_PF(idm_to_xe(idm)));
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+}
+
 static unsigned int test_idm_used_total(struct xe_guc_id_mgr *idm)
 {
 	lockdep_assert_held(idm_mutex(idm));
@@ -730,6 +761,8 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
 	KUNIT_CASE(bad_init),
 	KUNIT_CASE(no_init),
 	KUNIT_CASE(init_fini),
+	KUNIT_CASE(check_init_small),
+	KUNIT_CASE(check_init_shared),
 	KUNIT_CASE(check_used),
 	KUNIT_CASE(check_quota),
 	KUNIT_CASE_SLOW(check_all),
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 3ab4cb9e4964c..6c35474ab843a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -853,7 +853,7 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
 {
 	int err;
 
-	err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
+	err = xe_guc_submit_init(guc);
 	if (err)
 		return err;
 
@@ -897,7 +897,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
-	ret = xe_guc_submit_init(guc, ~0);
+	ret = xe_guc_submit_init(guc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index efc134bb8d915..9bf9f0e5b7c28 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -120,23 +120,56 @@ static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int
 }
 
 /**
- * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
+ * xe_guc_id_mgr_init() - Initialize GuC context ID manager in native mode.
  * @idm: the &xe_guc_id_mgr to initialize
- * @limit: number of IDs to manage
  *
- * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
- * context IDs supported by the GuC firmware are available for use.
+ * Can only be called when the device is not in SR-IOV mode.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm)
 {
-	if (limit == ~0)
-		limit = GUC_ID_MAX;
+	xe_gt_assert(idm_to_gt(idm), !IS_SRIOV(idm_to_xe(idm)));
 
-	return idm_init(idm, limit, 0);
+	return idm_init(idm, GUC_ID_MAX, 0);
 }
 
+/**
+ * xe_guc_id_mgr_init_small() - Initialize GuC ID manager for small count.
+ * @idm: the &xe_guc_id_mgr to initialize
+ * @count: the number of usable GuC context IDs
+ *
+ * This function initializes the GuC ID manager to manage a small number of
+ * GuC context IDs (0..count-1) for use by the GuC submission code.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_init_small(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	return idm_init(idm, count, 0);
+}
+
+#ifdef CONFIG_PCI_IOV
+/**
+ * xe_guc_id_mgr_init_shared() - Initialize GuC ID manager for PF.
+ * @idm: the &xe_guc_id_mgr to initialize
+ *
+ * This function initializes the GuC ID manager to manage the full range of
+ * GuC context IDs (0..GUC_ID_MAX - 1) for use by the GuC submission code.
+ * All GuC context IDs will be shareable with VFs.
+ *
+ * Can only be called when the device is in SR-IOV PF mode.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm)
+{
+	xe_gt_assert(idm_to_gt(idm), IS_SRIOV_PF(idm_to_xe(idm)));
+
+	return idm_init(idm, GUC_ID_MAX, GUC_ID_MAX);
+}
+#endif /* CONFIG_PCI_IOV */
+
 /**
  * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
  * @idm: the &xe_guc_id_mgr to query
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index 209f99831f1b4..ed9970829a939 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -6,10 +6,21 @@
 #ifndef _XE_GUC_ID_MGR_H_
 #define _XE_GUC_ID_MGR_H_
 
+#include <linux/errno.h>
+
 struct drm_printer;
 struct xe_guc_id_mgr;
 
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit);
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm);
+int xe_guc_id_mgr_init_small(struct xe_guc_id_mgr *idm, unsigned int count);
+#ifdef CONFIG_PCI_IOV
+int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm);
+#else
+static inline int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm)
+{
+	return -ENODEV;
+}
+#endif
 
 unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm);
 unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7ce73489c35fc..cef59d5d82aa5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -286,20 +286,26 @@ static void primelockdep(struct xe_guc *guc)
 	fs_reclaim_release(GFP_KERNEL);
 }
 
+static int guc_id_mgr_init(struct xe_guc *guc)
+{
+	if (IS_SRIOV_PF(guc_to_xe(guc)))
+		return xe_guc_id_mgr_init_shared(&guc->submission_state.idm);
+	else if (IS_SRIOV_VF(guc_to_xe(guc)))
+		return xe_guc_id_mgr_init_small(&guc->submission_state.idm,
+						xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
+	else
+		return xe_guc_id_mgr_init(&guc->submission_state.idm);
+}
+
 /**
  * xe_guc_submit_init() - Initialize GuC submission.
  * @guc: the &xe_guc to initialize
- * @num_ids: number of GuC context IDs to use
- *
- * The bare-metal or PF driver can pass ~0 as &num_ids to indicate that all
- * GuC context IDs supported by the GuC firmware should be used for submission.
  *
- * Only VF drivers will have to provide explicit number of GuC context IDs
- * that they can use for submission.
+ * This function initializes the GuC submission state.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
+int xe_guc_submit_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -309,7 +315,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 	if (err)
 		return err;
 
-	err = xe_guc_id_mgr_init(&guc->submission_state.idm, num_ids);
+	err = guc_id_mgr_init(guc);
 	if (err)
 		return err;
 
@@ -415,8 +421,7 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 	int ret, i;
 
 	mutex_lock(&guc->submission_state.lock);
-	ret = xe_guc_id_mgr_reserve_locked(&guc->submission_state.idm,
-					   q->width);
+	ret = xe_guc_id_mgr_reserve_usable_locked(&guc->submission_state.idm, q->width);
 	mutex_unlock(&guc->submission_state.lock);
 	if (ret < 0)
 		return ret;
@@ -3298,7 +3303,7 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_exec_queue *q;
 
-	if (unlikely(guc_id >= GUC_ID_MAX)) {
+	if (unlikely(guc_id >= xe_guc_id_mgr_max_usable(&guc->submission_state.idm))) {
 		xe_gt_err(gt, "Invalid guc_id %u\n", guc_id);
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 29abf07d8f041..7a81d0aa19bb2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -13,7 +13,7 @@ struct xe_exec_queue;
 struct xe_guc;
 struct xe_hw_engine;
 
-int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
+int xe_guc_submit_init(struct xe_guc *guc);
 int xe_guc_submit_enable(struct xe_guc *guc);
 void xe_guc_submit_disable(struct xe_guc *guc);
 
-- 
2.34.1

