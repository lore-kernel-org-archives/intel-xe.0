Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76ECDC4706F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B2D10E16E;
	Thu, 28 Dec 2023 02:12:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFBB10E16E
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729569; x=1735265569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RdPh8LZFFhfcXdiTXtIpoOHlaP2LQMcUYSseuszDOhs=;
 b=ndHwLE+Lx7/zHRDxD/alSv4LVb/aQj69kvHB/dOsU0T4zR6T8ecY+qnT
 71o5Ph4VyNoNh07saordXmQ7IO8z0zxy9o0SSGu49yhkLLvDSUWTpd1VE
 hzfy+SmQ04mXEzPNIjssOmCpWJ/vIbiB5lGQBeZp28wvzDxzIoWXuPYPl
 M+b69iJk6zkPIzF/JPeP9bEYqrSrzNnvksF+7eTTrUbFn+SCsx6XZQ2Xc
 KVcOKQj8pY6vnZTD1UGYcGlQQo+Pd6t+8eKSuy+sYCvOnwSXvjs90/dp5
 AJWtfCHT1M25cfE4hswr6Cfe5x3ibSJ2/Qo4WbAqgwykV8Zi1FiU63R7k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="482684569"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="482684569"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:12:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="754611049"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="754611049"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:12:49 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:12:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:12:48 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:12:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Li033SUEWte0oSnQ5PqitPs7vrYtyTC4oYnn8MzoUP7DmWb3g95R7dmPT5cj29RU0Z6N6kn+GF1d+VBZvJRgGu0Be62lQhxN1N4OP8PpPcqTXra0OO6i8lXNS4jPG13HOwdvTJ6q+1UKqBt6kJSZiUDYhCOS2qmCXJzjWoNhk9BcELrDVehjUnfYPFD/uB06+/szcHfH1YjiGG1fsbYTygAcodZ/yKHAHSTzRk0wrozhx/pCTCB8cxTlo42sRcn7sK585mWzncp/bwRrPzeCOj7aLWyjdr51TMKaInd1XpWix5mqrPBcgfqbv1m8RPAZKPxJFKCrBVGHiWpoZm57GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQJFe6KzuFiyl7MWaXRs+hD8baZvTyCGVMC9jwg6uWs=;
 b=YpisTMcYv/KDXaOm7oms2gYtlsO5qXpfFPbk4Y8SfbsCP/WIXUtIMxi0qZHp41FCiuXwiTvq0cyMyo9wyNO5el5HZ2BbyTYYEaB2BsMKyVJI214Nle3+yXHLvxI4/x7xfejT30PqvA30KZhdWQl7DcBiOSCquqt/1xNrpQ9v41pHl9UuTki8XyQeabRJZh7AuYEFWFStj6OGNtMyauHphN85nE8kwEBUH0cIk63WgMwB4bnC/qJ+QmRYpUnxjM8SFHZRZwZuCWl5UGLMNsmfQIoSuUbG0uyW+dYyLPrI6HqpgOIv01mEU0G7gX9/EZgAR46e933ebGUjWAtitlDayg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.18; Thu, 28 Dec
 2023 02:12:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:12:46 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 02/20] drm/xe: Fix display runtime_pm handling
