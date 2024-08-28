Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1731C636EE
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 17:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C51010E4C1;
	Wed, 28 Aug 2024 17:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TaCVfA4M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227AA10E4C1
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 17:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724866387; x=1756402387;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=dxyThIsEUyGULRnCpUQe6MX+hgQMTMPvYV6I1Y8URg8=;
 b=TaCVfA4MMfkBh8uL41kPP+c4cF3NI+nc6XqB+B2Siu1VJ7ip3t27maQd
 fkOlfXKsiGJof2cQ60uRFlx5GGUDcas4aOZd2dlx3dplmClOnF3esvqip
 8MN7HUI5N0+A6vrsGl5swznNJmNiBssTwESwe8dsJxiYfD6jy7rFvfzim
 /h2l8KQqBP0AFB3dMkReev9KaN7CvnMzTRzjASvZ9h/kHYQIleEtHJJ8j
 f7dw/lTsLwZCDkt7XWnWrQSQeSdt1PajU4GrelqwGpkNFQQe3lZLq1dpE
 qsX/JBEjBctHO2aGjONFEVe7DEDScFZVPthhavbU7AtTMoTJ72F810ERH Q==;
X-CSE-ConnectionGUID: Go9Z7uI4Q4WqRmZwzVwqmA==
X-CSE-MsgGUID: SP503CehTp2lc+qP7zpB3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="22937361"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="22937361"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 10:33:06 -0700
X-CSE-ConnectionGUID: zHb7Yp79T9ix5obL78+wvw==
X-CSE-MsgGUID: u+CvgeUtTB+5SPjABa2ZMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="68095457"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 10:33:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 10:33:06 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 10:33:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 10:33:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 10:33:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzZTm8hOIalVzLge+APBEgRm+xx4JzAKAZaKXh2Kn8fX9EkIAZqoWRiXpyVtBzV3tFBMJjrWRGyF05bOG0hCjrPLxKc8D3gw9DGA8vr+U6RhYVM6RSMF2Li+/I1s1dM5t7gIz8FxnhqGEDrF6xWK0rvRjBPjE4NoszdPdQV27FI4l2WFj/j0G6pv+RhThZ4EtfQgKpAsUU7FbcEeZRbtefk25EkB+2w+T1GkE/K2cOdW5k6cjHHZqEkbTxbdu0Che0VsqhaKBvRCBHhu8aa7QraxlLNF8kayCWxvnOGz0SSZMK2PQyZqVIZWw0xtfaOGLvj5XzB2uZn2FDLqtY8YUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOaVcsVp74tuztcl9tja3tVE560Ozw3NWPFqEAIiSXc=;
 b=ufX1CuU127lIoOWLXUjD51fn06rWAp3Boerp0rAO6KREhCEbFqeJAslLpdwnF2gfyg9Tp0O5XTYQaZN5XnEztJFVrPS9R1fOSZU2ecVNRhS6lwfdVpfugW4ChiI3iA0f/TxcqRCp9iKnOvxkekkQp0wasxjKkW0/vYa1nR6bEIXWnlJI7i4sKGymapa2mCAMDRzK5zqjUTy8zE2Yq+00o4hfhZNFU0msKnKpxkzS0q2Uj+fNt9cpEcg/Uo6ILXvtHzPxIhvM0tRveNjwbqAM5teN9mNfQWTpJRx7nzhb6hjZSxyAybSE7TvqrDx4BDN+8CFYPswM1G+A9BCIqtSSVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CH0PR11MB5281.namprd11.prod.outlook.com (2603:10b6:610:bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 17:33:00 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7897.014; Wed, 28 Aug 2024
 17:33:00 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH] drm/xe: Add missing runtime reference to wedged upon gt_reset
