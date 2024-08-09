Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2397C49EA1
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 03:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7B410E84D;
	Fri,  9 Aug 2024 03:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLPaBUI4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2AB10E84D
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 03:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723175910; x=1754711910;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dIm+gERu+p1v/780nZvR9N6zGkGa6uTCTTJrG+oYqY4=;
 b=NLPaBUI4ylfNfOrUe0jcZKdJqrh6M1YVKZC9Z5SyRRiojZrer5Y1aUPI
 e2Rg/7Rh8eO2XmgdPiM7tEbgD6HsCZZFtK9fqa2sGORjbtPV2nI0AE7Nj
 phOL+HjGboaKMVMfFOPCGlrFPlANGs8TgcgaQzQ0hdxzkgH7ZGxjzjDkh
 fULvgAK1/tTIejJOp9PKgMtYRsXq2Mm/P4u5qbAf4jP99IZBRjc6iUOm1
 +1AsIrGzlRApyjfdZCCJCcoHDHy5H38e0prHCpunwvWTdRgvGoUrClYLO
 NcJFsWoiADO1aqcl5ZwtpO7zGemB3u8Q+1hi3ZC1yU/ESbG8nfLjAX+VT Q==;
X-CSE-ConnectionGUID: WNaYuRNCQH++2id8iYrjsQ==
X-CSE-MsgGUID: bGP1GyqIRRGDXzszdP4Hwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21493423"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="21493423"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 20:58:29 -0700
X-CSE-ConnectionGUID: BSvhilstQ5iJC4HmcWuE2A==
X-CSE-MsgGUID: 16D9Ch9OSOi9Z3XxBxnJ4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="57312698"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 20:58:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 20:58:28 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 20:58:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 20:58:28 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 20:58:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdZ7yeAMurUHLnTonTLTNAWi1bRw3q1sTxAw0EBJnAiFBjhfcbwYhfR60fy8exDyy1+ZIrijD2UXkXzkVWKqxt+Dm3LDUGL+QU7xw9zgbV5CeLgpgEUhyRAK8Z/sOSG5UhxQD8hT4iXsqgOt6EMJnmR996sbeYca2aNlhtAu8hdLCDJBa90c6LDPyIwf9W1cVJ31UsM5hYOvUmYUFv7d88FgAKr0cvDtaQm/0gqyWY2O0zTSECcqV986V28d8XkN0OdIBEjcTeYlV412foLNxep0FGjTal/51OpK9G62HO3w99Nt+us4ROQC/6F5qGvkf5w1p79z4OHJX4Or6RctOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEwFl13avIlbYhKYtlofSKnXtDq9LX6RXOIzQununlk=;
 b=RnwkAcQt5GE2HATAZzmr8yGaG9k689+15xsloyNHZqpVIvxyuKzMGdXHuqRA6YwZHojgZLzyby3TbrZvA2I126my7p0aYuCzCWkEarchBN2ho4eep+1RigG2vlS1xNiYyM4aK6nlNqhg9YS5LBTOi2e4c9K+uubHhgtwtcm4SvhAeR1d2BxNoJSouaKRUZp4MUTaGesZteJZJDD0JSVqP1SL+pKhjiE+Axrws3PEly0eqPCDwjNxl203aRqHBGIeD8qdSRE2VyWqlfEoKA5ElxnkqltSRj1Y10JLRh481lhCtLyv5JBYsfvJk6YyuZp4X3JXLHjlUTYr1nJZJfya5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Fri, 9 Aug
 2024 03:58:25 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 03:58:25 +0000
Date: Fri, 9 Aug 2024 03:57:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 09/11] drm/xe/exec: Switch hw engine group execution
 mode upon job submission
