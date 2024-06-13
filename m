Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD47FC27C79
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 21:47:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61EA210EBBC;
	Thu, 13 Jun 2024 21:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vh/hge/y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9041C10EBB6
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 21:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718315251; x=1749851251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WAizhajWVmaLuy9UNweiCsRx6P+U/qsTxB/x5wPR8kY=;
 b=Vh/hge/yh3gzJWYl2Vv46vyKIQ9VsV+71/r3orD37MBQ5zbGQ9qp+jgl
 h4/DSqGMjveJD+ifbjIPIwVGcMfJ7JL49xJ5rBjOeYogjGpviYQ+CFw6O
 nYx5vEkmJhIw1TtcpE2VIfkwLKkdiiK8wDTltcP5IJZtqgk4FbNPNwRvv
 F4kp8iwS7TUdY4w4FW0b2Ewhl0rf7DTagm5UDOXmt+pc2abZ2s4xzgJb9
 khMQqEQD/9d+y/Ysk7yJsE1XSY1YnEg5juq51zd4XqFaV280VKsx5RUPB
 xLsexjo0lQQX7DIBh+Z+AiEecoQt3lCXpw/XQoOYJ4CGCbaylQrvlvJTF w==;
X-CSE-ConnectionGUID: s1+KoGzzR9uDtvLyXJd0Mw==
X-CSE-MsgGUID: 7Ud571PQT3eYI3op41G6dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="18101737"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="18101737"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 14:47:25 -0700
X-CSE-ConnectionGUID: gwB+rvFCQ9mU95K9aQTJyA==
X-CSE-MsgGUID: qrF7jOF1Qc+YvzpiwceQVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="45206820"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 14:47:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 14:47:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 14:47:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 14:47:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 14:47:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OijiLytkWi78qroasYGzqZryh3EwXq0jDWa+Nwzqc0fOl35E4iyj/He/hRZt5jGsD8uqOCEIJEYOn4MnNXPny3n28DpEM0gTYAHm7pwsMEIMw+F1YrdBSrWRManZzqgDypY6N1y8IOA7f+La8IMW6kD0F3gIL/F8bLpFcHjEns6kxb7hTdV+oClk08ylwuUAUNFrfRHMvGIZ+CIt2+3QWnx3OVBeKlVyAWT5VQZPCW+CNrrxWbUcH18ih5RLdx1gUxiwEVcu2HjUHf8qgU+pxBNXAA871CT4FEFAsEfLFfMTVIcZfNxKC/1bMdejLUQdlNkYmMRiaHjOfPEkSP8Vvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqsH4quI3CYz/aK1azb9tsfZO5sR8/4aWcNY/RxjSBk=;
 b=EAq7Vh6Yy1C+eVD46Ibp0HJScJoVQsxO1lssOLSVF09I6AStmpAn+1sCmzfJJ6N2uCS2VQkN4tSWISyxhMUIXFhOl8LCp4rXgMSGO49B9fawgzlnlkAVByeie5LohDz3J0R9VRDvp4KZ1oXkyja0mwGehaTxqwPDN4hxDvppQmCIa7UlugLbyXiD88boyYbsjtGd68cIhVjYsQOxTiuoWuuNWtr6t9f0W+ceDTmoF0WQ6NtClINWMWm5rE18qojj/WZTNXo3UlVdtfV7mvVE1xwfuuPzDrYIrr1P39hdlqQ/TAFvOgJe3C+K74h+OJfGK8crN3AQDMjDdBXaAJyrPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA2PR11MB5003.namprd11.prod.outlook.com (2603:10b6:806:11e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21; Thu, 13 Jun
 2024 21:47:22 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 21:47:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/2] drm/xe: Introduce GGTT documentation
