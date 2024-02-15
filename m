Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87707C48BC4
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 19:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A30910E68B;
	Thu, 15 Feb 2024 19:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NY1g6m8Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CC810E651
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 19:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708025720; x=1739561720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=MWobX6pkrZYlc3ZvN11D/a0FBZ/k7igF/tDz0tkOTAc=;
 b=NY1g6m8ZfiJZFkBMV5I440TKlbVeWGNGHcksmu7N2qKOvsGwJWiAvd96
 dob831WGW0jc66eN3eX1fUPkqImIsInex0rkx/4Yqq+G5rNiv+MONAm8p
 PBOa/tU6S7+siE/5pmKZ8bmwzxNZxnplsLayO3+LrouIGrskRYM/gR+fP
 CBP/6iwF2DvEw7pyKr4IUz1ig5wIE9naNzt30arsb6f6HcHb9nfP2pvMJ
 y3QUC0bX8Me7BWMS+tPC2AiFg10riWNtPNtFkhC/YWoxkbasKucAmJIgn
 aXeM7z5N1h8QYndLxLc0PDMc0efEAtteIQh6/AYKuZU8TmzxDXwkqYnDr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13539252"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="13539252"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 11:35:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8309626"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 11:35:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 11:35:19 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYRyeXytqMlY8X8VQVA7TcASb1o3MHbsU32ursdBlTdhrDeMJ9vHqRGZHjuLA3/+yygG8YOcfZMBe0H/mWvbMK5ZFEz9chpldxa7iKhB4V7/5y2oriJwfOnKyru7N40clpBAL/G6htEa/HEAPNXt0+LgwlNipGBlJq39AZ3pmKKIaVN6nxQ0SxfdtgeDP786K/g7y+73yaQbs4HbEJK8+kikHv35ZBlc7x7iXzuoFjGZQZTY+DuWrNuZtdeWSMzD23BYOou4D27UxLkeCepcIXZT4EjyYoG6trq1MKH7jp6A8VFWmEQK3McQURe5PAcibSqtnulFNf6MGvHeoaBUOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mmSlGyodM8nlo15LDZMdfEUY6TquiCsZ2iYuyYWuBY=;
 b=NNj7Ax3YEICrrdwxTkm88vn6+OR2lcdkypDedGpVVb+T/wWfFeNkFEnE6lEhrTRLnr+p9O6ZpM2gBka6MYlr7C3TzWpVPuRMmflqD43NhywPWeQ9eCPML5xpDPw7D/tdq+JHCH13qLDqMgxN9D2vu2FbGQwrq1mFqtOn0FBtf466eae0ECYovJVLPdD8xAvV/b/ruCyiRli9V7HffHOr2D6TIn0/KpPFEn0+mpE/hbSWaJ7EhtSrGPY7sraoo20l4P2WBncC3XQ7MUESH/JZsC2zNgaqJuS6Faszy5lVKmneHQmiT1ha4RSLC7e3j4Hoh6SanQpg4pnWn617oMoz1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7707.namprd11.prod.outlook.com (2603:10b6:806:322::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40; Thu, 15 Feb
 2024 19:35:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 19:35:18 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 12/14] drm/xe: Remove mem_access from suspend and resume
 functions
