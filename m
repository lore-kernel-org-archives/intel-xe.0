Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF40C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 20:08:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3491121B4;
	Wed,  8 May 2024 20:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOghbIBB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D3B10FD95
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 20:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715198895; x=1746734895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1fsYzcLFME2tIUijDWLroFCfoy6+78tfffiz+1DSrYk=;
 b=jOghbIBBqEG3o6zPDHqAu9E2LMrNAzXpmDISgUxqR2w/3OzxuqWnE+dZ
 vSOrHkR/LdCCRzGzl8S0v6882d/uviMhdhsqP7dgc+lyDmP+/D1jjLTiU
 WBetb4FFRW0TETPl8OTNOBLh9HGG0obKEv614Hqm9He7hSGt4C1/g/Yyt
 mH7JSrmlOcIdYzUL3GxPk8HsgJu2eJWVLWtwzo6sYyc5A34a95XuPs59O
 eZJvdo3WT8TVinW7eKfxvpG6y8Mjiyb39lY/3R2r1V3E+k5iYTStB+CvG
 X4Giay++l5noXPLzsAjHR4lnfA2v5U0x0hZcPLuFpk07fNS+uOneSoOgk Q==;
X-CSE-ConnectionGUID: TwPgrO37THOuYN51DZiLGQ==
X-CSE-MsgGUID: aToNG/UFQr68gIaSajN+eg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="14882475"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="14882475"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 13:07:36 -0700
X-CSE-ConnectionGUID: Jn8L5YWkS2W+c5JBSijgEw==
X-CSE-MsgGUID: zvFUE0TTRrymjklEzpVeHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29042499"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 13:07:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 13:07:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 13:07:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 13:07:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 13:07:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoSHVuOp8hHJdBC7Ul50nvbppPna/0HJmeCdDj0BCVr3aQtCBYYRI1VBQX9ClrHtjzo/xk9hcYNOrOqtJHXFbVlV2Ga83dfeH/YzYyIAzB6q1IUmzRYZqWNEFpeGOq2NY2AruRXmmNxbV4ecrYDQ0nhucZjJfzjVMmELWH9aLxTu7F43uHFqd22VBukSvww4dg6VMI+/FtKX3eOO36qqeQzEcIA9kU7Wr+wZmYk4ZlV0alnAbOfFpOse/EhVTROiSljpFjBvdzDipM5imtW8TE4RRMp2/yRYi6D20tHFtnSy9twToZJZgTCdCCIC+KdBW8TAyQidAGgxfD/8gQem/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrYIh5+G0cxgce1vbDyYsYfdCH34o2AsLlFfL3zE55Y=;
 b=kOKEiI9Gj8+JKG05xjIrhZwMpmVYLgPy+w1HNCa5kIb5HSZmrgYTU4ozM2ic1JgAo6+Dn8OboGlK0WOzhC6CQpPYs5AXAzJtE+VGujDxxVNrHiznQIXUM91QI76NIrzarMv75ShjUcVjQaonI094erBNoDTyEZuSop3eV45dq51ywlUs5Ru6cMOjZraPPgv8xQPnYhQXC7QQVtjhayJD299DWsrWMNc+qF8lvxlX1owVQ0lLxMckgHVQ2tvwosHrOBep6kVLcfLQAFZmNqizuqYSqFu//Ddu898OXmsMUUqBmkNX5YspU71vjnGBI7VHIIbb/BmMIi5Wb/FLgwZGww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4832.namprd11.prod.outlook.com (2603:10b6:a03:2dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.34; Wed, 8 May
 2024 20:07:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 20:07:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 5/7] drm/xe: Prepare display for D3Cold
