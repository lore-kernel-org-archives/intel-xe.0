Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98481C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 18:55:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5524810E781;
	Mon, 13 May 2024 18:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VnciyqhT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8CC10E167;
 Mon, 13 May 2024 18:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715626554; x=1747162554;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=HCY8qJXuWL1C46KDQblE51oQObDlgf4su/jemGYkVM8=;
 b=VnciyqhTr+x1kY1i81g/3WkyC5apTGvaDrmO+EdZ6WkKHaM8aSFXi3UE
 bSBpOgVEup1H5WMaes4kPk6lu6BesuOyLZ7FDp8G+cLf12csPETagNTz8
 c/3QPH0e2OxgGe5jHQVOInOSXzm00/tlRzSVHERqedjLzvp8/tTWdaYQg
 K1vrB2cAJT6ASglj2SwE1GNLWufYq8GSUFmo4i4hYTALxWJquilslMI0X
 h7bR1RyqLZnUr1NYenqjr1RLvLsKHMI6Zo7Iuu2iv7Gq3hh5qWs/NBbQp
 e7vZ3nwQmiu6YdvPLGx2SxCcvwNXhWwpvmCMGlR6tzDE/PH+oeWRjTkhx Q==;
X-CSE-ConnectionGUID: 7HGkuqP1TZOXkk566fOXQQ==
X-CSE-MsgGUID: EvxVCJcqSFmNa7TAM9hp6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="36957170"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="36957170"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 11:55:53 -0700
X-CSE-ConnectionGUID: SItECqRaSxKk1ZSPJYwQMQ==
X-CSE-MsgGUID: MN1uNT8RTrm452KnlF8x3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35311477"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 11:55:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 11:55:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 11:55:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 11:55:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Keqd6u3iw6QnnrjX4oG/Ms8GzQzcttw57lgLLGvL1BNuPq71tGry3jItLoa8ZVeyV/OBUTZJDfvX7rklID75UzaVz8Dt7f8ZVVpGcNS2FR9kP7sd140arEtPJzdlzRexdylCDjCfx4Aw/NAC3d8YE90BcReKRSBdAQG7zr3XvgEINrSg2f5KlhvGCqsF457r8jXYBfpdy9S5lnwLz53p+t6eKKuN/JW93QXGwhgeuSDGrF0461/LAwyxJBcXxkQrai84xGSHqMKxr1WJNwWODW2jJwr5OxJb015L84zUfMs+OCGFPtCWmS0+mneMblNhM6/kzAeOHqs71wq2HnqW5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cS4bbguu70eQ4a0LJ7hHk3RB5gF7lc/VUHKNYY4CCvc=;
 b=oW6cLUKHLYcaLh8YYW5lysDpx1uaqwA2y86+Cr+KYa5lbaaE6uQgKGnKeYg0fcnIfvMKMu4nytFMffhOmVj4DaAJqKfcIhElza2Pt+CB7gdTzcXQANYivscpWJZs6uCQkgbwX5+YwSJlsHE0+32Rw/OjrkO5E+bHnGqxiTuDTDzGjpMIHIaJ1vxcrszmG5MYTkxMFSFVtohnP8o6Fs0qv7uI9DsbkKVgsmrKkbwHZnFWOj5pfEcoqopCVVrhBcusgUk1JN5t6qX+UPKlrSX57lH44VFIEJQiAbifhh2jJL9JVeYjZuuadgHNSSWQXPeupIDWbz0U1zOPfL3QN8JMIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 18:55:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 18:55:46 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/5] tests/intel/xe_pm: Update runtime pm conditions
