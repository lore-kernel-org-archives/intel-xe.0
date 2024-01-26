Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C29BC47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB32A10E2B6;
	Fri, 26 Jan 2024 20:32:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E717610E2B6
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301130; x=1737837130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=J0JKC/TUgnztqZb/Q08BCKpk4cG4pKO4V4zuATNGEUA=;
 b=JhBeHyY37GAw+MZOIR+Fms9MM6QcTuYvrGHkrIuTn7a50xak2svJ6VZb
 x5hB+b9tjS51JLsefLxCqXmt86BKYR0m6KGxbKVb/OQ5jfIQxHj6Rau3w
 IcEXh+muwphKBzW7q+vEs3XGeFxfBXtj3wcqj6ZbXiKKwP692aiRJ1eVp
 8Z3O04Y26j6Knk7kgqhsOsioEuSjlDY9bgDgyTRhLvF1NzEH9Pv/cyMTG
 2J0/pUoZIuWUmcOG9PEQHIoikLNzNRHzzR318z7PJx/M5nYMReetseyTI
 +r7Ngfe1HBy7RCjyiWICJMUCdsLzSLSM+ijPluTuMeql1RrW68e9Z6rGA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1494463"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1494463"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:32:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="821245427"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="821245427"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:32:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:32:09 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ML7USGzkNLjNExbhQ6X79iqx3ufm7jtuK6NfbGZdA0Gk148Gs29Fs5XBcAp/VwjzBLRi1PF2JjeBxBA8YCxGOC++ENWj8ZZ/IydHEqaJrfTouwAc4dZGyO9k2tYDCWO/YF+o7GKmJBuisrL+u1DYRi98wHCzkz0ppO0MDNzMQ5yE++OpGgYkLEwLliUyEpWANlzvjZdjcWrKz0wvTOyUZQQADKjxsX0I7E/DuPBSFrJ5p1oEU5PrGlL8apey768Hcm1+GbH7wm5SBCdWhsc/QU5Q1ijN2XtiAikvo5gqCJ5od+mpPKXW858aqKAMt6YXH3A9VRZtaw8hwvamBkhP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNfzvChrlwg9TJ9KJxOmqs94Mj1X6r03h96TrnxIK60=;
 b=fh+apjMQzc76mynewJCYCRVqd2D7IexAyTDYVpbWYTQ6j2wyTdcycDHJp50pJHz9i7YXlKe+y/RPBZjVha1wgc9Nz7GwbTiNYjDOrqtoY2Pvg7HNSz3Pu4FyBQ2ezUMlyfJi8BqaTYm5L+YkZJqjoYv+qvFWj6OklqOC3hZr9FB3+SZED5XoNWkHjCtTRW1Fxh7BDxFveUDGKWzjb9aXYolucpImO7/eajgpOnmx8IOnk642AuFsKH1yPl7252mUCX1Vu7VhIrp21PoTc9oFP/iEDw/PiscL9vwOKhVYNPXGtQB6PK5xoY8kM+aFr7DP9REPKb2jGf2adjaWke8i0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 20:32:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:32:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 25/34] drm/xe: Convert gsc_work from mem_access to xe_pm_runtime
