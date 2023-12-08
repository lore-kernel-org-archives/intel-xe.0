Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A015C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 05:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6001A10E9CD;
	Fri,  8 Dec 2023 05:12:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7321510E9CD
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 05:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702012323; x=1733548323;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=+KrgVKthkze26x2r4V5wBYtW2KYP/43ja4igYs0WacM=;
 b=TH+K8OynwCyjtCvCQeYbqnc1V6viyLNe3u1GdXRtbjp+XuOWRoRkY+8H
 2FDPgzNcAShjhsTN6upFresB8Tvrj7zlwq9/ksQTXCo591QE9nD3VK7jn
 NPTkpG+62TZI6ym+tq1DHU/crZ6g8Tq/Aq17fnUhZD3a3UPnlkE0T8HKm
 Lefi9miG2vFD5XCrNaTfBN0mTd6kKp+xDfeYY7LRXiuDHWtzM/zHoN80e
 yvhAg2YkpQxYBd8XjOMOjh4NTKznW2gk7A2ron4OM96kgH7QvgnKQpo0h
 KJ5BXO8nT5MEbxQBWXfha8DeOb8a9zflf31pUi5170DoIk909h4W2UW9h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1238579"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="1238579"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 21:12:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895401622"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="895401622"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 21:12:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:12:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 21:12:02 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 21:12:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETdi8x52KJLSq3ADgADja7aPg0cem1wmchgiFkL8s2tWMmAIPEOgQuDKL2gx8ZLhHxgUM/yumwZJBgkppQKaS3I3yOcUzF9DFOfczpuaw6Y2m6a53q3hOQPB0wie/wOEw5hlBOcHsMRvBD1UUWkxa5MOPWLbcZAq510JUhbAp1amOK9C9GfvVEhn6XPJGBO3UqNFepydIFEXDymTy9/zH26IqD9SBxmjF8LOJhJXgHKpQzPADuYxgDU2Aoutiwzk2D/0P4tl7sZt7fE1Wxnc5cP/LPOFVi6eck7vw4UH4KGQrcqRtyJhqkcEPf50QWS5wa9tfyC036usRS71ZqDbTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X568K54s62Uu/yqWULE1v7LqAIaxbiBsZvmYa4yO6S0=;
 b=N4E4sb9crgB3QOHmuhwOIStxwFCJ/LBbgmvLKDjcJTYnrG8uwuwT1a5uO4EqUKNc0yDlIFC6m04+Va5EbKbDTy8EEHk4DgYA2g6ryvFYxPf/9wxBh5wEx9oJhBZJ1vidOXNe5NgaX38hdcwjnyRO9YOZ/bhQ42Mhfu1cT5PSE5Ee0X9ylg0MUiWPaBwiO+hv1g2dNMIU5SRCNksEORqj/6mjmy7yTqVxwTFKLOf9dR0c1FafSP8f73afcH/OKOn6KjLrP7FIdzA/iHJ7UwgcVouQn+EWN39r8Fb+iLEAQGYfllwtgJgMMiKAVnmaTvV3bedvTrP1FjXd7/zj/kef3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6957.namprd11.prod.outlook.com (2603:10b6:303:22a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Fri, 8 Dec
 2023 05:11:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 05:11:59 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/xe: Change the name of frequency sysfs attributes
Date: Fri, 8 Dec 2023 00:11:50 -0500
Message-ID: <20231208051153.664055-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:254::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 615eb677-a2da-46ba-3f91-08dbf7ac34b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kXENMxWZQmpLndQbd50YE1beyCsblL0o92tRuE0TOFvkavaNocGpPCb0NGxPVIqfmwTcaSt+0AmNaWvguJrpIq3z2nZkoo1XJX4a6Ueet1kgKPDdXYgfGEeiTSDJvIUzOlNv38CRMgBwjdJpHLrwgUWkd42z9ORqef4SP4+ZBKeaTKq1pCmRtB+haQv1C6Txe+A8ei+XjtsOHa+0I5PIwZAiuvWp2KqRbPepNtXP/cXR9aw4jco6+buXTKeFqzm9ecXoD3w78Q4tIW9MzymBgfKCZ9VPtngCEJlSyCVmGYVqDN1ZZ33CzU5wzznjRTJn1/xdM7kTd3AaQNhotE3ZTMQXOITIzkzU2LS8q0fjwoldibs3YEbskoB9u6sl9uGQulT7sRGasZlGpefV8+b5Xba1h0Nj2491Vv9o2Ov932/tQtEEkIowECBtknTAasuTmIgUAFIcumHpVVb0SzKRYIeioISlMgtJ9c56QYI31OmabiFoZeS9zCNgIyIPZrUVjiUI5/3rH1EstshWp68JQXt7eahJ49z1oWyfCdub56TxQqxXNQNrdM1zOLOrFOwI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(136003)(396003)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(86362001)(36756003)(82960400001)(2906002)(5660300002)(6666004)(6506007)(478600001)(1076003)(26005)(107886003)(6486002)(54906003)(66946007)(316002)(66556008)(6916009)(83380400001)(8676002)(8936002)(4326008)(66476007)(44832011)(6512007)(2616005)(41300700001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tReFcBvwWrGAmwnsiA2u3HEGD3PcaZBfuLbJbLMUBS+eFvfQdjIpl9HT064N?=
 =?us-ascii?Q?UrHVeNFQr994yVV75MgI7sWgE9WuIpjUy2BjK6f6znN9wHJfzyCYsL9p6Wv2?=
 =?us-ascii?Q?52CctYuyUXH0JDD/T9woI0ONj3BIwRERCk/lmXV9Wwojl6aWrBDP8EN4MJdy?=
 =?us-ascii?Q?/mmZTEFwcuDzEYtCG6b7cMn7k5EkSqREubLI6gkCYt6xhEkd78vrmDLljO09?=
 =?us-ascii?Q?RqHqztHeL24BP/SJNQ6QRYVyhcRZvy2rHi3F6+81mB6OdJzWJ7pARiskwlrc?=
 =?us-ascii?Q?LjxcyuOiHyOGVG0QfT6DNwgtJDBRJ5UBtlRq65RpTVQKgd4VrXo404WJtCLC?=
 =?us-ascii?Q?ehaFBsR1K/G2nhgb58xb9Qz14oVJh1rhWVy1rsUDxZAXp6mnJi0Jn86ta4Tq?=
 =?us-ascii?Q?cdsrZHDNknXduua7Ym0ps9Vbv1YH55ah9WJMfbWVzXFOiEEWbiPbfU/sOUGV?=
 =?us-ascii?Q?X0O+yfhSgFhAMBNsHWqFRWLC7qi0+T2qx8WM8YANiiRuJp/3a8DppJ3gGT2E?=
 =?us-ascii?Q?TWmrKpmWDkKUbqmG6hgrh+FjyztH8aA79Rn0HDDuJtnaO/Dond9hHPzvizQz?=
 =?us-ascii?Q?6qeJH7kHTMzdtVvfhfEDYdUKiJH1f9PO6o54t/cnfYIHWHzHjBG3LJWrLVkX?=
 =?us-ascii?Q?nrL6aSX1HxMSYnjuULtesLmQmBzupX6IZk1QZYdhPFt7hvTLrjHfhdvH4j4g?=
 =?us-ascii?Q?cBNmMuDjHDIgBEykOUwJ1CVa1NqqpM7Zq+Tnk2b5Yl0CwgKjxTx1K8FjOjRs?=
 =?us-ascii?Q?P+clZ3jAJIOZySzrwvuxnxaqOxMk+i8n6FlOvj2dTutUiaovvVXpqQyXubzN?=
 =?us-ascii?Q?tAYy0YYXo9GNK1c5W5oYTpjSp6z9gzqIEI5Al40CFDVgi5DSSQk7QLOFb6Wi?=
 =?us-ascii?Q?jxhCJvNb/6J9uaNtMt3a15NaJCxG7KXMBljD4xrCYzQq44jmNjRVN12xiy7o?=
 =?us-ascii?Q?Qb9dlAd3nb4DHMxEtWlFJt7g1TPGmGFnL+4n+9jzjEI5O1m2YQ/zGQFjIsrd?=
 =?us-ascii?Q?Q3YAmc5qra6lM4x6MJhZYGUZ5hCGh/6TfUlTtd7FmoiDEvHg8c5IG8SnS1dq?=
 =?us-ascii?Q?fp3orJnEEgia4+uD+ZkLRx0dM1c8SUagQuOcbzjZWHw9LdDdjxQbvUnkq754?=
 =?us-ascii?Q?CZ/FI05JrjMNGYdjGQZcGYztLczkMIJqgAUQpXnrqaxHji2QTbMZ19gNXSgG?=
 =?us-ascii?Q?PljdzUV3ZFWRbBje5flGiPhM9/PcwFgSosNiqoTwf07oYSJzMz3jVRT4+aIe?=
 =?us-ascii?Q?bjWxTukivLRyHR0vntIsoaCvGuc0JIL/W1LgDQcrOGNrAS1KFbUPUoRzeERZ?=
 =?us-ascii?Q?RgZf9ocHy+htB3tuyFmL7/J1wCxBDa/MEAPa5dEefsEzdWKN4VkfYg5PCd9j?=
 =?us-ascii?Q?ZiCwGlb00h3jVlAAsD+vgqP4dXQBz/Ie9t+Szvl4XjWmkWxG4XzzOq9HmRb/?=
 =?us-ascii?Q?E95znHXIXoLuGilTPIFoSYFi+iWZKmau/dNYq8MK3nLtdOphwLVk5SSS+Pfm?=
 =?us-ascii?Q?fw0rZiHWpMa5anfDHG6sypGxB1pjn8/nVeYhUR0+WPgVCNqsi3SiXY7StsO8?=
 =?us-ascii?Q?Pm960x0eMXESSefuoagY4H/ciqr3sbk8kqqn98U0n1RZ98FmNJfsy7m6KyIL?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 615eb677-a2da-46ba-3f91-08dbf7ac34b7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 05:11:59.5864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2iz0Ff9slfIXgHz+n9/G6MXoE2LBz27vBh11Vj9SjtBCTaS6wGo8LUj3bxvfqunvKnpDmWAPR/SYkVxdZAApw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6957
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

