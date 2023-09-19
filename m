Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252E3CD5BCD
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E7D10E3D0;
	Tue, 19 Sep 2023 14:26:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3005710E3C8;
 Tue, 19 Sep 2023 14:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133592; x=1726669592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=w3KPjzCcO9y+NtJcB2lHyFQgQysPFynZaHy3Chw9JyU=;
 b=CvsM5KevWg8LZ4Rqu5YQ2IuF0bWeLdO7Rweoe/Abn2HqK6AeWTVnmbRk
 W0XleFjKRm5qmZpWQajSEeu559I0RHOYLmvkyTb2EfauDsVyuGNXakoR9
 inCMtAhNYXLamzB7eHGufjj9SNoF1SzBwMYsaBF1xLBZ0amt2+VKCTwue
 YtCNv7BXAPBBe1QJoJeMpSollrsE0mAmG+KW8E4oRVAU4E/uhSpZJiTyf
 +6920XkmwWcUmPJsmVKDxwU9Z8Qh1GB23wzrTtKXhehntC8Rp8DxcHDNd
 +jzbCGPTvln+k5+kXrMvYU7XArOY5xT0eI8UL7gnXN8f8tW9S1KAn+SD2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383786143"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="383786143"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781319716"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="781319716"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e++dAgGOE/7sF6U2qGLrwJRLjAwb1WJwh0M3nn4K2EFG4JTZ1NdFCeALMgiKOamOuAcDq3lIXeDEKdcQFyxcjvHzlN+dL2pQdJZupogFplkkF9CTp8c/xtYgUg1nVvNuW/9UVSwDpEU4UDhOEFW0lXYJUV5sSV7h5Y6iqvogvbwsHKJqv5uuTqG4N+gT7MfTQ3VHinw2Lf0wNzNu9/Cf2MH9na2xQMhckqZqT+YB9KQRO1qXqsEvwaVR6VKlwHO5oZeGuncY/9EZgFcq1o7Oe+9jQF73/5jw/mcr42OQQh7UBcTBRasZGlTPqY0lNLwWPKunmTYbh8xwasZC4NwXdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvfHYOIZcQ+2wGF8rilOQNvGsas2C0GIks2+tj1M0D0=;
 b=LXShtY/65oVKaGuOl7IbgvhNZ+0E8XK+OlwzbhgLm3O1I2A4NgBdcnZMTeqBkqbUpjnKdWlGcpdffV60ZH5dq/zIV80pO1fq7C10o1UO3hlbUkDY/lmtmd8e6+iVD9ri8OLvQkT45PfktUqAGbP77i/o89x+tT3Ab+6Gf6/l2uA2aWXZJGJ/wYfA/bjsgFVA4w2zXmjCY6Hj8y02+wBGjkKUgr0FRbW6UdxK7mHCsneL0FcpyiIzCGawce7969rgN9UgRRVX2kC2PMXS1BYqyUjYtt8nYZdpC8t9ti9MN8m6+lGKyqdNAlQuML0cssptz0x1UpXtLriqXNBA4QhrBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 19 Sep
 2023 14:26:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:21 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:57 -0400
