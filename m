Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A989C46CD2
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A0310E257;
	Thu, 28 Dec 2023 02:13:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B076B10E256
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729595; x=1735265595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QvOBTjwtJ+M8A8nRNICJaE3Two0a3XisIB/HmpnWJBQ=;
 b=KW/7OhHeRDk2x5mn8nahKmVDuYJzJiP/ao5DoIHkAnLUoCibl70DJ5Uv
 Yj8EF0iZtW9rYdX/9SE86FnpR5jW/axMcSyjJLJQ8YsBeVSloHYO9+YGJ
 0LI/g/uWLnaKtvIRFPMUilH5LdrhZWuiD6nRR2T2Q7YK64+8S6FaKBfpL
 HtB94eCNtHB5vG5M/epktOTit/GgPaAwqWMfhl4yGLqJxpxX3s4+FuQMJ
 7Lm6TP/sRLv035NR+go0HJ10cTXnX71FIpnQgScySyLLb9Gz4vCXlqjPX
 l48//Edm2/0WXKEEfsGz7fRl5knz/J6p6NSNMAzkEDDm7dNtBMUTftn+h Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3807714"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="3807714"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:13:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="921983501"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="921983501"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:13:14 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:13 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:13 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:13:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCYCQsdaL/K0wmRzjUvWCyxKZhzddMk8kan4aiSCzScJ6FP+9tbOa/shKyqS77gwY4AQw66WRw633ETgYnmqb4yvJGj7Zb7QINpwQ68mbs7RhUrsUNsRXVSBSHZmyy4Ag+3WPEeUS6HjCEekHpKn0kHlwwABgeM6FaB/Fn0/gzm9y9wz5FM1AXX+M/vFENzBto+gIkQVEMrDkUOetyUIYzlRSgCRcRKhdgIHEd/GL9oxC2fzgSqlxlEoNDibiQBy/6TFSsVM+EtMc8fEV1ROi/FU2cDILIdafFCX7k7w24XKFtH8PnG07AwJD5W5sDz8dUktnyEWX1KClR2ELQb6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n94mHmEj2PyjKxNd/fZLTr8IMD3BPk5H9DTBbYyPOns=;
 b=FG94+vmsn/KW+wc9v2V/9e9/+5niG60sAzP5Sd6fW1cXsm8Mxry4bSaVw4LETBfOM5C3XBD9+D8/mC8XmZxUCxFD0kvukdeOU+/sCdwnxvYV/jrZKuC4dVF1fED81P5WymgYJBAZGqxBxJwShfeFniNfrCeTxnjqF7winyYloVdufTyQNObxo+54BaEigdbwojBzt0bFGyFEtlh0LKJqIcM9Ht6QLCtrkw2L4IHp8EKKKCHB8X88tKtsWfuNJqboyU0BYW9kvJdYlUmE3TTJeMxJgbBpEovhdYVEmj5Ecdlq5syZ5sGdNbjBoOVVr+2+QnxGTpE/TkHYd0fx60cP8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 02:13:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:13:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 10/20] drm/xe: Sort some xe_pm_runtime related functions
