Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9DFFF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 04:12:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9C110E021;
	Tue,  5 May 2026 04:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dss0zVbw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80AF10E021
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 04:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777954342; x=1809490342;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fME4TZ8tNir0/L9v9rHpXfUEpgIfxNrIXzej/w/HNg0=;
 b=dss0zVbw1i3kfQCDT+Bc1yporG7VlBbwYa51NRD69rsNt0K3zElgIMEh
 uVFEJGImlWcmyq+9fmaebMAWBRPy2FvknXsDU/zUa41rDhK7zh/TM+VUP
 roeMJhvccFPQQ1dX8F9x/EYDDH1ARQqq2AImx8t913zIy/SWaXtPDGX9q
 yWB+2OYbpdUCdCLARmcRNjeFuxOQhdnWdkG2NuVyg9rnAQNOPE7SGlXWZ
 yYbUGmVXSfX+waCRP4BGXqT4hEWUNw39gHNjj3hG2DgZr8OY9DXugsG7+
 W2FmltcZ/jHzof1VMQDiZDKFkes7lvo1d5slNT4vFHcgJHKP3QqrQPS9c Q==;
X-CSE-ConnectionGUID: WhEViVpRSR2FUOsj4NMHxw==
X-CSE-MsgGUID: 8aeWPD6ESGeD5YRbtKjnDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89920800"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="89920800"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 21:12:17 -0700
X-CSE-ConnectionGUID: Qjq7q4BpR+GpsMRIb6iLww==
X-CSE-MsgGUID: kvwAQkxfQrq7SY7AdJ80tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="259053404"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 21:12:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 21:12:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 21:12:16 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 21:12:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVRph5tbCfIEggRZfaCfVpcgAF5ijjl0aAzRJ1Vi59LHYl84xXnNewikowY3+/PLEvN6GFGp96vZb11xbFqSGlKczAWygtgLu5zDpYZuPHmqYuBELgDcDWG2o6HurFWa+EuTSo6zEDEZ1QEuQNAWn0TUrzygxt/2ZsgkCJ2tpLOfArYZCeeRb86+sLACJ2n9chvqSPcUfZLTNOO84Qj8zYoXnT0j5N3uXKe/2+DwMi5KlPXDhg2OiPHPhUup6aBcrQav9AYeEhxQpi7aTi2D7zLod5GdImL8dymLaGkiZBbqgj+5ltWWHiYRUmv2uin2gVRTk3cbAzZDxjepB8BTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=occs4HexWQPD/6aJ3Jsww63LsLjRltNhYkBlflGcFMw=;
 b=G7aVswQTr67NeQ7kkFJ0fzyyGFfdBcrrCeJlwyy3OcUODfI4/N5xDAEs7wxYcOrqPWklHlr4nG8l2e8chlnPu1N06R+3fQtnfBTfHER1FZH+8K6h/keNig2yPUc+rfTHO5ECZbYBOiubt8F+4Sj91Btd1/vP+yP3ILrjYHBeXuR60EIZjhGadd4W43KXebVVx56T8FkBtN4zVYouTGHvfJV7d/JuD9h/BRF/cp1Ec6qKy6pwfmkyEQtAugaoiHPsCEvY/1snqDyrMRcfum+qNiv9f0vByk8R7cf4oW0SZwlB6kGHRRSkYs28KJ2leP92dkCuA51XrBUS/iKnJg16Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DSVPR11MB9720.namprd11.prod.outlook.com (2603:10b6:8:351::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 04:12:15 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 04:12:14 +0000
Date: Mon, 4 May 2026 21:12:12 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v2 6/9] drm/xe/multi_queue: Capture queue run times for
 active queues
