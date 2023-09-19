Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B38CD5BCB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CEC10E28B;
	Tue, 19 Sep 2023 14:29:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA7210E28B;
 Tue, 19 Sep 2023 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133770; x=1726669770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jwFYhEMRtGl4XWSuaj//4/BqL2yIRgYPXlrWNys270c=;
 b=b/u12GqaEX0wTNgJbmKRCbYhMTVPaBHvH06fpWJmX5W+wDI6LPIouMLy
 NVB52XfH0mEiC8iLTX+V1Zz+Udzyi3LiHBaq2VVYoDvGfOhdCZ2my/VGn
 acnHv02oRlFzAjxfrKGHlHCJYGtpTRfcszkIx5ilzCB+2nfMeYOfnBJCt
 t0FMn4wHmtsksa9ZJutpqI3coLDNHMWGeFyl6gqOTaJd1pzywZ8shDzvb
 ZYpYaEI2U0UGMPpJnIShw4VyBdTbmYVXo+pjuqpozdCvaB47EqthrIWIv
 kmUjLvAz1qmBaIUYxV7PLM4VcKOIpDMd+4HQKrqKK4lfdejf3lkKcCmQR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="359350637"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="359350637"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="722902526"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="722902526"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnW6d+IgRB8aFMr4fp5adGBxQUNU6LR9VytbEDj6HDAyitHmJ0cXSQQ7cOYHD6coDwjKzgH1GiaIYut1l5h8UubFTYTVhKJak/54I0IlwIlZpltFSbqqAJNHjfO9xcx4B1u+rF056ul/WOE4GVLi5QpD+DBPZ38JWl8k/jjGhoqarKRg1DlpQ9t2gIvq0fkdmk3vb9a2so0UWbctdtbi6IVVJfXQC90vQQUDJwHAeugJRnVY+PdqFrZUgJZKjNZBc/6j16ndCeoCq5G48I053yZs0EtoI7AKAw1KI2nvNNK5pxyd54cLMBzpQO+tmuYlgUtU7HUoO3EPZjWFGEAqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpfkUICSfnc1TDIYDUaJzubZGMfzIlaFSnMOWd+2odE=;
 b=RjFpoEfbudtaGGntVsggnT6S2QQzdPTsG0SD0f+GsYUgp1fw0ETu9zbx4LHh8wLtsQkC2uIuM8hWx0tvrHl8Hs7E2401rga1+jj/6eOWVqX5+5HtKIAcGg648UwMOIDnPODAiddHa4ULsL2wW/n02GKCAn1qICzK0DiBUI6jpIUR37TvtypTwZl81LjqraxHNOl0G6vh23rbGUPgrBu32/cVBIqYPwg0TVHhOJpTeBUfZY2EdkKfpzuG4Pm2SfFt2vdHzw6X4GJIUsTPt59GxSOZD5+mPQ0EY7f6w+4+HrKdrMU0ikhEHii9phAHwA69xABpZFbLHdaYY/AHkzQXsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 19 Sep
 2023 14:26:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:55 -0400
