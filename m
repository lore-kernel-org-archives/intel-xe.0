Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BDCCD5BCA
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AADE10E28D;
	Tue, 19 Sep 2023 14:25:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8891F10E3C8;
 Tue, 19 Sep 2023 14:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133514; x=1726669514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xU85i5kuzJVZob+qM6qIBCu8l8+v9QbaMf3jRBDizFM=;
 b=hS1SpvhFME83p9w7Wz309HT5QBcuSdYyroSUYevI9HOtvZF1ve+NFUgS
 pjKK+1iC2vkPje4SglsK/Ufn+SIY5ADc7ysAsArCl8aozlwhzsQE21RDa
 3qSmh0+ZD7Bmj/7Dqy5XBl5ELsqQHnM64OhCol4E91ARYaSCPVYWMn180
 P11/t/rMw3HzE+B1e3WX4qao4llUcjdGnWQj9ggCiKNeXfC/ZvcIE92Q1
 tJ0cyknnDIwLZAM9fW84LRESSoGQCJhUG1kfZMsImeqSgWHeoNc2Gt8Ef
 J1CFTOfHgUMnLHSh++VZyh0ywESn/h9O5M6OlCBGgEBbGnoENwOgF6/zH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="382707534"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="382707534"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:25:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="749497845"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="749497845"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:25:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:25:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkpxyxgQpOE/B+a2aE7tbGvjYCDl6jDtKl5n4xCH720xXi14/i1LQHeuTxJnrYXi983MTzpCIcsErExnY28JHfSmXeDVoBvruZssJWzBTR/+nk0R3U8IKRPc4Q0sxMHoyVakp5LaNybaYbFYrej/hirQoAmstJNFtuGg4DONj7DCPuO2W31JhgxDcUxdrLcMfDghc/sZZsxK6klnpRJdbt1NTQEtDUxT4/iE0hehJuJWz6+RJGqeRbRrXBABNOB+UlAy6tdteWfsAiXc2QtcQuD4urhz1hjM20DB/Mgyefb0Q6afSNI1gVzpdmrC73LDk6mgZAFUocJOGMCs9gC2WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RH6bIybO7LpCcZMZsnQHoVNmu34sqMIUnPVpadAZ9TU=;
 b=fyLNPkP1lcj6BDzYaYNb64dF/rjIb2/MouHettTZ1OkHlD4HQUTfr3FwPpzx9sLEio4qQim1lqM6lhZPYZ4ylO6gHsHWOsapMFWRIKpYnNvuJ8FvDgvrR/ZzNN1RQc5qMn1z+koahqQydOioI7fCJ1th2JkLg9dZ23QGx1XlqunfOSaFr0qZKX30jKGIUloMgWF1+kx1E5uSFwjV0m+ty0vAOdlYhovXOwCo27uDWowWWfwd33NAl8n83j0BIhnUoYfUUdDaiAqYK9mwiO+iRAKMja7nksMJn3ui1Bnri3UrldahpbTj44H6SVPidnB59hnvUFWoDza6S8mXCufn3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 14:25:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:25:00 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:48 -0400
