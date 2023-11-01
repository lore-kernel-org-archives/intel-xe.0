Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5A3C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 22:39:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C06D10E104;
	Wed,  1 Nov 2023 22:39:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF1110E104
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 22:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698878339; x=1730414339;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EaT1Fiyio7ZO48jtlizB7sZUaU9bkDeyWTnCQhSP/kQ=;
 b=IRpnvGn5zKY0fU4hZZ8J394QbxuhyKKgf7Mv26SnkfynHv+EdY/LxmG9
 os8QoWWZA4ZLd45r/UIS/6wVqiYznchUqMqJARnDdJD0BIUj1Co9jWfuo
 INsGj/wumuKbo6l/p5mkzerB3OOGTXxH7Xa8NGjSXfDFaRwwvEIU3aQuR
 IznZ7NvApSqmQj5utR36dg4HpC3WhAtln0mBta5TOQx+zf/sI4g7/ZHOo
 DXhEM05GewziXnVkQBnXitxQlLudLMn9DGMlJPHjOjg/e3mfBOk4t+tzY
 Nh/E2Tgt89N/A7cUXVpqC2yg7xM0uYVzoY6ARo8O/a5oPVvT7aK6/w+fz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452891459"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; d="scan'208";a="452891459"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 15:38:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; 
   d="scan'208";a="8806239"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2023 15:39:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 15:38:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 15:38:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 1 Nov 2023 15:38:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDDQCRZJRQoxt2xdPWT2MWIwAIDn2upcyZGrzaIeDudKuTDxn7HSQFhYMuaBcHsDOtUoTABZySYow6FPHbJoo5aXL97ua15gShx+3842HTbi8FSMb0tmdjyM/VZ0bMIVzwqRrMvKIDtscf9TCBAkWVxqI3RDmvpsnI9wPx8FUdybuoSH9SepXTuWb+dU7U+C6r6RwDVtXrYjl4ZvLlBWSOaBQe5+cfKx1nZgg2fzTVI+VJgc3DHh/yB3God8che6DfshbWGIBHQhJoRaXk73Rj30i25kFXLnu+7+PiOyfDMfHr1FDWAgmOxaE517BMwistWANkdx7KJO0t5gFpsKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHGtzhcwZj7ZYsriH2k9HtG8sxx3LlzAoXjDMgUjDpg=;
 b=HoIyusIeYc5QkG+ZNCZ9PyuohDLqmYyvsPpM95hMKVpJEddbzuPEtgUz/yWTvuaU2QbsHVMOHCDMNhknhzP5di3KcPztAAvfKSM5CalsqSZl3FqPzPAx0O5NS5tifg+qS1ewi82lx/QDJBQ/n9YwghqZIhRqem914aKEkQIILGgaieUPGQ0yoIxkGYHz4qTAk3klqOH7kxHc8O5u2m+TZdnGjV12ocG+YUTIyIfnbugdcltqMoe6actzEuJRAVFWCR4iOQRCnywtRpN76Aey6tyoR/hV8JAZB0nrCnTnFrlCpCF3Zun/Rt2CbBS9CHNtcXna175QYoCFbdh9Q0dr4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 by IA1PR11MB7246.namprd11.prod.outlook.com (2603:10b6:208:42e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Wed, 1 Nov
 2023 22:38:49 +0000
Received: from IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::929d:7372:b3aa:2541]) by IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::929d:7372:b3aa:2541%5]) with mapi id 15.20.6954.019; Wed, 1 Nov 2023
 22:38:48 +0000
