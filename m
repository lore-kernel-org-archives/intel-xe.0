Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F9CEB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 22:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE8510E3BA;
	Wed, 28 Jun 2023 22:39:14 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5820410E094
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 22:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687991952; x=1719527952;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5waIMwMDfnXEv71n5ooxTqvjGjoqdhk+x//nFXFf/A8=;
 b=FUEm3Oyzkztb9n6xeiErNfKpP2mgYn0t9IkxuDmDPpRnVbOYYlzGNIBK
 9P7nChh2T6b2NO5JkrNekIzhAXU2sLu2vFvx9T/b/NavsyLHRg49nRKO5
 n83AgdE/V5Vwg+sQVnPQUcd3/IW6Ua+V2t/9pydBvbHDSKvhXsTv40Bs2
 CX04ZTP5S6K9bMRjq92H29ujxCaPaegJdm36gFbSRJuIpuA3yC6pU2lXK
 T7iWWoBSSfm26dBfh+j3svxR2d+tt7x/Y8Gwb17U+3K1Ocr+X9tDrJR9r
 pKJGn9tl6UR2gDxvZFgAIezTMZg08+c+NUMS0i/q72nk8UCVxrvXgvkaX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="351770664"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="351770664"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 15:39:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="667293747"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="667293747"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 28 Jun 2023 15:39:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 15:39:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 15:39:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 15:39:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TS9h12oTXIBOcG6+hFWsrDcy2J92xbHcu4n1L7WGEzZxrGbP7EvsgcCkSOTxJqZgZb2D+15jCX4b4qFvSKO7bh+4iMbkoM3sZ0zJQq6RV35KqpkY6j2tr0kC/kbz3VpuJLnRyuGbChiqpX/PYJMNhb5rkM3uj2X9E34nzYfOS6QC15ywNpeHsIjbvHR0RzfBueGpcwRjm7Gn+5LI5YCjeJ07aLFNHiaFAnTnzz8u0a9iNG/UdeRhkLN7JhrwQikc685qFgafkJRMaiV5Kur+i1R6/AJn+dS4X6YfbQ6SF50ycJuTav6V5OjEObKr2flzQN++r0T98PXnMpIbVb85jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzvaIabiyRTvcjThhxwqH2eZabrYFY+xZ52Ku6iFots=;
 b=UIxZgGesDpsXU9l7aKgqQMCh+s2sXtPOwCWGrpEo28hhhGsfc367TSubscnML1Et1/2HXiA9D6lgGEozuHOwK2NjaglXnENJbkEJp4IJB98tKXJdwLa/m4rcbkwYhzjLSAgcM8yJEAjK2AVJGFmu2rqTsHE5SYCIX/Sawwrn6QawphapIkInL3TPSbouNBcQ/nMfDrVVCna3mu0xHpZSDBxrSikxn5a1yMc0kLh/bw4R/la2VclEX+jHSXujJjNFIKor4OPEKjvlBWCRqulJxPvvFmb59dSM0XEUnngKZX8hmLmj2YTcVLyNe7dN0PHQFKvJYw/FVKm93v93MZajiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH8PR11MB6657.namprd11.prod.outlook.com (2603:10b6:510:1c0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 22:39:08 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086%4]) with mapi id 15.20.6521.024; Wed, 28 Jun 2023
 22:39:07 +0000
