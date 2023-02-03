Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A649AC61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865F110E0A4;
	Fri,  3 Feb 2023 20:25:26 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61C210E09C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455923; x=1706991923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Tapzse42ay6vS/0ISiTEtnTp214/agpX4sCu79bNHBs=;
 b=S8YhHn/04sox81fNT+1KXmX1GNEPnkI/GHuzzBIk84UAscVOyS7Ha4tm
 iDZQD5F/wzkKSrhO30+DD+zXOH3i5LJxFTqLD/qaoTXSnJO0a7lcx4W3B
 XlGo8vHb6lObXh9jcrgCjP7HdQEma8Iq0Uf6jFJZMwgKSHO3uyCwcY1Kk
 rArRSWIzyEe5qQEXuhXWfThhfPn3HLgTNifu9Ki85Ly8T4RKL5vtFeux1
 BgXf/ABHp4cNEhXT8DZ7deWsc6Wa6Ek5/zKXXpWQtoKZj49CZOEMbt8Sq
 8Ns/KGujnooC4TTMFUQiMwNt0OFEqo5HfApbGQSd9ooQD0GQ9Tfg3yk+A Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="326544626"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="326544626"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:25:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="643370066"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="643370066"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 03 Feb 2023 12:25:21 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:20 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:20 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:25:18 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBkgk7/dgB0+1W1REPWSXPCRYVC7spHu7lvArYVAiLA3XpJbS5lQ7qCvITTT7T1jo+EZKWq8GznCCug4W3OHxpJAnRrCpJiJfI4uBw14E1rcRT+W2UHHC96U5DbXLbiFEGr5ZvrRH79T9SKqk9JRJAPxzJ0vBke9H+GONxpNMECj2ZJamdLZUQ7GUQ9N44jaFuy1R5rYpmm8p3AFQgE9BvgVHI3IZCswtZ7j9+pX1IIpmjOidvfvgZvWCrSNIvOY9vYwdTeaxmXbOZD3WKbvrKpuv5BrN/5SsWfktTx8ujSYB41HK3hWzB4/rM/GB+Xbyj45ztLBAhEPQRb9WhKxug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjI+4RYQMdF+5kpfzLZRcApDiiq5K3RSxV4dTThqRN0=;
 b=VgvxocYerD/QNrlGhxo1GRJCxq1hmLwW5CQwUBvgD4MbpNNIRncayMQnNEz982DMfB5wWm/EnaQ/p2THLrz40771vIG3I+9eEGUgyH46rZaJXoG4n7g0DD1I1gaYyyiXjR1GXARc0BGThdR2i0U2XQtcDxiJUgbJG8xKodBqpY2WHsONnJuQggfoZF7D55jLx2+Toz1qDCkL+FsM4Yg/RIw5t7d+cFDp/lTRXkaEExsoaxvbTcpZ6XXYhpFUjHz2Fu6nt2mgVlQ5huKYekt47H+F9NSvuy3u66+8axconYbf0222hs9PvOxlqWjL/tbH30YrVt5jZLklKDHRHrKAqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Fri, 3 Feb
 2023 20:25:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:25:16 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:24:03 -0500