Date: Wed, 27 Dec 2023 21:12:22 -0500
Message-ID: <20231228021232.2366249-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a11abf-6cf6-44ca-db9a-08dc074a8a57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UycepliJsTOdchK9XJWcgF5hek2L5hBTD42QtiqUvbrMCKtJFsEDt7ZE0beZs3+F1sySeObtmgJl4pJV9+tygxPAK5LecqAW3JV6xvAhL1iSyH8TJVvzOEoWG/k0iJr9mmnmVQL6fAVZJ1L5dGosaZFg2TqIs4S1/VqlCCF+FdwJ1PvvGHwg5pwEotIKwnzd5AtRm/OkbHhRjYuEUg7kUTdP9+RWv4YwxG92phb/Nkb0FKDZ4OP2PtD1B4T/Hjl0JeNKJwKaGUPn+T13JVSiMrSeG4DbF1AKE6yx5RW7Q159XWudpUh+qzNErjiAD4LqxdHwHaHRlJ3uKHAXO/WuzElN4TLuF93xeopVYsHE+n6cO8ho5LL+PmZKW3Qd1t0jhgeZW9CCb2rr8LRlasYIywfy/zCKfUnWrS9MFcQzwr5bxvSJunPCUo/plV7CX3I0lhibU7qqcYjx0todZZyhMzXHSy9AD8GTUz/2ex7v9uwtGQMy+I5CrlMnCnfFomV22PQLgy5wtRA+MdwLChwTHwTOhfAxCOeBETLsc3CUk2K83J9JpjxF+P5cEg3WCIyI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82960400001)(2906002)(38100700002)(36756003)(86362001)(41300700001)(66556008)(66476007)(316002)(6916009)(83380400001)(66946007)(6506007)(478600001)(6486002)(26005)(2616005)(107886003)(1076003)(6666004)(8676002)(44832011)(8936002)(6512007)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?afrJZire99DiHA3jKgCZ3PPsxLEt1dR8I0x5M/JNKuRPKgEGjlUEJ6M0nk4u?=
 =?us-ascii?Q?BNGrPP3Tqj08SMXBl3mjIxsbfqlnFegJGj3wGIi0mJS0H8CimWkFcYgcx3/2?=
 =?us-ascii?Q?em1yoG33FTqIRuiDxZouAvu97PRP6U/2FYpIAY7VSh8eXjADOFBwich8/l38?=
 =?us-ascii?Q?XP6iVD9n0z5hdjavgBrGEOosV3EyZ6EdDIkeHFEfH47nW2TN7A9KrDaQO9jb?=
 =?us-ascii?Q?TafFlXVk3Q6itbd0Z7nQpvoDisEd09VHn951EQsN+jm9vSTBkkBKbGaqCcdR?=
 =?us-ascii?Q?3f7zvMRIwKAbPZtDjyjoNTh8Uge4hsYvD7bmo00TAqyN+DfnLfaZCOt9aF3b?=
 =?us-ascii?Q?ccqZr9qT31A5coRHiFtbLaj4wc6Tui0WvOAZR1k4wOoh2qeonT28/f6Exlzd?=
 =?us-ascii?Q?4VCILT3BOwRkpMTgZQWuHI0+XpGM4npOKE7B7UzlWU/J79ApXDGQ2qH60BF8?=
 =?us-ascii?Q?5nN1SQdlx1Ata6Lrb6qhDX6Irub5rsyIADYJvKW8S4UC/uEAqmH2NS4OX3hA?=
 =?us-ascii?Q?3t9Fbt9BdJvVjXcghFyzWuX+P8p1ILZZ7eoTAdu08bW5EayGi0kZeLMtxV3/?=
 =?us-ascii?Q?4Q9VUjFujfUDCn37zVUAQLJAp+tuqut12nG2D2MWBuaAlp5o8JNqKJRFAH4O?=
 =?us-ascii?Q?ibNAFn326cFgHK/Vjuk3uq/cbZMrTkXOODJTa1Kad7otpAIhCIWCfE34jrhT?=
 =?us-ascii?Q?izE1bZ9BLwf92YfwDg/Yi3l0Q9FybdxLdiN4WNVxqIAmjMbGgiATDM4DFdMS?=
 =?us-ascii?Q?M8VRZ39v0c+qCkcX+2thGAEuPKTzxFKLN24fr8CT7Pq5eIbBsTkKT9PT58Os?=
 =?us-ascii?Q?TqPiGjTOmic832xP38gSC8bUA3U/SXltSC3/1j09VacrreBxPe7fvVxFjQ6+?=
 =?us-ascii?Q?Wfs58JHm91FSUq9vLJ/ebMMN1lyLA39iG1C91uxClvGfdq80d1a7bFWxSLxI?=
 =?us-ascii?Q?JxS7zF5YOxRCQU/8PdZVMA5rh8XEZZXDqJyt5mk1PJhpdsaswYvJPXMrODrq?=
 =?us-ascii?Q?BG5GwIC3bNJLv+0Crv0gGF3M3QmYBoIWUAb2KOnCgiSGCJjRrKR4UWyZOF1F?=
 =?us-ascii?Q?m7e35svgaL0k4OSCIB7rYwn8MDoGHUtNsPgbwTHg7dJ6gVeNaT1LlPx6CWeo?=
 =?us-ascii?Q?qGDpI90rom7XX/8jgu9n/PFULtm6siHOSBMmdHZva4DK6FCJR8OV9Du291TV?=
 =?us-ascii?Q?zbC/UNvIPxy9mhnYXGqS2um0LplXGOoXDROnyR9pSq6i/zAKogZcS2gkEOXg?=
 =?us-ascii?Q?ZPcbEcfX1XDRfWgwxGBhVimRFPFi6t2a1QSMsQ+5DU6FiQZmaW3YPrA8i1Q+?=
 =?us-ascii?Q?yZENIeF6TnZn5fmy+7cLov36YB5ynlnnGrc9+Wj+uki61mjBHFD7kKTez/zx?=
 =?us-ascii?Q?QF+Ech6qpj8ZPlU8ZNF5gJAnGj1JR/B5S597oGoJdwpi8hO+v6LwidFGwJaH?=
 =?us-ascii?Q?kfobTouUoDCjN1Erwa5K9gbmC0LJO0Y8zltOGRSR7gnYMDYpzDK58BUyQbyJ?=
 =?us-ascii?Q?KQnh1dV7XdPFemv+urX7SAa2UEvBycsikNcZkF4i7mXr58EpTL3RU9RSQuiE?=
 =?us-ascii?Q?3oqot2xdA+fo591V5ppIFej/g2lG6+pT0upUveP8o6HETKKAZ8dx2XORa44Z?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a11abf-6cf6-44ca-db9a-08dc074a8a57
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:13:11.1917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtcV8vWUAlYgHZiPSn9Nt7GBmvpNemwJDmtzEITB3hxhFePahDHdTajXfloLnNJknpXHB1KV0b5aownBPrdjKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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

