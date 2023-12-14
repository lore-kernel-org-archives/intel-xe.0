Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48388C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 13:31:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F9810E08E;
	Thu, 14 Dec 2023 13:31:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3590C10E08E
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 13:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702560695; x=1734096695;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ohxkY6DIsZRBgv3a5ymzV3zz+knH+QXnm6UpQtDQhTM=;
 b=CZBObrZqmvMytVYxIvXkP9kE0M+AtOn5o+QMga8dh4mESTfV5gsKY/mb
 jvqmW5r9GV6ig3PYCCFji1CY3UyLI3cUY92MTGvBlTHdFIFYngm8lm5IB
 0Y/P3KHjCIh08qbfTW9UTg/jLpu/WDyn6kH87Sif6NcqKTBMtP3Ul/3uU
 ObZtAOnnN+beLqN4kYTN9ftVTaSniueSh0bBFPb1sVpsZ6EG6SSz3UUJ+
 tmW2CjiY+uJqVZcLjJwVrmYEciuBZsjB4q0hBWa6EVNKJuwyiaj1zU6+5
 hmd+s8kpF4Mogb8JIRRiJ9TH8lrQqhdC5qoRmS5egFNNoBfTEngweV/oK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="394864555"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="394864555"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 05:31:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="774366846"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="774366846"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 05:31:33 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 05:31:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 05:31:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 05:31:33 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 05:31:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnLa7ok1Fk6UbiXiajvCATgoXzntjd8UjXiqq7/sucNRthnSOe1H8dlnLoQp/SE+wA60wmBcQpn4wf6QaAdiFu9gKWOBkQjavjVQWW/i7zTcJ7CLdMants3pMjreM6+YDB8UOrK5C0hndt1vta1hrhhmqHzcjYPMhAEeRGtKt1rqbcgd/n4LaaQSpBEsRz5TnXXptOGen1/yeaY/otksIPayzlcFeMwMLE05WotdaXF/VWpxQKEJCvDaTpBwKmglDgOxmKgcMoAJzb9FU+KLd9KL5em1KzdRvvC0M18zNzpBIGLNHP0ZSSgsqguqlpdMKlX8VpPsK7KytArB10ZJfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJMVD3eMMTqofGwI/zjqCcBsS9cjdZavoOShjRDFrxg=;
 b=D0YCetNb+6eikvqM9qkocV8ywkfjap5Jipl2ZJNverEftpLwFPWPZNYuyKEPUxwRgBXHylIkg4Ot0MaVxm9IaqvBKGC3aZDgIB8A9e6aUiEurAQO07J9Z92REpF+G9fX+9f07mD8VQI+43ZI/tMjzi5mefN96HWvd4rvg5sCrOZGvnP43/iR0FDdBiuxgmjGeqG0DnSpuUr8oOFPTgs0lIzuSqyRUCcdlEUjfVVD3PnKLXF071YldOW4jgm7jv3ySsJU5Hy74KS7GjXSBesF3b3hOaNQ+F27kVz3nhDG+myL9YzwbrDyEm9E8XB0j77W9RENVeCfvkV0VTjkmxqunQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4614.namprd11.prod.outlook.com (2603:10b6:208:268::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 13:31:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 13:31:25 +0000
Date: Thu, 14 Dec 2023 08:31:19 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v3 02/10] fixup! drm/xe/uapi: Reject bo creation of
 unaligned size
Message-ID: <ZXsDpzNOy7bhxPTv@intel.com>
References: <20231214113144.251726-1-riana.tauro@intel.com>
 <20231214113144.251726-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231214113144.251726-3-riana.tauro@intel.com>
