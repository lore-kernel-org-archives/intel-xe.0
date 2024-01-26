Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7401C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:31:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF79110FE62;
	Fri, 26 Jan 2024 20:31:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EF410FE62
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301062; x=1737837062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fPcI9Ghm1Lzl22Q9jlG/Sc6K4oa9WfpLCXDhNE8I9q0=;
 b=I8VZyj23fqmYQXTrDzgJ8TPq4EB1AVgeigQQ1Y2hBAOrmUa+D6JGRLJI
 AI0q/FDVNdkvPxqUokUpTS/eVIpHTFK1ojkZTLqk+AxXLAmLKrVQVfxf8
 xH0NpQjmhI8poztChYUAGYBCWfW74q0gU+a+rjl/cSAT7zS9XybLQsJZJ
 cxQJ5P5w6zfH84oE2KKtuR+2iscxFVZSvYOhg7aNZpH1LTaGT1khDNhVj
 qkPg7x5tJlkbRwdXdOgCDjiPIxK4cQsW/Pr28CRFeXUc66lK56rTSX8AW
 +7HTVdDzqAyRbVhNqluH2tC3JBFK60/h3SjwaScBDsVz9dcbfNPzq2MaE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2406139"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2406139"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:31:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="930456034"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="930456034"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:01 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:01 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:01 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNWH0Oyp3ZUdHUnl6C0HTYemG28ESn2iWfwYH/7mi7c1btTI0wnYsL60bZ9GjIslAHl/BY7nFW4f9laleq7/E/h+QHd1vpUyiW1h01zWU3aQVBW0EJT1oTLdVkjZweNeKYG1ta3IcihXgnermrCAPC4ETaJi+3dg2Y9dqEUjANmFyqU/dRxu4r6JmPm5CGDnpkaTgEZpRj9TLQa53Q3seIVecA/WS3UdcgsLeP8dMqBOwOdXqmiWgK+KmTI+XWzyQfFR6apIANc5GDxIbbMcYu0k3KvspdR+BWyuxrnpbvXRiBwPGnt9WYfiyld6rvWGAlu+eE1Qy4MtXBqcd/mkrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/L7hTemb5+Y6OVft3LKP1hXbqIrM8ByeQxKOXSWtOA0=;
 b=Vbpna6LBElcBhTVFsd9kAldNWa7xi3zq1o+SE7kpXWVehHt3LaaZduP8u0YnzB+iGeG9vFwH3KBGy4f93Zaze2UcjQ7ha1dIDPpu+OlkqWi8ehVRWwnH4EJNHFSezOHOgUw59bWdwFeHB+AheZ8ExRRu47Uvwe0ovRnJvXwFHidhecRbsW6I/ZgUhRhrlCwUAP8mZfLlaH1RRhIaffmaMIyz1rz2xR6sWR0XYui1uSy6fIrrr4dCRyRB7ffhb6QVMXrAswFHc7kWpxJWvzjOnJElDcLoK3WCUGyTti4N+yY1BLpHFVTLEqBBNydIdDx+jRz8kXIrVaLee01vG4rr3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Fri, 26 Jan
 2024 20:30:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:30:59 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 04/34] drm/xe: Create a xe_pm_runtime_resume_and_get variant for
 display
