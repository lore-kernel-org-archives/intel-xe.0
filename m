Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A41E77184
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 23:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2144C10E2FE;
	Tue, 17 Dec 2024 23:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="il8Au9Bx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A013710E2FE
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 23:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734476776; x=1766012776;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=35DG42vf21h1Hkih+z6LJGLZag2rOCC3ufu8CV0HRe4=;
 b=il8Au9Bxjl2ttZEGNUNMam+SUCQxd7YLQLKonDxeKkK337iTG6VmE+yP
 HUdUQCZkjVpxDR9EwaxmLt0NbrCIq8FojIvAGD7SEKNaQR+N4Jf8H9L3H
 y2Oa7Sa0asDSRCgCdhFIGIal7fomcu2lSV9M2xhI820+3sGTJJa+dP6B5
 pZPUXnG8ve8PgQ7QZo8hjqe0VCEbGCm+dD5tN9ZFguk5+qWLGRybJ2jMS
 +GZu3uo7X8BEzEIdcyGRgWRnKahH+Q5mDB42ctsT8T1KyPPMhP8+e9w2n
 J7vBdVza5Eve8vzz598gHuPQcUzgj2X0QIOwwD+PTKd1qgbfN8/QDVZOo A==;
X-CSE-ConnectionGUID: o7o2oSdpTWiT9KlRp3Ut2g==
X-CSE-MsgGUID: fbzIAoCgS2exryB3OAHL/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="46336339"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="46336339"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:06:10 -0800
X-CSE-ConnectionGUID: AEMPrcmGTtaPvNnoUao7eA==
X-CSE-MsgGUID: iFW2kgNISJqduc7t88wQDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128655606"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 15:06:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 15:06:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 15:06:07 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 15:06:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yd3FQL3Ka3nz27fV4J/ekKDjMPqMjOUzG0AY3Iwz3sZcAbJIWoqx2ImgxFEq0LSzMrIQ7HfAFmPd8x01hyqnHbSmKC/BkE9rlye4qRvPc9ph5B5STvL67WfGerwzykndx9+tJ88E96t1W1XB2GqXYjPC2UUQoiPRWuFwlk7LrLnFSXHr996Qrl0Hls3/F494G+m6wPeGu5eQpMwdF6qXYflyuYQUMwOX1ZAgJsP3voGjT+7wc/X5iAMiRfltpabQmenFD6fuywWfXmbEXp6Em/74k4zUh3sdOsE1JzAA3oJEvSTofWEqyJzQCEMJTul/ZF2xBRWrqgESzYLma0lpVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SXX41Rs6BZ5fVnhKn0cCyoyZY55cd4HX4Ydzy/Pnw0=;
 b=AtXQmjGVGJhuUxEgE7xrE9c2cK1Zbu9Nsa+EYxIToV3VqAQjJBsHsAwx3/FypqAkrYQEbvpNX/3y+k0iQ5Tli69DuTPjU4gIP/ukpkOjXq3fXp3zEe/TMBVcK81/HfoEIEgy0y9XOmbM80iXwKwEOEkBj8zU+VEwWAPS1/veHBnH8oNg+oR+GLP3yer+kPw7g/O1EepEwa+W/F+X3CxHFy1jhbSdaGBV8mrwNjz4y0aDRfZxQNXH0Vi7BS69rmEUAKQj0SRAPwcCT4qPtSlLn2WL0M+Cn57jBlAPd8jo1iqmzCFTMT+hbxnRJOJISkyjIGWl/fv+X0sEalhc6dPuQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by SN7PR11MB6994.namprd11.prod.outlook.com (2603:10b6:806:2ad::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 23:05:51 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 23:05:51 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Imre Deak <imre.deak@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/pm: Also avoid missing outer rpm warning on system
 suspend
Date: Tue, 17 Dec 2024 18:05:47 -0500
Message-ID: <20241217230547.1667561-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:303:b5::31) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|SN7PR11MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b4fd04-91fb-4910-94ad-08dd1eef5a18
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QnYTz4j2+Y1+Rdp6s+C07lNSptCVL/kvsSf2a8XSzBqzA86nl6A3GhNFBjGM?=
 =?us-ascii?Q?0jJEom4blZ657m1oJqVQoGiKpAzQ6o6me3KF1sy0Wf4GEo8/pAsB2JbWeRfb?=
 =?us-ascii?Q?XDrvkwp/iWiAwFVGRYksrSti7X8cwSh23HhNVTJcn5TZmE0oNg66A0PXLlNM?=
 =?us-ascii?Q?aRIywP9wqgZAR3V0QkrR6QTI6IDRFhIGiQBWOw7dst4VY2utwvXgfBGqgsRl?=
 =?us-ascii?Q?mwWpdNsc4mdaTyGm7gFpwXcc54S5pHAhkosPUIwctxH5rL6qnM+pXKXKgzXB?=
 =?us-ascii?Q?nv3nouy3S030QuCH2xMKjyJbQ4hTTfgLgTlnvnlfZq8M9YWdWYJBZQvkiuoK?=
 =?us-ascii?Q?7QezX1Zmcu3b6qgdQ2yLClgKnOOLabexhaMp1weSDFZxQVuW8qfMw3TOLxpX?=
 =?us-ascii?Q?oPEetC1ux1ptb8NQ5dvIRsiPnCLuee6ouMj5hTZCMONZefJk9uIcPD0ybHV1?=
 =?us-ascii?Q?WZ5G9JOcd7gdgomQOq+JjIfqLG4ned87TTrxVrwIyVOD+3jdCuSmbiEj84zv?=
 =?us-ascii?Q?t/9uzKBEAWo+3pOq5B2+x6EBVn82+mWcSbrvBY0mEblB+W5+bEPDvgdTS6T8?=
 =?us-ascii?Q?49rLg0VAh6gG/pb8XKcvsqo5IEtrsNFaQBMC+Z4y3ZiP4Dh/2+c3iN3EqA/i?=
 =?us-ascii?Q?paJcwuvWHIF4OfGp6dd7sLXInaiEbJty0iW3xIXAsDODboM0YSjuu9k1XSs7?=
 =?us-ascii?Q?Jf94LLMf4bcj06sEwNrT3DpEVyiZ/56is7LPW0d89MpU6zBUx3fKELWRFoB7?=
 =?us-ascii?Q?/m70wm6zVS6SlN6/5c8dtNHhSSqoMIy/1+Qi8PCt8EfCSbkKmwykwcQIuAuP?=
 =?us-ascii?Q?geqeQtRhS3HLd4A+zjXVweVEFVscSJfJkj33OkGLngcraoJOoPivQq9J22Bz?=
 =?us-ascii?Q?0v8ScHhh6oRY6YIkELrkJHEUdaqq0fHigPIDkpEvH1qmuQJamibHuehan7Ta?=
 =?us-ascii?Q?Nm20u8nd0lfQCnWWPPQvdCsHQTFHwuGlHnC/kSE5Ds7zZM9WsMQrfwAHLdhu?=
 =?us-ascii?Q?p6SEtYX5GmxNgYIM8FiyhfuWWbgOxvAIynVo/GnSoGFvgbO+Usf5DEUME8K6?=
 =?us-ascii?Q?XLGVh6QKVvcNnNct6frvCYPuLniLPBq19xuFfBMIbfTUdHqqxU3SMWPi5b3R?=
 =?us-ascii?Q?1V22jVDzNUx7uddkAEU6jov9PemUXgML3M0+KL28+F0q7mMNb2D/wiDWHTQf?=
 =?us-ascii?Q?GIqr15FntB+b/6McBY96UsVDBO0Bajcot6yd5Ifb92t72mDzjLG9NcNEb5vc?=
 =?us-ascii?Q?BseTW+iHK3oGAJ/9PWZQ1UYjkZWzSs9S+DYNa3W9nO7Nv4NuxHOvRhozZbcQ?=
 =?us-ascii?Q?7rOfuR4t1na83+PB96XAkJMLyOVfzsNMgPpl6Bc5VTmz86PS/zwFcjkfnnvJ?=
 =?us-ascii?Q?eHmxgXZ0cR9nTe9RD6tPrSMI7ymj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WZvPWj8v7hxfRH4TtTZdUySiIyyFggs8AsGDa+ZDrbbSJ4b3fnCj7YyZP2xn?=
 =?us-ascii?Q?JHPz/V+hSR4SiYISVXc0WYsRjw8Qi1yNu/f8kgFsQVjLXNn/0h9/+hYb2+wc?=
 =?us-ascii?Q?zfMCstBoxQCx71TpovwWfAMEX9E5PG8bSIEzdimbzGwpatCNh/1ffosZXqW8?=
 =?us-ascii?Q?I7WgxfYmP/GpG7tkVspl6lkZAfio7rt0TlszcI81Lshp61EdYAWXVpQb1QvW?=
 =?us-ascii?Q?+YNjyCQ3REXzqrQWJNgytWvRy9drcudma9AhM5Y+t41b0QFjdbmjULqxgAjm?=
 =?us-ascii?Q?LsBw/IgNwiccvPRplw2xjQ96b8FRo/rnU8NDJuRmNjXm8tNOzBrtkUMotnGT?=
 =?us-ascii?Q?72UEoygc+caa+BdbqAnHPeZZfV6aRT6Y0uVTnPooS4IIMWGqSMIY7bR499En?=
 =?us-ascii?Q?3HanOLWOWY+w4Y68Zve+QAeqcgV4B8IPR/VzzhA+Oz7+i+kg0BS+AcXvrCOx?=
 =?us-ascii?Q?KbPDftSEbFS84RW+GyHjmk+VZ7KL1aowr0fKjxM4luMJ6/a74sU8eN+flpVL?=
 =?us-ascii?Q?DWLhJOrAMb4ikx1mhEiAiLcOF7PKDTA6mkQp976dImVeUt90tE4TJkkVVJ3q?=
 =?us-ascii?Q?aDJvBcqqN0IoNsGUavkzv2+oSothC0fAlosJuXuB2q2QUJdAI8cjqX15Hyza?=
 =?us-ascii?Q?IXn+iJfcDOLq+9Bc6gNysLdeSr8EstBuZTOIGes9udLTM1Bt44fjJ+INSwmN?=
 =?us-ascii?Q?YFAkgyCxvaZdqfFxcjR362kruMaXfy5AOc/ovFlNFEN/4Qmwhsi9DqDq5C3V?=
 =?us-ascii?Q?L2ts/OdKdXUgCQb6SU7tIKgrhp9OHnp8BFNqJUsiild/bpaO47IN0jYP0s5i?=
 =?us-ascii?Q?k8L9sKaYjC+DsIlXbMyl2Vx4+VWHhtt5H/UpUtmm5axowRF4XzSVXdUy7TEp?=
 =?us-ascii?Q?cykt70LFlSEpvQ7MaGuR0Nh79q6M3fkaryfxwnUX2BtMAMx6iH/kSfQZV5rN?=
 =?us-ascii?Q?KEZ17t83A5BEag9fyBcrPbHCHbTuH+ciSujnfaiHpAgagFUpahZLVHs5ptJn?=
 =?us-ascii?Q?lJ8PtO+A8mrPZzbaa/iL3YPHnlc47g5Uk6uLJ94ymzIEUvvPOxJFUH18CAw4?=
 =?us-ascii?Q?FULgHorzOzH2s9oOlQkLOX2YGD1+6CyB7uiRkPnB4f5H5HNMqlIkl44R07Fw?=
 =?us-ascii?Q?cacDnasobbUf6h4yeuLlShSPADLssibEC+TM2ua/nxe4+4EETfjijuEPGq78?=
 =?us-ascii?Q?zcKLetAHvp9SSqnEfYlodcjBt11GrxrcPfQTSTr/+3vuKTg8umMsEZEQVMIx?=
 =?us-ascii?Q?vFYLAvyXkoIAndXs7YAyqDw0YnU8nL4XV9y2bpj62AtiDH2TdF5CmQ2BnOOT?=
 =?us-ascii?Q?ssEU+Nof9kABEO0f75DpIir7+z/zNpYxt4WZYqUG6lKxI9Q2D6XZzjtNFZIA?=
 =?us-ascii?Q?Mq5MtYFlYNseRSrfWGSGYPr6e/+nZekamyy8bl865NqC/75vS4ZNCcSptapt?=
 =?us-ascii?Q?taC5uKtGsGa5yEvF3wz2+MEtlxA3gEVO3RtEhDDJ+D00a51IE8/NBSywRNKi?=
 =?us-ascii?Q?AN3KPlT7qHT/AbXBYV3vCO7dojsj2LyXRrOC0GvT8bVLoWNZ9v28rU28k6zN?=
 =?us-ascii?Q?klXAAY49AXPUMLr24n4mLFni8lvv4jMUEVFK6z6S1aBRB+OYljlVj2kx+bB4?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b4fd04-91fb-4910-94ad-08dd1eef5a18
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 23:05:51.6609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKHVwwDJP6a7G6JNU4RpCKc7qV5PEoSpO74hEskeFM6x7aVOryzt1E34r8HGprf0kVum6jSpOvp+LJUjh4fK8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6994
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

We have some cases where display is releasing power domains at
release_async_put_domains() where intel_runtime_pm_get_noresume()
is called, but no outer protection. In Xe this will trigger our
traditional warning. However, this case should be safe because
it is triggered from the system suspend path, where we certainly
won't be transitioning to rpm suspend.

This wouldn't happen if the display pm sequences, including
all irq flow was in sync between i915 and xe. So, while we
don't get there, let's not raise warnings when we are in this
system suspend path.

Suggested-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a6761cb769b2..c6e57af0144c 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -7,6 +7,7 @@
 
 #include <linux/fault-inject.h>
 #include <linux/pm_runtime.h>
+#include <linux/suspend.h>
 
 #include <drm/drm_managed.h>
 #include <drm/ttm/ttm_placement.h>
@@ -607,7 +608,8 @@ static bool xe_pm_suspending_or_resuming(struct xe_device *xe)
 	struct device *dev = xe->drm.dev;
 
 	return dev->power.runtime_status == RPM_SUSPENDING ||
-		dev->power.runtime_status == RPM_RESUMING;
+		dev->power.runtime_status == RPM_RESUMING ||
+		pm_suspend_target_state != PM_SUSPEND_ON;
 #else
 	return false;
 #endif
-- 
2.47.1

