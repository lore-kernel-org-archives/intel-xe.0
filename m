Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B793BC001DF
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 22:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459D010E0DD;
	Thu, 19 Oct 2023 22:56:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BE910E0DD
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 22:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697756193; x=1729292193;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=As5OIvUiD9lEy7McC3kJoytiGp68FfS2mXVoBd+UqCA=;
 b=OOxG3sSNMXyJ4wxkWwxf8lzB0f6jVXdvh6gGTOXXIq79aZTPQwSqv/HD
 AD2maP6+d6DSW+POFV/XXRq+JW9Z3mdZV8jXcThcgQarmMtz5kafUaXIR
 NUfWnyoo99Y6urVzxdrsvyQRZQhuEn4hPHMEZCzbZdJX69FBDlBGTS/gr
 wzadcf9oJce6mgLiqweg43gYupPAMNOI8AV1VwXpK3/lgo5imW0qDYNOl
 i05WjAEKl/Ij8oPiHzY2hKWtNxQbZgCwAmZ8PeRNWJxCRxEL2V6ERAr3K
 cb7Bno/hWnpwBPsIgbuiRCkijGiSqTWqTJytWLd1qOGM5LyfKwHCvnKUW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7947822"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="7947822"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 15:56:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="1004397991"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="1004397991"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 15:56:32 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 15:56:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 15:56:32 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 15:56:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4t9tx0d0qGYnNV5nJwJxB+AwFd1ECewp2ZaIjDkbCzg3y2/ThvDa6gEzYrCYA/x1Ti1OZYaT9IQi6GTEbkE+ATo1O3f3ENFlKCx/1GqPYrjLANgmB3OQLqqm6OwvZLtpDKfLgDDV75CKiPfRIrIdSxycrbU5Bf1UQG42z19/fTXwUOWKOhTTJiq3UImQmmhhWaFbmyTpc+hg/zU3MfO5XVWYhqi9IM+3LP2a+ILWUDieqzsLj6Cl98TUV9YO2vG5N9HPhNEKBDMjaUeBuurveyOhCa2OReSl68n/qt2dfKd2hI/UKD18FHrYIXqJvcgJZIrs1i9y8xSLb39osWPfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qdv8BOR4xNZ5dIzqlXQ4LUtF9o0MkiRRDF8PvV+OfY=;
 b=MnF764KjB8jhYwlhppTJ5nWoXwVUvOQN5bbdbeGYQzDNFW/S00NA/Bbe77K/gNk/UpNqLhKNdm7QvfLClfCJXBRb029YP3vK6j8ypu/QveZKwLR+RiUx609r65Xk8p4x48s4h0Im05jhjzMYbeEPn6zJxRVXOHqUvvCHi+AT/8Fjjc6MiC4fj+BvatTaYSBWrLN8cd5sliLJTRNWlcD5x8MfMMF2bdpY+unN0Ea7Mvb0i7hhUK+QXzT7d4he052pohSoKPsMPrGdhmW9XBk45bDGQypfvBvlgb3D9XHnzK+JZoITgw+KT7+HviOuOr+XEMqauCh3Ho0y/RPf4hQJrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB5911.namprd11.prod.outlook.com (2603:10b6:303:16b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 22:56:29 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 22:56:29 +0000
Date: Thu, 19 Oct 2023 15:56:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
Message-ID: <20231019225626.GD1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231016170102.1771526-1-ruthuvikas.ravikumar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231016170102.1771526-1-ruthuvikas.ravikumar@intel.com>
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ed604f-0350-4536-30f5-08dbd0f6a0fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 56O0q/igyG7PoXzDlxdc4N3gbAUIcmzVlRBd/qMaMwlKZUP6p4XbVZG+Zxk4u1O1I751UBrMH3E2kHjOf3PlVUdcJBjFgP64sjhlAU+KKPC9h8a1j49XxjxiW6tP3Bs+qehXSeg+o7n2JBtH31u8LQvhG8IhuYE237ExPaA311GXDHBF9+Jtqk0PA04aCS3nne7xZ/dnC1HxN+fG9S53tPmCe3Y/0dvidB1aflyu/BfPqThWQ3ezv0yDFSbrFDYeYtJTESMHGOOAnNS3X4Hz0q/CMB7Y3crrD+eo9jKCOTfx6DXYkimIJkJqcYjbIzTQaXYYVh7i6RDxJpLZa6SDhpH4VQPsWk/DW35zbZct7G4yMaGqt4G6Ro/NEMsf+4XT6GWB4xr14D42qb3JwOL9dWk8U/6SY1kK6O11m1+P9I2ukQ5gs/yBFkZKOE/YEl0j+1U0oG/vxFDES/gakCNM7LYJqg2CxiNNp7gzEi2JOPjNNjdr7tN9OzUBejbnFMXudkrY9hZrC0OkVuDY3vkZ9fTM1JHBX1ASOYDK0QRHQ+sERQvc9LFBs9BHLw1/5Hrb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(376002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(1076003)(107886003)(6506007)(66476007)(6512007)(6666004)(26005)(83380400001)(4326008)(5660300002)(8936002)(8676002)(6862004)(6486002)(41300700001)(478600001)(2906002)(6636002)(66946007)(66556008)(316002)(38100700002)(82960400001)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AN2XnA31QD46TJuERe9+ksVbbV5hHhpY1ZNbCdgLcEUkV+jy+yz3E8J+b+?=
 =?iso-8859-1?Q?UGbSNd9OSYCafND7D0CuZFAH5J9M2YAEahqDYjImgiC4pljZ+JZDz29Nom?=
 =?iso-8859-1?Q?rpwEvweCRX+yws3l6/6EKoZFdNL0nZ097ixcFaZ8zzy27E1zDhRC2JIZfn?=
 =?iso-8859-1?Q?ijl8VRV6DwgxOi7UseS/k5OVMY+abEfMXBxHW7yb+5ioAq41k88Of0DSyt?=
 =?iso-8859-1?Q?t9dHnHByy3HqZHBR8PX8L1Ql8LPpFU6MhPbdzQ7jSfFHhVpJgtDTcblrfy?=
 =?iso-8859-1?Q?gyiFU11b4bfHLAk0ASRIMkQ48/0BCMzEV60eXI0Hu1bNplx3BcUqh9U+HR?=
 =?iso-8859-1?Q?s6a/KNqxboAxx2YtZ/OEGb7ZVZVubBOMcKeHTjWUHa3z+ZVzQAwEUr+jOP?=
 =?iso-8859-1?Q?PyXoosefnTzgcEzSC805YRe5TgWYYC7fREXYWMS0AT7G3UhA9TAPS7GFes?=
 =?iso-8859-1?Q?7DAJ3Cleu27ErEJyi9xWraqcq9tECoYi80m9fF+TtkwWArav6yOn5iUoYm?=
 =?iso-8859-1?Q?WSC7HgA2o2invIqX6pPpZlNFREDeQuGWqNOF6MJVzsu0zG4U5i0UaLcL7j?=
 =?iso-8859-1?Q?gFzmUxlioMdWN3hrqsSWLgtqG6qABgLP9c6Qr2BGNK93e+uAf3cfy6DB5M?=
 =?iso-8859-1?Q?YDUc/JUAxCPkRvLeaTNhR2s8ZAnEIcio3HpSq7kGj7i48XU2OWFUoiyGEH?=
 =?iso-8859-1?Q?xYU3yzWrK3yzc3xehYfFe9fO5nwy/IfO9uib9vWdptxTETLCqtulXXycc5?=
 =?iso-8859-1?Q?PKtJ25G0NZ54pYvqwGay6Fs1t3Vibcl9Yynf4dLVK62+lqWAtGj7PWGzn2?=
 =?iso-8859-1?Q?xyFV4i+fK3+jqe+IUOw7bcKAGkSStOqZxBhpU91KZyq60c1Vj4lorGH/lG?=
 =?iso-8859-1?Q?MCziltdFZ7UnFqDaSebcSSfZBiSd5Xa3IXBiCOik4kpN2mc6JBhAU2wLEj?=
 =?iso-8859-1?Q?/nSRsIVO43f7YMxlOliBPUJxFEIGlRJPuRq9JiE937Jfp0Mm8fPR9Gof4Q?=
 =?iso-8859-1?Q?6CndOGlcYe4DQHxRoIzJ2YKJOxUHu8zkC+IpDRqIfO3lc/y0Aw/9nyWmHq?=
 =?iso-8859-1?Q?YPVzaOamYy8NeuKSUW7OjL4FlZlENMEHzqzwRJ0VjDTGK79kjvEibjE5z+?=
 =?iso-8859-1?Q?OsbBpuxZAOay31J87NUXneDKJXQ53OgmQdlDkZb74Cur2q3GhLWrrfOH1a?=
 =?iso-8859-1?Q?ICi20dPwBpA+BGoVHg3GLnQnT0kpqbGZDqtvl8FzTQDYrUlt3TZQmHXPTG?=
 =?iso-8859-1?Q?+rIlAfJp83LHr+aiX/bYzIyqeJhv+sv6P2mEVDO//CO0ResJwoXfjtP6nn?=
 =?iso-8859-1?Q?U8qv7b5d1zNbtn7aSfauIFCGcCgT6uvwLdVQrHULkcfH1c98okqtcF+iNw?=
 =?iso-8859-1?Q?sCuk2krpIO7D5VzNMDsJy24+JviLeFz4Q59z4q86fCYD6BpD8jwz2lnC0H?=
 =?iso-8859-1?Q?R/PBVFNIqWQea8JqJmphkNYZFoyxBPr2BtXy5zZ0gn7FGbxEVmEuiVKt1p?=
 =?iso-8859-1?Q?WjP7yMbSpgjaJfgwEptxwLsrlJVZCn0tHb8Pkfa9CD/RI+Cvi0eLL/Ezic?=
 =?iso-8859-1?Q?Vpw2wtpH7a8jRJQiTsY5RVFkJay3eecNtfpyFKeGc1PsxCALiiYM/W9eFv?=
 =?iso-8859-1?Q?RhoP+u1/e9d7YaZAV8VwtIUBoUrEdzw2hGmCNj+BZMgJoDdNVjz8MK4Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ed604f-0350-4536-30f5-08dbd0f6a0fd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 22:56:28.6132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFjTIUkyONUS7v0nqZHqYl4CipKBlH2QC0MQ+7L5hs7H/Wl9KzN13X5PjakNMUU27m5hxD08uxaiCbglhN6sfYHkaf2VFfaTPgr3vjRm5BM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5911
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add mocs kunit
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
Cc: janga.rahul.kumar@intel.com, intel-xe@lists.freedesktop.org,
 ramadevi.gandi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Oct 16, 2023 at 10:31:02PM +0530, Ruthuvikas Ravikumar wrote:
> This kunit verifies the hardware values of mocs and
> l3cc registers with the KMD programmed values.
> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mathew D Roper <matthew.d.roper@intel.com>
> Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/Makefile       |   1 +
>  drivers/gpu/drm/xe/tests/xe_mocs.c      | 143 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_mocs_test.c |  24 ++++
>  drivers/gpu/drm/xe/tests/xe_mocs_test.h |  13 +++
>  drivers/gpu/drm/xe/xe_mocs.c            |   4 +
>  5 files changed, 185 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_mocs.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.h
> 
> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
> index 51f1a7f017d4..39d8a0892274 100644
> --- a/drivers/gpu/drm/xe/tests/Makefile
> +++ b/drivers/gpu/drm/xe/tests/Makefile
> @@ -4,6 +4,7 @@ obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
>  	xe_bo_test.o \
>  	xe_dma_buf_test.o \
>  	xe_migrate_test.o \
> +	xe_mocs_test.o \
>  	xe_pci_test.o \
>  	xe_rtp_test.o \
>  	xe_wa_test.o
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> new file mode 100644
> index 000000000000..7edd9e2c2c71
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include <kunit/test.h>
> +#include <kunit/visibility.h>
> +
> +#include "tests/xe_mocs_test.h"
> +#include "tests/xe_pci_test.h"
> +#include "tests/xe_test.h"
> +
> +#include "xe_pci.h"
> +#include "xe_pm.h"
> +#include "xe_gt.h"
> +#include "xe_mocs.h"
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +
> +struct live_mocs {
> +	struct xe_mocs_info table;
> +	struct xe_mocs_info *mocs;
> +	struct xe_mocs_info *l3cc;
> +	struct xe_bo *scratch;
> +	void *vaddr;

What are scratch and vaddr for?  They don't appear to get used anywhere.

> +};
> +
> +static int live_mocs_init(struct live_mocs *arg, struct xe_gt *gt)
> +{
> +	unsigned int flags;
> +	struct kunit *test = xe_cur_kunit();
> +
> +	memset(arg, 0, sizeof(*arg));
> +
> +	flags = get_mocs_settings(gt_to_xe(gt), &arg->table);
> +
> +	kunit_info(test, "table size %d", arg->table.size);
> +	kunit_info(test, "table uc_index %d", arg->table.uc_index);
> +	kunit_info(test, "table n_entries %d", arg->table.n_entries);
> +
> +	if (flags & HAS_GLOBAL_MOCS)
> +		arg->mocs = &arg->table;
> +
> +	arg->l3cc = &arg->table;
> +
> +	return flags;
> +}
> +
> +static void read_l3cc_table(struct xe_gt *gt, const struct xe_mocs_info *info)
> +{
> +	unsigned int i;
> +	u32 l3cc;
> +	u32 reg;
> +	ssize_t ret;
> +
> +	struct kunit *test = xe_cur_kunit();
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (ret)
> +		goto out;
> +
> +	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);

Nit:  You might want to print "L3CC entries" here (and "Global MOCS
entries" in the other function) so it's more clear what's being dumped
by the debug statements.

> +	for (i = 0; i < (info->n_entries + 1) / 2 ?
> +		    (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
> +					 get_entry_l3cc(info, 2 * i + 1))),
> +	    1 : 0;
> +	     i++) {
> +		reg = xe_mmio_read32(gt, LNCFCMOCS(i));
> +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
> +			 LNCFCMOCS(i).addr, reg, l3cc);
> +
> +		if (reg != l3cc) {
> +			KUNIT_FAIL(test, "l3cc reg 0x%x has incorrect val:\n",
> +				   LNCFCMOCS(i).addr);
> +		}
> +	}
> +
> +out:

Should you be putting the forcewake here too?  Same for the cleanup in
the other function too.

> +	xe_device_mem_access_put(gt_to_xe(gt));
> +}

