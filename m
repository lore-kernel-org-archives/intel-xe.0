Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4058C04FF8
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 14:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9127A113CFA;
	Thu, 18 Apr 2024 14:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dI+mZCuc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298D7113CFA
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 14:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713450658; x=1744986658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1GOqlrdPRoetdJs/uOOzWXKCUJsx2y5PEtr57mKPvt4=;
 b=dI+mZCuc/N7pTqnaRZVP+PtuJ5xCmPWD9/lgcqlfN6tkiX4mmcfJcA+U
 AAHgIEWls5ocrMAeLty+ZHHpCSeE1Trt0xT9LUat+DI1KaHIjzf6ldXAQ
 eerOfhm51d/pp3S33ZpEstXuegOzWJKBGtVcN/DTamMUBz5+fYKz2u74P
 42QhpuwGuXTBah0ow8lsFugYqIr+/92ggDISRh+548cFnm4FAgbSDlU47
 tbmk0d8EW5gbpw/WBB3+QVW+DxakdL0qkOsAQTaqfTBAbtMcugKOOkVZ9
 la3xhCGrskTEsNTHqa+fAdj8WC1yCIO8lX21uQORCHUtIjTodJe5lvx8T w==;
X-CSE-ConnectionGUID: 1ELT75+RSiaRee/DkgTLvg==
X-CSE-MsgGUID: qSu9gfYBRgy/5bI5SQDnEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9116752"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="9116752"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 07:30:57 -0700
X-CSE-ConnectionGUID: lY3GSStTQHeUPoDljZ+xuQ==
X-CSE-MsgGUID: 92N7CDHRTOuN21yPYGWB5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="27445532"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 07:30:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 07:30:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 07:30:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 07:30:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MD7jcwnQd+NWc3DFXk+Z5g8WLcnJcVedXiPUupQdrrTZRTkXXyxnNrYmDFDiBEQOKMRkEiUV1eBF1k9sj0npl83JnzKghcXNn1jb++h+B0BUTfBMuOnJMjfMMNcE0oCL2qowDaVC/63KyfIAE0uJxZwvooH7Za+JhlCxnGo71ZKwTRYK9HJUsQdKJnCDQLGdyiVnvperlMgrwZ3X0oR/oz5lewi9eAReUB92ykODc1vpgjaNu+gJS7LY1Va4MIdKUZKQkiMCj9sgG0EnedKo/QK0PBvQ1k9cHuIWXUQ/9xgTSY6iavKXv+2ZFzdBhIfTuAD2lWVHxs8HY/BoELZtpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2Tnw5PPIPOTTY9rT/T0kOzCxEA0GQd6oNsicDdGsqE=;
 b=NH0VUPrLqnUCDaG6yil0qp5JE1fak1UHwlPbE0T/UFhWBpvUIbjMTsWXgeT2Ter6zktFcXCnqtwssDSnJSUz0VHtYGEnIX4c8YkL80HUUBCoZPnt3u3QwTQwUYojztwhgV2E4bTEexbf42T0gCMtrUYAmeEaVzw8BTdGKHVF0WdFqel0hVpIJHSeeJDPyrDABYz/T5e3Qfag8d+HOkwU4BwqC7Wcg69lXlRa7uSoudVi+wPIH2JFtoWMRO0dWEj2NfJpWus8oCPhDCWzmf4MYePFAJtZ1jvEFaVq3WVOYgT69EBnTVPOiOdZFjT9oRaio6VWqpDH7C2wQA/CE4oC6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4912.namprd11.prod.outlook.com (2603:10b6:a03:2ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12; Thu, 18 Apr
 2024 14:30:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 14:30:54 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Suraj Kandpal <suraj.kandpal@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe: Kill xe_device_mem_access_{get*,put}
Date: Thu, 18 Apr 2024 10:30:49 -0400
Message-ID: <20240418143049.43231-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240418125307.39579-1-rodrigo.vivi@intel.com>
References: <20240418125307.39579-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4912:EE_
X-MS-Office365-Filtering-Correlation-Id: 651a0a2a-a144-452f-76fa-08dc5fb42751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oGroUWRQ8cfiNccYLqI/CoIMoGloSL90CUvU4l5qMnqRtVAK9xGnpjoO3ChN?=
 =?us-ascii?Q?pObV44Xd1p4IQvG8t5su9gZHdoVTg6hh0fZPnI/RI3gBeImqZKBVM3VRp4nl?=
 =?us-ascii?Q?/UcL2FA0CGX2Ip0L05/3cUoH7DJ2LeJB5InW7BfPWGyhFwyG9xABZMCeBpTG?=
 =?us-ascii?Q?wI2/td274+KDI4roBysID1JG6f9b1k35cIr7cjSiYNhy6OzvaGX8jJsu6ha0?=
 =?us-ascii?Q?dHpsIxgiFftPPuXMP5L8E0ftnA/7g5MJjjwbC/HGDGFiF0hjtVKlVBmNWank?=
 =?us-ascii?Q?x/5QRAn3s/crytPozdxtI5HGt9t1EEdQ3LfYhylJjQls7UR6Dq7QelFJwcQU?=
 =?us-ascii?Q?hujtgNmU6Is41XySSXlc/2PF6ZTCshOED96MsR611RbpsHM5BEBb3zlefgeI?=
 =?us-ascii?Q?hvMVsQXSVdzDrCueUfrGVusIbGCBl4PiA4DB9GHwJPmbFjo2x4QXBN6OHYL2?=
 =?us-ascii?Q?rda3Dl36Mug8K4Z3wO9H59h1CvggDaUuUe+CbwsDTOTDhbgQHuVoPo5TceAw?=
 =?us-ascii?Q?buco9P/KhHi/loBl5pRfh+BF0MvDYRKXlbXwq0krZzxOtf2x97jM+GbNL6Qo?=
 =?us-ascii?Q?aLuMBPXuD0U62+/+70BvPnyqm3kUYRI8FmgCP8u32045u6dvUjP++o8YMBSM?=
 =?us-ascii?Q?w5Lf+yCWEWMthNVx+NAczBvOvQeR2ElwwI8PY3Bj3jV+ynkQAQcRVnBJFs5n?=
 =?us-ascii?Q?Ob3OC6H6yzeIOaBnbHYT3ybYjWCebwRqP/tmMf49IKaammiVF1ifxuz4WOLN?=
 =?us-ascii?Q?5dyXmJYC3MZoH/eUYxI2QSwmZj16l643IJ4YvCuoMPujlDi0qodkLsilNx48?=
 =?us-ascii?Q?WBOziqSSA9FBczORbonDT5c5OzXkEoS+36hrdweoMAAdl8dnN1L5sfss4gYQ?=
 =?us-ascii?Q?TYp6UnGu+rJSb1CnHzllxoldMXXicFGwtW9+JQ3jTA68p74uc3CfQmhMvbXT?=
 =?us-ascii?Q?kppyhIC46cddOmXIZIDiaUys3SWbV0YivzsJWnPmMQ5D3jn+x+DtqMsSeiVq?=
 =?us-ascii?Q?opU5rbYrBGFH6CWF54e49qaqiuhAehDZekNkI7bTS0flTJhHx0BmBNSClaTE?=
 =?us-ascii?Q?Sy986ih/z6Fp0vKuSt9n5tWYCDDT0JWpTYtjEMikhpojEVSLfCjNx9i3vsBR?=
 =?us-ascii?Q?TPVPoPoRiFpsl260g+Wb73t+6rmfbyttmNNiKVLeluS7PekDgiTo7rkLgh89?=
 =?us-ascii?Q?/zVg1q3Xo2xu1oIFgIXo0Z2HbdanUyk+KkzEOANpznANufsFBzVUxwaLjLKq?=
 =?us-ascii?Q?5QvY3XwtJBzegoWiuV6DZWp11ZIcbTT+Bb7cuihEqw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Q1yNrfztreJwch//AhLAfMzaVexARm5tuNmZNoS90pHyMyDjcottgkmxR7V?=
 =?us-ascii?Q?b0pLanx3+gFO/OLXK9fDJW5Oib1HETq2b7CGMxHfr2hNAwWdDq0ws+uZZlVF?=
 =?us-ascii?Q?a8vjDwgYXoe3PLbBBo4Gc9REm4uiixh+2JZyIwLoS1etEe5K7zNAnGKZmzhq?=
 =?us-ascii?Q?man/7tX9H8yqK6lWp/eSr0R07/jn5OElgJTWO6wncV2EJcNQ6pHicuGbc60s?=
 =?us-ascii?Q?kagDN61/YiOB0f0J5//D3e4eIo/nigjapB4Nq9ubLloThejP9l4GP0IsBSjV?=
 =?us-ascii?Q?FUQKi7ROZNm67kuR0RhsxOfRQy6kEukXoSXE6qXaZ623AKt+GDPlRclalqHD?=
 =?us-ascii?Q?P1+sBVz0lkZM8VHcoF0Pl/JduGx7l7Bw+69m80LeOs/MBIl7F+WDvCb8FP7m?=
 =?us-ascii?Q?0FFuRJJxvoj82g/kfuKOIFtshRtos7fpyBExZOkRGUBJmQs3+QrziAJld/K1?=
 =?us-ascii?Q?2qOzZg5mM4POF3MFdpY4Ux7TpHKTnIht22OS5USTfp43rB22pFcZ3Go2d/0g?=
 =?us-ascii?Q?hhu/rWibffh5waBAZt7WL9GqK+JybFWc3w2xvnRdBuH+STvjL1RRSeMTg1O8?=
 =?us-ascii?Q?K70HKEOHgd4+oOkv69RPHtPz/2N3L9PEOS5mok85DLohKF03AbuziOUbx8gj?=
 =?us-ascii?Q?c2bbPJh97lB0eBvvIEFo5AId/X4FaM0rDGF6ir6JD5dyvitZ8h+oaAqvuaAT?=
 =?us-ascii?Q?QGQggoN/T5xNjb7rTi4npbtE2paIpwVA6Pa6TaFzN5lyjRAt32Dz5o/HWriL?=
 =?us-ascii?Q?leGijQ3XhzCwV51B+pCp1/3H7eXk4sqy8lu54oA7kBNwmBV1KvqMo5tgyLVf?=
 =?us-ascii?Q?mnD2x8c+wdcjb7/s+4cCo0iwR0lPgHfl2Yg1jbsajFU5duUrbrkcf5wySzl6?=
 =?us-ascii?Q?G+W5ntNBiXxhuKelSomnbAmL57WVgGpHsnM4PYmod9N9tyyQEftR8BIGsstX?=
 =?us-ascii?Q?mZZcyq3kxn0/uzMNwIT7kaRU7f+AgwLs1pC6djz0PXQaQooDJBlpsIpCOS8b?=
 =?us-ascii?Q?SEUaTTAMQb0Rg/BYXysy3Eb8QmG7au5CU9A+FfH3cZMLH/KOLpo4jOEj9vQl?=
 =?us-ascii?Q?T8Rei4W/fsC3gihnyXJQtMBjhXzDcO61+qEIHD6t74QbPnmFkqoDfx5o7NK6?=
 =?us-ascii?Q?XLWAkaroh4g2bPYUux4ZReAyq+vmS5NAW5MdaqdkVSWbmLDFshye3wDAodNr?=
 =?us-ascii?Q?XY69ip3uqPS3jkph+U4u5EBkyTJLL6S78KrUMK2BSOVk2usFqBKyXrmiAlsc?=
 =?us-ascii?Q?qh438laogJ+HoM6SpADcpfkQf3Df0ltc/N3EEo8NV73liAu3zRx0nwE9CrRO?=
 =?us-ascii?Q?LeeLOuzRaW4SIXL73pF/jM+ggPm9PGcObVfLqfRClTKpWHXQXn9pZok4+lKa?=
 =?us-ascii?Q?tNCZX2ADepAlQF5DQuIw2luPfOHjQMZ5Tt9rpvehMiS1eYy4xRSqFjKZ9Mw0?=
 =?us-ascii?Q?ELeoFnCJVrwsoqZ3aJdFbaxXecs56+Dng4IwrOwcMEKYxdt2hwuGdO32hO7l?=
 =?us-ascii?Q?nsr8WY5SIHJ7IiVv+FqUcvNYicQmrgWZ0sdA5oHiEHaGpbU36rtO0JO5Hqhe?=
 =?us-ascii?Q?g61Au+iMpA+oOkVi2G4w6g52apSgKjIurvdGMeIF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 651a0a2a-a144-452f-76fa-08dc5fb42751
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 14:30:54.0244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YiZ8/ExYxZx9Nx0MVTLu2IDevI1TjmJi9FNuNgyJqi0wwVNGbcyVWTBrMF6nRSg4XP1NbmQQSvYYEpIFEEcJjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4912
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

Let's simply convert all the current callers towards direct
xe_pm_runtime access and remove this extra layer of indirection.

No functional change is expected with this patch since
xe_mem_access_get was already using the xe_pm_runtime_get_noresume
at this point.

v2: Convert all the current callers instead of a big refactor
at once.

v3: - Rebased
    - Squashed the GSC/HDCP
    - Added a new case: sriov_pf_policy
    - Improved commit message to highlight that
      there's no functional change in this patch.

Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v2
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c     |  5 +--
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c   |  4 +--
 drivers/gpu/drm/xe/xe_bo.c                 |  8 ++---
 drivers/gpu/drm/xe/xe_device.c             | 36 ----------------------
 drivers/gpu/drm/xe/xe_device.h             |  3 --
 drivers/gpu/drm/xe/xe_device_types.h       |  3 --
 drivers/gpu/drm/xe/xe_exec_queue.c         |  4 +--
 drivers/gpu/drm/xe/xe_ggtt.c               |  9 +++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c |  5 +--
 drivers/gpu/drm/xe/xe_sched_job.c          |  5 +--
 drivers/gpu/drm/xe/xe_vm.c                 |  6 ++--
 11 files changed, 25 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 3a584bc3a0a3..3e1ae37c4c8b 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -10,6 +10,7 @@
 #include "intel_fb_pin.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_pm.h"
 
 #include <drm/ttm/ttm_bo.h>
 
@@ -193,7 +194,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 	/* TODO: Consider sharing framebuffer mapping?
 	 * embed i915_vma inside intel_framebuffer
 	 */
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	ret = mutex_lock_interruptible(&ggtt->lock);
 	if (ret)
 		goto out;
@@ -244,7 +245,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 out_unlock:
 	mutex_unlock(&ggtt->lock);
 out:
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 264b957f3639..d46f87a039f2 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -215,7 +215,7 @@ ssize_t intel_hdcp_gsc_msg_send(struct xe_device *xe, u8 *msg_in,
 	addr_out_off = PAGE_SIZE;
 
 	host_session_id = xe_gsc_create_host_session_id();
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get_noresume(xe);
 	addr_in_wr_off = xe_gsc_emit_header(xe, &hdcp_message->hdcp_bo->vmap,
 					    addr_in_wr_off, HECI_MEADDRESS_HDCP,
 					    host_session_id, msg_in_len);
@@ -247,6 +247,6 @@ ssize_t intel_hdcp_gsc_msg_send(struct xe_device *xe, u8 *msg_in,
 			   msg_out_len);
 
 out:
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9889adcc458b..bc1f794e3e61 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -716,7 +716,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 	xe_assert(xe, migrate);
 	trace_xe_bo_move(bo, new_mem->mem_type, old_mem_type, move_lacks_source);
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get_noresume(xe);
 
 	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
 		/*
@@ -740,7 +740,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
 					ret = -EINVAL;
-					xe_device_mem_access_put(xe);
+					xe_pm_runtime_put(xe);
 					goto out;
 				}
 
@@ -758,7 +758,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 						new_mem, handle_system_ccs);
 		if (IS_ERR(fence)) {
 			ret = PTR_ERR(fence);
-			xe_device_mem_access_put(xe);
+			xe_pm_runtime_put(xe);
 			goto out;
 		}
 		if (!move_lacks_source) {
@@ -783,7 +783,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		dma_fence_put(fence);
 	}
 
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 
 out:
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a7c4e4f73200..1ac910bd5115 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -733,42 +733,6 @@ void xe_device_assert_mem_access(struct xe_device *xe)
 	xe_assert(xe, !xe_pm_runtime_suspended(xe));
 }
 
-void xe_device_mem_access_get(struct xe_device *xe)
-{
-	int ref;
-
-	/*
-	 * This looks racy, but should be fine since the pm_callback_task only
-	 * transitions from NULL -> current (and back to NULL again), during the
-	 * runtime_resume() or runtime_suspend() callbacks, for which there can
-	 * only be a single one running for our device. We only need to prevent
-	 * recursively calling the runtime_get or runtime_put from those
-	 * callbacks, as well as preventing triggering any access_ongoing
-	 * asserts.
-	 */
-	if (xe_pm_read_callback_task(xe) == current)
-		return;
-
-	xe_pm_runtime_get_noresume(xe);
-	ref = atomic_inc_return(&xe->mem_access.ref);
-
-	xe_assert(xe, ref != S32_MAX);
-
-}
-
-void xe_device_mem_access_put(struct xe_device *xe)
-{
-	int ref;
-
-	if (xe_pm_read_callback_task(xe) == current)
-		return;
-
-	ref = atomic_dec_return(&xe->mem_access.ref);
-	xe_pm_runtime_put(xe);
-
-	xe_assert(xe, ref >= 0);
-}
-
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
 {
 	struct xe_gt *gt;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 54490802e97b..36d4434ebccc 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -133,9 +133,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 	return &gt->mmio.fw;
 }
 
-void xe_device_mem_access_get(struct xe_device *xe);
-void xe_device_mem_access_put(struct xe_device *xe);
-
 void xe_device_assert_mem_access(struct xe_device *xe);
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 60ced5f90c2b..2014d87765a2 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -384,9 +384,6 @@ struct xe_device {
 	 * triggering additional actions when they occur.
 	 */
 	struct {
-		/** @mem_access.ref: ref count of memory accesses */
-		atomic_t ref;
-
 		/**
 		 * @mem_access.vram_userfault: Encapsulate vram_userfault
 		 * related stuff
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 50ec661116a2..395de93579fa 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -589,7 +589,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 				return -EINVAL;
 
 			/* The migration vm doesn't hold rpm ref */
-			xe_device_mem_access_get(xe);
+			xe_pm_runtime_get_noresume(xe);
 
 			flags = EXEC_QUEUE_FLAG_VM | (id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
 
@@ -598,7 +598,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 						   args->width, hwe, flags,
 						   args->extensions);
 
-			xe_device_mem_access_put(xe); /* now held by engine */
+			xe_pm_runtime_put(xe); /* now held by engine */
 
 			xe_vm_put(migrate_vm);
 			if (IS_ERR(new)) {
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 38f6c94c722d..0d541f55b4fc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -21,6 +21,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_map.h"
+#include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_wopcm.h"
 
@@ -403,7 +404,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (err)
 		return err;
 
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
 					  alignment, 0, start, end, 0);
@@ -413,7 +414,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 
 	if (!err && bo->flags & XE_BO_FLAG_GGTT_INVALIDATE)
 		xe_ggtt_invalidate(ggtt);
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
 
 	return err;
 }
@@ -432,7 +433,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 			 bool invalidate)
 {
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 
 	mutex_lock(&ggtt->lock);
 	xe_ggtt_clear(ggtt, node->start, node->size);
@@ -443,7 +444,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 	if (invalidate)
 		xe_ggtt_invalidate(ggtt);
 
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
 }
 
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index 3eaa17ca54fc..fae5be5a2a11 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -12,6 +12,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_klv_helpers.h"
+#include "xe_pm.h"
 
 /*
  * Return: number of KLVs that were successfully parsed and saved,
@@ -368,7 +369,7 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
 {
 	int err = 0;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
+	xe_pm_runtime_get_noresume(gt_to_xe(gt));
 
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 	if (reset)
@@ -378,7 +379,7 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
 	err |= pf_reprovision_sample_period(gt);
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
-	xe_device_mem_access_put(gt_to_xe(gt));
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return err ? -ENXIO : 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 80daee910ae9..cd8a2fba5438 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -16,6 +16,7 @@
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
+#include "xe_pm.h"
 #include "xe_sync_types.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
@@ -159,7 +160,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 
 	/* All other jobs require a VM to be open which has a ref */
 	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_device_mem_access_get(job_to_xe(job));
+		xe_pm_runtime_get_noresume(job_to_xe(job));
 	xe_device_assert_mem_access(job_to_xe(job));
 
 	trace_xe_sched_job_create(job);
@@ -192,7 +193,7 @@ void xe_sched_job_destroy(struct kref *ref)
 		container_of(ref, struct xe_sched_job, refcount);
 
 	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_device_mem_access_put(job_to_xe(job));
+		xe_pm_runtime_put(job_to_xe(job));
 	xe_exec_queue_put(job->q);
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8a858b8588bd..85d6f359142d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1266,7 +1266,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	vm->pt_ops = &xelp_pt_ops;
 
 	if (!(flags & XE_VM_FLAG_MIGRATION))
-		xe_device_mem_access_get(xe);
+		xe_pm_runtime_get_noresume(xe);
 
 	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
 	if (!vm_resv_obj) {
@@ -1376,7 +1376,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 	kfree(vm);
 	if (!(flags & XE_VM_FLAG_MIGRATION))
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 	return ERR_PTR(err);
 }
 
@@ -1507,7 +1507,7 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
 	mutex_destroy(&vm->snap_mutex);
 
 	if (!(vm->flags & XE_VM_FLAG_MIGRATION))
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 
 	for_each_tile(tile, xe, id)
 		XE_WARN_ON(vm->pt_root[id]);
-- 
2.44.0

