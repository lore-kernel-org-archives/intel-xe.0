Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAA1CDB474
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 18:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE5710E5D9;
	Fri, 20 Oct 2023 18:09:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9E210E5D9
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 18:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697825389; x=1729361389;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tteMo48UT1Vvz+0g9KrgHhBBq4ACmhphBSj9eaib+nA=;
 b=EvaaU77HF+fhoHQ1mACY/h9Wxjn9BFeaJYJW995/fnXXG2OExbWqdSkT
 HoKNAIOXPXq5zb4ZiDmr8SyIkYLY1fz272IphzRQBIvFFx/Toil/4hAjQ
 oskrAb657CHJSUHFrhgCzyFX5CiLE5gw5WzMTVEals32oDlPiZbmfXQwY
 HH3+kBT+xkZJU634UeqraAnCPY7Z56wdZa8mBoe+JETLe2J6lubnWdZLD
 Tnl9Ro2GM15FynR9EDrJpg3QWCVWkGSp0glv2GkSupNNYFzmRrfGq5MNw
 OVFU5vnsbXnaS8Eqgg2uhYkKaVdoVhMd19ENibmhzA4/zGbwyW5jQvxUF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="472769310"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="472769310"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 11:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="827805513"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="827805513"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 11:09:46 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 11:09:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 11:09:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 11:09:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVs7Wqtfe1/AKPmL7Uiw2taD1kgPPZdDmyl44ulfsgl9XUM+xLPZ/Vkkj++SaEhfF4VaDw6iiE4hzttar5phtouk3B++7LiwlWYOGbiCdtXUivGxVNWKl3S19VuIN04yRpH9O/3XzKp71m3BEybNnBrzhH8Tcam/V6TB3k+ze1VaA5mzpP8tMpFJJL7ikep2MxN0I7vMuD/REIg3GD99Fgi6yJ5cKD33HuLFrjCCEQk0Zy0KsTIGD5m8UW6lSLN3OmvVjdwc64asGyv1KTeMldf/+/U/I/DRKPFKtOWWVt3wuSIo92ZAj6JHqlU+Jem83I46mbeB1z5eNkRrM9bGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYy/Ct0bT4W5l2zfMtNQusDrsHw5oRJsHOGnwZPncwE=;
 b=kUJpCJkfwpG7+u0P2m1jWOSJyjSsFXJp5dbhhat1apXpzH78UA3U9aQb3iFQkvIwaLbNpSIFEyn6uufcV8Zk/cL36vIlVIkHdayp07YtrBkU653QGlMm63uolIx7DB1sZg3EsHijrMxVH9M69P59AiFsHra0VPPSjJDQd4jMdm8+qnMdHrjyhsh8Ya3hfhcV0rtO+E8/rLzvLEL3Jb/ryzadPbjW6c3NY7171chVIUSsGuh3Sg1Nb2EnKdJHtEbBXKq9N8ODU3+nbpkLx+kfaL5aPasKFop2KG+NchBZioI1Jr1YEMUvOSLitM4eFOgmWq+ZLcbl3naJ+8PlOo/Kcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ2PR11MB7456.namprd11.prod.outlook.com (2603:10b6:a03:4cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 18:09:43 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 18:09:43 +0000
Date: Fri, 20 Oct 2023 11:09:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
Message-ID: <20231020180940.GE1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231020170758.1783024-1-ruthuvikas.ravikumar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231020170758.1783024-1-ruthuvikas.ravikumar@intel.com>
X-ClientProxiedBy: SJ0PR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:332::6) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ2PR11MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: cbdcd4b5-39db-468e-1317-08dbd197bbe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gWxSmkS1c+pNaGk/6MPzRoEdnfxs75jTZmvef30uEZc790p4r8oPBo63FUfDX8ipB8TaFtwCAuH0S37Rez74yGvuuLDBsAll0xW8VFpSMJa7xXUu8euozTIM7QsortLWGPnuw1AUtrtslT6d1ciBcOVvvMcGaLbxLCKOSG+pYgLYMV0zOk4MDfnfkohfTwoE272lYKk26yc8OWcLs2PsAQ2g4ZskpYkAFnEk087+UQ+grp9xdfVYOLmCQWwO/xTj2w+DUzs/Yc7YcY4OK2IgTpu3zUDeeOGIOpvvx59DdvDoQbEiWReappJTC5OFgpxjgPK66iXkpI+eMw7PfqxzrfEEmSsD/UWwzvGZgmvsDpPEGdsox9DASKNIIDYrfRgOjqVvw4yJkmg7gMTqjLQbTY+/GYRKDEx7w/q5kK333lTmjmAR2FSowCACjiP1cp5XGRQShg2iV8pK/mWIbx5Z5KikgvCDRJ+jQqJsLckR000VSCt0dhlaWYcn5weQ3DPCwHWmuFIWxeyOKDD/hMUDzp1U7Wb+Mlq0bS6Pcso3GdiELeAkLlI5dqZRH39XH2EU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(366004)(376002)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(66476007)(1076003)(107886003)(26005)(6862004)(6636002)(82960400001)(4326008)(8676002)(8936002)(316002)(66556008)(66946007)(478600001)(6486002)(83380400001)(6512007)(33656002)(41300700001)(38100700002)(86362001)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?naK5PV2dTeVGueKMb/flgYINbUWI8tC7AmhYZdgYCBdU77EnnwsrWRKXKQ?=
 =?iso-8859-1?Q?fhZKPe13Gf8ilaxT+/HhtXcxjaC5wdTmsbt2RHjeAaufkGWLtYw9fyL5ou?=
 =?iso-8859-1?Q?TZM3ba339hRuv9/OzZ0LEf4vsrhDnDsbB2cx2C9SqKbDwNPnVAXCt271iV?=
 =?iso-8859-1?Q?taPyRjWyWQPp3HDrY52WW2Rim30flT5Mf2sjzQ939ja/hhte9yQl226/g/?=
 =?iso-8859-1?Q?EsuWRPYg3j2mCDQdWvHBLxvs1wAH2gbeeZ3attaio1TIHV2w/CXUwT/hy4?=
 =?iso-8859-1?Q?63B1jC30T0itN+28FNFLn3gi2K4luOuK5LPGmcGK+ILkbRpDUrgfLWn5Sn?=
 =?iso-8859-1?Q?VHoBhSZ6eLfs7EW0sKEt9tJkSLdBKnc2Nltdq6aPEBk3AcAcqTZ7viHwsw?=
 =?iso-8859-1?Q?0SvbCC1zxIP67Zy1mFwsPj5/1FACKk6lZlLnfa/bDVuABlCjs4UyK2YMAA?=
 =?iso-8859-1?Q?/zbEVgEl4TnFBssndMJr74a08apIyhVhbV0YIW8Ey5m1hyFyYRzBPRGtl8?=
 =?iso-8859-1?Q?kZhQshAP0VwNVLWT/jNQ0C408LNSdEcIw9+RDHXDf2o5jlYD8Q/21E1RsU?=
 =?iso-8859-1?Q?9/UK5kZvPJAWKLYfzSCQa/lgFdKRLXfCiZfbIWRHKABZjc6VSyF4rqTi4j?=
 =?iso-8859-1?Q?2gi1h0n0W90vdgflNJqp0pmly8P6N9wjaZ9i8hgZrUJJpD5XdQJnhZ7BCg?=
 =?iso-8859-1?Q?HRoxOhvtNmGnHJCB/tomoEJ3a6PZE/KriBoLtNILeicmHQ/kubRWKxlYCn?=
 =?iso-8859-1?Q?OhMBS/WJdeutVVVo0S0cUkwPbCC2uhAr6+X42bUGODzZqKYjnVU36eBAZv?=
 =?iso-8859-1?Q?q9LORqmtP2wBAaf5szV6pwvE8bI3Y7n3hAaLJMkrpMDMl/Wtvyy9X8ix+z?=
 =?iso-8859-1?Q?Syc03O2ci/p90nJfXaKT6AHlMO+J9x66WIKqv2BzAnVWSX3sr+7XN+1qZ4?=
 =?iso-8859-1?Q?WYHDo8Jz01B1QlvamE8f3yHPDA6cciPNdam9lvR0EO1EdVaDM0df1JA77y?=
 =?iso-8859-1?Q?DIEODjbmXUi6YWcOYXNl8cD3Q+iCk860CiQMWqM1fMRWanwvhUVAgJi/5q?=
 =?iso-8859-1?Q?X/ZeJVJnqz6QiNDX55JekBvA6JEtgVx59su1zvwDlgfsDuffW6eLvrSoCd?=
 =?iso-8859-1?Q?4V0z6uxxWuPHzo+7CCmfK7dn9Wf6bPGIppqzJazGNUprvIz9wqZN9wPWbJ?=
 =?iso-8859-1?Q?W5fGOg5YppuFztJZZno0ourZr6hB+KarwqAiiqtqvyIrBg7yFY0ghnIalJ?=
 =?iso-8859-1?Q?GwbqiDIIUdSZIMWpdpYpzqPMVsN8Bsds3MOal9uoQCiB0FskFjaU7sjDuT?=
 =?iso-8859-1?Q?9xf0PeMd47cb7FoS0liXf+4elzgnqUX3/Z4IVBZ/v+O1GDg/NoNlktysVN?=
 =?iso-8859-1?Q?3fiQJ1jcr/udy8AZC4gLcdx2CBVAgSTFA4KZxiiMEBAYf83hOimCrgbUqJ?=
 =?iso-8859-1?Q?xk7kXTw9zy/JGess9ztGqsQaEqEDlsysWkbgiq0657NAUOPFSMebEH5Y94?=
 =?iso-8859-1?Q?wx2XiB9ymTK+6Ya94ylg1Tq20om3MxecVP39md/Wia41bnwlygYTMMpsXo?=
 =?iso-8859-1?Q?J0Dq1MXeG3QGpSSshHU9Ifr3v0k7U+q1HQGXK+kvY+fB5lLXGQSuIBVjnI?=
 =?iso-8859-1?Q?CqKw09SWlFHHp2gE7DwAn7lG1VwobGyDyeQa/hUbTc0QR2juh2RSKXYA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbdcd4b5-39db-468e-1317-08dbd197bbe5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 18:09:42.7528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Paj/cAIlU8NGfGlu+cF6Am5DKKizmkrlsYrXOU7ewmjaT7AYNw9pKp7J9KqjONDoCE9yfKNHcb/ky+7kBjdLn0UhO5785yzFaUoPhydBDDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7456
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

