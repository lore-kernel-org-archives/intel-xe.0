Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A42C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BCC10E2AD;
	Fri, 26 Jan 2024 20:31:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE2210E2BB
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301069; x=1737837069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4BYnlznsaICQSBYIw+4dL3Zc8SSFxdiJU3/iU2Ae6x0=;
 b=ipfL2Wt0p1EtivJYUQ2byfMj6TxDd3S9Bhxv5ERWpNC7dQ6w0AShXfSA
 SJUpElDA6nFQIZobasNanB8b5d1T1Ns1PxJ3NJfy/dr7wuFk5Yds8Bjxi
 g4GiDtjtILMFJGkyYxgmd044iZyFWFQlZZPmMkM1pggfhrzTzkLQnePxx
 q+7FwodPFocQU3cMsIBjK+mzobtjd4iHwtDP/85NelhU3GzsCooLUCR2Q
 7DwJnD1wfQbhFc/Eb+MuWrxiiNY6Npss+Mp3wlkLKRmRh7Zxj5luUKATh
 PSYf6+Dhq/DwnYDSxvojJsRlkFlqZJFFncQyFmRZuyghjkRWY7+6ECYkt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9948224"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9948224"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:31:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877481780"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877481780"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:04 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFdctUHId1YqI0AEAAcHZHKp8CCziyw/EMyjL7eUy38+RrWd+/WVEtlLDu5xbTD0KUd33i+APZF+q5NnYGZn8NprxsxISioETjP8srjnI7Ats4m4at0uIxjCBHSoleYGw+u22vjqyvqGzruRHl/bu0IHKeDu9quQvZG2jf6l04Sg7dnpuiRRp5zKVZW7xbQih7EUFw6GWjqzE0pBS5Lk2jqgYdTJJVyMVWbZXBRUseTcsmY9FWjikXK13jYLYq7Xsq4pdbzMwAF5nK1cWB+Jb4UwENv/a2eParLXaQO1Of287O9gGZ7jMw1JEWM326N71qXP933RKV2A4tGTFr1trQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDZuYbgAE2K67LpCg7+iUVLdpfouteHT8MF3HtpBtiE=;
 b=hhaEnKYD4yKCEBLNJNaHzP1X6G6xbZAAiB714u7cxbKV6bmqsJB6lTbegSL03gp1M+YvMnq/2w0QR6TX7U+J6vTxaNFhSwWmWTlYBPX88HENSK7k/6tYtkUomLdrFuEH+vnSS2Ub62JlWEZS3MYQ4BqdKpQtVd2qgXA9Of1nEJ3oL2VsQUMLC+zoGACxmzYKpHGYcKnRUXaeK7ekWzQ8lPXoiz93ikwr8C4RXdQrN7NyfhWF8U/MVzgluAF+/TorALysXj2pjNwcVruyfGlWwbWKVriWmM8LZF4GqvM4eDnRwWmP4N+og1AiYjWeD86kNbrUC37laO9iOBqDz+V41A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Fri, 26 Jan
 2024 20:31:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 05/34] drm/xe: Convert xe_pm_runtime_{get,
 put} to void and protect from recursion