Message-ID: <ZrWTjR2FifBvpgz4@DUT025-TGLU.fm.intel.com>
References: <20240808184220.1715625-1-francois.dugast@intel.com>
 <20240808184220.1715625-10-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240808184220.1715625-10-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR20CA0029.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::42) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CO1PR11MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a161e4-566d-4e75-7885-08dcb82784e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZJAfgUuEMO4zkOrh9yGCIPDv3DjLEnYB2zpQC02r33DJb6JEMYFFcDn0phXA?=
 =?us-ascii?Q?soUb5rlezGbMKd7g8gfkOLsfQ7OXb6KzA40dWsbL91v1pt4wevm3M+Ans+va?=
 =?us-ascii?Q?bDOZXX1elrShBY0AGHV9eKd3a088Xez/mmWeHfqvyz5gy+qAZMyPMGxqIYeh?=
 =?us-ascii?Q?6tgugdGq3EX2HSdrhXq5ucI857o1Ttnm+Tgp2G/NBd0tf9XtYYBcq61BrtGT?=
 =?us-ascii?Q?01I5pOKtqkNyGPW0Yz7Yn/KOQf4a1kPLHC1+Tj4dp9qhaxW6saV2o4Cf3q0V?=
 =?us-ascii?Q?xut29zsqEFDbRbiXO8BgWRl6Vs3BGCvXBCh5n5U6oJRZh7v1VxZXXyxsPtZy?=
 =?us-ascii?Q?Oc2oEqdA6WPFUkD1EzREhSi/8ZHM4BnjnAH3r2SqUMW/vI99zvafhILxcdyk?=
 =?us-ascii?Q?siGEiSXUldxLBT7FyZRF9aW5ab96Zcup2ToSvACptVap4E2KBv6+qvOJAfgK?=
 =?us-ascii?Q?Rclx6KFaPsDRmzCxV7KQSbm9wbui8uHZcx61H8BWNHnqBOeqHCsb42i5+VLt?=
 =?us-ascii?Q?bCQSkZtFKuruwbIFJ8T0fX1iwo9v4uBbNTVw6gnUvLUU+HPFfJSNnaMlGCfu?=
 =?us-ascii?Q?0MrpFEGDcIIvuJdcOZeAXQJqCopDa7TeGmm0nE3uI2LKpm07pKxmQfQggfrp?=
 =?us-ascii?Q?hTLKr1nfGBDKk6si67ZU1MmNLdZvS9gIY+t9wD2sKx9Hcsm9+EyxR2HHr4Td?=
 =?us-ascii?Q?gQh5tQLesUbv3LjfvRQmyZ604MJOl9PfH7uBskntlBr0wpCBfXkf67iJnyTP?=
 =?us-ascii?Q?sCnC+cwXdsOADNhzoyW478UyxYF61NdZUvcHENtXGTlVZev3ePALV/AK65WS?=
 =?us-ascii?Q?ktqmc9FEyEupcgFixGNFpKiiFY3syIyDL99eWywoNtELKTHxLVAAVAmuPLMQ?=
 =?us-ascii?Q?uprQ7x6ZyTnUtuTHJs3cicj/LkOlTuuEjp5pv+fYUgrXkGgW58DVJz6bYY80?=
 =?us-ascii?Q?Fzc7RHDYRg7nraeQy0QhWJRmEtcbj8s+6sxZw3YeLXWVwXzk90upc7voFIeq?=
 =?us-ascii?Q?PJan2opl1QwM96+JmJXy4V6USbG/Njb5FnHFo2YroRNSZuNVy8fQn/S7QLOY?=
 =?us-ascii?Q?Sicd+qbhX5eifM3xNZUToawPXc5/B80PXJc+nuPVo5XfITVUoLxTomYaKAil?=
 =?us-ascii?Q?aZjeVMzZE1fQlq4nDzkkbGuAgpDhw+8DmrmqgYe5eH2qdahpkNM/21VU3Umc?=
 =?us-ascii?Q?uM8DcvsQIA0HtupXyLXaMv2deiBCzUtBiZ9eXfBgg4GGoNzeLM4KyDKKY+dT?=
 =?us-ascii?Q?9ZfJcelo5IMmGqQYu1/+xTOOtDdsi3ACBrUrDnu4MzK2vZC8e2+Gg2YHwWjo?=
 =?us-ascii?Q?xTsqSNgpAc3xt6uu8zS8BVt7Nr+cqegvGLUKzlIjEWs8VQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LZA5ccBX/ptW8QTacNNRK/fsRp85SL3kbyqriPJjC3ZruE/HGl+Cs5SM10Hw?=
 =?us-ascii?Q?0+STmU32N4KrJ7cfyQqcHax6HWmPjnZfjIwy7KKUHORh69apEJh+OXlkC4Wo?=
 =?us-ascii?Q?yrLEcPIX7ME7Sge/j8dQgK7o2+BZ73M3eBXiyEa2xC+gjDQ21LvEqb1g2XCO?=
 =?us-ascii?Q?R+aPLn06Lyj/8+5NyH0/QncA+tY1XTZPqSMsdv2/4Ou15ojT7MOcpnaAdgzh?=
 =?us-ascii?Q?Ylr1xSyxGjT/kaY4aNsCHHnq5ZUqKA49Odk3710j9ZrZQhb0VcO48U9CDbCd?=
 =?us-ascii?Q?l21xqO68Cb8nMNhfEMJ31F/zg3OErUhS+sltPuFjC5YWGCWiSbtYwvJClgSX?=
 =?us-ascii?Q?QndcI5UZHP2ixpSI9nQxBlwcNHJeQZ5YawVIQmm0ZBmEl4vglBAe/uEjSwwx?=
 =?us-ascii?Q?b/YHcFY8CBTdp3wIgR8r/JguMwyw0/rjSumxJDh/9kkjxtFCi2RdGXR3FHy/?=
 =?us-ascii?Q?bVaG1VwopH1QLtI8fBOhRvIqOBLNxM4wcJTGdLedEoLRxikdCux1jHDNhdH4?=
 =?us-ascii?Q?GYt9e75RGQWONwC1trs+Cd46KIriWG6saHnUFDTJm1jr5RnAaghjW1PxRzwu?=
 =?us-ascii?Q?qJQHCqp+8AsGfzrWaa1RROzwse6dh7nnTI04XMzidf9zxemy0wziHO0zf8pN?=
 =?us-ascii?Q?PfWHEOa/XoZpmrxTmlymN+tLLYLqr+NgPVqTim8z0xgwp7+cz7hJKszG+Zzr?=
 =?us-ascii?Q?aTpFCIye4OU3RL8KtitvxEc2wYrUY2nFdQ+Vwvx+4xZwCGuGTbUjYiJ1YxG6?=
 =?us-ascii?Q?uvEedJiH/7aJOXJbX9ubY1/P7f3w1DMQgeDcz2enevAc6/u7QjjoGu/MNNw/?=
 =?us-ascii?Q?7Q6cut787j2ttILhj3N/+o2KWOJEdbWfVrRRAQmVwHHDAwvt7ojL/XhkTSMM?=
 =?us-ascii?Q?EHxhTqOIxbxlV7W14SsCX4YQzVOErn/bPFNHoSy6zDS2RPvyKI7rY3bYqe0c?=
 =?us-ascii?Q?pKdhyKqdJeGxVcG7BlKPKUk+pXqgBTs20LUThcp07R+OKCqmXujeYQXbGDbo?=
 =?us-ascii?Q?LH6QXhFSTLZeDkqSDLpoABsIE2Tlevez0mMSc/+IyhEMOFAO+ot6o4fv8nRN?=
 =?us-ascii?Q?JQmckDyExft/vaCVSudr8L6BGBn72Jsj6B9EtYUhDHirtS7aic+cxdRpnBP3?=
 =?us-ascii?Q?i5yYjjaGwd9A1mhfx+3cbr+ENs6nMsv8A1E+TeOXud3J+EK4h5A7mIKMi3iA?=
 =?us-ascii?Q?79ObeqemON2nsF7EVvch8hgQoj72ZmDVHqOUAKlP+izZC92erbPqNxxy5P0a?=
 =?us-ascii?Q?/aW30eQ7SAux75Vy5Ew6Uy37HZpKrsi8PgLFT+kBa7/UKz5ARObxv/MgwNET?=
 =?us-ascii?Q?w4/nLNtRdLLhSN/OxPy1PVOO85MwGH5mkDwmKD8c5CovQmn32UhUTax3CZVa?=
 =?us-ascii?Q?9ysW1NtGZuyB7HXCcV56i5MoAGo22PKqnX40nqLTepalyHGACS3zdlsXgzIp?=
 =?us-ascii?Q?TbobI+JpMlR+38UrmmErLQq6fB+vQ98Diz3C8v4aU8r8BkrmQJskVy/yRgOd?=
 =?us-ascii?Q?0rzAd9ZMsLvRydiptmX2Dr9YH0XZ0Q6wiIMBN+p7sIVUBNsMjv85rRxra4/F?=
 =?us-ascii?Q?afNHt5+YBpI8+xufnEzizVGJK+z5FqyiWmgXdkntqoTK7L8DqMDAAuMvUFJ8?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a161e4-566d-4e75-7885-08dcb82784e7
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 03:58:25.3534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fznt7oNqf/T8ooSik11RiLvubzwfjmUeYXUw2gXHgF0qb3EnOrRGFYpCLYfEmdB+EB0//yB4rw2GUwRmP7u4cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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

