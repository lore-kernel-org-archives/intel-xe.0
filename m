Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDCACD5BCB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1362510E293;
	Tue, 19 Sep 2023 14:27:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF77710E27D;
 Tue, 19 Sep 2023 14:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133617; x=1726669617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gPeR9A4Ug2w3BFURTvfzTH031pvoHrpEXmHd77sA6TI=;
 b=hl4H9waQPFWnIMsM/SMSSly3GclWA/tvaAbuVf3LEeolVTuhEsB6uLoW
 NWH0X6vAZy1CdobH2VM0XB1Gp6ETqm5Bxdt2OKXK1nZWqm0Vna+H5tGdR
 stJcLs51rN2ROe1b3DGrkLIIjff5SEwjlPbXCvZwiWZTCinlidKxjGXEV
 styQkcRTAjBAoDxCOEv0iyDk1ZQoQ0bEUQrVukKLelc54g7Rs28kyXrP9
 BU4Hpl+nejduhh2LSxyCbnILJqqJl051mjjwJcOvtxnedE9xhey6C/FqX
 YSE5ByIiVTIF1DOuVTF7FUcIB/gCiebAHEA8uLTfpyJxBdoz6Lbl0KjJK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383786202"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="383786202"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781319743"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="781319743"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgDr83Di6WffzcfBDoOsG59r7O6lBXH5AAKDOZsJvMg6awytEKkL2LinoxsSRkEup1fRMS/gpggWqowIHUV6Hgn8NCfHHtdgz0QOU/n06eyS0mzXR/KOL9uzhEbZe8BlzXCQKpojWPx+pbjL45jnkc499mHBcYYWsEkXqygn3QbcUSzZq+7Et8QDItRq5+QeVFmlR9IbVObRriXHElMJYeo3uyC7nYLxn0tqf12Q3wKYLlv/zKp8XDtQdlIEgMJZ1k1H2TwKCrFJemf3qLjSOQwY7iZGmLA+iU7SA4Q07tZLwrtxCmSJ2iWk4ylzSnz31WgIXRH2qE5Bk2EIHmH9rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53THvQqB7f7ND3COHxSbNKHagyIQe9NCDU15sIYtJ6g=;
 b=AKmw/gdzaA0eP8vSJkh2db1DoE5/AkfDC2+bJmFJLLqxY+jZ4SJqf7MkWu4+n3sZzH4HS/KBdfiEJW8aRyQ4fbLdSilUc/w9S62UR2yV1hl8XmiJPbawVme49QGn8Hy19VNBVYgwZ6402XvKEo+dsl+ihan63iVB9/NDPJr3nvZMtRtLIpE4APbZA7ebmnfpJvDIuAG8XBtdUqV6WTMnnC88qKJ3x64s3g9mf0lZDW3VpPAQqaOZtpHD4sGbnaZclYt/qyb3Dwg6rcPhfgCZyEWI64kCJfTzyW2BnaYmNpwPinNWIkIJZ8Fw0D6fZWCgNo/fKATboR9dpp6VdaY60A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 19 Sep
 2023 14:26:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:58 -0400
