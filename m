Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A20E7490C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 20:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB7610E08D;
	Mon,  2 Oct 2023 20:03:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEDC10E08D
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 20:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696277009; x=1727813009;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XAI6XUHzGUR6T3hoYCOgkrElvBMf6v9Un+Nt8fr5gPg=;
 b=JcDoK5DFV+IU0aWM63kx2W1fWYb+kpQRRv4KtkY2eqk1MVremmyhzjyi
 5yfP3fSmXN9FlBMqbVhu9Yjay4T1d9d4yoR3RxXhMWEbR+rSiBPL76Etb
 NI2u0cWLwlR/Qom3iJ1SCbYUSPMfJyBibj1VobcYVvth5Hh6jyu02GyiN
 QP01txY7X2ECbpwBYB3CSkIeIpkg8AUwQa0OqHBvEWBhxEY4T99rJ/RON
 lWiKw1p1Y4GJpNxbRH6tney3bpP7PMmLo3PoMVc9f2/TW0ayAEanDjuIZ
 Lr7GC4amjbiZQRResnG9NIVizmX0uzSVp0RBmIhZQIOsaxdvKuZqMFMpc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="362094464"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="362094464"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 13:03:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="866589161"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="866589161"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2023 13:03:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 13:03:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 2 Oct 2023 13:03:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 2 Oct 2023 13:03:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDYwl1o/v8n+c8j5+vuL2G8qnFeh1qqTL0TvueydaUbygy/TlzVbmGiMcDy1CfyukUC57Pwu5eTJ7U9Y0k0Oou4XGaA4Dfa2r1nvKzo/8Mdu2p5BM847Ka8+HvQJkQzvPh1Aaf9ubybXFmCRlxMCo5xm5pyxlAqilzRIsEUuIVc3O01J7kqvGNtkX09NoymC+i7/xuDufHMWb5QwLE8MKYQnffT6XGJGf0V6BzfbWc2+3uwdRUBj06mGP+vx2GHVu7iW3Jd0f6VEkEqWvbq2KPU+GaVHdQ5gaR2HrBEENXQQiwbsZG69tmMGtgUS0nS27OPOgYb9zXLnheyHsqhYSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoQcvAhIFOTctPaLBVQfwipBQaGbq+s4Jgp57wcCYXE=;
 b=LRp+t7RQs2MivJE86NcoCU7aIb6ZIMcoFTJ2441p9tcW8kMT2axdXFzUgNQbACDoH7LEAq1OLc7Fgsq0Dtt0gHw2hVG80xuJoCpIoplrWhx0Ok3KzybVIoeXHMmdd7DNP3kFM4/vthqaiXUzFiYLinuAj+xK4B3NDYJkWF0JFV1QM9xai2rfkV4+LXDQ5KWfsHH9C7bBnE7ShMFbYSdaTX4pfUeA2TwuLmGJXiMQonsLdKVnziSBL3cvqo/owywU5kK8ldS65IuIP7zsIb6pyIQyF6l0iPWW5Oyj/IHR02MWh6wA5W+laI8r6xa9THglY4QRQjO/Zpau2HkCCCd/Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7516.namprd11.prod.outlook.com (2603:10b6:510:275::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Mon, 2 Oct
 2023 20:03:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%6]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 20:03:22 +0000