Date: Thu, 13 Jun 2024 17:47:00 -0400
Message-ID: <20240613214700.306424-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240613214700.306424-1-rodrigo.vivi@intel.com>
References: <20240613214700.306424-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0196.namprd05.prod.outlook.com
 (2603:10b6:a03:330::21) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA2PR11MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: c92035c6-e7ba-4745-7c33-08dc8bf267c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|1800799019|366011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8tbg46zXBdEWJ8XsYXqTBotMgthzRRH7piRcUAV3hAPR1F7yk6kKcP6GXQ6a?=
 =?us-ascii?Q?u9KF5Kd9Udp2H+9DVe5ZMbUsXZjsHAw9dp1AzWfPUO60HpMzzjANmAaP00N0?=
 =?us-ascii?Q?B80kXpvxHuAdi+JsfPyKjKoT549hIrWLWCMNIKaCzTHYTL0RVA+0jZnVNCp8?=
 =?us-ascii?Q?yMc0KTJWnXDGywbwcWJb0NmoRpn8FKCXyLrbiuIdo+CcI9g+lTul6l/YwgVS?=
 =?us-ascii?Q?vza/3ATI/8Lks2b9BvChoDq5TLbO4bE8kp5KkPdRWmIxcL/U183eHHKEFqBW?=
 =?us-ascii?Q?e0AczMPxXjoHYWHAkGUk7bPI6vGrMPZLucIaWSXWucd89OrXXiueGlkkLPqm?=
 =?us-ascii?Q?wY0UsXrrrTOxzYWGSaCO/tszcdNyiTB+hP5iwFvrGRtBvbHTAVS7V0xOVNZ+?=
 =?us-ascii?Q?vIGLkllms1a++/b1hSOSlK8NSe+3EWfD94OzVF56IDi00FcMu+gbt8nM9aIk?=
 =?us-ascii?Q?QsO00ujM6tQKJSMukeumfu3Ve89FH+TKz0r/8p0PNPOu+ZEytoeZZFlxWJNy?=
 =?us-ascii?Q?CR4ZD105NmnPZzqW5bkI5hJSki6hAzONaZ0wf9Hk/0obm75rLxgWW3MBWdRT?=
 =?us-ascii?Q?H0JRyJyqHIsFVD7AyTaRC+TAXF4ax5I1Z4wFaodymqIFvo8KenHwdksj4I3C?=
 =?us-ascii?Q?7Scttx2QRF59kljTHrZF/uFHYJn7AzN4Pw5puu+4on3Eu/kFtONbyfkSuJMD?=
 =?us-ascii?Q?KAqyYZtKsezlAPesO2nQkqyd5eqQny64LW0EupxsH2gFf3HgNrr9RaEq3vVJ?=
 =?us-ascii?Q?X5Hw4cGnhR+Fts/4xceY8R3Ui/sBVC8R4nsF7XLCxAV9k54Y99zQUUKsNv2Y?=
 =?us-ascii?Q?YQdDKUpeSOtqS80NYSBhOTtT2ZLHc77ttA4mGF/qQxsqhp0+Svfjc+noQqmt?=
 =?us-ascii?Q?VLO6ZckAtPcx0u73EEXYbkGfw9HBcNxdnmtJu7m8nVLCpQP6c8VoY/cP9OBN?=
 =?us-ascii?Q?3s/wI0JY7t9C6wCYvFulQ5mQYijtQnB+jY9zcC3FtI4YVtWchlaLo9Lemb+l?=
 =?us-ascii?Q?eZxTsKHR6Lec5Ox6cfF67nlVRJHvo/8nn5IqrT1g17Z1c3hjQEbGyBIDYmnK?=
 =?us-ascii?Q?UAio905PK6qhoHPcWW63v/p06ej9TCUpJx9THWwHcyffGwxYU0QQ04STz57F?=
 =?us-ascii?Q?yNOmffowVuKWd6csbP7RbiwjAT+Kuar+B4jQQ8Z4aFLlQn+EEBhaHIggG8Jg?=
 =?us-ascii?Q?ApBsGsrQnUnilkl80ZVmsgJ6NTBn46nslspyp1fgFlFQFTBwZUUY2OJy7Yod?=
 =?us-ascii?Q?XhRFL0mf+XBE7MT4Ea5nqETdl6Yv4ZCKZaymSN7MfJ8AHrb0G1pM2c/ub69U?=
 =?us-ascii?Q?vC4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(366011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EsSo/ICHdIc1IihCrU6doUdvydpxyYfHiYRLjYMe8Or13IpzHnsnpr6LwOBG?=
 =?us-ascii?Q?DhIMbFSYl8u8uoRwEDct6D5YzH1wbSz2KA8dV5R+RaqaU+YVS1jrjNks5aHa?=
 =?us-ascii?Q?vqMAYVbFrM+dJ5G03NURg6pOh0kj6YljcG1qbJUBkOLcaRI2VWmKi0zr2p/D?=
 =?us-ascii?Q?iwaxz5H/e5JIdExmW4v9A4VQEpcvpEPeC4rG60pAR7E3rz0TTbHW/qsSwqCJ?=
 =?us-ascii?Q?y/Ri60sKWNBbOeC/qM4d2V5d9JIosbJ1wtpn8FfquW98rqUTPdI7WA5Ib8LV?=
 =?us-ascii?Q?UUQNOkkR0g3jiv2+HeB5NLgo6m0dj/LMzTglEPicRrMrmf/mBZrT3oQegndB?=
 =?us-ascii?Q?M1cVzGjF1Lyhp82bxS6Vlzv3BowG7cpgwfkznyv0LBgfQPpmCc+qFAu/vBcv?=
 =?us-ascii?Q?AqohVonlMxTM9YFxVVLuDdsyLZgTVEV6YEgIPh+CINDIkwJErYpDpDXYAS7W?=
 =?us-ascii?Q?Z9XKUnmgkvgDyP7sQYxFbizcPWVuzUyQZODQYYKGuuOICicIS/kJSt74V3oc?=
 =?us-ascii?Q?JaumC85lfSbsBGFZ73Wj7crdTTgAk11HLwuqLkgpTKd8l8Wlm2UaPlH6HWvx?=
 =?us-ascii?Q?qQDpI3SlBX34mkmUrLknhKTNHdz5lt/kkcbp/x3T0G1Oo4DUS0ajdVfAof6y?=
 =?us-ascii?Q?uV1zFIJEPLEw2Mm4d+TRHG4L1KEW/AZshbZLcpIK+8XbdhiGwvHCmWViZY5y?=
 =?us-ascii?Q?JHccjfCgltemy2cb3apsdUHPqIUzdnweiFhx0Sg+DI96LXbqA2BwHDPvwpZX?=
 =?us-ascii?Q?ous+bfks94sH5VfLRN6ib9l9hciGCAvz10GBFOIk8p3/FDoCnoNdLHqFbrA5?=
 =?us-ascii?Q?5DV5kHgTVRKQcIw3hbVeguNUKZV5S/DC0P4Dxjh4r59s77fDvFZKA5D+CBjR?=
 =?us-ascii?Q?jRLYlCz6HjdUk2Bo7mxGjHC+STdANhFdMBEZqJykJEcFcGRr7XZXcnNLgnp6?=
 =?us-ascii?Q?ZpJSgaMJPIPUJ/d2LHWnvlhaWLaD3phE7fRWL3HJfcl4F8JQzLoHdxYeMJqW?=
 =?us-ascii?Q?bVGjWMk7u+XNZgYUgito05c0NY7D7M+gjLuffo8WZespc0C55+gmZY086q/5?=
 =?us-ascii?Q?iYhA/K6on7fGfAXTAwYzFSTUwK2y040FTGeQjvYr59YLj19bx7NvMH6KXS7t?=
 =?us-ascii?Q?wcvpARxSlCH3TbaOgANUWteINSBJj0oCRaZnevQeQ0fYpmadcEze+cvibJyl?=
 =?us-ascii?Q?ewe8VZw3jN4pZN7gfu37BYJLWxUQGvX0rpDbta5iIuLL/UnJ0CJqMK5UtdKc?=
 =?us-ascii?Q?ToJXcDUsTW9mAQ4fi6b3AvgI4m3Cf0cMfeq9yRD90nwxZntDv357JcdXZu98?=
 =?us-ascii?Q?VdqmYbCWldapKC7yHe7KBEWmYSIEMomJypZb3QrKIMcFfkMm8Z1KT02KcXN7?=
 =?us-ascii?Q?NcjcSX4nCLSrKSJvyNCrzFq/IqqlwJqI61Ez9d7OZlOy0QAY4mo0Zc2dmmHk?=
 =?us-ascii?Q?MzidjI9sQxEe16+Le6pGAQ7R5+KzyyzDmhW5o5i8a3qZ4+rsM9qWFkRw2izY?=
 =?us-ascii?Q?C52SmBZAiZ6Pz6yU/xxyZvTtX1xSjmPhwvdF6La1e7Ah6DcKsUuiXi1BD2Bi?=
 =?us-ascii?Q?yiDwRNMfG+K7eX7tOJPE4brDdwtN15fxHNl1M4AK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c92035c6-e7ba-4745-7c33-08dc8bf267c3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 21:47:22.2396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6kmFYuC4HliaMz12EFL8RrjE412kauUPmoVxMw1qsL7WOydwMs9cMOWnrG2HS4izKq46MXN01bMUvFEGYCobA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5003
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

Document xe_ggtt and ensure it is part of the built kernel docs.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/xe/xe_mm.rst     | 15 +++++
 drivers/gpu/drm/xe/xe_ggtt.c       | 99 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_ggtt_types.h | 26 ++++++--
 3 files changed, 129 insertions(+), 11 deletions(-)

diff --git a/Documentation/gpu/xe/xe_mm.rst b/Documentation/gpu/xe/xe_mm.rst
index 6c8fd8b4a466..95864a4502dd 100644
--- a/Documentation/gpu/xe/xe_mm.rst
+++ b/Documentation/gpu/xe/xe_mm.rst
@@ -7,6 +7,21 @@ Memory Management
 .. kernel-doc:: drivers/gpu/drm/xe/xe_bo_doc.h
    :doc: Buffer Objects (BO)
 
+GGTT
+====
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
+   :doc: Global Graphics Translation Table (GGTT)
+
+GGTT Internal API
+-----------------
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt_types.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
+   :internal:
+
 Pagetable building
 ==================
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 2d5e802f862d..950af831113d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -27,6 +27,19 @@
 #include "xe_sriov.h"
 #include "xe_wopcm.h"
 
+/**
+ * DOC: Global Graphics Translation Table (GGTT)
+ *
+ * Xe GGTT implements the support for a Global Virtual Address space that is used
+ * for resources that are accessible to privileged (i.e. kernel-mode) processes, and
+ * not tied to a specific user-level process. For example, the Graphics
+ * micro-Controller (GuC) and Display Engine (if present) utilize this Global
+ * address space.
+ *
+ * The Global GTT (GGTT) translates from the Global virtual address to a physical
+ * address that can be accessed by HW. The GGTT is a flat, single-level table.
+ */
+
 static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 				   u16 pat_index)
 {
@@ -69,6 +82,12 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
 	return ggms ? SZ_1M << ggms : 0;
 }
 
