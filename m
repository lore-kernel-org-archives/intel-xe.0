Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA47C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 13:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B668810E021;
	Fri, 19 May 2023 13:18:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49D010E0FA
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 13:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684502326; x=1716038326;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=pJlWUl16gKLR+2zyd6YbUJOmWoZfNxU6CBFZywrlQLY=;
 b=HZngoDIQOiWUI9XJ1uQ85AxMFt3zP6h+vmWEIYY2XnbR6cJ35pxa9hGP
 QePVDtkdVcbc3RK5A3ZFDLzHCo1RvVLmX5mkIOz8OHGW79P4v+pldg10P
 Jk2KtLFDC0jQNrztvmlJYUXtsxEl6J42HDQhBfQV4/iUe9CgBtkcxJQh4
 DMWa1wVqN5jhgHsPABY6r5oEnXlHRbMoZzwlpfkvwc2jtkG8oLOD6t1Jz
 n4yaBWRHlwXNB7WNMj+7baVmUI4aqPTPUoBd1PYIwmbgAN/w3Gphzmfnp
 IF5uw6WmwmMPfyqLwrytGzAljBpx516KA9mTShG/6jZNgVrZFf691N0ph w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="349881775"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="349881775"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 06:18:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="767612781"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="767612781"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 19 May 2023 06:18:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 06:18:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 06:18:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 06:18:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gg/6bDe+HW6iMC4q9sDp48NvBAbDT+z4A+6KvBbGwGujo+MT2bxum9LdTtDs856PLoMD6PAA5QjrC5rAvDGMni7gbQ9T1J75Da1OASTZZOLhv/pdnE/8maOBFIrm9+b09dhuU92gY/iINvgML+fnWZJZiWmZKxqTHeAuqhprR2sG5uWC8feMnNeDCNioojOER4Px/BxMxeeZOMYUcEUcU7azbuk/0+Y4j18X+KJqxskZthUFdac0T/AHjHpP6kmyvGu5zy0FIPSRrUgfe00aliQGwOusk8XWhECDDE7mfKFGzBCAxl4Z0Zv7DXBpc9ObDxFAqeGYZvJ76vPPscuZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSWLJbd9WqAlL15HhQj1YtqPqwHXYv2QB34ZYCSDyO4=;
 b=j4M/AfVN48sV4IvsyRQojzDHyof6Z4z0rBJAxRIJIbOuudX32o9IoEWYXKjZZwHAJUtIwEwnNWmU0IRpU5ivWxDagIEP6btnOj+HBeTxc/SdjRVsXR8H1ow8acOn8g3YKDHmxT0PqPPwSvKZNnjwq4aDiLctJM4HL904+FMI81sQByvWEjnp9jSxqD6ygvuK45wi+gGZpg3KJIhv7V3joN/ESzmYSpg4xupdLuohNK5UO73vKBPFj5InGAV3V2r5Xiwr84JgZg16cqWhmfGIsLN2v1De+vnr9BEyjuD4zU6x8WAK2llecPzryrLaa9gpnO/Fo8zOsvzK/mUNeBODVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5644.namprd11.prod.outlook.com (2603:10b6:510:ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 13:18:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 13:18:43 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 19 May 2023 09:18:15 -0400
Message-ID: <20230519131820.2020660-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
References: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0090.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: 0307eb1e-27c3-4870-c661-08db586b917d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JaOX6XMC0O44RtSS0ZqdgKIzghYY9qajpnl9bEaHmr9j9gg+ri3MrlqLMxqueSt5pVkCwSPRKS7iEyrV6mavok9nS2X0b7QkW1H+2yfGlJx1nv+qzFmYl/HOkkKRl8aQBH7EfgWggEaSGCe+TWF6e1WRg6PhYm5FMwYiFNDc8CFELlzwgFhRtEj6L88av/Mq0Lt/A3mRuuS68ky+m5IjzitIVXrP2OwVwiOWsOQbsN5WPIsmiofIoPz3GeUkywihE4kzo7JqQfCy304vW1DIKK9+kYKcU+b6nRTSAIQUSc1pOYC15c1yoXqhkJIveSuRsbtwFuc+b7RLBEFj1B/hVZCVie3lTeFzcbLf336G5Vz5XEwn3d2EJ+9u5TjUeIX9GXERdZXDfqZk87M3G+t8ECChfhtxCocu0WvpM2WBG7b3yT/ufve3ZZVvuyuVRP8zNGPilBd4Xdj7VBD6FvHl0cUFUAaO67YoVwg+FFXi4m9BG8f12P+z+bBTvY+0s40da3zTERsUCgmyDfCp5Ppi2Y2iDLA2OC6+lHFHG2S/hyNFjwUcThAn4ZTBndQw/A1k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199021)(5660300002)(478600001)(66476007)(66946007)(66556008)(2906002)(8676002)(8936002)(316002)(6486002)(6916009)(41300700001)(6666004)(44832011)(6512007)(6506007)(26005)(1076003)(186003)(82960400001)(2616005)(36756003)(83380400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mko2b0U3cVVTeFNMZU4xTzRmUE5jSEloZmtOREhFTUJjdUZOYlMrOEpqWElF?=
 =?utf-8?B?L0lIUjBCQWtZRlpDV2VzdGNEQ0tyY2tWZVdOcEJFaG5MZmVBSXNaaGcrcUNU?=
 =?utf-8?B?SDRGaUJESzRlaG9Kd1AvQlJRbC9UTG9jT24va0JlbGpNZ0lCNS81RVIzbGc2?=
 =?utf-8?B?YTJHNHFnMGRENzBXYWp0TW0wN1JWVFdYTVFrRTF4Y3lYbzhuekRtaWxhTzJU?=
 =?utf-8?B?cWs1aEtZc0o4blVwem1mZFZUNmhWUDJEM3huSXR5cnM5SHpDZkY0VG1XWWtG?=
 =?utf-8?B?ZCtQVWEzYmcvZmVlalU5eC9XaVpQRnV6OG9aeVI2TzVKaEJHRFFZZEE5TUxv?=
 =?utf-8?B?ZTVKNk52MGJ3aTlHS0JlVlFITjVsLy92UmxkWEFyZ0lSUVpjcG1BOGpsZWhH?=
 =?utf-8?B?cVZVYzRKZDdySENhRWhLV0t4M1VJSVptNVEzWU1SM1dqRlBVWlg4cVlDejlZ?=
 =?utf-8?B?M1J5dkJqcGsvRFRpVU5hbnArQUZxZGRGd2szMjVZZVN4aTFDK29yczJodkx2?=
 =?utf-8?B?dm9FTmRJUkh4UzE0Nk1FM3NUUmZkRlVoczQyOCtadmpoRm9rMkZhWDRyMTVn?=
 =?utf-8?B?SEJpaG81N25UeTcwS3ptdnJ2dk4wNitJMVpnajNhREtQMXlMYzJRRExhV0hU?=
 =?utf-8?B?SEM1aHVwcDVlS1NuVGVQNkdaZnJlaUVqa0lYOHNqQVR6bGM0b0I3Zm9OQ1Q4?=
 =?utf-8?B?cGo0REZIenlQdFkyRGJVczJ2d09IazdkOGM4akx1UFZOWWFIVjM2Q1h3L28y?=
 =?utf-8?B?Y256Ym9WazlnMUZObUszdnpYaVBuZzNMS2R2N00wSXVKQUNOUGFsdGNPaDhj?=
 =?utf-8?B?ZGt6N2J3Q0pwSjlHcmQ2WHA0b1BseCt2S2dIUzJtMVhza1VyaldXb2t2TlU0?=
 =?utf-8?B?UVBTcjhwTitOTG4zcTlKZ0tTUGx6NERLeE9kd1B2czZoeDZodVdpQzBwaEI0?=
 =?utf-8?B?SjZoa1VIV3RIWWhHM0pCRExIbDI5MVMvK0MzOEFZV0R3b1QzMW9MRFVDTzBS?=
 =?utf-8?B?YVo2MDZIZE50TTh4TjdQUzJjd2RIM0tiZHVqSkxUR1hQRFkwL21qOE5Oa3J3?=
 =?utf-8?B?WUNpVCs1Ui93RGNsUVZVZFVVYXpKZzRlRWRZeUZnamM1UGd4TTg0SVJLdFFO?=
 =?utf-8?B?eFBHNVozNTlZMHM0VmM5T281WnVuTW80bU5aRjZOVXgyZGdIOXVJcUFSRmwx?=
 =?utf-8?B?WUVrRXQ1T1BmOUwyS01ReU1mazh5aXZKdVR5VllLTUx2aFRYdVZrc2R5MkxR?=
 =?utf-8?B?d0xmQWpUeGl0dG5SemZEY09nU2FyNHJYL0Q4MGl4clRrLzVnd0NSRHMyZXJo?=
 =?utf-8?B?bVRUZFgrRFdYVEx3ZFB2YU1rYVZaSkJMWlQxY01pYTg4L2pPN3RjdUVnWjZ5?=
 =?utf-8?B?Q1hmZ0VMc2h1a2g1SzRBTlRJV0JWZ1duUEREN2xEU2JFSlI2WDNMUHpya0h1?=
 =?utf-8?B?T0pNTVJnYmk2K1I2elJBY3dZb2VMYk9ieitJTGl6cjk5dGlXOForb3NDeDJ5?=
 =?utf-8?B?cUhXa3E5WDZqd1FHWEoyQU1OVWttUStscjFiQSs3TkxoTUZnUzI1bHNXeDdY?=
 =?utf-8?B?MmJubXpVajhKSWVvWi9iWE5mNFRlSWsrVUlZa2VHcEVveElLWitIWW84M2hJ?=
 =?utf-8?B?THdXeU5PWnQrNURkUDlmb0NyWnBuaERJVmlJV2s4eTBNb1IxYVVVTUd0TW4w?=
 =?utf-8?B?Nkkyd1RPdjZVZ29qR0FtUjB2RDdrQllCQXZsa2VrUUVwRVNHRlpIQllKVS9o?=
 =?utf-8?B?ZVdUbGxib2lTZzlzRmZtdTVackVZdlpiR043TlFhZzZONmp3TkZ4UlpOenJi?=
 =?utf-8?B?ZFpBSHNBbWtJeGlzeFBOekR0N2VkaGp6eWQ5dUJKaFZuUWxYRDdVbUd6R1ZW?=
 =?utf-8?B?dGVPMVYvWU02OEFmSTc1WFFvUko1ZzhDQUMyaXhGdUt2QllQSjhzZDVBbkpm?=
 =?utf-8?B?R1RwVGNTM1ZHaGtnRldyUlJDUWlBazVCOXJCTFUyYnJtVm9ndHpMdmZ6TUUw?=
 =?utf-8?B?SmtqV1k1Um56MEhDUm9QWHd6dVZBdDEzOWs0bU5GU0dsVjFiZEJFREdyVUVi?=
 =?utf-8?B?eW5LRnhsWVRyQXZhV2xzK3BWVFVVWmp3MGRNU0cvZXRDRlc4MC9iRmNRcFBj?=
 =?utf-8?B?c2tiZU1xQVRtaTRubDdUVkV5eVV1cWttL2czTDFmQno5d1Ezc3dERWdrNFRN?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0307eb1e-27c3-4870-c661-08db586b917d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 13:18:43.2102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OchtIA4iq1sRbQcAXA2/W9U7CaL4iWm/CwuqUVo+S7F/+L3hQ6FcexaFF3WpdrNGng7i8L0XARMIfYvshN4JAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5644
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 06/11] drm/xe: Introduce guc_submit_types.h with
 relevant structs.
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

