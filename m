Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CE6CD5BCA
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2FA10E28B;
	Tue, 19 Sep 2023 14:26:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B6310E288;
 Tue, 19 Sep 2023 14:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133558; x=1726669558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AF1PQzQfYe184M9/M9CnQg5xXlhN8mSViYxq56v7h64=;
 b=hRv8ao4p7vRuHISkYIDeJTgGHWtX01elQ7oh+QF3WSw1t4j5doVog4t9
 Q4zmyv3Fv/bK73q8iuoU4WSCmL9Bb4WbKXN223j5o/+w4xhQhwoAEUFWu
 Yt1Ti0UqtO/s1brWnXqn7dQHw6vLFrtOahtx5kTNh9PsIUlAA5DY72fVa
 b6j0m/JTyWPJoIK65ayqRLkrI5vo3b4DGvUEiInlXHg/wD8Swh9He4wlC
 yldsIUaWmYSQmwE+AI6d3EwChc19dhfUZWcAQEsR9FDmZnwL9bgtlIMS+
 Lwfik4a+lgtjn9Oxn79sQCYboTK7wUgtqy2mAvG3/CV8EgMa48WpHO0hx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383785734"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="383785734"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781319241"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="781319241"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:24:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:24:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:24:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:24:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:24:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6QChR0q//nHD8pEYZx0ZTv6kTZI2MaGuQJVutmIHMtDgIt4hBVnQyyHiJLMXgRSh394WTPNYZWjCdz4siwJozvzBLwUzV1vKdc5CFkvj42ObLzLV80NCkP/7gqSK+f3XCb5oVik8NRlGG2GyoDhu2SxOLZKR2ZhqHfiNA1LJ4sI/V2WDlgPGDQ3ZlIeILT8GNCbmObKxcvYpG7UV+V3huR6F1DaE/7mJyateBKZCbQexnNue8PTguThlEu+wd33jZetTzIo/K0B8zZFm5HO/q/VGGKeN1hHuNmDgMYkIAkSKXnZ5esuFjb4qtZQF4elA4Ydk3AgI675edjOIWpxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQUNKHI4c/qVDUyrm0GQpa4lolW6btAL+MArqB2pu/w=;
 b=BuR5aZC2gyugDbiq262A+avCi/390tSS4kzJRBtXiF9oyLGxBJJRNPxEkJFT391NHjoVQ6v28W814FBtPpLvoFjuAG2Th37aiXCUTbAEcGe1CCesd9AemSIph8ewLv7xj4HM/+5DGZn57GM1ECcF1cucpMJnaIqav894kiykv04zXbweQjJMwsbALKViiiEVW5PoVPokUfWQWA8zakCEV07ci1RZWEWnLZF6vbWruRVTpqSx8faK+B4Yxw+wtGTQOfZm5unwBRuJHrBvJOqLzVO6eonAuBZr8geIqJPK4pGTbq8yFO1jldZxzBzMn7ykUpnBCWdRUqAofEkJ8YPCLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 14:24:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:24:49 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:45 -0400
