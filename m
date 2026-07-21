Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D28C4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 09:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4D510E317;
	Tue, 21 Jul 2026 09:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLPsH5XQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23CE10E15B
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 09:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784626299; x=1816162299;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=+tIjvk2imu9lH/Qs7QhpfMY73VM1vW8IGUChHLEUaJU=;
 b=NLPsH5XQY6tUx/HL8AsvpN+cNLZRIgphi2s2V9cp3/iKWzf+1fUzffgN
 X9PS+h0Lwg5YljP2q2O38CDz+b9s6tj08q5D2gpRiU2tBsXvtxEKva1IE
 J+CKfbrGQ8rixBUEl5QHrTExKO4Ypdmvlpl8DiJYtXPM061MWzYkxFQRl
 Np9DpsnbZUZJpvZmrF6KIszSwgoGb55S3ZKiTxApekryZvSwZNnH0Ph60
 t3S3N5UeeM7pU4r8cExZUIOJ80vQHCuyeF2L+isB/m4SbLY4ct6CzAgb7
 HuhdjzmJxTv+l2benWypXIsvw5aV6Kn/td0fu+dslVDLl1KQHV8m6sI2N Q==;
X-CSE-ConnectionGUID: nfu+IxWjRf6HJy5p4fwaWg==
X-CSE-MsgGUID: 22V+dsErQDW/cqjwBH67JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="89112725"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="89112725"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:31:38 -0700
X-CSE-ConnectionGUID: Kr0moBQRSr6NiFvFtaBJxA==
X-CSE-MsgGUID: CDpO3yZfTlSuBbd8ypNfZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="251384398"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:31:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:31:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 02:31:37 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.61)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:31:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGfGzF2CA+tE1qxe9JRtIFh/DzrcvxNuSp2Grla2MV0vbnv4jOBF1qiBqQ5ZiXqXluxIjHO9TpnsSEBAsVwhiPTxvLbxBKhhCTwkPjl8b5EjBsi8jHgkwW/Mx124UKmv+ZOEpw3xhgeDzf6ulKPNvEt+uZxvSvvaO2lX0m4S905boOUCY+rJQaJ2CAZbAfL1TLkCuso44hHXT/qsNjZkQUdlp1hhfhAZIshZL38RNJled7jK2xZzTuSQ1RIvCVuBa+jGLmak/j4LC1eqFGg5NO+UxytNQmo17J6Hv5v/OkrhxW40jxCElLAdlTs0LHsSCThs+yWr+Wc0QMZTkmgwmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcs3gd2Fn8fSJr0o46/PTR36Aon+mipU0Ov7Eoik4fs=;
 b=mDV+rQdhlkmVINDsYcCd+JdfCI3ekhBmPqofcKAHRgrYF37X8VdsQeStSndpvIkIdBihPveIquy+kSITvrgUboBQDZ0Gbm1ruieyW5YnNQR/JqvKmVFiUxqSrJStAMdLQssivcibyLzep4AlIRgm/zdv5qL+k4KxRVmGldNDi9rJd/sQNcfhI5BW+8F1cgBZE/FcwsfJpxoM5lqgHnkBYvdZKK68TgDo8fhRcCD3taukHvNNN2L0PTlwri/qK6odK0EheITZJqPmau6fi0v5PzjgJKiTQ8PEkaJd7xlLTfDhuWEQnhaFXbA7YiL+OVxhwnwK+vnUilJH+IQGnedH5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ5PPF9FBA0498D.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::848) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 09:31:34 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 09:31:34 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 0/2] Reduce MERT debug log spam
