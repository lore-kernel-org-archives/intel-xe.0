Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C6CC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 23:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4392810E88A;
	Wed,  8 Nov 2023 23:19:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B0410E88A
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 23:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699485593; x=1731021593;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kTAvG2ZrHftkk0F0W547jxjeIQdKicg4MZGS+OjqeGQ=;
 b=cCw7tWJTo0FH60APUG1/HJUPFMYmC2D0LrRK2/EHZyTlB0CGRFXBEndI
 YrSTJ14ByCzi5MQTCoBFXNB0rYf8gD+U7m9nPqljQicv1EExDa4lgmzBd
 jK6T0VOZoE4f5E53A8kNP5WnRk5FCkSWNyyUrKbY2jaYW/t7G6YJKOPPl
 xP7nOKfWmHNL619aHmsrq0IUmx36Jy5x7n2/s73WG+pJftrm6KWybhpa1
 fegJouSbWDDAcMRuogWqEwuIjhkJ7j39y5w/58C29YFUwQP7vnXsckynX
 TfLwqucC80Dwxlsb18PqZtNp7v9i1tSNmGeBhAJpJ6TLwYLj7YsWoPUjF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="380270418"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="380270418"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 15:19:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="829121565"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="829121565"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 15:19:52 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 15:19:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 15:19:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 15:19:51 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 15:19:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHNAs9hqwbF+b90ss1Qg8gsBy2kIb83Hd3qGLEwPjhS8L8JwQuh+e5fu2pZb09f4yNj8Z6HeK4+tL2NPt9dxnxY7v6fXREna6H2Z/mO4A0L9SZKRAEGFb5ORP7S4dAzWdUK3WOIyQmKMlUXg10xiXcUT8SsZWoqi3c7qWMLnwMLHoVCJrL9UuCebAZv1SEhwJRyYAmLjmFJNrCY1I09cAhuo7QnBMolxGcA7+RerUYKbEKWd869EvTffYWjzx87a+4djhJrDs1NfAnu+dlNKC1TumOxCXo05gt+F5iXGLTDhkOm49tDvXV7cLJRoHizEK30ypc0ZDzNGy0Ku8diAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fhz8OCX6Qfuk3PIZS//IV6MsEJdoYiryZdanDnXdQY8=;
 b=iCwRyY8Jm8VtZKP/GbCRHpV/mjn3n4j6ixOMx4Ghd9SW3Z1qy2Mabh8nnP9CkiBuWBFnCJE26+TY2fyje1KLCD6+YnLqM+GH3vScY9sF6LYxyEUCB0e5Yk0cwjB0qeEx0R6oj+Ws4IcKlvOItf7L6zOyJU49Sb4MVbET3Ie7+UjoXtJjITQYU/zODF9kr5BaRdnYsVmcbHY97zpTl+cqxraQKstH12G0X8fJNkhn2oBIrbqDVn4xneB7uNe+eRKy9WcnWta4vmnxsiwW/HMejjY6BlA9ZN/sP09ARGAZl1duj1s//77xxUeQxeyyHRxQXmnmHL678/4Y0T70Q+j8ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BN9PR11MB5306.namprd11.prod.outlook.com (2603:10b6:408:137::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Wed, 8 Nov
 2023 23:19:44 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::a247:c62c:764f:85a9]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::a247:c62c:764f:85a9%5]) with mapi id 15.20.6977.018; Wed, 8 Nov 2023
 23:19:43 +0000
