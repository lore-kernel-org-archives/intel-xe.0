Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8EDEB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 15:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F185110E4CE;
	Wed, 19 Jul 2023 15:40:03 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5DC10E4CE
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 15:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689781201; x=1721317201;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DX3WauhiQJVfVmx9umsSOR05S5oJPFSGs3OIwdOD3WY=;
 b=O6aF+mqhL2a+umRENSmOv3bAzybFfyFx61q02lLMcIBWaKdFoZ+KBD/w
 EQdR9FrYEEeGBJRa/xzs9iTzj8LVWgqqJdSB0T09r4+JWhSjh5ibNYWRb
 L04akoI363el8dotFyHX+D2VlhjtBd9dKW5JSAQELtke+s168k59VQ/Z+
 JAilau9LQUTA6Yf+6KPUysDqrs+Trlmkkw+2beosga4PGq62xqPEyJTmN
 +YyMv3YeWzSKp3pnrFcwuXavlOfrVp7FDmmancLpvTCmxnZFTtK2jdPcF
 NoAPa739QCmw3GzwRRQzjg0fxYk2Hg4gBrBcMhf7vd1x4FhEMaduHaAOu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="346090686"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="346090686"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 08:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="789459449"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="789459449"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 19 Jul 2023 08:39:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 08:39:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 08:39:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 08:39:57 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 08:39:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXsy5JCOUIGuUf/XaPFk28ezwQxz/3LRXZ6vJV9MXxYKeqrPncn10s4bV7j18ktXs17wrJvHUFPqAutONu+3miNiSySvTCFERGe45ZU7GOGGSZ0oHT3eY1bIkGXQO2192n9msVLCf7SCQRVv9sKWVFctXmLIqqDXEhGvA3dWHx9Cb5DPZ22iu/ZJVT/7b32GL4W42sJXO63H9vLBacvANxVI7rxJtAvsybOY7tFACUtcdDIEUUiE8slhme8197NfTfncmYxaL5y6zpZBRF3iacyRDIkmIdQeVQxvV1q4h0gAUnKr/rpsZ1I9ic8yLEuks2ZZkN5tnjfj8TNctnGwPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcIYZXsxpxOJttBOckgoTSebx0Kje6Pkp1wbUniyO5U=;
 b=nMNanMSfYsjrOcAxqG+Khe4fVDqv5cfLWJohxEftD3zGgJvblIPMd6dcGVMnEqUdmgy19jm2ZWF9/GB+XUzc5N3DEW6CXpnZM0/q3QGGM4eQlYLwwNXF99BTYeRAvXq7WRiVvRVas5IB7REahpayZJ7mvW66vUXqgiQwWvyZDLAWtd2Phk/MurgrIP1OKA/xhewhQITEjnyACLV9yMy46F8XVlADZ1U/1Ot8LApptYVw5TJKjH1lBoKLmK7pDwJerHkEixfyMfebdC6Fcp07cJOeYVyHSf9EvqGYyz8Y0COwayv6qJNMUCqmNmLB5lcx3epovQvzct/iBZvUX8UxHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB8251.namprd11.prod.outlook.com (2603:10b6:510:1a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Wed, 19 Jul
 2023 15:39:55 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 15:39:55 +0000
Date: Wed, 19 Jul 2023 17:39:45 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZLgDwdTBzgukRriC@fdugast-desk.home>
References: <20230719135108.7-1-francois.dugast@intel.com>
 <20230719135108.7-3-francois.dugast@intel.com>
 <ZLgAgdqe9X5fuFUL@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZLgAgdqe9X5fuFUL@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR2P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::7) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: f8c4de96-8f5d-4c9d-0bae-08db886e6632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oXhWQOarCad8n4HgyKSlj9l/k4f3BktZzGhKGqdhPQASxgqVYdtDVeObgs+3qLzlqEbvBD22rcUbxYdFapGm9wIESo25C7KIOvqKyA+dQTFCmpGBjF7sReowRqKMTAffEyy7tpoo3uQZMt8pM/xgG543Pl5MOmCk5nnXkk0mJVhfUAduDiv/ceX45rnoxqUtQXK4CRTd6LXxjL89IjhmDFkQszYt2HkCuvazOZOxuk+R1UyxkUrkckA3tcFyC54DJlJmGl0mIuXO0vw+q+qv55dhgxadgf0YY9bN0KUiaAbCi+3tO2QsfAyvqn6OQknHeUnJgsn4AJ9WQFVlnDF7q/qpjz+pv7F8D5BgVhZLC+4tYa8d6nTICTf9gMG3F3RnhsU6f2GeT5BZuVJVhnV42V4l3pIf0lcJFTuYigabSrdSAfkMsZHN36yLucp30E6W3X6M8JhfDyPJr7oXZ9BQSGIikwstzWI30BclCeRymLVVQH9GbeIs3fmQjREp6cMxE3XJAeCnwh8I8IcHgy39/eXueEhEXnx65XI5NiK9YrOpuQtPeCho2xDFzkULoLNB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199021)(4326008)(36916002)(6486002)(6666004)(478600001)(83380400001)(86362001)(30864003)(2906002)(44832011)(6506007)(186003)(6512007)(107886003)(26005)(316002)(9686003)(38100700002)(6862004)(82960400001)(66476007)(6636002)(41300700001)(66556008)(66946007)(36756003)(8676002)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AMGbVbyR+Zv4AbfU/Wuhy1Mp5EYPA4oQOdx71Rwp2fHYxgvD0x41YWsXBY?=
 =?iso-8859-1?Q?0yMaRkHrmiCzmXEJVhcjb125Vk8jCJbQPl/e9QnBkiIApKpTXHTQMU6SmZ?=
 =?iso-8859-1?Q?tOWiMHC49JSRLTphNe6NSp9UAsgSWExN30Tgh2m20jPWB8faC4ml9u7LyF?=
 =?iso-8859-1?Q?YfI6kpO8yJaAPR91r2c1WIliXhVg8jwNPLkYunekb4fny0scoLwLYDCKl4?=
 =?iso-8859-1?Q?2MK5EirxSOz3pG/9NaFeEq5qn0G8LCYcLrZlKW+b62gzWNqTApi7nZ9931?=
 =?iso-8859-1?Q?p0/ECy/mwn2SJoqIuCRltXKaCY2qRTcqXba6D4jSbwvf96KbMcclGTblVq?=
 =?iso-8859-1?Q?hFBYwZGlISVcoAaNd+bRTbTQs0MccCaDDFEb2207tuZlHLdXyKby+Myfzq?=
 =?iso-8859-1?Q?KdjJnkSLhcnmMiUncjJWt5oXn40N6J2DOcHA0t+A7rZEiF/hWexx6bkQ6x?=
 =?iso-8859-1?Q?bzuyg+B+NoRQtS/AxZ5iYC3umEcXtj9gzn3jSsDzifLAcqbywIxy9tuSnC?=
 =?iso-8859-1?Q?91yQceue2TzaWvr6wXt6YjKY+5S489rpbI2n+1MbUeaH1lMf4YqwZoEGpP?=
 =?iso-8859-1?Q?A2pU+LezBcNoXXnwyDdQmt27AztWvczr8Gaxwd3vnoXb5+TzUvlNb7B1Ll?=
 =?iso-8859-1?Q?uW93829nfY0g4JV8XDxFi7LhuJ349TKh+xP1dQ0xy8OR91ckuG0xnxQqOn?=
 =?iso-8859-1?Q?JVc+HYqDNnTsZH6VuQ0xiW8RWlopxXxA5BRTeEPThUCxMicw/sKP5kp2Dy?=
 =?iso-8859-1?Q?EVUKoAtQ9C0hWSO6thGzjzRsOdEbpqbOBCb8aS3HtWEHBVIJcUKiEl24rH?=
 =?iso-8859-1?Q?EvIdPEG52KzV0r1kd9XeD+mKtAlGLSQOtMr095fywQJEYoXlOlY2TUzhVs?=
 =?iso-8859-1?Q?d44clz4/6ANUwIqfyGYmM83VY1YhNzjtmXHDM4i7qAEY5Jm2OCVPpgpLXS?=
 =?iso-8859-1?Q?U2FmY1Fyy1bWGhOxqGL75c/b+8GY8MhOrL4ZmrvsXMcSInLAw5P+9XEVMd?=
 =?iso-8859-1?Q?s6xGq7z+bTvMRXFYFGuGetYPmLu56ihJx36kLG0DHYJXrtSESfq11MgK46?=
 =?iso-8859-1?Q?0qk6thif9B0GOTG7ywsYKYbgvcMDMQ3Yh3iVu9rWVX/eQV+G3uTvCBSKTN?=
 =?iso-8859-1?Q?nt/cJ+yRKpclhQrQgtpeVHSbvqlpHO1KZ/dSTWNtBM6WKyckH/yZ+QlQ61?=
 =?iso-8859-1?Q?HKx2f8yAdymIEndy2nIowMvL++LGYTpDW1uSt9VKpo6kfOKZjt8KyWG7kC?=
 =?iso-8859-1?Q?ErTZJXoL4D8JAOxJxVPUnXZmBMkAYM0OoCDBJAIz1BAzzVu3dRnZBy1l96?=
 =?iso-8859-1?Q?nGlFygugf6Pd+VYHYrEifWpMWMDsUq73ZVhq8p2cpWmkGX2RYtHL8zFdi9?=
 =?iso-8859-1?Q?M8ndFexkw7uBXw+rbS9ehKs8+drkHw9rs6kqmlM914DZLCCIpF34/LFXrD?=
 =?iso-8859-1?Q?8uRANb2YAZq4QXoQ+RaZZrYHSQ8zaIwf213KuMT72Oka3FGdOUc2pnXwnx?=
 =?iso-8859-1?Q?U/NCoc56TLutaTPrbYYBVqnKn1IlSOgjooOThKpUqE+OHMQaviA2h0Dzw+?=
 =?iso-8859-1?Q?le8fgMpDTWkB30DPuD+As3Whb8/4YoeICPMTm1jFyaBUWc5GuCQutGOT9F?=
 =?iso-8859-1?Q?kJxZfcmIDlApu9xBjXl5PAFuuKXVEXgHB83XQJMqGnfxzAxvMwR9rA5g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c4de96-8f5d-4c9d-0bae-08db886e6632
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 15:39:54.8016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BI24nq76deH35B9eJEuhPI4JQyHUvUA7d4qt91UtbzjfKBxH232bzlSA1fD2piVrJJAj3O6Z2bg9Mn5Gj6LpxA188tTrHNFDkkkL4WupeHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8251
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Cleanup style warnings and
 errors
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 11:25:53AM -0400, Rodrigo Vivi wrote:
> On Wed, Jul 19, 2023 at 01:51:08PM +0000, Francois Dugast wrote:
> > Fix 6 errors and 20 warnings reported by checkpatch.pl.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  .../xe/compat-i915-headers/soc/intel_dram.h   |  5 ++++
> >  .../xe/compat-i915-headers/soc/intel_pch.h    |  5 ++++
> >  drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 --
> >  drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
> >  drivers/gpu/drm/xe/xe_gt_mcr.c                |  2 +-
> >  drivers/gpu/drm/xe/xe_gt_sysfs.c              |  4 +---
> >  drivers/gpu/drm/xe/xe_guc.c                   | 14 +++++------
> >  drivers/gpu/drm/xe/xe_hw_engine_types.h       |  2 +-
> >  drivers/gpu/drm/xe/xe_map.h                   |  2 +-
> >  drivers/gpu/drm/xe/xe_migrate.c               |  2 +-
> >  drivers/gpu/drm/xe/xe_reg_whitelist.c         | 24 ++++++++++++++-----
> >  drivers/gpu/drm/xe/xe_res_cursor.h            | 11 ++++-----
> >  drivers/gpu/drm/xe/xe_wopcm.c                 | 10 ++++----
> >  13 files changed, 49 insertions(+), 36 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
> > index 1532ca7e0af6..65707e20c557 100644
> > --- a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
> > +++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
> > @@ -1 +1,6 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> >  #include "../../../i915/soc/intel_dram.h"
> > diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
> > index 823803f7e853..9c46556d33a4 100644
> > --- a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
> > +++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
> > @@ -1 +1,6 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> >  #include "../../../i915/soc/intel_pch.h"
> > diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > index fad4c66a8226..37cba91be10d 100644
> > --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > @@ -250,8 +250,6 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
> >  	 * pretend the BIOS never had it enabled.
> >  	 */
> >  	intel_plane_disable_noatomic(crtc, plane);
> > -
> > -	return;
> >  }
> >  
> >  static void plane_config_fini(struct intel_initial_plane_config *plane_config)
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 8e086c9bd309..828a9fea420b 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1821,7 +1821,7 @@ int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> >  	XE_BUG_ON(!ww);
> >  
> >  	tv_bo.num_shared = num_resv;
> > -	tv_bo.bo = &bo->ttm;;
> > +	tv_bo.bo = &bo->ttm;
> >  	list_add_tail(&tv_bo.head, &objs);
> >  
> >  	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > index ff4075387564..c56815af0686 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > @@ -273,7 +273,7 @@ static void init_steering_inst0(struct xe_gt *gt)
> >  
> >  static const struct {
> >  	const char *name;
> > -	void (*init)(struct xe_gt *);
> > +	void (*init)(struct xe_gt *gt);
> >  } xe_steering_types[] = {
> >  	[L3BANK] =	{ "L3BANK",	init_steering_l3bank },
> >  	[MSLICE] =	{ "MSLICE",	init_steering_mslice },
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > index b955940e8dc6..c69d2e8a0fe1 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > @@ -37,10 +37,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
> >  	int err;
> >  
> >  	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
> > -	if (!kg) {
> > -		drm_warn(&xe->drm, "Allocating kobject failed.\n");
> 
> why is this getting removed?
> 
> I know, it should probably be replaced by a drm_err instead of
> warn, but what's the checkpatch complain here?

The issue reported by checkpatch is:

	WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
	#41: FILE: drivers/gpu/drm/xe/xe_gt_sysfs.c:41:
	+       if (!kg) {
	+               drm_warn(&xe->drm, "Allocating kobject failed.\n");

I think it is valid.

Francois

> 
> > +	if (!kg)
> >  		return;
> > -	}
> >  
> >  	kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
> >  	kg->gt = gt;
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index ed90d738d673..8ae026838702 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -396,14 +396,12 @@ static int guc_wait_ucode(struct xe_guc *guc)
> >  		struct drm_printer p = drm_info_printer(drm->dev);
> >  
> >  		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
> > -		drm_info(drm, "GuC load failed: status: Reset = %d, "
> > -			"BootROM = 0x%02X, UKernel = 0x%02X, "
> > -			"MIA = 0x%02X, Auth = 0x%02X\n",
> > -			REG_FIELD_GET(GS_MIA_IN_RESET, status),
> > -			REG_FIELD_GET(GS_BOOTROM_MASK, status),
> > -			REG_FIELD_GET(GS_UKERNEL_MASK, status),
> > -			REG_FIELD_GET(GS_MIA_MASK, status),
> > -			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> > +		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
> > +			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
> > +			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
> > +			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
> > +			 REG_FIELD_GET(GS_MIA_MASK, status),
> > +			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> >  
> >  		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
> >  			drm_info(drm, "GuC firmware signature verification failed\n");
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > index d788e67312b9..803d557cf5aa 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > @@ -104,7 +104,7 @@ struct xe_hw_engine {
> >  	/** @fence_irq: fence IRQ to run when a hw engine IRQ is received */
> >  	struct xe_hw_fence_irq *fence_irq;
> >  	/** @irq_handler: IRQ handler to run when hw engine IRQ is received */
> > -	void (*irq_handler)(struct xe_hw_engine *, u16);
> > +	void (*irq_handler)(struct xe_hw_engine *hwe, u16 intr_vec);
> >  	/** @engine_id: id  for this hw engine */
> >  	enum xe_hw_engine_id engine_id;
> >  };
> > diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
> > index 032c2e8b5438..f62e0c8b67ab 100644
> > --- a/drivers/gpu/drm/xe/xe_map.h
> > +++ b/drivers/gpu/drm/xe/xe_map.h
> > @@ -1,4 +1,4 @@
> > -// SPDX-License-Identifier: MIT
> > +/* SPDX-License-Identifier: MIT */
> >  /*
> >   * Copyright © 2022 Intel Corporation
> >   */
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 2bb7d524af24..4c6f299fd024 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -475,7 +475,7 @@ static void emit_pte(struct xe_migrate *m,
> >  			bb->cs[bb->len++] = lower_32_bits(addr);
> >  			bb->cs[bb->len++] = upper_32_bits(addr);
> >  
> > -			xe_res_next(cur, min(size, (u32)PAGE_SIZE));
> > +			xe_res_next(cur, min_t(u32, size, PAGE_SIZE));
> >  			cur_ofs += 8;
> >  		}
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > index ea6dd7d71b59..e83781f9a516 100644
> > --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > @@ -89,18 +89,30 @@ void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
> >  	deny = val & RING_FORCE_TO_NONPRIV_DENY;
> >  
> >  	switch (val & RING_FORCE_TO_NONPRIV_RANGE_MASK) {
> > -	case RING_FORCE_TO_NONPRIV_RANGE_4: range_bit = 4; break;
> > -	case RING_FORCE_TO_NONPRIV_RANGE_16: range_bit = 6; break;
> > -	case RING_FORCE_TO_NONPRIV_RANGE_64: range_bit = 8; break;
> > +	case RING_FORCE_TO_NONPRIV_RANGE_4:
> > +		range_bit = 4;
> > +		break;
> > +	case RING_FORCE_TO_NONPRIV_RANGE_16:
> > +		range_bit = 6;
> > +		break;
> > +	case RING_FORCE_TO_NONPRIV_RANGE_64:
> > +		range_bit = 8;
> > +		break;
> >  	}
> >  
> >  	range_start = reg & REG_GENMASK(25, range_bit);
> >  	range_end = range_start | REG_GENMASK(range_bit, 0);
> >  
> >  	switch (val & RING_FORCE_TO_NONPRIV_ACCESS_MASK) {
> > -	case RING_FORCE_TO_NONPRIV_ACCESS_RW: access_str = "rw"; break;
> > -	case RING_FORCE_TO_NONPRIV_ACCESS_RD: access_str = "read"; break;
> > -	case RING_FORCE_TO_NONPRIV_ACCESS_WR: access_str = "write"; break;
> > +	case RING_FORCE_TO_NONPRIV_ACCESS_RW:
> > +		access_str = "rw";
> > +		break;
> > +	case RING_FORCE_TO_NONPRIV_ACCESS_RD:
> > +		access_str = "read";
> > +		break;
> > +	case RING_FORCE_TO_NONPRIV_ACCESS_WR:
> > +		access_str = "write";
> > +		break;
> >  	}
> >  
> >  	drm_printf_indent(p, indent, "REG[0x%x-0x%x]: %s %s access\n",
> > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> > index 2a6fdd284395..dda963fe3300 100644
> > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > @@ -51,15 +51,14 @@ struct xe_res_cursor {
> >  static struct drm_buddy *xe_res_get_buddy(struct ttm_resource *res)
> >  {
> >  	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
> > +	struct ttm_resource_manager *mgr;
> >  
> > -	if (res->mem_type != XE_PL_STOLEN) {
> > +	if (res->mem_type != XE_PL_STOLEN)
> >  		return &xe->tiles[res->mem_type - XE_PL_VRAM0].mem.vram_mgr->mm;
> > -	} else {
> > -		struct ttm_resource_manager *mgr =
> > -			ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> >  
> > -		return &to_xe_ttm_vram_mgr(mgr)->mm;
> > -	}
> > +	mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> > +
> > +	return &to_xe_ttm_vram_mgr(mgr)->mm;
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> > index 35fde8965bca..d9acf8783b83 100644
> > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > @@ -47,12 +47,10 @@
> >   */
> >  
> >  /* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
> > -#define DGFX_WOPCM_SIZE			SZ_4M	/* FIXME: Larger size require
> > -						   for 2 tile PVC, do a proper
> > -						   probe sooner or later */
> > -#define MTL_WOPCM_SIZE			SZ_4M	/* FIXME: Larger size require
> > -						   for MTL, do a proper probe
> > -						   sooner or later */
> > +/* FIXME: Larger size require for 2 tile PVC, do a proper probe sooner or later */
> > +#define DGFX_WOPCM_SIZE			SZ_4M
> > +/* FIXME: Larger size require for MTL, do a proper probe sooner or later */
> > +#define MTL_WOPCM_SIZE			SZ_4M
> >  #define GEN11_WOPCM_SIZE		SZ_2M
> >  
> >  #define GEN12_MAX_WOPCM_SIZE            SZ_8M
> > -- 
> > 2.34.1
> > 
