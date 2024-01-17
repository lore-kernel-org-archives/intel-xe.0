Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63C7C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 21:13:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D18510E77B;
	Wed, 17 Jan 2024 21:13:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E095010E77B
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 21:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705525998; x=1737061998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=P2WWYtBbM6nmrlxEqd9bXZEXZEopzxOODi50QvmvdNU=;
 b=T/SdAY1FmYZ1qv8PGo0PlMEJa53nRHg6pl1Uj7Jx+shBE3BZQ2ZpPGRF
 fhsBg3EWJzHNnpdvR0xEisXPBGM9PYSKb1/RiQsWNRmq/qYCv8H333Qxx
 324tmGqBXtfJqMJdUjQ2nC9JL8UGHtjoGcLU7YmMG/MczHaIrDQW6G7EX
 Cu5urUlxogSWBM3bYFZ6eKmzw0baqVjfKucC1TxKG4Ok5zbGtgCCqYs22
 vzt8b+JqpbQUNxWtDkfg8VXfdiwXUi3/p2vSyHNDJmN8e8eQ2lMiXN4Gy
 p1us+BNSrFWUT1qdOWroQh7zMtcrBVO87gk2sEZMY1GLPiksyxF8GEFY1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="431428989"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="431428989"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 13:12:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1115784845"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="1115784845"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 13:11:59 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 13:11:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 13:11:58 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 13:11:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsS5IM6g9DicPb8Q0BlLKvh9wFzQyp3J/O3GM+n/JzZkfoFLzBBGLbKK8lwjVKenC1rXJ8NLViIKZGhAgf0OYychTT6pxt1M2VNiLYnWBw88sHFFb9Wr5FosEHogAkBUlD/gPVY93IAQ5uxn6yf14kNcL80fmzkHtDIq5ZzkduSRdD27GBtcMwcIuk+XIHKyXgTOMGsU8FjbqvXKpzX+Ez9pvpROXksLi4n8fCUuRo+Jz9Pdrx72ECEgy4V70x30lQIzNY3Hsmeq+9WJF7W3bJhuB6LMV9yyRbEJ4vumBA0k+Vj80hD6HgimheNKsfZIumcePKf59NGnIbR4jAs7mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLiJ/Ysu4n5tsTOyaXMnQLDOp/bkiAOV3l7aLdTgAkQ=;
 b=bK6hyUEpI+tKrafRQ8wB7AfW7I9IrW/KfRWyZd1a4CuxEYSC32AZZi7E7rmz5HN/GmgIj3lYx+n9MpytHVJ/lkt3c/nI66aZS2kVZ85f9Z2D1zulY4Dn9zQI4C2mDPKvcEKj46Udo+E5KYvKUbldR2nRspIlWZqLcaYu890+5VK6a7IqOrELjlHX3+OnFzfmU3bQ1EjncJP73mbrCi5wnMUEpGf+HjyX+7eEtqo/TMlOvvDFL5lAKNO1dznXKoZWQvXpM75Z9E9EfmPXWhbqujHFglTGpgKmnWRl4YKfLvIkyDYhwhUV+nlmBwnNl+86CDwbDJZ6tMfOjb3Di+qd9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7423.namprd11.prod.outlook.com (2603:10b6:510:282::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Wed, 17 Jan
 2024 21:11:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7181.031; Wed, 17 Jan 2024
 21:11:56 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe: Do not flood dmesg with guc log
Date: Wed, 17 Jan 2024 16:11:51 -0500
Message-ID: <20240117211151.346443-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117204059.345143-1-rodrigo.vivi@intel.com>
References: <20240117204059.345143-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:334::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6ec1d4-b66d-473d-31f0-08dc17a0ef6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qdFKE7R0qbrkDhnAY6KSwUhYsfWTzKMpsKhTfIgUbkIMaaOBKulbMTm1DlG5Dx1P/5AzW7miCkJxhbYnCFWX6QwesPHRsC7VSBg+QeBMhfa0mVuC+qwhamFzw0ZHwDGrH09ntOuvwrHXpgvaxoJDrMOCnGDLzXFZ9WmiS2VKqll5aQe4QRaY3UydKA+dxZLtDUMK1uR6onoNSpbkN8Y4hZ+Nu877Ba+0Q1JgrueKz2LGbHJMmnNIA6xzg4FR1DPOev0FIqJ3o44b4fNj32+zDu554lTSNXOFJ+Ro7oLmQaIjVv+RtyLnBC3KPpssI44Gwb5D0Ofc46SJ8IbCESlYIh2gPkz7EhCDXGIbgcacWoaDCfjIPgXe04iz5F5BjeMcO/KshdN/sGbG5tk4vTqW9hLj8Gbb3HD7k6JerOPDVs3n3t8NrHAODwIXBxxjJP/j3p5mI+khJ7i/kOSFnLR5NYA6iTDJ5Xv4qhZElCL8H/Q7DkSJ+byM1XFjnnoY2VRWlPvxu8s8WKB6rSnNzXKcEHlfy9goV6pG/Ro04Q1Kmx36Ntray+DPbQL0tonC614x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(346002)(136003)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(86362001)(38100700002)(36756003)(26005)(2616005)(1076003)(82960400001)(107886003)(83380400001)(6512007)(8936002)(316002)(6506007)(6666004)(2906002)(6916009)(66946007)(66556008)(66476007)(6486002)(4744005)(8676002)(44832011)(5660300002)(4326008)(478600001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/qde8TUmVYVFdOS38pRREZNEp14mJcoSNfAUIFHrNFyuw7tMjtjam2asiN/L?=
 =?us-ascii?Q?908W2nclT46aQYg2fvhanyx0Dp7DX8m4YwTSuvy03jre9Pis/6nE6S4yPhWr?=
 =?us-ascii?Q?0MXpZ1wpr7Fb8IH/mwF9/hGKNhcC20vmvTcuYQKx4ijja2VwNnj0BvaHr4vW?=
 =?us-ascii?Q?3BtH7mWkT66C1j/Hk4kWBSQOj4J+wlXQRujIhmMQ1YFNUSmYcczRMIN1olT2?=
 =?us-ascii?Q?JS7bqVIUbFXE1OSYcPBn+Z8McQ4E+93vosHtmN3UYLhWiQULPa88SGIkCwj0?=
 =?us-ascii?Q?XCQ4k94FViktMPDrZuWfkfAvjJR+pLfF0AzKfdhAZ+hXDoB882CmIAAqYVKO?=
 =?us-ascii?Q?AA6BPkO9XhAk3mHNOfLDJewGkPoArL2ygj2eQHbIgU9WlUX8EdWezC1IYWHS?=
 =?us-ascii?Q?Yjgako8i754byL/iSMbg0SuniiHtl9jXpi6W1NmNX0lvWGpOjqzB5e2BZIBU?=
 =?us-ascii?Q?CR0CmWhvPqpQaOXFrp3vx+l6+GRDdLfs3hxVImzBox1wqRxIFUlBsnCBZf8X?=
 =?us-ascii?Q?0oBViYvbigA/n59OTQ1zDv57zZB0IHdwqWaCcmzcGqmd4hg7fQFgviF5Awet?=
 =?us-ascii?Q?BYo0mH6FaCGe6itjSBmC83UMfqFTMM8jQhTxjkCpN8OXxL9NXJvFb2mGPKNI?=
 =?us-ascii?Q?0iC+3YGUZ1Nh6ZjFAMRXC+i88VRdBxhWAMYjMxy5+J2ma6kmOtRzprkoDS/E?=
 =?us-ascii?Q?lp0jbR9o7tuM64sTbgqgQZ8jWI/WS+2XBtfFOk64LKPmrwNnAWW+WdHtx5E4?=
 =?us-ascii?Q?J/EGKoawvNTCvEkBv1eL3mN8OwdyVMZmleBf9F6OZxIl5+Q0NgGoQVF+jiWs?=
 =?us-ascii?Q?gJun1zB4fUEDU/B/vk0bsms2E7D5tOKK2EOG6Lqy4ZyzIYEJAfCyzypkwLeV?=
 =?us-ascii?Q?VpmZhiWePD5BkfYd9BIzu8iq2uouVn+tJIA+4UTkCO1taynLPPY5TbmFfmQZ?=
 =?us-ascii?Q?w4SJDZiUsOC5MpaFTBySNh/myBGjO2+dBjpD+w4A8V0yhIxkj+O0+roRD8N5?=
 =?us-ascii?Q?qJMO/PiGje+KJ6jfr0+6NCG6q57ezFjN+wkKwKHUoeNtibTvfgp5TXe6h1nm?=
 =?us-ascii?Q?NCgCohxRB0kizOqaZEoEHEhlkOltQc6VLKzLxnuHS5bRVkweYGqwJCnYkpKF?=
 =?us-ascii?Q?Q/zPLcvln0u41lyUHuQbAP+TDmpAytS9tjdQ5ho7zgHoDn4vOLt/3nnW+Fqn?=
 =?us-ascii?Q?R2tBekbG+46wfJhhH/8h/S5CkQwVD2cJyH23cUAB71LsATPEhY5NPACSMZW7?=
 =?us-ascii?Q?f2Tacjd60NbPOpJHzofkFQXkW63DKCab84kiQC/5yzWUNkVYYMphIXNTrchG?=
 =?us-ascii?Q?QO/xm9ztF24hUhMHY9Vq+DoOHRPCQO/qW/tYIFv9wONvQWXzxu3T/G523dgO?=
 =?us-ascii?Q?YS6PNECBAHBc3Mu+ofzEIYpVy/XWw+KDpzezJRdj2+kf+Li/mdJRNaRyl5oY?=
 =?us-ascii?Q?KCZITm26ekl96mZcRqTXRIZ0Zh/KEF9zX9FI2MwYiqyxUj9VTkVU+TJkS0m/?=
 =?us-ascii?Q?iKorav86OK7VRpnNdKsB7QWt404/FQnZthedDma8GiYPzxGnr33G+WOExoLh?=
 =?us-ascii?Q?PpqvJgq0faLUZdTqsi4cnZJW67/oNm7jdplEbbKF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6ec1d4-b66d-473d-31f0-08dc17a0ef6f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 21:11:56.0137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVXw+S4T9vWDi3zIsM8iqnVjIqGvfKB61LZ7MQrAb3mBSoqgsft4qJcGhjEk/tEsP0kGiVThq9j/a6vI6k3eWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7423
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

This information is already present at
/sys/kernel/debug/dri/0/gt0/uc/guc_log if needed.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 235d27b17ff99..8c473e29d9b83 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -443,7 +443,6 @@ static int guc_wait_ucode(struct xe_guc *guc)
 
 	if (ret) {
 		struct drm_device *drm = &xe->drm;
-		struct drm_printer p = drm_info_printer(drm->dev);
 
 		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
 		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
@@ -466,7 +465,6 @@ static int guc_wait_ucode(struct xe_guc *guc)
 			ret = -ENXIO;
 		}
 
-		xe_guc_log_print(&guc->log, &p);
 	} else {
 		drm_dbg(&xe->drm, "GuC successfully loaded");
 	}
-- 
2.43.0

