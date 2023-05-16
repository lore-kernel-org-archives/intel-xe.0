Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1715C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 14:55:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C5610E261;
	Tue, 16 May 2023 14:55:06 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29FA10E261
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 14:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684248904; x=1715784904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DWwHazeY2cyNwWo1KvjNwN/1Kecrv/4f4u+H1JECOOw=;
 b=JdQHbP11L0S3LBuy8wT4EwYpvTYFaj7R2R0DMTWPIjR+qj7W5EjfRlW/
 rzLCZalojAMME/vQ9Oq+kK80QS9l97sUCgn36zKm2LeQeghNxUPZe6rAT
 oeG8J6KrcEVrc+xB6JFiqpOSvreqVZIO4B8WfCSiK4hZyx9DP/TOdSLCu
 /TOTs6QyHaCtl61/3q4Jz0OhbpCatXXGE+EwdSVxwx1MG/Ry/Ex6rL6EK
 t9Hb/pbAW1eX6rnmE0lVcg9EMCMXdZKwziodthgMSC1P6xcSwRYz4jQAT
 k409KJmaqU4/bl0VDYD1X2dAPOkoAFFuWZhyltuTfclzLEHYr4q31gBEP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="379677218"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="379677218"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="771095235"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="771095235"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 16 May 2023 07:55:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 07:55:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 07:55:03 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 07:55:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHyofB5nmGkoZ75OwqGhU5bmYcXgrnrVNiGUeFQT+UPtfX7GWfIg7gsSgflnfS29fQKoup+/iN8TqLhSFHu1U/Y6nwteBw/myiB92RxwBe2wv+tiudO4y4fe4GwkOKUshRDomyp1VhRvMMaQc3hrg2s6Lr8sGZJt1D9GGoUAvzXhOR5XAM5vn1LehrfiQtgSshs09hm3rH6lBbeNwHl10qNqieP3tMK+gCBlBErnjLxwSC5NpdSegcB4UVX4swZgln1G9niWbbh58Huf9moVVoDnrCBz++LW6oU/SWPkGT9GI31IirwgfFhkxfYmQJLU6amqt7vv4Trfxia5IYqdUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iELYqEtANX2b2j81+kbAKb3zDszZNF3XK9raEmpGcQc=;
 b=J3tiNtkdhCF5tpbJ6nCZ4OvrPgDwkWA3JIUjAm3XuKoZFr7ZbbTaspzBVETX05cHtVqHQvqFf5N8GRRw/GUh+vtluIatYTHfsOYZRQS2yGJQvE7OypYqlQEA0FbshZ71pzfaXLhaVoQIUFSX4FflkT/5LyW3/P7Mma91V1tR6S0RTIdpQgPHTJr+h5jwMh5l8bUWr47TuMulr6SRJUnEYtxQ6/mWvHvVFh599bBXw7KIbJ/0Orzj+RJTlepplXo4dwKthMd36/ANWKl+UOEwcU8qY+ZWS+gJpCGlttXMVQNBXuVlQGy2zzv88N+fvQVXN7NCHXHqpAZvXhr5mB9mJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 14:55:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 14:55:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 16 May 2023 10:54:16 -0400