Message-ID: <afluHJJvWpbcBTsp@nvishwa1-desk>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
 <20260502005332.3135977-17-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260502005332.3135977-17-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DSVPR11MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc649b1-6680-4219-9dfd-08deaa5c7d2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: jJ/7rgA8LIYNCYyOFxhtOgYjWm0PMwlv2hFDs+UshLvMbMQYXiAoHDPQb8XoeMZKcaW/NqfmzFDFtkyT/bqD+t5hUMhwGtLk6IMcYevOpLGgRv1N/PufaYXXj4SzGl7EUFW3ZTu4p3cj8zHVyumblzFXQcHsO//AL9MbVUncG4Xv0ovFyS6y96rM3Knl9bdRmc9XUO+k5R8AK48ebLYmGENpIoo7CiR0kGv1PtDWAhiZgsWNPI+x23QCbSmZ4qL5iNwIKCEWKaDih/vm499UQTgrIdeffDV8gNhYscOvERFQohS8U8be1En53950OuHnLDIdLlBSXF6MvsjU/aT3OKWLf4L0PN1TppXtv3wPasXEoZDypqy0DbQdSMGTrH9JaS5/tK2xpi42rA0ZJYGFP54oUsEIDZtUw28BedDUfqCOJJSnX2oiTFT3J8azpzsB6xe9oqxvBwtewPJ7piMMYe+j/ZtIm89vnuDnW3WP/VGy0Dk0bY4seT1Ug+S0F5+sgamnRZ26dH4DlrStpAmqOM7RJWJZqUOZcB00QX1yn10sPA6fmv3E5PY6WF6l2RrRoIHcST7k3f2D0WOII3l6Mfcpw2+7DSUF5IMUkEA706abRkOHFbqQmgNjmjhDy0XmG6yD/G/dj53/IKA/SqY5a+DpYZvvshSZuGh3jfeJFtPdnQy6+N4GgXfISJmg3R93
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CNXHUo2pGMtB4Fenmx2BNsnGTjPipvTvs1qcDEr3MmMFSJSOfFa61Hw4G84K?=
 =?us-ascii?Q?WLEiITI4jisysGdwbWsxrLPR5MsJ8L3Tt84D9t3gmv8uljymrZYZCAi7X2N2?=
 =?us-ascii?Q?9PGWDav1/iOwKSc9Pj13UfJR3V7SMRYZw90xmPb9s/J9hQMrdLl/KRF8eQdq?=
 =?us-ascii?Q?KPC5gMcdPa0I9/Rtn/hVNLtiVgzhIQgh7UG0Rj+QtDY5hfBCluCwRs0faQ1Q?=
 =?us-ascii?Q?pwZmr1ip+EDfiydFY9OAJpbASfpVhuhruU62mS14mO3Ly4OckBGZQ60UTKjJ?=
 =?us-ascii?Q?taogcbWdFN/qWAoZlazrmZpyGrGoJ8jEA4d7R009OyzGp0S8YtQehbmBl94K?=
 =?us-ascii?Q?CVoPeMst5tVPbEfw7Xy1JnFEpwFY/BgtlLuQ8dRhJ1gbVPqcaKBE0ZoHUEeM?=
 =?us-ascii?Q?96eoYa76dQMxjDcOncyO6hfL33kv7r0qTxFNscfS5ui/ym6JU8SmjoL7/a9t?=
 =?us-ascii?Q?eSJlul/W33D4kQ//Gi4JTEjp/GhkLLrU8wgrenyEePL0LiDK/kINg1TLPEPg?=
 =?us-ascii?Q?esv4MzcJpmf6koyaClsXdl5+rZJkxnaQMapejSMGM+kaCC338ECGB8RtBmqK?=
 =?us-ascii?Q?QIrln0hl+Uo38sRa8pHTSeaU2RfyXMfdEt52HoPifCayeLEI5l4vFnMYH9z4?=
 =?us-ascii?Q?uXQusyHqeGJgHekfHAaU6mpgDoUtuo9ozXYM0FDCq0WuzCiJccalb7w6HJJq?=
 =?us-ascii?Q?wVodEg1yxuCikaMZ9kRDuZKPOh1Ev+Lfzl8UvbfsuI/ZPdCQWcpGjWRQ1CVN?=
 =?us-ascii?Q?P3sXB8/QqnIfcilble9uPMaFrHgmzsv+HaYRhQ/8twVxEtROpw0t1tP6a0A/?=
 =?us-ascii?Q?BJnzDEqySGKii+BN/uWXzPaYRMSn6LHXtHQNrZGHmco+wh31VXL+9PbUEZIQ?=
 =?us-ascii?Q?SZkEMLRm6nyh+G5PbUVSen9TDWd8/bI0fUtyKYytveUbU1BEmCHOsLjWX6bp?=
 =?us-ascii?Q?by6gO5dBx7psAlwBq/GARB887A7TjHAU1mAatD3ZZ+i67Jqmwr1HTAC019bG?=
 =?us-ascii?Q?qJ3XJp3klYWWN9R8mLKo/CWrkq0ZkHBDTY2SkeM8LqIn53g6w0/slGld8XZH?=
 =?us-ascii?Q?zc0bUok8/+RQPFCcFeFzBfUqes62cUjp7TbwuKHfgiqV/lddHw3XZQVysz4l?=
 =?us-ascii?Q?bYMHR46/jtOvXvzWA+bmQMB1NoEXJeJVQ7FdCnhf2qGqqR8BJUNJn3bpxycq?=
 =?us-ascii?Q?dgg59R5frxnVOiTDPqq0S51Nmtz5h5lvqU8vdjP7g89jwE3Ud+7OnmLCOQkF?=
 =?us-ascii?Q?xdMsGCvHBp27gS0Q0JXcb52NTcmQqu7K0rG8BfAi+UcmmJefcGOgZg+7QbPd?=
 =?us-ascii?Q?LMkJLUY5NtIfqocSpe14nGOnrkXavzKIvctgmLY/iZEAJ+WS3VXV2iXN6z03?=
 =?us-ascii?Q?bvxRjsPz8DamrZd8SVWsZnu4i1TYgjiHmde2AzcXy9ISzrv8tl7fJU3qh964?=
 =?us-ascii?Q?5DDj58VUFbCYWkoR4XBhpdXvvUSZfk9lNsqFFWM983wOnEW2F8F2jircjtMd?=
 =?us-ascii?Q?ijxQXDW/5vzN6POm5xO0Bz9ooHpE/Di1q/BVFIHAny0S+qryD0hLJbdb2rA3?=
 =?us-ascii?Q?n5oYoaRy1Nf0OS5HMfgwITl2Wvcf6255uYRMZSshy+acDVXr2CopsdF9CRyZ?=
 =?us-ascii?Q?xJu056bO/v2lWtMTKoZ0kn9pHUpBnBC58l+VCWGcjy8GO0jUeVHfyHLocF2/?=
 =?us-ascii?Q?euayM2HEXsV+rx8VGtRxNxOlQ72KaWC5mKZDJSEM8jZxfFMUXDoxohYg/1l5?=
 =?us-ascii?Q?xmLj5fQQ3MpsQPuz8aArFjEMdNjvX9BaS3haL5GPaSsjXVyBjVQv?=
