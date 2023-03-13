Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F1EC6FD1F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 16:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2ED10E5B1;
	Mon, 13 Mar 2023 16:23:57 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26F410E5B1
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678724635; x=1710260635;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eWvjvkNan+GV0DyNigGSkrd3P07Fiu0ad6SPGNWN6PI=;
 b=iUleSkQwaTYvSvfjncNpulMpofcKUXdZaclvTrSZKy56NdaoYwjdopiF
 JGGuh3Phj6AKyoJSSgKEibYknE7yFpAuw6xLWtBfjvloHQ4SbFwyWfuCW
 lY7P64DFnVn6QB+tloPOUP9xCAKNgJQcNi07SWxK3oI1HNprkQB5s0i/9
 abyWz8fJUJdUru0VxRu6En+7mS9qy5Dd4oy2aGA7EFMARmFWio9xZq3JI
 0YjVFHNOb0gxSbolhM8/krAieB/8jd+iBTzf4ZIocNSSPoLutDlQyvd43
 7dWwytX5rhRea/0HhhamHmS8ZSLDJt5LYELLy0XRlUUddGzxM+rA5E7VB w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="337217733"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="337217733"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 09:23:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="802504970"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="802504970"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 13 Mar 2023 09:23:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 09:23:54 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 09:23:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 13 Mar 2023 09:23:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 13 Mar 2023 09:23:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9WWoqd0UndGEe8K+xwO9CO7g0xdCoW7Ujzc0hUaZLFDJ4ZTVBi1HVM+TNGrFsQweeVl2jN8CNHvEyzbkdXlzUwWMMb0EpJNpF6gIQZO0D0j30OdXYHjFQEr1RubevnY5J9gLNadVTlEwTYNO5+bHvmtdTo2m2lEXX+sXspajmAIr5SIZPkpizQz/R5uXc6kgkMJBSMFhuTaNDyjarUWzE64VsaFvMj3b/WLbtSYryRCDwwJngag1AGnUEN9DreTinir0LBszj1feYU1vcw+vaLzMfRi2OfifvbFAeyKfcjaJMCvecBq3E4uOvX4BvIZklTdgiNMohIQNUH1qaQrvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Y4m/qXOW9ajq+rLGoFyPFEZi66K+VsUZBB+UZUS+r4=;
 b=YFmFt3bJVUrsv2zqsMvZhJ8q5onAIvvI4gml7FVC1zxKPa74flAmoJvpygvhYcD35854D7aU+FGPmj8AfjTFfcNdykSfctB07foxVm3crAR9yleqyGuQ4ZZQqYtwyV0SlphqCH4Mosyk7Rd/pcpmjtcPjVkveLLBSvMZGBDsKYOiLju2YSkGmNqFCJ/DxEiQJzYQWhHutsoMOUKYOyBHUOp+D9sSEphBWs6E9c4CmAtyq9KPN6Zub3NqSwYC2VUvEpz5T6NBjJ14tI5wc1R4xP6JHJNeOg5OitB6GC0RzbNjhR49J1fHSx9ugOUaWxIWhhKa/n4DeEGiQDqcg/sJdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:23:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Mon, 13 Mar 2023
 16:23:51 +0000