Message-ID: <20230919142000.91363-16-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0072.namprd11.prod.outlook.com
 (2603:10b6:a03:80::49) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 0acc2516-396d-41be-cd0e-08dbb91c678b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EK7ZSccPKLkJumtdUJ6KbWMk7mEPgA9MdKz+2IBx9UGjdjSAi8HocQynpi3STRAKS783pv4qO22n1rLgaEy5QMMxBQJ7XspPzL5fsLBCMNNBjBtBFFWxeeJMjWfK4DwHpOzC7n1wgkebyydd0tGNUIlFDDFe/G4iy/ZdGPlztqkCFeAOSdIGOgumviSzVAc6BMNxxyYRNETtjHofMFPxlB9m3aeptTpdEwpXHkzIrJJ4sc/qJe4E8LEij9aMv9b6B2C7MQ2yjGZgjy+o110xM8C3Gq/DZ/FmQAjTQ41z+JWkmrPxrDxs6xTn7RY4Q4J5n4PDhb1Nyz6mJk/0MZyplXTQvHHfLP/7EJwwFYgCVJs6b3X03UxHNhkI2ljEV+tiWG1rgX3tW3PhaXn7kXxV4Z+mwZrFbmGHh+9XTjEFWhGnqmWGpdags1egVimHiVwkhAAdSuMhkJw1ZSkaZBUag5oCvQa/g0li6tg5xnpiFDgy1PW4flUcw8TAgE1TAbQJldoJIWTrVeXSitaj7OjmsCGzKFCf59S0cDAi1NoWBmkoHQGTYtmYqzLxIT5yotgw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(316002)(54906003)(450100002)(8936002)(8676002)(4326008)(41300700001)(1076003)(107886003)(2616005)(26005)(83380400001)(6512007)(478600001)(6486002)(6666004)(6506007)(36756003)(86362001)(82960400001)(38100700002)(66476007)(66946007)(66556008)(2906002)(15650500001)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d7YJUkLQig5G065fWdyqC8RlDkOGIBdG+oiV0waxSoHHK8Kz0AJA+4hHRALW?=
 =?us-ascii?Q?fCcKSRbugCiq81N+z+QWkenwhwlhvzcyzfwfLmEGoalfCbRfOyDznGqLRPu+?=
 =?us-ascii?Q?t86df2zKfR70xaFZ6lv5Lp3r85oimMqN5intQ2s0nM9ZDGo+dYfc4Up/cX3X?=
 =?us-ascii?Q?37Doyw7khbahqpFuzjNGIycYwGntMPo16xP/Us+3o0c7VnQrb0UhzJ4c8oFS?=
 =?us-ascii?Q?BPp3yb93tnCMXZRUteyqOgDj2Sj791YUN8BCWO+PKyg5btOmn2tCVoVPZ627?=
 =?us-ascii?Q?kaY7BtMN9UpJQALX5bEBb/jkUDC0MOvXbwhIlhxhOoBC/h20bj0G7ebhmw0W?=
 =?us-ascii?Q?YUyF0REJ0WudHe326iaWbaGeAElE53knaLTcEhkcemfY5mA3wohfKca0GXPm?=
 =?us-ascii?Q?9cOslIEe/On42g7sVfqqlHKaUd2xkTsUzvYV6yPgWQ7qyCSazZbBTD6kpA9E?=
 =?us-ascii?Q?RCMMAhcvwzonFuJQBsHGprxIyDm+MYDzcdWNxA/cnqdCRjj42rHYJbbZ84DH?=
 =?us-ascii?Q?TE7DfBKKOsPidd74PG2nNd/Gn3S90PR59t7xVehLLcX2Bs2Bzya1o4f+rG66?=
 =?us-ascii?Q?29mq7zxnbwATLgv8HjqcArZM36Awg+L0XGuodePE5k0kaRZccY4OImqx93xn?=
 =?us-ascii?Q?2OAcPr5dNhSLOVtLe92NvWSgW9sRPwolxYVze3Fg0KprnygAoRNL2v/tUjz3?=
 =?us-ascii?Q?iAo8/VlxicF6aqHa+Hv5QC89jGg2tbBj9Uutm9SUDwBXokX4Zb/ITs2Ui5ih?=
 =?us-ascii?Q?OBCJ6iRS35GaywYdqOKNNhi+5NoSeJczrJ6vynuYnhgbtdsH8/zRdyu6TYJ2?=
 =?us-ascii?Q?77/pE3SYjDK8JEA71n0YFeoal1aDKrRXwAAfY8Rw9bcvnxyt+8FL/fRPowq+?=
 =?us-ascii?Q?90JiRG24m8amg1kEgLeuQLFZLPtTSMw1JbApLuOc/7fvkI5y/uinlejAYH+5?=
 =?us-ascii?Q?aMfMZzybd/uv5knBmlqqJwMesJI5DykJeYaMFjAcAGG/kdGO772jiqvyj3il?=
 =?us-ascii?Q?1xT7S7w05wPhG3ik4e0tJZiuhUIIyp1kuBaQmzVCQHNhoKh3po6DxRPZ/JJr?=
 =?us-ascii?Q?nkZYNdOywwdEVMe9Vbs5TJDsAfJRdDLRaF9G5HyC3DE2U0wollYxtAIJ3AXZ?=
 =?us-ascii?Q?7h3pQVTafLJIZtBaKf2/dHRe2a5e8dShcKoVr+feQoTpuLaRjYtRU8V5h8uQ?=
 =?us-ascii?Q?MDG/b6VUZfQygLvCrj7tmMXTKJtCRju0AHsdiQkJsbZzKJrM9YaNo6J7glBM?=
 =?us-ascii?Q?zW8sxgsCOWNBy0B4Cl7nE10cT7EoHu7+egsSbXK4LAGM8HdFYUkz5P1I9Nc1?=
 =?us-ascii?Q?AczTGD1GiPtpVNIYpq8y2lSbgs8oO1TcKhzknnfcd17cw/t108R+aLwYDxhi?=
 =?us-ascii?Q?20f5EvB2S91Dl5KRM1nXIqQs7Fje8QJURhsSO9N6zMMPv6SKVS7uDTL4omG0?=
 =?us-ascii?Q?W5TYdipZY0DGizI3oe3z5E8k5OpeVpVnxPLDXHRMrQEERIwHF6PJ0eDM7yg+?=
 =?us-ascii?Q?qOVqZuJJ0U1DEleaiiW8sFEf2e/Yz/vMqt3mIZHMpSQXErAmNPsrXFvkwUxV?=
 =?us-ascii?Q?iJnoYL0kJgjlKn+lYn4QwtOV79Xi/b6R2KSfaoFG4T4xhBmgyvxl6ldgqXlB?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0acc2516-396d-41be-cd0e-08dbb91c678b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:25.3244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RjQ4gAzirRBQdu6hTocYgutTEFIYXTC43fKgiXyEX1uHMfHT5CdeMepQxWT5oPhoh9nz8uyAbDS83y9f77dNyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 15/16] drm-uapi/xe: Align with Crystal
 Reference Clock updates
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