Message-ID: <20230919142000.91363-15-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0010.namprd08.prod.outlook.com
 (2603:10b6:a03:100::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cedc804-eb4e-491d-efc8-08dbb91c654a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zd8qK5uurUVGrmV2xO3kuk8vc6hSQd4v5iiuSJxpPO3APY90CZf02qMGJb4yr6JjC5O/v9KQD38eGlUp5mWwEIKVlLM3SXcs3uDqPXECEMjAMF9o6QnyrWa01oMsnTCxH6EJt/kQY3T11CZ39g7muZc8dhF+EP7scj5tOdCHi2xqzVRXJvRN6ujDWAv4SiZQdbI4wwFzPfkq2T63I1AXCJM7upk3cl5YiccA3yc08SS13trQeDGC0j7FitLgedNnBfiswTYoX8K9Yg57+8rtsg7HRxrmPWkTIMiaQHsAQuxtXNRFHe346CJvjOgz/guBgGKW6tW77AZx1q7wUAX/F75USaB8BHwyjpFY5gr5EGg3+EpmtswuEiXkPNACjURHiYo3cHYuU6bNXJvmXr40oMwPjwsSnmGHini5tp7mefxtF0pViR+PZd1cCwKTOSVXKy+k6ashSaWhtuL1gmQvRWGmiWDRQbI5at+regXXZCjNESnqQ7P9Nhd6toCFly55CTJvtw8Vk+Pj0Pwjzv28i5kNQK+8Q/Ls03CqzujQ7UqNHjkltj3wXUpIcSlSVcDA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(316002)(54906003)(450100002)(8936002)(8676002)(4326008)(41300700001)(1076003)(107886003)(2616005)(26005)(83380400001)(6512007)(478600001)(6486002)(6666004)(6506007)(36756003)(86362001)(82960400001)(38100700002)(66476007)(66946007)(66556008)(2906002)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8V5ZECFCIm+0HQqDMOQgh/FPvR/wvuyeUOX8D6/mt+lIhSNdZQLtDNSYjyAy?=
 =?us-ascii?Q?QqdMIw39t5uBMvJVttkbcJGrKs/YtxqfDgCiNpml5Yuy2wIBYlzv2GhQ5mDd?=
 =?us-ascii?Q?FgDlTUgNjta3hhe87D6aJOHzg/OauBeb99u6EPPeigaOpj3mOIqS1/5tghx7?=
 =?us-ascii?Q?8YOTvRZrfzRUPSshNnm/pjD5uxVmaj6S+JikX5LpO0YDD6tqvnsXtm/Kk2AY?=
 =?us-ascii?Q?15m6r0Z9Hgq/R4HG85gvnKnXkTvwFm8JUli+bmVgO5ycAHV5gilAy2XIpTxJ?=
 =?us-ascii?Q?+MYfhVX1IODvnPdluy+v+HbidoZ1i1G1DDDLtznMGDAko7HxV82i9ngkMww8?=
 =?us-ascii?Q?L+DuS42WEM2hbhtgEPq+7hao796mwy/ntz5gCXDHXYZputnjoC6tNWZzIYKj?=
 =?us-ascii?Q?WmUoaF5WMQe91gv322Y/Icqo2UOu2+9sMQkfy8REygXQEqaBQ5fBO7jl/71X?=
 =?us-ascii?Q?OwgEeANN0UwfNt3NhKSLUa6SlWKvyxJzFW8SFYOejLPAGc/b2f0YTKBBgUWY?=
 =?us-ascii?Q?7Ri4ObGDNUAiH7xQQofI8Qe/fWMoV88imMNer23a70eNagHK6hUa8XdD2/ZY?=
 =?us-ascii?Q?4q6grdX4eeY4vp5o3ziYQOOXNntL3yPHyeXMcwdYLyTtTw6nv8BGELRVONqF?=
 =?us-ascii?Q?FySoXk1L7aqC/+Ig7LqIDkK/DpBWsCSaQEcX5idpG4lNPfg1Xbr1RKAjKiOm?=
 =?us-ascii?Q?eFnNrdQovwaytpAJoiG9eWg6jemqdbOrPAKChKfJEpNmJpNJ05rnVzz5r3jl?=
 =?us-ascii?Q?Ydglzu3ODZrf8E7uynGcUNb/oOuSDoxVxEiYDIr9jwukFkt+OoUATPsXPmJN?=
 =?us-ascii?Q?J6fYbSxqGuAO/8xp4JpciSt1rOql33tuviL7XDp6njs8IIeeIt2BtXjMfXQY?=
 =?us-ascii?Q?GJvSOL3bhI1hGFn1qINfL+3jNtF1SXGfTo9wM5dmB0xkjQRor19SpUEPw5fg?=
 =?us-ascii?Q?zsoYXG1qB3kKmfGsbmTcJJd7vQRBKjQOhazGJjwt+c+CG832dwaITCxhSH1K?=
 =?us-ascii?Q?SmcOdQEHooh/weRx6mHFVfeV6Er7134cKGH6P2SMHaNhh4Me3QI0sMFczoWI?=
 =?us-ascii?Q?+mgSuAOwL0kqd4l3qtMNN9/wHL/dsImjpkf0Cf2joXCE8ur4ScZvJokCG34O?=
 =?us-ascii?Q?wfCnkHGrkBUcxzEDaHHlo3HPOOD1iqoagkBu6AS5dYganAeFcGoozXy5GET/?=
 =?us-ascii?Q?wGE/dDSgxMg8IHEgQjaArg24iprSG0DZnxgwluc9ukvSBa2yLpebQxjXEWp+?=
 =?us-ascii?Q?9rdx5TKj9GBZWKSoHOo5Ac3kCaQQNVDa40oXy95ANPi8aZgrPZlE6ECey+Mi?=
 =?us-ascii?Q?ICxQaRoBTPzVhVSMs7EK9A9+tnxA1I2j17s8SWrZYTFYLdaTT1WC+SrY2YaJ?=
 =?us-ascii?Q?AQ7Gewxpk3zEVkBpvbBt/7x5xMKgBUcQbuUI6oCHrd64MFWRZw0wwu/dXgql?=
 =?us-ascii?Q?YOq4M3RlAUw1ri16JC2ltTGeYtLODCJnW9hyvhqRhoGVLKr6N0oR0vRE29GH?=
 =?us-ascii?Q?rKBjKXnsSHuXrtwoZU5pQfBXUD6EvMpZpBrjyZKUDRs3i7fjILnPY5frlELU?=
 =?us-ascii?Q?KXO5QudIou2VyC7LhjmDUbUR9PQQldSeTj+ywk3qrK51J/w3TgyCycdCzW5W?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cedc804-eb4e-491d-efc8-08dbb91c654a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:21.6652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAe5q30PNLfIjFF3ekRot4lltK8LvhI+vNWRgyuTHsz5571jNsTDOcXM1v0aZzjy5eqhSYur6pplN9xQmSl5Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 14/16] drm-uapi/xe: Align with
 documentation updates
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