Date: Wed, 8 Nov 2023 15:19:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
Message-ID: <20231108231940.GU5757@mdroper-desk1.amr.corp.intel.com>
References: <20231108220829.2196393-1-ruthuvikas.ravikumar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231108220829.2196393-1-ruthuvikas.ravikumar@intel.com>
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BN9PR11MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: 583192c3-0814-490f-a850-08dbe0b1308f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E/RYKDC7a942uOt42qJ3Bt3ebBMefSzsQZfr8Z9DNZNATjw1/vHH6k3xwKl9BpCBs06RQpA5Aq5AuvUHnryECxo2qEb+fkQNv7mC68MngiU7FI4cwZDJsrQ8RYYrOik3KoYE9FRc8DM3nRxqTvZT67mqPDyiTRC5Dy1A3v52BKey8AsYSUbN3azv+/N5H9AG27pQUmbKeiXJt6pO1ehWk9a6UhnshSUC4VyjHDojJkEHYonjidt/63p8gWTV2xoY9q76iwaQ6/I1gOz9IeUlxtUJI1jhQiOkt/1rUJxFOjLW3VuCHST1LjvxCL/eXk8O2NrhpBd1QQ/wx+oHt7l8xbmh1b9gYIQ1jg+khNwJh5CT8P+NbMeZzNR9NEFuyFZf+NjSW0665J0GR3/BBwo3c2/IN0FNTmCEAZE8q39rdGD7Cg+Eo+Q0vFz8nI7gQ+I8LzAPAVqiOo6dA4oZhTYQPJOJItxfdC0PBqv/p8cG1oNVlSo8NM6h4N64wFY9fkiD4RI+2ge4CvElVVoCL3lh183wBFqKHdpOnWWygtwrhJnMFqMwxnCWWH12T5zVwPa4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(396003)(136003)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6512007)(2906002)(316002)(6636002)(26005)(66476007)(6486002)(66946007)(66556008)(4326008)(5660300002)(6862004)(478600001)(6506007)(8676002)(83380400001)(8936002)(41300700001)(86362001)(82960400001)(38100700002)(1076003)(107886003)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7904DxS/RQ4xwHbynMVEOBDw2bxqvM64unW8HyCT6PlSy5SdD2DdesG5O4?=
 =?iso-8859-1?Q?iqI58++2FR7l29Srz9HSpQvPtrHhLhtrG9rHOKjO82aGPw1jW6qg7O6zvD?=
 =?iso-8859-1?Q?XGeI+6hBleu2M6S4u+3fOyTXYCBjgQZtcslDm0HubS4U3zHzM1hUXr4oPv?=
 =?iso-8859-1?Q?lTRwIXv6kXMqEuowUCE1m8GGKnuG7juveMDfukIDIBc5y/8PtrUXRmbVGj?=
 =?iso-8859-1?Q?gg2ncWkKw2RASPFBB4b+T4I4W/o7wzEaIlZStHQJFYhW8xvLx8sp0PRr7c?=
 =?iso-8859-1?Q?UlvKdtxEhEkEwZoojBaoswhTfcEZ175yBPtyJNxavQdSXBC5W0QGRVMiJo?=
 =?iso-8859-1?Q?4OL2yEPq4/Cr4fvhjmTbhI8o9iko+Cmk3g8cn8itduO8osOV29gcbyK0wQ?=
 =?iso-8859-1?Q?D7pk6muecGOP7ZFaJTMLFl3h/z2mV9ulHYwUYjZlzrn3oTyzq4giNU1LZr?=
 =?iso-8859-1?Q?KvkOcX3fXdAkWuqEv+6EUyqNv+z3yv6h+CqrvRkFx8R2HtBVGzuin7sIek?=
 =?iso-8859-1?Q?xcX5fvbGdm1tXtp6x8aPJzceXpihDlXN3YvSxdYyAhrSjQzec8WImCCJH3?=
 =?iso-8859-1?Q?kl8DDdyDHLZPjYM8PTkHueuuI5rISkGaXnIO4tRoK5PhZv7fpubMw6+QY/?=
 =?iso-8859-1?Q?yn+2pc/youtZlV/NNOxJ1ez0PjAjyVgiFzGOjAf6f4Z5gdoTNkOV8LOTl2?=
 =?iso-8859-1?Q?aTGgAmUTY9UMmzbYppDraEEZEc8EvDiI3XyDAmJ6xtSMg8O5sYTALuibH9?=
 =?iso-8859-1?Q?KE0BJIrS/hYn2Kvx9fcsSyFegJdenE2J1mmxUznZpAhPaMkujcUwaWA82+?=
 =?iso-8859-1?Q?9Q+i7P/fadVmTyQP7x0sBueWNwV5GFWLbDtbmHY6PlvbNG+f0F2HTf/HEf?=
 =?iso-8859-1?Q?r7AkjFPyqOaJilQbIxbq8acu6DWHxFEqr8YXnxpFwVR76CUfNwNArcrZ60?=
 =?iso-8859-1?Q?6JMINcXQL6wLr8UkfaLQzB2FT02OS2iLZ0pL4VznK5SHxN74UoEe9vQIa6?=
 =?iso-8859-1?Q?LvzKEyq6nhL/1SrZuyLE6QXJV6cS23W8KOt5Xu7ZMVMH0Y1dq/26CWLSEs?=
 =?iso-8859-1?Q?9rWBJ3kQQXqDZxs7QJSySa+3WNHXXQJ+f5O8CMLL6kS1jxD6eaPmgCp37Z?=
 =?iso-8859-1?Q?tunu/HGBQL/GbJOJOrnhyALkvefHueUH5leLEEChiDTGJF9EAJO2Sok7ie?=
 =?iso-8859-1?Q?ffmchzqXRvq69YVnpD7Rnb8wNtU4puBs/hm+uCcHJDGWtGFEctpUHvK7Fo?=
 =?iso-8859-1?Q?RlWBFqYzfs3vmp42WrAM4hRGnrNqDthcxjpJdYGn4mFdtpSwOOcgNUxwfV?=
 =?iso-8859-1?Q?QuJXJdMLhj2XrCki2JnvaUbesv/8SmKTkUUVhNNoqVbaGrhx2T0xipA8yE?=
 =?iso-8859-1?Q?GylfmCz6mV+GF2SFurN/UPmqP6oLAYID3FYZbb4B70cmyeBX79rr+UPV7a?=
 =?iso-8859-1?Q?7z0IDpEYNi9hwi6vLfXFYZk1j5mD7vdJewMxWo6bQC8zBNR01YbWrjV4Y1?=
 =?iso-8859-1?Q?XwxfAzGftUyZEt9wLx0gx1n9tM3rbQHeZs40rdFwVrGTPf31VZwFY+TjWY?=
 =?iso-8859-1?Q?O15nJsZSJe4hfhm9p0I7hx9PdYARduNqWPAzVyUJes0g2IwAVctcAFgOMh?=
 =?iso-8859-1?Q?jrGoGBUM8tgRwJA3+zMnGCOSePK8uop3vrrvQGvpm5ThMPt/9UzZP6+A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 583192c3-0814-490f-a850-08dbe0b1308f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 23:19:43.3445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3Ca5qBy7s3NJC7P9E7jJJIo59r6Qh42hZbf8PDNoer91vuXkIWkcXwu6QL9ZtOsx4HUGsFCenC9R4/TlTO1LsxAv/B/F+StRxaRAco8atA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5306
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v11] drm/xe: Add mocs kunit
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

On Thu, Nov 09, 2023 at 03:38:29AM +0530, Ruthuvikas Ravikumar wrote:
> This kunit verifies the hardware values of mocs and
> l3cc registers with the KMD programmed values.
> 
> v11: Add KUNIT_ASSERT_EQ_MSG for Forcewake.
> 
> v9/v10: Add Forcewake Fail.
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
> index 000000000000..5059937e223d
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
> +	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
> +	if (ret)

Now that we have a KUNIT_ASSERT, do we even need to check ret here?  If
I remember correctly, kunit failures immediately terminate the current
thread, so execution doesn't continue past this point.

Anyway, aside from that, the test looks good.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Have you already run this on a few platforms to make sure it's working
as expected?


Matt

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
> +	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
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
> +		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
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
