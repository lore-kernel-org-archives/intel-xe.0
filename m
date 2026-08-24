Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F883C5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 08:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57D810E663;
	Mon, 24 Aug 2026 08:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CO/qJWqj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06A210E663
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 08:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787558975; x=1819094975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=c1tDEwEfoULjf7C4lsOcGtHu0Sh+kR+MJh9/Zv82HY0=;
 b=CO/qJWqjdaewWAt46EzTNdjEZCqCyGx1ZEwYX91zZmaJoyuuGmR4NaGg
 XOgef7c0QGk6ub+1njyyh0ZzobWljbMAc6XHf1UfXdC4Z7VxigPIGVpN6
 CWRu6KBKoTphptuFF0r4l4NIBt1B0EbTD6sFc/B9Vsl77mmWb7siW5emu
 L0VB8Q4SJSIF/mJuJwQU+H3xMWPtfB4gft6QY5baMqn5yIIx/l8jYcoPU
 xFs/iwp5yZuU+90y5TMN7MfXtOwhzuVzJw52MxQIzkl3Og3q1QdvUhb6T
 kCIUcBCs+bZ0pfi/gNjO/Y9I025sljeEBfrbSfiMKPzzozy4oOEXfoqvW Q==;
X-CSE-ConnectionGUID: n88wH8LJQjaL4WXoJhcSJA==
X-CSE-MsgGUID: P79KitHkQsaa/2xRPZh1wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91681502"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="91681502"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 01:09:35 -0700
X-CSE-ConnectionGUID: 3K3N5mNDR+iErft2mnOuew==
X-CSE-MsgGUID: 7/+MsFp/TomILNN0L/aN0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="305135245"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 01:09:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 01:09:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 01:09:35 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 01:09:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1x2mc5wiH4aTkqhJY7+CkNLY3GN8uU8pJwGsIMRwiohJE3D+MmVdHo+tOWIHxLUhsWyUVRw3ssDMSVoGnNjWXACTwGk+iUIboNmTw4iTQrc5EaqSQFL6Q31Mq8KiD/9tF2n9wv/s1ouoakzsgBvZ5/b+0CUS3hZM9Rfe8PsPafvz60T4tMvQHWd3EGaKstXqMwROgrqiKtYROjbTRA4Ok1Zv2j5i2ZzOasJLlFBj9n+WaUGsNge+dnI4cc1Rzf8LsY5uceQbdrRr3hB1+xC2Rm3/fu8t9XwPofn5wQ8JfjrpGfva80yIHP8OP6DiLEnvDZtnnmIA9qvoZHmo8T7yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8dSFd8DbKJipuZcuEZtDfuSnO13Z5amJA1vPtaNcbw=;
 b=US8Ew7AGf9nJNLIa4CXf/VdWs1Kjo+Sr4AHOaJgTI82AG6d/2r5UDlVBWlMsaV31raPEo9t85CpaYt1TDGFCWdBoxOntmTiHdkXaDuhHV2crkqae+FPlLyVtvH5kB1VENAtokeeKIA8adgH7lNjoxfXK4dnuxRJzUZPzk1zh4igDIuS1MderH3Gfh7CgAkjgJkNDL0W71RuIh2ZnIA4WiPCwgbwC6tii9idq1jVRgmb0ItzY35JZ+y0lduOapsmP3HMTy9sBg3zhXI8ACHAQl/QxqLJFijBWUfWPwBc1UzAAmwCp3FAjk4iDf2vVjLzn7ovFMOix8AI8ES+DyevtUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by BL4PR11MB8869.namprd11.prod.outlook.com (2603:10b6:208:5a8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Mon, 24 Aug
 2026 08:09:31 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 08:09:31 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 4/4] drm/xe/kunit: Add tests for PF-mem regions