Date: Wed, 28 Jun 2023 15:39:00 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZJy2hLdxM4DDhl8P@nvishwa1-DESK>
References: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
 <20230628114732.3598169-7-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230628114732.3598169-7-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:a03:338::11) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH8PR11MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f0f31bd-7aa7-4712-234d-08db78287bf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qBd+xu9Eh6cXNtUTiYL0MpzQtOOGCgeRpJXMaE2X+0enozurNIQnWqCWOCe2hdJwxSmI+t+U8fqXFbwAwnj1C4xccY5mUtFHMfK3gFiPqA4SQlONMHTruHSLFbKWNFg2DbuxYYO0FH/JU/P0suRhBNf9td7gfwes/JQMEA4zcIE/g3d1sHOzCVvyMsABdbFP/9xNZLn+gSxVdp+qv+C86WM5201TJxA1U95VXKRgEQdBKUjn2Oh/5tTNl2NclgTVu1P3SNTjMdXoYR+oqSn+UDo+VYn+XjvBm4I1yNQbDcwG41iSDM3AHo0xLznhlmo5LuxQjLufKARVVBrjOSAKm/4r9DEPUSsOrKNOuqiSCtkqALKKhC7W5z1+yQGw0oiX1vgm/ogg0jtHOuPVZdKHkhvPdlpKNWshvr9CO0F2MHI3LQR689prpvHHQQUMAoqtqueJgoR+PSWG+VRefUjj0mELZQnHksdPJ1don5WkQxG0g79ulwnaLrer/gl3MNr2BBRCnDU+YSTOvoC60pur+Go12Etk2HcjD6oDXhmOpLl02+YP64rkMgYK+y4UbKcu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(82960400001)(38100700002)(83380400001)(86362001)(6666004)(33716001)(6486002)(66476007)(316002)(66556008)(4326008)(66946007)(8676002)(41300700001)(8936002)(6512007)(6506007)(9686003)(6636002)(186003)(26005)(2906002)(30864003)(44832011)(478600001)(5660300002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rZ24AklijJK69tIy08pB+NAU6z/S4YjFXnmR+DPZfja7GZfC+hectN8T6Gj7?=
 =?us-ascii?Q?1jL5CiiomiwbG1sq7WKNmMwCk2/ScSdzQ3oz9VbS4QaY/8Nmr+Ou7/I3GM2j?=
 =?us-ascii?Q?Y3KyU5rpyEMUBDTyfN08164aJKNwGznkniuF3uBtIoqKcaJcz5zILtNFPoup?=
 =?us-ascii?Q?B+fp8eywmSmqgkpTuOJy2OsaXIyUZhnkU34fLYqN7186A47OTo9sftkR0/CK?=
 =?us-ascii?Q?nyZ/LZHqRWDA3Ew23X4PMo74SESsbObP+cT42ONjlvYw+woQ+wkolV/tL64q?=
 =?us-ascii?Q?p84EduRj0qCSb3wc+QYA18bWnfgLv0+b6LomQ07WZgRA4bN1xCyHJkMp2yJw?=
 =?us-ascii?Q?l05NA1yG1I0e/vdReJPrqgS+eKZ22MEDyLikit6BaBaJ7QNVsi02sJdiliv5?=
 =?us-ascii?Q?c06tqEghh7C+4/FvqmPN5acv50/3VMsdhtwLwrGDEvSFLuu4muWooTGfGhp2?=
 =?us-ascii?Q?OmFWpmBCpjdCEHuPP2FxiaeG+sp0c+3D7OtyWmi/cZ6smq1fJDK1Pl+jFvbM?=
 =?us-ascii?Q?xzk9EfkZ3HncVNMk3ykIvSDhhpAF40yz4lT0vl9rjBz3RtpSxkzYO09uVAxS?=
 =?us-ascii?Q?3K2ogddjCUfGW0yrfm53HT4v9uiL4K8zpo/KilU17JjmVSKYOjHvRd0OnEhs?=
 =?us-ascii?Q?XmXBH/OSP4iiuH4W9Q0Kebo+RT3r5jIcqqwDAML2OHqIBCk0mXzdEOV2aadz?=
 =?us-ascii?Q?uYrQ/Ef6IwsbtenV044QhE4E8iyLTHNszQWFh04ji5QLISvghKlnZ/AE/Kw9?=
 =?us-ascii?Q?KwczCe5KhQPznpGZnZ9pYjZLc8t7iJPpGFa0BPZi3Mu5w1Ha2ISfQd4WVeGl?=
 =?us-ascii?Q?6ofOtSMbTB1ZZCzh+zwve+Rb6xEVsERp2GC0L0lx4iuFaHLhes3WRr3ikAej?=
 =?us-ascii?Q?FcfNske5JksK9T9LpMCZzjtMkx6ZBDI/M9LRZ51nvXyQB3JJn3RYk5mkKCe2?=
 =?us-ascii?Q?71o/Lt6tx9+dt2I8dXOHGQIum5X09ej9JRGh0O4CE2ZMIQWZXtuYjaQd9hnU?=
 =?us-ascii?Q?GfFWsYt7vrq5bJOz13TLpz5ah6kgmkCjfrYU77akScuxLkIF095hvNn8PL85?=
 =?us-ascii?Q?/pPWYOJLcI0FkRq7/bLxHbMNGDeMFyjtssXCk5vnBhJm+FIio4LhQr4sXDb7?=
 =?us-ascii?Q?kgpQRFJ7/OH+Sx7UOWSxSWxqe0ewK2ArGzQLLK3nE3DR8x82O91cbBRSz9DS?=
 =?us-ascii?Q?HzS5yHMjwznDby7NPVkJMeHWpEEHxu71SRErHFiKJ1ieQEOGnYEr92W75RY/?=
 =?us-ascii?Q?YTSAfsDxEpKiFuUNOcfoEmjrfGaDC9U46hYvg74bSrScrDmTS7ihhcyN0vRo?=
 =?us-ascii?Q?gn7QQ4XFhFQtSySjg4wuQBtRfT06ZLsBIaC6WZTh+RKFPVL1jjOXZgvBN71V?=
 =?us-ascii?Q?5t2CBXRD3FxqajfTbeEWrBUBjyC2mDmk8uwJZdhjbSu8Q7rem46mkuLVPdLy?=
 =?us-ascii?Q?PVt/vjlXfEiJzoxlaPX19q1lXf5c2jl+3hbe0grqmFxjCU/CoZGsxOloBnox?=
 =?us-ascii?Q?X4qiIMgOVA9Z8gUUEGNkEnOTxbmcLVfSXm42z6HqsLgMTvkid8apeHlWjRI+?=
 =?us-ascii?Q?mv9PfSCgod96i2lOle17KiEj9bUX/sbEp0ee9f12fe9g/+Noz2PzXmkKkiBO?=
 =?us-ascii?Q?AsZ/aDrvsz73ahD52sC8Qzo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0f31bd-7aa7-4712-234d-08db78287bf8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 22:39:07.8913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldlHGP9DHCUe5yFs1uQf+pPtd7bn+PO+1/rYYAGHywf1VBYTg+8ucTdyZig4/DXuDdE2BgpYM74EkCwZyis2E4V78SGPcfwt7JOjWbj1ZkBcLaT63MV94SOnIPzXFrao
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6657
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jun 28, 2023 at 05:17:32PM +0530, Tejas Upadhyay wrote:
>Add sysfs entries for the min, max, and defaults for each of
>engine scheduler controls for every hardware engine class.
>
>Non-elevated user IOCTLs to set these controls must be within
>the min-max ranges of the sysfs entries, elevated user can set
>these controls to any value. However, introduced compile time
>CONFIG min-max values which restricts elevated user to be in
>compile time min-max range if at all sysfs min/max are violated.
>
>Sysfs entries examples are,
>DUT# cat /sys/class/drm/cardX/device/gtN/engines/ccs/.defaults/
>job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
>job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
>
>DUT# cat /sys/class/drm/card1/device/gt1/engines/ccs/
>.defaults/              job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
>job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
>
>V3 :
>   - Resolve CI hooks warning for kernel-doc
>V2 :
>   - Restric min/max setting to #define default min/max for
>     elevated user - Himal
>   - Remove unrelated changes from patch - Niranjana
>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/Kconfig              |   7 +
> drivers/gpu/drm/xe/Kconfig.profile      |  38 +++
> drivers/gpu/drm/xe/xe_engine.c          |  58 +++-
> drivers/gpu/drm/xe/xe_gt_sysfs.c        | 407 +++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_gt_sysfs.h        |   1 +
> drivers/gpu/drm/xe/xe_hw_engine.c       |   6 +
> drivers/gpu/drm/xe/xe_hw_engine.h       |  31 ++
> drivers/gpu/drm/xe/xe_hw_engine_types.h |  16 +-
> 8 files changed, 550 insertions(+), 14 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
>
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index d44794f99338..964c440a1135 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -83,3 +83,10 @@ depends on DRM_XE
> depends on EXPERT
> source "drivers/gpu/drm/xe/Kconfig.debug"
> endmenu
>+
>+menu "drm/xe Profile Guided Optimisation"
>+        visible if EXPERT
>+        depends on DRM_XE
>+        source "drivers/gpu/drm/xe/Kconfig.profile"
>+endmenu
>+
>diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
>new file mode 100644
>index 000000000000..bc65326d52b4
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/Kconfig.profile
>@@ -0,0 +1,38 @@
>+config DRM_XE_JOB_TIMEOUT_MAX
>+       int "Default max job timeout (ms)"
>+       default 10000 # milliseconds
>+       help
>+         Configures the default max job timeout after which job will
>+         be forcefully taken away from scheduler.

Should we also mention 'default and configurable upper limit"?
Similarly for other parameters also.

>+config DRM_XE_JOB_TIMEOUT_MIN
>+       int "Default max job timeout (ms)"
>+       default 1 # milliseconds
>+       help
>+         Configures the default min job timeout after which job will
>+         be forcefully taken away from scheduler.
>+config DRM_XE_TIMESLICE_MAX
>+       int "Default max timeslice duration (us)"
>+       default 10000000 # microseconds
>+       help
>+         Configures the default max timeslice duration between multiple
>+         contexts by guc scheduling.
>+config DRM_XE_TIMESLICE_MIN
>+       int "Default min timeslice duration (us)"
>+       default 1 # microseconds
>+       help
>+         Configures the default min timeslice duration between multiple
>+         contexts by guc scheduling.
>+config DRM_XE_PREEMPT_TIMEOUT_MAX
>+       int "Default max  preempt timeout (us)"
>+       default 10000000 # microseconds
>+       help
>+         Configures the default max preempt timeout after which context
>+         will be forcefully taken away and higher priority context will
>+         run.
>+config DRM_XE_PREEMPT_TIMEOUT_MIN
>+       int "Default min  preempt timeout (us)"
>+       default 1 # microseconds
>+       help
>+         Configures the default min preempt timeout after which context
>+         will be forcefully taken away and higher priority context will
>+         run.
>diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>index 33d1fbae560d..37c33a231f00 100644
>--- a/drivers/gpu/drm/xe/xe_engine.c
>+++ b/drivers/gpu/drm/xe/xe_engine.c
>@@ -13,6 +13,7 @@
>
> #include "xe_device.h"
> #include "xe_gt.h"
>+#include "xe_gt_sysfs.h"
> #include "xe_hw_fence.h"
> #include "xe_lrc.h"
> #include "xe_macros.h"
>@@ -191,9 +192,26 @@ static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
> static int engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
> 				u64 value, bool create)
> {
>-	if (!capable(CAP_SYS_NICE))
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(value,
>+				     e->hwe->sched_props.timeslice_min,
>+				     e->hwe->sched_props.timeslice_max))
> 		return -EPERM;
>
>+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) && defined(CONFIG_DRM_XE_TIMESLICE_MAX)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(value,
>+				     CONFIG_DRM_XE_TIMESLICE_MIN,
>+				     CONFIG_DRM_XE_TIMESLICE_MAX))
>+		return -EPERM;
>+#else
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(value,
>+				     XE_HW_ENGINE_TIMESLICE_MIN,
>+				     XE_HW_ENGINE_TIMESLICE_MAX))
>+		return -EPERM;
>+#endif
>+
> 	return e->ops->set_timeslice(e, value);
> }
>
>@@ -201,9 +219,26 @@ static int engine_set_preemption_timeout(struct xe_device *xe,
> 					 struct xe_engine *e, u64 value,
> 					 bool create)
> {
>-	if (!capable(CAP_SYS_NICE))
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(value,
>+				     e->hwe->sched_props.preempt_timeout_min,
>+				     e->hwe->sched_props.preempt_timeout_max))
> 		return -EPERM;
>
>+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) && defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(value,
>+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
>+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
>+		return -EPERM;
>+#else
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(value,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>+		return -EPERM;
>+#endif
>+
> 	return e->ops->set_preempt_timeout(e, value);
> }
>
>@@ -269,8 +304,25 @@ static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
> 	if (XE_IOCTL_ERR(xe, !create))
> 		return -EINVAL;
>
>-	if (!capable(CAP_SYS_NICE))
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(value,
>+				     e->hwe->sched_props.job_timeout_min,
>+				     e->hwe->sched_props.job_timeout_max))
>+		return -EPERM;
>+
>+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) && defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(value,
>+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
>+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
>+		return -EPERM;
>+#else
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(value,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> 		return -EPERM;
>+#endif
>
> 	return e->ops->set_job_timeout(e, value);
> }
>diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>index 4c8f589870ba..743ef9f105d0 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>@@ -34,6 +34,11 @@ static const struct kobj_type kobj_xe_engine_type = {
> 	.sysfs_ops = &kobj_sysfs_ops
> };
>
>+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max)
>+{
>+	return timeout >= min && timeout <= max;
>+}
>+
> static ssize_t preempt_timeout_store(struct kobject *kobj,
> 				     struct kobj_attribute *attr,
> 				     const char *buf, size_t count)
>@@ -46,9 +51,26 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
> 	if (err)
> 		return err;
>
>-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     hwe->sched_props.preempt_timeout_min,
>+				     hwe->sched_props.preempt_timeout_max))
> 		return -EINVAL;
>
>+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) && defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
>+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
>+		return -EINVAL;
>+#else
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>+		return -EINVAL;
>+#endif
>+