Message-ID: <20230919142000.91363-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:a03:333::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 331ee569-f1b3-4813-fecc-08dbb91c2ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H1X2tWzcfj4PVi6JPrR4aAqFwDk6aoO/qYH1zcxIb/9hye6Ok2Uy2teQWZ3fVGHr+5rdZRWpPS55KE29lFVW/B7MPNfdIPfwP+J62qQSktFJv6Ibi/COe9gzQVMtOaysqYkkuP/vAwQPrja5I/Ryj7q9AMqT97EGTBdzBIRY9L90ScmDhqhn5UpqX8j2yVxronJ+SeCwP1084ABXPIOFTUwHYo0xeCtvLbBPJpJ/n90O/kuZXexVh2RBgvSL9SYy9//NhKMeoYdiaejFMocPs7FEEsuTOIWb0t7BqdntXnm4ex0Vt1C7mNh1Hdto9mtYQ10X4xfM3NSnZTnHSW2S3pXbioWqTWbShxpHw8J4tuofcDAR++IweRAi5iWIdFZJ0Sj+8Y4FK86DS3WXrcenE0SHYzCbqk0gkSl8vXJNSt3xG/om/HyFSd137zDiHVxxJFrdZMYen7kuwh449RsrZCTq4Qdui5hrH+J77HXXAAMGFzjHT0TtcSfvlP4Sk3WbMsbOYt4MrM+V4jqq9rr4dMpPwhMvikB3n90VS48m3r8fiFR+kJK+Ny5OoY7TcBji
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199024)(186009)(1800799009)(30864003)(478600001)(41300700001)(450100002)(83380400001)(44832011)(5660300002)(6666004)(2906002)(316002)(66946007)(54906003)(66556008)(66476007)(8676002)(4326008)(8936002)(6506007)(6486002)(6512007)(1076003)(26005)(2616005)(107886003)(36756003)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?USl658WWkjm/ui2DjAcbcxF5cAuFyI9x9RM6ueqKxeo3GBsO9WXoXooowhh2?=
 =?us-ascii?Q?lHItW3hA9QhhzvrCYWlDNqW2+o3Gh0IgF/kfVr9S5/fuNNkB/2PAVoqChXAk?=
 =?us-ascii?Q?eTdSa9ipxAzfruG1jYPjmeogWd+mNQbiDJw83g0UKKZuDQFJLYDz46VFC+8d?=
 =?us-ascii?Q?qYrYkgu1FICdfV54zR3t6SIqSM/c6zT2056JXnLVxzGlf4uhKcMIccLbz+wu?=
 =?us-ascii?Q?gh2FacrRFLhlPJid9Q5l/YYPZarc9WzNgQaBSbptySHeOb187ahrzOYJx4y2?=
 =?us-ascii?Q?wjy8Z7gh0p826XaaDqqqFDRJ5f7K8EGHHV2AZPLdV33wyjDR3hU8cHzgrkPU?=
 =?us-ascii?Q?O1OJY2A6yU11NFAIv1ZDPlibVbGnOEDxg1rJ30/f0FjjqLHYZKm+g7Eh+gcY?=
 =?us-ascii?Q?QTCS2ukDL+1VYxqa+dfek//meFUm3I3GvGWII5XMTB/KQT/HeYZ2xt1OJ6vc?=
 =?us-ascii?Q?WBUIGCcnQ+6gd5s1DiwFe1p97FpnIBwwqu/crYYv3cFzTYJ1qeHWi18Ep+Ew?=
 =?us-ascii?Q?u1+bfu8JTjN295RutQVAszQLVHfJYP8trkfYuw/ERFwdQwMl3iJW7v2jzLJY?=
 =?us-ascii?Q?ftEOcX5MbitT4xjDBPPjIZ+zvTD5Rls3bhRByW+isBn8jMmr4mwvgL23Twxz?=
 =?us-ascii?Q?SVTIfe9CHm5OWnc9eseNRp4xJvGid5nI+tA5WCItsJCpinf1tOQ5fArBNZzP?=
 =?us-ascii?Q?nAdkXTSekswU9SzSHL4O6vPIWQTKKj65dJ238RbosJDvfHx9kBOosgv9ewEN?=
 =?us-ascii?Q?GxXQBleJNr1nJHJvIihrhGDGBS+c6fNBQ+kgjuDau5uipg6GP2oMMEo36wSQ?=
 =?us-ascii?Q?BH+q7XPUV5DI6ijsU7nswSeLhUjitZlhqCI8KYtLPBFjZQzOdPtQo7raDGn/?=
 =?us-ascii?Q?8d50Q7LN/oeNoo0KPSGWsXN5g126nNr7EVF+dkm/Uk95OVr+RcPIXhtMP+cD?=
 =?us-ascii?Q?7ZvhQ6eiT8q5g1nb+MiOayKbvo/EU6jX58JsAuhycpC8Z2x7S67NrbT36WgH?=
 =?us-ascii?Q?vjQnNGMKfsCrnDYvXgP1ED0vZ6+2YrBYz/Y/Z0o5BbY57Q2RAZf6yfMJU9Zh?=
 =?us-ascii?Q?pyzwMoKIVnkShth8oRC6vxE8zPsVOyn3HioTPouQ0pxvkJlQ1Dg7wIhVlyfa?=
 =?us-ascii?Q?2SDHulqB6AuocvB/DU9vj1kIsd7wpFOyEgr9GUYKMyc1lqQ1p/bKkTw/7VwR?=
 =?us-ascii?Q?dra55uutdyFvUJt+FDg1+VIbxPhj4aUi8xYgazVNUNa9BGfkSHm35D/7qb9G?=
 =?us-ascii?Q?qpLw6ECryrEIoy6qnCw87nTQg0pRBRwkLi/3Iw+zqWrXH1keCA9rECgYbV5y?=
 =?us-ascii?Q?9GP3EAfoV4mlIHKgKno/c3PW8BGPMRlWgzhmJdDzP3A0ZSYSUimcv4SZyT2C?=
 =?us-ascii?Q?U2VVLTMaV42uw+pmtfBVagFtoaGkbDz3oVSejqm2beIYU3v5eM2MtghT9uxv?=
 =?us-ascii?Q?miqobpS6l0floP3SYrhi5Bgto3tk2hGSOFc6y8mFsC5UMX1Eo6HDEnmvEXTm?=
 =?us-ascii?Q?BQDvHB4YddrB2a0VbfOa9JNXKm08ltCtOkovn3E3TG7aFjgqg956SC9b5cy5?=
 =?us-ascii?Q?t1tFZOqBDd/pWCFkYrDARsO3uFktidBVk9VzFgDVCy28lbFJHataSH4wYb8k?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 331ee569-f1b3-4813-fecc-08dbb91c2ea6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:24:49.8134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THNTFIM1GZeWLCdVFCFdPOtUa4xd5aYypRXmtjveDutZz6s4XTMYb3mZZAUmiEvzxd2bdioAoyQl83I+PGnOaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 02/16] tests/intel/xe_query: Add a test for
 querying cs cycles
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