On Thu, Aug 08, 2024 at 08:40:27PM +0200, Francois Dugast wrote:
> If the job about to be submitted is a dma-fence job, update the current
> execution mode of the hw engine group. This triggers an immediate suspend
> of the exec queues running faulting long-running jobs.
> 
> If the job about to be submitted is a long-running job, kick a new worker
> used to resume the exec queues running faulting long-running jobs once
> the dma-fence jobs have completed.
> 
> v2: Kick the resume worker from exec IOCTL, switch to unordered workqueue,
>     destroy it after use (Matt Brost)
> 
> v3: Do not resume if no exec queue was suspended (Matt Brost)
> 
> v4: Squash commits (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c            | 20 +++++++-
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 62 ++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_hw_engine_group.h |  4 ++
>  3 files changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index f36980aa26e6..484acfbe0e61 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -14,6 +14,7 @@
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
> +#include "xe_hw_engine_group.h"
>  #include "xe_macros.h"
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
> @@ -124,6 +125,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	bool write_locked, skip_retry = false;
>  	ktime_t end = 0;
>  	int err = 0;
> +	struct xe_hw_engine_group *group;
> +	enum xe_hw_engine_group_execution_mode mode, previous_mode;
>  
>  	if (XE_IOCTL_DBG(xe, args->extensions) ||
>  	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
> @@ -182,6 +185,15 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		}
>  	}
>  
> +	group = q->hwe->hw_engine_group;
> +	mode = xe_hw_engine_group_find_exec_mode(q);
> +
> +	if (mode == EXEC_MODE_DMA_FENCE) {
> +		err = xe_hw_engine_group_get_mode(group, mode, &previous_mode);
> +		if (err)
> +			goto err_syncs;
> +	}
> +
>  retry:
>  	if (!xe_vm_in_lr_mode(vm) && xe_vm_userptr_check_repin(vm)) {
>  		err = down_write_killable(&vm->lock);
> @@ -199,7 +211,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		downgrade_write(&vm->lock);
>  		write_locked = false;
>  		if (err)
> -			goto err_unlock_list;
> +			goto err_hw_exec_mode;
>  	}
>  
>  	if (!args->num_batch_buffer) {
> @@ -312,6 +324,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		spin_unlock(&xe->ttm.lru_lock);
>  	}
>  
> +	if (mode == EXEC_MODE_LR)
> +		xe_hw_engine_group_resume_faulting_lr_jobs(group);
> +
>  err_repin:
>  	if (!xe_vm_in_lr_mode(vm))
>  		up_read(&vm->userptr.notifier_lock);
> @@ -324,6 +339,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	up_read(&vm->lock);
>  	if (err == -EAGAIN && !skip_retry)
>  		goto retry;
> +err_hw_exec_mode:
> +	if (mode == EXEC_MODE_DMA_FENCE)
> +		xe_hw_engine_group_put(group);
>  err_syncs:
>  	while (num_syncs--)
>  		xe_sync_entry_cleanup(&syncs[num_syncs]);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index e6c235119351..f966b8207c0c 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -17,9 +17,36 @@ hw_engine_group_free(struct drm_device *drm, void *arg)
>  {
>  	struct xe_hw_engine_group *group = arg;
>  
> +	destroy_workqueue(group->resume_wq);
>  	kfree(group);
>  }
>  
> +static void
> +hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
> +{
> +	struct xe_exec_queue *q;
> +	struct xe_hw_engine_group *group = container_of(w, struct xe_hw_engine_group, resume_work);
> +	int err;
> +	enum xe_hw_engine_group_execution_mode previous_mode;
> +
> +	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR, &previous_mode);
> +	if (err)
> +		return;
> +
> +	if (previous_mode == EXEC_MODE_LR)
> +		goto put;
> +
> +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> +		if (!xe_vm_in_fault_mode(q->vm))
> +			continue;
> +
> +		q->ops->resume(q);
> +	}
> +
> +put:
> +	xe_hw_engine_group_put(group);
> +}
> +
>  static struct xe_hw_engine_group *
>  hw_engine_group_alloc(struct xe_device *xe)
>  {
> @@ -30,7 +57,12 @@ hw_engine_group_alloc(struct xe_device *xe)
>  	if (!group)
>  		return ERR_PTR(-ENOMEM);
>  
> +	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", 0, 0);
> +	if (!group->resume_wq)
> +		return ERR_PTR(-ENOMEM);
> +
>  	init_rwsem(&group->mode_sem);
> +	INIT_WORK(&group->resume_work, hw_engine_group_resume_lr_jobs_func);
>  	INIT_LIST_HEAD(&group->exec_queue_list);
>  
>  	err = drmm_add_action_or_reset(&xe->drm, hw_engine_group_free, group);
> @@ -134,7 +166,7 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
>  		if (err)
>  			goto err_suspend;
>  
> -		queue_work(group->resume_wq, &group->resume_work);
> +		xe_hw_engine_group_resume_faulting_lr_jobs(group);
>  	}
>  
>  	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
> @@ -167,6 +199,16 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
>  	up_write(&group->mode_sem);
>  }
>  
> +/**
> + * xe_hw_engine_group_resume_faulting_lr_jobs() - Asynchronously resume the hw engine group's
> + * faulting LR jobs
> + * @group: The hw engine group
> + */
> +void xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group *group)
> +{
> +	queue_work(group->resume_wq, &group->resume_work);
> +}
> +
>  /**
>   * xe_hw_engine_group_suspend_faulting_lr_jobs() - Suspend the faulting LR jobs of this group
>   * @group: The hw engine group
> @@ -177,6 +219,7 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  {
>  	int err;
>  	struct xe_exec_queue *q;
> +	bool need_resume = false;
>  
>  	lockdep_assert_held_write(&group->mode_sem);
>  
> @@ -184,6 +227,7 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  		if (!xe_vm_in_fault_mode(q->vm))
>  			continue;
>  
> +		need_resume = true;
>  		q->ops->suspend(q);
>  	}
>  
> @@ -196,6 +240,9 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  			goto err_suspend;
>  	}
>  
> +	if (need_resume)
> +		xe_hw_engine_group_resume_faulting_lr_jobs(group);
> +
>  	return 0;
>  
>  err_suspend:
> @@ -310,3 +357,16 @@ __releases(&group->mode_sem)
>  {
>  	up_read(&group->mode_sem);
>  }
> +
> +/**
> + * xe_hw_engine_group_find_exec_mode() - Find the execution mode for this exec queue
> + * @q: The exec_queue
> + */
> +enum xe_hw_engine_group_execution_mode
> +xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q)
> +{
> +	if (xe_vm_in_lr_mode(q->vm))

s/xe_vm_in_lr_mode/xe_vm_in_fault_mode

Without this xe_vm_in_preempt_fence_mode will kick the worker.

Matt

> +		return EXEC_MODE_LR;
> +	else
> +		return EXEC_MODE_DMA_FENCE;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> index e0deb7c7bb5b..797ee81acbf2 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> @@ -22,4 +22,8 @@ int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
>  				enum xe_hw_engine_group_execution_mode *previous_mode);
>  void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
>  
> +enum xe_hw_engine_group_execution_mode
> +xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q);
> +void xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group *group);
> +
>  #endif
> -- 
> 2.43.0
> 
