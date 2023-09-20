Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E78C04FF3
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335DF10E54C;
	Wed, 20 Sep 2023 19:31:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E62710E542
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238284; x=1726774284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Eg0yM8C0wVR4+ppRDJWrcekJ1Q7wmIi0L80hDtqp78o=;
 b=XQiBIsfEvemVzs6heWsIkoq+pQC0YtRrypZk1bFtw9FdCDguHeRBkgRT
 mDHTWiJh20i+pwgU64+WxqVVQ4RVAXqu21grKhHe2ikbzwGQq5Hswnuox
 y1r6NuHiSwF6UlYQsBYgY+YTm3njqmVtc6iImeS7fBA00rCX5KRAsXI5m
 ouFDxj7hEL6MeoFscvz0kdcurg9sp1NfddGWKvKPkap3o46iyAaMe+AuR
 4QqYreLr6NbtO8ENjvWPLJ1KfkEd4yzWaZYHQU4CIuT2HM4Y1M+nDL89O
 EdDawjmsemooopVpruHJ77H9PMLS2P/QGOUaelvGnt+g9J4fU5v8ovI7S w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359701465"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="359701465"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:30:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870498942"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="870498942"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:30:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:30:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FikZVCwzjusWzt/uIOtzJYQapOV2PqER+2T1b3iYVI+AOuGovgMYcH2seGPSKVXLCn11yUFR7VWvNundISMLko6LmybUGGpJ+55g7M0TMCxyXMLXTOm5oxNs/NyuHjEGpKS89I4OIrsfuHsV1TrnMArJNqc2/lZ+jLHzdJsUVDyqQ4B0S9w+yLAAkeVuUf/JxjDuiISqy0meyMM8KGmOkuAwPIaD84BHkCe0YSak/az9QmPHOkG4tM1qpEfFGx6ECzlNneliaaGmAoLuYOEGttriAUmCsrKyk5ghm9i6FxL7XR0ACRLReXJ/b/NZJjuTkTQAUc2tHDq4wr1gE8eftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2eLXqMeIti3HYUBqSU+XhoaFF3P1HOqOGsUPg3w6AVU=;
 b=FzbWPGs0cmq+dcQEs5zpcrI0EPbfNUdVlOEdziK65wfPFbGQicuIn9bfqmFxPKVJvxPleZ3OzsqftKZaFag5SiCLihFRV0O/7Uyb3TsugKhbPhph9OuxNideXaAKJL7E4GQ6srIopYnrLQoah7KUcE+5qvShSG45HUtBOUtEC0nnofGY5kjmUK8KyOrta4MZcqB9P6nZEeywc2VahdJ/wMXM+0HjqGvvzuDXTx+gsNaSYTdO4ACjI9nkZJ7zQWvGKsCzVQ8mm5MZGo2gB0S6XQvkPE/8ZJ8wuuVLhQ4O1uK+tnoSxzqLfEEUwJy+upnzmpHwGP64hLR7GDSXokm6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4951.namprd11.prod.outlook.com (2603:10b6:510:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 19:30:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:30:54 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:38 -0400
Message-ID: <20230920192940.135004-19-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0156.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: 108fea2a-9668-49ab-9303-08dbba101b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sD4vh/KSxNMcNXEw9O07MFGgA8/dYqwTTRtKGSVb/njOqWuI69nvUA7FoF+p1JJyy3OkEBs8ZZKqHzbRLz8XHW42hWXlcxh9P5Y8WTnDalCOn2Po28unRyyDcy+nyYMw4RIkpAWLYZQ3iS+KVfF0KB1Xqz/PSJA+Yb6kHKGt4epfhZ3DwkhoobrOQzPaZRMmbagHPCCpSCimjuY4pF/F3NxvmBojk1HNcgfEPFj3R+DUJoP53Bn4Dez+dvv6L0o9zBcMAV8VNsqQs2EBnk6wv+ursnQvsiOTI32+eHuz8Tkycbpl85gq/1Ba/1IcBZizOzjAKC59iqTavQYntEERdgQiooFWP3nOvxg2138Ln14OnN9/jj76O1Vtzw0w4Y1CeM4u9HziRKTRVZ4qmgQX2lHBixn6v7zMU3PTVpulpaFREB+7v4uLrT/5A78BWud4kB5BL289UTEXD+0Z4F2czZKeCeMO32YCzhZDi5oVR+WSIXLkKbu4IQcaiQs8ii0ph+L1k9W/wqHK5NPxhxXw183MMLEMz4BLHCvOwqPO7QI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199024)(1800799009)(186009)(6512007)(6486002)(6506007)(36756003)(82960400001)(6666004)(83380400001)(38100700002)(86362001)(107886003)(2616005)(26005)(1076003)(66946007)(54906003)(66556008)(66476007)(316002)(6916009)(41300700001)(2906002)(5660300002)(44832011)(4326008)(8676002)(8936002)(478600001)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QDCXartvCQ4cOtAzMqEvTPzWA2EkV2xnCdeDJBhPl9s5vh5Y4G/wo1wgtis9?=
 =?us-ascii?Q?LRDFsnku4R7MdG0JWK8JUJPlQ5gW9BfIgu7Cuwv1fpsGm1se1HRoJnzmFSME?=
 =?us-ascii?Q?kCTMdvumIfCpdYIpahy5KYca7PyARG6SQdvQ+E/qdIO/kU8Ph9/leSv8jqlz?=
 =?us-ascii?Q?viucFTng+3dsguHbDgK0eu3hhCcdzMJ0BWGImGjDEZMeFyX55kYeImPoh1Kt?=
 =?us-ascii?Q?fqRnTIAAHSR5uXY1U+UWcxcKVKmZwK4SbQzOHUd8PXDGmbX11MRSHjPRZdrp?=
 =?us-ascii?Q?QJYRJtP/tMadvLguwB7rYeC4w3jcY8jjZ/A8nK5mP61MXcWDdgvTtsZosN6B?=
 =?us-ascii?Q?jvnSGkf8lmlWK5CdXLjcioikqwUBZO6RtCBYSvG2te58yN+Cyj75mpHlLRsv?=
 =?us-ascii?Q?Afw2wqnOtjsvYH/at69036feotsyJGUIcmTRcfqBUHZzW7OXFph7NBpsLzgD?=
 =?us-ascii?Q?P2DtQw6komqLU3j56cFi5JXfe/4rTxpri3L04moIjIySDTIViTfO2zerclAE?=
 =?us-ascii?Q?TdlOS1DBgpdTnP3CQEP2PPPHco2GSFgwpwStvWE+xmVIwy+4L8H0RnRjUt6A?=
 =?us-ascii?Q?l7lJeuo1z7mdLGweLuKhPSL0HET534wFXsMaG5knA1tWnqpi5MAUXkpfwUU6?=
 =?us-ascii?Q?gqzKy2UCTJRUj0UVZdGbFk/zakRtKhS9qWPc7ghkBL/aAdCMokl91l+6wz+k?=
 =?us-ascii?Q?UVz/EIHj6C/X8w9W2xU1zlJXqE19Lix1+UmtR7KqUPbqKv+ahiOO7hZLkD+f?=
 =?us-ascii?Q?D5uikz19ajQABAQkJUF7tSEqQmGEkjS+fVPR8XfvCC/bViASxunEH/hMGPpX?=
 =?us-ascii?Q?C/cQW/bLB+HJoc8REZVRMSRZJ8ro4j5nQFPbYVbyHVlzqK0tx1xg3t9+K66N?=
 =?us-ascii?Q?iFOEwEciW5wfmpqNjNFyUszPzseOuX6Du34rbaPWusGgpP5wel+R/aT8NtmA?=
 =?us-ascii?Q?3qVZuY7AHH+QQJVfiOPwe3LdQGLl5fkz3+bTPjxT0wTAAdqIBK3JtVt6/LaT?=
 =?us-ascii?Q?jvHRG2RVwmnZtriwMsOYjKDIUQg2KuMOF2jJuaCbI+Fct5TrUKWG1eP6DbYV?=
 =?us-ascii?Q?//EhwlV62bpyxGmEWUbpmXNwONRzdTK6KdaUEEnWuhna1yzn5ir9BC5fMSfp?=
 =?us-ascii?Q?jSJac/VTR/GMkPEA8xGtwBcXLFS4j32bjjBSlKeADbQ1YOhIcAjs0cdUWYGT?=
 =?us-ascii?Q?tFEI/hGcE6dZcRLXKvFlsIH4IBV6GWeMAMaVNPdfVlPzv8md8KXunaglhqzc?=
 =?us-ascii?Q?NNLIgJa18mlxw7HnTPrAf6OXb4SZRXquZDFvmNF1H93YAwpa4SQGgD9qpebq?=
 =?us-ascii?Q?Gqsgt0WSd7ZmZNGUOBFP9zpY3d7wH4SYl1Q3DlBAP7Ovl+zoKooUpijK8ngz?=
 =?us-ascii?Q?piTsES1SsdOtX+KWR3w60YHbtHgCsNi0fOsVTqRDAsoYAqdN3EjvonIOjeyR?=
 =?us-ascii?Q?dXcbrNg4NM4m2fNhXh1JeUTIMaoLkgEdRew8whD3/UoQbQjVAf5COuHAv6Y7?=
 =?us-ascii?Q?rVgjdSqh8JeuieYvSsVmwxcBSTCBwEK8X20JkhVM3xS5sYQ1uO0tqScmxGLg?=
 =?us-ascii?Q?VSGYw3bU9Ddy5/4EtIaHzKh1Iz+F3+tcdDCBtcKFrg1U9ZNhrVJ1YznnheXb?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 108fea2a-9668-49ab-9303-08dbba101b46
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:30:54.5517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZXURA8XVCfEiJPfzHfmrJSpt3L9ZnsTqFzAGuKWCraqnb6sYXU6Oz0oW9iUobXeAF8jMNuQP40ovsZOAe5fMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4951
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 18/20] drm/xe/uapi: Add documentation for query
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

From: Francois Dugast <francois.dugast@intel.com>

Provide a description of the keys used the struct
drm_xe_query_config info array. Document the behavior
of the driver for IOCTL DRM_IOCTL_XE_DEVICE_QUERY
depending on the size value provided in struct
drm_xe_device_query.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/637
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 41 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 83d9bf644e16..45ec20c2765d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
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

