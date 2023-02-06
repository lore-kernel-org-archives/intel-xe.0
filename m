Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6051AC61DA4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Feb 2023 22:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9E010E448;
	Mon,  6 Feb 2023 22:36:09 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E073410E448
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Feb 2023 22:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675722966; x=1707258966;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aXu6ClkkFT4Dn4bs1sZLldGGM6IiVEwCTHk3edKHXZU=;
 b=QdAwxhpblbVrWYD8KggNvl1Qu/hjrb4ftDjw+BtHyYYzyFoISnPy9tMX
 YFzATWEuKfVxQK798pXYi1ieOPWBELtExTFVc+46Ia+N6uPQ5BB+K9nKF
 HQy9CTvORQGIaBnqGBmAizSdYlIwRlpOuvfBpJZfLr9Gx5WWoubnZVJeD
 r0x+1IHFHr8T8k371cNYGAqzriozh2klnVU5HeCqpFPxtPre7YBQ8NTpq
 WzwNA4RKH8caBu255IcmhEiZ8bDKpFHvQ6hndKJuDxBjlVGM8kT9LBuna
 Ra+j9z898F20Fw7F+OWbjZQtjVL2A0Wg2V+VXO/j6zoGFTKehGxqKzTic w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="317346923"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="317346923"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 14:36:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="735309675"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="735309675"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 06 Feb 2023 14:35:59 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Feb 2023 14:35:59 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Feb 2023 14:35:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 6 Feb 2023 14:35:58 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 6 Feb 2023 14:35:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgtYK4zUiY78srfJEy2NjCaTx3JCdIyEYaoM62vQr/XKZj6ea6WojJu49kz6iKBK5ZkxVtGkyq5SDN/V3eHSFMJqI02sswwFy7v/007cqv50ApCJhsxHYXAd4xFcl8kGrqnsNUI7x/UWADU9MjEXR1vEOUXanr5D5LcSEa9vQNNYjW5+yUnF63wo5GiYAMPVwoqz3/6TLWebNpJarCZZ/Tm/LxP+PXVpLhawHK0htAXIZT/t3W94zSnrWn3bdbxcYrbS9VRTwQ5dV3WWYF3+MlMIW9E4ShC8jndfZyUQIDVfsSgwnRt11C1u1rkO8DvG/Q52val2+rALeDyf2I7cRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=704n068R7oyXI5FIf2E+Ft4P80cPtR6YBEm/etDcAnA=;
 b=AyJc/MdIZeg+2M1tmRho5U8fHiQr7dE1dPRv6owAka0sMm5ojiUVHreKNQr50Nsa10OOw36R9yCJUSeRnUqOxp9h47peMVG380v+vT5zTqWxj+56H7hsddbhG/6N6YpTbZ7tKpN+f6Sx8Iwn2IsDiPlxzKP6FeJVYBUHh1ZdbkseZJtKi9MaXUN2MnAi19v/2twL/7J2t0rKSDs5H5DdPa8uMSwV9Ca74mp6Avr1yAMxUbJ4rV5pVFXq5vGkm3Lbp2poOxPn1GaK6u1etSRN+w1oGz7B3PwbPtBf9conF8XfAT2uKxXZoce/XvEdsXVn6Ky/4YVDYvQ5tqADIRurtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7458.namprd11.prod.outlook.com (2603:10b6:8:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 22:35:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%7]) with mapi id 15.20.6064.031; Mon, 6 Feb 2023
 22:35:56 +0000