Date: Tue, 21 Jul 2026 11:31:14 +0200
Message-ID: <20260721093116.4011940-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0036.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34d::8) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ5PPF9FBA0498D:EE_
X-MS-Office365-Filtering-Correlation-Id: be67c52f-8fe8-46b2-a39c-08dee70adb1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|56012099006|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: LBiBaT1qIrR5q7YjPYOGrDSRbJ+PhnNBz+hxsZ6+UMGwp53ZqpNvwpmyXDuVian8L6oUgB55d+LcMnBrbXu05GTJ/A5Ry9R3CENdGY5Mqt2CbA2PMZbjD3SHZyNn8f4DF+7u3aMh/clpc+evSUya+8cwb6YyE09M69NzwXuAZ+tWHUVEH7hQldI62hAsnL9V2382txfscf4frmNG5DqzCGtBHq3TYZ9rSnBOSK9GTRLNI90GloZccMa+XgFZzzB+bSxn/f4cViEPQ6xCxl9C5sukfYRVXmHT+bhIDD+T7fl1W7gRdeP8M3+QMi3yiZIGfpHYAb0y/ExrVV3t/6RwhPu8lLDpBMgAypsxFDLpA7/blbgp8363nz6kaczMxDOvtLh6CJmrMBxqgS2sNx0cSDYObDJLFlbE9mZHAKcSuy3+4Teqhzin/4VzhUC5/AH3w97UX4m6EwyLCqTkdz6CbQ2rqEAAdu1jc7+2EAzGjKU7gCot+cryvFHeenjR+ImIM9miYzlZ3jSyZlhjzi5UCmbl9QuPwE2J32crzc+nNn+G350RZ7Qx/ygn6KlsSg+X6ZfKbrxCuBHiP5E1WePRbcYjtZNkiqWQbfRYs9p4+sN8DaFkV6e6JQ4gs1zCdWb6Rf9cW51oggIt0DWa30/x5O5sHfkEsAk7hrl5Zx8s+to=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(56012099006)(11063799006)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2NHNTFkRG96VzNXMkFZMDNQeDgzUk1NWnNhaUN3cGwvQTJkOVhQS0FMNDdj?=
 =?utf-8?B?RGlISlVwdGlpNEpGaCt3UFUrS080dFRtbkwyMUxZNkE2MGhkdVVTblBqL01C?=
 =?utf-8?B?dGVCSXJGUFpORVF1Z1ZhVVJaZzIwaDBuYXFPeDkrSlFHNzZtWjNadjJVR1Ir?=
 =?utf-8?B?djRNaXp2ZjZGeldRbUd5cEhudkxDL3JHeWNYSWNHQUUzRFEyaVpucXlGUjhj?=
 =?utf-8?B?NGtHS2JMSVd2M2J5UkpiYmVVMFQ0NkIwZVlFQzNVNWk3Y1p0d0J6OTc0OGhk?=
 =?utf-8?B?VDhnYjlHVXEyWit5akRabjZwSWJYWW5OU1E4NkZ0SFE1dWNlK25pMmo3bk5L?=
 =?utf-8?B?a2NkTzhhZWorQXMxL3diVW44U2w0WElSUGRPU25FdjBRUFJ6WnVuUWNrVXRl?=
 =?utf-8?B?TDk0N1d0a21uWDhEQ0J0R3c5dWNMenowcEpLUG9MZ1QyL0pKNnV2OHJFQ2xx?=
 =?utf-8?B?NDY4V05wRnZMcnBaTGpPSDJOK2lvRG5md2lod0JyREc5M01rdUdUTEppMjE1?=
 =?utf-8?B?SzJMd29Dd1BRb0tjMTBlZDZ5SngxOVBtZXkxN3ZLL2hBQmI5aE52VDVYMW5G?=
 =?utf-8?B?MFNadUIrVnViTFNiNUtZeTVTenNEUHlZYTBXc0twdUlzdVc1dlVUQVFoUHpH?=
 =?utf-8?B?MU5hSkJlWUgyQ1BtU2RjUFQvUWJ6YzBIZU1vN1FhcHJqWU5tMFdiRFY1S29T?=
 =?utf-8?B?THFDc2NzY0xaZ2VCK2NnMVNDSFRqWUtMa0xJY3RDVGFnTk1XNUhsMSs5Tk1n?=
 =?utf-8?B?MUd2WjBXaU9uVElSa2g2dzZBM014c0VxM01MMWIybVhYMHB1cVQ2TXpQeVRO?=
 =?utf-8?B?RVVzWER3a0JLOGZ5NVZYbUhvMXJjaUUwMDdyOFN4WVFoVi96Ty9BVVhoUjc2?=
 =?utf-8?B?ZCtlcE9uS2ZKVWo4b1QxWDVWUkM3Z3NwQzJuYTFBaFhTQVJKdlg2ai9LOHNi?=
 =?utf-8?B?RkFqQ09rcmJZN1BrRW5ZeEhKa3ZMazVtcVRCWlZLeGZSQjA5dFdmY1NtV0pP?=
 =?utf-8?B?UHFEMmlEb2g3ZkJwclZockI0VEdreFRtNWcvOTZHdTIwclZiTlBMNndoa09p?=
 =?utf-8?B?K0JHUUF1ZDdnQ0kyY3ZFbDlybGZxaU9wcEJwZ3pqL2pzMEtsRCthcEpBM1Ni?=
 =?utf-8?B?dG50cXRnakxCS24vejQxbllRY3R3UUNoK1oyZ2M5ZDZIa3BsN2gyWFBBUzV3?=
 =?utf-8?B?ZUljUHV6cXBHM0t1VDJ0M2xxUjgwT3YrRjBlcEgwSVdwTDY3eVVCcTVZWHBz?=
 =?utf-8?B?NjVBMFV4cjVGMWxBM3plbzRPOFc2Wnd2aDlPb1V1MFROd0crNXRDekZkWUMz?=
 =?utf-8?B?TmgvVTg5WDVsTmRXM09BSXJCWEYvSU9yNlFHZC9FR0tZem9wM1QrQSszWFo5?=
 =?utf-8?B?RWVXdHZwUGdLTmhuSXY3K0hIelJ2OStGbHRDUFlsMDdiYVZxQkV5R0UxYndy?=
 =?utf-8?B?dHpNaWIyNXlsTytjQzJlM1ZqT1NNZlVlQ0NxRFExSFpwVSszRCtmUi9XOG9I?=
 =?utf-8?B?MXhSdk1nTVhqM29NeWYzdUdxSEdCOEJqTzFVRklMczM0VGI1cmxwTDF0bDFv?=
 =?utf-8?B?TGNvelZGTDE0WThXY3VYcXQyS1RwMThPRTVuVG56YVR5MjIyQVFjUXpXK2U3?=
 =?utf-8?B?VjJLRC9qUEE3TjlGRHFvQ2hiWHM4VEtERm5IeGtHTHpRSVkxOHVsMjZheElj?=
 =?utf-8?B?dnhrbCs1Vy9jWW5CMVVrZC9DK2lVdldtMFV5bW5uR2Myd2JkZmczMkVMK1JX?=
 =?utf-8?B?aFFvV05qTmdkT2pYVjdxRFBWalFqTVg2em1EQXJmclBLcE5Ga09WWDR2NTM4?=
 =?utf-8?B?STkrRXZxanhIR2c0ZTg1ZC9uTFFaTEhqQ1BxZ21xekh1bU91RHR2K2xqeXkw?=
 =?utf-8?B?NWkrT1poSFlCWngvUnUrb2RBSDVKZ21FY2pVN0NzUGpFUzZENXVZeDV4eGVC?=
 =?utf-8?B?dlB2RDl3S1pwaEpJUnFwbmlqWnJ6VkZxdlNIL0piYTVWY3diTmVLZzhLcm4x?=
 =?utf-8?B?M1lLL3dFR3RQajBxQktSZjc0VGV6NERKaFNkMEExcHl1M3cxemh1MEtnVC9z?=
 =?utf-8?B?MGRuckdMV2xGOUliaXhJZitDVWpvbmFyc2xUcjNSankxNFNldncvUExoM3VU?=
 =?utf-8?B?aUlJQjVrMWt6eUFCZUJBQUpERGg1YjJabmljZWFHeWtJbmc3MFRGSTlVVHU5?=
 =?utf-8?B?WTdLSUhrWVhlV1ozdHhTN2FpcUdhWmw1Ukozc1JSdnBsd1RydElGcU9tOUp5?=
 =?utf-8?B?d3Z1L24zUTRTR0xIRFJQWnQvVW5vUWNTSkNpZDNDZUE4WjVpZ1IrS05DRUwv?=
 =?utf-8?B?QVdhSEsyNmE1ZlpwcE8yTTBQUzJKa0Q2R25xdmdiWjBRcHFndjJtM2VXcmZO?=
 =?utf-8?Q?kDXTQYpyj+E9In+4=3D?=