Date: Thu, 15 Feb 2024 14:34:28 -0500
Message-ID: <20240215193430.130106-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215193430.130106-1-rodrigo.vivi@intel.com>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0032.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::45) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 867e0964-9d9d-4951-3258-08dc2e5d3d70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rZqcIezjHqGySU52IiV9KY+2FnRCGxlC0O3J0KE3iuTwwD88WW3MvGC/bLigOiKhcmOQqzbLIX9SCJCvVcNiSb1OSKA9f61FzoCNzq0VIhoheeVaUhF/jKl5Sw/h0Ac4QMlsAyJ84IXCXtqunUVRgruyXot80yLNksIIj8XUpeFpX+H3aBomJrFZcz6UJy9UN14pdM5Cx17p2sdmOia2LRb7gzd6UzbwlHwW1jDWe+Mvn7jJYFyF0POXyhbLcoaEX7g8WGiF+pMussFWBFynwfCA3N9Rdo7jf3jZbSCrqFA6Gu8dGiCCUopuxwzNMXzyMaFRQEoViFWoiAOl/E89AiztE9rnVy+MzvoeK6IB9sIPuU5mAejj2K+EGZ2DRuJ6+wnmjmXoOPiranTqqSeC+BvOUT8/D42HkKnuo6mawCW+CTv1OMXEADYktlb/y+dxrJqPAqLYOZHhYosYknC+4aLgAqRXo6PY4ZSTGeF5tQKI0+luexGp7sslBbX0ByCTpAvSy7TNTXuO9+3CHiZY2lpqVMZ4p460/Q6x75WlXlZEZn9IscIGbmqSfwQ9+eeZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(396003)(366004)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6916009)(316002)(66556008)(66946007)(54906003)(66476007)(41300700001)(8936002)(2906002)(15650500001)(5660300002)(86362001)(44832011)(2616005)(107886003)(26005)(6666004)(6512007)(6506007)(36756003)(82960400001)(1076003)(83380400001)(8676002)(478600001)(4326008)(38100700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uzN79UGyH7ylqrVltSwd0ziOM5cS6+4sqo77yV6Xn8y096SkscKG2T1cuUh8?=
 =?us-ascii?Q?/FPEA0yZRmLq8Q6KxSXCoPvjV5FCIHSetesHJlzpe55B1VY/hjZIWTm1ab3+?=
 =?us-ascii?Q?01PLamyMJoEzrZOlGbBwLHm0oCi0cYOdiYyKi8vvxBBfgxAG4+veIiaWRl9z?=
 =?us-ascii?Q?7LUy6fRlGvdUdCTo+y7r8RJpgV8Ha7+UZh/pcmUagtel4f8R4rXpumZW7A9T?=
 =?us-ascii?Q?XEODYq7UVg5XkCn2YNTVsBIAIhgShAOeXFiNhg1wZmjlIcxHsIAPJtvd4Syz?=
 =?us-ascii?Q?XjFy3iasj6n5WD2x0jlFzA3kJSAvTNM9eyxTn35tgVO6u1jtfucfRStStyfR?=
 =?us-ascii?Q?rFY6w8WoKK0vUk/SglYFHt/qpDyPEGfp7sQUF1RxVZouc8rdOEQHQuNOxE05?=
 =?us-ascii?Q?FRXmbC9WCXLJ2nhIfPgwSYpzrBqC4E1HWheZ/MgDDv4RlkNayKXbmtqmVNAw?=
 =?us-ascii?Q?nB4kDQkMBBaQCXM4iDxGHBhAGTPmGom9WZvVXfcKfV5BHRspHu8irGahECR0?=
 =?us-ascii?Q?M+uXurC52ArOe8xqebAT/5TjU0hbAMZTWqCUjVNG+SqIccEUTMSO5gb8gvSQ?=
 =?us-ascii?Q?Of8nahjGfv3nk9lmP0veo3zQZAggVx6k2Ok+VYH990m76z7t7ktSp+iR+/Kd?=
 =?us-ascii?Q?oqOTA9H0X6lnTMQ1qKSR/pdjp0g482SNF9wlW+SfSIyRJDW5MLM0xLoZ4MVp?=
 =?us-ascii?Q?rwRVGtu548++rsUagTbrhyi5gnHYnL/bZ0rcthFuZ1r7y0G7cQJd6Z1jnRKZ?=
 =?us-ascii?Q?2L0IwOV6ty3SUbrfa0nDz74RLnd4Vq2a7NWzmJtbqS1C3I3vfR009+PU1TyV?=
 =?us-ascii?Q?ufTOVtvVeu6KWJ9LQTSgTRs3VgCI3xDyQLNe8Za2FbV+WrP6kd6nI2z81Ltl?=
 =?us-ascii?Q?L2Cow3RIgLvd7lyRb8TKdmyXjgk2TURMPzDmzhwjlMeL7XkhxJH2nVTwKn2R?=
 =?us-ascii?Q?8DUT3AizOATPjHfLByOHjAkY02e/hFWx9FCov5vIasf0IEJid2lfqJTpud1B?=
 =?us-ascii?Q?2l5ZE3Ykv8IoHxSItM2648Hc02JD5cCfwoNpdiE0Y3u3kAMIyGZerGqHcjRQ?=
 =?us-ascii?Q?vSRoLchfvBYK9C3+BaRUW02ppLWNbaeeds8Kuq/LQO2CE+w896vL+63grpmA?=
 =?us-ascii?Q?MCls+85kHF3bOP0Pq6R+GcxZJQZ+9+FRs0FPTfIJquOdxCD/6TyBKlk6EBsH?=
 =?us-ascii?Q?Hbg2Ep6VujpPnw+cwWrX5vHJK7f5cXIqlWwOuXO9OMBFK8uAJTrgq6fvlOGw?=
 =?us-ascii?Q?5mn4ZOb3XM1XdNGSYLuXvpEzA4kF0D1NGBwf4JtKLJ5Rkjln2eoB/AXgEM+u?=
 =?us-ascii?Q?4CuRjmYSljO7WTruMbyPjLS0ch+iZP0hV7XimyoHrmUf0GbkzAG3UuxpMR9R?=
 =?us-ascii?Q?JPyyTBQk8UXxA2tRCY7+2B2e0QT6Y4YFz+oPolYN/5BZMTBgY6v8zzrCAtVh?=
 =?us-ascii?Q?ISPbNO/nzHZQBxgxU79kNkY+3RFvhQr9TK1nA3fZxPMKD6pgOYRgwYIg3Mlr?=
 =?us-ascii?Q?ArUPFAW162GY+EAMB6RLqVMzZrluDbDVfKM4L0ALtIBZ/pjIndDwpgV0G5A0?=
 =?us-ascii?Q?BGeilQm82K8HBUHoGnWXQFyMyqIgMbWlYedJNh4kFioB5y+QdeSHStrzzZIC?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 867e0964-9d9d-4951-3258-08dc2e5d3d70
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 19:35:17.9586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFSZYczMKxqspLXKVn9KLqzM+jXdlyer7/HMD5ewvOEFCmmKlKwun/VlEHMVThx+JZzbB8JebUJMj+scC5BttA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7707
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

At these points, we are sure that device is awake in D0.
Likely in the middle of the transition, but awake. So,
these extra protections are useless. Let's remove it and
continue with the killing of xe_device_mem_access.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c79edfd5a34f..afc62eb26071 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -693,13 +693,11 @@ void xe_gt_reset_async(struct xe_gt *gt)
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
-	xe_device_mem_access_get(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
 	xe_uc_stop_prepare(&gt->uc);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	xe_device_mem_access_put(gt_to_xe(gt));
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
@@ -708,7 +706,6 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_gt_sanitize(gt);
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
@@ -718,7 +715,6 @@ int xe_gt_suspend(struct xe_gt *gt)
 		goto err_force_wake;
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "suspended\n");
 
 	return 0;
@@ -726,7 +722,6 @@ int xe_gt_suspend(struct xe_gt *gt)
 err_force_wake:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
-	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
 
 	return err;
@@ -736,7 +731,6 @@ int xe_gt_resume(struct xe_gt *gt)
 {
 	int err;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
@@ -746,7 +740,6 @@ int xe_gt_resume(struct xe_gt *gt)
 		goto err_force_wake;
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "resumed\n");
 
 	return 0;
@@ -754,7 +747,6 @@ int xe_gt_resume(struct xe_gt *gt)
 err_force_wake:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
-	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
 
 	return err;
-- 
2.43.0

