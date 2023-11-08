Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D6DC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 20:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65DC10E846;
	Wed,  8 Nov 2023 20:59:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1058910E851
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 20:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699477142; x=1731013142;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dvsPUpMN7qFDBv/59d/8pDBFHPWiGYDndqvv6wXShxc=;
 b=moR6ieJ5a6lX3eke+jO+ae0igmOYQpffvlNsoqWdAy9f+epsivQkkRRy
 rCFLF+FLP4UHjreQNAtoL2Nd1QNNXRAo2eou3KLKNpdAOcogWV+E+q3NW
 9nRZneX0WpfihFbtcilqcdA662gpRFyXAjcA7fq0O4/RJbVMooH/N4eBF
 N0MaAm5+hEpMwp8UGDIcQAMwzb8SOjC9jqA71xvU1giEAM9A6IYy1CWgX
 zEdWKonA5qBDhp4fMU1gJJ2+ox7Q2iA3qESHlSrpeDJDaatKyoXmQRmK5
 MHGlByxJQIYnksVjDc4SsvKKf89nEyWao+mKcdrC3PkgOsznIrj/OFrxt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="380248242"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="380248242"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 12:59:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="4314180"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 12:59:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 12:59:00 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 12:59:00 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 12:59:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEHOqscLTGcoIDes2O40hpdCPrEzoTv6sBao8gR/MkzXQlCjsgBO1tZ4N3ixs8QK2Vk+PQVdVMLHUCsVlNnR67TT0F9n6P3cZ1rmtrItXOOnAR54xcl1gFLQrbuBNydPVOfMCjFurDVs035AG3LYq6eyzq/cBBhmz4V0BHwSv1Vszp7DTqzBVlp12tJWqYoaLZ4s+iQFYPiKOeeTZ83W+WlvmIjyJeIpk0f6Rp3Wy3d1hwFoVy0XyaH2G8ay0G/mZVSJMZtr+ZADQOYzx/ElligPl1jV6gzg5IXnJuSK+2IBJQk+bFn/10Fdw6xlTJFMc3iMBsN5ZDM3L9YbEKbgvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8witeBpz4WfDn3Fpv+LGUk9zuaJekl6V8zQoVxuM4A=;
 b=fXtlMdqH4sCbY3Qc308tuOOuIh5Tzvd80nU4m/jflSaAPsPS7xLAGKXFch+KVkazLTLooHpj2WTQyzBoR5KX88sA72TffZGCc51K4ol+qeKn/xWrWIOk/Zo8c3LOD4eDGLEwjX6CClRyFeUllXAxRgTSEELe15DXXkoRBZv0WVyJTEWGIjeWKvSJJi4M3SfawC9HAWZ3htiuoBBI0kXhH7yA5PRwqyUedgQNzxnBCEWDcn5TpEByTD545POUJdYYZ4Za3LPllGX360IZqC958y7v95bM7w/l4afTmxg1qsR3bRr36co8KkZvO4JUcP3AhRlrbodeFmbEau0LmURR4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BN9PR11MB5372.namprd11.prod.outlook.com (2603:10b6:408:105::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.29; Wed, 8 Nov 2023 20:58:53 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::a247:c62c:764f:85a9]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::a247:c62c:764f:85a9%5]) with mapi id 15.20.6977.018; Wed, 8 Nov 2023
 20:58:53 +0000