Date: Mon, 24 Aug 2026 10:09:08 +0200
Message-ID: <20260824080908.701133-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260824080908.701133-1-piotr.piorkowski@intel.com>
References: <20260824080908.701133-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0302.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::7) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|BL4PR11MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: 5129483e-2dc2-45f7-278b-08df01b7069d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: VRqYrXlQdTSKg8FJulTXJnaDa8TfhchX3MHvm6mZTnwv8Ruis6kCuk+lXKTpwNiO5RgeBHFT70Wz8/QP/Ee/OlH5HrV3A4e4MKGknfS2Zf3UWHD58H5R7yE8yQ/QeL2yDRXX+R36j5D+f6gnP1sfiIUhA6v3fnvTvC5KzDZtbE7or6E4i63I/4XBLbzA6bTM3jpk45GKhTjtjTyM4odM2UKciUxnDUmZLBHq+EGup3CI6PcqL6oTI7pvrok8ILdHCa76D3fYACX612D9VcJ7pVpXWGPc5MaBOuRPLd6ww6kCe3+of9vGAI2nVvPD1nnjg6IgDXecNj6UJ63I/4+CrYuiL3ZJ1FAgmIow0fLSc5cUvEC5KMwHtGz544UALe08fm3ilRj64108FLTqiL4TSoiYLcQCgu1o5drZiKg+YTQHRXQ3AqW4RAxu3bLO3PpsdEtavRWDOJGnSQKQagmfm3wVm2Yp6XRlVw4+Vq6316j0X8G3JXoKZ7kr/xYlWQfzna+YP7LdALlyA3kFxR4PmAWuc0RsEd6F3zhBHWlWB8CT22z739vltfRFSFOCxfqJ/KpVWFcXulqdveOEYVM0bMP+WqKSFKwQvw0pu+uVYgBQRqlU/WzVu2D1QHm6dlPFha/Hd3HuzLYRMkkV1Nx/E6SllXOMpmRUrhpkKP3GwL0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTU1Z2sxeGorK1ozSlk0MStBaVdCbjBNc2tPUXE5cG9MNEJ6YUw5V3JmcGp6?=
 =?utf-8?B?WFpMcUx6RWNzeHAya3FZMkhlRlYxVExmQ09jMmxhS1daKytpeGJhME5oenFr?=
 =?utf-8?B?ckxEekpTQmZxT3ROUm9aTUNMVWNCRExYNCtFMm9oUk8zVTJoSmdVbElLK0RL?=
 =?utf-8?B?UFBRSUdOYmFUT2wraEFZWm9mREJLME5XY2RuRE44UkpIY2N6cUNwa0xmeWxq?=
 =?utf-8?B?VTNnR2RTc3oyZ01EZnNvdmhINFgwTEFFQ0oxSlpZeUhvb3dHeUV6cjhJZmdu?=
 =?utf-8?B?cVRjazM3S1hHSFVvempqSW1GYm5wRVQveTZZYUxGL2dsaVhTcTFqMUNYMVZy?=
 =?utf-8?B?UjFPaWZueTJncVE4NE9IMXFBekRiSXZQSGhBaHpXb2EzOTk0ZlE0QjB1SzRE?=
 =?utf-8?B?V1NMMmpMY25KUEJjK3A5Y3dUWkVMV1FNN2ZBOEJyb0RwUXJYRVFuczdCN2RB?=
 =?utf-8?B?QU1XbnpqYzJYN3dES0lkdGkvd1p2dXN2UVVBekRScnV5UEJ2eWhSQmZ3anVN?=
 =?utf-8?B?WGcxNWZGRXBLSE5zZDNwOTkyL3ZQVGJ4ODd6TUtSOS9ObUVMa00vd1hoUzRE?=
 =?utf-8?B?YjBiZTZRS0dRbEZZa1YzME1YQUZOTVU1Zlc1bE1XcVJsR0JVOFpDV2RlaHE1?=
 =?utf-8?B?NHJUeHZiWVA5Z3dOR3hyR3ovQW5FM29LWmM0Y2wxYmUvV2k4ZDUySW9CQ0U3?=
 =?utf-8?B?bmltVzd5ZVd5Ty9nOFZ5UUZrMGU1WDRROC9OMlRNZjR0clI4dFo5Q0twU0Ix?=
 =?utf-8?B?SkVKdFRTSkJ1bFR6RjFoaHlYNkNoVGliaGsrZUF0WkhuSjhJZkJNLzkwR1lL?=
 =?utf-8?B?Q2U5d1ZTYlUwQ3hzNEFURWxYZTNXWG1nZTV1c2xHeUN4RHdya2hFM0h5aDJM?=
 =?utf-8?B?ZG5IWVd6Z2xtcXAzVnp0ZjBDUUpERk9SbUE0WmRQZ2dRUEtRTnhOWEoyYXhv?=
 =?utf-8?B?d01JaFpRbEpvT3hWWjNMTmxWMVJGYkUyWlpTcUlaQ3YyZkdUblI0RkFVL3Qy?=
 =?utf-8?B?Tm04dkYydFBaYmFQcHY3YWFMK2ErZHBMWTJhSldvN0xLcFFOSWkyb00zTmFm?=
 =?utf-8?B?Wk4xVGJrSUN1cjluMXRUajBGZjVubmkzcG80bStHMllwVEtxOG1zajFZcm5l?=
 =?utf-8?B?S1FFWlRNUngzMVhpWHVWZjFyLytlenZYOVNqdENoUkcyOThNVmVpMlhoT2Ri?=
 =?utf-8?B?SG10NytWSGVnTkQ4bW1rTTRjQ3I5ODNUK1pKTjQ5T0JuNUNzM3JENUlTcSsw?=
 =?utf-8?B?TnhvRHhDSWJLL0NGVGVDR01yTVNZZmdoanFtU2orRUxZeStwRTM5T3ZMWkk5?=
 =?utf-8?B?dnhrWURLaHBHdmd2OG5yMEtaUHJLZmJjSWFOSXAxRjlMYUFvR1RocEdHWDF3?=
 =?utf-8?B?NG9QdE5WTmhwWHhRMEVadEtDTlZYYm9WVUdHVzhVSm9ZZUxqZE9JMHJCRHE3?=
 =?utf-8?B?RmI2dE82Wkp5Q05aeDJsS0pWM0pzcUE3eVM0alpxa04wV0V4N2xiWk1aMFF1?=
 =?utf-8?B?OTZUeGduWDlWVTBZd1lmc1pWTnkwWExDZHl4cHN0TXc1NjRaTlVMOE5aeXNh?=
 =?utf-8?B?a0N3ck5uMU1kblF0YS9XN3R4SDRueHpiSFlubGUwWlpvSXA5cHR1V2orQitD?=
 =?utf-8?B?MThnUDZFZzl6TXZUb3pWTTRWRXBTNkp2VGRoQk90ZlZzbnVlanhFdDNhaWlz?=
 =?utf-8?B?WjhCV3cvYU4xMmZJU2tHQmg2UHROTHN0VXJYQWRETFdXYlhOc0kxOXhlTk84?=
 =?utf-8?B?SHBtY25QVkxlLzkyWXFtcXVEdEpJS2x6M0U3eEk0VnJteUdhS1IxQ21lbVls?=
 =?utf-8?B?WjVzbUxrMXFqSnFGd3NKekc2dnNLTXlSY2YrVlovTHVySnlkZVpoUk1aempU?=
 =?utf-8?B?eHRoTkx5RnloSDNJV1lFOVlMVWRQcFFPUTF0T2FPMTZWTThSOEZmbXFTZlZE?=
 =?utf-8?B?bTFua1ROR1NnRGM1SHR2ZWVCQTNvL1QwY2lUU0tHRGtKS2hINkZndDFzV3p0?=
 =?utf-8?B?OU1SbURXQWExall2WnJPMUd0aHpZZFBYRDNRNVNBbjhPOHRVd0RFZGFidUtL?=
 =?utf-8?B?eEowQ1JiV3UrN1U1RlBtQUxVd2NSQUJyMEN2RlNZRVo1bHFROXovU1NyU01i?=
 =?utf-8?B?NTZpNTZmUTM2MXhRMm42NmliclBFM0dtUjZTUkVEdUJXVkdON2tQWWpOR2Rl?=
 =?utf-8?B?bWRaN2Rlb2V4UUorTGVUaFB3SXlTVVhhYkk1Q1VNMlZvcEZVWXBHdk5RbmNG?=
 =?utf-8?B?bGlDNDdKeEVVUGFEVGtXczVHSEN1OTZBYVYyV25hYmdReTMzWGIwTlZ5TDVE?=
 =?utf-8?B?ZG5qL2RTZzZHMS9Fd2dLNHBBQjI1bnRISDFUVGpsSmt4UXg0N2hQcDczVmEx?=
 =?utf-8?Q?2l+46P9BTqueXjDI=3D?=