This patch only aims the simplest update as possible to get rid
of the ref_clock in favor of the cs_reference_clock, aligning
with the uapi changes on commit
b53c288afe30 ("drm/xe/uapi: Crystal Reference Clock updates")

This is a non-functional change since the values are exactly
the same. Any issues with current tests would still be present.
Any further update to xe_spin should be done in follow-up updates.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 10 ++++------
 lib/xe/xe_query.c         | 21 +++++++++++++++++++++
 lib/xe/xe_query.h         |  1 +
 lib/xe/xe_spin.c          | 11 +++++------
 tests/intel/xe_query.c    | 31 ++++++++-----------------------
 5 files changed, 39 insertions(+), 35 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 7fb6c1f72..090144c92 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -248,8 +248,8 @@ struct drm_xe_query_mem_region {
  * relevant GPU timestamp. clockid is used to return the specific CPU
  * timestamp.
  *
- * The query returns the command streamer cycles and the frequency that can
- * be used to calculate the command streamer timestamp. In addition the
+ * The query returns the command streamer cycles and the reference clock that
+ * can be used to calculate the command streamer timestamp. In addition the
  * query returns a set of cpu timestamps that indicate when the command
  * streamer cycle count was captured.
  */
@@ -266,8 +266,8 @@ struct drm_xe_query_cs_cycles {
 	 */
 	__u64 cs_cycles;
 
-	/** Frequency of the cs cycles in Hz. */
-	__u64 cs_frequency;
+	/** Reference Clock of the cs cycles in Hz. */
+	__u64 cs_reference_clock;
 
 	/**
 	 * CPU timestamp in ns. The timestamp is captured before reading the
@@ -381,8 +381,6 @@ struct drm_xe_query_gt {
 	__u16 type;
 	/** @gt_id: Unique ID of this GT within the PCI Device */
 	__u16 gt_id;
-	/** @clock_freq: A clock frequency for timestamp */
-	__u32 clock_freq;
 	/**
 	 * @native_mem_regions: Bit mask of instances from
 	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index b018c7535..81d661607 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -328,6 +328,27 @@ bool xe_supports_faults(int fd)
 	return supports_faults;
 }
 
+/**
+ * xe_query_cs_cycles:
+ * @fd: xe device fd
+ * @resp: A pointer to a drm_xe_query_cs_cycles to get the output of the query
+ *
+ * Full DRM_XE_QUERY_CS_CYCLES returning the response on the
+ * struct drm_xe_query_cs_cycles pointer argument.
+ */
+void xe_query_cs_cycles(int fd, struct drm_xe_query_cs_cycles *resp)
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
 static void xe_device_destroy_cache(void)
 {
 	pthread_mutex_lock(&cache.cache_mutex);
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index da7deaf4c..da4461306 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -102,6 +102,7 @@ uint32_t xe_get_default_alignment(int fd);
 uint32_t xe_va_bits(int fd);
 uint16_t xe_dev_id(int fd);
 bool xe_supports_faults(int fd);
+void xe_query_cs_cycles(int fd, struct drm_xe_query_cs_cycles *resp);
 const char *xe_engine_class_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
 
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index b05b38829..986d63cb4 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -16,14 +16,13 @@
 #include "xe_ioctl.h"
 #include "xe_spin.h"
 
-static uint32_t read_timestamp_frequency(int fd, int gt_id)
+static uint32_t read_timestamp_frequency(int fd)
 {
-	struct xe_device *dev = xe_device_get(fd);
+	struct drm_xe_query_cs_cycles ts = {};
 
-	igt_assert(dev && dev->gt_list && dev->gt_list->num_gt);
-	igt_assert(gt_id >= 0 && gt_id <= dev->gt_list->num_gt);
+	xe_query_cs_cycles(fd, &ts);
 
-	return dev->gt_list->gt_list[gt_id].clock_freq;
+	return ts.cs_reference_clock;
 }
 
 static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
@@ -43,7 +42,7 @@ static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
  */
 uint32_t duration_to_ctx_ticks(int fd, int gt_id, uint64_t duration_ns)
 {
-	uint32_t f = read_timestamp_frequency(fd, gt_id);
+	uint32_t f = read_timestamp_frequency(fd);
 	uint64_t ctx_ticks = div64_u64_round_up(duration_ns * f, NSEC_PER_SEC);
 
 	igt_assert_lt_u64(ctx_ticks, XE_SPIN_MAX_CTX_TICKS);
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 17215fd72..872b889f9 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -280,7 +280,6 @@ test_query_gt_list(int fd)
 	for (i = 0; i < gt_list->num_gt; i++) {
 		igt_info("type: %d\n", gt_list->gt_list[i].type);
 		igt_info("gt_id: %d\n", gt_list->gt_list[i].gt_id);
-		igt_info("clock_freq: %u\n", gt_list->gt_list[i].clock_freq);
 		igt_info("native_mem_regions: 0x%016llx\n",
 		       gt_list->gt_list[i].native_mem_regions);
 		igt_info("slow_mem_regions: 0x%016llx\n",
@@ -488,20 +487,6 @@ query_cs_cycles_supported(int fd)
 	return igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query) == 0;
 }
 
-static void
-query_cs_cycles(int fd, struct drm_xe_query_cs_cycles *resp)
-{
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_QUERY_CS_CYCLES,
-		.size = sizeof(*resp),
-		.data = to_user_pointer(resp),
-	};
-
-	do_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
-	igt_assert(query.size);
-}
-
 static void
 __cs_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
 {
@@ -544,29 +529,29 @@ __cs_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
 		ts2.eci = *hwe;
 		ts2.clockid = clock[index].id;
 
-		query_cs_cycles(fd, &ts1);
-		query_cs_cycles(fd, &ts2);
+		xe_query_cs_cycles(fd, &ts1);
+		xe_query_cs_cycles(fd, &ts2);
 
 		igt_debug("[1] cpu_ts before %llu, reg read time %llu\n",
 			  ts1.cpu_timestamp,
 			  ts1.cpu_delta);
 		igt_debug("[1] cs_ts %llu, freq %llu Hz, width %u\n",
-			  ts1.cs_cycles, ts1.cs_frequency, ts1.width);
+			  ts1.cs_cycles, ts1.cs_reference_clock, ts1.width);
 
 		igt_debug("[2] cpu_ts before %llu, reg read time %llu\n",
 			  ts2.cpu_timestamp,
 			  ts2.cpu_delta);
 		igt_debug("[2] cs_ts %llu, freq %llu Hz, width %u\n",
-			  ts2.cs_cycles, ts2.cs_frequency, ts2.width);
+			  ts2.cs_cycles, ts2.cs_reference_clock, ts2.width);
 
 		delta_cpu = ts2.cpu_timestamp - ts1.cpu_timestamp;
 
 		if (ts2.cs_cycles >= ts1.cs_cycles)
 			delta_cs = (ts2.cs_cycles - ts1.cs_cycles) *
-				   NSEC_PER_SEC / ts1.cs_frequency;
+				   NSEC_PER_SEC / ts1.cs_reference_clock;
 		else
 			delta_cs = (((1 << ts2.width) - ts2.cs_cycles) + ts1.cs_cycles) *
-				   NSEC_PER_SEC / ts1.cs_frequency;
+				   NSEC_PER_SEC / ts1.cs_reference_clock;
 
 		igt_debug("delta_cpu[%lu], delta_cs[%lu]\n",
 			  delta_cpu, delta_cs);
@@ -637,7 +622,7 @@ static void test_cs_cycles_invalid(int fd)
 
 	/* sanity check engine selection is valid */
 	ts.eci = *hwe;
-	query_cs_cycles(fd, &ts);
+	xe_query_cs_cycles(fd, &ts);
 
 	/* bad instance */
 	ts.eci = *hwe;
@@ -666,7 +651,7 @@ static void test_cs_cycles_invalid(int fd)
 	ts.clockid = 0;
 
 	/* sanity check */
-	query_cs_cycles(fd, &ts);
+	xe_query_cs_cycles(fd, &ts);
 }
 
 igt_main
-- 
2.41.0