Message-ID: <20230919142000.91363-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: faa9b967-e631-4718-8318-08dbb91c6099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R0Dv7eFb49Tipav2maed7KvKYNUydWJYwnDhf6CQExZDIzdIEcciW6halxyCqltddZsb8nomiiigl2ltFnGdj3twUCGEU/QVs61XektYa14pelUvXG3fqKKQZm6quQEfESnQShbUFx2ZQNizvQ1Jfrs4zm1u5asCKC7YVzOP2PRd3+jCcetnL+aKQ4Br1B0Fv7mCbqI16LrrM3JuJPh7LK/IlWqArANpqDhT9plvmvNLknTuCiVQkzImNMYpeSPnvBTiICITYMqrQjD9bt7c/iHfKqGcSlx19TIQdR/J/hlCyRCd3OSceXaTIM2YRNAw9PsoEuOUAUkLGcX/RP0b4obga0Hk+J+TgeM62czG/+A26jXHgscjUDbUArV0mqA8Q6DUCMXlUCQTqEO85EqAC0BxzBh5wNTxYQCQ7k9s7INZGxHCv4eoS+URr8Uw8JEEoyP49JSOEo8rdPPewHbBoxU8bSow7n/DiP3QcIMbNqY1HG643eRD4AKI/5tT3IAcBp3DVhiEqQzMbYEmsT55xifwf8xHxaiEhUw1II0uGTMG5AVLM7lS/d5M8wItQMmP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(316002)(54906003)(450100002)(8936002)(8676002)(4326008)(41300700001)(1076003)(107886003)(2616005)(26005)(83380400001)(6512007)(478600001)(6486002)(6666004)(6506007)(36756003)(86362001)(82960400001)(38100700002)(66476007)(66946007)(66556008)(30864003)(2906002)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kLeD/3YnxVyi/+mSHEeEw2begQWqe5HY85TkwKWC1+hE1M5COkphBobygu93?=
 =?us-ascii?Q?mg28qIAID+2MyJKDkf44NmVxKY0/L06EL/gasDFVpQT/EVtlhakYMX0KNivy?=
 =?us-ascii?Q?FFR5hxfB3FLmJ397W5AcAV3ve4FsPgBdPT7j9l/xap3PV6fZGG/UDV05QTHi?=
 =?us-ascii?Q?8BbfOSgYlnxVrRJ/grXLK9vXSRldZvRa+2V7ijuOWSRi4Ri4IwLgQuNTz+OK?=
 =?us-ascii?Q?rCKS8rG0HUoDudtlOgV5FNMzheoWN1AftAxEuOZ6y4RSkNm2YCCjw2Y9jaEe?=
 =?us-ascii?Q?fjr3XKBqh315ltLeLhDiyp39s3eLLlyIy4Dac4aOsFYEf2rINkNIVuPwKEVT?=
 =?us-ascii?Q?lAspv3/dDNsA63RCmGkMKIW23NptdzTRPRrHR2AxMsDe1YvQuv6XZ9ISm7au?=
 =?us-ascii?Q?45c16QaselRsUxxLURZBmrEYWixIMWnKQyJFwlJ4GgfwSxbPeAy4qE7f7/n9?=
 =?us-ascii?Q?hT9Pkk1k6squKfDNkUiMsGT8IZZrAB0j98fe0dLOk4iChDomvBsg5DLF0ZOx?=
 =?us-ascii?Q?OYhKuYPtRE+9tTv0gXsaDPwPk0N5BUl84FHfhf9TqcwsIBhWJiR2TPc35Gg8?=
 =?us-ascii?Q?gIDHjC5OG7M7ws4XvP51kaQONS2HYlBwU7Hcco+txbAC75bFvnLFKuyJE350?=
 =?us-ascii?Q?3luxfiEmJgzi1oFmFQoTU2epDBmekADw0Kvp1jWrOPbwTFiEznEDE7Wa1xPC?=
 =?us-ascii?Q?0eRB995MpzqRcmigP26Qfxx29LJ0NDkZYkGXFbiTDa8goqfv4QyyyfhOLaaZ?=
 =?us-ascii?Q?v+O5ALBcbk6WPuZ/PFcQT6h6QH1x5bce7QV9NrVq5RWbVlKsn0rKbMv0B5Mq?=
 =?us-ascii?Q?OzqVteFMJ4pE9zwYffcTw/lCsYDpM2vAKhkqMDb3ZDVZoJ6K1DDPgTzoyOvI?=
 =?us-ascii?Q?2jMVuJ0wYvrbq3VAiwOAjgWeaBSo/55iZtL15Hpjc4GYZEwWrtTmHTa3I6I0?=
 =?us-ascii?Q?5XE5vVlSaoVnHsbDhIuv305r37I7BTMHGGB2TLjX27hr1OuJivEltAOS/TYJ?=
 =?us-ascii?Q?9apQ0VNT+5Sicwt3/yAwwLE61rJGMqEOzy90VkhsQhriZBbsq21DmpjV+Y2f?=
 =?us-ascii?Q?7JU+yF55S5KWfU1u/US/HUMmTPxPke0s78bdbHQddEwGstPXnzsOkQVFxGTt?=
 =?us-ascii?Q?uiT110CQAmGqwH+5tYJEs3S3GTMc1ISZhRv6SlEoo6lQO8Rvqeppi8YY11o0?=
 =?us-ascii?Q?KkrS3wwh05EtBdrm3mXucDP6xledBAVuTDKVInZqhrQGyjwfhr++CgS8duZl?=
 =?us-ascii?Q?NZORUo5qCaa3op/j2f4H4cH8fbw0pOMgNYZxG7NqTqd2jKhyr+sCdVE9fdgI?=
 =?us-ascii?Q?mNMpOnoF8V4ZNswCQ0fNCUd1uLXGuaKTHYOkhw6Cb4PNIW7SMg7xDNhdYPeV?=
 =?us-ascii?Q?2UD3jiucGaA8RuNNsTcnMxBtpCHyy8PW1wxjV52lo8UMkLdKDggDBEfWT5F/?=
 =?us-ascii?Q?ssYhk2P/LdteeJlyfSwUTYAJJACZcW8vSW1PftarSdAoOGLUhQACCTcmIUER?=
 =?us-ascii?Q?TtvatSqKLRYItHCNErvS56PEYENrcz6z0ux+L9chnfS7kd1fX+jI4gjGf/ke?=
 =?us-ascii?Q?eHKanNVpIyoN1KJ9lEZMM2oiRJa7SMywcY6AS6Sr/cvjQR2kAvtlJ5X7seVB?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: faa9b967-e631-4718-8318-08dbb91c6099
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:13.5776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNHgPLa4HyfXv2Iu24BxaCMkm5pPYz9xMIgUiEJU9eaZfIegp/7B17vZoPV5Xp2abDBP4gOS5VQ/HgDXXynvNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 12/16] drm-uapi/xe: Rename gts to gt_list
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Align with commit ("drm/xe/uapi: Rename gts to gt_list")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h                | 18 ++++----
 lib/xe/xe_query.c                        | 52 ++++++++++++------------
 lib/xe/xe_query.h                        | 10 ++---
 lib/xe/xe_spin.c                         |  6 +--
 tests/intel-ci/xe-fast-feedback.testlist |  2 +-
 tests/intel/xe_query.c                   | 36 ++++++++--------
 6 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 6ba86c1f1..69b62e84f 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -339,7 +339,7 @@ struct drm_xe_query_config {
 /**
  * struct drm_xe_query_gt - describe an individual GT.
  *
- * To be used with drm_xe_query_gts, which will return a list with all the
+ * To be used with drm_xe_query_gt_list, which will return a list with all the
  * existing GT individual descriptions.
  * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
  * implementing graphics and/or media operations.
@@ -376,19 +376,19 @@ struct drm_xe_query_gt {
 };
 
 /**
- * struct drm_xe_query_gts - describe GTs
+ * struct drm_xe_query_gt_list - A list with GT description items.
  *
  * If a query is made with a struct drm_xe_device_query where .query
- * is equal to DRM_XE_DEVICE_QUERY_GTS, then the reply uses struct
- * drm_xe_query_gts in .data.
+ * is equal to DRM_XE_DEVICE_QUERY_GT_LIST, then the reply uses struct
+ * drm_xe_query_gt_list in .data.
  */
-struct drm_xe_query_gts {
-	/** @num_gt: number of GTs returned in gts */
+struct drm_xe_query_gt_list {
+	/** @num_gt: number of GT items returned in gt_list */
 	__u32 num_gt;
 	/** @pad: MBZ */
 	__u32 pad;
-	/** @gts: The GT list returned for this device */
-	struct drm_xe_query_gt gts[];
+	/** @gt_list: The GT list returned for this device */
+	struct drm_xe_query_gt gt_list[];
 };
 
 /**
@@ -481,7 +481,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_ENGINES	0
 #define DRM_XE_DEVICE_QUERY_MEM_USAGE	1
 #define DRM_XE_DEVICE_QUERY_CONFIG	2
-#define DRM_XE_DEVICE_QUERY_GTS		3
+#define DRM_XE_DEVICE_QUERY_GT_LIST	3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
 #define DRM_XE_QUERY_CS_CYCLES		6
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index c356abe1e..b018c7535 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -39,35 +39,35 @@ static struct drm_xe_query_config *xe_query_config_new(int fd)
 	return config;
 }
 
-static struct drm_xe_query_gts *xe_query_gts_new(int fd)
+static struct drm_xe_query_gt_list *xe_query_gt_list_new(int fd)
 {
-	struct drm_xe_query_gts *gts;
+	struct drm_xe_query_gt_list *gt_list;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_GTS,
+		.query = DRM_XE_DEVICE_QUERY_GT_LIST,
 		.size = 0,
 		.data = 0,
 	};
 
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	gts = malloc(query.size);
-	igt_assert(gts);
+	gt_list = malloc(query.size);
+	igt_assert(gt_list);
 
-	query.data = to_user_pointer(gts);
+	query.data = to_user_pointer(gt_list);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	return gts;
+	return gt_list;
 }
 
-static uint64_t __memory_regions(const struct drm_xe_query_gts *gts)
+static uint64_t __memory_regions(const struct drm_xe_query_gt_list *gt_list)
 {
 	uint64_t regions = 0;
 	int i;
 
-	for (i = 0; i < gts->num_gt; i++)
-		regions |= gts->gts[i].native_mem_regions |
-			   gts->gts[i].slow_mem_regions;
+	for (i = 0; i < gt_list->num_gt; i++)
+		regions |= gt_list->gt_list[i].native_mem_regions |
+			   gt_list->gt_list[i].slow_mem_regions;
 
 	return regions;
 }
@@ -118,21 +118,21 @@ static struct drm_xe_query_mem_usage *xe_query_mem_usage_new(int fd)
 	return mem_usage;
 }
 
-static uint64_t native_region_for_gt(const struct drm_xe_query_gts *gts, int gt)
+static uint64_t native_region_for_gt(const struct drm_xe_query_gt_list *gt_list, int gt)
 {
 	uint64_t region;
 
-	igt_assert(gts->num_gt > gt);
-	region = gts->gts[gt].native_mem_regions;
+	igt_assert(gt_list->num_gt > gt);
+	region = gt_list->gt_list[gt].native_mem_regions;
 	igt_assert(region);
 
 	return region;
 }
 
 static uint64_t gt_vram_size(const struct drm_xe_query_mem_usage *mem_usage,
-			     const struct drm_xe_query_gts *gts, int gt)
+			     const struct drm_xe_query_gt_list *gt_list, int gt)
 {
-	int region_idx = ffs(native_region_for_gt(gts, gt)) - 1;
+	int region_idx = ffs(native_region_for_gt(gt_list, gt)) - 1;
 
 	if (XE_IS_CLASS_VRAM(&mem_usage->regions[region_idx]))
 		return mem_usage->regions[region_idx].total_size;
@@ -141,9 +141,9 @@ static uint64_t gt_vram_size(const struct drm_xe_query_mem_usage *mem_usage,
 }
 
 static uint64_t gt_visible_vram_size(const struct drm_xe_query_mem_usage *mem_usage,
-				     const struct drm_xe_query_gts *gts, int gt)
+				     const struct drm_xe_query_gt_list *gt_list, int gt)
 {
-	int region_idx = ffs(native_region_for_gt(gts, gt)) - 1;
+	int region_idx = ffs(native_region_for_gt(gt_list, gt)) - 1;
 
 	if (XE_IS_CLASS_VRAM(&mem_usage->regions[region_idx]))
 		return mem_usage->regions[region_idx].cpu_visible_size;
@@ -220,7 +220,7 @@ static struct xe_device *find_in_cache(int fd)
 static void xe_device_free(struct xe_device *xe_dev)
 {
 	free(xe_dev->config);
-	free(xe_dev->gts);
+	free(xe_dev->gt_list);
 	free(xe_dev->hw_engines);
 	free(xe_dev->mem_usage);
 	free(xe_dev->vram_size);
@@ -252,18 +252,18 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->number_gt = xe_dev->config->info[XE_QUERY_CONFIG_GT_COUNT];
 	xe_dev->va_bits = xe_dev->config->info[XE_QUERY_CONFIG_VA_BITS];
 	xe_dev->dev_id = xe_dev->config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
-	xe_dev->gts = xe_query_gts_new(fd);
-	xe_dev->memory_regions = __memory_regions(xe_dev->gts);
+	xe_dev->gt_list = xe_query_gt_list_new(fd);
+	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
 	xe_dev->hw_engines = xe_query_engines_new(fd, &xe_dev->number_hw_engines);
 	xe_dev->mem_usage = xe_query_mem_usage_new(fd);
 	xe_dev->vram_size = calloc(xe_dev->number_gt, sizeof(*xe_dev->vram_size));
 	xe_dev->visible_vram_size = calloc(xe_dev->number_gt, sizeof(*xe_dev->visible_vram_size));
 	for (int gt = 0; gt < xe_dev->number_gt; gt++) {
 		xe_dev->vram_size[gt] = gt_vram_size(xe_dev->mem_usage,
-						     xe_dev->gts, gt);
+						     xe_dev->gt_list, gt);
 		xe_dev->visible_vram_size[gt] =
 			gt_visible_vram_size(xe_dev->mem_usage,
-					     xe_dev->gts, gt);
+					     xe_dev->gt_list, gt);
 	}
 	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_usage);
 	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_usage);
@@ -356,7 +356,7 @@ _TYPE _NAME(int fd)			\
  * xe_number_gt:
  * @fd: xe device fd
  *
- * Return number of gts for xe device fd.
+ * Return number of gt_list for xe device fd.
  */
 xe_dev_FN(xe_number_gt, number_gt, unsigned int);
 
@@ -396,7 +396,7 @@ uint64_t vram_memory(int fd, int gt)
 	igt_assert(xe_dev);
 	igt_assert(gt >= 0 && gt < xe_dev->number_gt);
 
-	return xe_has_vram(fd) ? native_region_for_gt(xe_dev->gts, gt) : 0;
+	return xe_has_vram(fd) ? native_region_for_gt(xe_dev->gt_list, gt) : 0;
 }
 
 static uint64_t __xe_visible_vram_size(int fd, int gt)
@@ -647,7 +647,7 @@ uint64_t xe_vram_available(int fd, int gt)
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
-	region_idx = ffs(native_region_for_gt(xe_dev->gts, gt)) - 1;
+	region_idx = ffs(native_region_for_gt(xe_dev->gt_list, gt)) - 1;
 	mem_region = &xe_dev->mem_usage->regions[region_idx];
 
 	if (XE_IS_CLASS_VRAM(mem_region)) {
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 20dbfa12c..da7deaf4c 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -26,13 +26,13 @@ struct xe_device {
 	/** @config: xe configuration */
 	struct drm_xe_query_config *config;
 
-	/** @gts: gt info */
-	struct drm_xe_query_gts *gts;
+	/** @gt_list: gt info */
+	struct drm_xe_query_gt_list *gt_list;
 
 	/** @number_gt: number of gt */
 	unsigned int number_gt;
 
-	/** @gts: bitmask of all memory regions */
+	/** @gt_list: bitmask of all memory regions */
 	uint64_t memory_regions;
 
 	/** @hw_engines: array of hardware engines */
@@ -44,10 +44,10 @@ struct xe_device {
 	/** @mem_usage: regions memory information and usage */
 	struct drm_xe_query_mem_usage *mem_usage;
 
-	/** @vram_size: array of vram sizes for all gts */
+	/** @vram_size: array of vram sizes for all gt_list */
 	uint64_t *vram_size;
 
-	/** @visible_vram_size: array of visible vram sizes for all gts */
+	/** @visible_vram_size: array of visible vram sizes for all gt_list */
 	uint64_t *visible_vram_size;
 
 	/** @default_alignment: safe alignment regardless region location */
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index f0d77aed3..b05b38829 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -20,10 +20,10 @@ static uint32_t read_timestamp_frequency(int fd, int gt_id)
 {
 	struct xe_device *dev = xe_device_get(fd);
 
-	igt_assert(dev && dev->gts && dev->gts->num_gt);
-	igt_assert(gt_id >= 0 && gt_id <= dev->gts->num_gt);
+	igt_assert(dev && dev->gt_list && dev->gt_list->num_gt);
+	igt_assert(gt_id >= 0 && gt_id <= dev->gt_list->num_gt);
 
-	return dev->gts->gts[gt_id].clock_freq;
+	return dev->gt_list->gt_list[gt_id].clock_freq;
 }
 
 static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index a9fe43b08..0cf28baf9 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -147,7 +147,7 @@ igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
 igt@xe_query@query-engines
 igt@xe_query@query-mem-usage
-igt@xe_query@query-gts
+igt@xe_query@query-gt-list
 igt@xe_query@query-config
 igt@xe_query@query-hwconfig
 igt@xe_query@query-topology
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 3aa2918f0..e0d14966b 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -252,17 +252,17 @@ test_query_mem_usage(int fd)
 }
 
 /**
- * SUBTEST: query-gts
+ * SUBTEST: query-gt-list
  * Test category: functionality test
- * Description: Display information about available GTs for xe device.
+ * Description: Display information about available GT components for xe device.
  */
 static void
-test_query_gts(int fd)
+test_query_gt_list(int fd)
 {
-	struct drm_xe_query_gts *gts;
+	struct drm_xe_query_gt_list *gt_list;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_GTS,
+		.query = DRM_XE_DEVICE_QUERY_GT_LIST,
 		.size = 0,
 		.data = 0,
 	};
@@ -271,29 +271,29 @@ test_query_gts(int fd)
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 	igt_assert_neq(query.size, 0);
 
-	gts = malloc(query.size);
-	igt_assert(gts);
+	gt_list = malloc(query.size);
+	igt_assert(gt_list);
 
-	query.data = to_user_pointer(gts);
+	query.data = to_user_pointer(gt_list);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	for (i = 0; i < gts->num_gt; i++) {
-		igt_info("type: %d\n", gts->gts[i].type);
-		igt_info("gt_id: %d\n", gts->gts[i].gt_id);
-		igt_info("clock_freq: %u\n", gts->gts[i].clock_freq);
+	for (i = 0; i < gt_list->num_gt; i++) {
+		igt_info("type: %d\n", gt_list->gt_list[i].type);
+		igt_info("gt_id: %d\n", gt_list->gt_list[i].gt_id);
+		igt_info("clock_freq: %u\n", gt_list->gt_list[i].clock_freq);
 		igt_info("native_mem_regions: 0x%016llx\n",
-		       gts->gts[i].native_mem_regions);
+		       gt_list->gt_list[i].native_mem_regions);
 		igt_info("slow_mem_regions: 0x%016llx\n",
-		       gts->gts[i].slow_mem_regions);
+		       gt_list->gt_list[i].slow_mem_regions);
 		igt_info("inaccessible_mem_regions: 0x%016llx\n",
-		       gts->gts[i].inaccessible_mem_regions);
+		       gt_list->gt_list[i].inaccessible_mem_regions);
 	}
 }
 
 /**
  * SUBTEST: query-topology
  * Test category: functionality test
- * Description: Display topology information of GTs.
+ * Description: Display topology information of GT.
  */
 static void
 test_query_gt_topology(int fd)
@@ -682,8 +682,8 @@ igt_main
 	igt_subtest("query-mem-usage")
 		test_query_mem_usage(xe);
 
-	igt_subtest("query-gts")
-		test_query_gts(xe);
+	igt_subtest("query-gt-list")
+		test_query_gt_list(xe);
 
 	igt_subtest("query-config")
 		test_query_config(xe);
-- 
2.41.0