X-Exchange-RoutingPolicyChecked: nvXpNJTc45juoDaqqT9bCXqaeIHhWWgTW9ZGDP5NqN7zFz57b58txcBMQJv3Eu8SducbR3YiV94Z0p/jWV3nb2/JYrkPiP4Ic32SnZ43PNr2qD/DlL29H9XG92zlNik3KZWUEbPHBZBAmXbh5EsYlFnrR6qU56Tv2JnQGNBz3iV6CwTSDG7qCKqRufc5JCp2uwc4cEvdsylv7QmsMkZQ8wZQqrr5Sy2gewRjtE0OU10NgrJl1OG0C8t67w8TchOvTQpsu1AbTTBUOgZ4PGl5mm4v+ozZsR2dySaVqOM3ZBLCcOI1ouOoqEdMd9GhSZlsiyB/LMWx41qrNxe8E/PZuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: be67c52f-8fe8-46b2-a39c-08dee70adb1c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 09:31:34.6011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lQ+XK9D2jtuvT5rHTTzTyltXIWSxJQeExHHynE8Njoq8t7xYxT+4rpx1J+/kZK9G4GSkv3Hv4FiCxtWQYv7SycldyeLJukhDPL08WlcI6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF9FBA0498D
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

Add rate-limited debug logging helpers and use them in the MERT CATERR
LMTT fault handling path.

This helps reduce excessive MERT debug log spam when the same fault is
triggered repeatedly by a faulty or malicious VF, while preserving
useful diagnostic information.

Piotr Piórkowski (2):
  drm/xe: Add dbg_ratelimited printk wrappers
  drm/xe/mert: Rate limit VF LMTT fault debug log

 drivers/gpu/drm/xe/xe_gt_printk.h         | 3 +++
 drivers/gpu/drm/xe/xe_gt_sriov_printk.h   | 3 +++
 drivers/gpu/drm/xe/xe_mert.c              | 2 +-
 drivers/gpu/drm/xe/xe_printk.h            | 3 +++
 drivers/gpu/drm/xe/xe_sriov_printk.h      | 3 +++
 drivers/gpu/drm/xe/xe_tile_printk.h       | 3 +++
 drivers/gpu/drm/xe/xe_tile_sriov_printk.h | 3 +++
 7 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.34.1

