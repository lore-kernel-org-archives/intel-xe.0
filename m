Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D668C47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B0B10FE6B;
	Fri, 26 Jan 2024 20:32:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7BE10FE64
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301146; x=1737837146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Nn55jyAvNwXCX9KTnzRm5SNXorFehIZHmA80MUgawXE=;
 b=EECNpKf65l6NLQtNbuE/QgAW8ZiPXGtxUZafs1OhacKI5lBWcDcXYRAK
 ZE5LYRq+ap8QZqzJEpkT/z0YNCRYoDKOZzQbE+DVFJJRJu4L/ZTI7Twl1
 rffzCv55cffCARHGkyorObUAyjU3hUCCMk/82UAv0pcUPcRNl+pjLaFM+
 8kZH7ZqLF0k/u0obH+i3lNZJcLEKlFF6Ed8+WkYVp6oYgKAt8IQDaS8iQ
 CDx6wHTjGXWGG7TWiO9ufaMd3TBjhSRvkDdHyt8CYOAqF0rWWQspxPH9W
 Ccpm+e/UeZhK9Xb72ujtxDcDQpc4M4EuWKt4zLqgpbUm10QDcabgC85fZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1494649"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1494649"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:32:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="821245443"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="821245443"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:32:24 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:32:24 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrN+kPtcj0ceyBrZshudLE+smvWaaajCrBcvT2HsM6jVNo18QunIqSOtYCk03X5nkfEPgL2KJkDxGixRfJm58GoLJ+++kJcgksW+XTtcxEdB08IudgQNsCFwjni2rTtcSefXtSVZfhAV9DBEX9CwLydOQhPUYAjVLbYz+iuBVpiMDN2xRfjIkwPRKmDSgM6faZuu4hHrRR9dRoc7Vt4iRAiNl+h9nSdXKBMPJC5XA+7fyiw+QKWe0LayyKMnHjPfr2f/SsPTwAbaeI208rPFUNs1IBtRpqb0oe5inMq1A2ooMnSzjscZ2LyjkzF0thDu+gwz1Od5TP8TayHsjtaRkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhkeuTh1enB8/tJDiHOdCMo00WwnSAUFd3EG6u5tDQ4=;
 b=XQ5R2zZ76+qBLsG5cFn98X0eHUfVbipIRbnqMlxxkEOSriGEGw0NBmbrvbWdP+BtT+SNSEIYlzBf9YPt801e8s8/sRvwC418XIx+pLuvA3YluzS+OfnKfgKV/Q8m1LL5fxcWWJfc9l5b9OO8fAeJaXIBRcm0Wc5XNyvoSExpKowcZow2mTVzJO6vVOpI8AbtA4Xb4gzuF1Zc9Spb/AooWURAC4veK53l/QjJD6XcPlORNAPF/lMZBpfTAyS1VEKGmjRHDiBgp2W/806Yml/hDqxVjB6PKqU/OgfsbpMgdMHD+EYKqI6HsTRFlMl+06PBb8yN/CbDf/F7EKonXLo1qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 20:32:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:32:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 29/34] drm/xe: Convert gt_reset from mem_access to xe_pm_runtime
