Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D26EB64D8
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 20:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9F410E685;
	Fri, 16 Jun 2023 20:56:36 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E129A10E685
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 20:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686948994; x=1718484994;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0b4azS6bmR0FClvb+E8KNT830C9pOk1EK8+7KoC/x0I=;
 b=jn78pha4htrPJ0yqkKPJp1CrBl9eGST5zCu6xU2ccPG9TBcrZc6/XV+n
 mTIgeW09J2EldSa1KcvDV+iWCEZjRGd8iEY3P9bZ0wUccwnmr6Gb4y97V
 pnfreMhycruKEnGvmynYXRSFj6HL2bETfeQGHUvfzGwH0w3+O8580h/bT
 9K1KxjICBSGIU7uv1LS0IW8BwNqvDPkKgguB2shM84cMcOfi7nBz2dKpi
 IAPZSDv7E3Ofh6lPP3uJYnnkipkcJNHcv3xPxtp4p1ZUtTO+JGxFYm1ub
 h0agj2RgAhA3MPf7hkSAEyTomMiIKUOPb1cJfN8JkP4DGE+zNQ2sNCCTe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="344049728"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="344049728"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 13:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="742783351"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="742783351"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 16 Jun 2023 13:56:30 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 13:56:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 13:56:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 13:56:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1A6XFNb4rsYYsF3wlF+E0oTkMza9sy67LkLcdQ0YEUcpacdFoYEJwBdPQuYMBMTXTw//mK+15bL+NFi26OaLWr9ZLxMasGyFF2tAzuGDpwtQ7RxsYBB1zFUjMDbt7rNk/s7XwgBI8F3DW3j5VzuKKPR3lpv+2HvljoTfXYkk5zodowMnSVMl2nttxIls/dkLwLCcmzfarIS7xrVFx/8EaQ5ONgxEE9y/PCrhohZa0z6OpWH00nFIkugB2SBpuYZe+w7RtmczTc6UmS+L2SVrq2uRrmAKGeKClDeLtQxObY8mIH0mKKxs2E28Pxcu7Ekw6+RVkcmmxAKLX2+Z6HRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvJDxqOEoD3mXYV1Cy/QsYoWlQYo51QPgUIBOkqaTMg=;
 b=JEsuWghnXER5MIPNSK0uqgeyJ0SFM0KmFJ9zV9OJKic4+ssxqgLP0OFfX1kVCJaThzKujWYZVo2xy+gR748G0Xcg3XdldO1eAaK2Mp9pCZC9sQBuOqg07Wtckx3iRN+jyzR6Qh6fg+fZLle+m0D3odsW9XLgbf/YI3e9o03DSe2iCL+93IQi7zzHFBSwDWHXlHZxMQnhMxSsEyeYhvZQrE3HWGok9EsE56mG+TQRNpBI8LpnWbM99SWxBIoJPP784fAu6efIytLa/sS25k3clw3CHBL3ddKyrR1M2mc20+DdX1L1cCgfMmKqV+vPheZbK0FgvZ3FYDo6NWcOaytmHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SN7PR11MB6899.namprd11.prod.outlook.com (2603:10b6:806:2a7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.41; Fri, 16 Jun
 2023 20:56:22 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086%4]) with mapi id 15.20.6500.026; Fri, 16 Jun 2023
 20:56:22 +0000
