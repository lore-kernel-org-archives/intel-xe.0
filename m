Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84893EEB56F
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 20:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D9C10E94A;
	Fri,  8 Sep 2023 20:33:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CA810E94C
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 20:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694205199; x=1725741199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rWwfRvP2hXeavjcHe0uXaf0txKAhqtl3MOTZ6KDgdPw=;
 b=CPj8MNdG/p/czpN6b6yi8V3zQ6STTt4ue88NVw6qrLLp+j1Onke4QrKt
 ky9ElLIFhv19DWN1BThejvfqMuf6qUR9FeZBm0YyM3wf7InGOl+09aLr0
 i44RFy9t7iMoaDRppxfTXHnQlHrFOhIy7XC0qa3qRUlTdKLogA52FFfG9
 87LBLbyxRprgfYt5yFBzheMQ2emA/9MHtU6u4D+naS27FbWyk1AXMfeAf
 lG99eqiIetyRTlgg+57TlfQwLHJPqZ+3GuEr27mgcNdmabEJmcXXhWZ+1
 5Q3W+dgUS/g4bRHgLboLBtxVhI6QRz+BIxo29PorfEG5H3DYAfEyw52xO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="408719694"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="408719694"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 13:33:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="692395057"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="692395057"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Sep 2023 13:33:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 13:33:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 8 Sep 2023 13:33:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 8 Sep 2023 13:33:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSbAWMjywxD3h9XgcunQcGKyBdFcbCSlyWA/77l0cUJYqBlZtfdmvrcmio0AukD8Jo7Fh+VJUxiLzPMQaHwWqQWTd2AKVZ530YN1wMzAitavI+39WcGlk99R6clC1MLRkUc/dzO/H80wuaQU6C4KZjdXoi4PMs/9vGb+D0LKdo110lq6wceTGKfJzIF2uzotFlj8NHyCU0mk/U063dSXeyOrf1qVNi/+L5zUYRjU6bGzM9R/ycuvwrHPmyrwS7iqWOdBuDpOBetZpwQZxuNYKsasg8X/Ikk1NW/cj5WNV2N4oMwEsAFXXIUUzAMxPKwy5MnS8GeezZln/83GT+8HUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0I7sa5GEhDSTqSJzoAHzy/9Gc3UyJT7P+xVXCUX2Fk=;
 b=XaAwM/itb0sLTM8ukRIahzhQUTO9RB8R1ERiaK5WeCeftORzzSEq5TmdGHZy/Nb+nlZV6hR8kmPAs4Hu5p5uoDer6IAZ0cj6vMH5vafWt2D7+1flPlEwFhWs8rimUUkIdB6Cd/l7xD4Zp7yGslei9ova9dUaA1a2RPbyvU5b5UyIAJ5ohCRnwf6HzgaHa3W0kv03CJWxx480rl0bx4F8T7pQJLpnU3mopZ4Z3UO6yVmNFONeb0rpIeiqGYxLjQM1dxrDOiiE8lBy1xaW0YIr+hA79/ElSbaZBP1LPLGAgyIZqz7+QJFYoSYT4J5Hp1YKjMRKC3o97MZaLUF/zvFxWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by BN9PR11MB5226.namprd11.prod.outlook.com (2603:10b6:408:133::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 20:33:16 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c%6]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 20:33:16 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 8 Sep 2023 16:32:59 -0400