Date: Fri, 26 Jan 2024 15:30:38 -0500
Message-ID: <20240126203044.1104705-30-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0363.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5379e5-f4b0-4e42-268e-08dc1eade4b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A4y0HT1nflvnpEgYZeKURtj+xBlaNSikWztfWiJAUgCVILYNrOC7T2IZYNTkVmD7D1p1Yxbx8UcrKlfsuDM6Ovx0kZfgwBgXgdpDtbjwdFlhGCA5WfGDnwwj8w3ZjL2oMPyDcwhDkNfMsCwXqE5YH+rnk+iSQaI12wgo+6bOYZRx53EajNbZSD5VdFTH8DgxQZtLCzSJZT2aEHExV2+ikFsJ1y4uRZ02nS351yqgNhFSeb78SQd58Jg81w5fe5cw9wifMDpwc6+VcCCey0FtlEAzfAIB7ZW/N7q85tYh1fMs7gIXuunFlpFxQAl3SFwqmX5s3B2tMV60sQlUzENqIlJ7gkIS9DWPMbVRtU/QRS+IntZ6/BlbKBx4w1ld4MJDtzPjp0Ewh4Ogqov/wUfM7eZpU/ZiJvQpYM/xRWYtahvWKhkO16Q9tThp++aqSF71NmhALB0aZH0iB6AYyT2X81ImFkY4OYPlH7e7p7EyOuM2pOZnIPPrymvyFRUa8jjOKan/doc8EIOFrj0WJCX3qqcSNmTwDKXo0xRaCanryMpS4QLNBp9Z1PUWkj+IQdYy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(41300700001)(66556008)(6512007)(2616005)(107886003)(26005)(38100700002)(8936002)(6506007)(1076003)(5660300002)(4326008)(8676002)(66946007)(44832011)(66476007)(2906002)(6486002)(478600001)(54906003)(6666004)(316002)(6916009)(36756003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ngBwJNifRX+KTcpwUJJ9a4V9NsIHG0Q9keNhoTlsvamy6ZE+gLN73949uDTK?=
 =?us-ascii?Q?SlhoNVLQ6Sn73w9MyQI1F6a/3HVj/rCSEQ+0J2EkXaO49OgzHDUNy9cXm41w?=
 =?us-ascii?Q?bGLF/ThZFHbtrbK+reOj+bMyRncf6L/zXBn1tKHst067oAw5U7QLwrypTuN0?=
 =?us-ascii?Q?bT7AAJDj3HmfkqV9Tp9CqH55Sfc2HxcszZOS7xMHT9U+TJhTPYvHSo1/kWen?=
 =?us-ascii?Q?/7zCWhKDQiZFbm2FAisJzOVyWSHtydgOwMBH/F78IDujIHrLc/H4wpeysA6M?=
 =?us-ascii?Q?LKq/w3mDkU9A66q4kGpRKrygvISMM3YKZAsfycU5urLlib7flkwzVSwFGDx4?=
 =?us-ascii?Q?s7O8LFfdozYO2MkPvFkPPifwJIP7GJXSSXLYr8v9TIMq59AoRBc/gISf8HT1?=
 =?us-ascii?Q?zkh2HXmRvO8e6hRoWCaLsT/1SAuwEixfNuhs64z94zC9ihIB4FlUTy9vot+v?=
 =?us-ascii?Q?6ptUw8QvMA7n67/qm9IL9HTBNImTs9hHKWHw+VCKuHLgKjVy04wY7FpcEiH3?=
 =?us-ascii?Q?cQBd+KB6D8l8p/AxP91ScE+RqpfujhznHK8JaPDw9XIwZN2tD9V3/WIXZIj/?=
 =?us-ascii?Q?jYBbbl6jIigV7NmxWC63hmBmVLUC2FgRp+4b3viPyFdOdve8JKIGKxdM24pl?=
 =?us-ascii?Q?BixeUdJ9WIzx3Vds9ablwmZZFxvyrPK3jFRtVr9zN/sysyNAQmg6imML+g5k?=
 =?us-ascii?Q?Y/lubZqve+iafTfaQ/jvC/DaskIbCtEmVysNLTw8FSd5LNAHwIgNiWs7KyG3?=
 =?us-ascii?Q?iiSDC6uPnBA4TP1WrWCB4GpkYCGjW6JYlRgZOOgDZ0iCfcNMEG2i+tWFcZpy?=
 =?us-ascii?Q?qYcQSYHUDRBN/IQMS+6UwUZi1M7IRstTo8r+n5CP7djQYm7ThAN3oaj/eq+L?=
 =?us-ascii?Q?ZIwkGVmWxY1baIfTuxSeEZySvf71PQoaFRunehPykSNtxWGcV3dDKstg+kuh?=
 =?us-ascii?Q?Du9Iwu+7kvtEs6EA59w9UlwMm58XP+NHntSCSEHX1YTfhqh0nEOD6gVK/+K7?=
 =?us-ascii?Q?ffk6roF0Y6S3yxnoYaKANJVMWdIiYpRFTDZ0G+fQz5rfz583pbBTe9FurfLg?=
 =?us-ascii?Q?wjGvQO6JpdLhN/g0RS5uKkWawdhlCeHeHr/XCaxZksVUjb288E6iS2wtUAXV?=
 =?us-ascii?Q?L8C39TlpJLLrREJGo6vT//jTnCXhZmQTsuzyuk7gK5sTIBn8YWPxXOOqzjbv?=
 =?us-ascii?Q?lJQVWOrOCya4MLOw8zeacAW1KjTa1o/QQJFIh+y7bjkyQ2Bp4Py8dmXM1DgV?=
 =?us-ascii?Q?JX4YoPUDrfZSjijt1Wc8l8ZDCKvHdXIf5WGcqNBm26pe/PVI8Qw97JI+g4Di?=
 =?us-ascii?Q?OlYsyC8OZyGWsSH/Vfzzf0QZMtszlocR7ozXFb2sXbqJ3p4FdZOArHGw8F6r?=
 =?us-ascii?Q?jy8eXAEnJ0EtRp4WAoPlnh83Xr708CZWEjvigcQpMxoWknwcDXsyp+qtpDHt?=
 =?us-ascii?Q?CclydHEFoEoA6+ySCXjKbYiZsBEjIgbVX7dpaDcp3FgxTqRH5Dkkh8VOIlWQ?=
 =?us-ascii?Q?dCkLMjwr7l2ff0IEmIIpAxqGetLgSiFqTb7WF4by1gqiEC3/MYpluK/WTDFp?=
 =?us-ascii?Q?yEY0G29NCZcHxvWQ4Oqu+PlzLcrL5GaDxGTjLx7siIJIgfmlNIsV9Xg+5jZu?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5379e5-f4b0-4e42-268e-08dc1eade4b2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:32:19.6807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mLvR6S0/WEvuZ0I5L0SEj4S07cQXLDYZMBXO6wLami64cymGBQcJsbfIwiXvfOXAp+XEyfPOYAcQeJXZK+Utw==
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

We need to ensure that device is in D0 on any kind of GT reset.
We are likely already protected by outer bounds like exec,
but if exec/sched ref gets dropped on a hang, we might transition
to D3 before we are able to perform the gt_reset and recover.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 9565ab9807bb..ad4cf0a8adaf 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -43,6 +43,7 @@
 #include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_pat.h"
+#include "xe_pm.h"
 #include "xe_mocs.h"
 #include "xe_reg_sr.h"
 #include "xe_ring_ops.h"
@@ -617,9 +618,9 @@ static int gt_reset(struct xe_gt *gt)
 		goto err_fail;
 	}
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_gt_sanitize(gt);
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
@@ -643,8 +644,8 @@ static int gt_reset(struct xe_gt *gt)
 		goto err_out;
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(err);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	xe_gt_info(gt, "reset done\n");
 
@@ -654,7 +655,7 @@ static int gt_reset(struct xe_gt *gt)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
 	XE_WARN_ON(xe_uc_start(&gt->uc));
-	xe_device_mem_access_put(gt_to_xe(gt));
+	xe_pm_runtime_put(gt_to_xe(gt));
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
-- 
2.43.0