These structs and definitions are only used for the guc_submit
and they were added specifically for the parallel submission.

While doing that also delete the unused struct guc_wq_item.

v2: checkpatch fixes.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_fwif.h         | 29 -----------
 drivers/gpu/drm/xe/xe_guc_submit.c       | 42 +++++-----------
 drivers/gpu/drm/xe/xe_guc_submit_types.h | 64 ++++++++++++++++++++++++
 3 files changed, 76 insertions(+), 59 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_submit_types.h

diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 20155ba4ef07..27d132ce2087 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -46,35 +46,6 @@
 #define GUC_MAX_ENGINE_CLASSES		16
 #define GUC_MAX_INSTANCES_PER_CLASS	32
 
-/* Work item for submitting workloads into work queue of GuC. */
-#define WQ_STATUS_ACTIVE		1
-#define WQ_STATUS_SUSPENDED		2
-#define WQ_STATUS_CMD_ERROR		3
-#define WQ_STATUS_ENGINE_ID_NOT_USED	4
-#define WQ_STATUS_SUSPENDED_FROM_RESET	5
-#define WQ_TYPE_NOOP			0x4
-#define WQ_TYPE_MULTI_LRC		0x5
-#define WQ_TYPE_MASK			GENMASK(7, 0)
-#define WQ_LEN_MASK			GENMASK(26, 16)
-
-#define WQ_GUC_ID_MASK			GENMASK(15, 0)
-#define WQ_RING_TAIL_MASK		GENMASK(28, 18)
-
-struct guc_wq_item {
-	u32 header;
-	u32 context_desc;
-	u32 submit_element_info;
-	u32 fence_id;
-} __packed;
-
-struct guc_sched_wq_desc {
-	u32 head;
-	u32 tail;
-	u32 error_offset;
-	u32 wq_status;
-	u32 reserved[28];
-} __packed;
-
 /* Helper for context registration H2G */
 struct guc_ctxt_registration_info {
 	u32 flags;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9e2950f1fd0d..250e56ee2e75 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -22,6 +22,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_engine_types.h"
+#include "xe_guc_submit_types.h"
 #include "xe_hw_engine.h"
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
@@ -378,32 +379,12 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_engine *e)
 		       __guc_engine_policy_action_size(&policy), 0, 0);
 }
 
