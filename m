Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E54CDB484
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 19:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDB810E065;
	Thu, 19 Oct 2023 19:24:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F7310E069
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 19:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697743440; x=1729279440;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ly3AJVkiNM/XzNH6nGrkS3lAWEn5nDthq6bqr2JHv44=;
 b=k9qQNmRP7axdRsBOWliFPmEDUrxggkwKS2vyGbnVAp6696qyyK9kUIO7
 NHnZo1obfxFav3r+WTywpNvJEUTQc5GSbNp3E+nvQRRf99V594uKKyufs
 jvsEdKJ1vt/tDM2OVZ1oJ6UTwLgOZAl/ymJfWdJIl2lq/U8/JQJhKMxOB
 /9ozc/TtzD2+Ztk/NqSZU5Yg/7qj08i2esJu61rM+TNBHZDE+rLmOMo19
 qYHss8yuIxEvH3y1saFK73VE2uLDcA12yFe0BRrokS4xRxjwqv2IkH2dK
 LSndtwm81rj/r1ht50AdijR7uXaTg+w4bdR+GL6t1j0rJuBxZvX3JJpYr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385220622"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="385220622"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 12:18:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="847811221"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="847811221"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 12:18:33 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 12:18:32 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 12:18:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 12:18:32 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 12:18:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hlXUflA/OcQnvIMxrMo4auUuX2fjXZ21u7/k3SckfqvCSr88EZAdJWtcjj0J7gdxzQ2JQY5lkpE+kU2aZj4u4c+OFoomr/q/LPo7Y43ZEwVHZpxFtQqLHQXsMGQB6fw6iFL3F076PP0Ae4NTzyTtHRraaTSqJPUskNSAmrWHFxfpmre1EDSgQohwYgcATtF/AJuiIOwKknVVV7yAdghwiA1jYiyMr+sDOZWuasnFOul8OYxKQMPznsdgyqGsbjdBs2fU51NpD4gbYQjt7l5d8h4SKGgxhdnUW9OJEZhhFyjvGBd7vrhtNW24LEEhQQ6Bo5b214iUsETgsXy0+7ehAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2pT9Mnm5hLiMpFWq/5gfHGq5Dpe5mnck+IOe+nLku8=;
 b=XM9TRw4n9wQqq5u4r3Ql6PqHR5gLuGkXBQPhOWTU9Z9IybOm+MN8l12djBlvxnNeMuWMLgzq19dMkdi4qb5iQbBN8d8h/Wm6bCj28QW8QkUm3kOsjylnuOTeXRH8OUJhN1b+L72ZqksVbTI4Qb+f+DSCyZ9mdxiTh08ewsHZqCta5aHBOscXM3lgtsWBmEFBU/pAcs3en1uZzQWFw7MvOc63kKl99mEXFLY2W2xUXu91orsxb0SK4lo3yIBC6JQe3o11WZkp9pNFyKZLPo6bm5AmBdRSXxbsrLRI1UMhptxI7Hi3qIPmCN/FDblpgHCKqpLPQzQ3rbdzayfDzllnWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8746.namprd11.prod.outlook.com (2603:10b6:408:202::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 19:18:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::c228:5055:b7da:d0bf]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::c228:5055:b7da:d0bf%6]) with mapi id 15.20.6907.021; Thu, 19 Oct 2023
 19:18:30 +0000
