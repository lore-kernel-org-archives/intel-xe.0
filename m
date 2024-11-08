Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02F3D64098
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 22:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7A610E29E;
	Fri,  8 Nov 2024 22:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OY4YsHaq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6F710E29E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 22:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731105361; x=1762641361;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WNMuNZu8SFiVPsQNXtFcOc36f5blnWGMIsZZdZsbmhg=;
 b=OY4YsHaqTtDTlycGyGT9ucyvI0Oe6wPaDD0EvWZ8q1g/fQKbuD6GHLfY
 EfzfcwxAbMg5By7AQ8iWFJxMDySU9sN7uoS/kMxU2/RExMoO01FuC+pZ8
 NP3Ze+drqRKFB8cVxbIuGWws7J9U9UudmP3lkem8cA9gnvhkfhdBybnQK
 uOrMDQZIg/KYYGFHNY2edR/GgSx5ofIizBbuL95y+lOMMWa/MkUSuofgP
 aTcCfB08M2Tqd4qAlzdFLQibe1zf17QeE/odBzMfj5fLbUDCbNEJifa1h
 ue/tNnpkxl79cCLX8J71kQyNPRdvIxng4fI1CQcN76YueFUwz7W8B1hi4 Q==;
X-CSE-ConnectionGUID: I2loLCCNSa24XOgrRUSvzQ==
X-CSE-MsgGUID: 1vgo1BmQTSiVwJjrDr4ZRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53566343"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53566343"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 14:36:01 -0800
X-CSE-ConnectionGUID: VnbMyV2cS1G0+Zfd/Ow/9w==
X-CSE-MsgGUID: bKQSL7IFTpicfHnsn3wzpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="116584974"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 14:36:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:36:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:36:00 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:36:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugdvtSZHxunVk3HTupaTBmR3rKCQ+TONzxmLibovlOEh1rGTplS+xSWvdGq2jIo8yzeW4bY0wlW+TPZJl53JnksL95POhJBpApRg+Hw7rWsG3alLhYnqOfQl5mMQBgxBXI0N/Dfsd3jWS42Y7WQPrnj1CJAeQuAtmL/6oN6k2KPkwj78uZ83BG35u04K5CKe02n3Ajt6N3cTOOZp+ISN5OAjB2AzL3sNX6pWg0DTc0YRvp3lbyUXWhCQvlwCf0TasIlpikQmtdhIItJ0TKUcFLhrNHnHWOKa4O7Ruv1foCgIynA1/phUQKKKYIf+wa3lFQDvYcHMQeYMF9mq1Af5gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKAIgzPENhocmMJHMZZt1PBkeFDL2czL5rbpPestWr8=;
 b=inMBloENsZfl5S9KjHN8FoebQpbk0N0/S5ppyCdo2wD4XIXkwcoE6l7APlSJp6HbL5HM5De0ms8xzongN9/Ep5r/URPatzd45GZ/rTJq7aqkgj4oE50LJYZoqr5tbtruUPzspM/arQELZE/BkZT+wVXcUBIWyjqWL29pLT3EvNLnyOKp/8mOoH8PUICe412Pc6MAGiBJBoDM+Wbmr/SuZ9W3XzykysLZ4W13utVFntrxSombOBIfJVRBqyMy+4U5HwRga00BFCasc2SXIHWnoA4qnmL+U2MaNMwdMRvM/RDrgk3b8acuXAwNBXPNHCZCdh8WzPjc0liHpSxwXNSfoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MN2PR11MB4646.namprd11.prod.outlook.com (2603:10b6:208:264::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 8 Nov
 2024 22:35:57 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 8 Nov 2024
 22:35:57 +0000
Date: Fri, 8 Nov 2024 17:35:54 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/pmu: Add GT frequency events
Message-ID: <Zy6SSom23hvE_pL3@intel.com>
References: <20241108181512.3461481-1-vinay.belgaumkar@intel.com>
 <20241108181512.3461481-4-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241108181512.3461481-4-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:303:b4::17) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MN2PR11MB4646:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bdae6a5-d675-4417-f59e-08dd0045b699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HxtKb5ny+cSHoy9M61qZ2ypII5qN3LlkeICuhwPNnJBUK8saCovNMXZSmCsK?=
 =?us-ascii?Q?jcp3Evq7Nhzd0jK/noosYq8hovFQff3gONzomssEvbrhZQbSltn0cqdZAJl5?=
 =?us-ascii?Q?ouXf8aFp3tMAyrN/cQhgheG+Ip25DrrQqXMKVqcyeGzjsSJqevPzHyiw7IJe?=
 =?us-ascii?Q?kt2O+q7oIeN9u2w3r55tGlV5g8TMYwVPi6FYwg1o8g4USSFZOC1xJJ9/ZSmn?=
 =?us-ascii?Q?5dEvDkWESmpzSdh94b2Wa+BYcHq+UiQIRM4O8qWKVIozJF+OFLroePrfcWnK?=
 =?us-ascii?Q?bxSos+/7AeKDBzLYGV7Ak67xCtQhhAlpfqd1merUslsdZ0aqkVLTXDrs6oXo?=
 =?us-ascii?Q?0JLwjB3ddBwMSTFlncw2Rwlvy3d5pS1vE69le/Eq35MJH5iz/6t6f5IEX9xR?=
 =?us-ascii?Q?yOdepE0QTDKUCVloZbvXsuwgoY1GmRugl6yY2bhTkKVgrnYmlgu81IsJtDko?=
 =?us-ascii?Q?uNR7aDBljk2UHKsrdFet2htf5n3LCD5V24AoNhijlIlK+PSmssRpV9r/OB+l?=
 =?us-ascii?Q?8e1mtsL2orehZUX3dLLmDLdJK1Lm3rvMF3/0AKQ0N606USImhMPccTQDcJgy?=
 =?us-ascii?Q?uSC2UzRV6UcUkjhpUFImldtMP20HMRIC5xoP39TvYdclbFCejSBZyTtaFxN0?=
 =?us-ascii?Q?tNSj51jS0XeEpV2rdyzAf6/GnyAVpeBYGu+hEner3WKNKGHZXMOMaX7p5OvS?=
 =?us-ascii?Q?SbyHsJ5c9tNfXfY1IN+iVLfJrtGzK8zG9i42Nd+PB1eEDwLAt3xyYQ7nNOtu?=
 =?us-ascii?Q?9fguD3wt/YEvaCxu+7XFTOlNlOHobHVsByLxGKh7O7hkCCrmih9lAkvqL5gq?=
 =?us-ascii?Q?OmdmiDTgzcEG1nuBTr+rDeUUzS+gjO0qqu2rQnPDJnvUq3tHMcT29Snvl8B4?=
 =?us-ascii?Q?7WsIdYr9tnRxkMpl7e7v/3BawmMj9fTOb9U4PnjFlVTcICuSHwW/KtExSJZn?=
 =?us-ascii?Q?YRv9U7nB6j6A5jnXN1B3JNxiWqP58bXT7xQDrsT3tEWkC4gVfpRyYqJbC1/f?=
 =?us-ascii?Q?7Z9TIF8hsh+Yy9VRSJfgmgastmioMoXBoI7rDbaiVD8rzpu55rvGEHpvUtGF?=
 =?us-ascii?Q?08yHqNMsEJNvNzqrwJ6DI5In+FnPlUAxe01rw/mspoB5QYRmGPr+6hXkdzZe?=
 =?us-ascii?Q?vKxQNLXmsQhXAxWXvN9LN/tH3Jl5kJoGg4bQzmty5P+L1609fhk+ZzGSlM1r?=
 =?us-ascii?Q?GyW44AIITTP4q4ICZwt224PfqW6bbgTNIFCQ9FxRlChgxhxmHteQNZ1xXSCp?=
 =?us-ascii?Q?eZGSDBJBlLURR49Evtb8YzEkB2w63PKhu3/GAHWyf8XyNXEtL+NGE6n9zogQ?=
 =?us-ascii?Q?frJGnZU0t6laB9bB0xZsvlA4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EWJe72RQg2kVi+4KzBgpiQdnXNAlWEX5T/w7/2y2M1Xjn4G3SkyH6iSJlhfI?=
 =?us-ascii?Q?z4l4ekDwG5XXhePX774APwHXIVv5Ji1MuvF5Jcgs79pkAIEN9CnM5D17THkY?=
 =?us-ascii?Q?kTCMdFB81HKmary2MkO+1rxJwcJ90hVQgIZW3vrOgCtfcVcMv0FuKT3u6ATx?=
 =?us-ascii?Q?8yHvbGn8KCCFIDWXDJqMfuUQi7SA++unls54Z2pmuBWlHSeNYaJTgHT0m7RJ?=
 =?us-ascii?Q?9viXF5MPeQyMtYjshEpNJToHLnqSRD7Pbw+iPmXFPUHVlMDEHh5w9w40YTAv?=
 =?us-ascii?Q?R39WgmgNMwL0ZYMtTSIypOTvvieI0IAU644H+BJ3gbfH5ZPOudRc05cAfG00?=
 =?us-ascii?Q?VWLqbT7yXBPbyYvHL2WHnL2jif4ZQveHdDxyv/mfvix+IvVLaDlkz225F988?=
 =?us-ascii?Q?qJ/WnTJImOhRPAarovGZ5fZHMv6t7MN+qou29IX/lsQKFNjPUFWoP3fUj54W?=
 =?us-ascii?Q?c650k5/SVdJrjIZ+VAUdZzpmAxPqZ/mgslcMCH7Fy7isw+hvv4hyAmGzftoG?=
 =?us-ascii?Q?C9osRv5bQTgQfX0vYI4VvCLHIvXHd88JOp00ZJdvBn33a534NA4N/7TvcZ3T?=
 =?us-ascii?Q?m2QeJFH+CLKSt++mto9RRb2SY/+TbRCjGI/yaZbrlXXNTniBPJ58Fx2UPrf5?=
 =?us-ascii?Q?5NbObXtRoeSQAB58dJm4CrNtYtKr29vSNEjsrf5VxBc2RpBqz74RNhmcIWCJ?=
 =?us-ascii?Q?cW07gEyuKT8q5/VwsCFU6nXnaU8oYvAgQDNcKXndRzC+LaHO9f22gogOt34G?=
 =?us-ascii?Q?bxkK4fuM5YLl6iu0yX6FKqsxGl8j17U7X3SiDavHeZ+r2wCgERa4C9TjkFUu?=
 =?us-ascii?Q?lEMImdZobqmmsJTGzYb3etoQyt4VK8+7dMow6Gw6j1xZWpcKix2hksUP7Dvf?=
 =?us-ascii?Q?mnJHkkcwlVjSXLm4bJJonRN1oUdbHapt92Bz5aG+Xt9MydDoThPoUC3zVjiL?=
 =?us-ascii?Q?34iJroKaPDgo2OJWVVB5JXsmmzyCYlUMNqIWsKv3AQOdqEbrZptAWmTyeEX1?=
 =?us-ascii?Q?/w5U7GMqIpqkj5phzyH5cdLzYmV8HsLodsV9uCv9x5ZAstaU3hPFp8AfLQWy?=
 =?us-ascii?Q?lYWMYkdD3P7NJzBqL0yOluKCbBpN0FdPZ+bapTzedSE/3h4uQ8aA68T4LKwu?=
 =?us-ascii?Q?zz7E9aacrPbVE31z/UsaUZu01Iqdhp1t+mBtDNymxlemm0A8TszPKF8DHaG7?=
 =?us-ascii?Q?Tea+CvFBLMcX/TwP7+LssN8r5ZKuh9lZspfavhyScA0F+zk1VMazNWyNTOPy?=
 =?us-ascii?Q?GF5bfNqR3q7k13JDg6PmyV9OYrBgFjNCIZt6tfY8J3oMG+jK2OhIR7yznQC2?=
 =?us-ascii?Q?VnGSMjHs97kZtCNAoPCruybqXSfnGgQ109JBXOOOQn2c1CNM8GZ7Zf6uJbj6?=
 =?us-ascii?Q?7a5cNJwY/9GTQlZrwn6Xu5Verp1BPw+ZLPARzzIKiUr8RvxVCthfi803ciZm?=
 =?us-ascii?Q?743gE7o0EyyAjEAWOqRcPXTvSlhchuZy3KJ7Du7LvYMx9pzRjWXh6dHcqJkk?=
 =?us-ascii?Q?4GLhylJJNk2cE76srDBwvcCtDJOjWbzqAbHSr8O3mImj+CEW6xG6l4t0nOhr?=
 =?us-ascii?Q?54SoyOoudNXcmIxBOxRbze07mVk0PJr3qNYjp5SYqCMq+HAwpuc0b+GbmnSK?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdae6a5-d675-4417-f59e-08dd0045b699
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 22:35:57.6623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ocqrUsSOhYEe2AAMdbOSx2hCapJ6avFvux+JukgCKy+eKMRIpHQtdmdgZAQh8iYhB4UGFEEsRHDF0r028gYCIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4646
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

