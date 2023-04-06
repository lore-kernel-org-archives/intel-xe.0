Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FB1C77B6E
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 19:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7CE10E0C8;
	Thu,  6 Apr 2023 19:20:17 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F90B10E0C8
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 19:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680808815; x=1712344815;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XguqhCv15gMGiWqXpVkK6MGcwMe5xF6FC2OwwCr6hjU=;
 b=CsJS97sXV+uNcgIas/bSfGjRrOu48SHnypEwNEoV988QPhrQPPMA18PK
 gqDgDGVJ1eriuulK/GKykbHo9+TXIeQcfo8Qha8fHN3v+XgSbvdHgm5sE
 DJ87JA/xmdT+sQJJJuJEsIC8YPfqqAqq5ysbWgVb+S/FB/yBh7osNGqQV
 R16dmQNQs3Yc39bwS13UtmtFPi93QFrqNBxe3tjtkQr0VgV/Gjilb5itl
 ZmbVONjdiz5vd5PDRKQOdmdJNyJitX2W+jHqq1KYrtdlZ7K98sqkQ280X
 vIxKZrWaYXk1NKTKPXNsYXlW7sSIDgOaOy8oTYFrQY8kjREau+ITUU0by g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="407945203"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="407945203"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 12:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="1016983948"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="1016983948"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 06 Apr 2023 12:20:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 12:20:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 12:20:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 12:20:06 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 12:20:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7YIO/5Khbkc6yjqzdcwGVVsyRanE3vMpO96JO3a0ggWD8H4/lz16us8Mt4izulynyo1BYCyV0mSxbkQkDQETQtAjji70mhtQ4ML9Ia1XSf5tYaPHrmQr+UO/hFBJQaQP3D8PK7yggdu0yNGHws3yYEp41iS96d+SjTpfGbEPM3DnaDpOT2s9gUVqYt+mj+0e+BqGf6inOeV+BIufvL/e/VTmA8a3Lb06e/VsRHrKGmu4mCCYLeJhu8F5iqGBLjyj0SCG0TdPeu1vYoEwwK2Xq264bOonvWdVaJ5w0tjcmsbj35EYwF4XDq2nBFgRqau7a/6WXnntmMCbaiyE5vO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hv2L8nS7kfwwW4eo2vYrtpoBWV2JObGhUDtkoUAjpmA=;
 b=Jbo0nUSuktb5RDLDku8TTt8NMevmAxxKLcpmadPxRMBiWy0qz1EG6sF9qwUpI1FJHXZb3q6iCORVoDdgOUM4vE9PoHSR6c5UjGU7e84/kxQk764OnTaaBhdkQbpfLM+E3m8kGbIy/zZu0SLEZT8KDkH+H1JeOxKpcmODhH1YyrM7/yqQEtetNZT4YE5LvGhlesITZYAk0EPqoqdPpjgbaCULNgFYeLshtibjKquWpz7tnuivv/AbJDqK+FMomxcNS0eE1PTkGXBAKqWONWYrLYDFzckCWlUxePxnFxoVIp4RyuOmymDuCYvFdOKPIFKnvxI9bzg+8T3zX4+Qc+Y/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN0PR11MB5693.namprd11.prod.outlook.com (2603:10b6:408:164::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Thu, 6 Apr
 2023 19:20:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6277.031; Thu, 6 Apr 2023
 19:20:03 +0000
Date: Thu, 6 Apr 2023 15:20:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
Message-ID: <ZC8bYD8aegpT7M7s@intel.com>
References: <20230405170815.524853-1-yu.bruce.chang@intel.com>
 <20230405172857.gf6ubjtrhyjkxztg@ldmartin-desk2.lan>
 <CY8PR11MB6940D86EF2BABB63945DE52BC3909@CY8PR11MB6940.namprd11.prod.outlook.com>
 <20230405182952.m65hoo6khvprjjzq@ldmartin-desk2.lan>
 <CY8PR11MB694007773EFAEB6AC9BA42EFC3909@CY8PR11MB6940.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CY8PR11MB694007773EFAEB6AC9BA42EFC3909@CY8PR11MB6940.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BN0PR11MB5693:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f2be9f-90a0-44e8-8e0e-08db36d3ec49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 849DjNgbi8rbaaU5/I/EHKr1Dx+4cr+py8XEMVflQB8K7eCR7oQpzc8tnM0quCn29EbA4cU2d51BRbOtaQgyV+5aX2N5nRn7K4WGiJ/ArZoIiT93JhVvUWREI8tH2lcwoO1xeErR05tklHXyqRGIOzC/Mwq+S1bsqr7QN8/zs9aY2w/2bgUDdI8yJdaKmgqdz65AoGR+yM+xaA7qzrQivWNOcZY8w1nVjlpsY0rpwRZQjY/tM3ne2VMgxf3dZtdRQddGJa9lbZOkVLVhSagfFHM1M7g2WHSl0EaMs8K9c+DcwHjBPHEgTbmeqhwm/ri5n8wanYtB/IsjMj9RU8Wp1GFXGOgH94BnzzBcO0y6B6IWvMOfHhHlgJxioOYZ4OgicNV8ufqe8pr+nLbqa1LR6QXt0AIczTfUUHoIPSZ6x6u3E4fncvaDdvyOYGRVV31E3mYJn5rOO2I06rEwbhkK5YJCLqta9p0GN5tZh/0hXYRjqyuSipGWH2bPj47TsQfBmxR8v1cyXahKTNYPoUMO0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199021)(83380400001)(966005)(2616005)(6506007)(186003)(54906003)(6636002)(37006003)(478600001)(53546011)(26005)(6512007)(6486002)(44832011)(2906002)(66476007)(5660300002)(38100700002)(36756003)(4326008)(8676002)(6862004)(82960400001)(41300700001)(86362001)(66556008)(8936002)(66946007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JITLPXdFWapWTUvcD358ylz4iGT8V0OAS8u09PLJ9UxOih6BObDcOXkJefYE?=
 =?us-ascii?Q?20W3FQ1kLl1A1Mm9xr+hwv6GQsRrtuUC0cOZ5K/bCostZBI0++mfLGQbuqFd?=
 =?us-ascii?Q?DJhHunBZeZlaDySyYLbYRB9MTFI1Q1bXaG+bcu4PUei9Sk+v8g+gddIrIMWk?=
 =?us-ascii?Q?D+WX2jqWCsPTTePJcB0pWBKyMaxL0sreMSgEV6qz1zfGK10A+3x0aWXx9i8r?=
 =?us-ascii?Q?jtXKHn2Vy+fYp70Nk+YKubsNyJn07DV5rJP2GDoR1DGZS3oqVIq1j3MUcJIE?=
 =?us-ascii?Q?BePLNR3tWiNQWBdv3levSq7ewpmzBHY03l1T1CpQ6iH6HWM2Elg3ek4+sYY7?=
 =?us-ascii?Q?dnw3ImlOi5pvk1OoAc5E+WgRsYUeYdagQFhehkymt3TxxjLiHTWCh2iEk5X6?=
 =?us-ascii?Q?wVp1i0Cn8KgR3VQodkcTvv3gA1keUTaYAskb8Ct0lowtEoHFG0hHkrhhbpys?=
 =?us-ascii?Q?c8PvtCMiNzYIJwPhaSyd1a7xehsVGt/bccfeJpAM2vfYUabKwp0aP8ON8zOq?=
 =?us-ascii?Q?QqSzvfd6r1Yg3xiSGU2SO7gMEYooWk5JSbuuT3HZ+fT52ZJ+QMsZghrdtd8K?=
 =?us-ascii?Q?36PBpLY6ABUssK+MuLgNQaC8EiK03+6Vl2YuP03fXCs+PRbRt3PkceSW7DGI?=
 =?us-ascii?Q?S8yVdyQjor5f9vWuJoAPY+z5MjZx8zg08InCGcHYk2PGREDzaqNuhvRm665m?=
 =?us-ascii?Q?rhORP6COubnv2yz5XnNKmUj2Atanp0Vu5uh4ydmQzryULzOgMncZdl1ryZ65?=
 =?us-ascii?Q?aZYrRjQn1mJfbFDcc14I2Jb7TFIitIk1X8lkCySUtZaRrXKGNXx/Ga/sH4E7?=
 =?us-ascii?Q?HJj8EufvxhQ00F2T3ZZyRujDaZxalVlZpScJuaioAjV6zaZpulJl1EINzRuv?=
 =?us-ascii?Q?aRwnIxyRdMWQnuqeuhkU8Bco6tHJVEWJ6FXdfY7L1rpul5A4NGtOchks6thO?=
 =?us-ascii?Q?E+oQOyvL1pyAhdKHyhheT8lJiQqOTBEPK9zGPd45q4jumujU4fsCPyben9H4?=
 =?us-ascii?Q?uDaWpDtLT/JkOdMb5DGCBTxms5v0Wsj7+F8cI+YHD7xlbBytTJcTHrTNjHPO?=
 =?us-ascii?Q?zDk0EzCY4px9nijrMGNSk0V6hxVjIK/9geeUrKOyVRo0Z/wiLYtYmHkx6tZ3?=
 =?us-ascii?Q?02dkIVXsB/wsoMDxSqd5s7/bC9C7OkRvHTXnxxQs4aVAyKzrGfSeqW5Gq1Mt?=
 =?us-ascii?Q?PphLUK1cHN6963zPPIruhCRtI149VMQb3mHgKpb1w6RRN5/i98J7eZI977Ir?=
 =?us-ascii?Q?bZGOJKoxo1htXG1+rmnPRm9PqhCBx95+5c+5Kurjz9OtZ3eqlPrsRH6J27vp?=
 =?us-ascii?Q?Q78WV2SEsswseMpcB2435JILTwKiBYnMe5QofvV2KtYqS7IOQF1xe/dj6UvO?=
 =?us-ascii?Q?qpFB5NlCw73nNBTeS4VcKtkzSm+71q/4RWZX/geub7AyE+dg1+GamVSrYqyh?=
 =?us-ascii?Q?3jng/58DsRtEvBxAHNQs8ngHT2EYvMKxBhpF387Bj5lBfJXJS5TvzDQa3s+3?=
 =?us-ascii?Q?D30HzqOkQ3gaCBB/nvHwC5Ze1vi9IDgzabamVlacygyXLmQ26ePCYtR2ruU3?=
 =?us-ascii?Q?SlF/k1yeWqXzjQbjo0ghzAKHmzHJTFS6hz76glq5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f2be9f-90a0-44e8-8e0e-08db36d3ec49
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 19:20:03.7556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmq/lUF+UUvVLNIjF+VUwAwEtKzr0lFTNBDjA5M13uekZhZ7IQ08P5wVfTEQo6D1EDebQpaw+ReXBLi1u2XiCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5693
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: follow up on the patch to fix pvc
 unload issue
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 07:52:17PM +0000, Chang, Yu bruce wrote:
> 
> 
> > -----Original Message-----
> > From: De Marchi, Lucas <lucas.demarchi@intel.com>
> > Sent: Wednesday, April 5, 2023 11:30 AM
> > To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Subject: Re: [Intel-xe] [PATCH] drm/xe: follow up on the patch to fix pvc
> > unload issue
> > 
> > On Wed, Apr 05, 2023 at 11:14:51AM -0700, Chang, Yu bruce wrote:
> > >
> > >
> > >> -----Original Message-----
> > >> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> > >> Sent: Wednesday, April 5, 2023 10:29 AM
> > >> To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> > >> Cc: intel-xe@lists.freedesktop.org; Vivi, Rodrigo
> > >> <rodrigo.vivi@intel.com>
> > >> Subject: Re: [Intel-xe] [PATCH] drm/xe: follow up on the patch to fix
> > >> pvc unload issue
> > >>
> > >> On Wed, Apr 05, 2023 at 05:08:15PM +0000, Chang, Bruce wrote:
> > >> >created xe_ttm_sys_mgr.h as suggested by Lucas also fixed a compile
> > >> >warning found by Lucas
> > >>
> > >> Let's rather make this a fixup so we don't keep breaking and fixing the
> > build.
> > >> We are still rebasing the tree, so let's keep this as part of the original
> > commit.
> > >> Please commit with --fixup=01362fbe5e53
> > >>
> > >Thanks Rodrigo for helping fix this!
> > >
> > >> >
> > >> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > >> >Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > >> >Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
> > >> >---
> > >> > drivers/gpu/drm/xe/xe_device.c      |  1 +
> > >> > drivers/gpu/drm/xe/xe_device.h      |  1 -
> > >> > drivers/gpu/drm/xe/xe_ttm_sys_mgr.c |  1 +
> > >> >drivers/gpu/drm/xe/xe_ttm_sys_mgr.h | 13 +++++++++++++
> > >> > 4 files changed, 15 insertions(+), 1 deletion(-)  create mode
> > >> >100644 drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
> > >> >
> > >> >diff --git a/drivers/gpu/drm/xe/xe_device.c
> > >> >b/drivers/gpu/drm/xe/xe_device.c index 4fb9aff27686..85caf81ae686
> > >> >100644
> > >> >--- a/drivers/gpu/drm/xe/xe_device.c
> > >> >+++ b/drivers/gpu/drm/xe/xe_device.c
> > >> >@@ -27,6 +27,7 @@
> > >> > #include "xe_pcode.h"
> > >> > #include "xe_pm.h"
> > >> > #include "xe_query.h"
> > >> >+#include "xe_ttm_sys_mgr.h"
> > >> > #include "xe_ttm_stolen_mgr.h"
> > >>
> > >> needs to be sorted alphabetically. See
> > >> f4b0bb728995 ("drm/xe: Sort includes")
> > >>
> > >What if those headers have dependency? Such as ggtt will depend on
> > >either vram_mgr or sys_mgr.
> > 
> > headers are always self-contained. If they depend on something they should
> > either include or fwd declare. We prefer fwd declarations so we keep header
> > dependencies to a minimum.
> > 
> Make sense!
> 
> > >
> > >> > #include "xe_vm.h"
> > >> > #include "xe_vm_madvise.h"
> > >> >diff --git a/drivers/gpu/drm/xe/xe_device.h
> > >> >b/drivers/gpu/drm/xe/xe_device.h index d9d1b09a8e38..d277f8985f7b
> > >> >100644
> > >> >--- a/drivers/gpu/drm/xe/xe_device.h
> > >> >+++ b/drivers/gpu/drm/xe/xe_device.h
> > >> >@@ -116,5 +116,4 @@ static inline bool xe_device_has_flat_ccs(struct
> > >> >xe_device *xe)  }
> > >> >
> > >> > u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size); -int
> > >> >xe_ttm_sys_mgr_init(struct xe_device *xe);
> > >>
> > >> there was a blank line here that needs to remain
> > >>
> > >So, there needs to be a blank line before #endif It seems the original
> > >file was missing the blank line already.
> > 
> > I thought it was there already before your patch. It's not a requirement, but
> > it's better to follow the same style everywhere
> > 
> > >
> > >I did a quick check, there are about 7 headers violates this.
> > 
> > let's add the newline in them
> > 
> Ok, I will do it
> 
> > >
> > >Is there a way to enforce using a script to help insert a line before
> > >push/code review?
> > 
> > we are going to have hooks to plug in the CI infra. This can be one of the
> > checks. See https://gitlab.freedesktop.org/drm/xe/ci/-/merge_requests/10
> > 
> > 
> > >
> > >> > #endif
> > >> >diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > >> >b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > >> >index cf5f4f73d4dc..9c2f7d4936d8 100644
> > >> >--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > >> >+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > >> >@@ -12,6 +12,7 @@
> > >> >
> > >> > #include "xe_bo.h"
> > >> > #include "xe_gt.h"
> > >> >+#include "xe_ttm_sys_mgr.h"
> > >>
> > >> some thing here, this is the header for this specific file. It should
> > >> follow what we do everywhere else and be the first include.
> > >> See f4b0bb728995 ("drm/xe: Sort includes")
> > >>
> > >This was from the original code as well.
> > 
> > original code? xe_ttm_sys_mgr.c is being added now
> >
> It was a rename: was xe_ttm_gtt_mgr.c.
> 
> I will change it.
>  
> > >
> > >I think it would be great to put this requirement in a coding standard so it
> > will be easily to follow.
> > >Not sure if a script is a better idea instead of relying on developers.
> > 
> > eventually we are going to have that, when the CI hooks mentioned above.
> > Right now we rely on people following what is around, which is always a great
> > way to know how to follow the coding style.
> > 
> > >
> > >> >
> > >> > struct xe_ttm_sys_node {
> > >> > 	struct ttm_buffer_object *tbo;
> > >> >diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
> > >> >b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
> > >> >new file mode 100644
> > >> >index 000000000000..3d70c452a660
> > >> >--- /dev/null
> > >> >+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
> > >> >@@ -0,0 +1,13 @@
> > >> >+/* SPDX-License-Identifier: MIT */
> > >> >+/*
> > >> >+ *  * Copyright (c) 2022 Intel Corporation
> > >>
> > >> we are in 2023
> > >>
> > >Yes, I also realized this, I assume this needs to be cleaned up for all
> > >files. Maybe better to have a separate task to clean up all files every year?
> > Some files are still in 2021.
> > 
> > not really. We don't bother updating them even if we could. But when we
> > add new files, we should put the year we are in.
> > 
> This was also a rename from existing xe_ttm_gtt_mgr.h to xe_ttm_sys_mgr.h
> 
> I can make the change.

Lucas and Bruce, I'm really sorry for having rushed the patch and the fixup.
My bad.
So, let's have a final clean patch. Even if the best to do now is a double
revert with a clean patch on top, so on the next rebase we can remove the
previous versions and the reverts. Or another fixup!. Up to you and just
let me know so I can try to help here, but next time without rushing it out.

> 
> Thanks,
> Bruce
> 
> > 
> > thanks
> > Lucas De Marchi
> > 
> > >
> > >> Lucas De Marchi
> > >>
> > >> >+ *   */
> > >> >+
> > >> >+#ifndef _XE_TTM_SYS_MGR_H_
> > >> >+#define _XE_TTM_SYS_MGR_H_
> > >> >+
> > >> >+struct xe_device;
> > >> >+
> > >> >+int xe_ttm_sys_mgr_init(struct xe_device *xe);
> > >> >+
> > >> >+#endif
> > >> >--
> > >> >2.25.1
> > >> >