Date: Thu, 19 Oct 2023 14:18:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <5ow55jrx5znpjjmwsckkmy37v5wvy7g3tbfag62qscg2horx7e@qfgsk5ahdtc5>
References: <20231018225707.1685294-1-daniele.ceraolospurio@intel.com>
 <20231018225707.1685294-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231018225707.1685294-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0197.namprd05.prod.outlook.com
 (2603:10b6:a03:330::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: 00116ab1-6ace-44bd-62fd-08dbd0d82d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yoAxow5Y4U3v1DOdh1r4+vnYb6hq/pla3UPsTBJLNmxj+laV/HRHC3lBA5ICPBUqfTeuBVZAVuowkA3F/BkafN4oFZYCWlkOjLf5Jo04OxsqRdm2R+e3ZPRDL8vuoxhhdMOTFSh7nK1I5AUhYrjohEf/O16HTjykA7U63aX6yEiG/ogquqZKzBzqQz6+qktL7slJxH1cAyXwE/oewaU1c08VPqm8efASkzLyr4WE+FNT64fgF1laQkrDQaBSCd14ataA7TKRELVzzZeIvrMwT4aW3eGk6MpwtpXxZdxeWdrVzfP3HHgixDVLRqAz4Xnlfynhd6zNQj/9RCPArw8UcCPtkyRXuC+NA+TRK6Ijc3kbV+sjjeMV+1g2NaylgE2qkOG1hMvagKlLJOTb9bgs0OUIDvFqj/9R6CSNvN/E0VSAe9zbt/0pkrplEChVSAWl+m/dXQVfjFbOmg9QlPQ6yjuLHuCj1JWacbWuAfItUsakc9axJ4E5bYIOqgbZvUybweDEFDGxWKzZEqkEL6GzQtEiKCkJRfCFz9ySLc7MWtp4GY3U2gIvzSHaErv9qqdt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(346002)(396003)(366004)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(4326008)(6862004)(478600001)(8936002)(8676002)(6486002)(9686003)(33716001)(86362001)(6506007)(2906002)(6666004)(26005)(41300700001)(82960400001)(38100700002)(83380400001)(6512007)(5660300002)(316002)(66556008)(66476007)(6636002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8HSdoHnzUgWsjx5jURhP+j4hd61GRgWRVl5f7ww4ajGblYNeqkQbEoggGqYm?=
 =?us-ascii?Q?fCVtXky5Z6iCxdEVoX5j+gzGrUZyeegcy++ysAYgn13TMuDhdwQHQECR8/Sl?=
 =?us-ascii?Q?wZutSRyhKmpr6OedpgabyFNJTaj/N9JFnRL60jM5qFYA74n8xqKDmf5oH5cr?=
 =?us-ascii?Q?3ZsYg5r/BcXiLMHNMMfQJZr7SfhIyOD7Yuj6oZhGibVHcw/36EhQfszePB2W?=
 =?us-ascii?Q?D99ti0sLFe1HCcfEmH8eutfIF+m4NRpZC/XC81OdEc2suw3moYLH/FHL3o7u?=
 =?us-ascii?Q?6t55d78qN/9FAQu4ZTwLfQ5Xa6oNKPqW9tMEMS/K/bzmehuBHvvsWsXIOhve?=
 =?us-ascii?Q?c0TRUCETY16x+YqQvtzez5wNwA9kn8jEhrfQaRhbOIzM/aoc0NzOP9vfISwO?=
 =?us-ascii?Q?p2LdZYJN4szSRXh6+cBe4A0Qwf/eK6pNqoKGYoB+/GoF3BM6jCUc+DmOMjsR?=
 =?us-ascii?Q?oBYEAXrqkaWDkGicZ6YZkTofrzMaePWiU2e8POJ3j6UmAFJ/bk/wX/bce6SM?=
 =?us-ascii?Q?6IxskLFo2TbUX+uVmRo9G5m0tvegzanwzVAuyC/QRKP7OrRR23S63T+i/BBJ?=
 =?us-ascii?Q?7w/+AHMdoupE7f4ATJh9aOT+j19tEDbe4SILJ9aq6m0n+GulhwnuxAbPHnsC?=
 =?us-ascii?Q?6ms772Hyio6/EizIKevyBUDLJsi/+NXelSKweVPjz8i6ra0b8685u/xE2rVh?=
 =?us-ascii?Q?gemvHdcZZ7qlYTm2F1YVr8oUAvZZBp0uh+1InqYb+mcp/Je+PfCL3PRMgBh/?=
 =?us-ascii?Q?eFV2SS6rdquqrok1B6m+Li29rEnsUsJftPbUyQmjfaHgSi8USKZV4/xB38UJ?=
 =?us-ascii?Q?DXLr+EbhhNx5T/buqpydRnGQwe58Zr9xGkkYgYOtyl9uieU0/UC3/ZbfXr88?=
 =?us-ascii?Q?IULf6b/do88FCmkltkU4fe8h1t5jkWLNwdsT1c/Ua30ocNu/k1sLOmWgTI7a?=
 =?us-ascii?Q?x2dbGfTT7pf7fHrR0kdyAYRwO1wEHy8BBfVi+ejB67SNHtbAKkH9MHuAr8Bn?=
 =?us-ascii?Q?fw9woS3tJ0CMF7RndL5EblqZP3N7oSIbtorKJ/Bdm4ZldlSwECp5x0xfDufp?=
 =?us-ascii?Q?wLZ2ZpShiVytZOheTlvwYOk/CArysfEJYxZRtGD1kBY1oJFe9Emkr6MXtjPx?=
 =?us-ascii?Q?Tn5pdCtG//OFEjuZuSEGyqGdoD+9OIAY7h0NMSoh57mNU/ERJUn694rZgHPD?=
 =?us-ascii?Q?FJEdnupqAc5MhmxcG/HzD4HHQh9PRc0rwipK75e1c9Ud1yubJ17GBriGWdVj?=
 =?us-ascii?Q?PLHSQteG7ZK6uEIkn85pIiW3/beZ7hIMHrF6PMBSm7kFncXrlArLETrVxc2B?=
 =?us-ascii?Q?s4FLCE5XzrKUlVJIzi2rGkUxSrPj+2IgPm/HfE8WPjwJG6kFHYKL2rnKT+cB?=
 =?us-ascii?Q?pej9mRwsPWeSJzDz/xMPQpLcX91eEEq4jVuI8d/peL/zgHvLXQSc1wf3bnm1?=
 =?us-ascii?Q?3xYpl4g+1yk+4/6UYjoJ2D1qfapNW6egQ+2SShlRR5UJdGjNYMo3tgr73tsA?=
 =?us-ascii?Q?b0tBzBlch+Ko4dX70b/sXFVgT+2DLMCr6yEUWVMqioXXTk5uZdfaZAMbL9SG?=
 =?us-ascii?Q?Io4RJ3wlJvE2Gl1B4P8ZR1C2r7OPi8AxjjHoNhey4FbhGG/yKgDnAHM4/SjD?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00116ab1-6ace-44bd-62fd-08dbd0d82d5b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 19:18:29.9523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6WKv8pdoW2ElTyenx5OuQdN8dHkR4dxl/R2+k5+goDEkio5WPQPMYSxhR1c76fs4zcVZN0LS4Suh/40aoQu18E8i806ctlmm2uZt8/uzys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8746
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/5] drm/xe/uc: Prepare for parsing of
 different header types
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

On Wed, Oct 18, 2023 at 03:57:03PM -0700, Daniele Ceraolo Spurio wrote:
>GSC binaries and newer HuC ones use GSC-style headers instead of the
>CSS. In preparation for adding support for such parsing, split out the
>current parsing code to its own function, to make it cleaner to add the
>new paths. The existing doc section has also been renamed to narrow it
>to CSS-based binaries.
>
>v2: new patch in series, split out from next patch for easier reviewing
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> Documentation/gpu/xe/xe_firmware.rst |   2 +-
> drivers/gpu/drm/xe/xe_uc_fw.c        | 117 +++++++++++++++------------
> drivers/gpu/drm/xe/xe_uc_fw_abi.h    |   7 +-
> 3 files changed, 72 insertions(+), 54 deletions(-)
>
>diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
>index c01246ae99f5..f1ac6f608930 100644
>--- a/Documentation/gpu/xe/xe_firmware.rst
>+++ b/Documentation/gpu/xe/xe_firmware.rst
>@@ -8,7 +8,7 @@ Firmware Layout
> ===============
>
> .. kernel-doc:: drivers/gpu/drm/xe/xe_uc_fw_abi.h
>-   :doc: Firmware Layout
>+   :doc: CSS-based Firmware Layout
>
> Write Once Protected Content Memory (WOPCM) Layout
> ==================================================
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index edaa195fa25f..7345f0409cf9 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -13,6 +13,7 @@
> #include "xe_device_types.h"
> #include "xe_force_wake.h"
> #include "xe_gt.h"
>+#include "xe_huc.h"
> #include "xe_map.h"
> #include "xe_mmio.h"
> #include "xe_module.h"
>@@ -344,57 +345,22 @@ static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
> 	return -ENOEXEC;
> }
>
>-int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>+/* Refer to the "CSS-based Firmware Layout" documentation entry for details */
>+static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t fw_size)
> {
> 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
>-	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>-	struct xe_tile *tile = gt_to_tile(gt);
>-	struct device *dev = xe->drm.dev;
>-	const struct firmware *fw = NULL;
> 	struct uc_css_header *css;
>-	struct xe_bo *obj;
> 	size_t size;
>-	int err;
>-
>-	/*
>-	 * we use FIRMWARE_UNINITIALIZED to detect checks against uc_fw->status
>-	 * before we're looked at the HW caps to see if we have uc support
>-	 */
>-	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
>-	xe_assert(xe, !uc_fw->status);
>-	xe_assert(xe, !uc_fw->path);
>-
>-	uc_fw_auto_select(xe, uc_fw);
>-	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>-			       XE_UC_FIRMWARE_SELECTED :
>-			       XE_UC_FIRMWARE_NOT_SUPPORTED);
>-
>-	if (!xe_uc_fw_is_supported(uc_fw))
>-		return 0;
>-
>-	uc_fw_override(uc_fw);
>-
>-	/* an empty path means the firmware is disabled */
>-	if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
>-		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
>-		drm_dbg(&xe->drm, "%s disabled", xe_uc_fw_type_repr(uc_fw->type));
>-		return 0;
>-	}
>-
>-	err = request_firmware(&fw, uc_fw->path, dev);
>-	if (err)
>-		goto fail;
>
> 	/* Check the size of the blob before examining buffer contents */
>-	if (unlikely(fw->size < sizeof(struct uc_css_header))) {
>+	if (unlikely(fw_size < sizeof(struct uc_css_header))) {
> 		drm_warn(&xe->drm, "%s firmware %s: invalid size: %zu < %zu\n",
> 			 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>-			 fw->size, sizeof(struct uc_css_header));
>-		err = -ENODATA;
>-		goto fail;
>+			 fw_size, sizeof(struct uc_css_header));
>+		return -ENODATA;
> 	}
>
>-	css = (struct uc_css_header *)fw->data;
>+	css = (struct uc_css_header *)fw_data;
>
> 	/* Check integrity of size values inside CSS header */
> 	size = (css->header_size_dw - css->key_size_dw - css->modulus_size_dw -
>@@ -403,9 +369,8 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> 		drm_warn(&xe->drm,
> 			 "%s firmware %s: unexpected header size: %zu != %zu\n",
> 			 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>-			 fw->size, sizeof(struct uc_css_header));
>-		err = -EPROTO;
>-		goto fail;
>+			 fw_size, sizeof(struct uc_css_header));
>+		return -EPROTO;
> 	}
>
> 	/* uCode size must calculated from other sizes */
>@@ -417,12 +382,11 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> 	/* At least, it should have header, uCode and RSA. Size of all three. */
> 	size = sizeof(struct uc_css_header) + uc_fw->ucode_size +
> 		uc_fw->rsa_size;
>-	if (unlikely(fw->size < size)) {
>+	if (unlikely(fw_size < size)) {
> 		drm_warn(&xe->drm, "%s firmware %s: invalid size: %zu < %zu\n",
> 			 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>-			 fw->size, size);
>-		err = -ENOEXEC;
>-		goto fail;
>+			 fw_size, size);
>+		return -ENOEXEC;


Unrelated to this specific patch, but this makes it more evident:
why are we returning 3 different error codes for the same thing?
Maybe we can make them all -ENODATA or -EINVAL



Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi


> 	}
>
> 	/* Get version numbers from the CSS header */
>@@ -433,6 +397,60 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> 	uc_fw->patch_ver_found = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> 					   css->sw_version);
>
>+	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>+		guc_read_css_info(uc_fw, css);
>+
>+	return 0;
>+}
>+
>+static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
>+{
>+	return parse_css_header(uc_fw, fw->data, fw->size);
>+}
>+
>+int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>+{
>+	struct xe_device *xe = uc_fw_to_xe(uc_fw);
>+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>+	struct xe_tile *tile = gt_to_tile(gt);
>+	struct device *dev = xe->drm.dev;
>+	const struct firmware *fw = NULL;
>+	struct xe_bo *obj;
>+	int err;
>+
>+	/*
>+	 * we use FIRMWARE_UNINITIALIZED to detect checks against uc_fw->status
>+	 * before we're looked at the HW caps to see if we have uc support
>+	 */
>+	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
>+	xe_assert(xe, !uc_fw->status);
>+	xe_assert(xe, !uc_fw->path);
>+
>+	uc_fw_auto_select(xe, uc_fw);
>+	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>+			       XE_UC_FIRMWARE_SELECTED :
>+			       XE_UC_FIRMWARE_NOT_SUPPORTED);
>+
>+	if (!xe_uc_fw_is_supported(uc_fw))
>+		return 0;
>+
>+	uc_fw_override(uc_fw);
>+
>+	/* an empty path means the firmware is disabled */
>+	if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
>+		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
>+		drm_dbg(&xe->drm, "%s disabled", xe_uc_fw_type_repr(uc_fw->type));
>+		return 0;
>+	}
>+
>+	err = request_firmware(&fw, uc_fw->path, dev);
>+	if (err)
>+		goto fail;
>+
>+	err = parse_headers(uc_fw, fw);
>+	if (err)
>+		goto fail;
>+
> 	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u\n",
> 		 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> 		 uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw->patch_ver_found);
>@@ -441,9 +459,6 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> 	if (err)
> 		goto fail;
>
>-	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>-		guc_read_css_info(uc_fw, css);
>-
> 	obj = xe_bo_create_from_data(xe, tile, fw->data, fw->size,
> 				     ttm_bo_type_kernel,
> 				     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>index 89e994ed4e00..edae7bb3cd72 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>+++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>@@ -10,9 +10,12 @@
> #include <linux/types.h>
>
> /**
>- * DOC: Firmware Layout
>+ * DOC: CSS-based Firmware Layout
>  *
>- * The GuC/HuC firmware layout looks like this::
>+ * The CSS-based firmware structure is used for GuC releases on all platforms
>+ * and for HuC releases up to DG1. Starting from DG2/MTL the HuC uses the GSC
>+ * layout instead.
>+ * The CSS firmware layout looks like this::
>  *
>  *      +======================================================================+
>  *      |  Firmware blob                                                       |
>-- 
>2.41.0
>
