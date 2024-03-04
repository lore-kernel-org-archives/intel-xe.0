Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591BCC5478C
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 18:22:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C29211244A;
	Mon,  4 Mar 2024 18:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pvm2Ubbj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2308D11244A
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 18:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709576533; x=1741112533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=z/fxDe1htYCDKmIGrS5hk+rJDYL5l/SD1DPgLriSsnk=;
 b=Pvm2UbbjnokDZoml+HYu9mfmj3O79AdKmKXtzO2zt+WUfA/IvM99cCis
 i8ERL9luQwpiF9bHoRReSNfHMaUtcj0UD4VcuxFOqKXfCh+3AR0JljT1P
 F1zILkHa4yYlOeO2xF8bcWg5Dz3eywBrQZ39LmdCTZLC429F/v9C5qEsZ
 wC0yg/P2SKKJAa11Z9mSOkXt7jwqYcOiMdbx+rVCdqIvBTPV5pWhdNdJY
 /JPMiEEA/c+cvzRC6C/AVpbX0jQI+f9Kw7BPe7RcwGUdSmkTeSRL626/f
 8GYo5GBxyJQn8e8ts+XboyQwWHW/Bk1ESk7vDeHwmqGdvtx/7W4Ro2Slb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3942764"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="3942764"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 10:22:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; d="scan'208";a="13754680"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 10:22:13 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 10:22:11 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kw0CkuDmwQ4LnGnfLg/IZzZgzEpMpTnD+fLmw8nKoZWJZ1i4AYT4AILstWw1yoeXFTGfFJ2XQALAm/FJYeZu6rvbaCZAByotjvGlzbIv6szW3j5W/UEV2MTncliZFAj0QPDlyAQjvqt0SFf1Y/BinhZhMwsUsmZQhhon6C9uBCxwXuVVn11iWdWYckYmJmMc0s7hrQqAHM2U1XhyJMoM/eIFQYXcX4h7ZVFRik7vuEWbfP8m7SiziXZ2fnH3PcdQm9GLrIaiN5obRAn7Ihofdzz+rDjs5f/JBWr3H7RNsWQmXULLflSuEy7r169QrZJXpub2H485ilOC9niVeQoZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/l2odAxIl9t4W/AgV6UGoaf7ljdoO7cZWg63bf30CCI=;
 b=RCNtF9j1K1SjHv/ar/ACCF+WhjdovncYllAcDn6cg7eubGqH3Xe4GGdkaCXxwt60aqXoS4sWiMKUdtA9KoON9R2DK1LDV/GH3uyS+HTpk6EVhAjWsVfJhp4QY42lMQ6BwwFcdDpdWOy8maB/ls5IzE6Jlhey/RObyRzbcGAhyaSLkaUhwb99UaGsXZfgMhDDiQBNqYolBh25j+w9i95NFNhRlKrsEI8Jiz7XrienON0fDp1a9DH4owKQ5avX8UwvDRcBKd5gEV9GNiBxqssx2SeiwZ942MNf5Wc71F+hf7J+r12pmN/iTJc2DfKtzpXtZZNiEIfDrGQ0TD3tNjXpBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Mon, 4 Mar
 2024 18:22:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 18:22:09 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 4/9] drm/xe: Move xe_irq runtime suspend and resume out of
 lockdep