Date: Mon, 6 Feb 2023 14:35:54 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230206223554.sez7muncffoo6itp@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230203201758.573775-1-rodrigo.vivi@intel.com>
 <20230203201758.573775-5-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230203201758.573775-5-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BY3PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: 17c03547-4e8a-4d03-2a57-08db08928350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P/gk/0EGVoTSCchMIyg4tV5L9FnMhc1BQnXcX7TIOvWkES43LotfrJTV0JkgCpDWXW/iV2H8A0wHbGvN2+yFmhO6I0kHcNiAI78/I/UC+7WNglbtjqdcXL12CKpTjhlZZz6Vk1XVYXQbgm73bt31tMX6Zi1zYrFHnlDvYoDj52m0mZn+ZiQWCMG/9W9V27S1kZtmk0+8HD7xAOp7Zdvi+cxa2WTbVaSmNuygue6/b++8Az5F36fZ09tVwchMFFt52cr0NFzPDIRV2lLb5mSk7Al9AAzSkNouW2/10cQfQrs7tZcAsWE5OHfEe2vVLZyt0NxZkHT7mH/LWqjTMlSasja7bgFhV7pIKRG1OqN9woLO+3zavPWvCPj/2o7wExIL3rFcpCT6PsWUxfmRIlsBoITboQ9Rrxzce7F/eckMfC/mJA213TRo5RyhgMstVNvrO6IGDcunO6B1zxdv9lXVDiPn2sntEeosRl8dqmTogrcVWX/AxSphhKBFxfWBYbniC5uadZuPU1gQfmJHn3plTmo3EQiVM0nzdH2tUSB4AP/A7cjTnBDx16cxqxUWcbiODVMB5nLyyrilUQ7fSVqtSr8eXpNg3G9d/PrXbeN/rGwGWT06cMdMSxwB5u7wYdlLSfR+PF5BLZr54adgPcLx1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(38100700002)(2906002)(86362001)(82960400001)(9686003)(6486002)(6512007)(6506007)(26005)(1076003)(186003)(66556008)(36756003)(66476007)(83380400001)(316002)(66946007)(41300700001)(478600001)(8676002)(4326008)(6636002)(8936002)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h5cPi5KOW8dEF82xweTHbQ+kr95FIXiLlYn/3K8y1LgZZDy7Hg51JlWSykNE?=
 =?us-ascii?Q?mLxacy+W9ydVBoZ7EmG3AFikJy+ruiqkTFh3KTEX5p1zfPw2G5jPeTmtxU2z?=
 =?us-ascii?Q?RCScwCjeFXWMLF4ikRa7L/yj9pXu7CNRcT079uVGPXt0i01/Rvxwf9oaxYw1?=
 =?us-ascii?Q?IKbWP7HxLI9eQJJMi+Ns9HRkSoK/KOvf8ch06icedJ2iFeXohTf6V3CTy5HM?=
 =?us-ascii?Q?NesR1GOOQn16wrr4pFKAcbO+RtwAqRvyKDa/zO++eY/RHQY3s/ihQfLNeLlZ?=
 =?us-ascii?Q?cpTmZ/PBzbS2GN6zq5IVeZSOWLHxxQO6F+zEOV4y8CeC6ktaUexdOIbw9h2/?=
 =?us-ascii?Q?kP9WnRxRam1GGdTAxyXLnZWOWy3i7P4LD5O7HGGYi6aoo8iLCCyX768rDMWk?=
 =?us-ascii?Q?Wsl5qpvaBCNHYJZQSJNC89w17mqVq3a64yRLUEqWrmWD1jMKzlfnp+N0K1aQ?=
 =?us-ascii?Q?V+EsDHiCC7dtGnEs9FnpF0KnfRkjgRcwV1xksrvoKV8Ccu5pTc8oZcsvL6DT?=
 =?us-ascii?Q?fD3qcLWAO4zeYsEgTfot+wCDLw3K7u0RofUHbH6cmjIOyr4owZuCnWjA+r00?=
 =?us-ascii?Q?sdyviZLKAFORfvQDIX5ELD+Rq1+Hlmm3FxKISqg47jiz5NjBk2l0QDjGfm4w?=
 =?us-ascii?Q?Ujw4PS4jVT++t/rR+A0EGKNSv73Vm1zad7lE9EjCPWgcAZ5hasHZlcu8KJiF?=
 =?us-ascii?Q?1UcgywYIHX2gUrK7pprPNfgyLOZLw6w4UI28B/bcnoEUqQ2CWfFUpuyQ8WPX?=
 =?us-ascii?Q?TNjNGN7ySOfp3IdusdjELzus49J9S+qyGXEA2iWvE5HDTtwPA9zF0+DX0Q/k?=
 =?us-ascii?Q?1qPbfZgiZyfI8ilphaYh5HzIalCwQYop434o31gVb32vwaJ1dtf7OrbIG30K?=
 =?us-ascii?Q?aekVdvaAHx10onwRrORG4Hol04MdixUtd4Oc5FqCjP2UZeJY0DdwBbC9bONi?=
 =?us-ascii?Q?qSCw49/ahmhsxh+2YsfrfwfJajSTKCVwZFUeCdhiCvOsKwfSdy30ClXhMo1J?=
 =?us-ascii?Q?1bHaQ2QZ8K4okxQLdUxk9sHb7VJFrhxPNCLC38gW1sqK76mhFGHnEu9zfqHG?=
 =?us-ascii?Q?u5sfW67DzvbQElIU0RT8qfZAlD8xxUsukb+nBEZEatDWNyvOJKNmg+WiopFH?=
 =?us-ascii?Q?CE3/WfFME7iJV3tgAQZNWdKHNaUiWZPq5qHfKDHOeGJt1GzX+AdWz7sCFPla?=
 =?us-ascii?Q?7PmGI8Lg20ckEX9Pca7J+1VgDy25kJZ5Dwc06uP7I2i49Pgo4eq6NTsasxmw?=
 =?us-ascii?Q?3VBu51VH5XMl+yu5DoOl3+wOreZPtehKRmCA9Pvuq99aOlR7sKZtz18ybwYV?=
 =?us-ascii?Q?wa2nBTPi2pbDaXJDfjg3jARqal6dOI8o3j0el4a9P2yG4knKVB7tUXMfnj8U?=
 =?us-ascii?Q?wZc5Zt1dpPY/z9V7mlLaJ8fsarD6Ho9zGh8hZUFYO4ZbgzO5gh/EvN4NVMWw?=
 =?us-ascii?Q?xdVkk+k9+YCiX0mbVvPB9Cq6jlbIYsl1JEriLg/TDP0ZFwcBjONeD4UPfIeV?=
 =?us-ascii?Q?XugSF2pCw1jk8dOvt8Z9RnhFTLqEaU/70ndcUzzF06FrYL5q6/7JdsVf8Mwh?=
 =?us-ascii?Q?0mpqMoN3OOwH+hAR8f5oRLVYxnOzojYPigK0Rh8+CPcG1GOrwXa7usIY9iiA?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c03547-4e8a-4d03-2a57-08db08928350
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 22:35:56.6559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BUiezRSFZhGr9wCG7TqcX8SJRNcNrnUDBZVWBr9HVB3tE3lqHGUzTefHL0IApohpvcKDVhB1/Ty/MlD5blH9upPKLzs5Pj3s7/1jwUHkgKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7458
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe: fix DRM_FBDEV_EMULATION
 dependencies
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
Cc: Maarten Lankhort <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 03, 2023 at 03:17:58PM -0500, Rodrigo Vivi wrote:
>From: Mauro Carvalho Chehab <mchehab@kernel.org>
>
>The intel_fbdev should only be added when framebuffer emulation
>is enabled.
>
>Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>Cc: Maarten Lankhort <maarten.lankhorst@linux.intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/Makefile | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 3d716b71e54f..74fa741b1937 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -170,7 +170,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
> 	display/intel_dsi_vbt.o \
> 	display/intel_fb.o \
> 	display/intel_fbc.o \
>-	display/intel_fbdev.o \
> 	display/intel_fdi.o \
> 	display/intel_fifo_underrun.o \
> 	display/intel_frontbuffer.o \
>@@ -213,6 +212,10 @@ ifeq ($(CONFIG_ACPI),y)
> 		display/intel_opregion.o
> endif
>
>+ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
>+	xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
>+endif

same comment as patch 3/4.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+
> obj-$(CONFIG_DRM_XE) += xe.o
> obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>
>-- 
>2.39.1
>
