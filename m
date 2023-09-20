Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FC2C04FEE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8426810E546;
	Wed, 20 Sep 2023 19:30:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDF110E542
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238257; x=1726774257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qRNS9a9gXTFo1gUPVHLlyBFPF3QaWomcitFMKQ3gPoo=;
 b=HY3E+MjclvM3JCJf91tu99Y+bW1S2NvQtNZk5kMFDRUN7J5fhzL5Jk+2
 caZ1gOv/6Ecvc9dT0StyvLCoT/rPFDDrJHBW0JtPDYiwRMrt+r6vw8veY
 J/D/3BgdhVXLYWpK758+NLC4KVInl81WRydNgokjcxQXgfFCP1mCO5dGQ
 jqmPcWvJ2TjWztDvywB0nhwdg8k+mr8FL34soUz6pJc3sOBkfNSn/Nork
 k+lh6D+KR3ljiD2QcI3Tyq+AwMspqjwIuFOURFnDcURRT2ZCs3TrAStjK
 AhEdPTBqpxvfGJpglbhHq9EHyVh6uy5I4IzOzkI3nClK0t581z8Xzlq7o A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="377619004"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="377619004"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:30:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="812287578"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="812287578"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:30:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:30:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RoixUzMI1ShsEIdT4qbDXUp5C3QGrxuryE8Sg173+Dg8Xk3G+v2SXQZasaX6+tFNxj5pHzdUS/GPLl1pfhLzhwPUJ1uZjWAlgnwxsDTDWTMHef+Nj7zxzo56Hxu3bvAAuh/zfrxGyGL0haJdmFd0nqgDKIbfzxz70eFXh11qIq1RovI2/ksbRCTBkyAaZoW0pFKl/tY67eiaOXPqEjjdy6fyX6mg9041FtQGvP3ZzBx8vI7MLnTNoqf0BibkK00Z4fZ4hXZNUxs57Tg4K4AHhfUaQKr6oPAJALG+E3x9d0khyXXButMIE/sYVqZabuYqYCq1QD7movBcAETefsiy4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OT8k1RiVyc5iaUxgR6InIKIjKCJlEn34m6JMBYnSX34=;
 b=n7CpYgMIaVvcyMeJODXuQxqxMg0GUjyHrLttbX4xBFEOVQGEtl5CIoy3gbDb2vETIapm3M4OBOKcWX9nDfbysZjA2VwtUS8AyiXFZYnPj6W9rTLT4ro+B1QBA8jO5ybzYjLru2Pkr6JpDVW47l/r24w6FJ0p6I/LKuQWuk0Z9S/n9oOgeipA9f9dKMYIjUXUzMYkQvKVO2gp/cK/vN7L6/JaplyT5L7fLmTJo4YhhtLH66eE4TBflSvv9cBPhnkg5qWodcaHgHqYylxXz/lv/ljzXyShA7FKDMn8VkIWRZR+1FfvakoT7OSr8nVkmqHDh7vxkWeHclEWJ+xKr9l2jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4951.namprd11.prod.outlook.com (2603:10b6:510:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 19:30:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:30:35 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:33 -0400
Message-ID: <20230920192940.135004-14-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:217::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: b747f8fc-2917-4f58-061a-08dbba100fc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ygCDzzhEHJ65/A0oyShWv7LnakO8T47gqyQdSrpbb0szK98DF3xO3imtHR3PO9nFo+aZ0EWzuTKTHdQSG5cnlbme6B6ukFaoUVKp8fTC6EJWpAL6h0kr/Az2tVzC7y/6522BjYNmYM6Psgc+Urkt4pEIrBSGxB2AN4yvo8C8L3qQUzUpbJaipB3E0nfiwZFm1wHZgB15fJAlrtCXy6bS00kVzvC9sc8OwioErF9HUe/C8xXBlUXb+/B3T998Mkei+/Pv0OlIo7cTEqr09cmeL6AzqOWyDeIYiKm/VFvOL8VcgR0h5oVukSFfWEbgAYno+2il0eabpxTLRqSLFBEGrPxPxCcFn0f9dbev967GNzBTCVH6a+eLmu8pF0EfNCBFMQAbQEH7KdwKqJH97cpa3dEZZO3AHYfeO7dmECI+eoAWUh028VA1mwhKCc7VRD3h33/ldzq5BEHDo38xBQzZ/Kolz0HxYN8lLcv4Y92HOtVcuqR/8omTb5z1V+Ug6SoZjmxBG1jyK1CQnRFzRNjpArWuobb/EuhCzgUzw1VWtWPI21v7ylDaXezjfj9XR83T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199024)(1800799009)(186009)(6512007)(6486002)(6506007)(36756003)(82960400001)(83380400001)(38100700002)(86362001)(107886003)(2616005)(26005)(1076003)(66946007)(54906003)(66556008)(66476007)(316002)(6916009)(41300700001)(2906002)(5660300002)(44832011)(4326008)(8676002)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5OhgIpyc0oXNpFUZWHMh2PYY8rIt7CChiVXU6CkoUnFL9lSwBmI2Lw9DyvEE?=
 =?us-ascii?Q?fHtwGarDVsCKICT/wig1QCmk1st88w5tQ0ZaWMcPjrZ8G1MFITLcnJNMnh/L?=
 =?us-ascii?Q?o2j+EsqSDbDdjskdVg7kag+TCk60gklvTIRo6IBsq/F0/+AUtQU873yOBDcM?=
 =?us-ascii?Q?fvE7ikez6N57lxpzrRyt3wF11ByIQy/ELR0o2G6ZWc0KVusBK6478ZoUuxJW?=
 =?us-ascii?Q?U8o6ynmx5zlaGRZYNjUVq10f/6UcvFaYi/fund+bjF3PZD2osSRDL/eqIw7g?=
 =?us-ascii?Q?2+w77QUsiNWts3a6olGIsMx+UcXs2zqQP9vRiZavVN1hqcbx84hXTjWsag3T?=
 =?us-ascii?Q?lkTCMn0q05j85bpdw3fv+YBGtxOijL8OKxwvXMFrSW0moN5SG5sjhw1qh95v?=
 =?us-ascii?Q?HtGtn3uw4P5vPOMYI/AThMB28f6QnJ2pczqOXCkPYl2t6e/ole/1NL+6tFbe?=
 =?us-ascii?Q?oHRcVI4M9EUTDuyeCix8u14JS2NHGQrbIB9vfIk1Rskth8YQWsMsUYnXd7mN?=
 =?us-ascii?Q?OtWNAANJxexSryIiP3jDNbNxcASWlILVqThDAk87TzCP0Gc4N4xoSW/Y+AVv?=
 =?us-ascii?Q?OCEVwZ9bSzUD18stXGLYsijGIRoOws3JQ3NNXUmNw2yYMinrJL3UH9pwGBD9?=
 =?us-ascii?Q?qSfnGTVEeyvmkASEw4YqzMoYqqEZo8V7lXEUbGpGyc6L1idj3Y1u5bMzbn8c?=
 =?us-ascii?Q?+jqCvn9Z5ZbKpqWvfrLdyEN95AiQEq8X+SnfP621+6JsnDvqq/UgdaTiZagV?=
 =?us-ascii?Q?PLEwxc58kkuXvwZJ+jC301pdJ2pVgQm4wz0bg0fH+VN6lkPuAZ/+BlAIgX9k?=
 =?us-ascii?Q?UNT8IiPkti/93im+PhqGj7g9v/USoZe03W+/qnbgq4/JJ3MnDvKaP/XNDgLu?=
 =?us-ascii?Q?ayKH3KSr2Wb68i8LrG5ZVdjgtYB9NFRYhjAoIZznoE80wTtccjaprAwaYIOY?=
 =?us-ascii?Q?ZVe7/4HZFekv3pLlz++E+SzbZHzCDHoUXTaGAOZjycAO2xa7u8XKbARYmAvJ?=
 =?us-ascii?Q?ZqyU9jpsh2h2dODMjjFAP5H+6KRctdsFILjx6z6yk6qArtFFXcY49FP4lTvj?=
 =?us-ascii?Q?9cGEiuvEnD86QeJXGodAO8P8LGrnMccM+E5MuVtz8xP+qOn+yNTM3Z0CU9UM?=
 =?us-ascii?Q?QCrlVGafyFkFnHq2bARx0pumBfphiDiVZPLsPwQt/WeD6vHKr5WKz09uxsqq?=
 =?us-ascii?Q?eL80QCbroh5cV0VU2Rpj5uvHvMm+uBHc67Pzyyk1mGcOdrAPsZfe4gKVFB30?=
 =?us-ascii?Q?//68DZ2FesXC6QjexmKyGhA79WM1Duumk6KErXpkUN58Sjw3Dq43m1dsKCXK?=
 =?us-ascii?Q?an2BIqZZjVPBgtx5dMTZhZ5PAId0lcWqZmbR8NTu4SzatqghJ+dY2FfZ6ZDd?=
 =?us-ascii?Q?1guqcMVjlabG40hYkpAilKq9hCQwWKZxAzWFE7/wb9UOxXo4c0w7Ny6KqUuY?=
 =?us-ascii?Q?fUsM32Oxf9Y7dbkDZQljzFDmGbNH5f+YCd9Zefb1pIxTE8cEdemU1Xp/BTG/?=
 =?us-ascii?Q?Ffz4NXXwLOA9PbKuDFmqL77ELw9kbw/If2fBqLCMoLB+hzH7FeS/Lgn00XJi?=
 =?us-ascii?Q?bW3dAxvUhpkEynUPPaNrKyJwkl9BwStilLrWuJxP+8AGUbKP7RWE5Ydg1MEZ?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b747f8fc-2917-4f58-061a-08dbba100fc9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:30:35.2247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1cLmLlfU47bi6asAV/eljBrRaOYn72RQsHJQAJwvA1Y387xI8PhOI2dZNMhWS9vxfNlihlqutyCwD6x/f+ovdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4951
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 13/20] drm/xe/uapi: Document drm_xe_query_gt
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
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Split drm_xe_query_gt out of the gt list one in order to better
document it.

No functional change at this point. Any actual change to the
uapi should come in follow-up additions.

v2: s/maks/mask

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 65 ++++++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 22 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 817fdb762758..ad344b3324c6 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -336,6 +336,47 @@ struct drm_xe_query_config {
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
+	 * @native_mem_regions: Bit mask of instances from
+	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
+	 * direct access.
+	 */
+	__u64 native_mem_regions;
+	/**
+	 * @slow_mem_regions: Bit mask of instances from
+	 * drm_xe_query_mem_usage that this GT can indirectly access, although
+	 * they live on a different GPU/Tile.
+	 */
+	__u64 slow_mem_regions;
+	/**
+	 * @inaccessible_mem_regions: Bit mask of instances from
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
@@ -346,30 +387,10 @@ struct drm_xe_query_config {
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