Date: Wed, 1 Nov 2023 15:38:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
Message-ID: <20231101223844.GO1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231030184030.1936233-1-ruthuvikas.ravikumar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231030184030.1936233-1-ruthuvikas.ravikumar@intel.com>
X-ClientProxiedBy: BYAPR11CA0103.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::44) To IA1PR11MB7854.namprd11.prod.outlook.com
 (2603:10b6:208:3f6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7854:EE_|IA1PR11MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: ae4d2f29-3819-4bbe-3d27-08dbdb2b5031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qg5UH+Z1b2KtUbIh3dzFTVaZ3ALEPeCu1gXViU3lrTztsw0/LnQ3BWPR84bTZwAzO2u174riCd08Ym2MTCU80VJWBgRwPa70rkM9HPj4DCy1j8BVEX8uO8t8X2jASQ1mWgXBxcuFvP5oYalwi6pcYnbQ85Msgbivso4NY6CMKHrV8uI0rfFs4m5FR/wiWlWtbrwC9jnxv0/WjxIqER5uXc23B5QIuCTUiL2iOQvCYjHCAvIk+zWfhBcR51CKJjEMVs9cR2xSnqQD8FBicEu9KOkR9ihWrO+LO45XJPSiwUXdpo4C1MtIEL5HsEgucYcyYKpEAn0iE1VgmamH+gDJgoGTys4WyBRN8T7jW8lgmq7qvq9UY7CgkmJO+THY86O4/SxLh83va3YlIcThscezCEpQtGTOVQ4MQxgqp5fbVRe+uNoTPvwj+T16nqpzP+3/OZZu4xrcCAnr6mUfq6hjgGORFLpmWOaIB1eRNNrwcO0KQZpmJ/wY+5B5AglUnctt/0KcGVMxBFpZjYeEexBfwlUs0K9qvzZxl4kdIpk6xa/9kfNr/jqgSZwh28D0i8v/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(366004)(136003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(38100700002)(1076003)(66556008)(316002)(66946007)(6636002)(66476007)(82960400001)(41300700001)(86362001)(107886003)(33656002)(30864003)(4326008)(83380400001)(5660300002)(8676002)(8936002)(26005)(2906002)(6862004)(6512007)(6486002)(6666004)(6506007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oOdHZ5kU7BKqQOVWdSXuVFT8LE6aJAwq5728ylTSzjdAKbzERXoqPmGy7r?=
 =?iso-8859-1?Q?H2Z7o0Ez9LfZxJP5Hehbi0/9PhN6Sx+Evk7r0lUeNmGnS3jDjcmq2kdfJ9?=
 =?iso-8859-1?Q?TduSB4RSlKXcWDbo/CfJTL0EZW0qz3DbCG7OHCZ7QdawUJOzUrGz/K3IUE?=
 =?iso-8859-1?Q?G2vGkh7EhfTHVatbkb3MNAVZackzGjkrOZx7tezYNV99wEww8JTV3ylLvC?=
 =?iso-8859-1?Q?xOhZbpUDsSvcMhG8Z6cnHWu3r67SQl701eAbvOIQSAHqiQNsCEdwGzVFZp?=
 =?iso-8859-1?Q?+neX2n44rkXZqVu7osRMz8b1aIQhhyN+CMZFIiWiBHiX1P3K7bPbdCDUTl?=
 =?iso-8859-1?Q?+eoHO+JfBHQOGEThEv+ZsBxC+Wco781dLxPyKSw6S+hCIBduanNIrvazN5?=
 =?iso-8859-1?Q?44NcGKMNA0v5P1laggX11OyCSI2Qw/HCZBOg+/ADh+vwjp/CywfLnz/pEo?=
 =?iso-8859-1?Q?RaxbMdqzgeK3tFnA6KJiyAgYLAd8SPHd/s0lNb+8Sd4cENI2ojMdCsUQlw?=
 =?iso-8859-1?Q?vZ6xpFybtwnbB4/VQWW7Q2NFXIUehXBYAZrC9ewCel82el/PZ3QY1pIbR8?=
 =?iso-8859-1?Q?srHeGLgk260Bo8BIPSwUedn0tzKa0tZiCeAJYfLLvnnpO+wp6zq/L2zrBn?=
 =?iso-8859-1?Q?GbfhM9FviGy7/vCx/QL+l0/e3X48csaxgB87ZVlgI4Ew/gjmOiSITMPiut?=
 =?iso-8859-1?Q?gMVQbukgYqXNp/9XllSsjP5nYIlNsrdCqzLoUNIpVJ/9xqtm0eM0EyMRsX?=
 =?iso-8859-1?Q?WkggNGHr++f2xV70HizDG1VjgryO0r55H73J5pSYsUnaWyxu+mWg7KFWo5?=
 =?iso-8859-1?Q?mGw225JWjnadyufFKkwAQ+cCN0C8MnC5+CNRYNWMboplfgT9eevLDqfC0k?=
 =?iso-8859-1?Q?rSGH0olK92AKMizfqRrBsbUNTQDYSRCkotjIY+OOiKLIpo3Y22IH9GlPh4?=
 =?iso-8859-1?Q?oH48dXzT29pRaiLZCWCjesI3WSj0PusoEqcJMVDWph6DyKpLPL2F1lZTet?=
 =?iso-8859-1?Q?eA2iPThSPgZFMthNnmWazzG8k94GJRsYRZuqvY9kXRxloPlgvmjsLBB0fP?=
 =?iso-8859-1?Q?XWB+FTyDZneuWP53dgNf5fzgSQak2LIYvsAY9g6ddKt0SqmWQiQIU9OCog?=
 =?iso-8859-1?Q?LxDxnQvIFC9ytlatcLa+WXYbvTc3qX/VvV1jNUGt5ozUrj5VYUo6K48T+y?=
 =?iso-8859-1?Q?EvVN9JDyW8XP35x1yG7a+L6rbn0cWX3NoMuSuiyWPuONXGVovmMyKuvKjv?=
 =?iso-8859-1?Q?RHzZ+DxXx+vMHUSwx58IstJwcFTSYi4f0AknWMr7vn4EfvUHI5gUuS8KFg?=
 =?iso-8859-1?Q?ZNCiDohgKCnx/+HPgtW7vPM2fIqN1YlFVTMf0jP1U396o5eoPU/1aYzBD8?=
 =?iso-8859-1?Q?sHTimDt5BTC5PXUsHkFJ8JrN8iAnqEw9Gl5VTY4yExxsIg0J7LYXPbmJ8u?=
 =?iso-8859-1?Q?Cl77LPgS7Tus5IKsumEA0LOR3u3u3jjcFmav+hmobcIhkPMpaJbesNKNcn?=
 =?iso-8859-1?Q?2vyXOJCe1uP8BzWYSk5Fra5Ij+s9xLRmcCHL77bnXYVk1faXKKjjWH0WNO?=
 =?iso-8859-1?Q?YWU+O/lAHXGxT9y1ezqUXGvSVhAW8Bw+ouj5i7NNZBDXzOsHZPQ29WYvQM?=
 =?iso-8859-1?Q?SzEOgZAGpR4+NY1IR74sjDYuKcZTMjoj2oSwEkBA9R+wSGUB4Pe+rzfA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4d2f29-3819-4bbe-3d27-08dbdb2b5031
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 22:38:48.0259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhRN/fK0NfJhZwdE7DPPBCnJhtmgDIrB2MEvrVTrQ/VrO6/3emySuPoASzpRUHaq3avfcycZURDjtW7XHvdES7uo74acnbIDwPkal5hrGO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7246
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

On Tue, Oct 31, 2023 at 12:10:30AM +0530, Ruthuvikas Ravikumar wrote:
> This kunit verifies the hardware values of mocs and
> l3cc registers with the KMD programmed values.
> 
> v7: correct checkpath
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

For future reference, you might want to pass the "-v" flag to git
format-patch so that it's easier to keep the different versions of your
patches separate in the inbox.  I.e., including a "-v8" flag when
running format-patch on your next version will ensure it gets generated
as [PATCH v8] and be easy to distinguish from v7, v9, etc. in the email
clients.

> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mathew D Roper <matthew.d.roper@intel.com>
> Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/Makefile       |   1 +
>  drivers/gpu/drm/xe/tests/xe_mocs.c      | 165 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_mocs_test.c |  24 ++++
>  drivers/gpu/drm/xe/tests/xe_mocs_test.h |  13 ++
>  drivers/gpu/drm/xe/xe_mocs.c            |   4 +
>  5 files changed, 207 insertions(+)
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
> index 000000000000..b2f2a4a86989
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -0,0 +1,165 @@
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

Do xe_bo.h and xe_pm.h get used for anything in this file?  I didn't
spot anything obvious, but I didn't actually compile it, so I may have
overlooked something.

> +
> +struct live_mocs {
> +	struct xe_mocs_info table;
> +	struct xe_mocs_info *mocs;
> +	struct xe_mocs_info *l3cc;

Why do we need all three of these?  'table' holds both the global mocs
and the lncf mocs information, so both of these just wind up just being
pointers back to the same table.  You simply pass &mocs.table in the
places you're using these other two pointers today.

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
> +		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250) {
> +			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
> +			struct xe_reg_mcr reg_mcr = XEHP_LNCFCMOCS(i);
> +
> +			mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i, reg_mcr.__reg.addr,
> +			 reg_val, l3cc);
> +			if (reg_val != l3cc)
> +				KUNIT_FAIL(test, "l3cc reg 0x%x has incorrect val.\n",
> +					reg_mcr.__reg.addr);
> +		} else {
> +			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
> +			struct xe_reg reg = XELP_LNCFCMOCS(i);
> +
> +			mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i, reg.addr,
> +			 reg_val, l3cc);
> +			if (reg_val != l3cc)
> +				KUNIT_FAIL(test, "l3cc reg 0x%x has incorrect val.\n",
> +				   reg.addr);
> +		}

You only need to use the 'if' guard on the actual register reads.  The
debugging and error messages can be pulled outside since the actual
register offset is the same for both the XELP and XEHP variants and you
don't really need to worry about using a specific form.

    if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
            reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
    else
            reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));

    mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
             XELP_LNCFCMOCS(i).addr)
    if (reg_val != l3cc)
            KUNIT_FAIL(test, "l3cc reg 0x%x has incorrect val.\n",
                       XELP_LNCFCMOCS(i).addr);