Date: Fri, 16 Jun 2023 13:56:15 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZIzMbz7Jk0F0tpf6@nvishwa1-DESK>
References: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
 <20230615141933.2865583-7-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230615141933.2865583-7-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR04CA0032.namprd04.prod.outlook.com
 (2603:10b6:a03:40::45) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SN7PR11MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb7ebeb-dc66-4d3c-0417-08db6eac23e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PNSqs3Pyn/Tf4TJdF3OUijHLFHIsKfsnhUtl9fg4KUeNFioi7kt3v3WDDY/qwtjKIKUfG7J0AGLj5/x36h0H5voZY+sfFyRtjwQ+/YqjgBmmjL16CvSx1jQYJAFuqifVwmUO21pysgNA45JIOSz0um85sWl0Q/La7QNaNfqOoaA6HT3zMthMy65/tdWfUQJVqojpgvSyINlHdY8l8Z/nFDLNA2alRPdzmtTCczfY1qJyeqlfyoSsajh7St9Yg8mTKKUMawE2YihmOBx9zfts0iED1XK4TIC2+yCMO3q/i/R7BETPOcQ6/9FJqxu9IEQEs0zqZxdGI3/isVgAIOMlEtM3yhSPGjur6k7zblmhoKv0lxLalUITIi3ebZXXJCKVYEc/WnZ1nZYEAJE3EeDIK1Iseo1NemLZe1TXp0Z7U/c2/0aUJ3tBCh+PJVStDihxENmERVdksuwqTYtXR7WU4RSDT7JbNNsO4R1wte/PdBvWx8sDZTG9sVQQNgOoGTKSRxO27QdwOr4DOzz7zRtemw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199021)(86362001)(30864003)(5660300002)(2906002)(44832011)(33716001)(83380400001)(6666004)(6486002)(966005)(9686003)(26005)(6512007)(186003)(6506007)(107886003)(54906003)(82960400001)(6636002)(4326008)(66946007)(66476007)(66556008)(316002)(478600001)(6862004)(38100700002)(8936002)(41300700001)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xXetvnJtnczc0oPpgf8KOsw/WAKhT/WKovJa3Nq1NO1u/882s56kxzpmsb+1?=
 =?us-ascii?Q?9ZIlZb3BXdwmOwBAx7kTnzjM22gz6hnRpqCLD3m+pm9atcmJv1TAgEDiy8NU?=
 =?us-ascii?Q?th6NEqZVbLyKhjxvSEOZps8oQCes/m7KWPP/a2vSsfSGDo31yqByOc5oKenX?=
 =?us-ascii?Q?gFYxeKYYwFLCTMPaCX3VRb+yRgXdQAul1sbSPk2XbliymrCMnFr00ExTUpEV?=
 =?us-ascii?Q?aPkBd4KrYAG7LIwq6zMEX8yAkXGytygilDAW0gntuyCGxDgLEvzOhd/vOKqS?=
 =?us-ascii?Q?9l8ZRGeKta/KBoTL/oCZj2mB07ZNoz2P/6hqoF4lcb33LnqD+Hi743QGAaEr?=
 =?us-ascii?Q?/pS3qZDKQCK1/ut9pPUfQHaFZd7oTXkkThilafoXiXj80bipfMTjNpdlgMuz?=
 =?us-ascii?Q?KeVUPYw6DtEJ/WEFacFJwZXM10ff67y/RdyUKrxyt9/1A5mMRjtlbllrgcE7?=
 =?us-ascii?Q?LnoBh29Ouzc3CDF0MZlkpYiuf2brvIOw5IIpIUwI8uMVyw9NPXmb51JXyQ3f?=
 =?us-ascii?Q?wKSeMU9aeSHT2G+/zBMLJEGi63uWVC/9lg3cdHyEyURIxrsEIrnqKCMQEt/f?=
 =?us-ascii?Q?XT0XraVx7SYZSlS+G+Ubz6N8QZiktAsX3l8TSKR0suvxAzDbPzggFaxpe+l1?=
 =?us-ascii?Q?HxxMif1ZnugsOmWWV4qK2TaI6LcSBWuNSWXX9PQznmBkwhSWCauJWXYB0Kn8?=
 =?us-ascii?Q?T4sX0EPc0aVK/7kReLp7FlR1sNkWzTDinJqZvEwdkMBfXJfDxRSy4EEFvva2?=
 =?us-ascii?Q?dgOVi1VKT6G3yP/nLxWuycl8n1fdLqh4s4drZ9QerIfdrY9R/sD/RRYomCLQ?=
 =?us-ascii?Q?wnRbY6qB2g4UCr1SgNAIeeQqQHMZqe/KFNvsI1GbZpiSOswe7LyyUlzox3ur?=
 =?us-ascii?Q?ZAaCcBxhMU1bqXYkeSgJpZ10I2YvWUuuMXL1tzMkCERDTWDVmB3GpkBegRlr?=
 =?us-ascii?Q?c0JG4yGMpGBf3jkQmrjVYv8gJbVqDEGMz45lEI+WF/KLpUEMCjGEf2ACRjYC?=
 =?us-ascii?Q?urzIXDspZPK3jwFwairiKm21zMP5T1PnphLXAAFvSyIM509p+dMBdPJtIpJM?=
 =?us-ascii?Q?jhVo5XaTtjBhprAWeEYQRKKg/a+34HuZZQRvwgwEojjoWF0HUdF5i9UT9wwV?=
 =?us-ascii?Q?dELWSMHBlSAxuEGQXYU6aAr0OEoVfMJIKcSekxk2wiKxNE6GI+AKjlAG1GPh?=
 =?us-ascii?Q?NMWAcM/iCW5ssnBLgmyo5vhT3C4n9VcUTnP9uX5NMpv1dyjETpamcN0iWZY6?=
 =?us-ascii?Q?eXeGxXFW2v8sPRR7oVQE4aQJx1Qi6z8tvGAO1y3r28HBZBEzfRMvRKTRYV9g?=
 =?us-ascii?Q?GUBhcvUIy5ZijH8LNJKISvAD+STHVfKM0DlFHhOOMX0Vdd47h9sKeYqOU9wi?=
 =?us-ascii?Q?hd8d3l1n4P0ZZyQIakLkQ97x8FjPXK8UGWpYpGC8kzYe15ET13LvDicMEA+V?=
 =?us-ascii?Q?LKfEGti+s1PCXS6RxIZO2nnZaFTSgUqYB958c2T5iloVFCuNAnETZl9CczQ3?=
 =?us-ascii?Q?17gVzJV6J9E4tmr9t/6fOnpMgf2YVsRQn9jqNOQWpLFnKxdQb5cODrWt7OrP?=
 =?us-ascii?Q?gw05kX2vwv8sVI4+dHcWHCxpoQBgDcVaAtC7PIAV/AXmG6+vYR3Eheh9AaD7?=
 =?us-ascii?Q?Bb1IqfFL8d5f7Bsa291j1vE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb7ebeb-dc66-4d3c-0417-08db6eac23e9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 20:56:22.1683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXMBZtB+ZLMgFGDkOtERk5uBiWbT98DkhyPpXFeqvn7LGtNSKWHimNrrdDiuB14BcwPnZHHdtkjSQLqgUUVGui//bCbTcJa4twdyCbbcJlayAv9M9Tkhos6pg/500Rm3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6899
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe: Add min/max cap for engine
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