Date: Mon, 13 Mar 2023 09:23:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20230313162348.s3cle2rpnvtgh6yk@ldmartin-desk2.lan>
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
 <20230313081316.2408-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230313081316.2408-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::49) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 389e3c4b-79f4-4be1-e5c2-08db23df5427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4NEtDbvashhqSvVsDphIAAgcRVt+U71W+UAlxGAQp9/74YJuLhGc8u9xayrp1sOnM72eivjbFLNIc4lFfPlwVco1E9DVJigpYzCD2VDO5prvl2fxKV3qviupwaUkPGOiSl5bTtwtaDvO+/90MfyM9r7JmhRyt9WfqVmc4k2nUOq8dps/8uk012ibsgt/OqrR16m79U+FOZAJUm3vo/FSP6L8KpAqP7jTiLWsTP0nRSup+4fjWRoDyj/m6sWJlsh3aI98+cbOzwHuP10Ai7p8BFKphC7YXxFBtZruorzJhKwIgPaqOw7AG2TfMTTOjlXDhnX/e39lqFTzdGZJhzYVLoVc/JkWhu8VV14tlyZvD7VtUjlohxlZMopa9Q8/OwmCnY4N6BRHtzt572ENogWffHG5V7Blq4iive/AH54SsdKKnnWf3dyQcqS7VjkIc3RWacVvHaMQcIJVl0Voq3CPnOO90+AId7oQnZ2ZwufzL61MqV/yhs4u7X93GauqM1q3iEOMP4SetA4++Rj6+SeAVxLq+A4wpCaGiZxTJC8idXQEcCHEnPLw+11DWJXzthe355SBv2z5oENfIqC1cjwXq9rroTeThfrcyrMN4f954H17+YsE5giKeT1mrOkcwzuvVGoz9yfFHs+qqeQ9NzpfLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199018)(8936002)(107886003)(6862004)(5660300002)(41300700001)(2906002)(66946007)(8676002)(66476007)(66556008)(4326008)(316002)(6666004)(6636002)(6486002)(1076003)(26005)(6506007)(6512007)(86362001)(83380400001)(9686003)(186003)(82960400001)(36756003)(478600001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oM/ppDjMufzf7ff13tTvOwVu2K79CzWOYztrIy3ej9TQyWxsM9xRxN8yel?=
 =?iso-8859-1?Q?UMX/AuALM6qdXE5Zvsmcvuzz6aStt4d/BwoiCD8Hzj1VYRZqht9ixgTngQ?=
 =?iso-8859-1?Q?AOIE+kvqiMXGSgkNP5Nwk5cMNzZZZvU/GZ/v7HQV4tNHhEn5OyyIg2zbTO?=
 =?iso-8859-1?Q?sxTM1kVSkevbFbe4Ica/vNA7K0TYdBhY3AJCF8PlVVT4CxXUJQ/eAuHfFO?=
 =?iso-8859-1?Q?t2VAbWmgwif5TS6FN7j21K1TC7y2dN+zpa4qa6NmpvaewlpGtKAGUpbCrH?=
 =?iso-8859-1?Q?qBccvK0IPmkt2QP5nV/0VYumYWvWiJn44Hl0RFICLtUum3DCsHwM8jJ54p?=
 =?iso-8859-1?Q?P5rYcCcFjgAqUBVJ4UqBBdODR+Tn4tzssDGtdZ+YhcD2Cop7Ig1WlIQQTA?=
 =?iso-8859-1?Q?WeqWHoMg632TzOTdbfVpxHn/4ARTq6WXzZ9I1meH1WWoLw1YUO2HJyOsGp?=
 =?iso-8859-1?Q?6qW19U9IwUGwAK047uwmB3VlWPXeVXpYPJsefmZ++zKFAvQ+y4uOxUJVJE?=
 =?iso-8859-1?Q?CZDFQD35TKURV7gAU1msT+vnU86aN4rNCH89OQfBMI5Vp8BuDwZBk6i7FN?=
 =?iso-8859-1?Q?7B1WzPwwj2guilra3uY89W+PaQaKhAtqRf2CQwiKVgb8gGEqSZ8NNmCScP?=
 =?iso-8859-1?Q?fz4GBJcqAgrDVthYvxUJLHg5yKCy00rQ4mFhCbyBqTnygzpXqPpLIIdHaF?=
 =?iso-8859-1?Q?9VC5yaFbHjh5mF+t9kSXVxH8miaFGo6APeecrKmjcUkpvIkWXMY+p2kDhc?=
 =?iso-8859-1?Q?jtL8EuozNooYZuX0RbryXzK/f3IVhBMgJDic8D9qINem0orsrz+m/XHedg?=
 =?iso-8859-1?Q?UGcI60rsOi5uCBmwVSyxYhPmeEURXMS+baj2FuRpBmvH5bm9G9qFFwvEW0?=
 =?iso-8859-1?Q?LBLyAlPUiuKgfCgA4S8n0uZpVWD1i2ZJ4/CbLO3Hme28LQHuoHohl+swh9?=
 =?iso-8859-1?Q?A5l/ZFO+Fwf3y2jQNnlzru4le5Ry1eOjDTxMkLeCXEieDZfwNvMDQgrfmo?=
 =?iso-8859-1?Q?QBz+iaj80z8mFgw8qf2fCm85SJ3fvFNlrh7vH70VmxcOL3rxdMlXgWpqCr?=
 =?iso-8859-1?Q?A0EFl87oDaJbYrdRFuRKXQgexGJdprvxdRu7Yhxpm4LeOJDNvh5UG2jwJd?=
 =?iso-8859-1?Q?n5eZk1mSmbQwJz+pAQftp4SIpDl6k5dEj68a/xtwzlM3o/5bUOhI97rXO+?=
 =?iso-8859-1?Q?YCVifFPCrsNnckJO7MYam7vPq0RpsHRaDZq3IePj0lF29BKpsNCRub/5cl?=
 =?iso-8859-1?Q?sJWp4O/rx+gKfvLbd6pSdc49Xf3nhUGosWRVxMQZjnuzvHvIIdiURbk3M3?=
 =?iso-8859-1?Q?SMSwoVNjVlRfd2D4fpX/VrPcGRZxSNASTRYD9TSX190kpihkm5UyVhDntx?=
 =?iso-8859-1?Q?RlEOWiX2TBflpS5o795ULvcu3WLVDyjzLjmj5MjTKZ0Rf8/CAKd+ndeEGb?=
 =?iso-8859-1?Q?rbdXnMhLw0RV8GCw114zecYqomCFtO0hhAhIUan/dhiKr1jGxVj2OWhWU6?=
 =?iso-8859-1?Q?YqGSHpnZQsteGSeN+jgc80HYXjCE9GSCGriDz9DaY+4coOVIQAcnXEbG7K?=
 =?iso-8859-1?Q?vFhSKBqdHH10FwZv2dCxc6I668oD+thRY3LOetdl2MvdkYqvn8D0KPnocJ?=
 =?iso-8859-1?Q?VVKUFb6X3K0buBjNQVreJgm4w3zbz1srh9h+7NFDO+Xp+Av826QRj+Sw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 389e3c4b-79f4-4be1-e5c2-08db23df5427
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:23:50.8524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/q/PONcAbKAyZMz3qrzy+2qdLxWRPuYjCFU7Ydfxc5L8vzOVu1/hz0dJ1p9WHmF5QoO08ta7/m0OFem+7jmeTCpxMzTwdSUsrkKOHfsqOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7180
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/5] drm/xe: Introduce new selftests framework
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 09:13:12AM +0100, Michal Wajdeczko wrote:
>Our initial attempt to run Kunit based tests on live devices is hard
>to use and will not work well with multiple devices attached.
>
>Instead of relying on separate test module and duplicating support
>for multiple live devices in every test entry point, create new set
>of helpers and use test->priv to pass reference of the device under
>test (DUT) directly to every test function.
>
>The same use pattern is supported for both mock and live selftests.
>
>By using bus_notifier we can start testing each new bound device
>separatelly, subject to filtering using dut_filter modparam.
>
>All test cases can be included directly from .c file, allowing test
>code to access and use any private functions.
>
>As Kunit will attempt to run all suites on module load, including
>our new live test suites, we may want to allow to execute them on
>any available device. This is controlled by anonymous_dut modparam.
>
>Support for either mock or live selftests, only one at time, is
>controlled by new Kconfig options.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
> drivers/gpu/drm/xe/Kconfig.debug              |  22 ++++
> drivers/gpu/drm/xe/Makefile                   |  11 ++
> drivers/gpu/drm/xe/selftests/xe_selftests.h   |  35 ++++++
> .../gpu/drm/xe/selftests/xe_selftests_auto.c  |  46 +++++++
> .../drm/xe/selftests/xe_selftests_executor.c  | 118 ++++++++++++++++++
> .../drm/xe/selftests/xe_selftests_helpers.c   | 101 +++++++++++++++
> .../drm/xe/selftests/xe_selftests_internal.h  |  22 ++++
> .../gpu/drm/xe/selftests/xe_selftests_mock.c  |  32 +++++
> .../drm/xe/selftests/xe_selftests_params.c    |  23 ++++
> drivers/gpu/drm/xe/xe_module.c                |   2 +
> 10 files changed, 412 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests.h
> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_params.c
>
>diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>index 93b284cdd0a2..aeba43977dca 100644
>--- a/drivers/gpu/drm/xe/Kconfig.debug
>+++ b/drivers/gpu/drm/xe/Kconfig.debug
>@@ -61,6 +61,28 @@ config DRM_XE_SIMPLE_ERROR_CAPTURE
>
> 	  If in doubt, say "N".
>
>+config DRM_XE_SELFTESTS_MOCK
>+	bool "Mock selftests for Xe" if !KUNIT_ALL_TESTS
>+	depends on DRM_XE && KUNIT
>+	default KUNIT_ALL_TESTS
>+	help
>+		Choose this option to allow the driver to perform mock
>+		selftests based on the Kunit framework.
>+
>+		Recommended for driver developers only.
>+		If in doubt, say "N".
>+
>+config DRM_XE_SELFTESTS_LIVE
>+	bool "Live selftests for Xe" if !DRM_XE_SELFTESTS_MOCK