Date: Wed, 28 Aug 2024 13:32:56 -0400
Message-ID: <20240828173256.182364-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:303:8c::26) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CH0PR11MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a2a8e59-56e5-4755-0b11-08dcc7877674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9ohWGHC57LuFwbd6hySyy9+/97vX6kyXbJPksTdUk9WBS7mD+EfrRVaB9BnI?=
 =?us-ascii?Q?Z/Mc5bo5s+YvJMkiZXLW3af+HcqI5pzndMgGFS0HZ27XI3ouTysvmsBTSnNe?=
 =?us-ascii?Q?bmyAn4bUvDSGBmVta9C87Dhl3liJqv6gl+170YeBjdcTgf7ZSfCuAoEnCrDA?=
 =?us-ascii?Q?rzIFoFBlODsTXv2XYq0lL5xDVH3LAZgIA7L/9j81pWFE4CQcpYk/C9SDgkvw?=
 =?us-ascii?Q?BA6IOtw8Gbp8PKLmqYloq8r1mPdER0v8P20+mTuczqi4djEP9p6UzeqYY3ws?=
 =?us-ascii?Q?gWuPSP9b1j0UOigM8KsViTmIi1nYZzRLUVPNeIeLCEZNF11dxbAt4tIxwMIE?=
 =?us-ascii?Q?NE0XxfliU65VNowwqdWmpsw9dZDonFgCY+DlYzOGlScfICx2QAfLnGAOsiQY?=
 =?us-ascii?Q?kUFFQQBN9nu+rOYQ22db1OcrwKw6qc748kob/rz8pSxNHxlB3000DtavOpFf?=
 =?us-ascii?Q?pt0eINv93zV8+LsP/Hvflp2X4zV7JaIU1V1YBdblh7dvd8LwkEEqkNgs/NhT?=
 =?us-ascii?Q?NvPXjBMj0IxkTdiDeOFNYVZTbPby4YUT8f60rCC8RyjdU5e94DXtj+rqbcEr?=
 =?us-ascii?Q?bcKgqdLx1Vr7QZ3NYl0O8Ujr+h/e0wrg1v0exNVIjcVeikJu2StYed7IyC4i?=
 =?us-ascii?Q?Ep9LWVIur7Rm/4sdi8aGFHDwOtu7G9spM+HU91A6zlgyUFwjA8ZV4iE9ruu8?=
 =?us-ascii?Q?Pt95y1bXIgx/0H0vOsWB844jjtv29Yw7F3y9mFtOed264yxJDzNcDyBdz1QK?=
 =?us-ascii?Q?JxQj3AEsbGer5EaneT5aw0933VmHXcBvR7RKgb0Az35g08BKIN9QOdFsL4wH?=
 =?us-ascii?Q?7uC2opB6WCJ6SJ7ecXH+2/aF++DklhMZFApOCTTFJFhci/kqhKOFpbxF4/+A?=
 =?us-ascii?Q?v/oHK2qXD2BV/EhHjyyjNglGEVqrbm9/YETnUG83/h5473h7SUFdDTWJOKEq?=
 =?us-ascii?Q?b90ICTTlZqCQ/Pm/sD4xXnnNegTDcGV76lAkwUWVTx6h+iCC05alhUFLkPT7?=
 =?us-ascii?Q?homEsRzh/gbH2wvU1Scj8IxL5BObaq40nHq7IwuYFKVyUwjZtPWLM1qCmP/m?=
 =?us-ascii?Q?vYh/2gTNpJq5xry0c3kzJJKLI/U8kUez3OG0FlJQBPxWn4h4Te4QIYsT6bCq?=
 =?us-ascii?Q?kUL9y5bhIn4DmZZCPTMBfdsHIg3nUZr/dm8NAzKezY8TetwnkmEIb2BXZ6t7?=
 =?us-ascii?Q?VlqKNR7Gq9COiVBe6pcL16PYhIKLy2lQCd1RYkYEBo++cB71oHtvq9xky+av?=
 =?us-ascii?Q?FQjiG9fSQFATmVTlyJTfJ8Acc2ZJEjHkZrKhB3yVMVzsiQvmGJrQA9VM2tSK?=
 =?us-ascii?Q?WJAGhvesdZ/X6bTR7s8OQ9diGEgjVh+V5my6JsupCtjmPA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0OO6c1vH2jYrZT1c38qJmBW9PeCSSOsuM45wGm4I0cHQgnJD209Ysock6b7B?=
 =?us-ascii?Q?0lijysHrzo2+316qdoCgnstpfioT8w5FZC9MuFgVgySfXxODXkvBdRu5C7wh?=
 =?us-ascii?Q?1sRXUv21KEKUHB3A6F7NmWReWFhWZ51C5VQ44NYIqW+z9b1L82wRf/pEitlb?=
 =?us-ascii?Q?FXEkzB28c2gLVR1OvpH42GPLOi0kK6IY4P4ROdM5BuxrjncBK3k4X5/cLZIP?=
 =?us-ascii?Q?hFC0pTKrYXW/ynyYyeM4VfI2WSPL4ZkgwBUjcJxlIawaimKvUMEqmGpZs7oG?=
 =?us-ascii?Q?DYFNe4y7TFQkzfq3btPq3QyJgW5NLJ7KBQwaYO8d2OzGInkowNBBzsT/NUW4?=
 =?us-ascii?Q?yqxjMlbzBFxr3FrvUUn1oudJdxBvUEdZoLf/9WPyFfvPmAihl2V5NJ4xWC8B?=
 =?us-ascii?Q?85fKjfECUvQvX2o3I4JVmsdjMlAQdFav4zeXOGwA3bTXjfrAyYI9t0qdBar8?=
 =?us-ascii?Q?9oo9mYbliWwkJOASS9J6YbERvXQWBQHSN8oaGnRr7mei7pHkB3c2I8pzLgK5?=
 =?us-ascii?Q?UuobrwJXmERk8FzUHmyOtpWXz522dpu7FmtoLnc+QlRY9faTkCixEMZhQDVX?=
 =?us-ascii?Q?aYqUumUBGooOSy5aCfO6npWvUuop6KeANQtEs5zQ4RkfFltXHCKuvkaJFQiH?=
 =?us-ascii?Q?8grY9i39obbEON5lzd9uZ6RtKmKMcvFn6S6L0ZtSnlgpUynrhDLO4/8OpSHL?=
 =?us-ascii?Q?2FsqIQ+kDlzklZVr6nINACUkKXa0Bt8MZXtEZz/qSQc+s+GsyVZ6mhnihylz?=
 =?us-ascii?Q?0Zcux67D1SA12Wu4woGVzgQ1xRMxzMgvzf4tm36qL/hKjQebidoLvSgwvAKG?=
 =?us-ascii?Q?tJ7oYCwEuXulGP5MSfmna+Bl7KOmaTBT5h6GaWDknMra59WHVoJJ5a92dAkk?=
 =?us-ascii?Q?tertBvUuxN7Ks3qQnmbdFMr0GfNr387W/36vUp/8Mge1iPhwi/fEERSewZzp?=
 =?us-ascii?Q?wXBt8TrathCBa2zqptml2NTlfRGOkxM70MnTx/eV/ditk5F8z9enB6BpxjMV?=
 =?us-ascii?Q?udm+De8C+wxwdViV6Ow3P2jRvkC2lj4CzRiLjRzVS6LMVfVx0jAeb9KpIxJK?=
 =?us-ascii?Q?TRpHnwUXsHbydIc2EFCtZUbOvf9xZN8vt5SZNknEgDTgdKm9IB34hO4vAGW5?=
 =?us-ascii?Q?nSUVdI5Ysy/OPpneSvH86mRDS2ChGWz7Qybm3rZSH/E67lLsQP8d1yHLRZMd?=
 =?us-ascii?Q?r1uBhjCMvGxXRqhMBlVQ0+xaGm+wKUFrUbygldAY46jpyNnK6Xllczg6mkwz?=
 =?us-ascii?Q?X0Cyu8CJUYEaaufR7zuJ4+RrkoBFvBh7RfA375dzuxn5c8uJrdDMvCYUrgU9?=
 =?us-ascii?Q?aaBAe8RiUXQQxS3wRkBBv6fAowCg6W6o2ZOaxVaADrviM7Y26ORjQ4XipkTq?=
 =?us-ascii?Q?tW1IOlx0xvMScZvjeeEe92uOvXGsoNV441keqFNmTvucUwlnXiuz7LlrCDfy?=
 =?us-ascii?Q?boF4HaJBtDI52a/JbUZ9+R2g2Tv+wFNWAlRZIV7poHmD6kFIGNBW4dtC1Ls2?=
 =?us-ascii?Q?6VxY18GXLwYjFIdLuUfopvdq9Nh1VbN9far8h6VZcJVzp+WXvhNSKMJq3wX6?=
 =?us-ascii?Q?SOfKp9KaB3emO8AT/UWUDk/BnucXN+99ifw4ukAntIZL47utS6tJHqZBi0fI?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2a8e59-56e5-4755-0b11-08dcc7877674
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 17:33:00.4035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJChpHMvA9tc0NBgkSnTJl0utHyNfSO6NVcS78H7rxNmHWk1zcpVf9z/SlAWMlRU07eQ9M9Aya1COScbk+FI4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5281
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