On Thu, Jun 15, 2023 at 07:49:33PM +0530, Tejas Upadhyay wrote:
>Add sysfs entries for the min, max, and defaults for each of
>engine scheduler controls for every hardware engine class.
>
>Non-elevated user IOCTLs to set these controls must be within
>the min-max ranges of the sysfs entries, elevated user can set
>these controls to any value.
>
>Introducing compile time CONFIG min-max values which restricts elevated
>user to be in compile time min-max range if at all sysfs min/max
>are violated.
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
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/Kconfig              |   7 +
> drivers/gpu/drm/xe/Kconfig.profile      |  39 +++
> drivers/gpu/drm/xe/xe_engine.c          |  40 ++-
> drivers/gpu/drm/xe/xe_gt_sysfs.c        | 373 ++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_gt_sysfs.h        |   1 +
> drivers/gpu/drm/xe/xe_hw_engine.c       |   6 +
> drivers/gpu/drm/xe/xe_hw_engine.h       |  31 ++
> drivers/gpu/drm/xe/xe_hw_engine_types.h |  12 +
> 8 files changed, 485 insertions(+), 24 deletions(-)
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
>index 000000000000..cffd73e44ca9
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/Kconfig.profile
>@@ -0,0 +1,39 @@
>+config DRM_XE_JOB_TIMEOUT_MAX
>+	int "Default max job timeout (ms)"
>+	default 10000 # milliseconds
>+	help
>+	  Configures the default max job timeout after which job will
>+	  be forcefully taken away from scheduler.
>+config DRM_XE_JOB_TIMEOUT_MIN
>+	int "Default max job timeout (ms)"
>+	default 1 # milliseconds
>+	help
>+	  Configures the default min job timeout after which job will
>+	  be forcefully taken away from scheduler.
>+config DRM_XE_TIMESLICE_MAX
>+	int "Default max timeslice duration (us)"
>+	default 10000000 # microseconds
>+	help
>+	  Configures the default max timeslice duration between multiple
>+	  contexts by guc scheduling.
>+config DRM_XE_TIMESLICE_MIN
>+	int "Default min timeslice duration (us)"
>+	default 1 # microseconds
>+	help
>+	  Configures the default min timeslice duration between multiple
>+	  contexts by guc scheduling.
>+config DRM_XE_PREEMPT_TIMEOUT_MAX
>+	int "Default max  preempt timeout (us)"
>+	default 10000000 # microseconds
>+	help
>+	  Configures the default max preempt timeout after which context
>+	  will be forcefully taken away and higher priority context will
>+	  run.
>+config DRM_XE_PREEMPT_TIMEOUT_MIN
>+	int "Default min  preempt timeout (us)"
>+	default 1 # microseconds

