Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003B7C47DDF
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAD910FE69;
	Fri, 26 Jan 2024 20:32:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA2C10FE64
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301147; x=1737837147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2q5fZZPvKfpIBvSCteUewPEYald0DZi3nPQlWoauSIM=;
 b=SRJvpu0P6jagQgxbw/n6kM+bpgCmQ4EsLLnwWmlqpOLPzeRfeHOOcrJQ
 rPboe2UHgbHEk2jhtQndAuMPoptMvHmYJuSxVVsx+ScUR+4dlwWlt5JZr
 tJlR/jOK2FxD/Et+TRrf4GivXl4c+ylrh8NvBi8myEFr3E/abHPxnjPuc
 q8ynX8k/26kVCk5XEyiMlLkg1IXiRyl8jAj9jf+5Z2F+D5I2yTKxmDalb
 3OPL8bE3uZwzCcxNZ5sw+KMz06Gj6oi69UHbcxLhYyL5JDVD8LljMqyzg
 60o2bD79ghR6FleuOOZ9kJ1IkeQvpoQY7FVAMP7qm3Sg34JRP+ZpbhA3F Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="16095091"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="16095091"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:32:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2727584"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:32:27 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:26 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:32:25 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXXiwSWKtn0lOiDcTAXLgpPNHlBY3ueVe1t3nHNzW0pYotW3riPjE+pxvwWFIhoIrWExzEvEzFPH/uK0zsjPxskBiYPwU29ZEc615jNK5EjkldsQrU937fp13N3yig8QPu2qAbaMJP1njNp0S5qMbMTdiJGDui2ZBc4hKG1ZX5VhdxGHGuHtMZX5GPDC+0MYmwkw0dsh1IVMMYI38N32cZkjxVLRIWMRCdnugX7taAdCSs+YJ2vZBUmGLZdqvP3NESvid5VGvQ+Y9Gt3oUUkv0PrdwDb4eGmTyH5gGJJ7uwBMMyhyZB108PV+sHlWl8M/srproAh4VXBVFCZDMGzwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHuoPXpNrJalYM4skA4xzd1C+7GSqCLRDaEel0qs+40=;
 b=K+Ul47mKwRjiPnLMbpAuH/q+rZLfbX6L1vwKRxbKgjBbvEcwuMOjysg72Dh946X1ARqfXqa55TPXrt0a+aRJKIf0E55GGRROXwXie+jeS6fa92t4z/p8Es4fF8PkVLbIFR/+ixgNxJrZyf0i9XnTB/VKZhq5myCo6Pr/Rj6mV1h/uNt4+pnk+ierDhz7iyznwSfSoRmi2UofNWiaUFOclwxiEnMF1HBFHb7K+iTQJOD5eZ94/Y8u34akt4VKw3Hku/AdnDZ2xGqfgm10ljfUGqzAofwlaPjyqQyZY1Nxe8oNTtCk3LCiVuLIP1Qp2+CEX2wRNCzXsVG0aSj6vb/N7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 20:32:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:32:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 30/34] drm/xe: Remove useless mem_access on PAT dumps
