Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF6DC48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 22:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4177A10E26C;
	Tue, 13 Feb 2024 22:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ImUFhNgt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D3D10E26C
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 22:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707862796; x=1739398796;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8kIMlAtAkSWWBK8iTMCPNEQgtI+04ivxj4ZzQE7xLj0=;
 b=ImUFhNgtrWDLixy9bqQfClwaLD6Yhw3YD9XVoSsXDJZ9+yBdkbVP/muD
 vPrMnY4qEe79FOLe3Vjd7Aq1mwG5OG9xi5drb7gSxeqjK6oIgC7UA6/B6
 +Xmg6tQHo4I8SXfcJwz2c/4ytSb58QQhacfR4uy7JUAowfUuqFYuldfuM
 v3kFcSrXHV0EnI7Yqv5GIfh6YHLF5Q3n2JMNKSjLgiyPS8ZFXe1LrprPm
 m18lOcSMhf5Xzmi83h5LvPoPLrzZb1Vl4lP8wxunDe8ZGjyhyXU7P4TmA
 ncvsu0YPfTJ06P52RTzhT1SUlIF263nxFL877EDq0qZFa11bxqOBQaPM9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2016729"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="2016729"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 14:19:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="7653504"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 14:19:52 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 14:19:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 14:19:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 14:19:51 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 14:19:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bb2HezXrjfo1QkXueqxmDHq0+/ccTl8lA2Qrg9C34lyCBrJPhAW5+yuhbbKWCELUXc6LomOpE0LcuOuHcS/tK+5kkEiOZ1yRBTWPBVAWoIrKL4/D3l/HLVFCMP5Akpz/9S2rY37YJ5aBNzIknVW8sgBPlYvJIfk/nbWLyFemzGGWpgta12SMHJ1WVxOojPcFjtRMMOwO+wR/mw9VGqmmi7Q3XM+Dn3TLBmtEL6pYntUIRHThUQ7isgnWq38EwtX9idI8v0vCfgd4bVGzfTq7LJbA4QYL7sak5bYnL08q31PdBnSXinv/3u9+bwM8ql8LbuSZ4T0XQyJyQwnbevDKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7mnTqQ350bNQEsYM//O1k3dLkN5u+yhFUBCJwF/C38=;
 b=kcK1+HLCU4+W9Fj7fGLurBLgtkyXwxW00DLaadHSR3dg0xYXrz2vI5E5jZVDW2CKGafxmZbdpC586UH/wlNbnFKZjgHHVUXXBM3OnHFNk9rnYeN4erNmqpwllN+Ss6j8jN5MHy6btHkONeXG3VWbhlF3hAHsMeGiuq0K3Imt4nxRPartmmo7tDSnysPwfFxWOZy1gew/7Hz9uZkR2SGYA9bPYl938xEzQoIAuv2u8F8Y7Shw+FWVZ0h4whmhAk42Fmqlgnj3yimPT27Pmt8Qqy3HDXWbv0zbdgQ6Yp6D82NmjghqQaqCB8ELeb4GFLL+vxa5kLiQ7T3R4yH5hi3lDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4636.namprd11.prod.outlook.com (2603:10b6:303:5a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.41; Tue, 13 Feb
 2024 22:19:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 22:19:46 +0000
Date: Tue, 13 Feb 2024 17:19:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Promote make_u64 macro to .h file
Message-ID: <Zcvq_kiF-EM5evIz@intel.com>
References: <20240213210543.1265-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240213210543.1265-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4636:EE_
X-MS-Office365-Filtering-Correlation-Id: 792b4965-2f58-41a3-a305-08dc2ce1e2c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FR9oCRHuyAprCkJh7TIy/KWEOFFDJuHLgycIanan7X5V6a8aNHf6UKkyPwhxWMEpA9PpZmeCf9/DV5rcNMLpp50/iiWXQwHh37YACkZD09QmrydbVSGjEMkbb6/1XIgulfHsNDhGVkMh8t/OQpu+kQKn6Jm89pJhJ7gw6GC5/m3Vt1dN3Fd4wG2vcdecus5yNF3lu9YPNwfvZGiNQQD5xxxQH4K4bE3IEvRcs1OM/a/cmVQD0VqfmcU5HmPMP0OsLldm/oatLrbePEamAfMTVn89eippRGuwKoDpQwrLzre/D9fVCdn2kTzTHWQ7cMU0dsZl0afOfDWagzkD39WqQDsUWvUASe+Ecfeu+Fn5J1I98flE5IJfHPda57LSISR8D7jletarvv7RuDM9CPofWieIt9EtTPw0nIQQeAMmJjzBzeJbNrHiDxBPX+O3Xtu+PXdsmrB+FVeQja5/gkIEyeiBruSFM57Q+EkrFIl9ftCSBew5cTMQ8UrnjS+FiaI2+k9jnZ2eDstnS5+bT4IwdePUuywsOPgsdg+xpIls2p3FuY6G0YUOQ0Orwr7DeG/2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6862004)(4326008)(2906002)(8936002)(8676002)(44832011)(5660300002)(83380400001)(2616005)(86362001)(26005)(38100700002)(36756003)(82960400001)(6506007)(6636002)(66476007)(316002)(66556008)(37006003)(66946007)(6666004)(6512007)(478600001)(6486002)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g2p+eTNeI+qXQrZlmYFPjFL414ffejXeui0vvdndsHHe/RtoE49QC4zvUVU+?=
 =?us-ascii?Q?hcNwdgb8pDsh92fqLkNVFmPf5vdVR4nSYUtI3xrOx3WB4PzXM+M/i3RHGZQh?=
 =?us-ascii?Q?FQiwZ+1hGmFYOBjuzlwMDCWMie72HuXnMveVqaaMTzfYrgYMHtB65nuqd/b2?=
 =?us-ascii?Q?H48tNesb9FFuLs5nuAGhh1fLCx0PYQMfQvp0APlEmdU5vE4NXfI2W9dzFR/G?=
 =?us-ascii?Q?RVIo6wtGDQwgtNygCJGJWDgYaaXuKRcgkltcVVNqoBwBopuRcH4waxI/Ytjq?=
 =?us-ascii?Q?aCXFSGwVhc8p3D+QP6WYptYNH9XpLnQ+Qa66FZlbSeV6QsMYZ6zc1dONnri2?=
 =?us-ascii?Q?7j3VBAc//lAZx1dqWNEWxroodXQSU8NPqIhh80549128ullmuOmB/JfnS0wS?=
 =?us-ascii?Q?KxKRShwwsH/I8ivm3I2Kyc23xh7JKJcx/xcjLk1fDqq63ya0Eb3NH5YdW0Vq?=
 =?us-ascii?Q?WlPRBYpCG1DPlS7LYEfBu0epse+W9OuFxn8ebPGPHA9X1uhoaH13u4dfOaiY?=
 =?us-ascii?Q?YUycMOFwe/dCp2hRbLrcTYA/cZu8J1dYPmdhqBKzDH5Ejt1RpCDOrNfNZQrZ?=
 =?us-ascii?Q?JNnGOfgJQSSMc5xj8x/r9ng1E85cAFVze4R9cMGB1BSJuKIAjHBruVHiOXmE?=
 =?us-ascii?Q?elR3URvS4aVR7cxOKQ00DYyvIu4PXFUmPRWRtr9Q7G1afAC8fhsRqG2P36vM?=
 =?us-ascii?Q?7ziYZUXLdCMVC0T3ydPitLJbwI3GVV2u1xx8cki8bozpI8Fk0+byUUxH0Bhq?=
 =?us-ascii?Q?+QpaElrUermlwxhwAEjftthgluVQjxFNSaWJfJ/sJclDfWn1eZeE7G2pt6LY?=
 =?us-ascii?Q?KHcqffvXxyAb3p0KymBEDsDmA3CdX19lu5FnHL4Nb8S2DDZqflG8AF6T01d/?=
 =?us-ascii?Q?eVUNGL22jcLzLTWYFCl9N1LuXxXIh9GCEmv4r6dAStBTq6f9JvkMgAQfDQQV?=
 =?us-ascii?Q?2YH9nrHrPzsTdv3OqzDOFZHrLen6Wt+dlh8EFDhZBPUPZa7X5q8dPLo5V352?=
 =?us-ascii?Q?sFyQMbf8Bk5YTYL0Mi6qzQjdhKfZrJUcfybfwuVaMCK0jeUOs+FjgxNYRpBF?=
 =?us-ascii?Q?HO640q3K5DyZ7u3nQNFn/OB2BJLAJDumlYbgspshb2x7WPHmVIO2f6D9hWJj?=
 =?us-ascii?Q?BsuQzM2CPUjMXogdoJzyrB2E1nLqF44A9VftIpM+Lkkl3G6bbi0+3JjMHcK6?=
 =?us-ascii?Q?17JV4GdCHuZiamk/NjQ9NaFK+PehbpMvbcup86gbprkHabZG8IF5nkqxoVuO?=
 =?us-ascii?Q?oU4KIdVlFH21rcFQa2GeQsmZoPDL6Z6aX1h0khgDPjIGX3XWIHyIv5vzc3YS?=
 =?us-ascii?Q?O7VNjWyln39L6VLtQkF3PR1R2iNR+gSoopXGHbkSfDjOq/Xla82cDo9vyg90?=
 =?us-ascii?Q?0WeOGmzWUqVd0wjoYYe5fw0KWDv8YAfX9sFVgvG6XRJPKW8mhdHNyePNFcKr?=
 =?us-ascii?Q?Ry6LgfONN+LxXTgAieBk170vZqVpkzjpkCafYV1oG8mS9raPtHywky6rsW+2?=
 =?us-ascii?Q?0GUEUg54zcMDgATQreYe127HnwzO4yhI5jd9gKgnHXpM9JDFKgwJtWdOOeIk?=
 =?us-ascii?Q?thrvJZjXOa2hUU4u2VV612oFBwktxUslmNiQLUjB+p19k3jvKBvjUJ7r8rVw?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 792b4965-2f58-41a3-a305-08dc2ce1e2c2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 22:19:46.6368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLYxN20dGqEV+Q0YEEH6VBVyoXKvB/Pxx5kDbuOCpDLbL+yG3BE1+SeMDNYXQc0p5vM6ZgdP9iRhPcw9HRF5AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4636
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