Align with commit ("drm/xe/uapi: Add documentation for query")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 41 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 9bef90b1f..7fb6c1f72 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -323,14 +323,43 @@ struct drm_xe_query_config {
 	/** @pad: MBZ */
 	__u32 pad;
 
+	/*
+	 * Device ID (lower 16 bits) and the device revision (next
+	 * 8 bits)
+	 */
 #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
+	/*
+	 * Flags describing the device configuration, see list below
+	 */
 #define XE_QUERY_CONFIG_FLAGS			1
+	/*
+	 * Flag is set if the device has usable VRAM
+	 */
 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
+	/*
+	 * Minimal memory aligment required by this device,
+	 * typically SZ_4K or SZ_64K
+	 */
 #define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
+	/*
+	 * Maximum bits of a virtual address
+	 */
 #define XE_QUERY_CONFIG_VA_BITS			3
+	/*
+	 * Total number of GTs for the entire device
+	 */
 #define XE_QUERY_CONFIG_GT_COUNT		4
+	/*
+	 * Total number of accessible memory regions
+	 */
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
+	/*
+	 * Value of the highest available exec queue priority
+	 */
 #define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
+	/*
+	 * Number of elements in the info array
+	 */
 #define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
 	/** @info: array of elements containing the config info */
 	__u64 info[];
@@ -442,9 +471,15 @@ struct drm_xe_query_topology_mask {
 /**
  * struct drm_xe_device_query - main structure to query device information
  *
- * If size is set to 0, the driver fills it with the required size for the
- * requested type of data to query. If size is equal to the required size,
- * the queried information is copied into data.
+ * The user selects the type of data to query among DRM_XE_DEVICE_QUERY_*
+ * and sets the value in the query member. This determines the type of
+ * the structure provided by the driver in data, among struct drm_xe_query_*.
+ *
+ * If size is set to 0, the driver fills it with the required size for
+ * the requested type of data to query. If size is equal to the required
+ * size, the queried information is copied into data. If size is set to
+ * a value different from 0 and different from the required size, the
+ * IOCTL call returns -EINVAL.
  *
  * For example the following code snippet allows retrieving and printing
  * information about the device engines with DRM_XE_DEVICE_QUERY_ENGINES:
-- 
2.41.0

