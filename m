Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724E8CD5BCA
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469D810E284;
	Tue, 19 Sep 2023 14:27:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF8210E293
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133614; x=1726669614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=G64nSCtZx5QGCJWpGqdKoWqHZ6OUPQ5f0aP4bIN0q4Y=;
 b=Cf0aGTujo7/Vs4ytbIINuxCu922bR/VpB8PnXa1/N78r0jglq2MCIABK
 HQJPCcJ4IWqmqOw9sESfOoPocAEK1QmWrC4NIfJt0wVqtasguxqZ24zcU
 mQWyMC4JsmFAwxRSWJp+JGZ12Rv40fNwJHvDTLovjHOvg77Wu5Vrrrz8k
 V/lrj1YH8cNo++ffo+Qf3ZoX4up61vZnAKHh4EP53F69tlik/WFdyJxV2
 3gzCCYLRgGm7aPrFQmNln926CAJmTEJDBk3sHlQb7vHIDNe7oSOTExrHb
 uA8A5x3BnL4mCFRjajLIXWFBKTmjxpGMGVPNHmvadXz6KXphGCwco7HMC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="382708036"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="382708036"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="749498948"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="749498948"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekYmxiUfkQ5sl6DPXYCglux9D3l4Vk2RQtQLx2uj04JOE3yD5pJB95KGMpG6pHIFUgE20Q+3AKDL1aFIoWDmpSenNZv8gsPO1mvP7SIuwaTDroS+0sUImnKuztKCNjCgPBV3SKLSSLMaHnMiYm73VC/Eex93CgZE9v5HeRImqq+Y3+dTLX6z4ZZslQ283BWjZufyecDuqLy4lawEwj3N6Y4qToaBeB66yon0Iz5NCrOftpuhtbt6s0G9E+1EhhZMTMQZHR7Smz9LRM6GkhEy6+w8MNHgsshNUkwSuMn+ym92Xht/Oxh2y062RT78NXYGmKefhmLK3sgtI6aEWZ7qVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+4UoVCrkaH+qY+cg82hQp1nM3bBczr06Vq+oJXkC8E=;
 b=Ks9IiVjwnNSapgDKq15e9uqq1YwCeap7/IMRLi3C7w4JKyHM3m0jKmWkZL4zzR530qkhXoZKfaN9ofCddOcez1uZotzPgsph5mtDj93VtiqXAtNrJMBkQVuhr6UTo1jkQ8F0EeniE8I+XbILP1+l+dqSvrfks4GvGEY1UF2SYdkNw8HR24RJXTMV52vEndJS3DY+tqjGVzS7GxCb7hn4lsa8uoNKpBfqIT/y/UxISFuSMixN/bf5zYwoRpriedw0TmMOdeTEMObjPRRsxwMcwINGlHOGuuSLT5rd7QbMmSUfm3evajpwh5LhH4ED3NIJhrF/+vZAO403lsUmeaUqdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 19 Sep
 2023 14:26:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:44 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:25:04 -0400
