Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B91C48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 21:10:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC99B10E7F9;
	Wed, 21 Feb 2024 21:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWIp6lOv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E94A10E7F9
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708549804; x=1740085804;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dmSnZLvdlEFX0Yro1R0hqzXl6WEH2KV99kKGvFrGUco=;
 b=ZWIp6lOv2SRoIG/zxKfXwHNT0l01cKSYFSTWAfXatCcJ9LvN83mUWEKa
 rDlGYcEmvQtz2CMLOHDJHCPOCc/oLbztFq7T3+rQhx+oZesqDzXgW/3hP
 6H/XvAZpqlBkdL6K9hqAE/UZ9MgZX3K3cEFcOt6gyNDuFICh1HXTZXYfT
 ZCGY/hO6XyLhqGClmPa3YXARIPm/HKOc0gaqxPD99UnszZyV7+t6fUokd
 Yg2qDEHJd5yNhp1cBRZXBWS/WnMpQEVZo9qTnJ/xQ85n4WphwQa66L77Z
 FKbwavQJnyYFkycukjVN/doM8w8KFmmwzbv2J1DfuePT1yFunbGpZh8Y+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13865539"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="13865539"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 13:09:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="9933523"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 13:09:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 13:09:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 13:09:56 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 13:09:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRw0IxnNrzMzM/4wIXGY7vIh1TFft+2TyyzbvCUqywaw+hgp4uQj9cTHDQyhSyWn68i6xr8y6ncZ9k6D/KfYEdAQJtH1do49hT5dz+BufanYZKPCQp95EcAQhvfTVZXbKsjoNT4ILNAiHSll/U+UPncfw7qFW0/ruKdQNCQ9RnXUCIuoX3TerWpt4vlDUmsKUhgRCHwfzH5JbkhDR0qOK7PX36OPE8efZTM8NaPxzhQbv27W2NOmF1YwAU50w3XKrxAvwZsH91BTfpYebvVsQRfG1PIQ3bpZf7Rtc8jxps4TPtaZSmpn5vhme9ZQsiVuDG2s1f+PAiHloUw7KCp93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/WjuB2ciQv2IqTULqADxDd6RbKsckYhvfzIr1xAX5A=;
 b=f7vY25wQo3O1I+NoB5BE/Heo+shG6cKhQ25o0FCVzhZZDmU6d7fGzg5a4HFoPwQ3/sPoEHThqUeVOh5dodt5yHNOkqVvpFO3KzawYIVKbQGfqz1EvSWqOIgWYGoRSd0kQ/wnXJhjcdcVCfnoGecxkiMakoqJ1zSYZ73LJIJjPvXAs0RYc6v2qCnRaSmm/o/zePlJ5Q9dfCP1L/0PDsexzLC4la/1Tve8mYO/PnZVjJdiP229TiQkTIs5j5dr27zaKxazKfVgJ9xYmwhbKQF/TyB122NfQcawo7+PsdZbdsz7DSg0cUPXOzBGe55lWipT7ZxoSvY0jjCYPQ1j573c+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7874.namprd11.prod.outlook.com (2603:10b6:930:7c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Wed, 21 Feb
 2024 21:09:52 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7292.036; Wed, 21 Feb 2024
 21:09:52 +0000
Date: Wed, 21 Feb 2024 16:09:48 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Group live kunit tests
Message-ID: <ZdZmnOEx_EzNIEvI@intel.com>
References: <20240221055038.2071063-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221055038.2071063-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0299.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd6bca4-d01c-4bc6-090b-08dc332171f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HU6qpodGRxnB0oPo2BBF8rQHMYEjO3rblb317Xg7NVR6g99LR2r6SfYLrP8+kredFQx/veXrwdvh19x/9XJhAbsnETtf15Y7CcWahyufupEE2dMZJaILdIuZ+cBjOGA+iHd4MiuzX6lnXbfmimXyVocL3aF3Hq0sJUdn2XqA8z+Y3sQ9KQF42E9s5vjOWQ4sKFS8Xa+J0e+VG5UQSHRSchFfep3m+6Ys3KXH2++FxBqISEBCLlHmvqs0gGj+DAKl2Wo/3Kja+huSnCM/QZGlnweK46QQv74FzIG6ASevw+ELon20qMKdGcScf2MRF2Usf0jdah03mnRw/gJqvOxVWZMmvYxVam693Zlsfw39cTSv5YEgHZtN4/CLosFsY/1WD4G2rXhtC/3teBP6ppaDevo8R9dVhoGfklUeSjhFtRzmEsq6WVkuRutB9TK59TsvHyaGTKpTZE3KbFkgQFoeDi/VV+THPj0YwOyWiZJ0jMHjZlP6/p+Ej+Z1F9GQFx4ZTLB7OfxW1QtFm4ppxiQEZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+qCLZyX8TWg+DyOSMv63Rwx8gtbVcJK1Sn8fQH9jb6UPRz9ZPewyxrCCOY?=
 =?iso-8859-1?Q?/tIyeEmm6ZJQsHBrOGoHBboTm4CV9MJokJ9E8jO0MSEyFhxXQ1V0/sAg73?=
 =?iso-8859-1?Q?J8fbLNvX7KYT7iH1TckXbbEWhjVwwmbhU2739TIT/ZD5mtoTyKrITN+jXj?=
 =?iso-8859-1?Q?SzDsoXx2t7RufpVui1eElRzFfWZdPLH155KmndVRqH55rXfsRoJ98C6CCL?=
 =?iso-8859-1?Q?oo1oXKXNASk+VMbHLkqXYEeGRwGqsB8dkHKEtgCLmZHGFByOi9lup8VYkp?=
 =?iso-8859-1?Q?rc9EomQKWHlXEpd+cun85XmgEl4m9TnuT5b2YF932xQc7P1Jt01KVspPv1?=
 =?iso-8859-1?Q?iZYeCurXKkpZHGJ6NvOwSwYfyI2DW+zqluB2aCTj5H2WGtpKlp3oy8eru4?=
 =?iso-8859-1?Q?6I42GJZH1BP9rg+AenfEY38OpX38QF6nVMJWn2l7zGz2/GQk3VyJ/h2m2P?=
 =?iso-8859-1?Q?GKOkNXPAYULowUMPKCUlynf9n599WclJ0vEBRRrV19Dw6YkWMtfohqXW5M?=
 =?iso-8859-1?Q?OFgbF9lmk8vcQSAiE6or9iQgUU9oiV9sjEdA4SYDKrfiHGnz1ci1zIs97B?=
 =?iso-8859-1?Q?Vaq1d0lKbKKWYTApWK4T1gKuKR3LJoG+jruaun11h4F+rsVsZg1MbHX/pv?=
 =?iso-8859-1?Q?poHeTY0/Y/cTzXWNLLYzqyHekPayOpq1rS+aqNsPAgMe78mla7fATTxkPF?=
 =?iso-8859-1?Q?zcACIvd6G1MzxhrPsUvyMFZKk6cDklAssaEvy/zLMLeONTot1tX/AB56b3?=
 =?iso-8859-1?Q?H+4Z9nXbsrga5bJT0P7LE6XI+ib6EkyuIjvWSscKc0xZldfEy9UlO5G/yQ?=
 =?iso-8859-1?Q?rMpEheZqvQNnPeo2CTRXCXcHFmRalFnZscy1oPdaXMMNAnyUIgnbvW14hS?=
 =?iso-8859-1?Q?VFhZrqeX0nikMIMBmUOqtTlf261FeI6iD/nfs3d0e9ucOR/ecvHIRQ19KM?=
 =?iso-8859-1?Q?kEnv6I7ZJ0yK7Kx5ML+sWctCfG1E+2ZiD8L9me85HE7+6TGNWnEvkJX8va?=
 =?iso-8859-1?Q?tVZR+IO+IU/X7iSa3X/HE8RstEMcEaOvLuyUIl3aG74QBoPjFq0Gk3KDG/?=
 =?iso-8859-1?Q?VjkUUvPb3mncSY7ejWhKgYdf1Tdcc4J+vE1qg8ZnHhVXtbwjQkBFyq76Zc?=
 =?iso-8859-1?Q?viNwtR89dS2YSo8icVJHGikfETJpF4MU45OS6t7BIwf2m1ftu55c8XvnsZ?=
 =?iso-8859-1?Q?/Nwy4jt8ea5UAwS4wR+H1teRG5t21J9Iqkfzhge6LJu9yjqd6hOuqrbO4Z?=
 =?iso-8859-1?Q?+jB/RppRufXwY5B6gnPdjqMtM41jTLFG2lYOKaH727xOS1zNBd2Y0+1gFC?=
 =?iso-8859-1?Q?gGj7MZPlONieamWIJtT2Ddu0R3XJ7VMuzAVNbrYm8g66YFBgX1tej8/Yqf?=
 =?iso-8859-1?Q?9U6e00sfTL99a882BAEEfuU68kD4wFDC8F6KaUb3Bu71KbbmYpMwsdiMYV?=
 =?iso-8859-1?Q?CzCEfZqtzP7VvnJ2z9sZLFaXA5tXnl+Zfgs7kYUBh2oewp4L8SROtoCBNI?=
 =?iso-8859-1?Q?6gj7EteVupLhOHjG+tgDA7Mdkzhy9/baM1Jx9zUURTX6SkPhNmBjHH89oZ?=
 =?iso-8859-1?Q?W1joFtaSgowmV7jwfc1LpV11TKz2ss2mVgp/d58m2RPDf/t3MoVmxfpU1p?=
 =?iso-8859-1?Q?kwLgoQoky+WM/Z7bXiV2VK6pjbF9QtxJ7K?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd6bca4-d01c-4bc6-090b-08dc332171f4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 21:09:52.1596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2CxdwVLhkWz3CXS1rKOV+9PctarplB+Zyc5QV5TTpyV3LrooFSJkapIZj0jS2Fo6Fw7fhjIAScqQZ251xmXkFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7874
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

On Tue, Feb 20, 2024 at 09:48:21PM -0800, Lucas De Marchi wrote:
> As was done for the normal kunit tests, group the live tests into a
> single module, xe_live_test.ko.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> Rebase again. Now the igt changes are merged, with the exception of the
> oneliner (extracted from
> https://lore.kernel.org/igt-dev/20240202004529.552806-3-lucas.demarchi@intel.com/)
> to actually do the rename.
> 
>  drivers/gpu/drm/xe/tests/Makefile           |  3 ++-
>  drivers/gpu/drm/xe/tests/xe_bo_test.c       |  5 -----
>  drivers/gpu/drm/xe/tests/xe_dma_buf_test.c  |  5 -----
>  drivers/gpu/drm/xe/tests/xe_live_test_mod.c | 10 ++++++++++
>  drivers/gpu/drm/xe/tests/xe_migrate_test.c  |  5 -----
>  drivers/gpu/drm/xe/tests/xe_mocs_test.c     |  5 -----
>  6 files changed, 12 insertions(+), 21 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
> index 9d1d88af8b2f..8cf2367449d8 100644
> --- a/drivers/gpu/drm/xe/tests/Makefile
> +++ b/drivers/gpu/drm/xe/tests/Makefile
> @@ -1,7 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  # "live" kunit tests
> -obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
> +obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_live_test.o
> +xe_live_test-y = xe_live_test_mod.o \
>  	xe_bo_test.o \
>  	xe_dma_buf_test.o \
>  	xe_migrate_test.o \
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.c b/drivers/gpu/drm/xe/tests/xe_bo_test.c
> index f408f17f2164..a324cde77db8 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo_test.c
> @@ -19,8 +19,3 @@ static struct kunit_suite xe_bo_test_suite = {
>  };
>  
>  kunit_test_suite(xe_bo_test_suite);
> -
> -MODULE_AUTHOR("Intel Corporation");
> -MODULE_LICENSE("GPL");
> -MODULE_DESCRIPTION("xe_bo kunit test");
> -MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
> index 9f5a9cda8c0f..99cdb718b6c6 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
> @@ -18,8 +18,3 @@ static struct kunit_suite xe_dma_buf_test_suite = {
>  };
>  
>  kunit_test_suite(xe_dma_buf_test_suite);
> -
> -MODULE_AUTHOR("Intel Corporation");
> -MODULE_LICENSE("GPL");
> -MODULE_DESCRIPTION("xe_dma_buf kunit test");
> -MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> new file mode 100644
> index 000000000000..eb1ea99a5a8b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#include <linux/module.h>
> +
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("xe live kunit tests");
> +MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate_test.c b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
> index cf0c173b945f..eb0d8963419c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
> @@ -18,8 +18,3 @@ static struct kunit_suite xe_migrate_test_suite = {
>  };
>  
>  kunit_test_suite(xe_migrate_test_suite);
> -
> -MODULE_AUTHOR("Intel Corporation");
> -MODULE_LICENSE("GPL");
> -MODULE_DESCRIPTION("xe_migrate kunit test");
> -MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.c b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> index ee40f31e1e12..6315886b659e 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> @@ -19,8 +19,3 @@ static struct kunit_suite xe_mocs_test_suite = {
>  };
>  
>  kunit_test_suite(xe_mocs_test_suite);
> -
> -MODULE_AUTHOR("Intel Corporation");
> -MODULE_LICENSE("GPL");
> -MODULE_DESCRIPTION("xe_mocs kunit test");
> -MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> -- 
> 2.43.0
> 