-#define PARALLEL_SCRATCH_SIZE	2048
-#define WQ_SIZE			(PARALLEL_SCRATCH_SIZE / 2)
-#define WQ_OFFSET		(PARALLEL_SCRATCH_SIZE - WQ_SIZE)
-#define CACHELINE_BYTES		64
-
-struct sync_semaphore {
-	u32 semaphore;
-	u8 unused[CACHELINE_BYTES - sizeof(u32)];
-};
-
-struct parallel_scratch {
-	struct guc_sched_wq_desc wq_desc;
-
-	struct sync_semaphore go;
-	struct sync_semaphore join[XE_HW_ENGINE_MAX_INSTANCE];
-
-	u8 unused[WQ_OFFSET - sizeof(struct guc_sched_wq_desc) -
-		sizeof(struct sync_semaphore) * (XE_HW_ENGINE_MAX_INSTANCE + 1)];
-
-	u32 wq[WQ_SIZE / sizeof(u32)];
-};
-
 #define parallel_read(xe_, map_, field_) \
-	xe_map_rd_field(xe_, &map_, 0, struct parallel_scratch, field_)
+	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
+			field_)
 #define parallel_write(xe_, map_, field_, val_) \
-	xe_map_wr_field(xe_, &map_, 0, struct parallel_scratch, field_, val_)
+	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
+			field_, val_)
 
 static void __register_mlrc_engine(struct xe_guc *guc,
 				   struct xe_engine *e,
@@ -486,13 +467,13 @@ static void register_engine(struct xe_engine *e)
 		struct iosys_map map = xe_lrc_parallel_map(lrc);
 
 		info.wq_desc_lo = lower_32_bits(ggtt_addr +
-			offsetof(struct parallel_scratch, wq_desc));
+			offsetof(struct guc_submit_parallel_scratch, wq_desc));
 		info.wq_desc_hi = upper_32_bits(ggtt_addr +
-			offsetof(struct parallel_scratch, wq_desc));
+			offsetof(struct guc_submit_parallel_scratch, wq_desc));
 		info.wq_base_lo = lower_32_bits(ggtt_addr +
-			offsetof(struct parallel_scratch, wq[0]));
+			offsetof(struct guc_submit_parallel_scratch, wq[0]));
 		info.wq_base_hi = upper_32_bits(ggtt_addr +
-			offsetof(struct parallel_scratch, wq[0]));
+			offsetof(struct guc_submit_parallel_scratch, wq[0]));
 		info.wq_size = WQ_SIZE;
 
 		e->guc->wqi_head = 0;
