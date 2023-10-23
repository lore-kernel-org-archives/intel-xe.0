Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E973C25B46
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 20:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5BDE10E256;
	Mon, 23 Oct 2023 20:48:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1BA10E256
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 20:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698094087; x=1729630087;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LEFooTGwzbjRQzUlIws4gOlPWwhAlZnYLcQXqnSxzl4=;
 b=DRozl+SmSvwsz/21Jbc4AcRS475MoBV7qR9ZUh+IwQuXizn/Qy7iEUf1
 wf8qHpYMVkNP3BvmYDIb7yXtXTGCvnGZ3UD98PMBwGqKITD2lg1Pxr7ld
 hTTsOgozg+mI7wZbpcDFQklkE5x1G0XUVImovHp/TlajINkEIkmYxDG3i
 RAad1M46SDtzIyFl9hv7NvLRd6c7QICD1mMumMZbUTQiog8i97HMfFvyK
 PmWb0WWyybfWwDpDhxrpiDpxhG30iMcASYra/Id/2pp3BPO/Z5qy36gBP
 zWc7szG+uPMb91ndJFlmA7B8lexgTTf32hJwcsvAnjlv4GOHmr6UbST8j w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="386736728"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="386736728"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 13:47:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="1089619124"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="1089619124"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2023 13:47:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 23 Oct 2023 13:47:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 23 Oct 2023 13:47:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 23 Oct 2023 13:47:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9GOQl3CcuiRGkGck+aFwYEfdwZsXfaXW0bLvvShzl8oOP8oPwjc3VChzuU+0DhZD6gGPOFpdUZM7MSjTl8mMoEoA9KsGgCmurBfM5MM7p5UP/Hxp1ggBER6dCpeaU9Dz6g4J7yFdtEUYJ2xA+fyUspQCgwKIl99iZJ2N6VrMF8FFrfqQ3b6U+gYU3vsh3+u8p9OFST0I8kmupcR4IsvB+IdBtcjUkKQSd/bLvDU7L5z+srgiM1zMXvanJmSJlwsLos4fX1m5QrUI3QB3GW6WcQRZajYJauVWToDxUK6crhAIt5VNMt1RZMWNrF2PaMA/qaVR4KOoN/8GyUHhlfbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veJzlemyvYXFotLM1RhWJgRkP4DmAKEOgy3Xfx5vgsk=;
 b=FUmtJFWPwBE6SBZMi/PZt1A4A1B+c1zI0VdxSD0McjZ9yDoXYt5Nzb7Cc6bsJ5ziDkyGWHYM+VC5OcFflILs1hsxxIhTfienVRuqe5vu23Y5YBYm/LgrTvSmw/+v7/taMOIapqBmEbcJiE6M48C3kURxz5R+AeL7r9Fm6kI3VdFs4jT5Dbg4boECfpcP5F5KYG2ZKhDzlCz/U7NssWUsUvFccLpnpecQLP6/s/gHn4qI+6bNOVUcLNL6Xrfc85ot9rgN6+uF1GPpWPp4WWlTswhifHivEahDUd1njafiamNruPe2wzDaSe/T6hY45aeUGztqDw6CzVj4/cU4EOnlhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 20:47:30 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62%4]) with mapi id 15.20.6907.028; Mon, 23 Oct 2023
 20:47:30 +0000