Date: Wed, 27 Dec 2023 21:12:14 -0500
Message-ID: <20231228021232.2366249-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4833:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c94ca25-e14a-45a7-4bc5-08dc074a7baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xCEFVwOq4SQFy8chOCW4T4IVC/F+SVsbaCWQ7eJdJboA+1RMQvAGfPYKeDXz0AUQopTPSBHn+FY8vTIiTKNCYkaoDFCf4xfkOzeJOCyA2d2PAvyxqtwHup8tXlWdBEAoth2utuG73WZoQ0mEF53kYgdPEQ6FSH+ztMWt59cm0Sx87N0jKhSrwlBLyRv9aEyrLZ0eU8K5cgQzSLFqSIs/5zA/ODSxl00SBoOicV031vGFUs5xqwxR1BTqVwPKjd755fCVY4Px7A3PssLuX6BvY9somZSio8FUVqX7pDVBynmIhlTxWgmdSwSTjvIeWYFWFJsGKA0AH0JOpOJskGZHjdIYrP37+sg7LHjOI3ZEKwx0q3mUy4wsEiU21uxowQ4XnVoBHjBoEQNQsueQSQBSPjqEiivqGAn1WNhShj4BUpmtwBe5fGd/PUHaxiQLVVRky9sJwvenn1kifg6ywcbgV9l8/DJCD/A1x4EGH/WuJPLzf9mPlMz3xAfa2Dav2khzTVn7W8jq5dTI4iVWeip4kSOnDKY7ZUNNh5ltV9aFZhd0la7uc1MeYU9tPeL9WzUY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(346002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(107886003)(2616005)(26005)(1076003)(6666004)(6512007)(6506007)(83380400001)(6916009)(478600001)(4326008)(5660300002)(8936002)(8676002)(44832011)(6486002)(66556008)(66946007)(316002)(66476007)(38100700002)(82960400001)(86362001)(41300700001)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nX6Am5GkaFbOazNDSH+GMtBseBEWflBAIYiZi2V/Wh8jQNOXP66XFakZUS9X?=
 =?us-ascii?Q?xk6rjWvaMbuqGD2iNYqHrYc+6kop26Fw0zj0B2m46LPTI8OC7lu+mb3OUgVE?=
 =?us-ascii?Q?vUIDnRzW7OhlFCd3KyO9IVZelHZ4kGSIGCUsjoBMDXEuI85jMQzvaCnPK7nz?=
 =?us-ascii?Q?HtT0V4YPyqjU2oXloqV5zANnar1QYuBnJ6Sy7IUJJXwd6dbtUPO4tJEJa83x?=
 =?us-ascii?Q?apjx4S4jbJE4+x/tjiqvWQn1ssvYZDy+5SX3/UZgp2bQczN0VF0rr8X5OA+p?=
 =?us-ascii?Q?uNqf6Tt9MqV+G5GAkS0n8Hr31W7XOjpQ+iQNqx4XdQrdnkatodHKNDyEzdcO?=
 =?us-ascii?Q?M4JbED1VVBQjbIwIV/p99h7z2dyZcO8roVJEGcH6lr+b6XaKVzW3TQEcHY08?=
 =?us-ascii?Q?5+vUIBH9DTlEHjAlzl0Y8/FmOWDFP5/XXJg69gyGCz4c5seYlkXCXD2d7vcH?=
 =?us-ascii?Q?6J5fNXgXY6N5BOtL3Jpq4RiplCKbll4wGqqHYKXess/e/bgoA9O+DYXWuVD2?=
 =?us-ascii?Q?zGbbXIHzKwpmqEqqpvt+Fb88oPoTyMMW6U2KeDipa2iYh25n3OyWNDd1efpk?=
 =?us-ascii?Q?vueGOuzjXnShZ7xi8FEi96+HM+yzXASgRdowAvWVumN920Wof0oNeBWZCmRW?=
 =?us-ascii?Q?nl3+I2VJKfOMfgf727HoOFgC7qdCNWaOtzj+i9lCd7LjBZtRp6Dcqw1ay/hE?=
 =?us-ascii?Q?wlpCLjnMWneZa7hG2MFqy7yH7bnIEedMj/4EK+S6wjoO5JU5ynniZV4zG9mJ?=
 =?us-ascii?Q?QUyU0WAx9xKgU63HG/CBdH+k+WRQCIKw5SSqI+sNCQgoVgjfk7qB40Gq+ElM?=
 =?us-ascii?Q?2U3PI2xoerj1YqyYiI3RJjMbqVYCHYLPKXqZPEb+J4+jw9VErAbQvxOugDRP?=
 =?us-ascii?Q?CnMeOvo3WRl5tUtsA6zsn5FpCwkuEWjdr5B+DYUJNgQUzxH35RDw5iBJLt6i?=
 =?us-ascii?Q?bwzSrfWgkcWnvxf+I6CnhVG6jbEZQ4RcD1jDTwkP1LA90lkoMv2G9MJWd0wR?=
 =?us-ascii?Q?zfx7W3QpNr/T8YL3gxgabLhRB9dKl5VJ32OeR4PHm532bqwKEpNHmu61MHMV?=
 =?us-ascii?Q?WlFR6y4p9SkDvNzEwQozBZDqKxIvnSxd32N6NosBMWNi8zKzcwE2fXXq6E/1?=
 =?us-ascii?Q?vb0Zk7x1qGa0VFCSBScr/lgoatq68GbdYTe4NsQnS9Ub+A4WaGy9Vn1T++vD?=
 =?us-ascii?Q?gktehfC+6Gypr5sYzeOOA5hobGBbaVw7rYy2y4KA+hoTlSJVXkVGaEJpYQFu?=
 =?us-ascii?Q?qiEQFLC4YHxVdGXFKck7LzAmplsVlvZ0cN0bO1HtJp0HIosDr+4OYtxrvXKY?=
 =?us-ascii?Q?4k3KH54Ce5Dkrqy4kt+ryIsV1S7Kh2sHkoElhxaU1tK5ZM6zMUCyxSnELeCi?=
 =?us-ascii?Q?efovtV6FPa6w07aaSJQV7BYsMKiyJXbvBOM1IzwvWmXa0E0CLGsjnNt8B2ZT?=
 =?us-ascii?Q?JSqC4h/DMPucgeY/XghqDgkkwHqk1ZBLMr/IsjkwiBckqNrAZxw1XSwZCouz?=
 =?us-ascii?Q?s0SnWfz9mv1XsqGsre9s/yrkKiGaJC8D4+1if8RwNPJCMbDD7dhsFkdJ/43D?=
 =?us-ascii?Q?5ohMe4UaWP+z9hmsA0LqNmMK2td5ZXF/ydu2rsN9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c94ca25-e14a-45a7-4bc5-08dc074a7baa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:12:46.5179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQ708hlpfDV3u/uii0qjT+puuqkO+FH9eY5xj3HZrTkgmySTvgCHfCEIq2Vu8dzC4gqteVbLql39Nrk4N0S1iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
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

i915's intel_runtime_pm_get_if_in_use actually calls the
pm_runtime_get_if_active() with ign_usage_count = false, but Xe
was erroneously calling it with true because of the mem_access cases.
This can lead to unbalanced references.

Let's use directly the 'if_in_use' function provided by linux/pm_runtime.

Also, already start this new function protected from the runtime
recursion, since runtime_pm will need to call for display functions
for a proper D3Cold flow.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h   |  2 +-
 drivers/gpu/drm/xe/xe_pm.c                      | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h                      |  1 +
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 5d2a77b52db41..f0464dfc45cf5 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -177,7 +177,7 @@ static inline bool intel_runtime_pm_get_if_in_use(struct xe_runtime_pm *pm)
 {
 	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
 
-	return xe_pm_runtime_get_if_active(xe);
+	return xe_pm_runtime_get_if_in_use(xe);
 }
 
 static inline void intel_runtime_pm_put_unchecked(struct xe_runtime_pm *pm)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a7fe69d2f442e..5a4d601ab0976 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -400,6 +400,23 @@ int xe_pm_runtime_get_if_active(struct xe_device *xe)
 	return pm_runtime_get_if_active(xe->drm.dev, true);
 }
 
+/**
+ * xe_pm_runtime_get_if_in_use - Get a runtime_pm reference and resume if needed
+ * @xe: xe device instance
+ *
+ * Returns: True if device is awake and the the reference was taken, false otherwise.
+ */
+bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
+{
+	if (xe_pm_read_callback_task(xe) == current) {
+		/* The device is awake, grab the ref and move on */
+                pm_runtime_get_noresume(xe->drm.dev);
+		return true;
+	}
+
+        return pm_runtime_get_if_in_use(xe->drm.dev) >= 0;
+}
+
 /**
  * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent bridge
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 6b9031f7af243..13eebd604dd96 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -27,6 +27,7 @@ int xe_pm_runtime_resume(struct xe_device *xe);
 int xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
+bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
 void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
-- 
2.43.0