Message-ID: <20230919142000.91363-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:217::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: ea90e295-2528-4cf3-513e-08dbb91c353c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nn8HegISiULvQSWQwXQe5NGi9uOH3gCYFLCng9Cg0ToEQ/lNWPXiIuLr1No5j+mIzqrZouhkAaSBSVYnxiIutZLpfPyM6qrhQZkvvM5dydChSg9KnDg2rRV8Iy306WiHV1MQvktpsEnKQgG7B1V8rnjBE7YhsDMOJ5Q6bT3uHq+uldlIjtd1RKbzclzqrXJm756G+tuk3OqN06mnS0jo50T1INq+PRLKBbGr9hU+zvty/h+IxShmqidL19AhOasuh6xzMV4LkPufuJlbGhK6CZJ3Oj9sfkfspdG3aZejL1dnamg6id4tB73DXZo1J4BWTwnUJluI3nExVQuXB9EXmDLIaJ/MeQeIbcHmyQoEOXdJDUbryvBU7RQBPNwrI/giqzRzdF0TxJIrsddMeuBmJZCseZJWxNUPXbOluXa5/BzCk5eb2YuP89RycNnKdKD8T1ojom4Qf4Nbx/YE0jgLmXicCslr/Qy6eLADAiBIQBpljkaxtNQwPLW6Da+BTpCNvM/8OwdPsl/ynX+d77xPCOAG/9d50a0u/tzalHmtAkmiecW0mRgvUiQ7yVZLvyEQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199024)(186009)(1800799009)(478600001)(41300700001)(450100002)(83380400001)(44832011)(5660300002)(6666004)(2906002)(316002)(66946007)(54906003)(66556008)(66476007)(8676002)(4326008)(8936002)(6506007)(6486002)(6512007)(1076003)(26005)(2616005)(107886003)(36756003)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?34JEFabmFiLu5Dq/A3ZVOlOhVQm4RjXLw56KLjDq2Kp5puzQE6NX6hUGfJRt?=
 =?us-ascii?Q?EbJaY2t6opmaZa38l92DHFo1oXCqNhMDhy0xm2c8YIRxEoc/rzAhudyFfZjX?=
 =?us-ascii?Q?1Y3vYlQrwnL5Kxs1u3QE1i4OgiUjqTVgJ95T6jnlPWuM12n1XnCp3NjhJ8Z/?=
 =?us-ascii?Q?ppC1GeO1m3lRQcHSWtS6XfAC2dbqGgXEAb/ZCjWKWbFTShZIdKsZO6x8UnOJ?=
 =?us-ascii?Q?h6G3x33IzMNGYbv3YheCZFZ0z9NSKwNhCe01NH1b5nluCGeJ1upS9Bs6JvMg?=
 =?us-ascii?Q?mOR6Dpz5e32QxqS74LvQPnnkNb1byDjlNoW2uWWCDxogPB34T6qOj5rsKg7k?=
 =?us-ascii?Q?hlPc5XU/ukHvVpxh9+n6+OSGepzI+3qCBqat4gKpBl48YuMfzN6v7X5+OvNt?=
 =?us-ascii?Q?TNbwPVIJZIHWdKiKTXXA/FEQGfDf6NnlC4yOyVX/8n/ldcjJpqzPjnr2pf6g?=
 =?us-ascii?Q?E3GheHA2S7N7Yns7RmqT7jEyZuJBDUvTJl990Os2H55c2tRC7c0jfHlxHRq9?=
 =?us-ascii?Q?8d5dQ3/VhPl6gpC9iVaMKK1RZgHPMURFHr+KgbokvrcMtCrs7RbpfwtFgwZX?=
 =?us-ascii?Q?s8qLVA84/EneaZWhj5cB9t4TVAGk81FxRgQJmGJa0y5Obz80BJjA/Gzm3JDh?=
 =?us-ascii?Q?LbzIZ2j6S/Itzpn+Oac7L0ivOiV7kd+CCiE+CfTiCJ0eRmMwzryC3R3jZ3H+?=
 =?us-ascii?Q?tLNMjIn/mGQm97i6MT21o3UY9HwguIyiU8a3pYAwelnMZjnFU+56Vdv1DNgn?=
 =?us-ascii?Q?fQQqo5OYpIRROz2GuRIOJ9pE3kXl3EeNIS8exypr2+ZKI6a7UTb+IXhIO4mR?=
 =?us-ascii?Q?3CjO7VEXa5JtVkcGQb0Ss1BHOCrciiyotlIigxk8QpnNvWLihL848HtISy3X?=
 =?us-ascii?Q?vVBgb+HWd8zF1z0XE5ZvsIGDKR8zHllrCqekdp/NuaCuFrByKjIowaJWnU+k?=
 =?us-ascii?Q?euy1dOB0ymtyX3r5Z7D2DJ6jqXdNgNSFHxQRRsl6KXh5eQH4h8Lux63+SHpp?=
 =?us-ascii?Q?x79BFFHtTwrYeGfY4U7wcbJlzowEkDbl3P/EKfzuN+ohil8vwYffjZW1HYkK?=
 =?us-ascii?Q?q7/fyOqQ0wPNZSY2HwQUOj8i/u7DnXtIYI1t0UMysXOtiVarz7QKdbnUBrc5?=
 =?us-ascii?Q?nuS+VIPG+Et71VKb0pC+ZBj2KzUGW562Y91njj4IgWCK2Wz/qaToDLDyN7Fw?=
 =?us-ascii?Q?2Uq2bbczCxxRI2t/qaI1J7+RAOuek93uSpTvzoj7RdB5HL5SI1OH9eXbvCSr?=
 =?us-ascii?Q?/Et/dzr7/ntk+DZz7fKjgSkLxKRQNmIBunXNaS8ef2Hvlz811zHCGIlmr0gB?=
 =?us-ascii?Q?0XZGSoUTjMK0MoZcrhBiMhrd/jJJsLp3Op2M5pfC96N6SbTnfaFCfcpq7k7L?=
 =?us-ascii?Q?8Ts5WUUt2UdzbpvMIU8YhCdD1erk1qxg8widnaZjrBPt/e3BCKS6WL2T892q?=
 =?us-ascii?Q?beL/SZVjhJZvruKOsguiGzV03nJnT9DRsieLKnVF7q6tnkw0o0xLJG9VO9ph?=
 =?us-ascii?Q?dSKm4u74GdEn+5CRfgUV+ogBJ+i4U+pxT4ucWxLNxkqKEbdg+BMiQVFU2CtD?=
 =?us-ascii?Q?Gd1BjCmCDGAyd6+y0xzC2OOE3FAx/KJXMyLhpSQnEwvp4KHvqzfQ4R/cg/vo?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea90e295-2528-4cf3-513e-08dbb91c353c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:25:00.9268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /F+MQ5JETztKWwjscTJooJ13bTCjDpcNitzcP1VgnjLxguQmR73s7Ij+0MA3HpardPJGqHoy+pgfnFXRyGEJxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 05/16] xe_exec_balancer: Enable parallel
 submission and compute mode
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