Date: Mon, 4 Mar 2024 13:21:49 -0500
Message-ID: <20240304182154.42611-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240304182154.42611-1-rodrigo.vivi@intel.com>
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:180::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5133:EE_
X-MS-Office365-Filtering-Correlation-Id: 46648fa0-9e2f-40ac-f999-08dc3c780106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Iq1dV2gLc5sDX3/la2eboZWRz/H8ytcfy6GYipXLJT5PIV4T1UAUPFfqZk3W6PwHuK1ECCEmbWob6lNwT/D5CoobyQnuyby5ic31TJWQin9ultxd6yM/H+JW/vooHyu2RvUNzwvwVPirLKywWtT+ft/qi4SfZI6gOvB77mq7KptxbXBWUh5pJDH2CXiHrktHOh5PjvmkDpUZ0JlwyUtSxA7tQiCoWXh6eO8TPpRIrOo8DEhhOaT+0cpqNuEOv9jllS8DZ2R4KfeVjFal7IAuqxmZ0gDcE+5fjAx46vA44qjTuteRGDImaNigbfYEFnUlQaA7qQugzx8fFmSxQItZfehdc773UDEPWgpCT8Ontbrj4OmLF1Zpwht3aiip5aL8IPHNImDXVjCg96QRliQa8cajLyPAFZTmb5TZAhzPwKqYT42SAjURYrD63hu+QYDR8FDO1d0YiukhLBvGVhX9CJ47M0CEd07P11kveNzcjCUyu2nFclJKnKu2evQEOC16BkiTPM/Rba4loVYybWkoEXJrRusPJmnqj84V9aFyK6NhCug2AvEb5+V+cVnE0spGUjY5pwh9VwW9TjxdMGvGSJYod5JvTxecxHdpzNce++frdenr/w/F4pQkaMp577cFITEDTrnd4JJHu7ZxSor/WytVCYwRUPOIiCyuRkku3I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZKQ3dXUZG1IXl0rhQNNGSAaGCcV60rzij31LVlNwmVvZ3ZekVIRl1+nvjJlO?=
 =?us-ascii?Q?yJKSuB9FdfQaZcw6k112uwjIu8SAbXTHchRuPARR+OaGFDv/jHgycBHpEPk7?=
 =?us-ascii?Q?9HyyLWX+WwbOYSdCloGZw4ukpWlOhqReWGNNfnKbPj3Qp21jyOO+gLNVTYwT?=
 =?us-ascii?Q?spInjCGhjcciNgC8To+POUc9CRSN+clxvkB5W2ayHkrta5FfxV+k6QS9sDBf?=
 =?us-ascii?Q?KQLSwBWqjxUCkJBNPHAJuO+Vx6prnw5MNCUYIpp60CzQuLWHAz5CCPrmUBfa?=
 =?us-ascii?Q?1uRy6Fbr6pkDDpA5kAAMHPzimMP4WNNvafKVvpkVqN7u0S+WhXOly/Rvel8f?=
 =?us-ascii?Q?e6nuCQ4n/3JH7+VgksVxyJW6a7xanFaz3vv04T+LXqEer0CcdRPpXPa/oZxd?=
 =?us-ascii?Q?67xrEGGxOo/T7fdh0ckOhghsj8PJ9RNipe81f/OgTGYiRqeI5XGta6Knn4Uw?=
 =?us-ascii?Q?4Uu4erR7OPB7NfCy51d0utTj/91Xv7tuTpcmkJKqx2vA7rrky8pNbKgrh+LB?=
 =?us-ascii?Q?KZMxaFNsMGkWOE06cH/X3GhcJOwb7ednKreSpY2VOWw1yFBHdU6ljnQFAvZo?=
 =?us-ascii?Q?M34plnsYXigcZASPfnsgZWSp4lR+Y0l9ZKX2hOjdhc4rXnAoZpIc+KIfsJDn?=
 =?us-ascii?Q?W8B6N/2SBiQTZhmTbAi71egaR4Bull6I9e7uaAfHlty6oe+7UgXXauD06Esv?=
 =?us-ascii?Q?ZUoowZLiPzTbc3333zRA6xiIK6xoV5V5RHFFLRvpuyKReUJYZErXXDPh+AvJ?=
 =?us-ascii?Q?JbwB8M+jRFnotCYD3Sdcl266XP7sZ5PSBWi+uSg49RaKiQkYLeoF37rn736y?=
 =?us-ascii?Q?N67+tUKRaI318UsGNfEXFp8PqNiVXuBAGEueMbXbBleEV+cJsuCJM9jTOZrM?=
 =?us-ascii?Q?zH/SUHW7WZY0PG3hDRyPiiZWnYsoY+fKXGu+HoQx0ywB37PhRIdJX0/lIZ7z?=
 =?us-ascii?Q?szY879bfBKFmeKMqsh5Q+JcVusuVh1LTkyYx5NoSpuQZ03e+IIBJpko7Nln4?=
 =?us-ascii?Q?0VaB51GcbLs+aaGS35J8Es2TB9jpodN3zFPazbulqdcABblwvfP87K6O+g/H?=
 =?us-ascii?Q?siWjtwTtA0OiK5n8mkjM3IufZgfukITu9fRHz7ONDLh4Ij51UZbxbKuL2H/S?=
 =?us-ascii?Q?bw3BDe1lGRYT39XV7/HVnCtfjSLj2inoPgnFpqA0zmwR7O/BQeo7sORMyG6d?=
 =?us-ascii?Q?LAXzZZskrBwAZsgVhu6BtvYweJQwjpwuTSwaEKdl6zfFThQPTXxI4GKeSJBR?=
 =?us-ascii?Q?8mEXrFwwkR4NUYZ75G6fLtqkJSBWHSoj873wsBSjIH4frRQjQ47SU1XCFJy6?=
 =?us-ascii?Q?xsOud2T1mNRRHiAZIqmAODwpJqS36/kyqu/Gm4NnQyNYpriQFLwmWNe5ZR73?=
 =?us-ascii?Q?6n/U3k974p5Nv7AIlBtzU1NBmJQ3GEuBbCfGMA8gQSIjzBQjSOrVgX3NzR5O?=
 =?us-ascii?Q?AANIAN0fBC4XWeB2rOvD8EC4iWUQzY5rBZFbu0J2uVFiIi/USHOMXqHJ5D9/?=
 =?us-ascii?Q?Jdmz5bZE8J+L//srVmZKZ3KFUdJLGGrs2CK369nZT80KX8IYQAoyqT7kQo9P?=
 =?us-ascii?Q?KISKS4/PWhsbJd/l5QIW+gQVwdkJyPUkgi6gjsK6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46648fa0-9e2f-40ac-f999-08dc3c780106
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 18:22:09.2730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JDfDQVtJoKrMu3jH3am5nnKzTftoVepXs2zqkAdSXrQxvjy8+wF8MjKVgCwifSBkM7dPAXBzIQmn+xF1heD6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
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