The DRM_XE_QUERY_CS_CYCLES query provides a way for the user to obtain
CPU and GPU timestamps as close to each other as possible.

Add a test to query cs cycles and GPU/CPU time correlation as well as
validate the parameters.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h |  95 ++++++++++++++----
 tests/intel/xe_query.c    | 200 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 277 insertions(+), 18 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 6aaa8517c..f96c84a98 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -128,6 +128,24 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
 
+/** struct drm_xe_engine_class_instance - instance of an engine class */
+struct drm_xe_engine_class_instance {
+#define DRM_XE_ENGINE_CLASS_RENDER		0
+#define DRM_XE_ENGINE_CLASS_COPY		1
+#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
+#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
+#define DRM_XE_ENGINE_CLASS_COMPUTE		4
+	/*
+	 * Kernel only class (not actual hardware engine class). Used for
+	 * creating ordered queues of VM bind operations.
+	 */
+#define DRM_XE_ENGINE_CLASS_VM_BIND		5
+	__u16 engine_class;
+
+	__u16 engine_instance;
+	__u16 gt_id;
+};
+
 /**
  * enum drm_xe_memory_class - Supported memory classes.
  */
@@ -219,6 +237,64 @@ struct drm_xe_query_mem_region {
 	__u64 reserved[6];
 };
 