On Fri, Nov 08, 2024 at 10:15:12AM -0800, Vinay Belgaumkar wrote:
> Define PMU events for GT frequency (actual and requested). This is
> a port from the i915 driver implementation, where an internal timer
> is used to aggregate GT frequencies over certain fixed interval.
> Following PMU events are being added-
> 
>   xe_0000_00_02.0/actual-frequency-gt0/              [Kernel PMU event]
>   xe_0000_00_02.0/actual-frequency-gt1/              [Kernel PMU event]
>   xe_0000_00_02.0/requested-frequency-gt0/           [Kernel PMU event]
>   xe_0000_00_02.0/requested-frequency-gt1/           [Kernel PMU event]
> 
> Standard perf commands can be used to monitor GT frequency-
>   $ perf stat -e xe_0000_00_02.0/requested-frequency-gt0/ -I1000
> 
>      1.001175175                700 M    xe/requested-frequency-gt0/
>      2.005891881                703 M    xe/requested-frequency-gt0/
>      3.007318169                700 M    xe/requested-frequency-gt0/
> 
> Actual/requested frequencies will be 0 when GT is suspended.
> 
> v2: Checkpatch fix, moved timer code to this patch
> v3: Fix kunit issue
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c        |   2 +
>  drivers/gpu/drm/xe/xe_pmu.c       | 247 +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pmu.h       |   2 +
>  drivers/gpu/drm/xe/xe_pmu_types.h |  26 ++++
>  4 files changed, 276 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index fd18bbce99da..ef27db83c09c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -940,6 +940,8 @@ int xe_gt_resume(struct xe_gt *gt)
>  
>  	xe_gt_idle_enable_pg(gt);
>  
> +	xe_pmu_resume(gt);
> +
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	xe_gt_dbg(gt, "resumed\n");
>  
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index 80d78628006e..4fbd5a99dbcc 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -63,6 +63,31 @@ static unsigned int xe_pmu_target_cpu = -1;
>   *      2352945
>   *
>   * Each value is roughly a 1000ms increment here as well. This is expected GT residency when idle.
> + *
> + * PMU frequency events use a software timer to aggregate GT freq values over the time of capture.
> + * This allows us to calculate a rough average over the timespan. This is why sysfs is the best way
> + * to obtain instantaneous frequency if accuracy is intended. Advantage of using PMU is that it
> + * results in lesser CPU utilization as compared to dumping sysfs entries repeatedly.
> + *
> + * To list GT frequency events, use the following-
> + *
> + * $ perf list | grep frequency-gt
> + *   xe_0000_00_02.0/actual-frequency-gt0/              [Kernel PMU event]
> + *   xe_0000_00_02.0/actual-frequency-gt1/              [Kernel PMU event]
> + *   xe_0000_00_02.0/requested-frequency-gt0/           [Kernel PMU event]
> + *   xe_0000_00_02.0/requested-frequency-gt1/           [Kernel PMU event]
> + *
> + * $ perf stat -e xe_0000_00_02.0/requested-frequency-gt0/ -I1000
> + * #           time             counts unit events
> + *      1.001189056               1950 M    xe_0000_00_02.0/requested-frequency-gt0/
> + *      2.006388494               1960 M    xe_0000_00_02.0/requested-frequency-gt0/
> + *      3.007930311               1959 M    xe_0000_00_02.0/requested-frequency-gt0/
> + *
> + * Dumping requested freq from sysfs-
> + * $  while true; do cat /sys/class/drm/card0/device/tile0/gt0/freq0/cur_freq ; sleep 1; done
> + *    1950
> + *    1950
> + *    1950