Date: Wed, 8 Nov 2023 12:58:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
Message-ID: <20231108205850.GY1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231108205041.2084410-1-ruthuvikas.ravikumar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0165.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::20) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BN9PR11MB5372:EE_
X-MS-Office365-Filtering-Correlation-Id: e61a8115-f9e9-428d-28d5-08dbe09d837c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tmqQOCc8K/YvACSyhHQq8QAHiBsdoQiQiokwNOfSDAb7jqznBEcpJc/0gjBS3ePiz9iiLCQD4L9BF9e+d7iZInnai7ik1C6sIFa+Mlk8Eknu1V3RcvSoA3c9RlWX4w/xnmbo/S1jm/fQRo0XIExM6U2ITX9Yfl8CWObr2L4Kd5uYeC6vuPwK9V/yoqChAjkfvgUEOv9NfNyZXi5Dt4Rc+TQOx16mkwBlSxh7qLK3olGu/TsZF/aKlXB3g0gDz7/ws+VDcSuuvSTxFh0rjiu4JIrI1sXD1ki4npK0K9bw/FukM3uFMsIH8chECh+mbo1zgLCDze43ummIWexkKo/aemaEhaYJo1T9qU5XqiiY7Vod1snkCsANtuNfQB8/A/bOpK7vHuBvMgqDyoGmonNAAt2dU4FKT4H+WSO+JVtC1/7eli4fcljmkFgErerQaiW5ZiNh0AL9liJcTERAWKgJqPb73lIcvPfQ3UDSdBcJ8Is0RVPIdmMB9tU97x4ZMYt/ShyTCL7mJkUbLAcMfT/xFBdcsvykP1QND6+2uTLtesl2KKS7ElYAjTCseREGo/Wt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(6486002)(66476007)(66946007)(66556008)(26005)(1076003)(6512007)(2906002)(41300700001)(5660300002)(8676002)(316002)(6862004)(8936002)(4326008)(6636002)(107886003)(82960400001)(33656002)(83380400001)(86362001)(38100700002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6HFkVZXMDJ27SD16zfS3aUS2jxFsrTXPop0W7No4Zzmp6o5H5APjaZBDh9?=
 =?iso-8859-1?Q?vxxJyzrWkKQ8/uZrJZKh8/60gdxpFol5S4fxZn2UzFS7/XOBIk/qsovj7b?=
 =?iso-8859-1?Q?svCZdERK+/bSlJuUFI+Fp4pJvqdkaeMOcNpCvu9fZcFIShQ5x9ka/10cnw?=
 =?iso-8859-1?Q?KXi8tK/jo/Lc3NLX7rNblZ2wxxNL9T56MaNdJv2JVzco18UkXqkRqBvADx?=
 =?iso-8859-1?Q?nJzjnyyBeRoia9IVJRUSxELMtaS9UHsgY1tH0kQ3uM9/tqsiOCLqb2kGow?=
 =?iso-8859-1?Q?JN03EsTueRDRrWlyvC0BMdrUl/PBW6ChHGVNL6RTmzFVTQsP7T8Ku1hExR?=
 =?iso-8859-1?Q?LEEcVbwu7pbZjhK7TR2aRk6ncWYNQBdiq5N9FqyibljhMV5usp1fP2KPiV?=
 =?iso-8859-1?Q?W/3uq91y/qlm1qnLQkFHULrO86ziDz3fuTg75aroBBre407m5m1qkyQq92?=
 =?iso-8859-1?Q?MXttL+NGHorCS7fuhsbKauPZNGA+43/XD5cQfytV6BXd3uOOMNyaUE5Vrn?=
 =?iso-8859-1?Q?DJaezF4A/KbslvlOOlWMfjARyNOKBa2llr57bE1V7Bjc6cm3Qxk0b1PPAo?=
 =?iso-8859-1?Q?XRlUZpbl3MAR0/5n2upo/ZzicLjVIvLhLjTyt0eq097h+q7x2pheqrwPWB?=
 =?iso-8859-1?Q?w5kAQA4+hgPHhWou3G0yrwLJJgeG01W9z1z01z2INWBq0Boyl00O1E0AoU?=
 =?iso-8859-1?Q?HvFwxxy06lm9VmAc6AjDvEySQYEc3qGiJq3v7YFKXZUw3pEb3SFRT2osPm?=
 =?iso-8859-1?Q?cf/2IeXbtzNdo8h/pPlolEfNiTMDagEH8wXzfPooHugmYc4ayBxqcAVBC8?=
 =?iso-8859-1?Q?9+3pyGB/GowYrlAVU70L8diK/L+hc5k/bn/tWTX07s6yozNzcl0HedTVGt?=
 =?iso-8859-1?Q?l+7mjZq7MTiRQXL0xghOjg67O257b+izGfTwfM+HTfaUmua0X2H5ckc7Qw?=
 =?iso-8859-1?Q?AXU8/FCjt4I1N09cw1O12brr35Y8c6PzxHLq0z/RQlzBbEtwwLbKlt3Tt1?=
 =?iso-8859-1?Q?ur2ILeEF+D3UKKpXktoKTrExDYWzZcDBNocNK/CDWhi5CyOVThxljxOqFA?=
 =?iso-8859-1?Q?ePKXeQ7DTadNMM8J+zDprVx8pU8PL+Vxky+96vPthXcTU9Q5MAjFjtQz6c?=
 =?iso-8859-1?Q?IvopGXUH5SdpAx1P37eeg2nOFR+bWjlPdaYEcQ4AAxG2VjA6e7fH2rwn2g?=
 =?iso-8859-1?Q?mZiDSwZnFeKnbFCZoDiwXjVA8k5KZdBccZjj/Loa5Fhikq2ZFHbaQ/RHtp?=
 =?iso-8859-1?Q?DxT447XOdGdGArl8P4V1xaizii+FV9ZkGYMKM9W2Po1neHYyezBgwP1QLX?=
 =?iso-8859-1?Q?ZmrWfwvQhlPEQVcjoCVUAqNRIex1HDW5aRx6w8iGEd5DNehGE4N0l52+xX?=
 =?iso-8859-1?Q?70nqbk8U2Cteef2P25Me1VGVetI05RkRO/gAaZ6Vewid5rtp/VVHpYL0iz?=
 =?iso-8859-1?Q?9PhiFkSrSMp+HCls7KDg1c1hSSNzkgYtu2YXJabQCgg5nd/z5+ddN2/w1j?=
 =?iso-8859-1?Q?5R5OtkwzpDAot0CP1Q+/D+B3zUyKl9bO2q4BlXLacbD+thDG5lo8Fr4KT/?=
 =?iso-8859-1?Q?c1FsaHe041Q1GbUTsmu1bXJgXQoCJqSQn2xelFp7b9DgWe/LCObAJ9puan?=
 =?iso-8859-1?Q?CdgMtPcmTvOaiuCcaFZ9Mty0OGh1vDRb1K446nZMgrsku0DrOCGIaKtQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e61a8115-f9e9-428d-28d5-08dbe09d837c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 20:58:52.5068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXBSwep0P0Gt1PPkWg7N0gm0KAU35Gw2RJP6YMmj1kCAN6VmPjWQtku2HUi6YLwq5z8NfupONbHbbGsEeOAL+6lRp1oD/DUDUtGBUAoRDJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5372
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v9] drm/xe: Add mocs kunit
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