+/**
+ * struct drm_xe_query_cs_cycles - correlate CPU and GPU timestamps
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_QUERY_CS_CYCLES, then the reply uses
+ * struct drm_xe_query_cs_cycles in .data.
+ *
+ * struct drm_xe_query_cs_cycles is allocated by the user and .data points to
+ * this allocated structure. The user must pass .eci and .clockid as inputs to
+ * this query. eci determines the engine and tile info required to fetch the
+ * relevant GPU timestamp. clockid is used to return the specific CPU
+ * timestamp.
+ *
+ * The query returns the command streamer cycles and the frequency that can
+ * be used to calculate the command streamer timestamp. In addition the
+ * query returns a set of cpu timestamps that indicate when the command
+ * streamer cycle count was captured.
+ */
+struct drm_xe_query_cs_cycles {
+	/** Engine for which command streamer cycles is queried. */
+	struct drm_xe_engine_class_instance eci;
+
+	/** MBZ (pad eci to 64 bit) */
+	__u16 rsvd;
+
+	/**
+	 * Command streamer cycles as read from the command streamer
+	 * register at 0x358 offset.
+	 */
+	__u64 cs_cycles;
+
+	/** Frequency of the cs cycles in Hz. */
+	__u64 cs_frequency;
+
+	/**
+	 * CPU timestamp in ns. The timestamp is captured before reading the
+	 * cs_cycles register using the reference clockid set by the user.
+	 */
+	__u64 cpu_timestamp;
+
+	/**
+	 * Time delta in ns captured around reading the lower dword of the
+	 * cs_cycles register.
+	 */
+	__u64 cpu_delta;
+
+	/**
+	 * Reference clock id for CPU timestamp. For definition, see
+	 * clock_gettime(2) and perf_event_open(2). Supported clock ids are
+	 * CLOCK_MONOTONIC, CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME,
+	 * CLOCK_TAI.
+	 */
+	__s32 clockid;
+
+	/** Width of the cs cycle counter in bits. */
+	__u32 width;
+};
+
 /**
  * struct drm_xe_query_mem_usage - describe memory regions and usage
  *
@@ -391,6 +467,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_GTS		3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
+#define DRM_XE_QUERY_CS_CYCLES		6
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -732,24 +809,6 @@ struct drm_xe_exec_queue_set_property {
 	__u64 reserved[2];
 };
 
-/** struct drm_xe_engine_class_instance - instance of an engine class */
-struct drm_xe_engine_class_instance {
-#define DRM_XE_ENGINE_CLASS_RENDER		0
-#define DRM_XE_ENGINE_CLASS_COPY		1
-#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
-#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
-#define DRM_XE_ENGINE_CLASS_COMPUTE		4
-	/*
-	 * Kernel only class (not actual hardware engine class). Used for
-	 * creating ordered queues of VM bind operations.
-	 */
-#define DRM_XE_ENGINE_CLASS_VM_BIND		5
-	__u16 engine_class;
-
-	__u16 engine_instance;
-	__u16 gt_id;
-};
-
 struct drm_xe_exec_queue_create {
 #define XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
 	/** @extensions: Pointer to the first extension struct, if any */
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 5966968d3..acf069f46 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -476,6 +476,200 @@ test_query_invalid_extension(int fd)
 	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
 }
 