Date: Wed, 8 May 2024 16:07:05 -0400
Message-ID: <20240508200707.375414-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240508200707.375414-1-rodrigo.vivi@intel.com>
References: <20240508200707.375414-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4832:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d210557-c378-4aee-e32e-08dc6f9a7a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gqiOJBt/Fsqb59YxEFR8ciAv0P8jONQP+uNjNOG0uMpyDJKsxeZ2zRi9j2Fw?=
 =?us-ascii?Q?HJHDm6gjtCDrRUj433c7oW32aEnt0Z9NtMiPd+h3rNtzUZvfjyyzTIw1n1eQ?=
 =?us-ascii?Q?Q2y24fTF33kjfKLIOlW+kKlcnhS/xM5HLIgdkBMUwhaNNpc8g5LVaToJ0LeJ?=
 =?us-ascii?Q?bGfkfZbnrPHfyC2Wm5nUHvzwHOvffbBriubZFL6MFz574VtwZA/3ObGhzZEM?=
 =?us-ascii?Q?ybr7FGbigf/eHZBkDcfqKcatWpaOcwl+0HAH7cwM30xOOFNpyiu7YeYJwrbJ?=
 =?us-ascii?Q?/11Va5nBRZ/MatWGCqXMKaeE7EZMSczNLXD89bobkvVGiuimeH7JrQaRya6i?=
 =?us-ascii?Q?oE/gjpl3oEhQOLFbolzwZHJMOUDF7c7m9bGT8oZTMj+TxQMPue/c8g//bg/6?=
 =?us-ascii?Q?iVgos1W/Fr3YUWNm+9BkmktIcVwFg6+4iPTlzMeYh+ynhCZt9XFcN4M2Cwzx?=
 =?us-ascii?Q?ajJvuhgkn9GOLCoJCiq4avGwaW10xxxEJlYy86jPx4dOhEzOug/E2lUd/gU3?=
 =?us-ascii?Q?IJAOGxQ2QWFgi2YVX2fwRPNpsL7pm65tCfPdw5qEEJpzkSuuDAUYULRsXHMt?=
 =?us-ascii?Q?0AkeRHVCkx0m6K+q06cb0ukTh5lLggu+U5ku/XExoL2GzV4IQK99rKDvGzSJ?=
 =?us-ascii?Q?SEMlxTjXSlHO7WWBv30ia/5cN5tsRCUSxvulBmRsXiAo/U7k7I9dlEbNPFp7?=
 =?us-ascii?Q?T7Z5uphW1VTZ8OctXiU78WYI8LBDvHsDbLPmjDBqhUSft4Db2y2fRe9g1OKK?=
 =?us-ascii?Q?SgOPyyQVsfxvPsB2kJ+t8oQnni+MpQkue8cyUq/3uYV+aTDUWLl7/p2CGaAF?=
 =?us-ascii?Q?hsSv0ykXn80G9u8fqGWiUp7/mEZhigu3TYqVmdArSNZVWH07k+RI0J7SEDxV?=
 =?us-ascii?Q?+yo2kjUFR50JuTCTsrM3GSUTjjNW8qTgxMNGIjvDkOU+Y41SRzsRPmnrDJaa?=
 =?us-ascii?Q?3lQW2UEGORNERJzIjjKpn98D4cl5bUolFaPCU4VFlM+LxUY68WIDx/T1wZ2J?=
 =?us-ascii?Q?K9pNkU2CNPAWqs0c30HZg6e+BPLdYZrMXe+iryjt+Y/OEHwKPzuuga02alN4?=
 =?us-ascii?Q?0K0OTwqTIkgQFI5mkDvHbD7Tsj+aMkejEvjtcv07CMSmlvURJEU2boOA24pT?=
 =?us-ascii?Q?knwQb191HEPFHRkpl5mHSm6hVkq0iNC7j/HVKg34ObN04OOasIL6vnR937V+?=
 =?us-ascii?Q?yIjq2jX401jUe9GIsGe60HDo6WpS1fXOy+5YzKWeXVkWYcaX314SEbYUYVtD?=
 =?us-ascii?Q?fBXJTu1PKx395GZkZ/lxlfr+w21RpKraA10yXhsoUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qgnS6Vl3Kz43p1zdUJ9eWvGT9P9hLyDLTBYMnK0yukbbLBbYCrCTUbOkMbIO?=
 =?us-ascii?Q?+rsJ+GQ7oShkpemyH0Ust/u2+32UTuVV5cFrzTVIjCj485OhdT0rVs8nGj7V?=
 =?us-ascii?Q?evFFmAUi+4RNpLETtz35o7iQvMQARGVVc6DdeZgZ8kGWcLwsZQFuhFC6JT/O?=
 =?us-ascii?Q?BED+n88sLuWCZ5ik2zMj47E27iYPxuJWrISbDBpd4DHOHksC/p62CKpAxOMY?=
 =?us-ascii?Q?Miu0vYf8TJbRscLTiHn+47gyvFQcJMM2H348c5eIxxsCqFVcwSUE3ZBGxY3F?=
 =?us-ascii?Q?ReQejBwoci5oHwOxFZ6zzBVnKesRHmpCwfdrYJ42aj6PTz+dltFYfxPc4ayv?=
 =?us-ascii?Q?4ITJPyec+Hg5l8bs2jqanHvA3cweGO5TUqwF+EAzH7SaJF0ZkD9REVAoeG8u?=
 =?us-ascii?Q?G9N+IReG8OkMjq2DgXeMAgv4YjB3SxUVXnuIRYXyrupGCpDRRq+ryL56cK0E?=
 =?us-ascii?Q?S3XQNjkNucl54uMAgyHzmbe7fpM6APb2x6jv8owGMC1zZQhOKOe32u9ZW9NQ?=
 =?us-ascii?Q?rxfZ5BKdUNjtNoGBkWtjteCT7Rxegw2j2aMnDTC++ODD/Tn0vUwTnUqPko0F?=
 =?us-ascii?Q?21TZojvbc+leLsJZCVxmsC3P1Zzv8KAbzR70IokTvbXn/5FTnouoz8semfJe?=
 =?us-ascii?Q?y9+HbVCTD2wId5fYydtZ5LtrzpO9m2Tvy37g03QmqvdGf4biwk0mfh2aGa3Q?=
 =?us-ascii?Q?s7/uH+IzEiGx9DgT8OTo6L024fE79ynL+qKXX5bWT0i2zvY9zt+M8pg4womJ?=
 =?us-ascii?Q?4DlSk0L4oYOyjUyH0MUi+r6ShBDnhFI9R0z02jrKgXPyaT0YzYJStVkdZ41B?=
 =?us-ascii?Q?ieue/F2PhripwVRoHwoC4NfVAgjusZlpsWMqRMepF5Hf2rLq0QrZeC0N7jkd?=
 =?us-ascii?Q?Qseyx8M+eCTFXFTdOmtoiM5lQ9wN3xgp3bo3JHnFnH0Lgac2YAOxZ+RNkcKJ?=
 =?us-ascii?Q?fgzLKX8ZhA/Ml+i38hOqxwUk9/BFemCeKK0s7lBHxS59Gv11YmblTgMkgOpr?=
 =?us-ascii?Q?g4izLoJXLnqImJedj7GqL7PpPLlTTACtBo18FiBkLsPliD9l3IdYZnZ04QD2?=
 =?us-ascii?Q?yYVN5iVwTfvpL2E6VpgNrJKwC5AoHdYQsNDSIqIiE0AgigAS3TaIrBZsgzo0?=
 =?us-ascii?Q?EHM4l1AuquhKYJ/k28apAtbDEJZrVptDotQ3Rt+usckiguP1/0SXm4lHynUU?=
 =?us-ascii?Q?fDAiWBYcnpC+5MyEewUUe71Xn3fpy82akYIlxXSLtdc09uiAiU31/PO2UpmZ?=
 =?us-ascii?Q?DmNVfJ1DvhIdvwIMTq5KywTuoTACumo4IQ9q8lqnE1ZWEb4/+w5BlEDpfj2D?=
 =?us-ascii?Q?IXsdRW02sRGtL81T1/CsaeHT4h9ihGZxEognbaVOyGMUjQvh+5tpyP4eIBWj?=
 =?us-ascii?Q?WD+u8Rl6EwKpLo15RJscNQBP7otLQd8VnPmHkbDqafnYNgnPGdsHB8Adudro?=
 =?us-ascii?Q?BKYpBziwCpJ6drG3+pqYuVROO7ZFVCk5EWg+4LT5yfiYFNhXxNAv5/3gOfUR?=
 =?us-ascii?Q?sH7sgSCQEM4MaNjSrNfVIRz+pb49zzKzLkgFSnDaU6AKYqVEXtod7fQVuk5V?=
 =?us-ascii?Q?Xts9PBsDY/0BqKGJHUh276jkrrKDW9Gy3ys3FbP0R5L2lReu4nCoeYEo7gQI?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d210557-c378-4aee-e32e-08dc6f9a7a72
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 20:07:25.2455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrcfmD4BIeOEmGEybzOfDzw4wza2lSiNDNf2UMP/c1bEBHRiCGKiVYlLRRPyI9SJviZ8Z/agbeWayevjoxVb2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4832
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

