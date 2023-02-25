Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCA9C64ED8
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 00:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC0210E043;
	Sat, 25 Feb 2023 00:57:52 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8847910E043
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 00:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677286670; x=1708822670;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=O9I0bvrV0m238C6kHA5freFbwixzZzxU5KxaPBv/73k=;
 b=NUgm1vgQlbpqF95DUOp+NUzNfTayML8Ns6Tw84WtqYEOH/6v+Bq27UX6
 mzQ6Qyd2kvx4kfqeEHMnQbmdkWnslP+fwVVF0b19wbt1LXQpPP+uzTqig
 ArzluTZOZQuDVSAcTqXKSydUs9CPutw5CMOqNijaVcdwzpT0qG16NjZ90
 +Edh1aioEzJGdXyRLy1pmb7Ff2QJ9EzgWz9sBBadwTcvCUB3yPqiMqxTO
 9bRIc7mNWrtd5xop3Zxn0S7X+ZDyaGX21VTbkoHj/0iQrdrbpqG8BUNXO
 27aFW2gD6XXWUzv+3HKaFCkuJ8/w30d4QYFk0pfpWOajjVxSi3n+1XN9i w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="361122492"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="361122492"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:57:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="796913574"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="796913574"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 24 Feb 2023 16:57:47 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 16:57:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 16:57:46 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 16:57:46 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 16:57:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhW16JoylYOjcrB+yQcjscnV29FGRKRuWT2yZXop0TF4Lzvkz3rWhPy5tiFEkMRGbVLg9TCgAHz5jbhzI0gM27MV5o7LnjX78fu7b/B7vpYaGqck+8gpCNz485G8/Yzu5JT83PEN8sdLTOstOpfpk+PSEPm69GA6EXiFQB5wOc/D8a9OlEU9j6tYCXgXfBjeRRdVeoHozmI0Od5RE3Vz2l6lAkj1KENcsd+XVdvbmpvh6PWT6w3Zh5YvCtH1njSagIMUaMUE04B/mx0BNNECakIV/ojCGAmdK9JHklwjpfmar3T3l07sRrQtP9Wi//xXcaZ5I4hZ92O/1BhDeUSdtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lr73rDT/QlSz5hOGnHP8mI1hFcckLFjiqcgaPoj4wOg=;
 b=QrXmPWihDh8ELaj/4QvguzveydfDFn/TdNdLx1txErkWYju0QnGqYuGHmEBnXfMNWozE33qnTvnU0E35k3gaU2p5/hQ9gR1ePuhTivUIQqk7vZn0L6UnuyfxbbRjhGtrTzBFJCz+Hjh2fRL8d4cV/akDNxaVlEdWEbJdbdeo2NWwIrJllNngIrO0Qxy6TxtTi2WXMhXdGMmaco5A+Ku9uf8YYSkEvPz8yE/Q76UfZ/2x/gC2BVDaH1izO9UwvuaIEVvcmauC9CVyh5XLUaNzpOFirxRAe4tysoRp5hlrBdwx8ZbdlDMlJ+/vfuy/445cXr5/whJZERija3OZB+mCqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA3PR11MB7415.namprd11.prod.outlook.com (2603:10b6:806:318::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Sat, 25 Feb
 2023 00:57:44 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6134.024; Sat, 25 Feb 2023
 00:57:44 +0000
Date: Fri, 24 Feb 2023 16:57:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/ldBCnfptHLlRuA@mdroper-desk1.amr.corp.intel.com>
References: <20230225001548.1743820-1-lucas.demarchi@intel.com>
 <20230225001548.1743820-13-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230225001548.1743820-13-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR07CA0038.namprd07.prod.outlook.com
 (2603:10b6:a03:60::15) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA3PR11MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: 45df7254-487e-453b-78fa-08db16cb4d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 123W7+ANasOlVwCSafiubz9tOngzm0AsGhmek9ukzNzTHzXHUPF4TUPDRfugq5bj7UYz7H0mn9e8Hf3vBBVzx2MV2akm3XAUOT7S2hdp6ZyGYOagVMXD80UPjwCgT62TecPkpoaUr3Fw1PBWBCYVn0OnAeHkuqp9AaIwK34b/W+QUaVaZTVkVKV0CKBrCbM1SDJ8b3s3BkPsek/IjuOnt73vL/U4yBi+6PpS66Xm9aj16XQdoFgaiTFAGlNP7A6nw78HO4OlBtn/RQEPWxG6jb4BC/oJGO/lkn/ep8IbC09FIlJJAZfSdkmY7p0NBzzuiqzoR4eOcy5w1KGwFq2zh0DbaWWVjZKNNNaWi7aC0PvAWP738CsECSkRr7E60iXZe2LvpZwA7nsU4M83OFgLslCW883UOdF47G0Ja2an7Na8aF2+FJw4Aghvt/oz5pThEmMwYFwAkF7qs30l1TNVC4k8fmVorQX6og0YwiYW6X0FFqO/QVoXj73KOKnQ8NUcI8FgCH+y6arVhdPRmfpON2G3x24A7fBSC/EHjjk7y66j3NTjCxk1pj2gIiak+DelYR7VcZVlvaDf4mfBm3gi0a3FSi6a+ScYTIol5zVxPJ/eiDfg818m9LrEsHZ4b707vnV5r7b3mIXnplIRML8xiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199018)(2906002)(82960400001)(38100700002)(66899018)(86362001)(478600001)(6486002)(26005)(186003)(66946007)(8676002)(54906003)(83380400001)(41300700001)(6636002)(66556008)(66476007)(4326008)(6512007)(6666004)(107886003)(6506007)(316002)(8936002)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sz9O634nK3GrxtJnG7K6FqeEELcoknm6tuERjW40bd2VSldpPqte0i3jET?=
 =?iso-8859-1?Q?5DTmriaZ0iaSMZDJ5fi/uJXUPNYOALkEd79I2EX3Hj49DsfVJtWW7N43cu?=
 =?iso-8859-1?Q?WeGQuZzYGZrocAH3BuFqTT667nqwKiylQ7ZNqTzbFeWRnFQheAyw03lko8?=
 =?iso-8859-1?Q?D+Jxgqbfxayopxm7lwF+SdzjS5XxcuPgGko9ogsfkh2VoKyqV3V1rN58xg?=
 =?iso-8859-1?Q?/ddt813ap+BWVm8vm7uOa6meEWlKYFwbbYMbpSOT0GYC6Ugol4rsZ8l79K?=
 =?iso-8859-1?Q?HxrELWrt8Av6MjSC5ZDOmIwIBac7+8ODJ5A6iRpQeFmYP67aEFQlnIyu7+?=
 =?iso-8859-1?Q?Qyn2jdEJ4K0wD+VdPfje0HhS0X+sXrMajWig11WVfVZs8AocXvBrj3WR9x?=
 =?iso-8859-1?Q?fw7QXbF+UMijhghXKC1OxwpU9AdI2PlappErRt15dq99QCnVyHbdtl4ejp?=
 =?iso-8859-1?Q?0te0tO5RQ52LKnj+njAGNMhAyvfgiP0JcWQttezOPtTh481eiY/l59Wt70?=
 =?iso-8859-1?Q?rXCzEBx0ie5B6eTpYQeSSHMSGsvNofv2cwS7SXATSg5OcvX6stzVUTCfHN?=
 =?iso-8859-1?Q?nAywdl+2VRC2/XDrDpil4xmrajZOgrsUDGSpHeLTsgLFvmtfYrx+H6Ic1A?=
 =?iso-8859-1?Q?fofjRQ4wFc8vYIIB5gIpT1pBqFnWYiy+0GrqoqzWj0pinFL7igKC2/hfzH?=
 =?iso-8859-1?Q?/3Xk91VSFKOX67U3zyoGw/LPBKxTYZn5TjW4o7diGPxyiup3J4XcMvzdz5?=
 =?iso-8859-1?Q?AQc0lSqPgzIq+PbIxQeKduzNRBZICDAXamtCeBZADH7SD7cFwMfQV74JMn?=
 =?iso-8859-1?Q?BkFpXt7r+zR3DPn05MJMeAZL0Bx06v0BJ3OpPh5gf6Xih2yY9R8E3TqWtS?=
 =?iso-8859-1?Q?C0uibhAUgWJYulYQ6Zxes4RnJDhRZ4UiHrXLSs8FA3drJiVS1MI0EsCGET?=
 =?iso-8859-1?Q?P3Ae3mjWNWhyOf2xaN3ruSU4iq20g5P4pBHEDkyVqAZqqk1wkxhuktA41V?=
 =?iso-8859-1?Q?JgBhJKhvfPkrEFiUsIpdiGFfnHuNQoPXTrSaaYzSUaN+NQfDOEHQ7bfaj1?=
 =?iso-8859-1?Q?5JICPSAKtuSWe7XLhTdXtkivYvGRPVxcEbYPA1NnsUdNQO9THg+Efp6caQ?=
 =?iso-8859-1?Q?BeRu7rAUDDaKxS0afgeOcZw13jcYwqXp5P3Oft0juRqvhOI6eTf5xvoPzG?=
 =?iso-8859-1?Q?3PtllcfYcyCBAwCCRYDPOsFwdEPLNRtBe5wcgmjoLnBzwShBJkLXhAMuKT?=
 =?iso-8859-1?Q?bfF3IWdeXhDAuOX61frof6DWHw8VZD3cUDbGn8PoGP8kPdtTwDXk1C1mxt?=
 =?iso-8859-1?Q?2BIlKOU0ktGWi7Tf7VVlGwD74jaojDZoQL8mdJi4ED6pluATc0IwxHJ4iw?=
 =?iso-8859-1?Q?oQHBPt1cAvErTgqDDZfDoPuiIEHCL32RKMKP+jCrnJpvW2HToskBJR3NFD?=
 =?iso-8859-1?Q?dGQ/HxePzlc5+vNkr3Cx5VL+7mRTZg+pFFd37RuJ/kEySUqTzWOAjmkP8u?=
 =?iso-8859-1?Q?oOCXGo4Jg66OCJOAoxr1egcG1MOc9IE5otavE7et4cgvXVXGY1o45i2JQX?=
 =?iso-8859-1?Q?jgUQ9IidpEWFodJnLX3+S0oDNfLQOqBbwe5TYLm2lJohwjkdRbFT5yJPug?=
 =?iso-8859-1?Q?2ZcoZPtVaoXZiULxAUnCzpSJ95qi+vNXnoSvQSgx6G6CEtkJjBJmbudg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45df7254-487e-453b-78fa-08db16cb4d91
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2023 00:57:44.0640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOqkADkGnpliWuMYZo7m2t3XMQSP2+8DSV9EILX5uKdkGBktnxmKb33+UBj45jsSRhd311S/gOFGWOOT0ElJbf3BCqxABVotg38MDgL02Xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7415
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 12/12] drm/xe: Prefer single underscore
 for header guards
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 04:15:48PM -0800, Lucas De Marchi wrote:
> Keep header guards consistent with regard to ifdef used. Prefer the more
> commonly used in the driver.
> 
> 	$ git grep  "ifndef __XE_" -- drivers/gpu/drm/xe | wc -l
> 	8
> 	$ git grep  "ifndef _XE_" -- drivers/gpu/drm/xe | wc -l
> 	112
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_bo_test.h      | 4 ++--
>  drivers/gpu/drm/xe/tests/xe_dma_buf_test.h | 4 ++--
>  drivers/gpu/drm/xe/tests/xe_migrate_test.h | 4 ++--
>  drivers/gpu/drm/xe/tests/xe_test.h         | 4 ++--
>  drivers/gpu/drm/xe/xe_gt_topology.h        | 4 ++--
>  drivers/gpu/drm/xe/xe_map.h                | 4 ++--
>  drivers/gpu/drm/xe/xe_migrate.h            | 4 ++--
>  drivers/gpu/drm/xe/xe_res_cursor.h         | 4 ++--
>  8 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.h b/drivers/gpu/drm/xe/tests/xe_bo_test.h
> index d751a618c0c8..0113ab45066a 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_bo_test.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#ifndef __XE_BO_TEST_H__
> -#define __XE_BO_TEST_H__
> +#ifndef _XE_BO_TEST_H_
> +#define _XE_BO_TEST_H_
>  
>  struct kunit;
>  
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.h b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
> index 4e9a8bef5751..e6b464ddd526 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#ifndef __XE_DMA_BUF_TEST_H__
> -#define __XE_DMA_BUF_TEST_H__
> +#ifndef _XE_DMA_BUF_TEST_H_
> +#define _XE_DMA_BUF_TEST_H_
>  
>  struct kunit;
>  
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate_test.h b/drivers/gpu/drm/xe/tests/xe_migrate_test.h
> index db1f8ef035bb..7c645c66824f 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate_test.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#ifndef __XE_MIGRATE_TEST_H__
> -#define __XE_MIGRATE_TEST_H__
> +#ifndef _XE_MIGRATE_TEST_H_
> +#define _XE_MIGRATE_TEST_H_
>  
>  struct kunit;
>  
> diff --git a/drivers/gpu/drm/xe/tests/xe_test.h b/drivers/gpu/drm/xe/tests/xe_test.h
> index 1ec502b5acf3..00c8a3f9af81 100644
> --- a/drivers/gpu/drm/xe/tests/xe_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_test.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2022 Intel Corporation
>   */
>  
> -#ifndef __XE_TEST_H__
> -#define __XE_TEST_H__
> +#ifndef _XE_TEST_H_
> +#define _XE_TEST_H_
>  
>  #include <linux/types.h>
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> index 7a0abc64084f..70a86538f742 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2022 Intel Corporation
>   */
>  
> -#ifndef __XE_GT_TOPOLOGY_H__
> -#define __XE_GT_TOPOLOGY_H__
> +#ifndef _XE_GT_TOPOLOGY_H_
> +#define _XE_GT_TOPOLOGY_H_
>  