On Tue, Feb 13, 2024 at 10:05:43PM +0100, Michal Wajdeczko wrote:
> We shouldn't hide generic macros inside .c files as this may lead
> to unnecessary code duplication if similar functionality is needed
> elsewhere.  Promote make_u64 to .h as soon we will want to reuse it.

On the other hand, we shouldn't create an internal library of macros
that then start to get used indiscriminately as if it was Linux core
helpers.

Changes like this was how the i915_utils.h started.

If we really think that this macro is useful somewhere else, then
we should be looking to make that as part of the linux/types.h

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 2 --
>  drivers/gpu/drm/xe/xe_macros.h       | 8 ++++++++
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index c26e4fcca01e..76a018ec8136 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -557,8 +557,6 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>  	return ret;
>  }
>  
> -#define make_u64(hi__, low__)  ((u64)(hi__) << 32 | (u64)(low__))
> -
>  #define ACC_MSG_LEN_DW        4
>  
>  static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
> index daf56c846d03..b79d775c737e 100644
> --- a/drivers/gpu/drm/xe/xe_macros.h
> +++ b/drivers/gpu/drm/xe/xe_macros.h
> @@ -7,6 +7,7 @@
>  #define _XE_MACROS_H_
>  
>  #include <linux/bug.h>
> +#include <linux/types.h>
>  
>  #define XE_WARN_ON WARN_ON
>  
> @@ -15,4 +16,11 @@
>  			    "Ioctl argument check failed at %s:%d: %s", \
>  			    __FILE__, __LINE__, #cond), 1))
>  
> +/**
> + * make_u64 - make u64 value from two u32 values
> + * @hi__: value representing upper 32 bits
> + * @lo__: value representing lower 32 bits
> + */
> +#define make_u64(hi__, low__)  ((u64)(hi__) << 32 | (u64)(low__))
> +
>  #endif
> -- 
> 2.43.0
> 