+/**
+ * xe_ggtt_set_pte - Allow directly writing to a Page Table Entry (PTE)
+ * @ggtt: the &xe_ggtt with the PTE to be set
+ * @addr: address of the GSM
+ * @pte: value to be set directly to the PTE
+ */
 void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
@@ -130,12 +149,16 @@ static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
 	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
 };
 
-/*
- * Early GGTT initialization, which allows to create new mappings usable by the
- * GuC.
- * Mappings are not usable by the HW engines, as it doesn't have scratch /
+/**
+ * xe_ggtt_init_early - Early GGTT initialization
+ * @ggtt: the &xe_ggtt to be initialized
+ *
+ * It allows to create new mappings usable by the GuC.
+ * Mappings are not usable by the HW engines, as it doesn't have scratch nor
  * initial clear done to it yet. That will happen in the regular, non-early
- * GGTT init.
+ * GGTT initialization.
+ *
+ * Return: 0 on success or a negative error code on failure.
  */
 int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
@@ -225,6 +248,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	mutex_unlock(&ggtt->lock);
 }
 
+/**
+ * xe_ggtt_init - Regular non-early GGTT initialization
+ * @ggtt: the &xe_ggtt to be initialized
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_init(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
@@ -345,6 +374,18 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 	mutex_unlock(&ggtt->lock);
 }
 
+/**
+ * xe_ggtt_insert_special_node_locked - Locked version to insert a &drm_mm_node into the GGTT
+ * @ggtt: the &xe_ggtt where node will be inserted
+ * @node: the &drm_mm_node to be inserted
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ * @mm_flags: flags to control the node behavior
+ *
+ * To be used in cases where ggtt->lock is already taken.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 				       u32 size, u32 align, u32 mm_flags)
 {
@@ -352,6 +393,15 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node
 					  mm_flags);
 }
 
+/**
+ * xe_ggtt_insert_special_node - Insert a &drm_mm_node into the GGTT
+ * @ggtt: the &xe_ggtt where node will be inserted
+ * @node: the &drm_mm_node to be inserted
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 				u32 size, u32 align)
 {
@@ -365,6 +415,11 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 	return ret;
 }
 
+/**
+ * xe_ggtt_map_bo - Map the BO into GGTT
+ * @ggtt: the &xe_ggtt where node will be mapped
+ * @bo: the &xe_bo to be mapped
+ */
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
@@ -412,17 +467,39 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	return err;
 }
 
