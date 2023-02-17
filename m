Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9EFC05027
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 20:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3D910F0C5;
	Fri, 17 Feb 2023 20:13:34 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4314410F0C5
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 20:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676664813; x=1708200813;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SQcp1X1fzlmjSyy2zgS2YTjd8QOTV/J9xH5jQLdkIzo=;
 b=fLBvdkq0Ad1tL3fXs/XlxNJNQDPqYMdM1Piyb0P4ULyD5r35MprLJwGo
 GlMk4WYTV0w1WHcy5HLQpKWKZxoIt6Y26WCqDxEvfKR17sQwUI5A64i4u
 8fB4P4hp/vXzFuBdLBgFSnsL4XtKB6tS1Jwhvat6GS3Bu8nxuN83rztBV
 mqABX7JwvqXTl7pbPKHIMfrSjSZhlpu5odjI8gQdgs8Dqf+OONEuYshum
 /BV6V097YdAYyJc+dO+XTYRgctOBrS4WnYqwXxc66biqC/qaIB4JL6F+W
 cXG2S/EzKZMvwhmIsur3hpNzF4XyqabYQq3leUVnSOnaOckjmymVrbKaj w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="396758247"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="396758247"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 12:13:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="663985930"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="663985930"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 17 Feb 2023 12:13:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 12:13:32 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 12:13:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 12:13:31 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 12:13:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knihtW5Z0Kmrj6SKJnOtSnXh5PH4v7fzdBM4SNM1brE4WNt6awC2bmMHIcw2+k5AMzJ9t7c2OWG1F43DyopM7VKGSxcQlZWn2j5pqTjd+6qILmT1TxgM0wrdgjwXOF2S+fjb18mIbV6D8/3gzRuraXx5xzqQcI/spUShf2tQEJ986PORq/zrYowUOdRujzKA+giovmi1FYq3HvPUp16tiZMHtOTb2vzFcqO1qkwUEH6+rgTbls2iHoly/YOniFXeQktdt3rcf6vZgYHHJpgWU1HB2mJFpNrlTJSA5PNmz6nKmJGgw9VQk6Gu8NwtBeSESHt1kj/iGp/tNCdSs0FK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmRJvLvgaAY8sF1NqDKbzBVM4eCoHDBI6hLkrzW7tx0=;
 b=jy7IQ5UpcvK4Aq6CDKVYov+OGDHMceYNHMf26k7b63/58IE9tmOS22xpVJ3PwzlFewspJGa8PG17MxJ8PbYlbm4/R/jUayZzUw2r+CnqmuLOLk8+EpHVX1STfOHJYEqWNzh/l7TIn9ZqR9UqiNdvvuwCSi6eh4I9pcXx3cWsax6j5zTj5Y7nEgp+Gs5oTGzjY8uFGtH4vdn+Fu+dkdmbhcAHeJg6bEtj3wT32EoOCYQ6tdW1PTijX9siW0AerSwyBGfPINj+4Cb4cw7tTu/kBSunsEKXy2khwSGZD+adCF3XqIXr8utekhYshwbq1iwPgw4zEwGAkWvFYNh/a3euYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB8099.namprd11.prod.outlook.com (2603:10b6:208:448::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 20:13:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Fri, 17 Feb 2023
 20:13:26 +0000
Date: Fri, 17 Feb 2023 15:13:21 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y+/f4exj5zsADnzP@intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230217005226.106499-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR17CA0039.namprd17.prod.outlook.com
 (2603:10b6:a03:167::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7d0dd7-65cd-45f0-f70c-08db11236d49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tfZoPfTRcjxG/pX6VGqUu+RGNWdiBtRok7mj/8jgvRy62zu0NffspKUODE2cxpVU3ejrd7F01mX7vwCn5/V1S/qNnoDSl9Qgmlephbjfh5BtlkIzegAe4M0SpRy6YMfph2kTzLApn1YT7rONsbcWlhmyyShIvytowogqoY6/VO1drxS9ETIoOYinw45V/wie0TYBrWGzYjfEMP0uBQIdn07MvVruw5T7HAGUqxz05hV7UKXZykTRj52n64auRgFiBtiaca5e2BiR1rV5R8ee5vbRsAEiBFG9L3ZArMzdSppQKDuKM1A+AJ2yM44LLQbnq1IGfGKGTC5xoMizyC8iO7EW0mvVy3ZB1IXfRgCaXKKdH9UTLUauGHvAcNs2Ph4hGHsB87/MHYXmjBuzL9yt3sa4azz4/JV0wBSPjuQN0T1sSB7nM1Dc+DGy26O59EqzKFrDYvCJF4rJbH91I2HlPjq0KGbezQjRo8wHidU8YvMVSrjAZQ3amtkKgJE/SkOVxlxeOuzyPJFt8GSQUlsKDQvOtAOBB8EfLrHdZY/NzV755hEMTfAjgzQn5VXFeB5OdBA1zF/WH7LkMVNmE1/Y1Hdu1hmJcM4cU6bihN5wOttbaO3qnCuu9M67wgejMpfjCOJKw23iH8l0Y2zDR/TcHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(39850400004)(376002)(366004)(396003)(451199018)(5660300002)(8936002)(66476007)(6862004)(66946007)(2906002)(8676002)(66556008)(4326008)(316002)(44832011)(37006003)(41300700001)(54906003)(6636002)(26005)(6512007)(107886003)(6666004)(478600001)(6486002)(36756003)(82960400001)(6506007)(186003)(2616005)(83380400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oHdvkLLeBrZiJHCBHqo6oxGebOF9cu8eXblu8ZkoCf5nPHQcvCC+JOOmMWjy?=
 =?us-ascii?Q?CIb8JtTjxF+eN1d/a/YOK+MOodEVTaAuooj1zzMwbVSQOwrNnsvnhuaXEbM5?=
 =?us-ascii?Q?bkqDYtMbT1WR4n3KaTtgYVHDMuZuQsmR3F0C/KT0GRwZJkSTawXa5TuL3TQU?=
 =?us-ascii?Q?gGAo0evujlTAU+DIol7gui8yAeRbLI/zV1Hidr37dDrjQabn2UcmJReDR41s?=
 =?us-ascii?Q?w4iFg4hPWHmSkdoYx47JNtdbcHlUhT0XaVbITg0ckMlYlfbXKBq5eOgq6s5O?=
 =?us-ascii?Q?Nmd112h8cNsg18cRcj9M0bADzGsARQWJzbJHWHQseeSfgFgpyGx2y9r0irY5?=
 =?us-ascii?Q?2RePdQ0kZROJiXsOUpa1QacHxdCVwck3uVSW7xBDkO5MkJfagBbSQ7M6hksm?=
 =?us-ascii?Q?NL3TI9cFPIlU/h8RTJ7A4dm083NMWdQ+nmJtsI310rwyCuDWYnckLPYnbtpU?=
 =?us-ascii?Q?lMkmNh0axrb7ZceQqEz05NEA0YhspXcgl8VrU56kfuk4Iict11DOnWFswMZm?=
 =?us-ascii?Q?cFmIIAV5ytL29keqyMPyaShdZqFwW0b98V2VrlOVvXOTUT1ANfRSivKLsnqq?=
 =?us-ascii?Q?ftPQCKWgajD0SBOIi7eWFvHWBRMByHtQnmk5ja26sK9NONGnUKEyAHrv18SL?=
 =?us-ascii?Q?mawQUluNrGdmHbFFm9A9cAOhtll8c5jXZedB5lvP3V/hMB1M3vu6alI5BK0s?=
 =?us-ascii?Q?QOqug6fzJVouJwhAeBXZb1lhikhOQMTK/6mli4gVDuEo1FyEzL7cuPN6iF8T?=
 =?us-ascii?Q?GPqNxNdsnyNquU1LVct0Ylvj/wngs06+ItJwuVq1TZKxlUtIECDKAGqDtqae?=
 =?us-ascii?Q?5TMQtZOgvCw1UyyUftZZe4+f26rsBLNQ121Ob0BObclq0M1Gs4qsmDqNGgTi?=
 =?us-ascii?Q?rv5nh76tMHgB98Ik8yEJMRufEj2MSbbFcEn6nvYQTE/pUB8/bXCbpJjcUKk7?=
 =?us-ascii?Q?7zPrLtmCZ6MTHlmwfofODQzExNdDqq2ozHxZh6O+De1iVgxKL2HSVqjAFKFZ?=
 =?us-ascii?Q?9i9s3cF9f8dsqKfV9v2nKJFquTP/XmEPfSI/HdLCWaV8Ako5DBAJZ/ukuqGg?=
 =?us-ascii?Q?+M4efnrGXv0ZSH+owpeM6tY19uaYBc0xMVMqYePiiWw7DhhevdOYs7FH0bVm?=
 =?us-ascii?Q?hEwTsyIZ46FJ/REcMwfZIzC4eeHzZnlOnUG2jTsKgOgDGhbAfn2m3MFhs8Bw?=
 =?us-ascii?Q?LXD9lDrfp9/hMv+b2QZPRh42bo+7TFoq515zyWfHbETimOMUOsne8XjxbbMA?=
 =?us-ascii?Q?hEi/ubzD7winFlqyCl3kKbLunUYRJsYO9hEeYuUKE8D6p9MNH4KNvQpwUqkU?=
 =?us-ascii?Q?zxmkrGmBST6GvxThYIEn0Kk1Nv0TRWukkRImXNYss88IB1yUGTpLXyTsybw9?=
 =?us-ascii?Q?B1lQ/GgNAIrxkQS0EfWNXGiDwfxLRgOqW2a4f/c0l/wg/YzpfBqXQAovQ7mG?=
 =?us-ascii?Q?j2lAjPJxHrcxNXjM2J/IMqUihCdhoPH/Jw+YqueV3AZUxPu7dZFDg5wNME0u?=
 =?us-ascii?Q?osn97yfgYsEASoBIfT+/duep1qerwzJwc3lshUf9ueorUkRwJKcMAWgV9uVE?=
 =?us-ascii?Q?E7rupxSy030Q86Ci+QuJKkh+VZZUrRV5uagJZEFxfKhCWoDqnV8ax1qZ30ss?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7d0dd7-65cd-45f0-f70c-08db11236d49
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 20:13:26.3598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tx4a8SzNX/V85LLm/erwExr6pcUMdbGfKce26L6ysZc+1GyRn8oRVExMH4HUR0gagHsEIdQtuwqtFuKXK9oZfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8099
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 01/11] drm/xe: Remove outdated build
 workaround
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

On Thu, Feb 16, 2023 at 04:52:16PM -0800, Lucas De Marchi wrote:
> Use the more common "call cc-disable-warning" way to disable warnings.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index abd804d622e6..18257cd7227d 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -13,14 +13,8 @@
>  # will most likely get a sudden build breakage... Hopefully we will fix
>  # new warnings before CI updates!
>  subdir-ccflags-y := -Wall -Wextra
> -# making these call cc-disable-warning breaks when trying to build xe.mod.o
> -# by calling make M=drivers/gpu/drm/xe. This doesn't happen in upstream tree,
> -# so it was somehow fixed by the changes in the build system. Move it back to
> -# $(call cc-disable-warning, ...) after rebase.
> -subdir-ccflags-y += -Wno-unused-parameter
> -subdir-ccflags-y += -Wno-type-limits
> -#subdir-ccflags-y += $(call cc-disable-warning, unused-parameter)
> -#subdir-ccflags-y += $(call cc-disable-warning, type-limits)
> +subdir-ccflags-y += $(call cc-disable-warning, unused-parameter)
> +subdir-ccflags-y += $(call cc-disable-warning, type-limits)
>  subdir-ccflags-y += $(call cc-disable-warning, missing-field-initializers)
>  subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
>  # clang warnings
> -- 
> 2.39.0
> 
