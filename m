Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACE4C001B2
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EF810E8C4;
	Thu,  9 Nov 2023 14:59:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CABE10E8CC
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541943; x=1731077943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=78GFL3yPoeNTulUhSwF3SPIuzznWq7IN8BEt8IxYBLU=;
 b=TKekLBPhMrZP/R38iNoZZm5sccOiqrgUJ5UFTWOd5D8knr45u8sqyJp1
 A3k0Q6YMOwgDk1326U8ucSOYpz0Ujcxm09Yl8rgZxm8Lw3YRpEC1dXaqe
 Rg/QNJZa6z+Lem6w6+JCtsMTaSmlEXgOpxL7EOhc0xpWpQksf3qVaCy7a
 nVZ/9ZPIv20EqnhoryV5zFx//ijkg2pwK3cK0wkgHogXqcOQrBfy+oOVH
 ZYHNArsUks429dpwz1JnvTOVrUEK5QgD+VpAJHMlvqHzO6gUsVZtwNnSd
 9gpCkjfwl3n5C8rYuHXyqH4aYEXCkrFtzaB77HstwONUJQIYwrF9Ngtn/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="380389632"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="380389632"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:54:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="792560696"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="792560696"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:54:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:54:02 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mtg8iCN6ACgYSe7UANrCSbAIAEFiyLgVm7q8yWCRazsCA6BQWv5uK/TqBRVEp1bqvwJ6R9W4fzNyiiNePFH8giUuPyhJXbHjD9buxUYJzoquhEHPbZ4fAP5KhpW9kdtPNr/Z5eOw4QrVg5DeUApP4VXsu6UlXN/oJOchGRTgXlmcXdlIzkJZL86Zz5iykDZylbyq+AZO5Ip+r70utaOILcMKHbDxSCJtytJFwHIu0E3W84icemUOzTYuaisxap0RB4TCtiSv0uOzyhQjqIdpvlcqetkGYBUgjZVe5a0RUpMbrP7TGh46P8ssf0rDqHJ4AkhSIXFbzd3H9IkOZ31NdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N91ze0II6k5xUJhLVrevncviEzBc1SU21f/beVth7u4=;
 b=XISANucXJDFEMXPusfgKtzc11Ewx33gD6wo1z22hQQOEg5qPEcPnPuS87CqScY6i+GHJuMtaWPsDXAGWv7Q+969GKHb8N4ylfkJCXpYgQznxvp70/YrAboJlRiaI2L6aLLqTbwYKzfiitGBDpJLAZlU/FuE5bNdjQZD4jwX24lvXOKRnkgGruH4IcnuTypVyUL3P5l2v8wF8nDJ56Fyx0SQaqpIzgSsC0YwBRvcbpuaabufaSMVyQlzJz4eS6WoEf6KOdg52KzJxvQkf2P5Lsjc6VctrIvQJ/sbnk2QjE0K5WmrLtSn75fHeObMksFH3i58DESxkgKAg02Pi/uvPlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:53:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:53:56 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:19 -0500
