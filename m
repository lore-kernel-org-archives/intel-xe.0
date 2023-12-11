Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62121C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 21:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA1C10E4FE;
	Mon, 11 Dec 2023 21:21:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34F810E4FE
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 21:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702329669; x=1733865669;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qgkUcdvln5fwYfo17423ZCDSXSpbT169R53azbcQeaw=;
 b=nfDI6Eazrahs0h2uFKJm973mznkuixWZiwzJAanWo618iHzAF7HjDnd0
 sh+0QHVmF62T1b8ZaXLOSozUkgISXz7aokDH+dHPeqWiNO1IcNe7uHaLZ
 +LgTtFeWBGW2iP19TyBEPGKG6SSnX87WmY3vWCkMOBKstNSA6+N7edaWD
 iY4Wfr1/F3G3bTX+Qr6mur29DNxFVuZX1gr9TLaB519acF5K6KXzOfu4a
 1iRYmomlSmcpnRQrx6gQdB52TlxfZV5BaEC25tovExNKV8rp/Gg5wJqcI
 1FVpGk5fkcjNaLf1TN88zATEkS9Mb7pdY4SMu1bVaBxX4yRoHu1nrs1bF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="379708771"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="379708771"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 13:21:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="802180178"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="802180178"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 13:21:08 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 13:21:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 13:21:08 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 13:21:08 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 13:21:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ba8ndfv/d71PYchnorBAe/OwnzZFU6fx1TnYjyExPwTQqWhFSotC219eWlnb2n+Tyi0SUxYqBzQuS1ZehJaAh6wvYKzHG2tAw4npXuOJLRGQqZ4VVKuOA4Y+ATBzTW9aAq4ye/vuRBWFoq96IOxlmPXDKuCP3w2FY6jlqlRwqEOIkQZ3mQWzQceeYeK0AgTYlO4Gkn6HTGMIIyCs06hNMQI9KBsAKwTWn9pbOVBfbK2FcCe9+5y76HM79BNyrUSSeiP+MCn0B7WXE5qEQ3EEuIF8DzG8c2KtpbWDgBocLsyvQ6aJbZMhvCIxJX/pz6bl6b/3chFda+Eg7YJNVp0KUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzqX/WbqI+HwiwUnp8lUi6d509C7U4Ne6ySQGpan6IY=;
 b=dStDuqGR5y0bYi0OTcAWe9OihJVc6pTP2QHuTI4JvN0UJ/PAQDr1O8XGn7uorSScOSiJs1W35TGBvhp+SMrjo56WmMGzNxkpQbqNJ/VC1YqczadciAlZsMrCPlHRJGkYHA9hQG/YCEXzB8FDZVpBDaDpeUSY4eMcrojXFabDzCPTVvGlgjYTOtUbUxYx3PDNXvzg9YyhP4ZekVQkyqDQg0YUmT5yYpVEZwNbfsC06tICOv9JRjyELRvlzy6MTmuYhWj+dqByx7L+ji06KAjEx67V7cjue7mcafjo4KW3pkUYYQWXNEjbX4UiYsYa6xTLxIyE3gEFOH6qUNOKm1nC3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5790.namprd11.prod.outlook.com (2603:10b6:a03:422::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 21:21:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 21:21:05 +0000
Date: Mon, 11 Dec 2023 16:21:01 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [Intel-xe] [PATCH 0/5] Introduce Local Memory Translation Table
Message-ID: <ZXd9PSSFvAA10Wbq@intel.com>
References: <20231128151507.1015-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231128151507.1015-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: 58c0f9b8-2b0e-457a-3be0-08dbfa8f1549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vg4Z4DqrZatFhDAAvdotf5vbOj+E33X5BWt67h0rA80mInr9ZrDNpW0GcJA/zrmlLjBCaZrantoQrFnRN94cCAqiFtFKEOyUAz9eNt2n8Ys7VhJfjWwNVGl1IGTLh6goWwqh5tugAoszNtLcn1dukMlgarOgML4QEGdxXhdbcI3254P5K2xCLwJW/fYqHTcqCO6CPpQv0B7XGS5Xil5mCIpiMAVjiz0ZwOjPO5px2+3fruV3HDylRqVVzwRGaX2XQLOLEFVUD6c/PXvPAB9ALTTAXUSJZ/Ae75Rht74jDgBlcuDu0z1Ord8gp0TGegYgJYjTpSFz57R3lsexI3D0AY2jG5Ayp79uwKzIGnG7uMgRAUZsuvBXMRijvUZVEtvqYnhix2UcB3HXbUqaK9z/yc2tqSN6tGrazLpiicbEAPN0IcwxpQFHUrjG1BCyN0bCGTV5uMiJEIuA2pXfLIy33kK+W5UHDHMz1U5WYOpoSUquQVBOYVlwALyO8C23VvCMdWN2BKB0wY6e+s5KCjBUbMez4HzGSULIBfjk6wi8+Q0ccOuq4x+T+12LMmi+tHjA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(396003)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(41300700001)(26005)(2616005)(82960400001)(86362001)(36756003)(38100700002)(5660300002)(316002)(8936002)(8676002)(6862004)(4326008)(2906002)(6666004)(6512007)(6506007)(44832011)(6636002)(66476007)(37006003)(66946007)(66556008)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ixNc9AoYbho47uIXg2OOTxRiAa9TTKLkfctUVSmoS9jsdtn8IJUBGBbcdIgY?=
 =?us-ascii?Q?uol5JtREK6dgAeGxozz32aRqZnfLdDcyEI+ov77f8+2+0OtKLk4qF7SeU6Gw?=
 =?us-ascii?Q?f85UZKZEru4SgR53pGYBzfLyz0tTfiGZzTqrbzBetywA0Q7DweJu9M6n+AUT?=
 =?us-ascii?Q?KmuD8uOm8frI5a9QwTOSJrPIgtjWmCFisYfU35P7CRFlHhosxYLHcgVx/5QO?=
 =?us-ascii?Q?MkpXmt3SKEk0CS6PBcCcRcXJ9c0p26KDGcyiaRMde0HzBF1LDZViiTu9jgAT?=
 =?us-ascii?Q?QkOyD4MvevYFAayaMmi9ekclMEWvzL78E+2w74n55FUhyI0yC+wJs9C3bOnS?=
 =?us-ascii?Q?HV9oi6rM4Wc/3FgwdY+5w8by8/dcv+2q0QI4WnGPW3wN0Yc9iExIIpIPW1Nd?=
 =?us-ascii?Q?oXD/FMRVYGZ/zX3XtUnl4hmtze5vDUAV/ccY7Pok2wn9KQgwbc3AvYF3ePLm?=
 =?us-ascii?Q?tRC2fsFsqrIuyCtw1L8a2WeXPSDQzD7PiLEeoI3pg+WIcUJKDjkkou0dVhs+?=
 =?us-ascii?Q?MjJY3NYCbz4zRwgBvz/o9H8x28mlJDFSwWA/okA5pbHChxm6xA7pvNJ4KVev?=
 =?us-ascii?Q?xCuyUdHea3D1Xp3i4b1uaGVacGIsw1eHB2FVLdJhAZm17W8LMgMO37z19KWf?=
 =?us-ascii?Q?B18E5tTgGASz/gqQ7rIU3cQLy/teEUsDmCnuDD5ScZp4Z9lB1ustdBTCzj0L?=
 =?us-ascii?Q?qKWLh4+hk49iwwj9l5U4tgzbCrDHnoYVL30b6EpILZYmgNtmNUtV7PRmWS8e?=
 =?us-ascii?Q?17qrhONWKRqERJ5I/v+8x2agAYKk/q79PR2pQXC6jI7rzovwc5QzMB9geXIj?=
 =?us-ascii?Q?aAUlCaFLw+UnQxNak8rXrvt4RIiPbAd8hGFV7dEc1HmXPYF2uSTzTDB3Z3GG?=
 =?us-ascii?Q?ijqt4jX+rLtQeorgmdBiir6aKk8Y9J9n4k+HZePWf7neKmwFTNLDxCY83u75?=
 =?us-ascii?Q?0AOSMBdbIZf2X4k51T0yGVbGtzkH8q+7tI4VGWecPNTqVw8xYhW7iLRt9Km1?=
 =?us-ascii?Q?FxfdMk77f4eOgz0ibb+wUScTnYHCMsiKDGXuvv8PINrZntTQUU/te9u+3stf?=
 =?us-ascii?Q?3Re4Lb0DscF2fxoRNplQ6NeuvIou+wpC33HHtFN/nuAD6ZnWIE9ZrertyGnM?=
 =?us-ascii?Q?6BjthSv4+bekf/MizFzjBsdfWxYtCy43/+S+/lA6AQxKmWVvXkLiFOD5VG3r?=
 =?us-ascii?Q?lqhad5YNrK54/6Flu7E8H2DVLo5hxqcZ/7MGHqcmq3y3ba2/THYZ55rCBFp0?=
 =?us-ascii?Q?B3CAx3CqHV+dj/2LyD/k/dUeD9kePeOypQxU4CMz9t3Qfw9LAypgdxy3Wqu4?=
 =?us-ascii?Q?qwdXm1BP7k2Tx4Nai40lHKtKLfV3+R/Ued1FfLdGcGeS5MPziaYYMGOpy85K?=
 =?us-ascii?Q?uJudWnMxAJgNRml5QyjT4m8DqGmpLRz6LzwDahC6JTKElt6b1I3nFap997Yx?=
 =?us-ascii?Q?7hzRAiMyW39UxFR3UKP9mjyYlMbRNSYPY9J4aVQXsmT6BY0ExGyFOBZEV0go?=
 =?us-ascii?Q?JzJZItv0ByocdmVWrJDHOGMRQ/O/E7Fa0Fv7IP/LOpgnOVCQ0adp6uQVG+00?=
 =?us-ascii?Q?RxpMA0rRUCNfzG5GEPIscYAh/zHU8DC3t+/HVJvQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c0f9b8-2b0e-457a-3be0-08dbfa8f1549
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 21:21:05.0913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8ACCcFog482p+bjHtGonPdvl3iZSDkfQJqskG2DFbFQX8RZpxE8cWALLUn55KAKRuSDOfPltD4ObPsJGeIqFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5790
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 04:15:02PM +0100, Michal Wajdeczko wrote:
> The Local Memory Translation Table (LMTT) is required to support
> SR-IOV on discrete GPUs. In addition to the core LMTT code also
> introduce helpers that will be used by other upcoming SR-IOV code.

for the series
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

but I'm afraid that you will need to rebase since it is not applying
anymore.

Thanks,
Rodrigo.

> 
> Michal Wajdeczko (5):
>   drm/xe: Define DRM_XE_DEBUG_SRIOV config
>   drm/xe: Introduce SR-IOV logging macros
>   drm/xe/pf: Introduce Local Memory Translation Table
>   drm/xe/kunit: Enable CONFIG_PCI_IOV in .kunitconfig
>   drm/xe/kunit: Add test for LMTT operations
> 
>  drivers/gpu/drm/xe/.kunitconfig         |   1 +
>  drivers/gpu/drm/xe/Kconfig.debug        |  10 +
>  drivers/gpu/drm/xe/Makefile             |   5 +
>  drivers/gpu/drm/xe/regs/xe_sriov_regs.h |  17 +
>  drivers/gpu/drm/xe/tests/xe_lmtt_test.c |  73 ++++
>  drivers/gpu/drm/xe/xe_device_types.h    |   8 +
>  drivers/gpu/drm/xe/xe_gt.c              |  10 +
>  drivers/gpu/drm/xe/xe_lmtt.c            | 506 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lmtt.h            |  27 ++
>  drivers/gpu/drm/xe/xe_lmtt_2l.c         | 150 +++++++
>  drivers/gpu/drm/xe/xe_lmtt_ml.c         | 161 ++++++++
>  drivers/gpu/drm/xe/xe_lmtt_types.h      |  63 +++
>  drivers/gpu/drm/xe/xe_sriov_printk.h    |  46 +++
>  13 files changed, 1077 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_sriov_regs.h
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_lmtt_test.c
>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt.c
>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt.h
>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt_2l.c
>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt_ml.c
>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_printk.h
> 
> -- 
> 2.25.1
> 
