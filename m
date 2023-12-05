Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F2DC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 21:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC50F10E639;
	Tue,  5 Dec 2023 21:37:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F8210E639
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 21:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701812226; x=1733348226;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=+KrgVKthkze26x2r4V5wBYtW2KYP/43ja4igYs0WacM=;
 b=DffPRwSax90NeF8qBTJIyPP9PgQfvbc/WQWCaMG+zNF+CmHzPJ1hcej8
 /tTsHOYSD4iJmYs3pG71M7xEQ7n3sw6JSwsg3rxfua8LQ5L5Ne7tZAiS7
 MeNkeei79ByxCj+WJtGw674XGMu0rT2g9knVxK866kYUmvNFGJdBXHMQi
 O7r/VaJweE2wHzfVOa5DEGGlsEwWMHBcmxkPrE6y8yz/JjEb/H5H8Wsb4
 PxD5lA+5Anf2UdVBo128wkEKR7+nvqCskXtK//8tSQWnTf01ssRKhJ+L2
 yytFPLdM7tYmA8Y9JA6IMIJIeZsPL4Up7+j4Q2qgjKEWWrHIHAYRGrtyV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458279165"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="458279165"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 13:37:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="720855366"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="720855366"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 13:37:05 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 13:37:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 13:37:05 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 13:37:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyAmlNGxWdItH56UNNSBtC0mcr9ymsoixXpLv0UuZFXzBmlYeE9zo5Dpawd2GXNQ6vJZA4FtKCOOz5aTo+cR2UWXIxwdH0KVKq8s+/Sm9HXYOz4P74gvAh/8DUjGzMaThw97M24iAc7AkbqXMk9Z9g3OBePKcbLz/YFJNoQWVILLA0WAQYkwtWgfMTGWye0hPYCi4UJiTa1Qq53syzdcSS+ktj1klEhrGijuHDHZDVCZppz4H3DLcI44EiqtIa34K/iaNN9rH1YSKixNiEZQy0+LVOd3C1VPiUemugolcJwf6lO/3m35xGjuJ8FWZPnM/NGuNdXfH+RQCa9g5HblvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X568K54s62Uu/yqWULE1v7LqAIaxbiBsZvmYa4yO6S0=;
 b=Uqo1dj78OBYokRrAHPvFJBrIjbVbv/xOTV7f4Kq+zzXrKuVBR+vhOLqYG+0jvl3Tn0vNa1/BDy6l0cdgXzabNQvUgkIffylG78feuXPsUKix94Nl2oiINCBZjrMhz67NmR61EalZPuycMrFG/7ykE7u/ChkFIy6u8QG5oqsZw4ENsv1xZgwaRnglgeTxYidMN32tsJirA7By1SDzdhuyXzmjntUY/wPkGGyHfNpXXB0xYgFLIex7umwGmy0UpkziikLA95eEgyu27gmYQVFgTszsCWIpa7j+NWxBJxA+IuBkSxr87vYWKqMkG7tOKjCtRePQoRF0po8OuZKkihOVag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6832.namprd11.prod.outlook.com (2603:10b6:510:22c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 21:37:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 21:37:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 16:36:55 -0500
Message-ID: <20231205213659.179813-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f16065c-d71f-4d4f-a2f5-08dbf5da51ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +tDPQtbV6PKjip9owLdsQNrOvr+0RV8eSg1fvni+MErdgkZ3Q4llCyvrhCZJ7DN7Xr0pnPQgECYNXr9padQFgznns0PMujaGEeU3fGdcvLY4a8ktKqBG92uBaHjcCvcGdibYT01I7cwdXMnCQwlkwT0j5S2WaNfRAemZu0okGSLVhQ4Ha3r5y0rpNhMJe9E43p7DiTOyz+NbzO25xcgX6QCoDcdv3hIpd0NW510TY8LScfcJMgIAFW4C7+DpMdJwWvUjCj42MFZPcUs0C12x3cNhMmG0MJd8WqggU15ZX2kWYjlDxHmRAbkCbe8T21PyVxiBjgN/dirdG69my6IFIo64w7XpnM/xeESL54typlTiUEgtTvwdQ7h285CsEC7Y7NtKecCumbTHa0i5gv+iLrze0WtNeIIKoRfP8Njs172wKSN3VCspgzJj2enCvypIyEKrf3VmiPJ7BD4+PKEyaf5JPORfES5TzcEua2SI8Bp+GGRx0fOthAM7APvizrm/jMlFIe2VyaFDucYVkCakhq0BXghDjZsUNoqW7M9THUMexpJUBY2X0ZxShAGErpUx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(136003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(6666004)(36756003)(6506007)(478600001)(6486002)(1076003)(6512007)(26005)(107886003)(2616005)(66476007)(66946007)(6916009)(66556008)(83380400001)(316002)(4326008)(8676002)(8936002)(44832011)(54906003)(5660300002)(2906002)(38100700002)(82960400001)(41300700001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wOqvx9uqYLePyX+Lmu11e7ZeUFChL1QBq4hmQ4/tnVgVYoQEZNFXkf+rqfW7?=
 =?us-ascii?Q?UUmMLQ2WBEcawAjPOgJzAiXDQtP9EzsipIWlwrmzX4ocEtLb9/D1DtaEgbYi?=
 =?us-ascii?Q?eMnnXwQLFxbTRH6y9hHny8ABRITdLbcwBygLx//cErRgWhil3bhCuTfxpDb7?=
 =?us-ascii?Q?M2+G/Sh0pAvk3FeZC0FRXXVqPY88ARML+sXM1S/tIRDEeJCtu1l5XrAMj/do?=
 =?us-ascii?Q?rISWE+e1jXaTk1BNqY9HlPw8vSZxEMswgb98xawlCybxXv9NWdi/2kdHedfw?=
 =?us-ascii?Q?Wu89WOifKcNfVfzG9qSAlEFxWCIaixtC+tBGfRdahh88dgJYIBqJ7xyn1GAZ?=
 =?us-ascii?Q?BkPCth2E5iT8Qof4bgNXMH/kZAlV3jErbfigAKDjGQ7A0YG/7xaYsOMgPIgl?=
 =?us-ascii?Q?lEkHhEEU8AZmbGcRJePHhoxplh2hK1HTdpZ8MoIDep4pNrOl2CKdjynnWP+i?=
 =?us-ascii?Q?uCSWmGZQhEow1EP7KOiN94nVywvhB6VtjYopxkV51JxYxcxIrVROkxy2D7iq?=
 =?us-ascii?Q?cd0UwbiQoLdUESS9Y8Q9cazsheenqkVlxAd3cgM5+ZDxWomhkx0k4Rg/oaif?=
 =?us-ascii?Q?9q+lzFLslKUgqDEVOSm8eNKg2SXXdXdehIeZEvpdKx1Rnaj2s1sk+saQ4Ahw?=
 =?us-ascii?Q?HbYs9kC4wDmAQzAzY3dMDqSjX4pbLpfIAu7e1QnEt54kFNRcAYh8bjCVAAC0?=
 =?us-ascii?Q?2QCjfu6LGl3PZkLSqGxBzsAozmNJKTeBSDF/7Liwi/b6HD9RQwvtT5ON2vIq?=
 =?us-ascii?Q?7IGO/INzsYu2T+a2368q1T5jxzUd//V0Ila/kHtbSMz2TySO5+UOhEbEVf4T?=
 =?us-ascii?Q?sm0rpgLq6TNStY0ot4Vufp7Kp4n4h6lNInkiPvMwnaghfh7fF+x+ypkpC+qx?=
 =?us-ascii?Q?L4AR5JhAC17iRuAZFnFSCkN+abxTpjIjkLNkHZWFmEL3JMFpzvFswGcCe/Q4?=
 =?us-ascii?Q?qqfIpaCirWf4KzVUXp9p/8uw/o0hQkiQNjc1knqmowbuNGF4/j/vHmjHrdxh?=
 =?us-ascii?Q?5woi32EwXkauEqkrpZ1aFmJO/+VDuN486RZJxkzgIK/hH09HrfW1sGLuCQhz?=
 =?us-ascii?Q?pqTGy9NPkIyQmDU11Y+X92V+pjsOLq6Pm1PLu8gkQOWWKZTcwxjJwdS/jqxR?=
 =?us-ascii?Q?Q+267i4nwywgNjtbcMkHiBils/bL5+AA/kxr+52lnVx7kDamkkeSwDkG7lP6?=
 =?us-ascii?Q?uyes1MkW1WgI3X0ULkGuJ7bPUBsQDV/j//fbMzjIrBGdohZrYnXVvaCdZ0R0?=
 =?us-ascii?Q?ENgtsfdkdY4hy+Qo8l0mCufNNJ5Jsgvjy1NFgchtjyTIChZd5zpVi/bglMS4?=
 =?us-ascii?Q?XihNTdNj5JsHxz94QZHZ1Pd/LPv1F+5LM3/14auVaCFrRcM4RLoj5tRZkk4E?=
 =?us-ascii?Q?yKh3JL59+jsv2BGME9cDADIC7GOBk74uPcRsFBx1kA0jPD5LSpW3oD+7wIpA?=
 =?us-ascii?Q?FwrfUjZ6zBrBC/h7zF/8zHgB2FdCKLWeDgSBe3VlQfFR7nxcad9L0P7zRpuN?=
 =?us-ascii?Q?sKhGLR2dM79lNhZkueK8EkfCJwmlHEH6f81KD1kMwcEFQ/rUKNTlEVcgNIgx?=
 =?us-ascii?Q?kdBNKt1I0jMWc5KEqLhl5n4taKhgFPkTNKLVHvLZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f16065c-d71f-4d4f-a2f5-08dbf5da51ad
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 21:37:02.7447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1Cw4JNVHG8FpvOMxiOJf4ZWdrzu2ThjLkcVio4lcBFTQFwZkxzJewBCU7Bc0OC7C21J1IrQPsDNjw7h/VlfeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6832
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Change the name of frequency sysfs
 attributes
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>

Switching the names of frequency sysfs attrbutes to align with
required devfreq changes. The name changes are as below;

-freq_act -> act_freq
-freq_cur -> cur_freq
-freq_rpn -> rpn_freq
-freq_rpe -> rpe_freq
-freq_rp0 -> rp0_freq
-freq_min -> min_freq
-freq_max -> max_freq

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 60 +++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d2605a684b1c..b1876fbea669 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -60,15 +60,15 @@
  * Xe's GuC PC provides a sysfs API for frequency management:
  *
  * device/gt#/freq_* *read-only* files:
- * - freq_act: The actual resolved frequency decided by PCODE.
- * - freq_cur: The current one requested by GuC PC to the Hardware.
- * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
- * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
- * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
+ * - act_freq: The actual resolved frequency decided by PCODE.
+ * - cur_freq: The current one requested by GuC PC to the Hardware.
+ * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
+ * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
+ * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
  *
  * device/gt#/freq_* *read-write* files:
- * - freq_min: GuC PC min request.
- * - freq_max: GuC PC max request.
+ * - min_freq: GuC PC min request.
+ * - max_freq: GuC PC max request.
  *             If max <= min, then freq_min becomes a fixed frequency request.
  *
  * Render-C States:
@@ -388,7 +388,7 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
 }
 
-static ssize_t freq_act_show(struct device *dev,
+static ssize_t act_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct kobject *kobj = &dev->kobj;
@@ -413,9 +413,9 @@ static ssize_t freq_act_show(struct device *dev,
 	xe_device_mem_access_put(gt_to_xe(gt));
 	return ret;
 }
-static DEVICE_ATTR_RO(freq_act);
+static DEVICE_ATTR_RO(act_freq);
 
-static ssize_t freq_cur_show(struct device *dev,
+static ssize_t cur_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct kobject *kobj = &dev->kobj;
@@ -442,18 +442,18 @@ static ssize_t freq_cur_show(struct device *dev,
 	xe_device_mem_access_put(gt_to_xe(gt));
 	return ret;
 }
-static DEVICE_ATTR_RO(freq_cur);
+static DEVICE_ATTR_RO(cur_freq);
 
-static ssize_t freq_rp0_show(struct device *dev,
+static ssize_t rp0_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 
 	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
 }
-static DEVICE_ATTR_RO(freq_rp0);
+static DEVICE_ATTR_RO(rp0_freq);
 
-static ssize_t freq_rpe_show(struct device *dev,
+static ssize_t rpe_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
@@ -465,18 +465,18 @@ static ssize_t freq_rpe_show(struct device *dev,
 	xe_device_mem_access_put(xe);
 	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
 }
-static DEVICE_ATTR_RO(freq_rpe);
+static DEVICE_ATTR_RO(rpe_freq);
 
-static ssize_t freq_rpn_show(struct device *dev,
+static ssize_t rpn_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 
 	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
 }
-static DEVICE_ATTR_RO(freq_rpn);
+static DEVICE_ATTR_RO(rpn_freq);
 
-static ssize_t freq_min_show(struct device *dev,
+static ssize_t min_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
@@ -513,7 +513,7 @@ static ssize_t freq_min_show(struct device *dev,
 	return ret;
 }
 
-static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
+static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
 			      const char *buff, size_t count)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
@@ -543,9 +543,9 @@ static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
 	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret ?: count;
 }
-static DEVICE_ATTR_RW(freq_min);
+static DEVICE_ATTR_RW(min_freq);
 
-static ssize_t freq_max_show(struct device *dev,
+static ssize_t max_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
@@ -571,7 +571,7 @@ static ssize_t freq_max_show(struct device *dev,
 	return ret;
 }
 
-static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
+static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
 			      const char *buff, size_t count)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
@@ -601,7 +601,7 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
 	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret ?: count;
 }
-static DEVICE_ATTR_RW(freq_max);
+static DEVICE_ATTR_RW(max_freq);
 
 /**
  * xe_guc_pc_c_status - get the current GT C state
@@ -667,13 +667,13 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
 }
 
 static const struct attribute *pc_attrs[] = {
-	&dev_attr_freq_act.attr,
-	&dev_attr_freq_cur.attr,
-	&dev_attr_freq_rp0.attr,
-	&dev_attr_freq_rpe.attr,
-	&dev_attr_freq_rpn.attr,
-	&dev_attr_freq_min.attr,
-	&dev_attr_freq_max.attr,
+	&dev_attr_act_freq.attr,
+	&dev_attr_cur_freq.attr,
+	&dev_attr_rp0_freq.attr,
+	&dev_attr_rpe_freq.attr,
+	&dev_attr_rpn_freq.attr,
+	&dev_attr_min_freq.attr,
+	&dev_attr_max_freq.attr,
 	NULL
 };
 
-- 
2.43.0