Message-ID: <20231109145347.345120-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: be453842-1c7f-4074-134f-08dbe133b285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gQHxAAx369Nl7slQxi1WFjVe3Wq+V6w26aG6YyUuKW7bDSDcW0skrBnWTbTh+8k5xF4yPZ5YgiUbvYP37e5hXWUFmYKvtktGyATbKoDDx05atcG3VJm8f6Wpe1q01aJzs0P13ORQZkV5FNAo+phc0Q4uCzHfLJdNIPwdPB5SCZNT9tEnB4eXFFNWCUzLBwS1NyaGXO5jn+67y9yv6T4cn0yw/F+W8efOcsb52RoHHF6MBwhaEBAuOMwZtkrdUXPd0tVxIkSRpITlwxbT7neyE8cVAJzGR+jxwQ0dElIgba13GCIUVMdguG/36668HCTFfQza0ATvBcRkHB+axqEzXo7duNd2QJwU7kxTeTxZR3skpJvs+qow6OdkIo0IZqYuNIhaNdwPwa0ezgU9eJg8UGhhMmbFcnn/VkDqk+t9dphS32Etn0wePfB3qNW8ZDl3EKpQ9unVArcKbfAldaN2pKT/h9r3LB0t4tGeGqrLvD0EzWuDv/6BALejDlMslttnuLauO/1BFtHu7dRQflwFguB3zh6aekzHqbBjwbXJ3vvHO46CmJ+RnHWu5BTawO3C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(26005)(2906002)(82960400001)(41300700001)(8676002)(8936002)(38100700002)(478600001)(4326008)(6666004)(6486002)(44832011)(86362001)(6506007)(2616005)(66556008)(66946007)(66476007)(316002)(107886003)(6916009)(5660300002)(1076003)(6512007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h6fUbRCn35U3b4Vj3kcPVPXyB8y2c7mZj9otSawu4InN5F1IIhXHFUNACSsN?=
 =?us-ascii?Q?oMio1g951bPhYrb8ViZZAE4TUXyuIlUEFcpaf6cdkigWxkbEikdxDNpSJYC7?=
 =?us-ascii?Q?E7YJlMGnR0UFrgbKFmQzASpY2rQQs9+3Kk+Ud92Sx6aBt8W+mJlKDanexm2k?=
 =?us-ascii?Q?6mS3lmIeKgteLbYwuGdd8L1knS04byyLeOm9WJ7uEAMzC44cxGNBDNwvV++g?=
 =?us-ascii?Q?vrUdgvsEl5I01XZ2GR5bKswM01GMjDWExfR1Lp7EvTTRHwKpk8x4LrafI085?=
 =?us-ascii?Q?odhxMifryJKo6M2hbsEU7i7G9aqFEyTLB1SUVsSYJyy9EHqVD6jQTAGUy3Dl?=
 =?us-ascii?Q?ILp5jG3zUJQ6cvLEruhbT+ZiFxgnnZbhRtVh0MD9oDod1D4R9/+pcXq8fu0Z?=
 =?us-ascii?Q?nScETnUyWuT9kJGlQiYrJ9HDconHD1/lGuNpPf82WBV5/A1uK8T9tv+dNgwk?=
 =?us-ascii?Q?ojsms/LaNVFoqNzrOcvJrw9ycideKym6Dk/HnGWiybrIyP1pWYQ06ggmpg1X?=
 =?us-ascii?Q?rS+62+tR7vB0L/f1H6w+qR8+tPlEi/+xYDS0SasdqkkyIeLbRBopIcxvN212?=
 =?us-ascii?Q?aE+j3svV0cpMXuPoUbBum5CSlYZSDGq2ohxnoQ33gXCWq2jNIpOoL/985pQq?=
 =?us-ascii?Q?xmIaFhfju0gsyvwRMWioY51hNBXx4SyPau8B6X8zp64zQovM+KuS7PPZzhSm?=
 =?us-ascii?Q?GJHF0lC80UdvwSEZVZ2nPdGqbWiA7bHodpNB+ljOvsymZT+7O3kdACCGX2yi?=
 =?us-ascii?Q?GA5E+wuYS3TtXjgPOMkJOBmPXP1syLOyLetHBuVQ7IzFlEG84RGrGNyqCqob?=
 =?us-ascii?Q?Ru/Rko+VUAlJGgBoKHpytA+4G4Ot25Aotc4nFSIO+d44GlSFSeKODNF2TxZs?=
 =?us-ascii?Q?kaoBAsvUBh7KYT42ZV6cvEj7eiRFbz0zBXvRikooHuusJH9s2YKRn7sUjl+F?=
 =?us-ascii?Q?Vqa/tJOCUlnGKnrDzANRZjRAbLoKHheBXnGRpKCy2A5q89dsJa24ZZTzvcs4?=
 =?us-ascii?Q?CXo29wS2GeZhcq4zkDj+pvyxBK2ESNR0ZuWjYfcITt0ReHsforBRYZdb2JSc?=
 =?us-ascii?Q?AN50H8wFXs8bZh2MKIzuR1o3rk7pCUCOcS5ydkx2T/6paBbI1QpnQOOvKIJQ?=
 =?us-ascii?Q?TozFlnh1HCL5xrPJFazVBQO7E4k7VA8LZXXAlk90gE6J5QRmhm/h7skecl+V?=
 =?us-ascii?Q?Jx63CCh61vWC1IRrGy4vqH9w4bjBddqDYDHAnCjTGFxJghjoPNnJbhbiR8dW?=
 =?us-ascii?Q?w/QsQSwR1I2R0m0DHUYHGsz3NiuTLpXwWMvpAJKBs2ymFRdStZP2WCWiUG5o?=
 =?us-ascii?Q?sS3FPGNTJrE2St8kHdJdYzcpK6mwiCajaoXwE/7M70jLg19vryp8yHrlsJiE?=
 =?us-ascii?Q?33abVl+QcsAfu9hG3lNViR6H5tvH1y1d2DuAiNB4K39n8EFLIjKt8eXsWkht?=
 =?us-ascii?Q?SLBUB7+C8yfRHvE8JIGL1KlRIuxjnJgtHCDyg7TFNeNnCcV2r1uxhG0oTK2l?=
 =?us-ascii?Q?U+ey8RhTW/pYhM9SqaEQxubY9UacimsPHtpeqi7EZUjmXcCWCnnZsATvdXBH?=
 =?us-ascii?Q?A802lwMlm8p3QQ4FVFSmubsj5NnLHH3V29CfL3n6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be453842-1c7f-4074-134f-08dbe133b285
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:53:55.9658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EkKK3t2nNBGlecvGe5cXnsAgwv4NYlxQj3RfPibOz5hyns+rBHhcGQkpwYAkVdSJWfg3vrmSWPzYdIeCH8F/uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 01/20] Revert "drm/xe: Use
 DRM_SCHED_POLICY_SINGLE_ENTITY mode"
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

This reverts commit 6e9b5e366a19826fa9946963f63dbc696ff024e5.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c   | 2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 811b81c39002..73d4cfb54fcb 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -337,7 +337,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
 			     NULL, NULL, q->hwe->name,
-			     DRM_SCHED_POLICY_SINGLE_ENTITY,
+			     DRM_SCHED_POLICY_DEFAULT,
 			     gt_to_xe(q->gt)->drm.dev);
 	if (err)
 		goto err_free;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 870dc5c532fa..6a288bcf07f6 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1166,7 +1166,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
 			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
-			     q->name, DRM_SCHED_POLICY_SINGLE_ENTITY,
+			     q->name, DRM_SCHED_POLICY_DEFAULT,
 			     gt_to_xe(q->gt)->drm.dev);
 	if (err)
 		goto err_free;
@@ -1252,6 +1252,8 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
 	if (!msg)
 		return -ENOMEM;
 
+
+	drm_sched_entity_set_priority(q->entity, priority);
 	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
 
 	return 0;
-- 
2.41.0