No functional change. Just organizing the file a bit better

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 42 +++++++++++++++++++-------------------
 drivers/gpu/drm/xe/xe_pm.h |  4 ++--
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f599707413f18..3594e707606ce 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -387,6 +387,23 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	return err;
 }
 
+/**
+ * xe_pm_runtime_resume_and_get - Resume, then get a runtime_pm ref if awake.
+ * @xe: xe device instance
+ *
+ * Returns: True if device is awake and the the reference was taken, false otherwise.
+ */
+bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
+{
+	if (xe_pm_read_callback_task(xe) == current) {
+		/* The device is awake, grab the ref and move on */
+                pm_runtime_get_noresume(xe->drm.dev);
+		return true;
+	}
+
+        return pm_runtime_resume_and_get(xe->drm.dev) >= 0;
+}
+
 /**
  * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
  * @xe: xe device instance
@@ -401,16 +418,6 @@ void xe_pm_runtime_get(struct xe_device *xe)
 	pm_runtime_resume(xe->drm.dev);
 }
 
-/**
- * xe_pm_runtime_put - Put the runtime_pm reference back and mark as idle
- * @xe: xe device instance
- */
-void xe_pm_runtime_put(struct xe_device *xe)
-{
-	pm_runtime_mark_last_busy(xe->drm.dev);
-	pm_runtime_put(xe->drm.dev);
-}
-
 /**
  * xe_pm_runtime_get_sync - Get a runtime_pm reference and resume synchronously
  * @xe: xe device instance
@@ -456,20 +463,13 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
 }
 
 /**
- * xe_pm_runtime_resume_and_get - Resume, then get a runtime_pm ref if awake.
+ * xe_pm_runtime_put - Put the runtime_pm reference back and mark as idle
  * @xe: xe device instance
- *
- * Returns: True if device is awake and the the reference was taken, false otherwise.
  */
-bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
+void xe_pm_runtime_put(struct xe_device *xe)
 {
-	if (xe_pm_read_callback_task(xe) == current) {
-		/* The device is awake, grab the ref and move on */
-                pm_runtime_get_noresume(xe->drm.dev);
-		return true;
-	}
-
-        return pm_runtime_resume_and_get(xe->drm.dev) >= 0;
+	pm_runtime_mark_last_busy(xe->drm.dev);
+	pm_runtime_put(xe->drm.dev);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index d0e6011a80688..fc82a1466453b 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -25,12 +25,12 @@ void xe_pm_runtime_fini(struct xe_device *xe);
 bool xe_pm_runtime_suspended(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
+bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 void xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_get_sync(struct xe_device *xe);
-void xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
-bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
+void xe_pm_runtime_put(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
 void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
-- 
2.43.0