Message-ID: <20230516145416.1851984-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 718acc26-a22e-47ce-6843-08db561d86c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 53KlFyqPbLyYiJSPPEpFLUexfxqDojM5FEDgU1aMya4h+I1Ja5h2RSXgbrcremXLSZHbfb+Wu6TWbBiluK0QqUIlXGPJu3kZvqjb6ks8QktlgtY8IQwUApextq67qtWVRS2Hsd+Bhx4E2Vzir0vWFgGrQLyQYovVOt5KCJmXJ98GYOllJC7hwscJb6KFELItwCKY1PYPQA68uQOj3MxUP44mRYRwovz2CYpTwrdJdEEtRxgn1VVC52/TQFX7JJOthcLyAif5Q5vgGLg7+6i8+MF37FaVIJbZLfy+d6B8sWzIUhDDgIyXdQLU9tW3FV+VSYcjAgBZSJ6/286ba/9dMuIpkJZqmTVdIUIV1Q3A6Acgq07EM40uLBTvwvF1UwIo+4I28HXubVVYGncgMN0VMDrOd2bKb9iKcAune3MqSuA1xBRWOco7TllMzxv5mwOZLASBnDhnj85N/D4cxp0P8Vhh1DGLk4t3QN4Qi0Y6Sn1xEml9aKL/RB9yXKjuSzAvzgATR35bazMnW13/Rg/HtOT/Omd+3vlX/IwgwpidYHUIo3+mvdfJiFVAC6aUdl83
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199021)(44832011)(478600001)(8676002)(86362001)(8936002)(5660300002)(36756003)(2906002)(6916009)(66556008)(4326008)(82960400001)(66476007)(66946007)(316002)(41300700001)(38100700002)(186003)(2616005)(107886003)(1076003)(26005)(6512007)(83380400001)(6506007)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sntk+sV7lm2WnK4jtABLKGPeywlk18y4z5/dS3ZWoNPXG0CVmSnJb9EYnQMx?=
 =?us-ascii?Q?W4+3zqvZCBsL/z4NIsqW0C8XMufaTC342gkUGiPOu2tjUFdwIudZs8BUXze5?=
 =?us-ascii?Q?KBcgqfueAs63mFkYowROcHD7PgfpueH4Y32AiD5/m8n8ZVnTR4M1Rsh1ybmf?=
 =?us-ascii?Q?Wm5q8a4Iglrd1vcInMMStRKfWIo1xgc7POvbba+X7FJcdFT4IvwKGMfQHTJV?=
 =?us-ascii?Q?kcQg6xd3W0upWTWhNinzME7OZ9RXPgPTvjVKEDg5obK4Ej9fDkwYkMlR++sv?=
 =?us-ascii?Q?d51XxWlB4dl/Pua8ZoAMpJBoJDLe07dvGajYnuVMlwg9cCgLUVK6cJt0GzZp?=
 =?us-ascii?Q?tfpMiT0Y1Kclrua/xOPDuAbWSwW9/id0Ckr/jEG0HzpJmM6H9QHTipln4i7A?=
 =?us-ascii?Q?oKGq+uCo4IE3p6cIXVyiESc9BxMz+SmXFkWWgsNHgnbtl8nF6cp7hdKeuCEQ?=
 =?us-ascii?Q?chVoNof4hgEBUDLTxjqW8pBsoTjejPTE2yusjICsm2OalwQt023k8UhCVxc9?=
 =?us-ascii?Q?mfwGpLRwN6UwIhHPCl4Q8AUHB8nYe6FiUdjhPaUNd82an5XTsH4b4cKHvPsN?=
 =?us-ascii?Q?zZtfXT53mFzFSdeDXojUtiNpV+tW/eblp2kGX+9Cr+x3A9biraEeEO7XYWti?=
 =?us-ascii?Q?axE4pYU3wORF3+XtXVzC7lLuu9gq0m+d9fi6Sf/EWr0EMgx8p7Xvn2QUwQw+?=
 =?us-ascii?Q?O/iRN++tzcAMJqzFZTMGaol7/Unxs47elsFMBzj132Juea+z9Ws/n9eajuSj?=
 =?us-ascii?Q?fRMh99qX9OkLoRcxH6412/WP4ZNaTRMi1195Fi30lAVABYxW1+72cgDtPhQh?=
 =?us-ascii?Q?UW7mTvSA9BsWYYHOG8UaeLmOa3vWKHCpagWQ5b0D6nMV9+G8v2wYOONrYEvr?=
 =?us-ascii?Q?7kp3MBMlx37O7hDe7P+q6WLw5yo+SVX/YMMTD1AZuapkzMujtd9TPGEeu8E3?=
 =?us-ascii?Q?/I2HwaQccJkwC2J6lKpVATgBxddI7rLQ4r07vxr/NZFnQCQ/aPeX5bXTlz1C?=
 =?us-ascii?Q?OvPSajqsZeu/OlzKp9JjCzd9JVs76FwmCSLQ0qyXdKsHaGypWqO+QkwaC2va?=
 =?us-ascii?Q?gymVS1/GU0KFpEe7UD5Zq48VjChNooHjmGzS38uckey+WYjUtWTqEE/6duvT?=
 =?us-ascii?Q?RGqSUXtGjIchzvCH3nDC3BJyVPIR/ZDzx8/rGQD/ltCBZJltGur2A+RG51ca?=
 =?us-ascii?Q?fyLE+sWvOWVoHoercjaoihFfBVCIJTDqdMItm35DOgXxP0iLPtORS3LXEt07?=
 =?us-ascii?Q?eWkLxHACCtIvJsSPtswfG9QVc9fxMlravDhJyz7nuWB7jOMYopLOUT86XykO?=
 =?us-ascii?Q?UGXQN8ovfP8QstLN+aj6GQNprphjfEzms9Ss64xahD33Kgx5WewV+ND+TO7q?=
 =?us-ascii?Q?3FjC6FG1XGdLSgGFXkORMnYXj6Cue88gQr/xcWPRJQKX+2JLq8NxqUN28seW?=
 =?us-ascii?Q?AeD40dqEkNR6sIOrmT4cCz52CwAbHdapbg6AvEuIklA8jyG05aRd3WbVyn9u?=
 =?us-ascii?Q?aJ3uIRGC8W6WEa0xYKakpQexUpgYk0hkAEMV4tEk2Due8TQKM08pHM01yepr?=
 =?us-ascii?Q?nfvhWSbi2TP7tNUAWAacr2qga7L22psuORAjJ3kI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 718acc26-a22e-47ce-6843-08db561d86c1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 14:55:02.1024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADT21gekNhjn7nZwvkOTFwSAMrE5k+1EKNnxyoMIzoU28zmEXvcOSa5dX1QnPNW2rPaeFY/nBJ5lezgMC2l2Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 11/11] drm/xe: Limit
 CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE to itself.
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

There are multiple kind of config prints and with the upcoming
devcoredump there will be another layer. Let's limit the config
to the top level functions and leave the clean-up work for the
compilers so we don't create a spider-web of configs.

No functional change. Just a preparation for the devcoredump.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0a4becdf4675..8f5eeca3e7b9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3391,7 +3391,6 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE)
 int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 {
 	struct rb_node *node;
@@ -3429,9 +3428,3 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 
 	return 0;
 }
-#else
-int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
-{
-	return 0;
-}
-#endif
-- 
2.39.2