X-Exchange-RoutingPolicyChecked: owdvwV+9YnaMdSIqJW+PQ972LD9YFOuu7qrtbrl8GaoldajLYGg4XnWLOumYEWN0j+WWWsEgHCAjFFW26tZYiPndSY+caTJOVuNyfR2SNnxgMJVyyj2K9BLigL60oFalKyaeSicTEDeZYYienqF6Otg6lpg6czrwvRuypeax1vr4+dszVmEikSBuUfM+9qhMtneXJxG/X2FFfTeH+0iqisAkgb+V6uJ+dcoeXMUxaPzWPhpTPx/m6jUgWCE/SbB9QkgGYOeNRglnl4CKT5FfJD+I85W03ARvRZtAkoneJHVJTcMo6SEi0gNPeeuq5E9Y/rOByO8I05cFijarA4qZnA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc649b1-6680-4219-9dfd-08deaa5c7d2e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 04:12:14.8717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djt+HEZJRhOPbStztycVRpqNspipBrVLYhL+WRlgIZqW39mpP22Vc/ubyp0Tz/M0yLKRFkk0uEvbGg3Odv8hAM6PnbH4iP7e7J/3FuwTO9ZLALsG3B7D9NqBFLtT/Loj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9720
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

On Fri, May 01, 2026 at 05:53:39PM -0700, Umesh Nerlige Ramappa wrote:
>If a queue is currently active on the CS, query the QUEUE TIMESTAMP
>register to get an up to date value of the runtime. To do so, ensure
>that the primary queue is active and then check if the secondary queue
>is executing on the CS.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v2:
>- Move trace to a separate patch (Stuart)
>- Refactor multi queue timestamp logic (Matt/Niranjana)
>---
> drivers/gpu/drm/xe/regs/xe_engine_regs.h |   4 +
> drivers/gpu/drm/xe/xe_lrc.c              | 115 +++++++++++++++++++----
> 2 files changed, 99 insertions(+), 20 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index 1b4a7e9a703d..af6af6f3f5e8 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -170,6 +170,10 @@
> #define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
>
> #define RING_CSMQDEBUG(base)			XE_REG((base) + 0x2b0)
>+#define   CURRENT_ACTIVE_QUEUE_ID_MASK		REG_GENMASK(7, 0)
>+
>+#define RING_QUEUE_TIMESTAMP(base)		XE_REG((base) + 0x4c0)
>+#define RING_QUEUE_TIMESTAMP_UDW(base)		XE_REG((base) + 0x4c0 + 4)
>
> #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 92419e5058fd..023202be5d52 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -21,6 +21,7 @@
> #include "xe_configfs.h"
> #include "xe_device.h"
> #include "xe_drm_client.h"
>+#include "xe_exec_queue.h"
> #include "xe_exec_queue_types.h"
> #include "xe_gt.h"
> #include "xe_gt_clock.h"
>@@ -2655,17 +2656,65 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
> 	return 0;
> }
>
>-/**
>- * xe_lrc_timestamp() - Current ctx timestamp
>- * @lrc: Pointer to the lrc.
>- *
>- * Return latest ctx timestamp. With support for active contexts, the
>- * calculation may be slightly racy, so follow a read-again logic to ensure that
>- * the context is still active before returning the right timestamp.
>- *
>- * Returns: New ctx timestamp value
>- */
>-u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>+static u64 get_queue_timestamp(struct xe_hw_engine *hwe)
>+{
>+	return xe_mmio_read64_2x32(&hwe->gt->mmio,
>+				   RING_QUEUE_TIMESTAMP(hwe->mmio_base));
>+}
>+
>+static u32 get_queue_id(struct xe_hw_engine *hwe)
>+{

NIT...may be rename it as get_multi_queue_active_queue()?

>+	u32 val = xe_mmio_read32(&hwe->gt->mmio,
>+				 RING_CSMQDEBUG(hwe->mmio_base));
>+
>+	return REG_FIELD_GET(CURRENT_ACTIVE_QUEUE_ID_MASK, val);
>+}
>+
>+static bool context_active(struct xe_lrc *lrc)
>+{
>+	return xe_lrc_ctx_timestamp(lrc) == CONTEXT_ACTIVE;
>+}
>+
>+static u64 xe_lrc_multi_queue_timestamp(struct xe_lrc *lrc)
>+{
>+	struct xe_lrc *primary_lrc = lrc->multi_queue.primary_lrc;
>+	struct xe_hw_engine *hwe;
>+	u64 reg_queue_ts = lrc->queue_timestamp;
>+
>+	if (IS_SRIOV_VF(lrc_to_xe(lrc)))
>+		return xe_lrc_queue_timestamp(lrc);
>+
>+	if (!primary_lrc || !context_active(primary_lrc))
>+		return xe_lrc_queue_timestamp(lrc);

May be print a warning if primary_lrc is not set?

>+
>+	/* WA BB populates engine id in PPHWSP of primary context only */
>+	hwe = engine_id_to_hwe(primary_lrc->gt, xe_lrc_engine_id(primary_lrc));
>+	if (!hwe)
>+		return xe_lrc_queue_timestamp(lrc);
>+
>+	if (get_queue_id(hwe) != lrc->multi_queue.pos)
>+		return xe_lrc_queue_timestamp(lrc);
>+
>+	/* queue is active, so store the queue timestamp register */
>+	reg_queue_ts = get_queue_timestamp(hwe);
>+
>+	/* double check queue and primary queue are both still active */
>+	if (get_queue_id(hwe) != lrc->multi_queue.pos ||
>+	    !context_active(primary_lrc))
>+		return xe_lrc_queue_timestamp(lrc);
>+
>+	return reg_queue_ts;
>+}
>+
>+static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>+{
>+	*old_ts = lrc->queue_timestamp;
>+	lrc->queue_timestamp = xe_lrc_multi_queue_timestamp(lrc);

Same here, add a warning message if lrc is not multi-queue?

>+
>+	return lrc->queue_timestamp;
>+}
>+
>+static u64 xe_lrc_single_queue_timestamp(struct xe_lrc *lrc)
> {

Hmm...NIT...we never used the word 'single_queue' so far to refer to
non-multi-queue case. May be rename it to xe_lrc_ctx_timestamp()
or something?

Also, may be update this funcion to make use the newly added
context_active() function?

Niranjana

> 	u64 lrc_ts, reg_ts, new_ts = lrc->ctx_timestamp;
> 	u32 engine_id;
>@@ -2697,24 +2746,50 @@ u64 xe_lrc_timestamp(struct xe_lrc *lrc)
> 	return new_ts;
> }
>
>+static u64 xe_lrc_update_ctx_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>+{
>+	*old_ts = lrc->ctx_timestamp;
>+	lrc->ctx_timestamp = xe_lrc_single_queue_timestamp(lrc);
>+
>+	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>+
>+	return lrc->ctx_timestamp;
>+}
>+
> /**
>- * xe_lrc_update_timestamp() - Update ctx timestamp
>+ * xe_lrc_timestamp() - Current lrc timestamp
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Return latest lrc timestamp. With support for active contexts/queues, the
>+ * calculation may be slightly racy, so follow a read-again logic to ensure that
>+ * the context/queue is still active before returning the right timestamp.
>+ *
>+ * Returns: New lrc timestamp value
>+ */
>+u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>+{
>+	if (xe_lrc_is_multi_queue(lrc))
>+		return xe_lrc_multi_queue_timestamp(lrc);
>+	else
>+		return xe_lrc_single_queue_timestamp(lrc);
>+}
>+
>+/**
>+ * xe_lrc_update_timestamp() - Update lrc timestamp
>  * @lrc: Pointer to the lrc.
>  * @old_ts: Old timestamp value
>  *
>- * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
>+ * Populate @old_ts with current saved lrc timestamp, read new lrc timestamp and
>  * update saved value.
>  *
>- * Returns: New ctx timestamp value
>+ * Returns: New lrc timestamp value
>  */
> u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> {
>-	*old_ts = lrc->ctx_timestamp;
>-	lrc->ctx_timestamp = xe_lrc_timestamp(lrc);
>-
>-	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>-
>-	return lrc->ctx_timestamp;
>+	if (xe_lrc_is_multi_queue(lrc))
>+		return xe_lrc_update_multi_queue_timestamp(lrc, old_ts);
>+	else
>+		return xe_lrc_update_ctx_timestamp(lrc, old_ts);
> }
>
> /**
>-- 
>2.43.0
>