X-ClientProxiedBy: BY3PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:254::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4614:EE_
X-MS-Office365-Filtering-Correlation-Id: 5447ac3d-f04b-4d9b-53d5-08dbfca8f794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ko8N9XW+/ym7KBXP7p1pLqXU2DeylQlHGQtQ0XBjTLO8ePZjbM92KAQsnsVT6rfmwLWFMiX6dT+4L4Gb0trUOPXAZxti1GeTfk0xI/69fumRBbQv56GGQAuCmQpryVNwzKlayGeJvPWcFetXJXdPd4XQUS8/3SBRomIOn+wUPOQTmM4B8nhPal1GcFg8tFHTbLlmlRp+eHEH7rPC0GDO18sOGz6fl4VRCwLjvY2eGJLNLHPUbbKujHZatSnhW9Xf4MItTWtwVXLUdixrQ139qQq94FsoWO9gm8vODItzRoboSZ359xw683r/DnhNxG3NzVVI+W3aIxt8POcDpxM7B7Z7uzxFd3kngQJ95vgqwVPWQYWRjlH1KATB4lLrgjC+k8Uw+bCfdSy7t9jzPOyfQPP75yT0kKpuptc7gyTFKJF2CtIgaMwthqa8oUSliurUAIf7bdIBYkzHhY2evGhYvfix6bfGXxWGS5F5fdG4WL4yPGMdYU+VoDTZKXl3iuvagQanRxjcIVZ1Y14xxB2xwG3/FBWXxOEsXU/mj4BjcL/ghgvoGKfrKXjlw+2xLz0+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(39860400002)(136003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6486002)(66476007)(478600001)(44832011)(6666004)(6512007)(41300700001)(8936002)(36756003)(4326008)(8676002)(6862004)(6506007)(86362001)(26005)(2616005)(4744005)(2906002)(66556008)(6636002)(37006003)(66946007)(38100700002)(316002)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2fzIDHpYQv7ON59OLEuanGuXcdCt0fLF+RTW/U+X4z/Ntuq1z+cMK14o3g?=
 =?iso-8859-1?Q?MYiPmwxPUD5XVm3L+C2LIIzSby1DC365f1/6SMao7eVtPBu0db33mNaY8b?=
 =?iso-8859-1?Q?LRo5RfD/xJ5c1ATGy82ltmSob9wFDOti/SOyFi3loFesmusGCSgviiAkBe?=
 =?iso-8859-1?Q?MDb82/oUYznwgbP/Rv/JqvFz25HF/nHlbXD9rVfaCrfQpgCzaem0lMVr51?=
 =?iso-8859-1?Q?DH3EghCAvbzdDDqK2lmE7O9MFdrhajVcLGh6xhAQJLrnqn8y02/IO3ke7e?=
 =?iso-8859-1?Q?Vz5LeazvIldCWvYj31Lf41+Guckz9mpfB3BRihHdOPMlaKTSXeR3RnpXS2?=
 =?iso-8859-1?Q?vojvOpPxSr92JPOGymC2XgPmjTNZgznlxCS9AVseDyT6OryrGhj5ecEgIR?=
 =?iso-8859-1?Q?VrDHb9iZnp515RKYpjgzrwE9RWQ/qRs+srG3ffBfY84R+EmP1MsJ9FRx91?=
 =?iso-8859-1?Q?XgsouVO4RcxXD0tHvEyYYxRmJq1WYmCvWNwntSUva7PPu1HhejDmORAAj+?=
 =?iso-8859-1?Q?+mewuYju7ujyj03aO9juuw8dJh7/BIA95jS5n+kqunqIcUXQEAY/fZuPWk?=
 =?iso-8859-1?Q?5r6f4OUtuVIIpEMjX/K75fQ8ygzF4hpeCGmrQhpDCqP2Tgv0SdI1YBR/fb?=
 =?iso-8859-1?Q?SUQHpFRDkWc2/Z3yu/Ohy6B7Tp7CP2Yn1LLxT6fjcVa/oCAL/wNhI1UquF?=
 =?iso-8859-1?Q?BnLiRi7UYix7HOCUC1Ualr676esUJVcNXIuSYiPNXW+chTgChIMUiQwKHe?=
 =?iso-8859-1?Q?hXskGmvcOW3FYqjFfxq83U23zqpKgEd8iHuRvHG1RNG3TdJNkJD+uBK+dJ?=
 =?iso-8859-1?Q?THPYCSkQXYZvdKtE8LTVzX2c6ANqlJX0SwaeIWm1zA41Re5qLYdB6Iymhd?=
 =?iso-8859-1?Q?94waX9G1pu5jR2b7GKBsviO7Io33+aixHVcnlqmKRGf4BFYA/eh/E9xDLz?=
 =?iso-8859-1?Q?GjXFvn1v0WD5Hdde6W73tA8Xh2ZrLE0StqkginOtdiDt1ldkw1Fzi65iDb?=
 =?iso-8859-1?Q?lL7IShrZK2iDeiDFbyi6SPOiSUitJkB7peWUMF7D4W/yFf1AG2wcKiegZE?=
 =?iso-8859-1?Q?Ackqp649uMtx41eIRKw26xEzHJgVo2sln/B/e/BO/zbYnkiB7YQkOQSMw0?=
 =?iso-8859-1?Q?tWxLbaYuFq5PEMlrxKvK0lzM7P/36E+9DV+rqIwkv2OgSY8td0uCTZuNqm?=
 =?iso-8859-1?Q?hPJhGsMEwjU0oy2SNJPlphF8i3j+SUGkMx1eM5I1iC4ayGGqq1LpBpF6o5?=
 =?iso-8859-1?Q?FA/fVKrlqMqmRuOIW8/v2idKqeFGBMdCcQl63Qt9t64fK0KsRKpJ0qGlHw?=
 =?iso-8859-1?Q?5xX8/JKLl366nyrFdByhyDdErhwc9Fo6OOdt1WoEYtEjmdQSHfuRq1glr/?=
 =?iso-8859-1?Q?Ua3zBu2W3SDF7hox8WtqPpgi//g9MUS8FPDarwvEXMwoew18MRKVkrOI5d?=
 =?iso-8859-1?Q?5ukheyeE0O7PpdELJXQRZUNa2bl8Pp79GynsaM5DsEl9ecA5jy4t/yQ8WJ?=
 =?iso-8859-1?Q?IJTahtWlM7ybTuvIpwXvhZoYaTiioolMyuYkUDxlC2PL4+wTsALeHE2uU8?=
 =?iso-8859-1?Q?BQ9Wo2ukVadK6WL22Y7BdGGsTSMwj+Vtdlspdl3XgbGaVf611zU66Rp/tk?=
 =?iso-8859-1?Q?i7Af2iIDhHsrAFSme1fmmOYz3EZT7rJj4o?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5447ac3d-f04b-4d9b-53d5-08dbfca8f794
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 13:31:25.0443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNYHPFIWjwnQp/H60ldXvPtqiWTVpy047jSQ3UWc1Gr4LUT2hggjcr9nL1uw3IUp6xYSgcBZlQn5mXBsHkWHDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4614
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

On Thu, Dec 14, 2023 at 05:01:36PM +0530, Riana Tauro wrote:
> From: Ashutosh Dixit <ashutosh.dixit@intel.com>

We don't need this anymore since Ashutosh already put this as part of
the PMU removal patch anyway.

But also, please no more !fixup patches. We are about to do our rebase
to drm-next and will need stable hashes for stable 'Fixes:' tags
and commit mentions.

> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index bb6f6424e06f..9f6d571d7fa9 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2022 Intel Corporation
>   */
>  
> +#include <drm/xe_drm.h>
> +
>  #include <kunit/test.h>
>  #include <kunit/visibility.h>
>  
> -- 
> 2.40.0
> 