Date: Mon, 2 Oct 2023 15:03:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <z5yeje3ue2lvbfdgrill2zh6kygpbawnk3j2jgfgegvyk2pgn2@hok5k33v32qs>
References: <20230929050253.3153804-1-lucas.demarchi@intel.com>
 <20230929050253.3153804-7-lucas.demarchi@intel.com>
 <20230929204435.GO233750@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230929204435.GO233750@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR07CA0049.namprd07.prod.outlook.com
 (2603:10b6:a03:60::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: d971bc20-6b4b-409d-5c93-08dbc382a16a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NN2AJbzwbgBhmRm0J33SpvlJMGZxVjHDGYbV5PwXaFd+vRfxzg6zX35V3GrgNKCtPjvjo99WeE/szRVGOsNXirOWYzm/1aVqfrf4sq+xlD/T3IS7dMNcGHeqFO+KSsK3sQJxpirkC7pv6MJeIM6Tvc7hfdkzJbda4kHb+hZmtMacggOVeCk52TK+2kaJ4eaG9YzbSnrVdvLMvLtuLdfN9f64tcmcSL4RK7erNj7AcjQ2L1GdoT0T5i/lX379JzL0gRMAzm72yzuEpqn5bPfE5u+QkYbUhbrmmb7TIZYYGe1639xzcZZOBQFMFst70vAWd6Gl5SwQHpddYTQ7wnygPpc19JfCSQHGRyfPBeu5cgP4qphBidjjqFvHnOv9PufKhGyXvCn73fwlYL2ttBJN7DqhCAxenyJVSlJF2hcbw22MVt3tMlHa+wx7YZ3UhLp35AqM/D933zi7eLPtkpwfDFqnKZ0wwFm+2QgtEliPb3jiy9GO26GYhjKXEtkJMZSRit9scPL3towVpduYvYVi4MjrFoi5gRYmsM+XY3cGOY1E4qkDS84ksSTluieprQhh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(39860400002)(346002)(376002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2906002)(6486002)(6506007)(478600001)(9686003)(83380400001)(6512007)(66476007)(26005)(41300700001)(66556008)(4326008)(8936002)(6862004)(6636002)(316002)(8676002)(5660300002)(66946007)(82960400001)(38100700002)(6666004)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e8sjvi5nRf6mYMUtBSwobXSQkfGWdUQb1ttfBfICfRPy3tnjZTsTtbZRwwN1?=
 =?us-ascii?Q?0L6Uk7IqMho0m38AO2+BqYTt6ex9s6ua2nJxtLP0cgTWZecJAww+XhvUCxS1?=
 =?us-ascii?Q?MQB0QyMSCB33sUafWm1FmvDzGkEWfPXStnBUAblxkFVsTv+8VRnVSlaq6X+E?=
 =?us-ascii?Q?3lAZHychwRRyA0HnOpkCGO839FiwMdNLm53eLg2soQkkQwwuaHbgOtQ5o/VC?=
 =?us-ascii?Q?Ezda01mgjQcVBZgUEmdBmaAaMuRD9Yk3Vx+g8qp4C5FTNlL+j5QypcazJzJn?=
 =?us-ascii?Q?QFKu4QFDNPsvrzZSqKHlNuH2AgzHi936MMGq1GhnazUCIoaoHZFlOKhzIYfW?=
 =?us-ascii?Q?v5g1jsF7S230jwGOg4kJw9Ag1Cbc8pAWEk/AsqvLR/vuoE/PdvOSuNkTbgcv?=
 =?us-ascii?Q?a7pLXJmIUGF6aci2L1XVg8cNuQZURvrPeYHqr5O0lqOP0AE0V239aTmm+Uhd?=
 =?us-ascii?Q?jqXmZioRfweVr+Z1FGoYagEQ8Z6CDJL3t9rE9+gbd4WvdFEJT4O0WVDeapGw?=
 =?us-ascii?Q?mpN4IEcTPse12Ya8iNV8spd/U94Ay4K2dZlveN8Ktnv+xZyRz2o8bjU6/MyR?=
 =?us-ascii?Q?9gXj9lrmnX74SLhMF7QIDWN/S0FBU7pqkFWQseYII99mxwWUqedm5qq/hbUI?=
 =?us-ascii?Q?tDZZMFe+Nm39CdJaMTH6qSy9LtY2jM7Fq2stHJogasGea4i/+7sV5YvsdXvf?=
 =?us-ascii?Q?TfaArALArkgTk9CoFuRJYDahJELYK3853MLO2JlHuZOcsIyoTwbQQSTeeDNI?=
 =?us-ascii?Q?LJlgLflq9VdHezy+1Rfaz9t7T/+des1j7A+DyLBtuwfb5UakhEpJFzYtSYy2?=
 =?us-ascii?Q?Jpat99Hun97rfVbaYd7zEIRIq3BkXzZdU+FkaJnEh5PQFFdK5qISfP1/+ysA?=
 =?us-ascii?Q?5lmL9HGpgypoVAgcuJJ/VRJJZDX+4WeUn97nAQWZa9f2lT+X4Rey6iBTr09H?=
 =?us-ascii?Q?3WwMMuDRB4w4zXE5doUDiDqS9olIS0MEJxZT14zOHs6BKXcclz9UP0iJegGw?=
 =?us-ascii?Q?Kjje6mSsYI8ZWFkHrRTQcjETrmDblzSMY+7HGmKHLNR69F4dYKxOHH5BaA4x?=
 =?us-ascii?Q?cy+kFG0501OpZRO5efDQl41e28oqHvxka60hgpxWJsEHeBD3f3D70sl9nmDP?=
 =?us-ascii?Q?pXOq/vKWP7Sn3sa8vEQiGAAHOU5RTwfEI3+dRqfPJGRq5n+FwcpHLvKOgKMp?=
 =?us-ascii?Q?lReCY2ZbHhaCwgDwXF+xOCHn/wRtSCF+d8e9VRP9CxSTHC9OMpJUTY8Ea6LP?=
 =?us-ascii?Q?WkAwbhBVjxpQcNp9V5i3st5GBis0SQqYyi6D5Q6b469GRRbLRlWSy7Z4Ov7G?=
 =?us-ascii?Q?cJrcBckB4gk6y6q1ogww2236qSLpAW7/do/rQcYE9jFaNMB+VhZtKXazLGb7?=
 =?us-ascii?Q?KMnT1+VvOfGcgtmRUX6zNFIHB0GGUJO6aZqKSYzO7aotKJkPHlDAMJeFc0n3?=
 =?us-ascii?Q?Kgw00+IK6No4UBL0m5GNlRI8NFcHUPHp0BNI0nriZpKY0WbrTsAZoer0emG0?=
 =?us-ascii?Q?nzj22kCN3p6sCQ2aLjepMpxbZfzngaKiMDaE8Y2sVTMjUg0jFvTGsjL9FgUk?=
 =?us-ascii?Q?W2ntHuioUp8aC3oyDVZDUj+r3ZfKFoIDlUziCv70lNDVjtg7Oxh0ztLw0Pei?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d971bc20-6b4b-409d-5c93-08dbc382a16a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 20:03:22.6881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08njHHwPwde9mIkTokBI0qtlIIB2rWQwk6MzS1dO7NkQBPcweU2qqenj4KFRn1SlbpYieJ97nBTv/3BkqSxG23nQAlwnMk5KcAax/JcOcQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7516
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/7] drm/xe/pat: Add debugfs node to dump PAT
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