Message-ID: <20230908203302.449041-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908203302.449041-1-rodrigo.vivi@intel.com>
References: <20230908203302.449041-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0295.namprd04.prod.outlook.com
 (2603:10b6:303:89::30) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|BN9PR11MB5226:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c75859-5c8e-43d0-2e58-08dbb0aad44a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6/lR8LIWNjx6XBQtUbOfbZnSCZdZHtyJ5jFbScIizBESjGurEI0QwsrwwQQieyQAJcKg2Z7dDvv5lkfjkaWSpYsYu2nn+BaFtS1dTm4q+RSfXH8x+tcIAPMdUy/mi+nRIrVPAByXZOFDYwtqpIgJvVMqzTxmVfhSN9jliqscNkBP6NfkflYHeVSCi4RwPgDPa3rpvEv2Kia+kQgHZQsbLWhR5NziYWSPJkatrF7aEWLPeAXOCgvwRaFFFRgt/mXt5NOfW7KLuYcbG7MlpIL3EGIZbec6k8HD/jKFz1LJ/OqBfd2SEPKjkp5VEoss+38Bymv6QWXRq12zEAH9VFeNy/NBVaYaKBTdEzhPvXTIYS0AkbOzgdTz1E3njyPNDzv7jlTEE+dDTuYIjL+KVmWRBtDbtyKUfcM+IK+MZiO9JY+6B6AhzKUKBzy824aSAdQCi3WuIcL5IafqX2sFU0B5017p6GwkTJ6SggCZVgebBzp/gCKFiRS0+axlcUgrfPhOgvD0Ff1Y+ezJ74Tl2dTje6iDqzSLmKGRc5kRHCEFQYrzF8RiJfniUOMRMTqTVJ+m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199024)(186009)(1800799009)(6666004)(6486002)(6506007)(6512007)(107886003)(36756003)(82960400001)(38100700002)(86362001)(2616005)(1076003)(26005)(41300700001)(83380400001)(478600001)(5660300002)(8936002)(4326008)(8676002)(44832011)(2906002)(66946007)(316002)(6916009)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AmD2bZUdKx+Jo/Axev8Re0k6ptp6nMF6WOeO6kc12I5FXHmg9+TZz07Idogb?=
 =?us-ascii?Q?m0XFXfeW7YamC7w2VDKw62ckLOVLHUDD5QsXG2BrTnm4FBY0BdR1eZ0b0jS9?=
 =?us-ascii?Q?C4taVzfKRUWLz35gP96PDZa6ATY/w4K9cIkkEmLhH8y5i7OjG8BeyX8cq/XV?=
 =?us-ascii?Q?DuR0wjoPefA2tiIrKKpEd5LSoyBFkOqdjdRNO9dGcOxMQolLzFLXPk1JbW4V?=
 =?us-ascii?Q?0Iax18LCIiaO3ct3z/FeEur9xSgIHcnHavdfM/SFWU45N8XDuF5lAnGw28db?=
 =?us-ascii?Q?0g0WTP6a9VzSqcA2utRNANX4ju0+W3ybDrKIW6u8OUxQr12PkzTsTq7sNTXl?=
 =?us-ascii?Q?08XdEKbdbkLsZEKONJfmg+e6DhBwcKHy0DmFTSMvlj1lDoxCc5mtjXMbgR0g?=
 =?us-ascii?Q?hCjSj2RdH04zPsOvXQyKt4ou2qfgl4mekt+SbcHc5dPBezjNHK4WBeosRREY?=
 =?us-ascii?Q?awA7WmxHkLF0rDzAvxg5xZ4MZlICV0ehffaJAhexWLCBcCNBwJWgwcvte8uE?=
 =?us-ascii?Q?cBq6YR0qaFJsyf2I1iek4gHNY/27VGAutLynfXD2Dvv8m1dOTTTXWuuYzDZ/?=
 =?us-ascii?Q?tmTkXXoNVeQlzof/gsVA8xuyTS/hsFzEE6zdwOKeD8FvQUgKUGF/U5DfJ70b?=
 =?us-ascii?Q?R1g6s1sKTYVG/AxhQAh6yN4lUS8jxVJ/A13fMB2YAlcJro1LaPtq1gSZ05gy?=
 =?us-ascii?Q?JNkbFazbWvbuGGADGMGo9LiPWwUHXfFThd2BW/FMWu8+1BbrKNPwygVwZqqI?=
 =?us-ascii?Q?ObGw8LSDHi9abo00EWMNloR1mIp+krBdQzLHy2YKtKBz/MN0dlzAmzykhnGh?=
 =?us-ascii?Q?9rXZ0ng8u31ar/1l7Kd7c8jUwgIwBVrLn/9lnhNhXazFQ6Lh1L9hlPdgVAq2?=
 =?us-ascii?Q?GBtqhJR4LSLh+XIF37Ru0waYyNow2J7+5GwHdFkx2My39k45uZH8pMVb083y?=
 =?us-ascii?Q?Zz6Z7yFsWp/P+D4DllmdDrYkiVcMUC+BsiAk3n/xFvYPGc+4hoCWaCsXczA7?=
 =?us-ascii?Q?SuBA8FZ0kM8aaPGIstgF/sHmhybReoj9Zjp4PYbDtaE8R20XX3AOtxYUBaoM?=
 =?us-ascii?Q?8LTD0vMlhRIylUw9Z5EDWOEAniCPNGXGNT+9ceLoCzmgdP2aXsJFZwl3olgp?=
 =?us-ascii?Q?58z5VXQ20iD0cZ3TkYKrbfRbmQ6zEofOb6I5hBOCcJ50VFsbMMzPNqKoa8kJ?=
 =?us-ascii?Q?R6iLPUI8FPTK/I2xqK4kznL5PWONK0kyBMZlj2iTgR8TUoPoMt/0fW+0TYbc?=
 =?us-ascii?Q?Oo66ZX044dpCTJTFaFg6uxQ4mFEsoOoBbSByjpYtk3PTsczvvrNVCCsO756K?=
 =?us-ascii?Q?9Q2b31vv7w/GhD6aPfpf9t1smHVfNKPVEfSHTUg3syaCUe+r/kjuePGZNzUL?=
 =?us-ascii?Q?Sh7lZr8MCDvwZyh41saKcrFaC8mAgIKMcrAKB2dM8ys0GRNLsWwFOc0Oz4eX?=
 =?us-ascii?Q?0G7YHekcVMbKJpkdnqKjvcOcHGmhdjGQ2bRhAC7OFXlPpv0EMFdJqSSZIOjk?=
 =?us-ascii?Q?JBBgkacOBxPM7AdmCSgIL0I5Uw8QgsRnWjlraiBKNV93oJNcRxDqLbfy3J4I?=
 =?us-ascii?Q?CNQwfaCnJvkTDFuLPStc7+MjlIClKqr+aGRYu6RY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c75859-5c8e-43d0-2e58-08dbb0aad44a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 20:33:16.1689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h32Tk5mCS0m1znA6nO/CzgZgvUwK20/AE7dd9+UJqUdZobI4Yfjv19kke5Z998bETbykJ+4CYJyhQ7n4PJddhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5226
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC 2/5] drm/xe/uapi: Document drm_xe_query_gt.
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