I think a value of 0 means preempt timeout is diabled. GuC allows it.
So, probably we should allow minimum of 0?

>+	help
>+	  Configures the default min preempt timeout after which context
>+	  will be forcefully taken away and higher priority context will
>+	  run.
>+
>diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>index e72423bc398a..c368ffd5e461 100644
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
>@@ -191,9 +192,20 @@ static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
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
>+#endif

Do we really need this second boundary check given the in the first check above,
the e->hwe->sched_props.timeslice_min/max values are already subjected to these
boundaries?
Applies for other below parameters also.

>+
> 	return e->ops->set_timeslice(e, value);
> }
>
>@@ -201,8 +213,19 @@ static int engine_set_preemption_timeout(struct xe_device *xe,
> 					 struct xe_engine *e, u64 value,
> 					 bool create)
> {
>-	if (!capable(CAP_SYS_NICE))
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(value,
>+				     e->hwe->sched_props.preempt_timeout_min,
>+				     e->hwe->sched_props.preempt_timeout_max))
>+		return -EPERM;
>+
>+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) && defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(value,
>+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
>+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> 		return -EPERM;
>+#endif
>
> 	return e->ops->set_preempt_timeout(e, value);
> }
>@@ -269,8 +292,19 @@ static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
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
> 		return -EPERM;
>+#endif
>
> 	return e->ops->set_job_timeout(e, value);
> }
>diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>index f88f8f7dfc7b..415b60845eef 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>@@ -32,6 +32,11 @@ static struct kobj_type kobj_xe_engine_type = {
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
>@@ -44,9 +49,20 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
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
>+#endif
>+
> 	WRITE_ONCE(hwe->sched_props.preempt_timeout_us, timeout);
>
> 	return count;
>@@ -63,6 +79,78 @@ static ssize_t preempt_timeout_show(struct kobject *kobj,
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
>+#endif
>+
>+	WRITE_ONCE(hwe->sched_props.preempt_timeout_max, timeout);
>+
>+	return count;
>+}
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
> 		struct kobj_attribute *attr,
> 		const char *buf, size_t count)
>@@ -75,8 +163,19 @@ static ssize_t timeslice_duration_store(struct kobject *kobj,
> 	if (err)
> 		return err;
>
>-	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(duration,
>+				     hwe->sched_props.timeslice_min,
>+				     hwe->sched_props.timeslice_max))
>+		return -EINVAL;
>+
>+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) && defined(CONFIG_DRM_XE_TIMESLICE_MAX)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(duration,
>+				     CONFIG_DRM_XE_TIMESLICE_MIN,
>+				     CONFIG_DRM_XE_TIMESLICE_MAX))
> 		return -EINVAL;
>+#endif
>
> 	WRITE_ONCE(hwe->sched_props.timeslice_us, duration);
>
>@@ -95,6 +194,79 @@ static struct kobj_attribute timeslice_duration_attr =
> __ATTR(timeslice_duration_us, 0644, timeslice_duration_show,
> timeslice_duration_store);
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
> static ssize_t job_timeout_store(struct kobject *kobj,
> 		struct kobj_attribute *attr,
> 		const char *buf, size_t count)
>@@ -107,8 +279,19 @@ static ssize_t job_timeout_store(struct kobject *kobj,
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
> 		return -EINVAL;
>+#endif
>
> 	WRITE_ONCE(hwe->sched_props.job_timeout_ms, timeout);
>
>@@ -126,6 +309,89 @@ static ssize_t job_timeout_show(struct kobject *kobj,
> static struct kobj_attribute job_timeout_attr =
> __ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
>
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
>+
> static ssize_t job_timeout_default(struct kobject *kobj,
> 				 struct kobj_attribute *attr, char *buf)
> {
>@@ -137,6 +403,28 @@ static ssize_t job_timeout_default(struct kobject *kobj,
> static struct kobj_attribute job_timeout_def =
> __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
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
> static ssize_t timeslice_default(struct kobject *kobj,
> 				 struct kobj_attribute *attr, char *buf)
> {
>@@ -148,6 +436,28 @@ static ssize_t timeslice_default(struct kobject *kobj,
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
> static ssize_t preempt_timeout_default(struct kobject *kobj,
> 				       struct kobj_attribute *attr,
> 				       char *buf)
>@@ -160,6 +470,43 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
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
>+static const struct attribute *defaults[] = {
>+	&job_timeout_def.attr,
>+	&job_timeout_min_def.attr,
>+	&job_timeout_max_def.attr,
>+	&timeslice_duration_def.attr,
>+	&timeslice_duration_min_def.attr,
>+	&timeslice_duration_max_def.attr,
>+	&preempt_timeout_def.attr,
>+	&preempt_timeout_min_def.attr,
>+	&preempt_timeout_max_def.attr,
>+	NULL
>+};
>+
> int xe_add_engine_defaults(struct kobject *parent)
> {
> 	struct kobject *kobj;
>@@ -175,15 +522,7 @@ int xe_add_engine_defaults(struct kobject *parent)
> 	if (err)
> 		goto err_object;
>
>-	err = sysfs_create_file(kobj, &job_timeout_def.attr);
>-	if (err)
>-		goto err_object;
>-
>-	err = sysfs_create_file(kobj, &timeslice_duration_def.attr);
>-	if (err)
>-		goto err_object;
>-
>-	err = sysfs_create_file(kobj, &preempt_timeout_def.attr);
>+	err = sysfs_create_files(kobj, defaults);

Why add code in previous patch and remove it here when we can
can have previous patch use sysfs_create_files() to begin with?
Applies to other below parameters also.

> 	if (err)
> 		goto err_object;
>
>@@ -286,15 +625,7 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
> 			return err;
> 		}
>
>-		err = sysfs_create_file(&khwe->base, &job_timeout_attr.attr);
>-		if (err)
>-			goto err_object;
>-
>-		err = sysfs_create_file(&khwe->base, &timeslice_duration_attr.attr);
>-		if (err)
>-			goto err_object;
>-
>-		err = sysfs_create_file(&khwe->base, &preempt_timeout_attr.attr);
>+		err = sysfs_create_files(&khwe->base, files);
> 		if (err)
> 			goto err_object;
> 	}
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
>index 8314429cfa90..e52324eb1efa 100644
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

Can we define a config option for preempt_timeout_us also?
My below patch series tries to do it.
https://patchwork.freedesktop.org/series/119165/

May be you can include it here in your patch series or I can push a patch
series after this series gets merged. Thoughts?

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

As mentioned above, a minimum should be 0?

Niranjana

>+#endif
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
>index 406a1e33a05e..8582193b4947 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>@@ -111,10 +111,22 @@ struct xe_hw_engine {
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
> 	/** @sysfs: sysfs kobject pointing to this hwe */
> 	struct kobject *sysfs_hwe;
>-- 
>2.25.1
>