Date: Fri, 26 Jan 2024 15:30:34 -0500
Message-ID: <20240126203044.1104705-26-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0065.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a26ecd7-e1da-4c9b-222f-08dc1eaddcf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n2t35A9EMnn7BDbLjTaHzlWnTkLdxzVrlluXSlZZ89ecbRNtXCAfxvE6C3UEjD69ojzy4DdzQpaLB7AcTx9uonUTtKrv0a8oER/XQH4wZ5nVGgjjhAYKr67tyarq8PLgGwP3HoUdYZ1nIJXp/y6rc1J5WDbCJTOVEpB4gU4q/0c4PssSzlgaovuLbHmeZi1eeHO2ohdy/4FFCEOQKyV16KPcpQHQ+86IpqA+eKMIhLm5ZZXDbTuYxW+D7KqjPsimicbLFSvuEWOdzRV1KqRTMPk6klIALyPm3ww2Hh1fhkCHOeQ409zbXYIX2In5Ipl9E7vntG8rtFPyhrX/Sb93nK/AjIZGiC9wO4gKIvHXAGN8+4htWELyRXV2+2/eIIyjMlabcT3Lnzk2w6n+DslNR1XLbG9obxpQnUkizhKks/mt3ZYB5BkxTXcYjX+RtH6QrKaasYKTbNS35ff0F4qAHuM/2CQ4K75ngeifCh5VWQewBT/GRHWMa6DheNnvPq1/3NjwKrm52LwqI8Ci2mczUnizwUDVKEcbMT72RECxjZLyo/uE0EpM8UYe94jvfWJb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(41300700001)(66556008)(6512007)(2616005)(107886003)(26005)(38100700002)(8936002)(6506007)(1076003)(5660300002)(4326008)(8676002)(66946007)(44832011)(66476007)(2906002)(6486002)(478600001)(6666004)(316002)(6916009)(36756003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PE7Z0hVZzsPnzAuUzGTPzHW1neTvMXiD5zi7m+sWwaMEx8V3M5tw1usnEEMP?=
 =?us-ascii?Q?+WEKVRnwFkT+wume8KcyASZHySXGbV/BQ3EWvgZ04fGcdg9hVKrmlj9Iv2qf?=
 =?us-ascii?Q?hlwqdYB5YtazmMiZfHKo9fJyzHT7GBgAuHaFkao4+GAgcj8LwXsdsxO1U7jX?=
 =?us-ascii?Q?K6tlCFpfbWnIbC02UwUDCxkpqcPO+aY5bfPwdxFbfl1APe8xfK8+1YlPSpHo?=
 =?us-ascii?Q?y4eHuj89K67ZuMgkVb6F/oK3e/kVtybyr2ucfiEKyUfFXsbH3iyeKM+whEIj?=
 =?us-ascii?Q?nAA0MVdGG4IyzkbfZ4UjVhzkg51WutMUBAQhvL43DGFgMC1DtV4sWfr76OXT?=
 =?us-ascii?Q?9fJnFunK/6wZ9Brjsn+SbW+My/FzP5RIsgmwaEuIERCxtFfRboLaJ6oiggUv?=
 =?us-ascii?Q?bDjajSX7E4MQj9qxmkE+hg4MozPKP4+yX5Qsn1ygSbaRYq0SNOEBKS6J9jI9?=
 =?us-ascii?Q?qXIp9WCshSc/b0m0C9kK7VSD9Mjzxhdij1vSF/5istPMg68The/HjdL4usga?=
 =?us-ascii?Q?u4F4QNqK3fBNSO8RPrt7j6lHVCmH+g814BfnFR+yqFGAEJNT+mDUthecvwfh?=
 =?us-ascii?Q?ncrhi7yOl6sV3r2ZtjkgwbTsIp6uC/Ch/2E+QbugUZjRbnPaBE9WpNTc5xU8?=
 =?us-ascii?Q?sXp9z8GozkB3rVXdBuEY+dB43d3Fu5T+6e4aUDwfoHxmLG6/eIN0Nq8wcw/+?=
 =?us-ascii?Q?n1Gg62XW9CyIsyS/VeJJRJA4uNLIfYJIN5Ls1xBD9QKM4Za00sPRYOFg9RnB?=
 =?us-ascii?Q?GklvrE401LiK/nGTO7PsDPmE015IeAQSsqSc3GN68RpWEJE6yEJvRMGDqxfg?=
 =?us-ascii?Q?DxfQYCSqH0GzGNhm8JnNq/EuVeIXL3OxMF+qA5oVjMuqWdRcncHl1ViAEQJ+?=
 =?us-ascii?Q?c/2l3+cw9GKxU7wtb90V1T0royXz/6PDcJ4jJFaTnS5ptV98bsQDoCrC3pLS?=
 =?us-ascii?Q?RTA6dGw8GX5hrRfpEvNHJYuxVlcnaooAbzl8UsJlaG1UuliPQ+4yXc07S/+H?=
 =?us-ascii?Q?fgq+t7NK1K1FbD2S0UkFOQ3b8MRSaiPPSi+8B5MmupYarU0+zDSAeBOP5RmP?=
 =?us-ascii?Q?OyODMAoflEJYEjCAt8eS7LRmGd1c0q9IRzYjPywPzyZ1AI88fnU9jMYL2GjH?=
 =?us-ascii?Q?59GdxtoX8Etwj/3hkucoCgRMNS7XLEZITC2FIsl70xClwQkkxB1uLFBSha3P?=
 =?us-ascii?Q?4XrQ7O9r2oVOZhcYdWn0haH9qHV5tbp6c1/LVf/t7hQhN37zZrCg6FMi+v4D?=
 =?us-ascii?Q?EYfXCOrY//LSzUKdM3Inl4QwlXkFUJTeCKKbqlryc4Bhr1+Wi0FzBMGD5ex+?=
 =?us-ascii?Q?4f5Ggdpo9knBG3/CDyw3iM39iJmue/CvsmdVuJuiML3k0ZYM0WjX/05oRWSy?=
 =?us-ascii?Q?Qf69W3MOv9+QAJ+KgA5sMSriRW/KwXdPxiHKZoJpWtmyLGv46p8JKtwL3zf3?=
 =?us-ascii?Q?R01V5Fy2Q8y1QHufU9DSOxaGIAPZb6jti0LO20dRZGMD2qnq4tjmy9cA9/8j?=
 =?us-ascii?Q?N2ASg2tjOxV6GMfrh8RCcIyc0m+USXs2iPWX3pxkS8ocT5bep2mLqDc57VUS?=
 =?us-ascii?Q?mZXPqYaAX+XgpIzmQtAyCTJ9HLbxQ5Zp3OyQNq5Iq8OmOxUSScyx0fIJbhJM?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a26ecd7-e1da-4c9b-222f-08dc1eaddcf1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:32:06.6280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRNsKouy89eDT3f6Wym12YXuW/QSyE0vIqdfmw6vjsn+V52ZJmpBK7aE+mV+nBY48eZ2dFiAORTJ1Ms20fKqlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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

Let's directly use xe_pm_runtime_{get,put} instead of the
mem_access helpers that are going away soon.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 0b90fd9ef63a..904026634991 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -20,6 +20,7 @@
 #include "xe_huc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 #include "xe_sched_job.h"
 #include "xe_uc_fw.h"
 #include "xe_wa.h"
@@ -284,7 +285,7 @@ static void gsc_work(struct work_struct *work)
 	gsc->work_actions = 0;
 	spin_unlock_irq(&gsc->lock);
 
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get(xe);
 	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
 
 	if (actions & GSC_ACTION_FW_LOAD) {
@@ -299,7 +300,7 @@ static void gsc_work(struct work_struct *work)
 		xe_gsc_proxy_request_handler(gsc);
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 }
 
 int xe_gsc_init(struct xe_gsc *gsc)
-- 
2.43.0