The same can also be done with the global mocs handling in
read_mocs_table() as well.

> +
> +	}
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +out:
> +	xe_device_mem_access_put(gt_to_xe(gt));
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

Should we just be doing a

        KUNIT_ASSERT_EQ(test, ret, 0);

here so that it will be apparent if this fails?  Otherwise if we fail to
grab forcewake for some reason, we'll just silently skip this test and
it will seem like everything was tested successfully.

> +
> +	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
> +	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
> +		      "Unused entries index should have been defined\n");
> +	for (i = 0;
> +	     i < info->n_entries ? (mocs = get_entry_control(info, i)), 1 : 0;
> +	     i++) {
> +
> +		if (GRAPHICS_VERx100(gt_to_xe(gt)) > 1250) {
> +			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
> +			struct xe_reg_mcr reg_mcr = XEHP_GLOBAL_MOCS(i);
> +
> +			mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
> +			 reg_mcr.__reg.addr, reg_val, mocs);

The indent of this line doesn't look right.

> +			if (reg_val != mocs)
> +				KUNIT_FAIL(test, "mocs reg 0x%x has incorrect val:\n",
> +					reg_mcr.__reg.addr);
> +		} else {
> +			reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
> +			struct xe_reg reg = XELP_GLOBAL_MOCS(i);
> +
> +			mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
> +			 reg.addr, reg_val, mocs);

Same here.

> +			if (reg_val != mocs)
> +				KUNIT_FAIL(test, "mocs reg 0x%x has incorrect val:\n",
> +				   reg.addr);
> +		}
> +	}
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
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
> +			read_mocs_table(gt, mocs.mocs);
> +		read_l3cc_table(gt, mocs.l3cc);

Since Xe2 platforms don't have LNCFCMOCS registers, we're probably going
to want to add a check on this one as well, just in case any of those
register offsets get recycled for other registers on Xe2 or later
platforms.  I.e., add a check for HAS_LNCF_MOCS (which just got added to
drm-xe-next) before calling this function


Matt

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
