Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E19C47DA7
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 22:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288C610E607;
	Tue, 16 Jan 2024 22:16:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFDC10E607
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 22:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705443380; x=1736979380;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bc1IMVXo8uzWhe0Gt+cpE8hJJwUaqWvN76nzJg4I/+M=;
 b=EJVjyFVOpLnb6WxVP1m7cK3mUn1bgG8VO9NXtcFSV4Turg6CtHx2Scgn
 88g2MDTTLF7t2qrFKmITwBMnArE3TsMPkJY0K3um6dWbmhAaR+Zdcysyo
 nE+FNEfPdIJIuMtU/5HEHstt+9/dZmnhNkpRH84Rks4l6ndXP9cEp3QN7
 f9eP8tCQSb2/lF3amxPWEwnDRL/Td0UtvqdyF1/f8m2YJkbCAL4LNZw5B
 334poSH6nZNV0QsBqUbdIZKy9ChUWBO6jUf6TKy7HKOt9+lmSXHC0dR/Q
 rLxGvRkJhRSvCGtrjwSHwTzihNo1IhCe9RkolSlKor/3bsvCADOZPZ3hr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="13503993"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="13503993"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 14:16:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="957328744"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="957328744"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 14:16:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 14:16:19 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 14:16:19 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 14:16:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIA8877W3KghTNyn5V942r4SHWJhf23Y8ty/ieappL0lcmzTEABAlnAx/qV2EUd7UfEeFJ703Sz/yZzRSCrXzbu8fJTazfFebCLHv9P5wUWn29fok7wha1QIjBIbuEqJ64EjvPNCTtVH+xUVnTOudJdbV81SJsDnxKCv/xLAc4iYer3TKhAuiez1l7X1/nHpnXqi3o5t4AxnhfKJNHbDcv0tzUz8u9Ux40W6na1D3d6ZdgFa0iis9N9SXrBtVSuk9c7U3elfEAgqwjk2fOULKN2I5EaoVe+X3wSBEEvrp9W5qRvIa3+hfaWWmLiPQwuqu07qW5u9LLcbuCPyj1QzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDVsToapj8WPRhoAXtVbBWTYPInjZ5MJYRw/o1ho06k=;
 b=bpH6g8gSAMYMuFJSyqo1JlcFg5WYHGb9WdKt3PMiFo75C/AIJlGrPpBovHp6hsQV045QjIIOCLuyugMK5Gzx96CZtTAfiCo1JGtwR+/U4yNM6wsJBp7XKnQFOqSI1seQFWOW3doBPBJjuS0vALjJFd8LQoDH0j6OdXBX93wEfh0UlZAhbq/nQxqWjPxgN8AOlM8FKNFZnpcudTasbg4eqA9Ccv+BMQBLvN91bHMpda+p9/b5HXeX6DpapXchmBm6lZSbUDEbe+HuqQPhDFD0tmwZ+QA8ljYFgXK024KKPAeAws1O4zUVWrDSEGFM3T+kJmEaOqs7VwbvrTDQvgg4IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5323.namprd11.prod.outlook.com (2603:10b6:408:118::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Tue, 16 Jan
 2024 22:16:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.020; Tue, 16 Jan 2024
 22:16:17 +0000
Date: Tue, 16 Jan 2024 16:16:14 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Add kernel-doc for CCS mode selection
Message-ID: <auc4ho5g4vycsihlmw3cnhai36lmlxzrmsjlxtcsjrpc3qmhqz@kcw6wpnccurl>
References: <20231216214120.7394-1-niranjana.vishwanathapura@intel.com>
 <20231216214120.7394-4-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231216214120.7394-4-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR13CA0171.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5323:EE_
X-MS-Office365-Filtering-Correlation-Id: e94b1dc1-b038-4882-d274-08dc16e0c250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oZA9x7VccolO07hfI8YK9YNrHsH/yBe1UIONqDN/m0xXilk3JR/G0LM4vBqkRg6SV5MPSY8gSG+b4mJL22+aHYU/UmVJl1c6x77bNOgV6U5GxfRTTsRa2sbaLBRl7D3QonFjpvSm71etXKTyI4HL8dPO6x3EDq4aL5IYixqOiz72wbEPToZdSM3onOSvaYe3MHQgvoba2ekOWk6XDWd5yQGwbZCUOLCwG0CeUFstlAuT0IduVIACwC61SReconiaT//tQduR/9Ux5Ktv7tcn3bO9VtXE1JARf2Qd6S3ULSaV6EzvymUkHBzM/o/kigTTPT/hf4+cIhFiVclAW5DE6o3udAmPSrrYIF16QF586c42xMgrYzIJNMB6OiBmQ08GutfVn4jfoXt9dIxYdOrixjg1UUVVNGd+GbdGi5JiN7i6V18PS5SlKyJz3gkG2Zr3cZbFN/zVTkw17tmvxrb3DJ6CDBKNz6ff9rR6RRR0DnWjWW9MvEL2xipPt34o6hnlb7lfVWqZAvfeoGQP5UH5dJngAlch6xXScnrQ1NDfX6DM05ayhrLeMavMGkH7O//Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(38100700002)(6666004)(6506007)(6512007)(26005)(478600001)(9686003)(41300700001)(86362001)(6862004)(82960400001)(2906002)(5660300002)(83380400001)(33716001)(6486002)(316002)(66476007)(4326008)(8936002)(66946007)(66556008)(8676002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HVCYOVJeHOiC88+zoA/AmrX3YK7l9pj9ZiN1uAu5D0bvXuFBOufT4wEIO+oY?=
 =?us-ascii?Q?Rn2/NIEMQRZftWw+hCGyYbxq4jjVXaIml2BBRsD9fDP4OPwRRpJPmIfzXDH/?=
 =?us-ascii?Q?0GL9ThcPhThz6PEuhdaQGtbnfI9hb5vEFRcn2KRrLo/GzU90ur3qv8290zrk?=
 =?us-ascii?Q?UGQ0UujrRiDAJbAjZTXsd8UpAMLjIT+3uLhm5FG+Cx8mNixD2o4fV8tigiau?=
 =?us-ascii?Q?cUa+CC1v+AxXzfKNmp/otRy2/+A4LK+cS6V7F79UENWDUF3jgheA2sfcaZCA?=
 =?us-ascii?Q?KdI6o2UfIvMZdc1MMwX4z8Z6kDMo7rrjFcBJpkZUgY05nIN1GFPeljix8Muq?=
 =?us-ascii?Q?1t47KppnjPxjYLgvLLV8QgHrIxml4n5YbrMYYjTA3/uiVmq9oQr20Axwqs/M?=
 =?us-ascii?Q?558YyNbKXTFOGCs7XBZkxQGO4UETN5EbtaI9Q5u5R11aF9xtD2tNi1HeDQkB?=
 =?us-ascii?Q?NuMGIg7lJVzYsF7gQy5ELnh6rflrpkx/RzRANWb+w/DEXFYRNhIiqZ3i9Bzy?=
 =?us-ascii?Q?ADL+p7MkaCbShHHd91tqwXrBAsUg67oU2WkcU2y3FDOX/kXiO9ROQ2vM5PIP?=
 =?us-ascii?Q?GB07rI0j/p+RLohdT94XA7A/TktaXkVACqLK1aVbN5JQOiQxk0wwEpaMn45J?=
 =?us-ascii?Q?SLOH0Jwqf4Oire3k4DQ3tFkjwqzjUzheKs05WC20Ly9NNzVni+ds3HxF7kAC?=
 =?us-ascii?Q?iXLjm0Finp87lyxK/Xo83wycrj5WWx69wcuDgbqErMDiYmoyLMWglwdd6j4s?=
 =?us-ascii?Q?NPUD+WRrL4n49A3mVw7M9WW55L4V7xsdKyxS43+6b6cmB9P9G8wXrdXTsB7s?=
 =?us-ascii?Q?lPnG/t+c9YsesK4vQ3RTRP1s/1fKjUmAoOkHAnZKzk3zaPe0DZDjYEX51g0t?=
 =?us-ascii?Q?KQ/80feLWeXrMRcH0KxJM8h3NKg0/blr6JxG0EvZqJ72XqF0u74PCvXzLLCt?=
 =?us-ascii?Q?DdunhhdmgbGEuRgECCdac720zB6WjGXF4FLr33ALBrJAAgA0z2FktYbFS8F6?=
 =?us-ascii?Q?HsEs1WhPcxEYx4j2o6QnO+xDOPSOFGgTarHYAUqg8xNbKKucUfu4C9iM5euP?=
 =?us-ascii?Q?qMlTNjP71/R5rdt8LI2R+EJnLc614GTmJ8YtTu6A9MwABEtcPk7VxjtkRZka?=
 =?us-ascii?Q?YjSqkj33MnXSiBMElEFzHLSSDq57vTGGDSqCpvWU0Jn3ARa/yXwoZXgQH5tB?=
 =?us-ascii?Q?t1Cq9IQ18wkyVdZMTduRzQ98mgzd1NfjcMluiy4SqTuiP+IqgDWMsOSWCdJ2?=
 =?us-ascii?Q?FE27FmSNhsHic2NztAOfAzC3sjEyThPKwKe27P1KtqImq1lH0mHkoJX49+fF?=
 =?us-ascii?Q?Y27A8MtbFagXSvH/yv0xJ577hR1S+JUUA4I9tfQfzn90pZ1bXVPI7P3T8XEH?=
 =?us-ascii?Q?CVgHm3jcW8zTCu1bxbWQ1nhT0EPOwGa+dlPFAvbDF3sz7cPBoYIhnimz+lVR?=
 =?us-ascii?Q?MlCwCIOfo9PuRZyRPZ3THWFZ8pFFiPXWEui5E9iwERSr+KerJDSAyYkeq4mw?=
 =?us-ascii?Q?BF1DqACKwbJs69owjFCHqhKNgMb0jGOLon7bwJsFqrjEX72AlUlv5YzyzuxO?=
 =?us-ascii?Q?v8bVeP582EBLHtbgHdcKm+7cXujpkHLkP+rkbHq+gQRF7BJXttVHwDfF245t?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e94b1dc1-b038-4882-d274-08dc16e0c250
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 22:16:17.0287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/Ey0rU+ASwCG+69/IQUrZK2+0FKkUM4mnd/fvCf4TIKxNxWEI9cAwoPUsRcG+Uv6kr2Usuf4WIm5qbwr9XmH+gtNdFs1GtpzRdSr8q6tGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5323
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Dec 16, 2023 at 01:41:18PM -0800, Niranjana Vishwanathapura wrote:
>Move all CCS mode documentation including that of sysfs
>interfaces to a single kernel-doc section.
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>---
> Documentation/gpu/xe/index.rst       |  1 +
> Documentation/gpu/xe/xe_ccs_mode.rst | 14 ++++++++++++++
> drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 28 ++++++++++++++++++++++------
> drivers/gpu/drm/xe/xe_gt_types.h     |  7 +------
> 4 files changed, 38 insertions(+), 12 deletions(-)
> create mode 100644 Documentation/gpu/xe/xe_ccs_mode.rst
>
>diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
>index c224ecaee81e1..1db8d20942b4e 100644
>--- a/Documentation/gpu/xe/index.rst
>+++ b/Documentation/gpu/xe/index.rst
>@@ -14,6 +14,7 @@ DG2, etc is provided to prototype the driver.
>    xe_mm
>    xe_map
>    xe_migrate
>+   xe_ccs_mode
>    xe_cs
>    xe_pm
>    xe_pcode
>diff --git a/Documentation/gpu/xe/xe_ccs_mode.rst b/Documentation/gpu/xe/xe_ccs_mode.rst
>new file mode 100644
>index 0000000000000..9ff07706f9739
>--- /dev/null
>+++ b/Documentation/gpu/xe/xe_ccs_mode.rst
>@@ -0,0 +1,14 @@
>+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>+
>+=========
>+CCS mode
>+=========
>+
>+.. kernel-doc:: drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>+   :doc: CCS mode
>+
>+Internal API
>+============
>+
>+.. kernel-doc:: drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>+   :internal:
>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>index 173b119a21c00..d338b0859728a 100644
>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>@@ -12,6 +12,27 @@
> #include "xe_gt_sysfs.h"
> #include "xe_mmio.h"
>
>+/**
>+ * DOC: CCS mode
>+ *
>+ * CCS mode setting allows fixed mapping of available compute slices to
>+ * compute engines. By default only the first available compute engine is
>+ * enabled and all available compute slices are allocated to it.
>+ *
>+ * Below per-tile sysfs interfaces help user to change the CCS mode setting.
>+ *
>+ * 'num_cslices' - This read-only interface returns the number of compute
>+ * slices available.
>+ *
>+ * 'ccs_mode' - Allows user to set the number of compute hardware engines
>+ * to be enabled and to which allocate the available compute slices. This
>+ * user configuration change triggers a gt reset and it is expected that
>+ * there are no open drm clients while doing so. The user configuration
>+ * must allow equal distribution of available compute slices to enabled

must allow? Shouldn't this be something like
"Compute slices is always equally distributed to the compute engines".
Then mention what happens when this is not possible:

         /*
          * Ensure number of engines specified is valid and there is an
          * exact multiple of engines for slices.
          */
         num_cslices = hweight32(CCS_MASK(gt));
         if (!num_engines || num_engines > num_cslices || num_cslices % num_engines) {
                 xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
                           num_engines, num_cslices);
                 return -EINVAL;
         }