Date: Mon, 13 May 2024 14:55:14 -0400
Message-ID: <20240513185518.772398-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0313.namprd04.prod.outlook.com
 (2603:10b6:303:82::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b4da4b7-63e5-46c4-5072-08dc737e4c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UK/7OFAKRRqbSvrDX5Q9r65B0S1p8KY3110bC7tLRG8gqlOgrAmFHpWbJ7Ab?=
 =?us-ascii?Q?4td3vjL81ugCZUmP2y+u/gFLdE4Lcp0Uwan1YOEZNeCzyJ1pYY/Xq4ODRMGp?=
 =?us-ascii?Q?6T2Kfz96V2leDLpXYmr9RtUOxI3fKMe/1+PRu1hFGz17VonY9YO6lMs6bN2l?=
 =?us-ascii?Q?B4N425SJURcN5sgKmTFKJUCckCjD9oLg7giMenC1vw+XRAgy7o0soZKBFpzr?=
 =?us-ascii?Q?PPDpi+/YPJu1sNbHAG4pcUj/qjXpL/VlMYkWr1fOLSzOCeu+Id0+fwq0s45B?=
 =?us-ascii?Q?Jl/2nJGpHQUkWhZTWJfPAqXeTstGpztdGgNUcCe7MDVmjFg7/Ie/a6PN5Ttb?=
 =?us-ascii?Q?xecwAc2lKxgCHDxLftuaeZEKQn8bVval/Q5S5X9ke5iTlxRXCz1LehYrWUVa?=
 =?us-ascii?Q?H5bI+G87GA/igtz/4URQnyLaBNxRz7TD2D89B+uqUC98zjTjWkw879+p4llg?=
 =?us-ascii?Q?Z5GQ9mhqHdBZ0pNQTRpcUEfRDpc0yv8y8aBadOS/lmo47EFvTn3HRkrWqsHP?=
 =?us-ascii?Q?ZCSekY+PyppACtypg0q4XMTbiNiyPFJfhfkyitMzZkBsfLCInqV8EjCbiSEG?=
 =?us-ascii?Q?pq5y0NboOJbs4VMqpZNKpRXuz+o5BK7J89unTZNRSyp+1nlNI5sK9tB1+6eG?=
 =?us-ascii?Q?SJom76TAagbDVNTMPAg0sThBSG4RpppM5T9/4dxUzbht8ulJ4+nYjYezeRn3?=
 =?us-ascii?Q?MVdpoYKNh36QtaVZ9rzFRdPWCHva12kCVsJUt2+GjRO/udv8scbvCy8UhUZC?=
 =?us-ascii?Q?/77X9si2UltNIidnE58mtx7Csw43ROY2/RTpVHFJGlexJP1EImK3tN457tXI?=
 =?us-ascii?Q?wLftU5RuNOYtT4saEh6P9j3Ttzm2e44x6fJpB8C+bAASlNNM2o9W/yLahxGy?=
 =?us-ascii?Q?GZp1VPrAaNcG/xyYO57xVfYPsJcJ9cCw714rnOowAQe5QB9A6RVoUGYRNqzR?=
 =?us-ascii?Q?b3GLyzRs+xx12ZV8kcX4gudK7BzYbo2i6JfcbGW5GAPKx9DyRLz5NL4MJsz1?=
 =?us-ascii?Q?R2epDT+tEqzNDhtKqTrdooOzwfl3OItJlJr+iZjzPKlH+BAbhJ6MUf09h6Jo?=
 =?us-ascii?Q?/ea+GuXMlsoWcDduCrlWr/mLFRi2fBqZPwZOcc4gFJPqODw72o3gbk3cZYov?=
 =?us-ascii?Q?vnLa0qniM6Y6f9nxC6RC2ZZxm5wJlRIesx76AGDiD2EfLQ1brlQC8C5UmvKe?=
 =?us-ascii?Q?+QkzcEme9VkDXUFiad9Z3AtxTyfLCS/KfyQN20EwKcDkKMNuTM7dWHLt/2Nl?=
 =?us-ascii?Q?CDyTKQ8lmjVLPWdMlaT14okCAoAvWkYKBqtWKFy2Bw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YXZB3hjg8rwd2vd9NQP9ks6cxG2zbpXZQCFCuVIxqaolrTZ5mE1W6b7ZwHOv?=
 =?us-ascii?Q?nXpy/4kVAig1GhXwsqymGxm9XOZYP6CgNo0cHWnopw0OEHvn3nFGf+F7CFjJ?=
 =?us-ascii?Q?fqUor/wFDgA1nKImHpnh/rawqwn6+nRaeitbzbNYXKfeFCuSQSv5te1PXW4S?=
 =?us-ascii?Q?tldQG45A+nW0HQkDwJpWbm2MQIag7qBeA+85DDzonoAhfcCEbzcp8dIZicGr?=
 =?us-ascii?Q?CiZijUa6jA3Q2HOEkjbUtI9jSMD10wr9lQo9LaOX/gnCP1RbPgo/KzzbmL7H?=
 =?us-ascii?Q?ek1iow0wBF0tNrlehJVadqnhqNJsB5lHFweV6n5vUmdomcnmE+LLck6CH1iI?=
 =?us-ascii?Q?Arq94E5YUid/2V2WCjZLjJ6CXPXYklhzMWu2n3VuydgcnaueSxBU2gLY2Hsd?=
 =?us-ascii?Q?ZdReN3oVSi0aJvjXjV/e4pVduiFgMcFixBKYop/bK+11iI8U6GPnuO+KW+Ju?=
 =?us-ascii?Q?/oSP2lXOmEs7jyNFcoZ1EukKLmSl6A2UNpNXfPv7tNFlyHSpofHm3uqcaxBW?=
 =?us-ascii?Q?E53OLeu9Z6yU2W+ZocszN8J4pAJRerpOuJddrWBn7N7L2ntNFqgpQXapwJfj?=
 =?us-ascii?Q?c2LpfNYZHYo2PAMqDK5qhDxvEIHfcEEgsCKImLO7OGzdQiyI7x5LRAPBeaqo?=
 =?us-ascii?Q?9WUjN/dNEMLO85rL7rPS6f2UablxrC3xq1lNGW3QP+8HEJHt0Ttrbyi7CDhi?=
 =?us-ascii?Q?PMeyju5GQfyrD1lo9kA9GsHAmhslEWGpwQeWalawq/Qi3wrMYtbo9RV6FO9a?=
 =?us-ascii?Q?sapbzGPdhxUN0rn0zgFTQyzOBaNgzBPgwEjh53C8nQG9WKvARHOVr2/cl2tD?=
 =?us-ascii?Q?O5HPrnnxe2CZbkAZFZ4NrqJgUHUqHqyQAADiWh2B+wf64jO2qUfzFWD2g6xi?=
 =?us-ascii?Q?PBDje5GGJqIp/7gk9vI1R5hbAwmeF8riUfgm1KEaweL2gu/D37bjA6+rMV6P?=
 =?us-ascii?Q?Lmr1NSnsN9YK1r2k/TmtzoB6CCqiWibXZjp9lMmgB4+N3V19An5Bz+DbpX/e?=
 =?us-ascii?Q?omiP/M77oay+vjou5gO+3y8fhbKm8huyRMSbhJ/L9aPc3UWph3bdTYXBSvP6?=
 =?us-ascii?Q?nDTUbiszMKmlFTytgc1acTAn20oEPJH3tZ6FoHhgreKBnAnbq3jRi7nLUNo3?=
 =?us-ascii?Q?F0y1qp67/8Qsk87yqMDDuBHKoGFehF94N6s6SHSWTXICzBMgAtHfIHXLLj6o?=
 =?us-ascii?Q?KUBC8nngw857a65D33vW3JAjm30rqBYct4yN51omzXrH/Ha59YO3ueSh7dNy?=
 =?us-ascii?Q?XG/rpEM3g4BER10LTyJT1fhlyfph/wEZv8qtRlfhm143XaMEOYkQwImKut3M?=
 =?us-ascii?Q?Xo9of413u2Ko+neU68PS0MyEOLNXYN1kCgcly7ku3DcznAhHuOhiReBObbAF?=
 =?us-ascii?Q?nXKXZtIkKRVpIgkGFEjJwkWdBV2zUtg32E13PsKGchEDhmJGWAPGhOQzyrR2?=
 =?us-ascii?Q?M0+J9ba8nevWwup9PUsODSk2smifVg21J44gJNQrEelM16TLHRW5poaCHIK1?=
 =?us-ascii?Q?CRFoF16y1jA/hhAaDy2rMKujICly0QBZ2Q96U1ShT5dLKqd8AacKMIUvQ5R6?=
 =?us-ascii?Q?CYFIWapHl2C6T4/DRGfMWnnajYvo2kHvO0X8eVYQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4da4b7-63e5-46c4-5072-08dc737e4c19
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 18:55:46.1958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NH+1jS7KpCgntur2TjOVUrbxsK6MJlgamWTlA0q1JdehOAbf5Em+AG4XG/Kk25TComNrhjo3oJPdBBGdyYPbHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
X-OriginatorOrg: intel.com
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

Xe is no longer holding a runtime pm reference for the life
of a VM or exec_queue.

Also, IGT changes autosuspend time to a minimal time, so we
cannot guarantee that rpm is still suspended after the execution
has finished.

So, the reference usage is not a reliable reference.

Hence, start using runtime_active_time as the indicator
that runtime_pm resumed upon our actions.

v2: Usage of runtime_active_pm and inclusion of mmap tests.
v3: Add doc for the exported lib function (Kamil)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c        | 24 ++++++++++++++
 lib/igt_pm.h        |  1 +
 tests/intel/xe_pm.c | 77 +++++++++++++++++----------------------------
 3 files changed, 53 insertions(+), 49 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index fe7692960..928b72685 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1412,6 +1412,30 @@ int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 	return -1;
 }
 