You're missing blank lines between a bunch of these functions.

> +static void read_mocs_table(struct xe_gt *gt, const struct xe_mocs_info *info,
> +			    u32 addr)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	unsigned int i;
> +	u32 mocs;
> +	u32 reg_val;
> +
> +	ssize_t ret;
> +
> +	struct kunit *test = xe_cur_kunit();
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (ret)
> +		goto out;
> +
> +	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
> +	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
> +		      "Unused entries index should have been defined\n");
> +	for (i = 0;
> +	     i < info->n_entries ? (mocs = get_entry_control(info, i)), 1 : 0;
> +	     i++) {
> +		struct xe_reg reg = XE_REG(addr + i * 4);
> +
> +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, reg.addr,
> +			 mocs);
> +		reg_val = xe_mmio_read32(gt, reg);
> +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, reg.addr,
> +			 reg_val);

Can you convert the debug output into a single line like you did with
the L3CC table?

> +		if (reg_val != mocs) {
> +			KUNIT_FAIL(test, "mocs reg 0x%x has incorrect val:\n",
> +				   reg.addr);
> +		}
> +	}
> +out:
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +}
> +static int mocs_kernel_test_run_device(struct xe_device *xe)
> +{
> +	/* Basic check the system is configured with the expected mocs table */
> +
> +	struct live_mocs mocs;
> +	struct xe_gt *gt;
> +
> +	unsigned int flags;
> +	int id;
> +
> +	for_each_gt(gt, xe, id) {
> +		flags = live_mocs_init(&mocs, gt);
> +		if (flags & HAS_GLOBAL_MOCS)
> +			read_mocs_table(gt, mocs.mocs, GLOBAL_MOCS(0).addr);
> +		read_l3cc_table(gt, mocs.l3cc);
> +	}

This looks like a good start, but we're going to want to re-check in
other situations where MOCS settings could get lost as well.  E.g.,
after an engine reset, after a suspend/resume cycle, etc.


Matt

> +	return 0;
> +}
> +void xe_live_mocs_kernel_kunit(struct kunit *test)
> +{
> +	xe_call_for_each_device(mocs_kernel_test_run_device);
> +}
> +EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_kernel_kunit);
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.c b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> new file mode 100644
> index 000000000000..ef56bd517b28
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include "xe_mocs_test.h"
> +
> +#include <kunit/test.h>
> +
> +static struct kunit_case xe_mocs_tests[] = {
> +	KUNIT_CASE(xe_live_mocs_kernel_kunit),
> +	{}
> +};
> +
> +static struct kunit_suite xe_mocs_test_suite = {
> +	.name = "xe_mocs",
> +	.test_cases = xe_mocs_tests,
> +};
> +
> +kunit_test_suite(xe_mocs_test_suite);
> +
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.h b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> new file mode 100644
> index 000000000000..7faa3575e6c3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_MOCS_TEST_H_
> +#define _XE_MOCS_TEST_H_
> +
> +struct kunit;
> +
> +void xe_live_mocs_kernel_kunit(struct kunit *test);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 19a8146ded9a..a73419ea0711 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -579,3 +579,7 @@ void xe_mocs_init(struct xe_gt *gt)
>  	if (table.table)
>  		init_l3cc_table(gt, &table);
>  }
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_mocs.c"
> +#endif
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