On Fri, Oct 20, 2023 at 10:37:58PM +0530, Ruthuvikas Ravikumar wrote:
> This kunit verifies the hardware values of mocs and
> l3cc registers with the KMD programmed values.
> 

In the future it's helpful to reviewers if you provide a list of updates
since the previous version.  E.g.,

   v2:
     - Changed foo to bar
     - Dropped unnecessary abc
     - Added def

> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mathew D Roper <matthew.d.roper@intel.com>
> Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/Makefile       |   1 +
>  drivers/gpu/drm/xe/tests/xe_mocs.c      | 142 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_mocs_test.c |  24 ++++
>  drivers/gpu/drm/xe/tests/xe_mocs_test.h |  13 +++
>  drivers/gpu/drm/xe/xe_mocs.c            |   4 +
>  5 files changed, 184 insertions(+)
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
> index 000000000000..c5d002526da7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -0,0 +1,142 @@
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

As noted in the previous revision, you never release this forcewake
when you're done.  Same with the mocs function farther down.

> +	if (ret)
> +		goto out;
> +
> +	mocs_dbg(&gt_to_xe(gt)->drm, "L3CC entries:%d\n", info->n_entries);
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

Minor nitpick:  since you're only guarding a single statement with the
'if' condition, the braces aren't necessary.

> +	}
> +
> +out:
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +}
> +
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
> +	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
> +	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
> +		      "Unused entries index should have been defined\n");
> +	for (i = 0;
> +	     i < info->n_entries ? (mocs = get_entry_control(info, i)), 1 : 0;
> +	     i++) {
> +		struct xe_reg reg = XE_REG(addr + i * 4);
> +
> +		reg_val = xe_mmio_read32(gt, reg);
> +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, reg.addr,
> +			 reg_val);

I think you want

	mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i, reg.addr,
		 reg_val, mocs);

so that the output will show both the current and expected values,
similar to how you did so earlier for l3cc.

> +		if (reg_val != mocs) {
> +			KUNIT_FAIL(test, "mocs reg 0x%x has incorrect val:\n",
> +				   reg.addr);
> +		}
> +	}
> +out:
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +}
> +
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
> +	return 0;
> +}
> +
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

Is there still a plan to add more tests for other cases where we want to
check MOCS?  E.g., after reset, after suspend/resume cycle, etc.?


Matt

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