+/**
+ * igt_pm_get_runtime_active_time:
+ * @pci_dev: PCI device struct
+ *
+ * Return: The total time that the device has been active.
+ */
+int igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
+{
+	char time_str[64];
+	int time, time_fd;
+
+	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_active_time");
+	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
+		igt_assert(sscanf(time_str, "%d", &time) > 0);
+
+		igt_debug("runtime active time for PCI '%04x:%02x:%02x.%01x' = %d\n",
+			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
+
+		return time;
+	}
+
+	return -1;
+}
+
 /**
  * igt_pm_get_runtime_usage:
  * @pci_dev: pci device
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 91ee05cd1..b71f7c440 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -94,6 +94,7 @@ void igt_pm_print_pci_card_runtime_status(void);
 bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
 bool i915_is_slpc_enabled(int drm_fd);
 int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
+int igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
 
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index e81a75d88..3f963bd9b 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -184,34 +184,6 @@ static bool in_d3(device_t device, enum igt_acpi_d_state state)
 	return true;
 }
 
-static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
-{
-	uint16_t val;
-
-	/* Runtime resume needs to be immediate action without any wait */
-	if (runtime_usage_available(device.pci_xe) &&
-	    igt_pm_get_runtime_usage(device.pci_xe) <= 0)
-		return false;
-
-	if (igt_get_runtime_pm_status() != IGT_RUNTIME_PM_STATUS_ACTIVE)
-		return false;
-
-	switch (state) {
-	case IGT_ACPI_D3Hot:
-		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
-						      &val, 0xd4), 0);
-		return (val & 0x3) == 0;
-	case IGT_ACPI_D3Cold:
-		return igt_pm_get_acpi_real_d_state(device.pci_root) ==
-			IGT_ACPI_D0;
-	default:
-		igt_info("Invalid D3 State\n");
-		igt_assert(0);
-	}
-
-	return true;
-}
-
 static void close_fw_handle(int sig)
 {
 	if (fw_handle < 0)
@@ -326,27 +298,27 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	int i, b, rpm_usage;
+	int i, b, active_time;
 	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
 			  d_state == IGT_ACPI_D3Cold);
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 	igt_assert(n_execs > 0);
 