Message-ID: <20230203202409.577032-17-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0004.prod.exchangelabs.com (2603:10b6:a02:80::17)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 458e561b-5c38-4e6e-3917-08db0624c2c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D+SfXG8NZfq61TzQQ8y4BrFjbpPRzrESHmwaSeJa0X/4EVCYLjqRHf7ttr6AiWsy+tiY9StCHXYHmgh1evKVFH+42/O8Dyr14+eAn3LzRFTGAq1CzjLNq/6MZkhrv1MsO/SBBDt4t5R7KwYcJdBiE3ShreR9WNIcZyTmX0Qqs3b1brMNbVu0RvOHKuhxEaBuE6RBSfAh3RFRCwS3KeCIEGGm/qG/G1o85SvpOZIsKXm5vH0pYIKlb1XLkAMu68tywSrptVZn7eEmyg4e0AhTY0pXWNvQ9/2HD5FB3j+XsxSeDTOk+/E5bOD4iIZd++JuJp6fQqSbrpsjNkDUXwfD+nZVqKg2xl7eNL7tft3cX27xc3HcxNjpNiSunjMfkxwe5v5rcOy9UYW5B3EtEXl0iEyTsFfjOd+/7EbIxPVwuecxgCH17XUEU07YyRH1WsNnyvZr/R/YYYq1q4w9cUR56wUQ+tnYv0FvyPKOGzH64r74U8Zvx5D1IZ+yY1mIWHoTrCMEbzAJylmTJPNxj5Njtre6kMbJWoF5y84Si+G6BlR/oGaR1kRbh+pIiWnenlNupUIi4OoMLSjyYktoUi0sBHBeqRqbiUP3OkO0N8Hbaeq1ZafCVyLcq+G6I3gH2RXQzn1eKNKm9NlSqu6VCfQTvlB5HHVVMFJHfPL2R6yjYWPv5Nf3ON+5BZAH7ZzJNxP3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(6666004)(316002)(4326008)(36756003)(6916009)(66556008)(54906003)(8936002)(66476007)(8676002)(5660300002)(82960400001)(66946007)(38100700002)(86362001)(66899018)(107886003)(26005)(186003)(1076003)(6512007)(41300700001)(6506007)(2906002)(44832011)(478600001)(2616005)(83380400001)(6486002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q8gO72KcGpJFGgxPBdFE80FDAjq1yj3dIlqj8JrybactheX8i78Axn2k0wVx?=
 =?us-ascii?Q?sKa5NngJPYcpRqKN4OFH6ffjkSBc4PA2trSGls1i57VQy+SWc1CWFe82nzRz?=
 =?us-ascii?Q?Nl+Sd8y9qPE2Ta4HfYqUykxreGbYxklsULGWq51DOeUfPJeBieGKVTwXyDAN?=
 =?us-ascii?Q?d0MGrLgJl4ZUmIXpWiTiWS1peQDxn+CyjrZrGqmFz/F64stlBGPSUbjG7ZGh?=
 =?us-ascii?Q?7Nrjf06T7q66jjhrMu0WuCibh782/PhF2nIP/dlM0NLB/rUlS5ZoMUI0fWcD?=
 =?us-ascii?Q?/qGCPThOEhXLRA60GRc8llVzHmOSiekcbUAQMd5i6Uj67vz7/xdx4e4YTCSK?=
 =?us-ascii?Q?4IpRO+G7qztjQzn3RuzlUE320g9b00FFPikx9VSk4XhsYD5ggCDKgClhc7N9?=
 =?us-ascii?Q?n3XQTgw5hmoildW9xMqbiZ0rrAdfErve0WCkflTLsJt5DjV5N9m4b9Uhvr8t?=
 =?us-ascii?Q?0LaZDNtmp7tS/cfmn1X82MM4f72SJaWFLH5Udbk1UKfo2ReHS/1kJCIC/OSa?=
 =?us-ascii?Q?01C1tePQGjCSHNcq+y0lcPw4uflzHhFamcaGONxQoYiU54EnVKAbPVikXcnN?=
 =?us-ascii?Q?e5yGTIWZ53irvIgnJERUHeFBP9F7tWf+vt5czazuABCDXhwtFPQ+eSSrzpNS?=
 =?us-ascii?Q?L98wB0iUCE4Qv+h989WNRD6Wf1iyGzdg63/wuYn/K1J86QTD6EjnlAYr5921?=
 =?us-ascii?Q?bQ17mrdJZHG64eqSYQBMvBn1IHJWQLqlE2tjJ1OLDKn6kEVnyNEcThaiHLKL?=
 =?us-ascii?Q?2BDUBogNVBoqZBSFoj1DK1syKlFEL8Fe5zxBK22MWy6AqYBs8zUBvBJqIhWL?=
 =?us-ascii?Q?qhvlD/D/lesu/R1k1J/y36AERoI/WclBhxGOO7P/A5zt6kVbHO8VPXwJC/lm?=
 =?us-ascii?Q?33FGJ1ANztqT2LeR6MDt9k5ouFuIWxSkp2rGdM8YLzlwViYLfmeEPS26GDeq?=
 =?us-ascii?Q?5ZBuERuPiNlyR5c+aLcSJeQf4w2owADKMfmpBbnUVAla+JRpIXUCDnKVmd5x?=
 =?us-ascii?Q?ubYIBc8DeC5AseYc9DzGhXsBtSEZwrFaOmrGjnWECiKVUtwzbX2c/ECE+5fq?=
 =?us-ascii?Q?VKMLd5NR7BeV3O/wD7Od5yZ6MCk1hizTs87xw54F+ZGthqosXbeJ9nbGRMq+?=
 =?us-ascii?Q?eq1H/hgXsvNlGA0Rmdc69BwfBwXVYFYOSOMt8mb10exszeVCMW6E/qFh4rwq?=
 =?us-ascii?Q?waxuESNrvxzWoIyYiR1N3Scd3JByPRvlgr4a1lBffdm/VY09JCW3JUD40txz?=
 =?us-ascii?Q?qEpZcbIdSleFxjqbUb1Xlx15nn8ZExCZM2FxkLFyVM1ecdpabWuWux1GriQ3?=
 =?us-ascii?Q?afrmNG2h//EPymrl/7sl7D0xASICxcK4bMXK9tYZ/9jkg0v8L8EL5uaW9Elp?=
 =?us-ascii?Q?pXFXf0Nds7Eh7khzXvZ8EL5a7LGlcJo5fJs2NAAU27np5fl+mdODGURZHzkQ?=
 =?us-ascii?Q?NRrlSwpypm70ps3aGoKlkReMop7GU15cBbc2nUnJFv8p1bx09MiBELEIj4G9?=
 =?us-ascii?Q?yvNVEFKHCPp3NQ0K4nL3mL7TFDST6/aSySIpP1rbsifsyT4zuAzLsF+pqNa8?=
 =?us-ascii?Q?Gk6bWUzLH5Xw8g2fgMqkDa7Ik6CzkW7HMHXpcuk8Mkg5gjT+ppqlQjoEd5mG?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 458e561b-5c38-4e6e-3917-08db0624c2c1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:25:16.3463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Soc+/ssIsU4dwhY69W+Jp/FdceIjucZUoQfxBS7VubPyx5wfH0x9+evYWAwo4qnBWdK/4BCXJ7Iz86ujRl55TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 16/22] drm/xe: Coalesce GGTT invalidations
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
Cc: niranjana.vishwanathapura@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