Date: Fri, 26 Jan 2024 15:30:39 -0500
Message-ID: <20240126203044.1104705-31-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0023.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dabfc9f-0720-4a2c-b70e-08dc1eade673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zl2hiFYyoaj0QAona9rqTjjV94+mOQmjCiL4P28t7UL8MO6w5FB8SYYEKLzEoVdzGKQG6biTY8FzsKi0Xa//ve9iUJsZ4YkUeZFWDaEDM0nKCShkzYlfUVP4IKYnr1uXa14xGCsvC8RqmksczOayIr5ezi3297Q+Dy5RV1XbPK5jC6g5qIfsgKntCnTN+p9BmG6XnbXdCml/3CTZQGWYAhlT0DIRZ+LFL84FDyi32lXEuTphvn6Hruh3X/+H+RyD9/azY/WzFmG5wrMpLLJ3fymHWZQxm+N7GOViiVGHDBucSEqiSb1GSy33a1fK43fGRD9c2GfJfCv3hk4LJqR8iuFdIiB4ZkVP/yhEzPaFekQBLfD6ZR7E6sTPM/x32ellE/EXaa+qcIF00z7B2E9XJWqLG3AKVi0xzcWl1jV2chlBIikhWIuuViq+AGz9xjCJ4Y2eqkQKRE6ZR3NqJXsUEfk1/Kiyipe0bTGfmJGg1mdQqq8Gw0kACZqLB0hdHyGSHnbgBlcjhO857LJNGdrBL1Y/A48w2qatmHh2BN1Lyqv0YG07LJYYIlXOcFELx+gs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(41300700001)(66556008)(6512007)(2616005)(107886003)(26005)(38100700002)(8936002)(6506007)(1076003)(5660300002)(4326008)(8676002)(66946007)(44832011)(66476007)(2906002)(6486002)(478600001)(6666004)(316002)(6916009)(36756003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GuOKBKSJ650hylqjtlr/SnU9iGURwsudKbJir5YMrjyRVbYUtiMSqRT+ck3Y?=
 =?us-ascii?Q?GQes46eSAA1GspSESRH0yqxUn9bWJrdTll/wk64nRvVPZd8Jt+e656bIhAjx?=
 =?us-ascii?Q?2dZbUsRX6V7Pf5PZoMRk3oQ6FS+FxG6OyHLeFvUddbn8IrvlewtXdKe04HnE?=
 =?us-ascii?Q?v58Xc3Vp7AV/T4Q14dXGEBYQLfmKUkldxjWDAEmF98xpxZCnytN8tUW0VmfK?=
 =?us-ascii?Q?XaWePfgiN7n4ShbBWcyv45Zy2o6cgk6WEVsOrhr16JiP71ZPdDlGstDIwf1L?=
 =?us-ascii?Q?u4aIWiIykEGAEPxwWS0C626rxs4CZu5jTw5Ip0kMWCuEATMMQH5wp5rXS0yW?=
 =?us-ascii?Q?YZogIdcEDzf+mcRvtN7cnxM/e8gEG8wJB1kCn/d61PH21oZ5MkYilb7i03CM?=
 =?us-ascii?Q?8+hPTJmR8+SzBPnjoqnaDct1rSmSa2BFCAfflFHRHujKNIa5+wykYoGkJMI/?=
 =?us-ascii?Q?mwVJg1H1wtUPZMKEY//f37jHi9MkPZ0B6mGh+xKvTQqmE4r+lAaImStoE6wx?=
 =?us-ascii?Q?1HuLE/UHMlrRzZulwTgDR0J33oo2I5UvFbus/zAxvvWXlzZG+XNACOjCpEYQ?=
 =?us-ascii?Q?KQzx4w68meBLHvtNpYF9LZFeo5KTWvb5OlIldHQhR/+sPTjvQRqLjCDbjDaQ?=
 =?us-ascii?Q?fsEDs2OBS6IaBjegskORuG6+lW64KIba/jzgAfD90S0Rgs0Uoim1xUM86RhK?=
 =?us-ascii?Q?NE/yWz/HOt3Ql0/mJ4GCzEitcjxP2KjzhOIQERIqNT8h65sT5UXNJw57RMc7?=
 =?us-ascii?Q?BEMaW/giNHf8DKZz7calVi/DvYSLYfowLGt4N+150Uzu5iVW22aX/oE+Xv7z?=
 =?us-ascii?Q?XfNHW0ukFeDYnW3bLHETeXsbv0OaqmIs/j3nlEANvUW7vH2HJNVTcc/OHugn?=
 =?us-ascii?Q?AyAYNY1/KC0RcPjl/Tz8qaHEK5oJWkQv5z5iuymENyJU+5wV6LpSl5d+xuQD?=
 =?us-ascii?Q?+JNirISK7iCpsZZliiA+8xE8nBB+hXRiyi4dUUzXUwglZKG5LWR1fqlGKOzq?=
 =?us-ascii?Q?bhTNYX6znurrqm4873DvHomgeNlYQvi3Q08+FhpQ6BgWLeViXrNv7mPEtiNs?=
 =?us-ascii?Q?XhVw68fLX7Fi/Nhe8DfgURfM9o4+0YifuVzZ5NbcJdJGrznbUitdYHgkXFFO?=
 =?us-ascii?Q?ZNwoXdk/jW0Wi1a/CZZ+VRzWHZ/wkLy7DtNAktAtLfbtldpRt2j9EFWz68yn?=
 =?us-ascii?Q?VdmcjeqBpGktEia99ny/lJ1OC8CC3MbUndCq/EaiZqEYf6fMOPre+XofmhqG?=
 =?us-ascii?Q?DH81B9bGLs0DLU693wQr0b4OGGJgAUC9zCbV1+3IDw1rs/dXreiltuK6PSLt?=
 =?us-ascii?Q?muc3efxNZhS1+tH6JxUQfd6Sa/1zN5trMkVBBzB/E6MKjqQklIGMbo4D9R72?=
 =?us-ascii?Q?poxH9sUeBiSczeTOIttDfJgWLhiLQ5DnGrObGUeteAeq5iaUiAIVyf4dnSRp?=
 =?us-ascii?Q?hsMaDvlHm/ZDOsqxf9QlTDWqE0o8BTMfBMf+HF3+t1NhXwYu1aaSeezevVXK?=
 =?us-ascii?Q?rMPig/tZRHS0PBbZ/pLy3QK3GAeYhloy1ZjkHazVejIUfwpYVONPicpYWbkF?=
 =?us-ascii?Q?FAtk8jETUF2HsJdfEou+/g+FM2401E3SeDGkoc/4sr6DJVRa/Z3GtDrygUCR?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dabfc9f-0720-4a2c-b70e-08dc1eade673
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:32:22.6845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRz3KkXftZs1fjVBZgb1a6w7D6ovDyEGECX8iOb+9JE95D1OEuJGP60CGGS1NqiFrZgQBLoRRMKATrGMo+tB0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

PAT dumps are already protected by the xe_pm_runtime_{get,put}
around the debugfs call. So, these can be removed.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 1ff6bc79e7d4..b253ef863c27 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -173,7 +173,6 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i, err;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -191,7 +190,6 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 static const struct xe_pat_ops xelp_pat_ops = {
@@ -204,7 +202,6 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i, err;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -224,7 +221,6 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 static const struct xe_pat_ops xehp_pat_ops = {
@@ -237,7 +233,6 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i, err;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -255,7 +250,6 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 static const struct xe_pat_ops xehpc_pat_ops = {
@@ -268,7 +262,6 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i, err;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -291,7 +284,6 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 /*
@@ -324,7 +316,6 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 	int i, err;
 	u32 pat;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -369,7 +360,6 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 static const struct xe_pat_ops xe2_pat_ops = {
-- 
2.43.0