So... what the user needs to know to arrive into a valid solution is
that he must read num_cslices to be able to know what are the possible
configurations.


Lucas De Marchi

>+ * compute hardware engines. Reading it returns the number of compute
>+ * hardware engines currently enabled.
>+ */
>+
> #define CCS_MODE_CSLICE_WIDTH		ilog2(CCS_MODE_CSLICE_ASSIGNMENT + 1)
> #define CCS_MODE_CSLICE(cslice, ccs)	\
> 	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>@@ -174,12 +195,7 @@ static void xe_gt_ccs_mode_sysfs_fini(struct drm_device *drm, void *arg)
>  * xe_gt_ccs_mode_sysfs_init - Initialize CCS mode sysfs interfaces
>  * @gt: GT structure
>  *
>- * Through a per-gt 'ccs_mode' sysfs interface, the user can enable a fixed
>- * number of compute hardware engines to which the available compute slices
>- * are to be allocated. This user configuration change triggers a gt reset
>- * and it is expected that there are no open drm clients while doing so.
>- * The number of available compute slices is exposed to user through a per-gt
>- * 'num_cslices' sysfs interface.
>+ * Create per-tile CCS mode sysfs interfaces.
>  */
> void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
> {
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index f746846604759..9cee17506f8bc 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -185,12 +185,7 @@ struct xe_gt {
> 		spinlock_t lock;
> 	} tlb_invalidation;
>
>-	/**
>-	 * @ccs_mode: Number of compute engines enabled.
>-	 * Allows fixed mapping of available compute slices to compute engines.
>-	 * By default only the first available compute engine is enabled and all
>-	 * available compute slices are allocated to it.
>-	 */
>+	/** @ccs_mode: Number of compute engines enabled */
> 	u32 ccs_mode;
>
> 	/** @usm: unified shared memory state */
>-- 
>2.43.0
>