@@ -594,8 +575,8 @@ static void wq_item_append(struct xe_engine *e)
 
 	XE_BUG_ON(i != wqi_size / sizeof(u32));
 
-	iosys_map_incr(&map, offsetof(struct parallel_scratch,
-					wq[e->guc->wqi_tail / sizeof(u32)]));
+	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch,
+				      wq[e->guc->wqi_tail / sizeof(u32)]));
 	xe_map_memcpy_to(xe, &map, 0, wqi, wqi_size);
 	e->guc->wqi_tail += wqi_size;
 	XE_BUG_ON(e->guc->wqi_tail > WQ_SIZE);
@@ -1674,6 +1655,7 @@ static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
 		guc_engine_wq_print(e, p);
 
 	spin_lock(&sched->job_list_lock);
+
 	list_for_each_entry(job, &sched->pending_list, drm.list)
 		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
 			   xe_sched_job_seqno(job),
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
new file mode 100644
index 000000000000..d23759959be9
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GUC_SUBMIT_TYPES_H_
+#define _XE_GUC_SUBMIT_TYPES_H_
+
+#include "xe_hw_engine_types.h"
+
+/* Work item for submitting workloads into work queue of GuC. */
+#define WQ_STATUS_ACTIVE		1
+#define WQ_STATUS_SUSPENDED		2
+#define WQ_STATUS_CMD_ERROR		3
+#define WQ_STATUS_ENGINE_ID_NOT_USED	4
+#define WQ_STATUS_SUSPENDED_FROM_RESET	5
+#define WQ_TYPE_NOOP			0x4
+#define WQ_TYPE_MULTI_LRC		0x5
+#define WQ_TYPE_MASK			GENMASK(7, 0)
+#define WQ_LEN_MASK			GENMASK(26, 16)
+
+#define WQ_GUC_ID_MASK			GENMASK(15, 0)
+#define WQ_RING_TAIL_MASK		GENMASK(28, 18)
+
+#define PARALLEL_SCRATCH_SIZE	2048
+#define WQ_SIZE			(PARALLEL_SCRATCH_SIZE / 2)
+#define WQ_OFFSET		(PARALLEL_SCRATCH_SIZE - WQ_SIZE)
+#define CACHELINE_BYTES		64
+
+struct guc_sched_wq_desc {
+	u32 head;
+	u32 tail;
+	u32 error_offset;
+	u32 wq_status;
+	u32 reserved[28];
+} __packed;
+
+struct sync_semaphore {
+	u32 semaphore;
+	u8 unused[CACHELINE_BYTES - sizeof(u32)];
+};
+
+/**
+ * Struct guc_submit_parallel_scratch - A scratch shared mapped buffer.
+ */
+struct guc_submit_parallel_scratch {
+	/** @wq_desc: Guc scheduler workqueue descriptor */
+	struct guc_sched_wq_desc wq_desc;
+
+	/** @go: Go Semaphore */
+	struct sync_semaphore go;
+	/** @join: Joined semaphore for the relevant hw engine instances */
+	struct sync_semaphore join[XE_HW_ENGINE_MAX_INSTANCE];
+
+	/** @unused: Unused/Reserved memory space */
+	u8 unused[WQ_OFFSET - sizeof(struct guc_sched_wq_desc) -
+		  sizeof(struct sync_semaphore) *
+		  (XE_HW_ENGINE_MAX_INSTANCE + 1)];
+
+	/** @wq: Workqueue info */
+	u32 wq[WQ_SIZE / sizeof(u32)];
+};
+
+#endif
-- 
2.39.2

