Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD47C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 19:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BD410F8B0;
	Fri,  3 May 2024 19:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdF9627f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF8810F8B0
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 19:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714763028; x=1746299028;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=+O1djw0r4x/8ZMUwfdEt8dpQbgXRsq6TtMsnm4zPrQY=;
 b=hdF9627feX5a9R86uOlIbVmNQ02WMK0dYWZZkuJDFabZseVsrMpLZ3FK
 yHyRcRW5sNPK0SaS9Six/SB30e0eY4MiOWF/kHR4v7fKIPDrdTiYW0XIa
 ib73SlfOTAbL0Bjo+J6xVTIp/lnBUk1aGmW+UTbnwhkCdfDZH8m0wdFvm
 WvR9JHtkxEmK2TFHYj7q3/K833RD2oSZFYN6sbi5EigdVt905pllH4X97
 T+NxTnxWKLgEusSRP3ex2DKqalbMyJg925tWr6x2Mc3bkK6eZ8AaQQeKz
 bcS5XACoZrzW3b+EekTH45q55Kjt/YOuK3pW7Nv8+CRv1CvyFDGMgxWZf Q==;
X-CSE-ConnectionGUID: GVhGMFGOTx+d5lxeP0bkPA==
X-CSE-MsgGUID: n1YnOQI3QGSVnPTGMBkKUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21266604"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="21266604"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:03:47 -0700
X-CSE-ConnectionGUID: C9yOeOPISkyDEWgVUB1yrw==
X-CSE-MsgGUID: fBYYmctnQpiSGmqFipswpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="28119221"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 12:03:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:03:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 12:03:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 12:03:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIbh/s4hjhq+Sn2/h5K5qtLkjwCfjcE+hXIPaRDIPB1CsLEFdG3nRLL85LzbvyX86Jzktw6iLGoENnH6DFsYuAC0aij643MQ48ygvxH/dFu9tpWkZlAldKkxhyaXVE32/0N6FBTSjhCon+IpPokwT7nElYe/byhSK7adHwTXssAg/hILf7XPkUpNWBGfiJxh6y1P1Wazj1ZsST3F0ZTEJwxi00ZrnHiTyZokLeO7Y915nozYDglR2IXcGseLbxdGnaA5sDITXjv2y5slbC544mHBz9IYYpt8R7fVBKIn3CJujwNUA4kKkhwSwFglUKa7iM9lM8F8y8r92q3YX5/c5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+sGCqoiZTjrWjAukEcqMvHf4tR1McAnx2YeEhz5fto=;
 b=SfMgbs2vlBfTUJXfSopu0Eapiei7s6qsCfxFBnMSMs7oa747A8OPAJsP7dO/ajetVUCqYl3yVtLLS//56xlHKNZk2Q01mBPxxJLL5qE3yGSlYlIUXgv5cDwYnfVDTy21rvkI1BpFn2wWR0q6JhqXxRLhUSPYQ0KxrfPGpnxYulgEl3szNyTfpKr/TjLGnGk7aRMVU840hxx/YuRn2jIobi9/NpQ4RFb0yCKZeqjguF0JmOlLMVp+qtLsUBTKBDUBbQeOZ6jEzQelkydFSzMIBKUSijERY/mWFZnip3iC+ApHLcWIC5xgM3KtRx4Mz44riR4SWdcvvaEo9L5e40ElOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB8380.namprd11.prod.outlook.com (2603:10b6:208:485::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Fri, 3 May
 2024 19:03:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 19:03:36 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>