There's also a matching:

        #endif /* __XE_GT_TOPOLOGY_H__ */

that should have the comment updated.

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  #include "xe_gt_types.h"
>  
> diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
> index 0bac1f73a80d..032c2e8b5438 100644
> --- a/drivers/gpu/drm/xe/xe_map.h
> +++ b/drivers/gpu/drm/xe/xe_map.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2022 Intel Corporation
>   */
>  
> -#ifndef __XE_MAP_H__
> -#define __XE_MAP_H__
> +#ifndef _XE_MAP_H_
> +#define _XE_MAP_H_
>  
>  #include <linux/iosys-map.h>
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index b2d55283252f..a569851db6f7 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2020 Intel Corporation
>   */
>  
> -#ifndef __XE_MIGRATE__
> -#define __XE_MIGRATE__
> +#ifndef _XE_MIGRATE_
> +#define _XE_MIGRATE_
>  
>  #include <drm/drm_mm.h>
>  
> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> index 365c8ad7aeb8..4e99fae26b4c 100644
> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> @@ -21,8 +21,8 @@
>   * OTHER DEALINGS IN THE SOFTWARE.
>   */
>  
> -#ifndef __XE_RES_CURSOR_H__
> -#define __XE_RES_CURSOR_H__
> +#ifndef _XE_RES_CURSOR_H_
> +#define _XE_RES_CURSOR_H_
>  
>  #include <linux/scatterlist.h>
>  
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