It is still confusing to me as to,
1. Given, hwe->sched_props.preempt_timeout_min/max is already subjected to boundary
    check, why we are checking again.
2. What is the logic with CAP_SYS_NICE here?
More on this below.

> 	WRITE_ONCE(hwe->sched_props.preempt_timeout_us, timeout);
>
> 	return count;
>@@ -65,6 +87,90 @@ static ssize_t preempt_timeout_show(struct kobject *kobj,
> static struct kobj_attribute preempt_timeout_attr =
> __ATTR(preempt_timeout_us, 0644, preempt_timeout_show, preempt_timeout_store);
>
>+static ssize_t preempt_timeout_max_store(struct kobject *kobj,
>+					 struct kobj_attribute *attr,
>+					 const char *buf, size_t count)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) && defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
>+	if (!engine_timeout_in_range(timeout,
>+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
>+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
>+		return -EINVAL;
>+#else
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>+		return -EINVAL;
>+#endif
>+
>+	WRITE_ONCE(hwe->sched_props.preempt_timeout_max, timeout);
>+
>+	return count;
>+}

I still have few concerns here.
1. If the configs are defined, then we don't need CAP_SYS_NICE? If there is some logic here,
    can you add a comment with the explanation?
2. XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN/MAX already checks the CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN/MAX
    if they are defined. Then, we do we need separate checks here?

>+
>+static ssize_t preempt_timeout_max_show(struct kobject *kobj,
>+					struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+
>+	return sprintf(buf, "%u\n", hwe->sched_props.preempt_timeout_max);
>+}
>+
>+static struct kobj_attribute preempt_timeout_max_attr =
>+	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
>+	       preempt_timeout_max_store);
>+
>+static ssize_t preempt_timeout_min_store(struct kobject *kobj,
>+					 struct kobj_attribute *attr,
>+					 const char *buf, size_t count)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) && defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
>+	if (!engine_timeout_in_range(timeout,
>+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
>+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
>+		return -EINVAL;
>+#else
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>+		return -EINVAL;
>+#endif
>+
>+	WRITE_ONCE(hwe->sched_props.preempt_timeout_min, timeout);
>+
>+	return count;
>+}
>+
>+static ssize_t preempt_timeout_min_show(struct kobject *kobj,
>+					struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+
>+	return sprintf(buf, "%u\n", hwe->sched_props.preempt_timeout_min);
>+}
>+
>+static struct kobj_attribute preempt_timeout_min_attr =
>+	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
>+	       preempt_timeout_min_store);
>+
> static ssize_t timeslice_duration_store(struct kobject *kobj,
> 					struct kobj_attribute *attr,
> 					const char *buf, size_t count)
>@@ -77,14 +183,116 @@ static ssize_t timeslice_duration_store(struct kobject *kobj,
> 	if (err)
> 		return err;
>
>-	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(duration,
>+				     hwe->sched_props.timeslice_min,
>+				     hwe->sched_props.timeslice_max))
> 		return -EINVAL;
>
>+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) && defined(CONFIG_DRM_XE_TIMESLICE_MAX)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(duration,
>+				     CONFIG_DRM_XE_TIMESLICE_MIN,
>+				     CONFIG_DRM_XE_TIMESLICE_MAX))
>+		return -EINVAL;
>+#else
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(duration,
>+				     XE_HW_ENGINE_TIMESLICE_MIN,
>+				     XE_HW_ENGINE_TIMESLICE_MAX))
>+		return -EINVAL;
>+#endif
>+
> 	WRITE_ONCE(hwe->sched_props.timeslice_us, duration);
>
> 	return count;
> }
>
>+static ssize_t timeslice_duration_max_store(struct kobject *kobj,
>+					    struct kobj_attribute *attr,
>+					    const char *buf, size_t count)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+	u32 duration;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &duration);
>+	if (err)
>+		return err;
>+
>+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) && defined(CONFIG_DRM_XE_TIMESLICE_MAX)
>+	if (!engine_timeout_in_range(duration,
>+				     CONFIG_DRM_XE_TIMESLICE_MIN,
>+				     CONFIG_DRM_XE_TIMESLICE_MAX))
>+		return -EINVAL;
>+#else
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(duration,
>+				     XE_HW_ENGINE_TIMESLICE_MIN,
>+				     XE_HW_ENGINE_TIMESLICE_MAX))
>+		return -EINVAL;
>+#endif
>+
>+	WRITE_ONCE(hwe->sched_props.timeslice_max, duration);
>+
>+	return count;
>+}
>+
>+static ssize_t timeslice_duration_max_show(struct kobject *kobj,
>+					   struct kobj_attribute *attr,
>+					   char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+
>+	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_max);
>+}
>+
>+static struct kobj_attribute timeslice_duration_max_attr =
>+	__ATTR(timeslice_duration_max, 0644, timeslice_duration_max_show,
>+	       timeslice_duration_max_store);
>+
>+static ssize_t timeslice_duration_min_store(struct kobject *kobj,
>+					    struct kobj_attribute *attr,
>+					    const char *buf, size_t count)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+	u32 duration;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &duration);
>+	if (err)
>+		return err;
>+
>+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) && defined(CONFIG_DRM_XE_TIMESLICE_MAX)
>+	if (!engine_timeout_in_range(duration,
>+				     CONFIG_DRM_XE_TIMESLICE_MIN,
>+				     CONFIG_DRM_XE_TIMESLICE_MAX))
>+		return -EINVAL;
>+#else
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(duration,
>+				     XE_HW_ENGINE_TIMESLICE_MIN,
>+				     XE_HW_ENGINE_TIMESLICE_MAX))
>+		return -EINVAL;
>+#endif
>+
>+	WRITE_ONCE(hwe->sched_props.timeslice_min, duration);
>+
>+	return count;
>+}
>+
>+static ssize_t timeslice_duration_min_show(struct kobject *kobj,
>+					   struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+
>+	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_min);
>+}
>+
>+static struct kobj_attribute timeslice_duration_min_attr =
>+	__ATTR(timeslice_duration_min, 0644, timeslice_duration_min_show,
>+	       timeslice_duration_min_store);
>+
> static ssize_t timeslice_duration_show(struct kobject *kobj,
> 				       struct kobj_attribute *attr, char *buf)
> {
>@@ -109,8 +317,25 @@ static ssize_t job_timeout_store(struct kobject *kobj,
> 	if (err)
> 		return err;
>
>-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     hwe->sched_props.job_timeout_min,
>+				     hwe->sched_props.job_timeout_max))
>+		return -EINVAL;
>+
>+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) && defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
>+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
>+		return -EINVAL;
>+#else
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> 		return -EINVAL;
>+#endif
>
> 	WRITE_ONCE(hwe->sched_props.job_timeout_ms, timeout);
>
>@@ -128,13 +353,6 @@ static ssize_t job_timeout_show(struct kobject *kobj,
> static struct kobj_attribute job_timeout_attr =
> __ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
>
>-static const struct attribute *files[] = {
>-	&job_timeout_attr.attr,
>-	&timeslice_duration_attr.attr,
>-	&preempt_timeout_attr.attr,
>-	NULL
>-};
>-
> static ssize_t job_timeout_default(struct kobject *kobj,
> 				   struct kobj_attribute *attr, char *buf)
> {
>@@ -143,6 +361,28 @@ static ssize_t job_timeout_default(struct kobject *kobj,
> 	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_ms);
> }
>
>+static ssize_t job_timeout_min_default(struct kobject *kobj,
>+				       struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_min);
>+}
>+
>+static struct kobj_attribute job_timeout_min_def =
>+__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
>+
>+static ssize_t job_timeout_max_default(struct kobject *kobj,
>+				       struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_max);
>+}
>+
>+static struct kobj_attribute job_timeout_max_def =
>+__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
>+
> static struct kobj_attribute job_timeout_def =
> __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
>
>@@ -157,6 +397,123 @@ static ssize_t timeslice_default(struct kobject *kobj,
> static struct kobj_attribute timeslice_duration_def =
> __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>
>+static ssize_t timeslice_min_default(struct kobject *kobj,
>+				     struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", hwe->defaults.timeslice_min);
>+}
>+
>+static struct kobj_attribute timeslice_duration_min_def =
>+__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
>+
>+static ssize_t timeslice_max_default(struct kobject *kobj,
>+				     struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", hwe->defaults.timeslice_max);
>+}
>+
>+static struct kobj_attribute timeslice_duration_max_def =
>+__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
>+
>+static ssize_t job_timeout_max_store(struct kobject *kobj,
>+				     struct kobj_attribute *attr,
>+				     const char *buf, size_t count)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) && defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
>+	if (!engine_timeout_in_range(timeout,
>+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
>+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
>+		return -EINVAL;
>+#else
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>+		return -EINVAL;
>+#endif
>+
>+	WRITE_ONCE(hwe->sched_props.job_timeout_max, timeout);
>+
>+	return count;
>+}
>+
>+static ssize_t job_timeout_max_show(struct kobject *kobj,
>+				    struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+
>+	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_max);
>+}
>+
>+static struct kobj_attribute job_timeout_max_attr =
>+__ATTR(job_timeout_max, 0644, job_timeout_max_show, job_timeout_max_store);
>+
>+static ssize_t job_timeout_min_store(struct kobject *kobj,
>+				     struct kobj_attribute *attr,
>+				     const char *buf, size_t count)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) && defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
>+	if (!engine_timeout_in_range(timeout,
>+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
>+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
>+		return -EINVAL;
>+#else
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>+		return -EINVAL;
>+#endif
>+
>+	WRITE_ONCE(hwe->sched_props.job_timeout_min, timeout);
>+
>+	return count;
>+}
>+
>+static ssize_t job_timeout_min_show(struct kobject *kobj,
>+				    struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+
>+	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_min);
>+}
>+
>+static struct kobj_attribute job_timeout_min_attr =
>+__ATTR(job_timeout_min, 0644, job_timeout_min_show, job_timeout_min_store);
>+
>+static const struct attribute *files[] = {
>+	&job_timeout_attr.attr,
>+	&job_timeout_min_attr.attr,
>+	&job_timeout_max_attr.attr,
>+	&timeslice_duration_attr.attr,
>+	&timeslice_duration_min_attr.attr,
>+	&timeslice_duration_max_attr.attr,
>+	&preempt_timeout_attr.attr,
>+	&preempt_timeout_min_attr.attr,
>+	&preempt_timeout_max_attr.attr,
>+	NULL
>+};