+static bool
+query_cs_cycles_supported(int fd)
+{
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_QUERY_CS_CYCLES,
+		.size = 0,
+		.data = 0,
+	};
+
+	return igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query) == 0;
+}
+
+static void
+query_cs_cycles(int fd, struct drm_xe_query_cs_cycles *resp)
+{
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_QUERY_CS_CYCLES,
+		.size = sizeof(*resp),
+		.data = to_user_pointer(resp),
+	};
+
+	do_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+	igt_assert(query.size);
+}
+
+static void
+__cs_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	struct drm_xe_query_cs_cycles ts1 = {};
+	struct drm_xe_query_cs_cycles ts2 = {};
+	uint64_t delta_cpu, delta_cs, delta_delta;
+	unsigned int exec_queue;
+	int i, usable = 0;
+	igt_spin_t *spin;
+	uint64_t ahnd;
+	uint32_t vm;
+	struct {
+		int32_t id;
+		const char *name;
+	} clock[] = {
+		{ CLOCK_MONOTONIC, "CLOCK_MONOTONIC" },
+		{ CLOCK_MONOTONIC_RAW, "CLOCK_MONOTONIC_RAW" },
+		{ CLOCK_REALTIME, "CLOCK_REALTIME" },
+		{ CLOCK_BOOTTIME, "CLOCK_BOOTTIME" },
+		{ CLOCK_TAI, "CLOCK_TAI" },
+	};
+
+	igt_debug("engine[%u:%u]\n",
+		  hwe->engine_class,
+		  hwe->engine_instance);
+
+	vm = xe_vm_create(fd, 0, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	spin = igt_spin_new(fd, .ahnd = ahnd, .engine = exec_queue, .vm = vm);
+
+	/* Try a new clock every 10 iterations. */
+#define NUM_SNAPSHOTS 10
+	for (i = 0; i < NUM_SNAPSHOTS * ARRAY_SIZE(clock); i++) {
+		int index = i / NUM_SNAPSHOTS;
+
+		ts1.eci = *hwe;
+		ts1.clockid = clock[index].id;
+
+		ts2.eci = *hwe;
+		ts2.clockid = clock[index].id;
+
+		query_cs_cycles(fd, &ts1);
+		query_cs_cycles(fd, &ts2);
+
+		igt_debug("[1] cpu_ts before %llu, reg read time %llu\n",
+			  ts1.cpu_timestamp,
+			  ts1.cpu_delta);
+		igt_debug("[1] cs_ts %llu, freq %llu Hz, width %u\n",
+			  ts1.cs_cycles, ts1.cs_frequency, ts1.width);
+
+		igt_debug("[2] cpu_ts before %llu, reg read time %llu\n",
+			  ts2.cpu_timestamp,
+			  ts2.cpu_delta);
+		igt_debug("[2] cs_ts %llu, freq %llu Hz, width %u\n",
+			  ts2.cs_cycles, ts2.cs_frequency, ts2.width);
+
+		delta_cpu = ts2.cpu_timestamp - ts1.cpu_timestamp;
+
+		if (ts2.cs_cycles >= ts1.cs_cycles)
+			delta_cs = (ts2.cs_cycles - ts1.cs_cycles) *
+				   NSEC_PER_SEC / ts1.cs_frequency;
+		else
+			delta_cs = (((1 << ts2.width) - ts2.cs_cycles) + ts1.cs_cycles) *
+				   NSEC_PER_SEC / ts1.cs_frequency;
+
+		igt_debug("delta_cpu[%lu], delta_cs[%lu]\n",
+			  delta_cpu, delta_cs);
+
+		delta_delta = delta_cpu > delta_cs ?
+			       delta_cpu - delta_cs :
+			       delta_cs - delta_cpu;
+		igt_debug("delta_delta %lu\n", delta_delta);
+
+		if (delta_delta < 5000)
+			usable++;
+
+		/*
+		 * User needs few good snapshots of the timestamps to
+		 * synchronize cpu time with cs time. Check if we have enough
+		 * usable values before moving to the next clockid.
+		 */
+		if (!((i + 1) % NUM_SNAPSHOTS)) {
+			igt_debug("clock %s\n", clock[index].name);
+			igt_debug("usable %d\n", usable);
+			igt_assert(usable > 2);
+			usable = 0;
+		}
+	}
+
+	igt_spin_free(fd, spin);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+	put_ahnd(ahnd);
+}
+
+/**
+ * SUBTEST: query-cs-cycles
+ * Description: Query CPU-GPU timestamp correlation
+ */
+static void test_query_cs_cycles(int fd)
+{
+	struct drm_xe_engine_class_instance *hwe;
+
+	igt_require(query_cs_cycles_supported(fd));
+
+	xe_for_each_hw_engine(fd, hwe) {
+		igt_assert(hwe);
+		__cs_cycles(fd, hwe);
+	}
+}
+
+/**
+ * SUBTEST: query-invalid-cs-cycles
+ * Description: Check query with invalid arguments returns expected error code.
+ */
+static void test_cs_cycles_invalid(int fd)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_query_cs_cycles ts = {};
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_QUERY_CS_CYCLES,
+		.size = sizeof(ts),
+		.data = to_user_pointer(&ts),
+	};
+
+	igt_require(query_cs_cycles_supported(fd));
+
+	/* get one engine */
+	xe_for_each_hw_engine(fd, hwe)
+		break;
+
+	/* sanity check engine selection is valid */
+	ts.eci = *hwe;
+	query_cs_cycles(fd, &ts);
+
+	/* bad instance */
+	ts.eci = *hwe;
+	ts.eci.engine_instance = 0xffff;
+	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
+	ts.eci = *hwe;
+
+	/* bad class */
+	ts.eci.engine_class = 0xffff;
+	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
+	ts.eci = *hwe;
+
+	/* bad gt */
+	ts.eci.gt_id = 0xffff;
+	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
+	ts.eci = *hwe;
+
+	/* non zero rsvd field */
+	ts.rsvd = 1;
+	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
+	ts.rsvd = 0;
+
+	/* bad clockid */
+	ts.clockid = -1;
+	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
+	ts.clockid = 0;
+
+	/* sanity check */
+	query_cs_cycles(fd, &ts);
+}
+
 igt_main
 {
 	int xe;
@@ -501,6 +695,12 @@ igt_main
 	igt_subtest("query-topology")
 		test_query_gt_topology(xe);
 
+	igt_subtest("query-cs-cycles")
+		test_query_cs_cycles(xe);
+
+	igt_subtest("query-invalid-cs-cycles")
+		test_cs_cycles_invalid(xe);
+
 	igt_subtest("query-invalid-query")
 		test_query_invalid_query(xe);
 
-- 
2.41.0