why?  I think we should aim to run live tests in *addition* to
mock ones.  The mock tests are more testing our SW infra and can be used
in a true "unit test" sense. While the live ones are testing the
integration with the HW and making sure they work together.

I have changes pending to test some WA and RTP infra we added,
regardless of the HW. But I don't want to have to choose either one or
the other.

Also Cc Thomas as original author of the kunit integration.

We also have some overloaded terms that need better explanation:
mock, selftest, live.

>+	depends on DRM_XE && KUNIT && EXPERT
>+	default n
>+	help
>+		Choose this option to allow the driver to perform live
>+		selftests based on the Kunit framework.
>+
>+		Recommended for driver developers only.
>+		If in doubt, say "N".
>+
> config DRM_XE_KUNIT_TEST
>         tristate "KUnit tests for the drm xe driver" if !KUNIT_ALL_TESTS
> 	depends on DRM_XE && KUNIT && DEBUG_FS
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index b94e65c91101..b193af2d9930 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -211,6 +211,17 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
> 	xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
> endif
>
>+xe-$(CONFIG_DRM_XE_SELFTESTS_MOCK) += \
>+	selftests/xe_selftests_mock.o \
>+
>+xe-$(CONFIG_DRM_XE_SELFTESTS_LIVE) += \
>+	selftests/xe_selftests_auto.o \
>+	selftests/xe_selftests_executor.o \
>+	selftests/xe_selftests_params.o \
>+
>+xe-$(CONFIG_KUNIT) += \
>+	selftests/xe_selftests_helpers.o \
>+
> obj-$(CONFIG_DRM_XE) += xe.o
> obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>
>diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests.h b/drivers/gpu/drm/xe/selftests/xe_selftests.h
>new file mode 100644
>index 000000000000..6b13b998e789
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/selftests/xe_selftests.h
>@@ -0,0 +1,35 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_SELFTESTS_H_
>+#define _XE_SELFTESTS_H_
>+
>+struct kunit_suite;
>+struct kunit;
>+
>+int xe_selftests_run(const char *dev_name);
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
>+int init_xe_live_selftest_suite(struct kunit_suite *suite);
>+#endif
>+
>+int init_xe_device_selftest(struct kunit *test);
>+void exit_xe_device_selftest(struct kunit *test);
>+
>+int init_xe_gt_selftest(struct kunit *test);
>+void exit_xe_gt_selftest(struct kunit *test);
>+
>+int init_xe_guc_selftest(struct kunit *test);
>+void exit_xe_guc_selftest(struct kunit *test);
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
>+int xe_selftests_module_init(void);
>+void xe_selftests_module_exit(void);
>+#else
>+static inline int xe_selftests_module_init(void) { return 0; }
>+static inline void xe_selftests_module_exit(void) { }
>+#endif
>+
>+#endif /* _XE_SELFTESTS_H_ */
>diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c b/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>new file mode 100644
>index 000000000000..ef98f3599eac
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>@@ -0,0 +1,46 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#include <linux/device.h>
>+#include <linux/glob.h>
>+#include <linux/pci.h>
>+
>+#include "xe_drv.h"
>+#include "selftests/xe_selftests.h"
>+#include "selftests/xe_selftests_internal.h"
>+
>+static int bus_cb(struct notifier_block *nb, unsigned long action, void *data)
>+{
>+	struct device *dev = data;
>+	struct device_driver *drv = dev->driver;
>+
>+	if (action != BUS_NOTIFY_BOUND_DRIVER)
>+		return 0;
>+
>+	if (strcmp(DRIVER_NAME, drv->name))
>+		return 0;
>+
>+	/* only matching DUT names will be tested */
>+	if (!dut_filter || !glob_match(dut_filter, dev_name(dev)))

"DUT" name could be avoided and just use what exactly it means.
When I see "DUT" I'm wondering... is this the platform name, the pci ID,
the pci slot, the device node?

Lucas De Marchi