Prepare power-well and DC handling for a full power
lost during D3Cold, then sanitize it upon D3->D0.
Otherwise we get a bunch of state mismatch.

Ideally we could leave DC9 enabled and wouldn't need
to move DC9->DC0 on every runtime resume, however,
the disable_DC is part of the power-well checks and
intrinsic to the dc_off power well. In the future that
can be detangled so we can have even bigger power savings.
But for now, let's focus on getting a D3Cold, which saves
much more power by itself.

v2: create new functions to avoid full-suspend-resume path,
which would result in a deadlock between xe_gem_fault and the
modeset-ioctl.

v3: Only avoid the full modeset to avoid the race, for a more
robust suspend-resume.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 10 ++++++----
 drivers/gpu/drm/xe/display/xe_display.h |  8 ++++----
 drivers/gpu/drm/xe/xe_pm.c              | 15 ++++++++++++---
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 0de0566e5b39..4b3fae8b4893 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -300,7 +300,7 @@ static bool suspend_to_idle(void)
 	return false;
 }
 
-void xe_display_pm_suspend(struct xe_device *xe)
+void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 {
 	bool s2idle = suspend_to_idle();
 	if (!xe->info.enable_display)
@@ -314,7 +314,8 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	if (has_display(xe))
 		drm_kms_helper_poll_disable(&xe->drm);
 
-	intel_display_driver_suspend(xe);
+	if (!runtime)
+		intel_display_driver_suspend(xe);
 
 	intel_dp_mst_suspend(xe);
 
@@ -350,7 +351,7 @@ void xe_display_pm_resume_early(struct xe_device *xe)
 	intel_power_domains_resume(xe);
 }
 