-	if (check_rpm)
+	if (check_rpm) {
 		igt_assert(in_d3(device, d_state));
+		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+	}
 
 	vm = xe_vm_create(device.fd_xe, 0, 0);
 
 	if (check_rpm)
-		igt_assert(out_of_d3(device, d_state));
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(device.fd_xe, bo_size);
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	if (flags & USERPTR) {
 		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
 		memset(data, 0, bo_size);
@@ -384,8 +356,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
 				     bo_size, sync, 1, 0);
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
+	if (check_rpm) {
+		igt_assert(in_d3(device, d_state));
+		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+	}
 
 	for (i = 0; i < n_execs; i++) {
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
@@ -429,9 +403,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
 				NULL));
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	if (n_vmas > 1)
 		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
@@ -459,15 +430,13 @@ NULL));
 		free(data);
 	}
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
-	if (check_rpm)
-		igt_assert(out_of_d3(device, d_state));
-
 	xe_vm_destroy(device.fd_xe, vm);
 
-	if (check_rpm)
+	if (check_rpm) {
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 		igt_assert(in_d3(device, d_state));
+	}
 }
 
 /**
@@ -561,10 +530,13 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
 	uint32_t bo;
-	int i;
+	int i, active_time;
 
 	igt_require_f(placement, "Device doesn't support such memory region\n");
 
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
 
 	bo = xe_bo_create(device.fd_xe, 0, bo_size, placement, flags);
@@ -575,7 +547,8 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
 
 	igt_assert(fw_handle >= 0);
-	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+	igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+		   active_time);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		map[i] = MAGIC_1;
@@ -585,22 +558,28 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 
 	/* Runtime suspend and validate the pattern and changed the pattern */
 	close(fw_handle);
+	sleep(1);
+
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		igt_assert(map[i] == MAGIC_1);
 
 	/* dgfx page-fault on mmaping should wake the gpu */
 	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
-		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		map[i] = MAGIC_2;
 
 	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
-		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 
-- 
2.44.0