Thank you so much for adding this!

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>   */
>  
>  static struct xe_pmu *event_to_pmu(struct perf_event *event)
> @@ -88,6 +113,12 @@ static unsigned int other_bit(const u64 config)
>  	case XE_PMU_RC6_RESIDENCY:
>  		val = __XE_PMU_RC6_RESIDENCY_ENABLED;
>  		break;
> +	case XE_PMU_ACTUAL_FREQUENCY:
> +		val =  __XE_PMU_ACTUAL_FREQUENCY_ENABLED;
> +		break;
> +	case XE_PMU_REQUESTED_FREQUENCY:
> +		val = __XE_PMU_REQUESTED_FREQUENCY_ENABLED;
> +		break;
>  	default:
>  		/*
>  		 * Events that do not require sampling, or tracking state
> @@ -104,6 +135,22 @@ static unsigned int config_bit(const u64 config)
>  	return other_bit(config);
>  }
>  
> +static u32 config_mask(const u64 config)
> +{
> +	unsigned int bit = config_bit(config);
> +
> +	if (__builtin_constant_p(config))
> +		BUILD_BUG_ON(bit >
> +			     BITS_PER_TYPE(typeof_member(struct xe_pmu,
> +					   enable)) - 1);
> +	else
> +		WARN_ON_ONCE(bit >
> +			     BITS_PER_TYPE(typeof_member(struct xe_pmu,
> +							 enable)) - 1);
> +
> +	return BIT(config_bit(config));
> +}
> +
>  static unsigned int event_bit(struct perf_event *event)
>  {
>  	return config_bit(event->attr.config);
> @@ -132,6 +179,10 @@ config_status(struct xe_device *xe, u64 config)
>  		if (xe->info.skip_guc_pc)
>  			return -ENODEV;
>  		break;
> +	case XE_PMU_ACTUAL_FREQUENCY:
> +		fallthrough;
> +	case XE_PMU_REQUESTED_FREQUENCY:
> +		break;
>  	default:
>  		return -ENOENT;
>  	}
> @@ -194,6 +245,12 @@ store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
>  	pmu->event_sample[gt_id][sample].cur = val;
>  }
>  
> +static void
> +add_sample_mult(struct xe_pmu *pmu, unsigned int gt_id, int sample, u32 val, u32 mul)
> +{
> +	pmu->event_sample[gt_id][sample].cur += mul_u32_u32(val, mul);
> +}
> +
>  static u64 get_rc6(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -239,6 +296,7 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>  {
>  	struct xe_device *xe =
>  		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
>  	const unsigned int gt_id = config_gt_id(event->attr.config);
>  	const u64 config = event->attr.config;
>  	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> @@ -248,6 +306,18 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>  	case XE_PMU_RC6_RESIDENCY:
>  		val = get_rc6(gt);
>  		break;
> +	case XE_PMU_ACTUAL_FREQUENCY:
> +		val =
> +		   div_u64(read_sample(pmu, gt_id,
> +				       __XE_SAMPLE_FREQ_ACT),
> +			   USEC_PER_SEC /* to MHz */);
> +		break;
> +	case XE_PMU_REQUESTED_FREQUENCY:
> +		val =
> +		   div_u64(read_sample(pmu, gt_id,
> +				       __XE_SAMPLE_FREQ_REQ),
> +			   USEC_PER_SEC /* to MHz */);
> +		break;
>  	default:
>  		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>  	}
> @@ -277,6 +347,144 @@ static void xe_pmu_event_read(struct perf_event *event)
>  	local64_add(new - prev, &event->count);
>  }
>  
> +static u32 frequency_enabled_mask(void)
> +{
> +	unsigned int i;
> +	u32 mask = 0;
> +
> +	for (i = 0; i < XE_PMU_MAX_GT; i++)
> +		mask |= config_mask(__XE_PMU_ACTUAL_FREQUENCY(i)) |
> +		config_mask(__XE_PMU_REQUESTED_FREQUENCY(i));
> +
> +	return mask;
> +}
> +
> +static bool
> +frequency_sampling_enabled(struct xe_pmu *pmu, unsigned int gt)
> +{
> +	return pmu->enable &
> +	       (config_mask(__XE_PMU_ACTUAL_FREQUENCY(gt)) |
> +		config_mask(__XE_PMU_REQUESTED_FREQUENCY(gt)));
> +}
> +
> +static void
> +frequency_sample(struct xe_gt *gt, unsigned int period_ns)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	const unsigned int gt_id = gt->info.id;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	bool device_awake;
> +	int ret;
> +	u32 cur_freq;
> +
> +	if (!frequency_sampling_enabled(pmu, gt_id))
> +		return;
> +
> +	/* Report 0/0 (actual/requested) frequency while GT is suspended. */
> +	device_awake = xe_pm_runtime_get_if_active(xe);
> +	if (!device_awake)
> +		return;
> +
> +	if (pmu->enable & config_mask(__XE_PMU_ACTUAL_FREQUENCY(gt_id))) {
> +		u32 val;
> +
> +		/*
> +		 * We take a quick peek here without using forcewake
> +		 * so that we don't perturb the system under observation
> +		 * (forcewake => !rc6 => increased power use). We expect
> +		 * that if the read fails because it is outside of the
> +		 * mmio power well, then it will return 0 -- in which
> +		 * case we assume the system is running at the intended
> +		 * frequency. Fortunately, the read should rarely fail!
> +		 */
> +		val = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
> +
> +		add_sample_mult(pmu, gt_id, __XE_SAMPLE_FREQ_ACT,
> +				val, period_ns / 1000);
> +	}
> +
> +	if (pmu->enable & config_mask(__XE_PMU_REQUESTED_FREQUENCY(gt_id))) {
> +		ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
> +		if (!ret)
> +			add_sample_mult(pmu, gt_id, __XE_SAMPLE_FREQ_REQ,
> +					cur_freq,
> +					period_ns / 1000);
> +	}
> +
> +	xe_pm_runtime_put(xe);
> +}
> +
> +static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
> +{
> +	struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	u64 period = max_t(u64, 10000, NSEC_PER_SEC / FREQUENCY);
> +	unsigned int period_ns;
> +	struct xe_gt *gt;
> +	unsigned int i;
> +	ktime_t now;
> +
> +	if (!READ_ONCE(pmu->timer_enabled))
> +		return HRTIMER_NORESTART;
> +
> +	now = ktime_get();
> +	period_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
> +	pmu->timer_last = now;
> +
> +	/*
> +	 * Strictly speaking the passed in period may not be 100% accurate for
> +	 * all internal calculation, since some amount of time can be spent on
> +	 * grabbing the forcewake. However the potential error from timer call-
> +	 * back delay greatly dominates this so we keep it simple.
> +	 */
> +
> +	for_each_gt(gt, xe, i) {
> +		if (!(pmu->active_gts & BIT(i)))
> +			continue;
> +		frequency_sample(gt, period_ns);
> +	}
> +
> +	hrtimer_forward(hrtimer, now, ns_to_ktime(period));
> +
> +	return HRTIMER_RESTART;
> +}
> +
> +static bool pmu_needs_timer(struct xe_pmu *pmu)
> +{
> +	u32 enable;
> +
> +	/*
> +	 * Only some counters need the sampling timer.
> +	 *
> +	 * We start with a bitmask of all currently enabled events.
> +	 */
> +	enable = pmu->enable;
> +
> +	/*
> +	 * Mask out all the ones which do not need the timer, or in
> +	 * other words keep all the ones that could need the timer.
> +	 */
> +	enable &= frequency_enabled_mask();
> +
> +	/*
> +	 * If some bits remain it means we need the sampling timer running.
> +	 */
> +	return enable;
> +}
> +
> +static void __xe_pmu_maybe_start_timer(struct xe_pmu *pmu)
> +{
> +	u64 period = max_t(u64, 10000, NSEC_PER_SEC / FREQUENCY);
> +
> +	if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
> +		pmu->timer_enabled = true;
> +		pmu->timer_last = ktime_get();
> +		hrtimer_start_range_ns(&pmu->timer,
> +				       ns_to_ktime(period), 0,
> +				       HRTIMER_MODE_REL_PINNED);
> +	}
> +}
> +
>  static void xe_pmu_enable(struct perf_event *event)
>  {
>  	struct xe_pmu *pmu = event_to_pmu(event);
> @@ -299,6 +507,11 @@ static void xe_pmu_enable(struct perf_event *event)
>  	pmu->enable |= BIT(bit);
>  	pmu->enable_count[bit]++;
>  
> +	/*
> +	 * Start the sampling timer if needed and not already enabled.
> +	 */
> +	__xe_pmu_maybe_start_timer(pmu);
> +
>  	spin_unlock_irqrestore(&pmu->lock, flags);
>  update:
>  	/*
> @@ -328,8 +541,10 @@ static void xe_pmu_disable(struct perf_event *event)
>  	 * Decrement the reference count and clear the enabled
>  	 * bitmask when the last listener on an event goes away.
>  	 */
> -	if (--pmu->enable_count[bit] == 0)
> +	if (--pmu->enable_count[bit] == 0) {
>  		pmu->enable &= ~BIT(bit);
> +		pmu->timer_enabled &= pmu_needs_timer(pmu);
> +	}
>  
>  	spin_unlock_irqrestore(&pmu->lock, flags);
>  }
> @@ -463,6 +678,8 @@ create_event_attributes(struct xe_pmu *pmu)
>  		const char *unit;
>  	} events[] = {
>  		__event(0, "rc6-residency", "ms"),
> +		__event(1, "actual-frequency", "M"),
> +		__event(2, "requested-frequency", "M"),
>  	};
>  
>  	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> @@ -675,6 +892,30 @@ void xe_pmu_suspend(struct xe_gt *gt)
>  	spin_unlock_irq(&pmu->lock);
>  }
>  
> +/**
> + * xe_pmu_resume() - Restart the timer if needed
> + */
> +void xe_pmu_resume(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->base.event_init)
> +		return;
> +
> +	spin_lock_irq(&pmu->lock);
> +
> +	/*
> +	 * Re-enable sampling timer when GPU goes active.
> +	 */
> +	if (pmu->active_gts == 0)
> +		__xe_pmu_maybe_start_timer(pmu);
> +
> +	pmu->active_gts |= BIT(gt->info.id);
> +
> +	spin_unlock_irq(&pmu->lock);
> +}
> +
>  /**
>   * xe_pmu_unregister() - Remove/cleanup PMU registration
>   */
> @@ -687,6 +928,8 @@ void xe_pmu_unregister(void *arg)
>  
>  	pmu->registered = false;
>  
> +	hrtimer_cancel(&pmu->timer);
> +
>  	xe_pmu_unregister_cpuhp_state(pmu);
>  
>  	perf_pmu_unregister(&pmu->base);
> @@ -729,6 +972,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
>  	int ret = -ENOMEM;
>  
>  	spin_lock_init(&pmu->lock);
> +	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> +	pmu->timer.function = xe_sample;
>  	pmu->cpuhp.cpu = -1;
>  
>  	pmu->name = kasprintf(GFP_KERNEL,
> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
> index 17f5a8d7d45c..fb6e3819d7bc 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.h
> +++ b/drivers/gpu/drm/xe/xe_pmu.h
> @@ -16,12 +16,14 @@ void xe_pmu_exit(void);
>  void xe_pmu_register(struct xe_pmu *pmu);
>  void xe_pmu_unregister(void *arg);
>  void xe_pmu_suspend(struct xe_gt *gt);
> +void xe_pmu_resume(struct xe_gt *gt);
>  #else
>  static inline int xe_pmu_init(void) { return 0; }
>  static inline void xe_pmu_exit(void) {}
>  static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>  static inline void xe_pmu_unregister(void *arg) {}
>  static inline void xe_pmu_suspend(struct xe_gt *gt) {}
> +static inline void xe_pmu_resume(struct xe_gt *gt) {}
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> index 59d7718c59ce..c44c3d79b970 100644
> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -12,6 +12,8 @@
>  enum {
>  	__XE_SAMPLE_RC6,
>  	__XE_SAMPLE_RC6_LAST_REPORTED,
> +	__XE_SAMPLE_FREQ_ACT,
> +	__XE_SAMPLE_FREQ_REQ,
>  	__XE_NUM_PMU_SAMPLERS
>  };
>  
> @@ -28,13 +30,19 @@ enum {
>  #define __XE_PMU_OTHER(x) ___XE_PMU_OTHER(0, x)
>  
>  #define XE_PMU_RC6_RESIDENCY                    __XE_PMU_OTHER(0)
> +#define XE_PMU_ACTUAL_FREQUENCY			__XE_PMU_OTHER(1)
> +#define XE_PMU_REQUESTED_FREQUENCY		__XE_PMU_OTHER(2)
>  #define __XE_PMU_RC6_RESIDENCY(gt)              ___XE_PMU_OTHER(gt, 0)
> +#define __XE_PMU_ACTUAL_FREQUENCY(gt)		___XE_PMU_OTHER(gt, 1)
> +#define __XE_PMU_REQUESTED_FREQUENCY(gt)	___XE_PMU_OTHER(gt, 2)
>  
>  /**
>   * Non-engine events that we need to track enabled-disabled transition and
>   * current state.
>   */
>  enum xe_pmu_tracked_events {
> +	__XE_PMU_ACTUAL_FREQUENCY_ENABLED,
> +	__XE_PMU_REQUESTED_FREQUENCY_ENABLED,
>  	__XE_PMU_RC6_RESIDENCY_ENABLED,
>  	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
>  };
> @@ -128,6 +136,24 @@ struct xe_pmu {
>  	 * @sleep_last: Last time GT parked for RC6 estimation.
>  	 */
>  	ktime_t sleep_last[XE_PMU_MAX_GT];
> +	/**
> +	 * @timer: Timer for internal Xe PMU sampling.
> +	 */
> +	struct hrtimer timer;
> +	/**
> +	 * @timer_last:
> +	 *
> +	 * Timestmap of the previous timer invocation.
> +	 */
> +	ktime_t timer_last;
> +	/**
> +	 * @timer_enabled: Should the internal sampling timer be running.
> +	 */
> +	bool timer_enabled;
> +	/**
> +	 * @active_gts: GT active mask.
> +	 */
> +	unsigned int active_gts;
>  };
>  
>  #endif
> -- 
> 2.38.1
> 