-void xe_display_pm_resume(struct xe_device *xe)
+void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 {
 	if (!xe->info.enable_display)
 		return;
@@ -365,7 +366,8 @@ void xe_display_pm_resume(struct xe_device *xe)
 
 	/* MST sideband requires HPD interrupts enabled */
 	intel_dp_mst_resume(xe);
-	intel_display_driver_resume(xe);
+	if (!runtime)
+		intel_display_driver_resume(xe);
 
 	intel_hpd_poll_disable(xe);
 	if (has_display(xe))
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 710e56180b52..93d1f779b978 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -34,10 +34,10 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
 void xe_display_irq_reset(struct xe_device *xe);
 void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
 
-void xe_display_pm_suspend(struct xe_device *xe);
+void xe_display_pm_suspend(struct xe_device *xe, bool runtime);
 void xe_display_pm_suspend_late(struct xe_device *xe);
 void xe_display_pm_resume_early(struct xe_device *xe);
-void xe_display_pm_resume(struct xe_device *xe);
+void xe_display_pm_resume(struct xe_device *xe, bool runtime);
 
 #else
 
@@ -63,10 +63,10 @@ static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
 static inline void xe_display_irq_reset(struct xe_device *xe) {}
 static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {}
 
-static inline void xe_display_pm_suspend(struct xe_device *xe) {}
+static inline void xe_display_pm_suspend(struct xe_device *xe, bool runtime) {}
 static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
 static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
-static inline void xe_display_pm_resume(struct xe_device *xe) {}
+static inline void xe_display_pm_resume(struct xe_device *xe, bool runtime) {}
 
 #endif /* CONFIG_DRM_XE_DISPLAY */
 #endif /* _XE_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c3ef2283770f..a2f5a1b11cbf 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -96,12 +96,12 @@ int xe_pm_suspend(struct xe_device *xe)
 	if (err)
 		goto err;
 
-	xe_display_pm_suspend(xe);
+	xe_display_pm_suspend(xe, false);
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_suspend(gt);
 		if (err) {
-			xe_display_pm_resume(xe);
+			xe_display_pm_resume(xe, false);
 			goto err;
 		}
 	}
@@ -151,7 +151,7 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_irq_resume(xe);
 
-	xe_display_pm_resume(xe);
+	xe_display_pm_resume(xe, false);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
@@ -366,6 +366,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 		err = xe_bo_evict_all(xe);
 		if (err)
 			goto out;
+		xe_display_pm_suspend(xe, true);
 	}
 
 	for_each_gt(gt, xe, id) {
@@ -375,7 +376,12 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	}
 
 	xe_irq_suspend(xe);
+
+	if (xe->d3cold.allowed)
+		xe_display_pm_suspend_late(xe);
 out:
+	if (err)
+		xe_display_pm_resume(xe, true);
 	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
@@ -411,6 +417,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		if (err)
 			goto out;
 
+		xe_display_pm_resume_early(xe);
+
 		/*
 		 * This only restores pinned memory which is the memory
 		 * required for the GT(s) to resume.
@@ -426,6 +434,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		xe_gt_resume(gt);
 
 	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
+		xe_display_pm_resume(xe, true);
 		err = xe_bo_restore_user(xe);
 		if (err)
 			goto out;
-- 
2.44.0