Subject: [PATCH] drm/xe: Demote CCS_MODE info to debug only
Date: Fri, 3 May 2024 15:03:31 -0400
Message-ID: <20240503190331.6690-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0002.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB8380:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f1326f0-9d24-47ae-dfa0-08dc6ba3bc09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fiSYA4BGVMOrhd7bL1mFX4iNPaqiK2mdxtZMwBCjrJNOA5xRxYtKlbnDxASR?=
 =?us-ascii?Q?SYsLngbhrS9K+TbaI35xnG+Med4zV6RKDLITnrfHtOw2nbEz9f23BoP8UKv9?=
 =?us-ascii?Q?2qB6maM9jmkVQWeQyg0k9HtHnEyVQew9UskQaa1RWN/X61XBgGbYqno+x7Lq?=
 =?us-ascii?Q?L0D/O7y+XxKbHFeC3L5xsWejQy309+20FtTDPk8bihaPmjkBAxATTGQcB1TC?=
 =?us-ascii?Q?cSvWPUJYN5KNsQj7RFAT3HKM7GYZmrhePQnENo/kITMmMXM/xxE8JDeFMp9T?=
 =?us-ascii?Q?FOmUdYtIoOQLzogOGBNEV1yljjDg8mdB/AQzhxleEkbed1e1Mm9l6hF3PyKU?=
 =?us-ascii?Q?Ufpi/Q23kXZI4cZePajo+77kilvycqV83r0w4YeZaYOoVETLftQjYIDOjRZC?=
 =?us-ascii?Q?0cIwG2zW7qlW65ya3vevXDHSB2FQFZv20w6a2mJxBqkFcHCGuw2e6Cn6Cyt8?=
 =?us-ascii?Q?JOvOgbL/d4MlOZROAFAmpZKHdMXnKGVQQu1R9uUd1Qp1ytzkKuNrG1YHc4nU?=
 =?us-ascii?Q?Z0G+E6ekzh2r+bmWh0GUptgv3WdT/ztgG16wp7HLGmCfZ2uhWeYIrnMGNbQ8?=
 =?us-ascii?Q?AtW/IEOj3zcgnZoKN/xGooGLdEds5nOahm8Cd5zqyCDfle0wKar6hSKFUK2M?=
 =?us-ascii?Q?VNqRVWFAAGOdX0oWA16rPRvEk5Wq/GQDuEwmEWHH2c4X2Qp4AKjsJFIElQYc?=
 =?us-ascii?Q?Ly/93uBEVOa6HKUPqgKABVN/mEM5X8U3NzYEzKAE/CpHK2vUJtcLfiMNN3ue?=
 =?us-ascii?Q?YKzze1vprhU4iGo9NnpRfWtLF05dFdesjvbtJztBCyCG0Wit7dYa8oIDM/zF?=
 =?us-ascii?Q?jfA1o+IJnj519ptTH4U/H/0cLrVXyzJs74B/cylX8T1Ie4fuQpRDVyPos4S8?=
 =?us-ascii?Q?9CW/ynCFY6QkbVHgMDqKeBFdT5X29omAfRp/vgPB6a2Jjx9VkWxMHaT2da7d?=
 =?us-ascii?Q?0CKUjsWY9yQAwUh/PWTftFHsTK/GO7yq7qmooCYJveNzIz3Zt8+8eNb1bHNM?=
 =?us-ascii?Q?YdAHLT99PMTOUun/7XOppRBmfR7+8Z6OIXiSqd5IGzBB7e/w3DMutKvS4AAN?=
 =?us-ascii?Q?Kz1cYmfHIOXrke4ET9EWQzh+tPlxCTX6yiBrjGxXzy4kbj+1kJ1b9V3Ep61l?=
 =?us-ascii?Q?OIVHL5iUvlshNRhlnne+X93kZW3mgmrMxxvSFWvBSKEAzuVwSd+tvA4Jmjyt?=
 =?us-ascii?Q?vqudspv8ioizGHSPpf23Q+8DAftActL++3CU9m3OEf89ltaeDrUwfO67n4K0?=
 =?us-ascii?Q?Z1REzYHLn2dBARAtixuqxpzjx0UGBayLkBHRqyya5g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m6VkWbix2NH2FWO2bnjiuKqQYxJgJnFe4oZsqwXTvjtq0QrUWdjxrjF2SXFd?=
 =?us-ascii?Q?6x8THeD6TPSF/HExz9MLznR9H/rTlTKnXPDYAi6Ks9IWm9fbYA+VSVkOY2zy?=
 =?us-ascii?Q?wG7JyL6gw0fTv5qOVcZNGkOVle4+YYQMxz7X3Cf0uO3PxX1TGzTH9jMR1dTo?=
 =?us-ascii?Q?U6c4xND8dkd8ZGlCS6kabhvr0wKf/+R3e78Xpc2PVhWv7U2JEWgPOv/exx1R?=
 =?us-ascii?Q?pQ30Yp8v/Uo+KWVTWC3J/e+hQT64ROKvGL3sPt60LUhgDd0vFF9qo9KUXj5p?=
 =?us-ascii?Q?ENZqYQcE10eMjMs6ugoYF8jbSISAO9Nnz3bf0fwXEBC7aTu80E6fKlkB7a1n?=
 =?us-ascii?Q?wGPEkvPAX6t8qi+E7cheis51N3lAkgGZ7s2bsh8xscypBN7JefIM0XelUzaH?=
 =?us-ascii?Q?/qFzDNl7jYE6YjHm+S5ZK54/vr1gyvba47AK7nY2wFwVyrLN7bA6+8+XnxKI?=
 =?us-ascii?Q?+2sgRjg1Ogsnyjf1a9fYuEKH+crR4DQAg/vUtcKqAuGVhqarmZ7ATTyTLGR9?=
 =?us-ascii?Q?3GwD+/wg/ZKOz1lr0omUnGOh5i5ymRt+FkKK5KmRU27owa0Iex1BrFUwk7Uc?=
 =?us-ascii?Q?OKt8K2Uy5Jz1VibhRBNOjfUiG0/djsp3hlGdCU+uT2fPEMpLkKb/0GYDDxB1?=
 =?us-ascii?Q?r0iZzwD2ECj7Bz/pr3Vb2N7EYC9/RxSX3P44K6IZIi2cehm6aSHzoSsN5RoN?=
 =?us-ascii?Q?XvEn7d2zCLf9nEbjMYoUoiXO9dnvvP0vW/Q2PJXnQEV+neucbHKe1SuzmrTM?=
 =?us-ascii?Q?P7vfqXK33ZOJL6I61/BqtLoxktGtDJQ8QRQF+fayr9iE5BKasYHNcA3JDTvt?=
 =?us-ascii?Q?lBr+GM6T4FBLCC95wDOo5cCalTN+V9bf87ip07MP8L/dYKuwZTHKTPQaghia?=
 =?us-ascii?Q?A2vaNrg2VQuE5ubyE0aK/ahwxkklKIPfUtiLq7VRJInFthoI8WMZI8Yag8jH?=
 =?us-ascii?Q?bL65jg9sh4vps/NzCUboHfC9rpbvq+fMjYOBQIGB94OQgIcEb8E3b68Ju6Bw?=
 =?us-ascii?Q?OiUJZGYRBHH+9Co9pT5zVC/CIt5dGH5UjhDaV0XVtcZQKhgqFmz1fwB8RziE?=
 =?us-ascii?Q?PSp8jv1+ZJ4SL0KlEyWODKFZ3jiqvl89oNVYrTcILe1BBL8d7Vq1xtG3IgCN?=
 =?us-ascii?Q?dg14QBGRZf3VjVtwb315izlOeKnmLaufuWr9vTqQMEKWFb2fPU9FJ0Wofc4Q?=
 =?us-ascii?Q?BckY1duIcu1vT+GiWyLeIJyunWfBKVRpsjGy2LDPbBwX0RwfssJSTrV/qaks?=
 =?us-ascii?Q?Q9iIaNENCI1wyzZrrPQgUr1aOS40z2EmEzG0hpVaF7AB8SOug8JfpbuBzzWE?=
 =?us-ascii?Q?ftTUyRrWU+/Cvni2ExArndAaxk8re+VyfP3XzEx3QVlmyqiVB7nvSZVKZSkS?=
 =?us-ascii?Q?GRUKS5te8arABwyR7cxCFt2N4AqUFruJhJFcIB1TIp4sEPVGmSTl4DgawJx1?=
 =?us-ascii?Q?yDeMYSkbxKtfkjRMg532rkawsCZ4KygI22ixpYqHK1CocPGiX3aiM9SFYmF1?=
 =?us-ascii?Q?1wmIFYaQqjhGh8pYs49CqV32PvsukC7Rz5Rum+emSCX++V1AEDhnvpHkiTeU?=
 =?us-ascii?Q?AjMw0c3Xyyu5nkBVi5XKuQlM7nuj/OouXW1CFd/l?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f1326f0-9d24-47ae-dfa0-08dc6ba3bc09
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 19:03:36.0687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjuUwvxJWg7bhdWD4bRSIyzLL+kz3B4ERnvCIGSEFu0WfOwZymt+DHopitjXoB8jbydtBShWEIa1l3xJnAzB4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8380
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

This information is printed in any gt_reset, which actually
occurs in any runtime resume, what can be so verbose in
production build. Let's demote it to debug only.

Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 396aeb5b9924..a34c9a24dafc 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -68,8 +68,8 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 
 	xe_mmio_write32(gt, CCS_MODE, mode);
 
-	xe_gt_info(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
-		   mode, config, num_engines, num_slices);
+	xe_gt_dbg(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
+		  mode, config, num_engines, num_slices);
 }
 
 void xe_gt_apply_ccs_mode(struct xe_gt *gt)
-- 
2.44.0