Why is this moved down here?
Looks like things are not kept in order.

>+
> static ssize_t preempt_timeout_default(struct kobject *kobj,
> 				       struct kobj_attribute *attr,
> 				       char *buf)
>@@ -169,10 +526,40 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
> static struct kobj_attribute preempt_timeout_def =
> __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
>
>+static ssize_t preempt_timeout_min_default(struct kobject *kobj,
>+					   struct kobj_attribute *attr,
>+					   char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_min);
>+}
>+
>+static struct kobj_attribute preempt_timeout_min_def =
>+__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default, NULL);
>+
>+static ssize_t preempt_timeout_max_default(struct kobject *kobj,
>+					   struct kobj_attribute *attr,
>+					   char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_max);
>+}
>+
>+static struct kobj_attribute preempt_timeout_max_def =
>+__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default, NULL);
>+
> static const struct attribute *defaults[] = {
> 	&job_timeout_def.attr,
>+	&job_timeout_min_def.attr,
>+	&job_timeout_max_def.attr,
> 	&timeslice_duration_def.attr,
>+	&timeslice_duration_min_def.attr,
>+	&timeslice_duration_max_def.attr,
> 	&preempt_timeout_def.attr,
>+	&preempt_timeout_min_def.attr,
>+	&preempt_timeout_max_def.attr,
> 	NULL
> };
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h b/drivers/gpu/drm/xe/xe_gt_sysfs.h
>index a539cf031c7d..a7ac7b9a9768 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
>+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
>@@ -12,6 +12,7 @@
>
> int xe_gt_sysfs_init(struct xe_gt *gt);
> int xe_gt_sysfs_engines(struct xe_gt *gt);
>+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
>
> static inline struct xe_gt *
> kobj_to_gt(struct kobject *kobj)
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index bd94155a28b3..2b053ee0af80 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -363,8 +363,14 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> 	hwe->engine_id = id;
> 	/* FIXME: Wire up to configurable default value */
> 	hwe->sched_props.job_timeout_ms = HZ * 5;
>+	hwe->sched_props.job_timeout_min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
>+	hwe->sched_props.job_timeout_max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> 	hwe->sched_props.timeslice_us = 1 * 1000;
>+	hwe->sched_props.timeslice_min = XE_HW_ENGINE_TIMESLICE_MIN;
>+	hwe->sched_props.timeslice_max = XE_HW_ENGINE_TIMESLICE_MAX;
> 	hwe->sched_props.preempt_timeout_us = 640 * 1000;
>+	hwe->sched_props.preempt_timeout_min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>+	hwe->sched_props.preempt_timeout_max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> 	hwe->defaults = hwe->sched_props; /* Record default props */
>
> 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>index 7eca9d53c7b1..3d37d6d44261 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>@@ -10,6 +10,37 @@
>
> struct drm_printer;
>
>+#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>+#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>+#else
>+#define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1
>+#endif
>+#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX
>+#define XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIMEOUT_MAX
>+#else
>+#define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)
>+#endif
>+#ifdef CONFIG_DRM_XE_TIMESLICE_MIN
>+#define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
>+#else
>+#define XE_HW_ENGINE_TIMESLICE_MIN 1
>+#endif
>+#ifdef CONFIG_DRM_XE_TIMESLICE_MAX
>+#define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
>+#else
>+#define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
>+#endif
>+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>+#else
>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
>+#endif