On Thu, Nov 09, 2023 at 01:16:55AM +0530, Ruthuvikas Ravikumar wrote:
> This kunit verifies the hardware values of mocs and
> l3cc registers with the KMD programmed values.
> 
> v9: Add Forcewake Fail.
> 
> v8: Remove xe_bo.h and xe_pm.h
>     Remove mocs and l3cc from live_mocs.
>     Pull debug and err msg for mocs/l3cc out of if else block.
>     Add HAS_LNCF_MOCS.
> 
> v7: correct checkpath
> 
> v6: Change ssize_t type.
>     Change forcewake domain to XE_FW_GT.
>     Update change of MOCS registers are multicast on Xe_HP and beyond
>     patch.
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
>  drivers/gpu/drm/xe/tests/xe_mocs.c      | 138 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_mocs_test.c |  24 +++++
>  drivers/gpu/drm/xe/tests/xe_mocs_test.h |  13 +++
>  drivers/gpu/drm/xe/xe_mocs.c            |   4 +
>  5 files changed, 180 insertions(+)
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
> index 000000000000..26187b10abec
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -0,0 +1,138 @@
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
> +#include "xe_gt.h"
> +#include "xe_mocs.h"
> +#include "xe_device.h"
> +
> +struct live_mocs {
> +	struct xe_mocs_info table;
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
> +	return flags;
> +}
> +
> +static void read_l3cc_table(struct xe_gt *gt,
> +			    const struct xe_mocs_info *info)
> +{
> +	unsigned int i;
> +	u32 l3cc;
> +	u32 reg_val;
> +	u32 ret;
> +
> +	struct kunit *test = xe_cur_kunit();
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (ret)
> +		goto out;
> +	mocs_dbg(&gt_to_xe(gt)->drm, "L3CC entries:%d\n", info->n_entries);
> +	for (i = 0;
> +	     i < (info->n_entries + 1) / 2 ?
> +	     (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
> +				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
> +	     i++) {
> +		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
> +			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
> +		else
> +			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
> +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
> +			XELP_LNCFCMOCS(i).addr, reg_val, l3cc);
> +		if (reg_val != l3cc)
> +			KUNIT_FAIL(test, "l3cc reg 0x%x has incorrect val.\n",
> +				XELP_LNCFCMOCS(i).addr);
> +	}
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +out:
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +	KUNIT_FAIL(test, "Forcewake Failed.\n");

Putting this here will make the test always fail 100% of the time.
There's no way to exit this function without executing this line of
code.

If you want to only fail on error, you'd either need to place this at
the point where the forcewake fails, or you'd need to replace the line
here with something like "KUNIT_ASSERT_EQ(test, ret, 0)"

> +}
> +
> +static void read_mocs_table(struct xe_gt *gt,
> +			      const struct xe_mocs_info *info)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	unsigned int i;
> +	u32 mocs;
> +	u32 reg_val;
> +	u32 ret;
> +
> +	struct kunit *test = xe_cur_kunit();
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (ret)
> +		goto out;
> +
> +	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
> +	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
> +		      "Unused entries index should have been defined\n");
> +	for (i = 0;
> +	     i < info->n_entries ? (mocs = get_entry_control(info, i)), 1 : 0;
> +	     i++) {
> +
> +		if (GRAPHICS_VERx100(gt_to_xe(gt)) > 1250)

This should probably be >= to match the condition in the l3cc function.
Technically it doesn't matter too much since the only platform with
exactly version 12.50 was a non-product development platform (xehpsdv)
which we're not supporting in this driver, but 12.50 is technically the
first version where these registers became multicast, so ">=" would
still be the most accurate form here.

> +			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
> +		else
> +			reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
> +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
> +			XELP_GLOBAL_MOCS(i).addr, reg_val, mocs);
> +		if (reg_val != mocs)
> +			KUNIT_FAIL(test, "mocs reg 0x%x has incorrect val.\n",
> +				XELP_GLOBAL_MOCS(i).addr);
> +	}
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +out:
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +	KUNIT_FAIL(test, "Forcewake Failed.\n");

Same problem here; this line always gets executed, so your test is
guaranteed to report a failure, even when it actually succeeded.

Matt

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
> +			read_mocs_table(gt, &mocs.table);
> +		if (flags & HAS_LNCF_MOCS)
> +			read_l3cc_table(gt, &mocs.table);
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
> index 46e999257862..409f21b72761 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -588,3 +588,7 @@ void xe_mocs_init(struct xe_gt *gt)
>  	if (flags & HAS_LNCF_MOCS)
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