Now that mem_access xe_pm_runtime_lockdep_map was moved to protect all
the sync resume calls lockdep is saying:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(xe_pm_runtime_lockdep_map);
                               lock(&power_domains->lock);
                               lock(xe_pm_runtime_lockdep_map);
  lock(&power_domains->lock);

-> #1 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
       xe_pm_runtime_resume_and_get+0x6a/0x190 [xe]
       release_async_put_domains+0x26/0xa0 [xe]
       intel_display_power_put_async_work+0xcb/0x1f0 [xe]

-> #0 (&power_domains->lock){+.+.}-{4:4}:
       __lock_acquire+0x3259/0x62c0
       lock_acquire+0x19b/0x4c0
       __mutex_lock+0x16b/0x1a10
       intel_display_power_is_enabled+0x1f/0x40 [xe]
       gen11_display_irq_reset+0x1f2/0xcc0 [xe]
       xe_irq_reset+0x43d/0x1cb0 [xe]
       xe_irq_resume+0x52/0x660 [xe]
       xe_pm_runtime_resume+0x7d/0xdc0 [xe

This is likely a false positive.

This lockdep is created to protect races from the inner callers
of get-and-resume-sync that are within holding various memory access locks
with the resume and suspend itself that can also be trying to grab these
memory access locks.

This is not the case here, for sure. The &power_domains->lock seems to be
sufficient to protect any race and there's no counter part to get deadlocked
with.

Also worth to mention that on i915, intel_display_power_put_async_work
also gets and resume synchronously and the runtime pm get/put
also resets the irq and that code was never problematic.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b534a194a9ef..919250e38ae0 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -347,7 +347,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 			goto out;
 	}
 
+	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_irq_suspend(xe);
+	xe_pm_write_callback_task(xe, NULL);
+	return 0;
 out:
 	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
@@ -369,6 +372,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
+	xe_irq_resume(xe);
+
 	lock_map_acquire(&xe_pm_runtime_lockdep_map);
 
 	/*
@@ -395,8 +400,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 			goto out;
 	}
 
-	xe_irq_resume(xe);
-
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
 
-- 
2.43.2

