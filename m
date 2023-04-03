Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87970C76196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 22:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57ABB10E1C8;
	Mon,  3 Apr 2023 22:46:39 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA9810E1C8
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 22:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680561997; x=1712097997;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Y5E/aD1EJvhQrM3DoQDzkd71Pkbo5l1sWpSCzXwji3U=;
 b=lbE8yrH2Sx3T4rBFjejfl4jbxyOkp1Fe1rYcbMk0GuhZJ1VhoDC+3sM+
 KvJ0rehf69Iztj6uJOViT6KKAlweVL8PMFuAp+yOUwywxvsTL4zVPn/ku
 WLoW/6oPZv92RRXL3eGA+cuJZxQxAA21HO7WqCVmqID6FPu3on5u2dYFC
 7GUT0j8iHlY821HJXh7VH0tO00RofwT/flTwY54oW+2kLVG3PpoIoiE/3
 ByH+5keHj35mhqOGUA0PpQwxDaVwcOtPp0L+oyUbhKRYIcFWSyE9SoxTl
 BboPNkqCwWacucfYvQkQGd6HbkoHSE98O8vwQgDRA8QC2zCb90kjYcwPb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="404792976"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="404792976"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 15:42:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="755422947"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="755422947"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 03 Apr 2023 15:42:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 15:42:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 15:42:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 15:42:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 15:42:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5gILeZwtlp/JiiOZE+iw7vqeWczqAmqSvheclznDU9ORmwjH/v5EZ43t/K2Dv0EjjCppNDovdwkV/7mW67tjK03NyC/JFVf4+ZMmE39u76bsAghvZatoQ7IHd1IM6RXPVL1Rxx8W3ZparZ5YM+JyhYvwSaEYK3OjRuVk92HVtiSsUkMiMdrEfvmYr4p3FHRMW+2RenhjDwEppRohgqH+e6z9Y3+yOIoYW6h4NyJ7WpN+0WHQmm7zsWJTe15nyVx8hjKg3+gTZRzPvn1lWN1ajCiaBqfok8/E+uOEsPiSswJHKFfrF8pS3xF1UncFzRi9MNH1E7XsRIQaImNH2AkdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0eogxLKUPeUx1nVu8/9uBy7BWgZMgxNbWaJ0Ui653k=;
 b=LSKF+DqQ8wD7VoY1B7sBtS0pm0arUGsg5+tHvftOT5YmjhM2wIdfxI4PZuLd/JoAZmMrnOEo56+Ytvx660ON6pF6sVZ+nIAd/t/0opNLvcqyAbBcKMMkDDfDHQN/EOt9YN85bdUNZ81VPKoMrZnkcxYm/nPTJ7IzGkppDixyHI1EFt3iyAQdOQNaNxSrpbW1Z0ZScFFJHS7tN2FsNo9gtgtiXhw9wT9lgOb66nTrTZrZkpmGKlvlJT5l+fLhm8NY7p34ylcnl+7sKimUI5P51osghxOR10h+RG3EEFM0Egc+jgtwo4BAM/AFM89Q9nvogmSD4QzBljFDWmdzUzQrQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB6268.namprd11.prod.outlook.com (2603:10b6:208:3e4::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.33; Mon, 3 Apr 2023 22:42:42 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 22:42:42 +0000
Date: Mon, 3 Apr 2023 15:42:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230403224239.GA4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230401085151.1786204-1-lucas.demarchi@intel.com>
 <20230401085151.1786204-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230401085151.1786204-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0090.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::31) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 723768c2-eb79-4bc2-8f10-08db3494bc2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XI8saoz9509BuZ54oHfMPT15k81pA+O6SyhHzZPUwxnT6B1HdkYY9YZ9PCrmS0FsF+5frHl4h5mcexER7hat5AVTbCPendSApYrRx2Zak2iR0zmUJWsuICisJxge3ZZPhCP1G0NDo0Zpi2EBYX6PZs6xQ82kzxLRveDA9By8IT2MWphHDSy2MJ1MPhJ/CCXQQXXWz7PEV/3VO/gESBwjTDLXysWa7Dz0vGBo3HmJcDz5+9DapIA8XBeCKa9YGK01lC7o6e1xWQOh6JCa2yzpQbXShkDRPZtkOn6fAWHVeNrBli/IpoeQR1lqPCiw62L30QyX3uh7gEXU8KHQH1BkAC4xGY/k3NiMC24J2CyvKy3WEQuItMWhKWkGwPYd7490rm6wJpLHwXgjJ9qpbo7miyVjmvKM3kqUSEEcXgv3J5UpXTl8K/tabwUWNGbu4eRHGOpdb8KBZRKGxsN0wwub2/qAdtwNIGeRKri2NkOq1K3YJiXn1hMK5xzSRK39UmsMUxWuAkGtwgzSkW5uXMRXnu69jmvhdZUy9iwji5Mf1iWCpjZxOnCV8EHftGwkKi7C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199021)(66946007)(4326008)(8676002)(66476007)(66556008)(6636002)(316002)(478600001)(6862004)(8936002)(82960400001)(5660300002)(38100700002)(41300700001)(186003)(83380400001)(6486002)(6666004)(6512007)(26005)(1076003)(6506007)(86362001)(2906002)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zTaRtGGKQGImqXESVTsCBwanFaqU5QQbtALHFAWXXaNXEMMcT/sYYd0Bqg?=
 =?iso-8859-1?Q?9C3BObh22jk+BzxLveYTtQyTTewJVMXKPNLHIvoUO6j2E1L1UQ1ue54lMv?=
 =?iso-8859-1?Q?eNbk0tG8Kr1fDnHa6IAYugM3ocny2TzyYNjVAEDlv9M63T2ZHxJiHr5nGo?=
 =?iso-8859-1?Q?ExsL3Os1+53dcuZRuosGjoO5bhJnRIygbcBQ2JFr52/bSLROx6p8tqy8SL?=
 =?iso-8859-1?Q?0MQ2cW3f9u/B3ngSbTD+hJ3dgI6P4FiAEngrPKnIAftdwH14h9YI/Td70h?=
 =?iso-8859-1?Q?eflSNsrhfDEAe3TH98OJuZFLrd4iafphYF96f8mJS0Ymj/jCO2l8LdCARP?=
 =?iso-8859-1?Q?cfiO6d+asmH2NB865WeWDuPs9RkGchzX5o8a0Ca6bWTpXD57/b4YF8DDw2?=
 =?iso-8859-1?Q?k8zvY11wk8y4arry5g9HlM6IXL8/45rRD+92zfh8Y+9R2yRirlZ1BH/Eqz?=
 =?iso-8859-1?Q?GI/XZ+j/hx13WdDuxGDuKH1e2RWSTS+rxud5h90TVyU4weyHbEWdzO1ZlP?=
 =?iso-8859-1?Q?GsKMAl9KqTh3NckPa7NKK452ZEqteZY7L8AztbHEfuEDui1tidqJYxM1i5?=
 =?iso-8859-1?Q?XzC6CpxP14mFV+mXFgB69ND2iK5/JbkNeNTjENpNdBLtFbFK/Fr7+rSlA7?=
 =?iso-8859-1?Q?blF7+BtVipd/QDUn1m8hSRuWCa+JrZw9TNXtNGMwJkBsEjFmPvIpGg5Az0?=
 =?iso-8859-1?Q?NM+Mrzk9xRrMU3MXuIuuxY8bk9u1QazmfSp0GHwbg8fzZDKQMyle+yVnLC?=
 =?iso-8859-1?Q?HtRQJLl97DX+r6uVpCyIfAbFsoXiKBup9V3/3A31hCh4ydFwLDIrIea4LJ?=
 =?iso-8859-1?Q?hwaZeYcARDiW4OUk+RB0UZNnOQNzKkJu40KEc3A1kSvxf6AHOnNZoJw/EF?=
 =?iso-8859-1?Q?k4s5EgIEQtuLEuU1BjY9v3ZDPq08ndET2kGNhEj1Sid+iD2zq2cZN8aFio?=
 =?iso-8859-1?Q?PhZeSdf7QGNNDj/mv7uQzE6/sMEksR4bIi2qaMifoVaLQ+SzDiV8XIeNN5?=
 =?iso-8859-1?Q?Eywp4v2lMXJarGl/mvCndJrvmQE08z1UJwXMr//sfSB7JQ7z3hAX2Tzc3i?=
 =?iso-8859-1?Q?f2kQP8emNdMs45V4thZM2cqXeKgsSK773WkT+x+P27SoA6rubAWQYNFwob?=
 =?iso-8859-1?Q?dV6DDVPkh6UyQumTt364r1KRFALk7kSaJtumZn1BK4nIKi4UxEanYcvWt8?=
 =?iso-8859-1?Q?3cIphDr/E2oXHQXvHbphpn1ahQxAsJ84/EXFaD1FsYbMqqxJeEVFhb/u7D?=
 =?iso-8859-1?Q?2tjJyFY2YsPwiBKnW1EaSU5PmnWd0ElItz7Ez7nCi/6iNuYBiGNtd2gsGt?=
 =?iso-8859-1?Q?22jhMpoZ/p4h5qhtYZHOpRGvvyMwzzmGIA7sihsTHDZre+k1B8cuHOywPG?=
 =?iso-8859-1?Q?YvfcI0lCgMeX7aVyO6LOBCS0CFVKMx06FwzmEAvqiJzec8dYP2b/1HjU3X?=
 =?iso-8859-1?Q?ph71niK0OIx4O1gJA7X8qv6lFEYSbrjIT6f/3fheVNnvBbuB74RtEg4TwI?=
 =?iso-8859-1?Q?vQ7+MTmCoJ1V4t4nSpgOgi1Vt2Eaml8F8AoP3nAv+o8cdUsL9nf8haSLSN?=
 =?iso-8859-1?Q?KH7uaD39qUusRHOlyLcYliKPd9Ffe34WMD9ysCTpRHP1D4GGsCZ5fWCiNU?=
 =?iso-8859-1?Q?TJAo9PlSBOL9ESf3DIyxLIKZ7QS2P1WA1LWrVFWvHhQHPINJD69fQbzg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 723768c2-eb79-4bc2-8f10-08db3494bc2c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 22:42:42.1742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/nUpIjt+jWKIowI/vFMXnLp49YL42R+TQySrFL49ywMjnLZzUulnn8G/FUjIFmwxt/v5TXfiPEgbNdy2FfF/krh9ThA9wcpd++iMzI9UU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6268
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/7] drm/xe: Move test infra out of
 xe_pci.[ch]
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Apr 01, 2023 at 01:51:46AM -0700, Lucas De Marchi wrote:
> Move code out of xe_pci.[ch] into tests/*.[ch], like is done in other
> similar compilation units. Even if this is not part of "tests for
> xe_pci.c", they are functions exported and required by other tests. It's
> better not to clutter the module headers and sources with them.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c       |  2 +
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c  |  1 +
>  drivers/gpu/drm/xe/tests/xe_migrate.c  |  1 +
>  drivers/gpu/drm/xe/tests/xe_pci.c      | 62 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_pci_test.h | 15 +++++++
>  drivers/gpu/drm/xe/xe_pci.c            | 52 +--------------------
>  drivers/gpu/drm/xe/xe_pci.h            |  9 ----
>  7 files changed, 82 insertions(+), 60 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_pci.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_pci_test.h
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 3c60cbdf516c..aa433a7b59b7 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -6,6 +6,8 @@
>  #include <kunit/test.h>
>  
>  #include "tests/xe_bo_test.h"
> +#include "tests/xe_pci_test.h"
> +#include "tests/xe_test.h"
>  
>  #include "xe_bo_evict.h"
>  #include "xe_pci.h"
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index e66a8361ae1f..cf9dddf1a8d7 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -6,6 +6,7 @@
>  #include <kunit/test.h>
>  
>  #include "tests/xe_dma_buf_test.h"
> +#include "tests/xe_pci_test.h"
>  
>  #include "xe_pci.h"
>  
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 17829f878757..d410305c9b59 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -6,6 +6,7 @@
>  #include <kunit/test.h>
>  
>  #include "tests/xe_migrate_test.h"
> +#include "tests/xe_pci_test.h"
>  
>  #include "xe_pci.h"
>  
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> new file mode 100644
> index 000000000000..643bddb35214
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "tests/xe_pci_test.h"
> +
> +#include "tests/xe_test.h"
> +
> +#include <kunit/test.h>
> +
> +struct kunit_test_data {
> +	int ndevs;
> +	xe_device_fn xe_fn;
> +};
> +
> +static int dev_to_xe_device_fn(struct device *dev, void *__data)
> +
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct kunit_test_data *data = __data;
> +	int ret = 0;
> +	int idx;
> +
> +	data->ndevs++;
> +
> +	if (drm_dev_enter(drm, &idx))
> +		ret = data->xe_fn(to_xe_device(dev_get_drvdata(dev)));
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_call_for_each_device - Iterate over all devices this driver binds to
> + * @xe_fn: Function to call for each device.
> + *
> + * This function iterated over all devices this driver binds to, and calls
> + * @xe_fn: for each one of them. If the called function returns anything else
> + * than 0, iteration is stopped and the return value is returned by this
> + * function. Across each function call, drm_dev_enter() / drm_dev_exit() is
> + * called for the corresponding drm device.
> + *
> + * Return: Zero or the error code of a call to @xe_fn returning an error
> + * code.
> + */
> +int xe_call_for_each_device(xe_device_fn xe_fn)
> +{
> +	int ret;
> +	struct kunit_test_data data = {
> +	    .xe_fn = xe_fn,
> +	    .ndevs = 0,
> +	};
> +
> +	ret = driver_for_each_device(&xe_pci_driver.driver, NULL,
> +				     &data, dev_to_xe_device_fn);
> +
> +	if (!data.ndevs)
> +		kunit_skip(current->kunit_test, "test runs only on hardware\n");
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> new file mode 100644
> index 000000000000..de65d8c9ccb5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_PCI_TEST_H_
> +#define _XE_PCI_TEST_H_
> +
> +struct xe_device;
> +
> +typedef int (*xe_device_fn)(struct xe_device *);
> +
> +int xe_call_for_each_device(xe_device_fn xe_fn);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b990985b5771..302f7f588da1 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -635,55 +635,5 @@ void xe_unregister_pci_driver(void)
>  }
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> -struct kunit_test_data {
> -	int ndevs;
> -	xe_device_fn xe_fn;
> -};
> -
> -static int dev_to_xe_device_fn(struct device *dev, void *__data)
> -
> -{
> -	struct drm_device *drm = dev_get_drvdata(dev);
> -	struct kunit_test_data *data = __data;
> -	int ret = 0;
> -	int idx;
> -
> -	data->ndevs++;
> -
> -	if (drm_dev_enter(drm, &idx))
> -		ret = data->xe_fn(to_xe_device(dev_get_drvdata(dev)));
> -	drm_dev_exit(idx);
> -
> -	return ret;
> -}
> -
> -/**
> - * xe_call_for_each_device - Iterate over all devices this driver binds to
> - * @xe_fn: Function to call for each device.
> - *
> - * This function iterated over all devices this driver binds to, and calls
> - * @xe_fn: for each one of them. If the called function returns anything else
> - * than 0, iteration is stopped and the return value is returned by this
> - * function. Across each function call, drm_dev_enter() / drm_dev_exit() is
> - * called for the corresponding drm device.
> - *
> - * Return: Zero or the error code of a call to @xe_fn returning an error
> - * code.
> - */
> -int xe_call_for_each_device(xe_device_fn xe_fn)
> -{
> -	int ret;
> -	struct kunit_test_data data = {
> -	    .xe_fn = xe_fn,
> -	    .ndevs = 0,
> -	};
> -
> -	ret = driver_for_each_device(&xe_pci_driver.driver, NULL,
> -				     &data, dev_to_xe_device_fn);
> -
> -	if (!data.ndevs)
> -		kunit_skip(current->kunit_test, "test runs only on hardware\n");
> -
> -	return ret;
> -}
> +#include "tests/xe_pci.c"
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> index 9e3089549d5f..611c1209b14c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.h
> +++ b/drivers/gpu/drm/xe/xe_pci.h
> @@ -6,16 +6,7 @@
>  #ifndef _XE_PCI_H_
>  #define _XE_PCI_H_
>  
> -#include "tests/xe_test.h"
> -
>  int xe_register_pci_driver(void);
>  void xe_unregister_pci_driver(void);
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> -struct xe_device;
> -
> -typedef int (*xe_device_fn)(struct xe_device *);
> -
> -int xe_call_for_each_device(xe_device_fn xe_fn);
> -#endif
>  #endif
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