Fixes this missed case:

xe 0000:00:02.0: [drm] Missing outer runtime PM protection
WARNING: CPU: 99 PID: 1455 at drivers/gpu/drm/xe/xe_pm.c:564 xe_pm_runtime_get_noresume+0x48/0x60 [xe]
Call Trace:
<TASK>
? show_regs+0x67/0x70
? __warn+0x94/0x1b0
? xe_pm_runtime_get_noresume+0x48/0x60 [xe]
? report_bug+0x1b7/0x1d0
? handle_bug+0x46/0x80
? exc_invalid_op+0x19/0x70
? asm_exc_invalid_op+0x1b/0x20
? xe_pm_runtime_get_noresume+0x48/0x60 [xe]
xe_device_declare_wedged+0x91/0x280 [xe]
gt_reset_worker+0xa2/0x250 [xe]

Fixes: da4b21f402c6 ("drm/xe: Add missing runtime reference to wedged upon gt_reset")
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 224c137967c3..a895704bf64f 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -794,11 +794,11 @@ static int gt_reset(struct xe_gt *gt)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
 	XE_WARN_ON(xe_uc_start(&gt->uc));
-	xe_pm_runtime_put(gt_to_xe(gt));
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
 	xe_device_declare_wedged(gt_to_xe(gt));
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return err;
 }
-- 
2.46.0