From: Matthew Brost <matthew.brost@intel.com>

This is now supported. Test it.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_exec_balancer.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 0314b4cd2..a4a438db7 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -383,6 +383,12 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
  * @virtual-userptr-rebind:		virtual userptr rebind
  * @virtual-userptr-invalidate:		virtual userptr invalidate
  * @virtual-userptr-invalidate-race:	virtual userptr invalidate racy
+ * @parallel-basic:			parallel basic
+ * @parallel-userptr:			parallel userptr
+ * @parallel-rebind:			parallel rebind
+ * @parallel-userptr-rebind:		parallel userptr rebind
+ * @parallel-userptr-invalidate:	parallel userptr invalidate
+ * @parallel-userptr-invalidate-race:	parallel userptr invalidate racy
  */
 
 static void
@@ -460,8 +466,8 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		};
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
-			.width = 1,
-			.num_placements = num_placements,
+			.width = flags & PARALLEL ? num_placements : 1,
+			.num_placements = flags & PARALLEL ? 1 : num_placements,
 			.instances = to_user_pointer(eci),
 			.extensions = to_user_pointer(&ext),
 		};
@@ -470,6 +476,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 					&create), 0);
 		exec_queues[i] = create.exec_queue_id;
 	}
+	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	if (bo)
@@ -487,8 +494,12 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t batch_addr = addr + batch_offset;
 		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
 		uint64_t sdi_addr = addr + sdi_offset;
+		uint64_t batches[MAX_INSTANCE];
 		int e = i % n_exec_queues;
 
+		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
+			batches[j] = batch_addr;
+
 		b = 0;
 		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
 		data[i].batch[b++] = sdi_addr;
@@ -500,7 +511,8 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
 
 		exec.exec_queue_id = exec_queues[e];
-		exec.address = batch_addr;
+		exec.address = flags & PARALLEL ?
+			to_user_pointer(batches) : batch_addr;
 		xe_exec(fd, &exec);
 
 		if (flags & REBIND && i + 1 != n_execs) {
@@ -661,9 +673,6 @@ igt_main
 					test_exec(fd, gt, class, 1, 0,
 						  s->flags);
 
-		if (s->flags & PARALLEL)
-			continue;
-
 		igt_subtest_f("once-cm-%s", s->name)
 			xe_for_each_gt(fd, gt)
 				xe_for_each_hw_engine_class(class)
-- 
2.41.0