So, we can never have a preempt timeout of 0?
As I mentioned before, guc disables preempt timeout when it is set to 0.

>+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
>+#else
>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
>+#endif
>+
> int xe_hw_engines_init_early(struct xe_gt *gt);
> int xe_hw_engines_init(struct xe_gt *gt);
> void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>index 7a8d275df6db..d47e34e32a6c 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>@@ -107,14 +107,28 @@ struct xe_hw_engine {
> 	void (*irq_handler)(struct xe_hw_engine *, u16);
> 	/** @engine_id: id  for this hw engine */
> 	enum xe_hw_engine_id engine_id;
>-	/** @sched_props: scheduling properties */
>+	/** @sched_props: scheduling properties
>+	 *  @defaults: Default scheduling properties
>+	 */

This should be done patch #2.

Niranjana

> 	struct {
> 		/** @set_job_timeout: Set job timeout in ms for engine */
> 		u32 job_timeout_ms;
>+		/** @job_timeout_min: Min job timeout in ms for engine */
>+		u32 job_timeout_min;
>+		/** @job_timeout_max: Max job timeout in ms for engine */
>+		u32 job_timeout_max;
> 		/** @timeslice_us: timeslice period in micro-seconds */
> 		u32 timeslice_us;
>+		/** @timeslice_min: min timeslice period in micro-seconds */
>+		u32 timeslice_min;
>+		/** @timeslice_max: max timeslice period in micro-seconds */
>+		u32 timeslice_max;
> 		/** @preempt_timeout_us: preemption timeout in micro-seconds */
> 		u32 preempt_timeout_us;
>+		/** @preempt_timeout_min: min preemption timeout in micro-seconds */
>+		u32 preempt_timeout_min;
>+		/** @preempt_timeout_max: max preemption timeout in micro-seconds */
>+		u32 preempt_timeout_max;
> 	} sched_props, defaults;
> };
>
>-- 
>2.25.1
>