Date: Fri, 26 Jan 2024 15:30:13 -0500
Message-ID: <20240126203044.1104705-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0034.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 11f22696-d6a0-487a-06fe-08dc1eadb49c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ws044XKMoEszyco4UOAIIT5O9nT0UQYVULxcdKm/KVTtAGRZNVxPIcfWEBjgkgzNKGEwI1auzn4dik45xbgBVA67vQ/zoobiiZZ6Shark7zp+Wtwb911UHxxrzFU0hrjxEZBLCZvhfvR50npOClFSmy4wPJrLtpwLbX5DSEcpPdrMbIo0zSEnvWXMY0OVMsF26bCe/PXP/veKmmZy1glmjUCtvPojB5Ptfmrj9orbr/aoWkzrsXjvssQBuzIvr7bEJqo7FpRp5v94pp6lK8u308rkITYyZ9YWnZ1lQC4TUAqKxAdn3PDeuWN3U+pjgO95EmWBuChNtmEAVbpRYYBua5RTxUMJlaa5Lr+i0JX2LvpunDYl6DyFcmev9mDu/G/1ig0HjFYREu6zwH5QbiN1JjUXU78pQxzQCujeLAmwMnijhZJPmY27A6PweOVFQM0dfwgslEPdwpX0xcBDprcq6yb0iXtW4WOT6bkDlhcuxNTEXKF9uW529tEGhetYNd+tdV81pESP+QVrHg/fFgajUXhmteuciflLLG+URz3MVgw3RAeIWP8xV95Fzo6CbN9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(83380400001)(26005)(107886003)(6512007)(66946007)(1076003)(38100700002)(5660300002)(44832011)(6506007)(2616005)(2906002)(4326008)(8936002)(66556008)(8676002)(66476007)(6666004)(478600001)(316002)(6916009)(36756003)(6486002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H6s5U3I4dBIiJeyITpgjIdj+AX6VGv6HhNjUktGPq//9Nzo2SUcE6vkrPbKC?=
 =?us-ascii?Q?YdEmOjzkT+10O61VNalwv6Ltvj5var3bqL4qpKIxnnja/wxdNok6puqC9Twd?=
 =?us-ascii?Q?v72B2lhXeXj0NrkkIgVbIT++M0NV8BAeteL5kzI30CF8Hv1Dq+3fTF5Cs6el?=
 =?us-ascii?Q?E1lNjki3H+5styGhacrTheGVDcLOzkB3fQLXWZSFTCaNQJUWHpBfUdMSkcQ/?=
 =?us-ascii?Q?T0nustJd7t8n8E4HnZx88200vlVvKoLPhObG0ar6EL3JWf6wN0O/8+4SJI05?=
 =?us-ascii?Q?p7HLwDZUau4qQrvYzZPaLi8FXlKoc/WcZv43ilsAjz+kb2IpFmpYREoA2b4c?=
 =?us-ascii?Q?dAllgiC1KajSB6+5TmywjH9IqwTThcTYO85EsEXVwgj0eh0QuUpVki1bEiBR?=
 =?us-ascii?Q?zTkov3x2wcMT8TnEeZA6jA+3TSYS84jjZwD00BHdqgCZF6Ljg8icyXtYRQ9T?=
 =?us-ascii?Q?sk2lM+kO+YrIE1W1p6XrsYyBnAeYsTbnlLe8Frtqa3OYoRkfs9GcVgHQNXBw?=
 =?us-ascii?Q?WGsb0XdgBFAuzXQ0nUP57UAVL+SEMsZAueckWe6+rKte3rOdE5dfE7XxBgJV?=
 =?us-ascii?Q?CXDB+gPus74IlEnqmN+JezM3ZeSxNMTHKIPHlkI3DKc2/8H/Pxpq8/mrf1hl?=
 =?us-ascii?Q?tUrwVfJ/WY2KW3RiglAshr7iVU//Bj0gDtnmRK1bczEJ1a3YgOR2z6mABpzM?=
 =?us-ascii?Q?Ypy7yazzjn+tSU1Tne/gTnx2+dAHNg6oxebAw1F4SeTw+F3At+OuF8YWybaq?=
 =?us-ascii?Q?N7XEFtctGOfBoRNEbYM8gn4imCZRMpWAipVJ7nwMKDdkbeBjCTp8qDd1B++A?=
 =?us-ascii?Q?HBFuTdIo8NUQ/FZW9usxCDONKmSQhn12ojp140lxnnvFKfYMGKkQ5Lu3PiRx?=
 =?us-ascii?Q?qSl+qZ1i9jCbZG+YnnbhytY2qz+56M10Al7EJtA3fKwkl+wqinRXJPTazdhY?=
 =?us-ascii?Q?chuLXbYvMN0g442urNGYzybv141ECHNvJ+K28yY5OCw2QTqJVxR5PqQDvITt?=
 =?us-ascii?Q?CDkbd/nxcG0vz8PBd1m7oT+aJpNsc+QTTsbsE70tteXJtyOnZ8TPy4x7/VaD?=
 =?us-ascii?Q?TcH6tZTaJv7twbfSdxAj+46BDzBDlpVa6YbvSLOeExo+0QwS8KvZHXWLYyg7?=
 =?us-ascii?Q?OA80MeQKVPgQYmEmkI/e6ELSMWI6NTPwcHuaOTsvBu2suQH+XELOX/g6pNvF?=
 =?us-ascii?Q?IEPpIPaA4zlCPATBxrTz3Rj6JDdyX8RbnuOHddBEhwHkd8hDO7jzD0ynezBi?=
 =?us-ascii?Q?gbirF1Wnk/U8vKaZfx71VPibK+ZjtG8xxB+ALEHMECPe1xLLxDWs0asmY5tS?=
 =?us-ascii?Q?YqshHBCqbsM0usN3PwWLKSokdfEy0JmUMPXGZX6YMvWU1j5wvDSWnl05oSPJ?=
 =?us-ascii?Q?ZXUZC7A/S+Db3I5sMlMX/3Tce/HLy3h0cxr9VLbusy0WTpAJiw/gl+8nEiLB?=
 =?us-ascii?Q?6EvGo+f+4QV7NENiXdMp+KesvnewSBDEBKY/pl98Y203Rb6ppOykYT27dJnJ?=
 =?us-ascii?Q?mhxFQrUuHUHSTk9D6fLLMVWTU3IR8Oih96fkJ6nKyq/VZ0aGwI0w5SHt6wb0?=
 =?us-ascii?Q?GUAfUOAs2w7Vu4l0o3/9vnKsSRgSaFj/3c9PHytx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f22696-d6a0-487a-06fe-08dc1eadb49c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:30:58.9873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zB3dBneT0kUkIvF5ZzROsz3AiVaAmeEOKBDrbF4ZYKnEonWjbGepQ3peSOiyE9WFdJNKRVBinShEqL6w6zXocg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8700
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Introduce the resume and get to fulfill the display need for checking
if the device was actually resumed (or it is awake) and the reference
was taken.

Then we can convert the remaining cases to a void function and have
individual functions for individual cases.

Also, already start this new function protected from the runtime
recursion, since runtime_pm will need to call for display functions
for a proper D3Cold flow.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h   |  6 +-----
 drivers/gpu/drm/xe/xe_pm.c                      | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h                      |  1 +
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index ad5864d1dd74..fef969112b1d 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -166,11 +166,7 @@ static inline intel_wakeref_t intel_runtime_pm_get(struct xe_runtime_pm *pm)
 {
 	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
 
-	if (xe_pm_runtime_get(xe) < 0) {
-		xe_pm_runtime_put(xe);
-		return 0;
-	}
-	return 1;
+	return xe_pm_runtime_resume_and_get(xe);
 }
 
 static inline intel_wakeref_t intel_runtime_pm_get_if_in_use(struct xe_runtime_pm *pm)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 19f88cb7715b..2264276dc431 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -434,6 +434,23 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
 	return pm_runtime_get_if_in_use(xe->drm.dev) >= 0;
 }
 
+/**
+ * xe_pm_runtime_resume_and_get - Resume, then get a runtime_pm ref if awake.
+ * @xe: xe device instance
+ *
+ * Returns: True if device is awake and the reference was taken, false otherwise.
+ */
+bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
+{
+	if (xe_pm_read_callback_task(xe) == current) {
+		/* The device is awake, grab the ref and move on */
+		pm_runtime_get_noresume(xe->drm.dev);
+		return true;
+	}
+
+	return pm_runtime_resume_and_get(xe->drm.dev) >= 0;
+}
+
 /**
  * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent bridge
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 9d372cbf388b..59aabb44a350 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -29,6 +29,7 @@ int xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
+bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
 void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
-- 
2.43.0