+/**
+ * xe_ggtt_insert_bo_at - Insert BO at a specific GGTT space
+ * @ggtt: the &xe_ggtt where bo will be inserted
+ * @bo: the &xe_bo to be inserted
+ * @start: address where it will be inserted
+ * @end: end of the range where it will be inserted
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end)
 {
 	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end);
 }
 
+/**
+ * xe_ggtt_insert_bo - Insert BO into GGTT
+ * @ggtt: the &xe_ggtt where bo will be inserted
+ * @bo: the &xe_bo to be inserted
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
+/**
+ * xe_ggtt_remove_node - Remove a &drm_mm_node from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @node: the &drm_mm_node to be removed
+ * @invalidate: if node needs invalidation upon removal
+ */
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 			 bool invalidate)
 {
@@ -451,6 +528,11 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 	drm_dev_exit(idx);
 }
 
+/**
+ * xe_ggtt_remove_bo - Remove a BO from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @bo: the &xe_bo to be removed
+ */
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	if (XE_WARN_ON(!bo->ggtt_node.size))
@@ -507,6 +589,13 @@ void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vf
 }
 #endif
 
+/**
+ * xe_ggtt_dump - Dump GGTT for debug
+ * @ggtt: the &xe_ggtt to be dumped
+ * @p: the &drm_mm_printer helper handle to be used to dump the information
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index d8c584d9a8c3..5718726e8b3a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -13,26 +13,40 @@
 struct xe_bo;
 struct xe_gt;
 
+/**
+ * struct xe_ggtt_pt_ops - GGTT Page table operations
+ * Which can vary from platform to platform.
+ */
 struct xe_ggtt_pt_ops {
+	/** @pte_encode_bo: Encode PTE address for a given BO */
 	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
 };
 
+/**
+ * struct xe_ggtt - Main GGTT struct
+ * In general, each tile can contains its own GGTT instance.
+ *
+ * The @flags can be:
+ * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
+ */
 struct xe_ggtt {
+	/** @tile: Back pointer to tile where this GGTT belongs */
 	struct xe_tile *tile;
-
+	/** @size: Total size of this GGTT */
 	u64 size;
 
 #define XE_GGTT_FLAGS_64K BIT(0)
+	/** @flags: Flags for this GGTT */
 	unsigned int flags;
-
+	/** @scratch: A BO as scratch page */
 	struct xe_bo *scratch;
-
+	/** @lock: Mutex lock to protect GGTT data */
 	struct mutex lock;
-
+	/** @gsm: The iomem pointer for easy PTE manipulation */
 	u64 __iomem *gsm;
-
+	/** @pt_ops: Page Table operations per platform */
 	const struct xe_ggtt_pt_ops *pt_ops;
-
+	/** @mm: The &drm_mm struct */
 	struct drm_mm mm;
 };
 
-- 
2.45.1