Message-ID: <20230919142504.91652-18-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c987ee9-2f49-48e0-c01b-08dbb91c730b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YoHcdETkkYwQ5xy2sd4bTrJCjtfK2xmGjy6J7KwR1QzPdhFHdDkgZAgCfqVhZX6ICAgW99KVg+7sGn2M4qkoX4w4ZsfsHTK1hTrr7moS/iCrzyLMIvhEKhFwE7Z2UJS547hkLNvUNDijF8KLWwgGEsh/xdhSVpBuNPpe8i3FZxx5r27Wqb9FtPktuqwV9IGwSjwOE09+E6RfaguvqOeVHkstczKpTz2ttwELwDFf6MA2huJI/SWWVO7eetcd9yXaP2YEaOrM9FNFmzXGmfdcyV7FMP4BJRf0/vI6GClYnGAd8sKVQRmlBfI0MuoJqeRzK2M5MPZSGsryVcwkFZr/5INZutD8epFDbobDNuPdHOPvKlf5R26YWaqC4rOQ6ETEKpRohJu8QRmAPFYuykfH67VepiFk9yAmHMx/syqRMgzIpxT2HqL6dNEIsPe1lA78+A6OrWMdbxPxUYqKMtEhIOXfQAjq5QlNAiHNE5jNpH9+FPASUHZKrC8XDbVOVmyTHl0rB5Og9Rysd5LY9SwFQJljkSy2mYmAA6Y9w7MiDDn6ye3kgwjCSVFZPDnzBZSC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(316002)(54906003)(6916009)(8936002)(8676002)(4326008)(41300700001)(1076003)(107886003)(2616005)(26005)(83380400001)(6512007)(478600001)(6486002)(6666004)(6506007)(36756003)(86362001)(82960400001)(38100700002)(66476007)(66946007)(66556008)(2906002)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q11UfYLOFXVTQcIZGU0sUdzFVVOI5+KjvnEcTcq/kwjkUvTWSAx6x0L9g0ol?=
 =?us-ascii?Q?IXnr5Kxr/gn1+R1JLO0pSl4yt/CoWJ4Axr9+7gB3NWYD5cxSW3qhCW0edEbR?=
 =?us-ascii?Q?+8nSHIyYOoCtnG0ZlZZTcCoXj9EWZ1PY/m4r06R1Tx/WPzgJTpms/i+SR+Vv?=
 =?us-ascii?Q?Qa3TDNjBS2Bp/Y9wp2E8Kzx4PhDlxQUS/G715ZoUD1NS66tnTw6swb3023ac?=
 =?us-ascii?Q?KcN52QADgrMvde401r7JReusB+G+DRH3AEL/sqw6poPdKyrG6j+QJHZS2H5u?=
 =?us-ascii?Q?9JZNPOteZDw7LYyiKXsS9PlADMwUJvqbHgIlAQSOgvG0BoDWD9ToS42Pl/KP?=
 =?us-ascii?Q?TWxiEGwox/aao04maOms7tOcF4EUpK7fr4X5mAA8mR68LqQmPajzBAG7XRl5?=
 =?us-ascii?Q?LGUPmsLXy/6y4S0WjYEZUaE56t5uH+ekE1CQnYTDtNxndWhSi2AwKMxgn7nB?=
 =?us-ascii?Q?sAby8TvFpiSA2gU/+g2oJHfQNjx7uyW3HZ91qVmT136YeYZ/M9lfqHQen0h7?=
 =?us-ascii?Q?onNZO6FsC52Przhrj8An0B1koQ9v4r8hYOw7HyLSoRFDGJnOFjjYgdcPM2+8?=
 =?us-ascii?Q?hoOFEwq93DmdxAmS/jouc5JQpNT76QoBPO9fz/BoPqqs3TcYO4a5Qy9lVdNG?=
 =?us-ascii?Q?UmkYfxc9ZD5WNSZ8TkWyCdf1yHPLXraT//RIunlWZ51c0Mod94HaYF0Yh63Q?=
 =?us-ascii?Q?FUp68TQfAS4X0BYUYUyaf97Qkw5QRMnqiYtrOxBrgqpvyf9vsJU1pLpZj1y8?=
 =?us-ascii?Q?yTJOmbsg9JNdbXd05XGnlDLr5SqaWxR//+9+wxIT/26RzSrEe7NqZN1rTaX+?=
 =?us-ascii?Q?PySmG+j8T15xT6Ok7JlHYhyRrAZOAhPYiAbp5W6IiCN8HzBNfB2MxSLMZSvz?=
 =?us-ascii?Q?8RWvzKJ0Q3FAWaAsm2+7wwHzUVi01pVIHwD41hsRwA7hafOKWYk7QH69mnVY?=
 =?us-ascii?Q?LrEjKiemWUyP/teWhaVrhR9dLisHBk+lSzUub7yY478oV7dXBtUz9sdesZzS?=
 =?us-ascii?Q?AZaNt7+JaMnr1NW2l8aFnx0uangplcyiyUv5GMQFNYR1fo4D1uLSThfC3qZJ?=
 =?us-ascii?Q?KCuiFebyBEN5ZN0NLS4Fkv/QkQg8Ynl9vw6TUcvCKKWK5laqSGSLNxB1zcq7?=
 =?us-ascii?Q?hmxLCeOxNBnqarlb6NB5XX0pUoNgcdS+TKN0NjVVS94tKTfyLPZ9eF38ZlFZ?=
 =?us-ascii?Q?h1l8z+GIhtEVeAw6pfmhIZl9DgSPXlaJWE9Lj4ZYnovAWQ7X2UddsaYUsS35?=
 =?us-ascii?Q?iDvJBVXVb3vWTInodgciFG+tzV0CMWBHIqDJkAhoVYBAdv9wAK5xhSPiqpK9?=
 =?us-ascii?Q?CqHxDc2+lR7THGx6zjf9YfXu1O1s0rJPndzLwHaVK2alon/KS5Swfi08R0yx?=
 =?us-ascii?Q?YIIuyHZXca4b+KEeiFSl6CkBy2v8dahvuBnyUThCS8HBWqIiYXo5LwmqVa5x?=
 =?us-ascii?Q?6Ne+4oBoQCqKGNtGuGgdMX/t2Jee5P9RH3Z7+2c29W2JQhnbX6OC/6JLsRCE?=
 =?us-ascii?Q?3IOJ4gWIfYzh+gbNC2peLT8fUtcuGWj3hPwZcelCNGfhlJ1MCurmMot62gAq?=
 =?us-ascii?Q?TKWX/8T+zjEg02/mAr8yG4MaZcBb/VOjTMe8XtQ2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c987ee9-2f49-48e0-c01b-08dbb91c730b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:44.5654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+wK+6ycNp2Kp9cuGyHo5x863AfcntL1tBFB087n8zw9vwF1/hDFAltVDmAFAnDGDlpEbTQWIdLIyoeDaeWxTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 17/17] drm/xe/uapi: Fix naming of
 XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com,
 Francois Dugast <francois.dugast@intel.com>, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, carl.zhang@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Francois Dugast <francois.dugast@intel.com>

This is used for the priority of an exec queue (not an engine) and
should be named accordingly.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 include/uapi/drm/xe_drm.h     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index f7a374c28fa5..a27b10583f5a 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -338,7 +338,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
 	config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT] =
 		hweight_long(xe->info.mem_region_mask);
-	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
+	config->info[XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
 		xe_exec_queue_device_get_max_priority(xe);
 
 	if (copy_to_user(query_ptr, config, size)) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 43155d2c01d9..83d9bf644e16 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -330,8 +330,8 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_VA_BITS			3
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
-#define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
-#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
+#define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
+#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
-- 
2.41.0