No need to invalidate the GGTT on every allocation / deallocation,
rather just invalidate the GGTT on an allocation after a deallocation.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c       | 11 +++++++++--
 drivers/gpu/drm/xe/xe_ggtt_types.h |  2 ++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 20450ed8400b..81c7eb68bc46 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -264,15 +264,22 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
+	struct xe_device *xe = gt_to_xe(ggtt->gt);
 	u64 start = bo->ggtt_node.start;
 	u64 offset, pte;
 
+	lockdep_assert_held(&ggtt->lock);
+
 	for (offset = 0; offset < bo->size; offset += GEN8_PAGE_SIZE) {
 		pte = xe_ggtt_pte_encode(bo, offset);
 		xe_ggtt_set_pte(ggtt, start + offset, pte);
 	}
 
-	xe_ggtt_invalidate(ggtt->gt);
+	/* XXX: Without doing this everytime on integrated driver load fails */
+	if (ggtt->invalidate || !IS_DGFX(xe)) {
+		xe_ggtt_invalidate(ggtt->gt);
+		ggtt->invalidate = false;
+	}
 }
 
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
@@ -330,7 +337,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 	drm_mm_remove_node(node);
 	node->size = 0;
 
-	xe_ggtt_invalidate(ggtt->gt);
+	ggtt->invalidate = true;
 
 	mutex_unlock(&ggtt->lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index ea70aaef4b31..8198aa784654 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -26,6 +26,8 @@ struct xe_ggtt {
 	u64 __iomem *gsm;
 
 	struct drm_mm mm;
+
+	bool invalidate;
 };
 
 #endif
-- 
2.39.1