Split drm_xe_query_gt out of the gt list one in order to better
document it. No functional change at this point.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 65 ++++++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 22 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 51c4ef5dee6d..4bcee709bef9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -262,6 +262,47 @@ struct drm_xe_query_config {
 	__u64 info[];
 };
 
+/**
+ * struct drm_xe_query_gt - describe an individual GT.
+ *
+ * To be used with drm_xe_query_gts, which will return a list with all the
+ * existing GT individual descriptions.
+ * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
+ * implementing graphics and/or media operations.
+ */
+struct drm_xe_query_gt {
+#define XE_QUERY_GT_TYPE_MAIN		0
+#define XE_QUERY_GT_TYPE_REMOTE		1
+#define XE_QUERY_GT_TYPE_MEDIA		2
+	/** @type: GT type: Main, Remote, or Media */
+	__u16 type;
+	/** @instance: Instance of this GT in the GT list */
+	__u16 instance;
+	/** @clock_freq: A clock frequency for timestamp */
+	__u32 clock_freq;
+	/** @features: Reserved for future information about GT features */
+	__u64 features;
+	/**
+	 * @native_mem_regions: Bit maks of instances from
+	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
+	 * direct access.
+	 */
+	__u64 native_mem_regions;
+	/**
+	 * @slow_mem_regions: Bit maks of instances from
+	 * drm_xe_query_mem_usage that this GT can indirectly access, although
+	 * they live on a different GPU/Tile.
+	 */
+	__u64 slow_mem_regions;
+	/**
+	 * @inaccessible_mem_regions: Bit maks of instances from
+	 * drm_xe_query_mem_usage that is not accessible by this GT at all.
+	 */
+	__u64 inaccessible_mem_regions;
+	/** @reserved: Reserved */
+	__u64 reserved[8];
+};
+
 /**
  * struct drm_xe_query_gts - describe GTs
  *
@@ -272,30 +313,10 @@ struct drm_xe_query_config {
 struct drm_xe_query_gts {
 	/** @num_gt: number of GTs returned in gts */
 	__u32 num_gt;
-
 	/** @pad: MBZ */
 	__u32 pad;
-
-	/**
-	 * @gts: The GTs returned for this device
-	 *
-	 * TODO: convert drm_xe_query_gt to proper kernel-doc.
-	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
-	 * bandwidth between this GT and remote region?
-	 */
-	struct drm_xe_query_gt {
-#define XE_QUERY_GT_TYPE_MAIN		0
-#define XE_QUERY_GT_TYPE_REMOTE		1
-#define XE_QUERY_GT_TYPE_MEDIA		2
-		__u16 type;
-		__u16 instance;
-		__u32 clock_freq;
-		__u64 features;
-		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
-		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
-		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
-		__u64 reserved[8];
-	} gts[];
+	/** @gts: The GT list returned for this device */
+	struct drm_xe_query_gt gts[];
 };
 
 /**
-- 
2.41.0

