Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB09C61DA4
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 22:50:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2156E10E044;
	Mon, 13 Mar 2023 22:50:21 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D94110E044
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 22:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678747819; x=1710283819;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xXYwGhUQIKGFLSKnfzZdXoaVfd9Qn5JUXBJFCUgR9MU=;
 b=Pzmph0MlJeRQZ2bs41sIXPz6r5UGlEnGftAv3QrW50lRjlFC9FSyRliy
 wnVbjmmh+Eaw/AV3DKM6lk5xi4GDRasKQ+AUQHQw9hZ0y7mJuP8bF3D0t
 VGzuMCJrk9kuxPb5zzcgiTnpLehh4CPWE1NAwuehIXn9iKfLfEG3IPGBR
 FKdVr+OgvCyQ2XIrs4i7Ym61pT4QKL6qQp2tulAQ/tMEIg1vi3NkuRYam
 3CQlDvLnUptfL05BG0AInBhIXsHQs9lCGUiyckRo65JoJhHpNAoYlVYth
 776GWRhYbPGo56yncXyH37sCr0jC9ffN6lsU7xjomJPWazS9J55YgvHj6 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="402150253"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="402150253"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 15:50:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="789091514"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="789091514"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2023 15:50:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 15:50:17 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 15:50:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 13 Mar 2023 15:50:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 13 Mar 2023 15:50:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9+jWvqVjXqhP4jNnlR04VzWJRQiUoVRhh/52P9wIjh0tsBvCXI33PQZo7+xPfb5XV4c6S8DlHOaBGm77Fnu4V1D5wXh4tcfoCIeKt4ZQlYfLNf3jPbfp0X+aNH/eSOTQZc4SF/vz87cIdIZ8c0q0uqRUEE24BTtfhSn9ZmwY32IZjulKWGfN9feCoicZx5VmkUVh/tqtuLJuplVAZ7/hFqHG7ucl4Oszd+qMg0qFuGLk6UtWJ98o4EDeB+GlchuU5vvLThY69KyjERya6Tuo9A0FlC3bXueu+Kk/Uetq/aw5yAWsIP1UecKvauLw+vzt7ZGR5hyq+AU2IMueKaDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyPg+Y4alqwkhGtN1Pcy5utCKooPY8Qa+TIK7IEvQGI=;
 b=EM212RblV3nAhpT2eNFx9fBIHzuAX33vtwItHYqATlgcekZduL4y+99yL/92mplxQ8fAnbrq4mk2jgELlh74wlh2hD4jlwVbcXTBYeVjJPJOzoWFX/T2KY7Dy4RVdewoiOrVwFilK0rxUeXhVkwLbaajWOLlJ8obByPzvk2wC0UDKGZC4HLsEV4q3j03tBj+dkN3u/CR3EnImTr8F/sQivFG2Z7byXtZMYREqmHDBiXOPKyP2OJmMAjpvgq9zlmfzkdnt3dKOs9+ykXcHrm6Ag7RvuYNgDICceuwZ+bQYDkqTIjX7GAFcHsyBfqvTAB6pyIUKZN9hgYyyRnDyzVgrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4842.namprd11.prod.outlook.com (2603:10b6:806:f8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 22:50:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Mon, 13 Mar 2023
 22:50:15 +0000
Date: Mon, 13 Mar 2023 15:50:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230313225013.ghih5dczgojqjnn3@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230311001049.GY1175070@mdroper-desk1.amr.corp.intel.com>
 <20230311171551.2394555-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230311171551.2394555-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR06CA0031.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::44) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4842:EE_