X-Exchange-RoutingPolicyChecked: cbT+V5nPjAW9LmPgFC4NcTN4C7qoBXo8UTRFrWRflgTtU4wuUzskG6OSqBVa/eZoGOaJXGGDNmFS+ha8mq537HC3qjsGWqv0ihtOh9hJ9kxNdpLFKPfxrr0fROt7CNCEdh7Ou5Lt2iKc1yjOv10hHHzO3xe08ks0ByTqEneE2Q8E1qN+/FllQwzBmUAILdI3i/AZx61D+xqfxFzuaWWCIiCjC2lfLAyj0y9DmEcVguT9flAM0UmW+uRy4DYmVpOGzN+o3tAyA8mL2yO7AOLsziY7kfRWaMUKH8veLWrG4fEakxT2KeO6fihgV9358sI5Q1RKYJQyKSM4sQN2lR67dw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5129483e-2dc2-45f7-278b-08df01b7069d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 08:09:31.2440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRUvVd83EPuVHwGQYbqZTNnQaTdkf4COP6yTc9Tf9Qh9r3J/N7wkFR5PoDGy4DOh34VeOnSnHRLhGn+8e4/OIG+9S3PoZasAYskBicwWjrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8869
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

Add coverage for PF-mem VRAM region metadata, bounds checking, and
full, partial, and missing CPU visibility.