Date: Fri, 26 Jan 2024 15:30:14 -0500
Message-ID: <20240126203044.1104705-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: ae227e85-b629-4bef-6b88-08dc1eadb679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YtBCGTfsh05i1BCjlXrEKe37ygVB1AxxL0CTz8PF3dkHiTPtKrTccwyVvAgQ6XvEsVemfb4BlX51WJdiwHIkjUegOqiIaB2vd4D4jX9odK/H9zEz8ekJ9mtq1B8nM41z50yxxnezTx/yFVFbYMWL7eALbH3al8WQyvVR5YInN/JlXbHmFp9UM7C0UCNYej8MmCoGTBbn4ipUD10p5JWCrr8o4hyExLXFxkrAIKQMMABY8hv9kmOYj6AWFcJH+TnC0MS/iCdFs/AxAPqpDdJdGpMrInw3QyLSf+/hy8za9UFL8PFkT3huvp4iLJQX0u3JCTvE7KPjyH/82aOH10WQt3rqdSonmCmIJIVsAczorLjA59oIko2l17pD2NBvmsMWSUn5oTcXRvD5605ZDvoWGobp9sc0DbLwaVs+E/IW/v3EbfmtlKCjPU1jlW+MRAMiij+cHIBTAHw+3hewyX6T8TioL6wqtoGDIpoDFv4hBjPeyRhEjLyeCeK08h8W+T+/GlI26N25Tma+xVztJEtzgKcBXrGbXT+U7jkI4gKrGhyWnhlXoAjf87ZLa6ZBZFQ6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(83380400001)(26005)(107886003)(6512007)(66946007)(1076003)(38100700002)(5660300002)(44832011)(6506007)(2616005)(2906002)(4326008)(8936002)(66556008)(8676002)(66476007)(6666004)(478600001)(316002)(6916009)(36756003)(6486002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ivCg0f0Eznaml4w7jvHz59uR60wwdW9xB97Fg21IdPZoTYm8BOS+hrhsBx0d?=
 =?us-ascii?Q?OJR0Xbw441dPS3W8y4pjyBbKzP2b3XZ/MvLhIVwTD8ddo1ruVY+q2In8epAB?=
 =?us-ascii?Q?ZbpibkGxw7akOW3uGK9Lik3AW/9ghLa+TYY5LJG1gaOmvJIibZQpdKe6n+uS?=
 =?us-ascii?Q?/j/B0sFNwYqeThyazLeOeMVdfmCFe3FOd4xiHZcwnfu0jKKfPREn2xklpbXb?=
 =?us-ascii?Q?z6uSycBb5e1M6/ZmDzAtCQEv+BHuj+aa5pLovSlUexFajD+lnfc/HOgLMHFK?=
 =?us-ascii?Q?29sqFEeibcGf28mv9pYu1DtrH9fJSkh/WTdaBQ+yWePdJyHdV2jc8IdAXdlS?=
 =?us-ascii?Q?5PDDl60ykK2CwI66g8LNr0IACfXzx6TvxgHm+S11KyJA0vdPm8hsP/11Z4K0?=
 =?us-ascii?Q?wRjTr8e7zg5XnhipvZJkzppGDVO43huX8SNGNt5wjOq6ljoN6vbet6mJsf4i?=
 =?us-ascii?Q?nNNgx1BtQD8APjiOBVZd6nHPyacN8ifmOduGWM7CbBVWTtKD+usPsso2tF7A?=
 =?us-ascii?Q?ppNxXctxiu58KqQfbfFJNBM7ueQ0A8+Gqhn0eWQ+AdOcm9Oo4uzOK7AxZXqS?=
 =?us-ascii?Q?4By/UTytTsl2JG0XcUQ79BA8wk90ToeleReumk0wGO3PVNoRMTDj86EA1fql?=
 =?us-ascii?Q?3YFwR/jsCCHCsFtok6OjEUqhc9b5pGBY9DLc2kS2QrubTrl+1Vyk0/zkKqTU?=
 =?us-ascii?Q?TONQ3wU2QiSgj/+djlMp0UG2PJ1Rpen8yunyFJK+olFox9GWoQwuAlR6XBIk?=
 =?us-ascii?Q?qQLUORl0fvZlXmNtnNO3Zb6n/bu/lKjjjSPRzZ12+YddcxRSqvKraxTG8Yc1?=
 =?us-ascii?Q?d2cIvsqoMrtR9TtP+Or/CmWUCw4SkPPfCVb9TfrD/Xyjc5V5CUuz4JddBXuh?=
 =?us-ascii?Q?joutDUhU/HzjRePfr4olj14+Bp3I2JQ+fxX0W9LUmO1DqRdctXuP/SKMma2R?=
 =?us-ascii?Q?cQ2QCzrIrVvoewMDnbA7nMqN1blnRoh3rJrrP/wVqWPp+Gq6qizUoiZ5XgeD?=
 =?us-ascii?Q?mimaLwNO2odwOk8B2trB1OPp+RTBicvyQkLFP/QnD4S8H0280MB+xCCNCmXu?=
 =?us-ascii?Q?MQDmYzQDp99P+1w5oN8I8OM+fkyTAdEFzcrrNNeGTwf9Dd6pnTCBH3YSpglo?=
 =?us-ascii?Q?KFU4+f53iCBhic7lRSqffum8FNG0TbGV5RDBKD/MSwejiOjP17ZmbeAnsW49?=
 =?us-ascii?Q?MiAO/kw4jMChwIuFdhf37s9SNTwCpPigP9T05JUmoAF2kfGCp7RQrSLz7qdy?=
 =?us-ascii?Q?HpyPn8hYv9THM1yucfOgrzF20g7vEey357RaPSHQURLd2uoNOiWMgVB0fhBQ?=
 =?us-ascii?Q?zJXDtZqXi+XqM2hcOXIcLV0E7w6XZo+WaX2KydyGnFA0K6IdKJ07/Cb9sLf8?=
 =?us-ascii?Q?SGX/iaciLU0VY/8R5LI4X4JpWab8RcXyU003J24FXk8E05bSTfCdc//5d80b?=
 =?us-ascii?Q?VzM0uve0S/+GSmMj9ISKSQEZmIxF/7BR3XrTlMht7zpVMmEvgfgwRP/ziIgJ?=
 =?us-ascii?Q?IwSgbgR0MLXHmPa/vJvRCJ7fLMwMliOW0raiP2ApSYE7XerLO+H6PETf0VQ7?=
 =?us-ascii?Q?xLOGnMc+AGeDcNzDTGezY0HFlzJ1+vPHxRVdUsQ6tMQnggyaqUVW716o4KKa?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae227e85-b629-4bef-6b88-08dc1eadb679
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:02.1276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BemoUFrMYdMGqvMGV/LfU/dytDCM0hlD5tI++vOLddUgcl7TCaX15ueTte3AANBNKRoUXpltk3KU6MdloI4MA==
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

With mem_access will go away and pm_runtime calls will be called instead.
So, we need to protect these against recursions.

For D3cold, the TTM migration helpers will call for the job execution.
Jobs execution will be protected by direct runtime_pm calls, but they
cannot be called again if we are already at a runtime suspend/resume
transaction when evicting/restoring memory for D3Cold. So, we will check
for the xe_pm_read_callback_task.

The put is asynchronous so there's no need to block it. However, for a
proper balance, we need to ensure that the references are taken and
restored regardless of the flow. So, let's convert them all to void and
use some direct linux/pm_runtime functions.

Cases that need to check for the references or runtime status will
be handled separate from these main get and put functions here.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 25 ++++++++++++++-----------
 drivers/gpu/drm/xe/xe_pm.h |  4 ++--
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 2264276dc431..28a4231ddd8a 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -383,26 +383,29 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 /**
  * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
  * @xe: xe device instance
- *
- * Returns: Any number grater than or equal to 0 for success, negative error
- * code otherwise.
  */
-int xe_pm_runtime_get(struct xe_device *xe)
+void xe_pm_runtime_get(struct xe_device *xe)
 {
-	return pm_runtime_get_sync(xe->drm.dev);
+	pm_runtime_get_noresume(xe->drm.dev);
+
+	if (xe_pm_read_callback_task(xe) == current)
+		return;
+
+	pm_runtime_resume(xe->drm.dev);
 }
 
 /**
  * xe_pm_runtime_put - Put the runtime_pm reference back and mark as idle
  * @xe: xe device instance
- *
- * Returns: Any number grater than or equal to 0 for success, negative error
- * code otherwise.
  */
-int xe_pm_runtime_put(struct xe_device *xe)
+void xe_pm_runtime_put(struct xe_device *xe)
 {
-	pm_runtime_mark_last_busy(xe->drm.dev);
-	return pm_runtime_put(xe->drm.dev);
+	if (xe_pm_read_callback_task(xe) == current) {
+		pm_runtime_put_noidle(xe->drm.dev);
+	} else {
+		pm_runtime_mark_last_busy(xe->drm.dev);
+		pm_runtime_put(xe->drm.dev);
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 59aabb44a350..ecb19ee10db6 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -25,8 +25,8 @@ void xe_pm_init(struct xe_device *xe);
 void xe_pm_runtime_fini(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
-int xe_pm_runtime_get(struct xe_device *xe);
-int xe_pm_runtime_put(struct xe_device *xe);
+void xe_pm_runtime_get(struct xe_device *xe);
+void xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
 bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
-- 
2.43.0