X-MS-Office365-Filtering-Correlation-Id: b6028883-5df5-4a3e-dee5-08db24154f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J0R3ymMg6DrVVWzE0OMfyecbGSW6JuB5WOfFRMBdI+Xob2yLWW7Lruo/5X07y5PF88JFtji16X3jjRWROGCOXaUV/K5BMCmow51/0SYyVByuTW8iPb0Y3GbGBmM29GJyqqa2Bh7EignPimQ8MWcLhAo9UxJEX0Gao+2dgJjN+iIApZTLM5BDjyMwJdbO2whuQMZI5Q9gd3wwkgboKzBJx+E0fqUtlTT22DuF1T5SuOP82C5y0HnVc1k4eoMI9qnxnkxSLaV2AlHD3TkCgVBobVl80h+m+48XHUt0hAepJz6hmB/d9gp41MONBxM4BCmQEtYxPxaOcYL79vKfQNX+iTasAYb6Qf5ksgUnfSxf9FFfoQSOoTpmH9e6flTNwaIJRX2PO/BfJoiRp3USUNVHUe44vJ6vG35M4RUyY1CFdSLXhyvIXeTW1rZXTX3psKlxUhA73l6ImMtYg3J7w/c3E7n4RaVeTwyG/TxbieBr12G/YFViikqzUJypt9p3xIcxqg7MKW4Kb2W+uR/mEXb8kFSHBd7zierr3gw8drDKf7tZoaX3H8ciNyCgxVs8cGHrVuZ+/sjQ5FD0hr6XyRvBYPNcEa6VRGSPrA90blWAHTk21TOTmMhSp1cvrwDu8iXPIMYhXEaSjs5K0Zo3wnWi5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(136003)(396003)(39860400002)(346002)(451199018)(38100700002)(2906002)(82960400001)(316002)(6506007)(107886003)(86362001)(1076003)(6512007)(478600001)(36756003)(66556008)(8676002)(41300700001)(66476007)(66946007)(6916009)(26005)(186003)(9686003)(4326008)(6486002)(8936002)(5660300002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e7zGeh7oOHZlEcUz9g8wAA+ZL4RDAtzg7VA6AOW+5fvs7A4ZncGb6l8vQRTk?=
 =?us-ascii?Q?ypKSQulmtAKIHSsoD71nOy3ZIHs12PqDs165IgM/ClznLxATqbaFmvk5vkzJ?=
 =?us-ascii?Q?m8NiJyhsQ2sKTYDZRNbdbMZOKfxlz7Ewg6p1flb8xveanm9RAdUVmo9iz8pV?=
 =?us-ascii?Q?oPqJUoxfAegklpTNkCpmWgVgdf2QaERMKiQVZI4pYoYz3S2/H3VS7ylEBYPa?=
 =?us-ascii?Q?YwymO/WzeGwVFVUvsRwdEcT44wo/2yzFJ6CjZYjkUJnXV99ZEOxDPiVy0YCw?=
 =?us-ascii?Q?uGTAPrOLBybY6X87xLJMlBkdjjNiaPXjK08WBHX8OAjELIssZ/CpT5SKl3bW?=
 =?us-ascii?Q?Z3CaIb5CTGTeQK3KWXIsnMgZCTdjWjriSxRyoVz9PmY9vOVhnfVBN0QFUUXf?=
 =?us-ascii?Q?RvVJIC2IlW1K/W8qQyTti4HbNz0WYiAf2xJnCVufpoP0I99dOoJZkeZsrzoW?=
 =?us-ascii?Q?jkpmJ5/p9EwPppKzZZQtoG1mClmChJNR1LfYrA7FD/qsRw43ct0aY54Doni/?=
 =?us-ascii?Q?/zqtoyy8OM5fRI/KhK5ch0gtVUiCGuYAmocYJUpzq7CJPnOVztGa78LlFPvq?=
 =?us-ascii?Q?N6CyFSZpRzd7y/bFg7rXLUZbcOrETKUsmWvFzFGPCzmANCGRO5sqcUNEz5EH?=
 =?us-ascii?Q?6yLzoWOREp/on7/jVCu1L8SvH2vjYlcsdbgpsKPPlY4zKxKkF7FdGWOHphV6?=
 =?us-ascii?Q?i6vvJbQWS58E38RFk0TuHO6WZxcAIwr27deW2HorSni5yMEGDwZ0dlzACdrA?=
 =?us-ascii?Q?Alm4SflDwrU9nYm3raodr6BLC6XXjkOP/N7cAz9iPTRniU+cY2SbDf9QSa/p?=
 =?us-ascii?Q?IlDYx24c7qbOON3qAUKokQSG1iHAtBMOsmGi7NfSN7OItreQ2/vwDOogoNcH?=
 =?us-ascii?Q?mRqUwKIOlqrXNJ/ejuw6xVpwwQ0ny5GfHxujKSR6WNKNc4VQFHjR6+6SwRqx?=
 =?us-ascii?Q?2PKthKcWnklYe/SXswCZ/RRmZi5bDwvo9cf+beFwBSlsb6IJdygkJiAviSkq?=
 =?us-ascii?Q?5HojR8fDVYlHYei2irOApSLrI40Wmcaid/u+lhqE/lf4M/LsBG1tbbaxdZgM?=
 =?us-ascii?Q?DR/g7haAISQsydF0XkU+0Q27hOPwoGPQTQNN1C77gRhHqBB1ov67mn9VrxP0?=
 =?us-ascii?Q?Hty0DU55/PqtEo+cM2aai3K0nzJi8zVH0hIt64F0N/bHMeBs3hpjnUqVV2uX?=
 =?us-ascii?Q?AvIw5rSh+K0NKE+RrRTggcxA5Gzem+i/6cD1A8VeYs85IotcpzPcLsbFdLeI?=
 =?us-ascii?Q?3a5oEQbneqU9zJUDwikOSzzK8KrD40IkLPMMvh8yXH69RQhlp4G1djpGSfk2?=
 =?us-ascii?Q?4PO0lsrP5Wm9cd+75pMaWPqdX9oWmFyJsPw8XlQ2XSV34M2Z5HotBP/Dp+E8?=
 =?us-ascii?Q?RNWreFpaF104p2c5LyAQbIY0ukpnw0Byt9XBrOWyrBzNPM7T9qKqa9twS9yX?=
 =?us-ascii?Q?BVsmsuyzssUp/X7Rqd6vS40VULN68v0EkZB8AJfZ2/dfxY/Og74eascmHyi2?=
 =?us-ascii?Q?v0nacN9RQ8HKCiMSn3fr2le4AtHWDreFQbDKKLxq/6WB1UQGEeGTlbOrPtnh?=
 =?us-ascii?Q?GyKDj0W/Dl4DAJOuQ03TpW87EUb5M67fl2y+6irVwTsbDjX6t7MUrjy/PEBr?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6028883-5df5-4a3e-dee5-08db24154f59
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 22:50:14.9291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+DSuROQ4zRisI8+lw6n3WMXyY9X8obhWnKXChsecdSfDM5/h2YdFFb4muliGafttBl0wgZOsjg1sfGicGL/BtGRp67EKqxzRf6Kys2VOWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4842
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Move policy on preemption from WAs
 to tunings
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Mar 11, 2023 at 09:15:51AM -0800, Lucas De Marchi wrote:
>The fake WA FtrPerCtxtPreemptionGranularityControl is documented in i915
>and is not a true WA: it's a policy chosen to allow preemption settings
>to be controlled on a per-context basis by userspace. Move it to
>xe_tuning.c since it's more in line with what his is doing. However
>since it's not something suggested by the spec, prefix it with "Policy"
>rather than "Tuning".
>
>Suggested-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_hw_engine.c |  2 ++
> drivers/gpu/drm/xe/xe_tuning.c    | 22 ++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_tuning.h    |  1 +
> drivers/gpu/drm/xe/xe_wa.c        |  6 ------
> 4 files changed, 25 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index 63a4efd5edcc..53dc342cc3a3 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -22,6 +22,7 @@
> #include "xe_mmio.h"
> #include "xe_reg_sr.h"
> #include "xe_sched_job.h"
>+#include "xe_tuning.h"
> #include "xe_wa.h"
>
> #define MAX_MMIO_BASES 3
>@@ -293,6 +294,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>
> 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
> 	xe_wa_process_engine(hwe);
>+	xe_tuning_process_engine(hwe);
>
> 	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
> 	xe_reg_whitelist_process_engine(hwe);
>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>index 2861a014c85c..5d3febd0b97e 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.c
>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>@@ -23,6 +23,15 @@ static const struct xe_rtp_entry gt_tunings[] = {
> 	{}
> };
>
>+static const struct xe_rtp_entry engine_tunings[] = {
>+	{ XE_RTP_NAME("Policy: FtrPerCtxtPreemptionGranularityControl"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER)),

this is actually wrong... should remove the GRAPHICS_VERSION_RANGE()
check. I don't know why it was there in the first place.

Lucas De Marchi