v2:
 - Use a mock BAR mapping that fits into a pointer on 32-bit builds, where
   SZ_4G truncates to NULL and makes region init fail with -ENOMEM
   (Sashiko).
 - Use a page aligned out-of-bounds offset so the bounds check is actually
   exercised, and cover the unaligned offset/size cases separately
   (Sashiko).

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_vram.c | 118 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vram.c       |   4 +
 2 files changed, 122 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_vram.c

diff --git a/drivers/gpu/drm/xe/tests/xe_vram.c b/drivers/gpu/drm/xe/tests/xe_vram.c
new file mode 100644
index 000000000000..98787a1221cc
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_vram.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+
+static int xe_vram_test_init(struct kunit *test)
+{
+	struct xe_pci_fake_data fake = {
+		.platform = XE_BATTLEMAGE,
+		.graphics_verx100 = 2001,
+	};
+
+	test->priv = &fake;
+	xe_kunit_helper_xe_device_test_init(test);
+
+	return 0;
+}
+
+static struct xe_vram_region pfmem_parent(struct xe_device *xe, u64 io_size)
+{
+	struct xe_vram_region parent = {
+		.xe = xe,
+		.id = 0,
+		.io_start = SZ_1G,
+		.io_size = io_size,
+		.dpa_base = SZ_2G,
+		.mapping = (__force void __iomem *)SZ_64K,
+		.usable_size = SZ_64M,
+	};
+
+	return parent;
+}
+
+static void pfmem_create(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_region parent = pfmem_parent(xe, SZ_64M);
+	struct xe_vram_region *vram;
+
+	vram = xe_vram_region_alloc_pfmem(xe, 0);
+	KUNIT_ASSERT_NOT_NULL(test, vram);
+	KUNIT_ASSERT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, SZ_4M, SZ_16M), 0);
+	KUNIT_EXPECT_EQ(test, vram->binding, XE_VRAM_BINDING_PFMEM);
+	KUNIT_EXPECT_EQ(test, vram->placement, (u32)XE_PL_VRAM0_PFMEM);
+	KUNIT_EXPECT_EQ(test, vram->id, (u8)0);
+	KUNIT_EXPECT_EQ(test, vram->actual_physical_size, (resource_size_t)SZ_16M);
+	KUNIT_EXPECT_EQ(test, vram->usable_size, (resource_size_t)SZ_16M);
+	KUNIT_EXPECT_EQ(test, vram->io_start, (resource_size_t)(SZ_1G + SZ_4M));
+	KUNIT_EXPECT_EQ(test, vram->io_size, (resource_size_t)SZ_16M);
+	KUNIT_EXPECT_EQ(test, vram->dpa_base, (resource_size_t)(SZ_2G + SZ_4M));
+	KUNIT_EXPECT_PTR_EQ(test, vram->mapping, parent.mapping + SZ_4M);
+}
+
+static void pfmem_small_bar(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_region parent = pfmem_parent(xe, SZ_8M);
+	struct xe_vram_region *vram;
+
+	vram = xe_vram_region_alloc_pfmem(xe, 0);
+	KUNIT_ASSERT_NOT_NULL(test, vram);
+	KUNIT_ASSERT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, SZ_4M, SZ_16M), 0);
+	KUNIT_EXPECT_EQ(test, vram->io_size, (resource_size_t)SZ_4M);
+
+	vram = xe_vram_region_alloc_pfmem(xe, 0);
+	KUNIT_ASSERT_NOT_NULL(test, vram);
+	KUNIT_EXPECT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, SZ_8M, SZ_16M), -EINVAL);
+}
+
+static void pfmem_invalid_range(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_region parent = pfmem_parent(xe, SZ_64M);
+	struct xe_vram_region *vram;
+
+	vram = xe_vram_region_alloc_pfmem(xe, 0);
+	KUNIT_ASSERT_NOT_NULL(test, vram);
+	KUNIT_EXPECT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, 0, 0), -EINVAL);
+	KUNIT_EXPECT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, SZ_4M + 1, SZ_4M), -EINVAL);
+	KUNIT_EXPECT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, SZ_4M, SZ_4M + 1), -EINVAL);
+	KUNIT_EXPECT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, SZ_64M + SZ_4M, SZ_4M),
+			-EINVAL);
+	KUNIT_EXPECT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, SZ_64M - SZ_4M, SZ_8M),
+			-EINVAL);
+	KUNIT_EXPECT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, SZ_64M, SZ_4M), -EINVAL);
+}
+
+static void pfmem_no_io(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_region parent = pfmem_parent(xe, 0);
+	struct xe_vram_region *vram;
+
+	vram = xe_vram_region_alloc_pfmem(xe, 0);
+	KUNIT_ASSERT_NOT_NULL(test, vram);
+	KUNIT_EXPECT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, 0, SZ_4M), -EINVAL);
+}
+
+static struct kunit_case xe_vram_tests[] = {
+	KUNIT_CASE(pfmem_create),
+	KUNIT_CASE(pfmem_small_bar),
+	KUNIT_CASE(pfmem_invalid_range),
+	KUNIT_CASE(pfmem_no_io),
+	{}
+};
+
+static struct kunit_suite xe_vram_test_suite = {
+	.name = "xe_vram",
+	.test_cases = xe_vram_tests,
+	.init = xe_vram_test_init,
+};
+
+kunit_test_suite(xe_vram_test_suite);
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 61fb4a543cb0..2fa809831662 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -483,3 +483,7 @@ resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region
 	return vram ? vram->actual_physical_size : 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_vram_region_actual_physical_size);
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_vram.c"
+#endif
-- 
2.34.1