Date: Mon, 23 Oct 2023 13:47:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
Message-ID: <20231023204727.GG1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231023160314.1806539-1-ruthuvikas.ravikumar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231023160314.1806539-1-ruthuvikas.ravikumar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::34) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN2PR11MB4661:EE_
X-MS-Office365-Filtering-Correlation-Id: a52ae4ba-59ac-490f-45d9-08dbd4094615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 65syQ1QpsKMfdCa/ePqJvGRU7aWBiWZ78h0v+Dm3m+d6A8xGa6s7llbeFSkGytaxkmLat9LihfXHD3ee9JVjU+xdGYwg7V8HPiH3LMMwAgPiI6Z97+yE9euf+JU53hbb0+Ho2yDloe5Ss6vQUBSverLU5aDfhBrlq7qR6o/sZWFOqLJEJnNlxBfBckOsrIsDPOl0mcboHlMunTF1+XAoNbj/agYNCcN+GLqa9hOjWGbT03ISjFJHZkIdshd56PS/U2Eq63UGjC0fFNm6Ly3DIvMNnE0tvnZZmfZEXUOHgj3LvWwGM2DWdaQp6fMbUfhzT21trRy8CWoWd5zWqz/3mmtSbCBfRnV1XpmUENwaoVtkLW+4rumv5l5USEKQgahJ6+MxIyzF3E5ZnHanEFXmyV/aLFoj66TxUpUfG/wtp2ziMIKSubB8tigoVsBN7QFlr6hZNxsqnJlJLi4Pfh3cc9iGTvTgYV/OIar4IElAFwAnot+YVoYLv9err85TwB6+/Rh4QwFTaYHncpf7bkpiH0wkVl1bdfzSv+coCmUR59I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(376002)(366004)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(966005)(6486002)(8676002)(8936002)(6862004)(4326008)(41300700001)(478600001)(33656002)(86362001)(2906002)(316002)(66476007)(66556008)(6636002)(66946007)(5660300002)(6666004)(6512007)(6506007)(26005)(1076003)(82960400001)(83380400001)(38100700002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?T2RCetKjskQAae4aEOUdKrKyjC6r8hHBJYaYkOI7OpPvnb9DGTDw4YtXhE?=
 =?iso-8859-1?Q?8iKSn7MhYLQN83uNJb+ncseZVonvOGuiucXXECKRo7kxv7tKrFIKjajlue?=
 =?iso-8859-1?Q?uygTa7VxxCEmJFy05cTKMBm6ZC488rGAoClR6vd1Jc/aXlMYJ1n16lvZ42?=
 =?iso-8859-1?Q?qtZ8iMqXLJ2pPpArOeGbedoPiVhMq2rCiOwWaTSCEMpmAEjaqKaRYLzbU/?=
 =?iso-8859-1?Q?+0gCFoVzVzUEOkf7Vuz/5mob+1vwvXjgdyW++UX9doa4pdlo82k91jaSdl?=
 =?iso-8859-1?Q?U5lvtEtYPGE+mF2OcAKBxZfDslk5MkuXgc59B9Y13hcIhE3s/DdlvSRUt/?=
 =?iso-8859-1?Q?kVFCfXF1t3mF+9SdOsFqzDx5e3RpdQ2262YZGL/Ga/WnAl/tPte38iHuIL?=
 =?iso-8859-1?Q?SALLyVnOVpNPFNr+I7yHD03EQM2mpCQf31ysz120n/0adYlkOSte/331l9?=
 =?iso-8859-1?Q?Eh+gLfUWYwmHO6NNoA2UTB0ewuyWPeMoy/VbEGXaX7u8cmj1vI6tHQ+Hy2?=
 =?iso-8859-1?Q?TmzKrgeeP4Ai0vS5yu8GPsLVFzmB/eigvTMNUU7qRXRL985GpAfHQ/CTCA?=
 =?iso-8859-1?Q?xzUrhwiEOy5IGUAbzJGASKcW6/Z0rZK79gT2I4erWQ7f5zFkeqijzOVVqY?=
 =?iso-8859-1?Q?DISP76Fznfdy0scI6gin3lBTp51VH4hfzYINUsU5N8hrmefUouWTU6fMG8?=
 =?iso-8859-1?Q?5kuziRSoz2MjTz4ix0rmw+rJCPbnYg4wC3jBjrAXy+7b65KJrXgYmHtgDL?=
 =?iso-8859-1?Q?IQnVls9oC0blHccOpTj9Yklu05l1UkPra671ekIFhU0Oc5kgj8RHx0FM2+?=
 =?iso-8859-1?Q?+VgMbov9Yxa0NrABT2dm4ATkHsOcp6zlvU+7lkQiTQI+L1DOoPqFdjE9qy?=
 =?iso-8859-1?Q?Q95dl2iqo29jaHuOzdFx/PA8vev5c2b3oEyy0rQEqn0erz9ajKypOT95Ol?=
 =?iso-8859-1?Q?H/L5sRrYHR3nbQQqAFRR6dcgD8+2ebGK7fewiRfJRyagLWUytB9DsCFPVR?=
 =?iso-8859-1?Q?4F76QJVGNg5GwgkT2mJIr8E3RR7Hupb6LSXI1ZrvdAgoOv4WGo/tdCXwQS?=
 =?iso-8859-1?Q?pB4OGgtdAuwK4jj4FKRdLm+Wgw204rbfUlkHAP8SnLQ/QZk5h7vSOj32e+?=
 =?iso-8859-1?Q?hcFwXe7d2+jYDpArGGSm3AZ7E4cUeYWgvwEu2kTCYrn+AkZyOZLpdXBLhg?=
 =?iso-8859-1?Q?JDMsuh6yB43iDuyqgUsxO7RS6BMcsBOH2YM4vs32uup7x2xwmejU69zulX?=
 =?iso-8859-1?Q?XpOrwnkIpQRjuIqAktiuo7nb12kQZPd6ZRbH7mhaQGysOgvi9jZYVOmXg5?=
 =?iso-8859-1?Q?0/WLmuzL6cwsyAFKkXAHwLZipUiGgq/tzonzP17VosC46RS93P6y0HSgm+?=
 =?iso-8859-1?Q?QCqIz5PYXnOKazGmxn+Y+UxLJuXQ6bMT9+SXxqwG1S9jd5jBclZOOZAIgW?=
 =?iso-8859-1?Q?NeDEQMmfx8VRXh1N5qP1lNqh1Jh43srR2lzItBsW/D4V+joVrBfAH/+j8e?=
 =?iso-8859-1?Q?83+zDmuhw+kRdzelKXkY6K6S6fyzBPITa1JxFTahMO+gopP+K7jvAGFREC?=
 =?iso-8859-1?Q?XzpPxC/Hmn+yNdnSxi4UDMBslMrOu4qN0f0RN+IScCcsoFxA1DOeF05fhZ?=
 =?iso-8859-1?Q?tzUVVluegIHSy+I9i7RNFaMYFNenDELMVSUyLBssL1FcuyFL18xyEBAQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a52ae4ba-59ac-490f-45d9-08dbd4094615
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 20:47:30.0288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqzeBZyxViqYezx7mEFHKUDzwjBEGiy63RN8mZu2eB4TVzJf32/+X0ma2kweQ/ogztdEtcrVnxLOhs93ZcU9J+AAAbVs8pT3LN47uGwAg6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
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

On Mon, Oct 23, 2023 at 09:33:14PM +0530, Ruthuvikas Ravikumar wrote:
> This kunit verifies the hardware values of mocs and
> l3cc registers with the KMD programmed values.
> 
> v5: Release forcewake.
>     Remove single statement braces.
>     Fix debug statements.
> 
> v4: Drop stratch and vaddr.
>     Fix debug statements.
>     Fix indentation.
> 
> v3: Fix checkpath.
> 
> v2: Fix checkpath.
> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mathew D Roper <matthew.d.roper@intel.com>
> Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/Makefile       |   1 +
>  drivers/gpu/drm/xe/tests/xe_mocs.c      | 141 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_mocs_test.c |  24 ++++
>  drivers/gpu/drm/xe/tests/xe_mocs_test.h |  13 +++
>  drivers/gpu/drm/xe/xe_mocs.c            |   4 +
>  5 files changed, 183 insertions(+)
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
> index 000000000000..34a20b373ffe
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -0,0 +1,141 @@
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

Why is 'ret' an 'ssize_t?'  We're not doing anything size-related with
it.

> +
> +	struct kunit *test = xe_cur_kunit();
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);

Do we need all forcewake domains here?  Or just the GT domain?  If I'm
reading the bspec correctly, it appears the relevant registers are in
the GT domain on all platforms?

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

Hmm, I just noticed that these LNCFMOCS registers are supposed to be MCR
registers.  We probably need to update the driver to make sure we're
writing them in a multicast manner, and then also update the read here
to use xe_gt_mcr_read_any().

I just sent a patch to fix the driver programming here:

    https://patchwork.freedesktop.org/series/125478/

You'll want to adjust your test to also read the registers in an
appropriate manner (regular register read on Xe_LP platforms, MCR read
on Xe_HP and later).


Matt

> +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
> +			 LNCFCMOCS(i).addr, reg, l3cc);
> +
> +		if (reg != l3cc)
> +			KUNIT_FAIL(test, "l3cc reg 0x%x has incorrect val:\n",
> +				   LNCFCMOCS(i).addr);
> +	}
> +	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
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
> +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i, reg.addr,
> +			 reg_val, mocs);
> +		if (reg_val != mocs)
> +			KUNIT_FAIL(test, "mocs reg 0x%x has incorrect val:\n",
> +				   reg.addr);
> +	}
> +	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
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