On Fri, Sep 29, 2023 at 01:44:35PM -0700, Matt Roper wrote:
>On Thu, Sep 28, 2023 at 10:02:52PM -0700, Lucas De Marchi wrote:
>> This is useful to debug cache issues, to double check if the PAT
>> indexes match what they were supposed to be set to from spec.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++
>>  drivers/gpu/drm/xe/xe_pat.c        | 96 ++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_pat.h        |  8 +++
>>  3 files changed, 116 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index ec1ae00f6bfc..cd6d28c7b923 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -16,6 +16,7 @@
>>  #include "xe_gt_topology.h"
>>  #include "xe_hw_engine.h"
>>  #include "xe_macros.h"
>> +#include "xe_pat.h"
>>  #include "xe_reg_sr.h"
>>  #include "xe_reg_whitelist.h"
>>  #include "xe_uc_debugfs.h"
>> @@ -138,6 +139,16 @@ static int workarounds(struct seq_file *m, void *data)
>>  	return 0;
>>  }
>>
>> +static int pat(struct seq_file *m, void *data)
>> +{
>> +	struct xe_gt *gt = node_to_gt(m->private);
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +
>> +	xe_pat_dump(gt, &p);
>> +
>> +	return 0;
>> +}
>> +
>>  static const struct drm_info_list debugfs_list[] = {
>>  	{"hw_engines", hw_engines, 0},
>>  	{"force_reset", force_reset, 0},
>> @@ -147,6 +158,7 @@ static const struct drm_info_list debugfs_list[] = {
>>  	{"ggtt", ggtt, 0},
>>  	{"register-save-restore", register_save_restore, 0},
>>  	{"workarounds", workarounds, 0},
>> +	{"pat", pat, 0},
>>  };
>>
>>  void xe_gt_debugfs_register(struct xe_gt *gt)
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 296763594370..20714888a5fa 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -6,6 +6,8 @@
>>  #include "xe_pat.h"
>>
>>  #include "regs/xe_reg_defs.h"
>> +#include "xe_assert.h"
>> +#include "xe_device.h"
>>  #include "xe_gt.h"
>>  #include "xe_gt_mcr.h"
>>  #include "xe_mmio.h"
>> @@ -14,6 +16,7 @@
>>  #define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
>>  								   0x4800, 0x4804, \
>>  								   0x4848, 0x484c)
>> +#define _PAT_PTA				0x4820
>>
>>  #define XE2_NO_PROMOTE				REG_BIT(10)
>>  #define XE2_COMP_EN				REG_BIT(9)
>> @@ -43,6 +46,7 @@
>>  struct xe_pat_ops {
>>  	void (*program_graphics)(struct xe_gt *gt, const u32 table[], int n_entries);
>>  	void (*program_media)(struct xe_gt *gt, const u32 table[], int n_entries);
>> +	void (*dump)(struct xe_gt *gt, struct drm_printer *p);
>>  };
>>
>>  static const u32 xelp_pat_table[] = {
>> @@ -151,12 +155,38 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
>>  	}
>>  }
>>
>> +void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int i, err;
>> +
>> +	xe_device_mem_access_get(xe);
>> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +	if (err)
>> +		goto err_fw;
>> +
>> +	drm_printf(p, "PAT table:\n");
>> +
>> +	for (i = 0; i < xe->pat.n_entries; i++) {
>> +		u32 pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
>> +
>> +		drm_printf(p, "PAT[%2d] = %#8x\n", i, pat);
>> +	}
>> +
>> +	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +err_fw:
>> +	xe_assert(xe, !err);
>> +	xe_device_mem_access_put(xe);
>> +}
>> +
>>  static const struct xe_pat_ops xelp_pat_ops = {
>>  	.program_graphics = program_pat,
>> +	.dump = xelp_dump,
>>  };
>>
>>  static const struct xe_pat_ops xehp_pat_ops = {
>>  	.program_graphics = program_pat_mcr,
>> +	.dump = xelp_dump,
>
>If we use the unicast xelp dumper, some of our reads might happen while
>another thread is steering us to a group/instance that corresponds to a
>fused-off mslice, resulting in 0's instead of the correct values.  We
>probably need an xehp-specific variant that does MCR reads.

ugh... I added the additional dump function while coding this, but
decided to remove since I thought it was the media gt that did the MCR
read. Since we don't have a separate media GT in PVC and DG2 then we
wouldn't need the check. I will add that back

>
>It might also be nice to have an xehpc-specific dumping function that
>does field-based printout ( CLOS, MEM_TYPE ).

ok

>>  };
>>
>>  /*
>> @@ -166,6 +196,7 @@ static const struct xe_pat_ops xehp_pat_ops = {
>>  static const struct xe_pat_ops xelpg_pat_ops = {
>>  	.program_graphics = program_pat,
>>  	.program_media = program_pat_mcr,
>> +	.dump = xelp_dump,
>
>Xe_LPG / Xe_LPM+ need to choose MCR vs non-MCR based on GT type as
>you've done with Xe2 below.  It would also be nice to have field-based
>dump output that presents ( L4_POLICY, COH_MODE ) separately.


ok

thanks
Lucas De Marchi

>
>
>Matt
>
>>  };
>>
>>  static void xe2lpg_program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
>> @@ -180,9 +211,64 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const u32 table[], int n_entrie
>>  	xe_mmio_write32(gt, XE_REG(_PAT_ATS), XE2_PAT_ATS);
>>  }
>>
>> +void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int i, err;
>> +	u32 pat;
>> +
>> +	xe_device_mem_access_get(xe);
>> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +	if (err)
>> +		goto err_fw;
>> +
>> +	drm_printf(p, "PAT table:\n");
>> +
>> +	for (i = 0; i < xe->pat.n_entries; i++) {
>> +		if (xe_gt_is_media_type(gt))
>> +			pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
>> +		else
>> +			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>> +
>> +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n", i,
>> +			   !!(pat & XE2_NO_PROMOTE),
>> +			   !!(pat & XE2_COMP_EN),
>> +			   REG_FIELD_GET(XE2_L3_CLOS, pat),
>> +			   REG_FIELD_GET(XE2_L3_POLICY, pat),
>> +			   REG_FIELD_GET(XE2_L4_POLICY, pat),
>> +			   REG_FIELD_GET(XE2_COH_MODE, pat),
>> +			   pat);
>> +	}
>> +
>> +	/*
>> +	 * Also print PTA_MODE, which describes how the hardware accesses
>> +	 * PPGTT entries.
>> +	 */
>> +	if (xe_gt_is_media_type(gt))
>> +		pat = xe_mmio_read32(gt, XE_REG(_PAT_PTA));
>> +	else
>> +		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
>> +
>> +	drm_printf(p, "Page Table Access:\n");
>> +	drm_printf(p, "PTA_MODE= [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n",
>> +		   !!(pat & XE2_NO_PROMOTE),
>> +		   !!(pat & XE2_COMP_EN),
>> +		   REG_FIELD_GET(XE2_L3_CLOS, pat),
>> +		   REG_FIELD_GET(XE2_L3_POLICY, pat),
>> +		   REG_FIELD_GET(XE2_L4_POLICY, pat),
>> +		   REG_FIELD_GET(XE2_COH_MODE, pat),
>> +		   pat);
>> +
>> +	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +err_fw:
>> +	xe_assert(xe, !err);
>> +	xe_device_mem_access_put(xe);
>> +}
>> +
>>  static const struct xe_pat_ops xe2_pat_ops = {
>>  	.program_graphics = xe2lpg_program_pat,
>>  	.program_media = xe2lpm_program_pat,
>> +	.dump = xe2_dump,
>>  };
>>
>>  void xe_pat_init_early(struct xe_device *xe)
>> @@ -252,3 +338,13 @@ void xe_pat_init(struct xe_gt *gt)
>>  	else
>>  		xe->pat.ops->program_graphics(gt, xe->pat.table, xe->pat.n_entries);
>>  }
>> +
>> +void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	if (!xe->pat.ops->dump)
>> +		return;
>> +
>> +	xe->pat.ops->dump(gt, p);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>> index 168e80e63809..09c491ab9f15 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.h
>> +++ b/drivers/gpu/drm/xe/xe_pat.h
>> @@ -6,6 +6,7 @@
>>  #ifndef _XE_PAT_H_
>>  #define _XE_PAT_H_
>>
>> +struct drm_printer;
>>  struct xe_gt;
>>  struct xe_device;
>>
>> @@ -21,4 +22,11 @@ void xe_pat_init_early(struct xe_device *xe);
>>   */
>>  void xe_pat_init(struct xe_gt *gt);
>>
>> +/**
>> + * xe_pat_dump - Dump PAT table
>> + * @gt: GT structure
>> + * @p: Printer to dump info to
>> + */
>> +void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
>> +
>>  #endif
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
