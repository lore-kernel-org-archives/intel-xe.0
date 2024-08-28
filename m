Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9ABC636F0
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 19:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB1D10E5B5;
	Wed, 28 Aug 2024 19:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nIbwnc6v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B364710E5B5
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 19:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724872993; x=1756408993;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JPsg3fs9N2gdmMZ13yBNGj2K/K6T7i7aNa9zHNu5lTA=;
 b=nIbwnc6vfmxY3GJ2CRrBLccxET0Hn6kRcfisBp7nWNrbYkxuIsM2LZd+
 vosCdMq5jWYxgGm6oNFwfhCExSAgbgztBW4/h/ToT2Z9vVS+WTAwFsX7W
 NldG32wpQGFCOl5X39p8RNr0V85hEYg56Okl4X5b2wmtN6u78Y2on9emC
 3sUf55U9LJcf5bOMJfnI75yxeYBJFFjQF3FfI1TWhTiqamKul7jY+oepy
 zxCmvkimazar3+uh005KBCXQ6oyApD7Wj4Ndm9wYyR428qfM/oA4FtUr3
 3VrAlnNzzZAJXt/MBRU5kZ5FNqgyrNvZImIQhxw+TRNoYN4SjUq7jJPxH A==;
X-CSE-ConnectionGUID: GuYCy9EMSbG09n8vEj6bqw==
X-CSE-MsgGUID: j+zkjz/RTfO51L4u0O5u0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23616114"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="23616114"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 12:23:09 -0700
X-CSE-ConnectionGUID: YRS91OHPR+KATzeQUZ8cXA==
X-CSE-MsgGUID: TAA0zuchQQm6vbC8fsHzCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="63325114"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 12:23:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 12:23:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 12:23:08 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 12:23:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSRiBYucK7ERA0XpEW+gNp5yIh2p/3HiwFAdrJmiIJDLZ6IAcu5rbd/YDwLbaObl/2xjL72X+TdtgM9A06P7ORKS8MdFEmxLjBMTPsOJdm5TjaDH2JMyTTuE9fMDAO2pFIhctWoxNd/tjSxX/NsTshhhdPZOeWgSf5jeQ3hwmpL4xVYIaE1naX7XpcaFJjYZJ7IzZBhwJ7D+DJJRYWXnL18lYDQCH/AJ13W8OpO87el5LogQtu9gNAZlur6Fn9xvmngKmkXT4OVVg6RSeFBmIMISssPg/2wrSHiqEPn8PPaB1TEp73BW2bIECReQ8BLCSfcntjOiE3xspbuYfKZj+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yJor1UrBlFbEmZ2PkHUONqy3i4qVQ4mbaY/QtL7SXU=;
 b=gmfNGRF0JLe+BrUVbJjFPPvZJS+oUpYkqzCg/BnDP6xrUqauJPdEt8g4lkBBrNKPZ58oDUMV06Axjhp8xbTo5aOw4WNeCLUVpHlnaCFVplK2AoLkyuITWlk2TfR3YbhW6LU9RgYmQ84losirvhwZ3F8TG81DFbRTvSwjxl659A8hgMHhj/GExeWq+2cGd/ZSrevfitlepxshmzPLDsDwY9FkOi/xsQllnGbk8lVD7aG/TClKcOBbZ1WJmbJvTh3Fdz6MHtO40Wf3J+t2Oriptcm4wFs0k8Bxzba58qARotGEZUZSSDHDmGFGDVVB/UP4fsMXPcCopgKXEZ8mrHoZow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB7980.namprd11.prod.outlook.com (2603:10b6:806:2fc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Wed, 28 Aug
 2024 19:23:05 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 19:23:05 +0000
Date: Wed, 28 Aug 2024 12:23:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v6 11/11] drm/xe: Sample ctx timestamp to determine if
 jobs have timed out
Message-ID: <20240828192301.GO5774@mdroper-desk1.amr.corp.intel.com>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
 <20240611144053.2805091-12-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240611144053.2805091-12-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR06CA0051.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: 030be208-e2a3-442d-289c-08dcc796d740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rrTYIMvM1C/CGwM5xY6Qh2zUZRebiQhzZEYAK7oa8IIKSgfI0ogDi6XeHDwn?=
 =?us-ascii?Q?KY4NDiHsgfmLz1XnhLZzP/pPOtdcxvUaaVFDVvnsUH53kOwzOnyfSUI88j7k?=
 =?us-ascii?Q?LdOoWSSuY2uEFmtZeoDHiuUb0qPfuBLVPUvr5nVKHu6r5hdDp4UDjyO2wJCR?=
 =?us-ascii?Q?+WcMzFKO3WKJy/zIit/fmqdJi7LTpessnaQI+77qWeiPZ6XrEnx90jVKV65a?=
 =?us-ascii?Q?tgtaePo8u3loq3y0c3GkkAjurPi2poy8ALA5FhwogcffIubZBXaQrrWS8lvG?=
 =?us-ascii?Q?/nyekna2QwmKvz6WeAvD4JC+5+c0VKQZU9PIBVTRLUFGIIsOP1o58jO1pbbx?=
 =?us-ascii?Q?ODedbQHhEDpoW3DtBjtML1Lr6vMdKCOXd2nC+eHC2Wl+cswpjrzdkdJOey9y?=
 =?us-ascii?Q?BbJniVXsRmAOg0mqfr5XnzVUt4DEMmuuv1R4WvF8bf63yZeGIFrAMGi2+pzh?=
 =?us-ascii?Q?spiCP/JicH5/d+wE9A0aoEgbb+2rFZFnB2HIEwOiQwivmGQp04nim1k+c0JY?=
 =?us-ascii?Q?Al4TDjuhZjVsEzKY+fkobz1/+E5yVlF+rPD61YE78Imlgkxd0seMzIe1JHGt?=
 =?us-ascii?Q?0uio3As7OLIwcJRyNbqZyuP+kxS2Ym5dIp5qSpPbDncWTkNLVBWc46SMbMth?=
 =?us-ascii?Q?dxAnKuQSGzq1qxSpgoCan9K4EKu1MjUVfvtOoLWAuXOmAyFH5SoC9195s5fK?=
 =?us-ascii?Q?JeDOXfObfj6rfpccQIxj0qnzf07FlaeoJTi08wnDBydVHpPJjnONPkMuLQ7W?=
 =?us-ascii?Q?PSyXF0cATO8OThsKK3nY0N6O6uvsdptWKTElHExHYeaPssUHWXs0D4aiQRDY?=
 =?us-ascii?Q?3KaqKQQCvIfAQJg/BfMgUAQC4CYoKWwv2rLrmwB9WOaVmq/BaDl3hNB9deyt?=
 =?us-ascii?Q?ncF0zStcW+D75nPpbdiDVfuCH256nsIGH6+RT5ccI6//2IXcnIMMv+JS8/71?=
 =?us-ascii?Q?/M0TTE2xKyLtqdlhzLQS3MFKy8DWfbfUsdgsyWa6HDjnhnoIYxAzEsMERH2b?=
 =?us-ascii?Q?/cujYVg6XI2h5KPz6i8mb8u5etfKMDeLWIiPbk7+KSQRlMHXmqPd1aaDkWCn?=
 =?us-ascii?Q?vtbYqiLIqhkKMteDKUC5YBCy5HCOP2ugm5JwCoDn5NSk6KVOrWcdljDNqTxX?=
 =?us-ascii?Q?tLd/kc/+ruhLBsxLYuyJ2+Vg/5kPo63/hAMgihjttIUIPveUvsRv5V7NdMWQ?=
 =?us-ascii?Q?WkqzU9JzFc/29lERp9hY0z3U4z09UKvthxfk9s3gW66dwhaMkI93yLB3ne29?=
 =?us-ascii?Q?8tHO4NThHMGZp91NTv7A+ZwuFImtlI996w2g/rU5OQ7AhCyjmj3YB6T+5fE0?=
 =?us-ascii?Q?17lXfGbspdv49gBsiZxoaHGmsoHtvxWEE2z3O76Mo0/37Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RrvngGehEP0hpjwFtlYF6cLyJRzVw/lm2rlpx6YuoZsdq7Xc/97T78xubL8T?=
 =?us-ascii?Q?aR8ZKn/dmOuhYmYleLa0VEjX2rQE4OMVnx6PojEMSQd58WkvWc6660+VwKUD?=
 =?us-ascii?Q?c4Y7bhXsVwZ6h1FbjkBJ60yyIKWmsqbnb/XxGFggByYb/R2E8OYkMbyiggQP?=
 =?us-ascii?Q?4/vM2JnWqp5atqnne4PRd4fraagZg0vcbZODtO9sf0+hXjp5YOr9BNDXbNGY?=
 =?us-ascii?Q?qxJsiS0xMpzVB0WVU+fBtMVFAUUstktyQv65H9SvEcIlYk08CjC9HCsE3F4w?=
 =?us-ascii?Q?V08pGe0nX4dxQQw5jCftif6ZlBeEgeGh+bGwGfAcZLTrVNW6kEo26aFao2wx?=
 =?us-ascii?Q?lyuP5ATxr2y8M0l7y9VLbneOAtxB+Bul2kedAYqVly8yovDkd7rrS+KZiRJT?=
 =?us-ascii?Q?F1U0M/Jsf3qvdtrCu2Bt4CsBSuu+Jf9ozgToA2Er2o7nfcLQHp3TdSskwluB?=
 =?us-ascii?Q?sgx1OWLZMoYu6PHLlckppkSXCvTQGHt63dVd09e8xT5VxiNo8T/NwoNQjhZL?=
 =?us-ascii?Q?eifKbbXemmOi2WFJwK1etXTXWbj2E6dTDaWbas0AZTWPUd1pZBi3B2mws9pt?=
 =?us-ascii?Q?PLNgljWvY8vUXgMgyIlkqwSFhCKG083AqqEKJ4oMnAi6IZsmEKiw2p1wLg+v?=
 =?us-ascii?Q?RDmNjaLYvGsU8Pyo7aYqUbwFj7B3++jYQmiq/EKBneDUxSX/VR1dvr1TOSfm?=
 =?us-ascii?Q?bisKD10gWfxH+Z0uoSUW3ybBiZ1Qulca92F+NKs4pJXZ6oIwIEgTY25dRRCZ?=
 =?us-ascii?Q?gr6Q8x2Y/npgP4NPskcuSMET8e3pdQuQIYsHadCnRobXWrts5MaC4VyS1G6q?=
 =?us-ascii?Q?xYrVd8MiSJ5dppQbC0gE01v6/dk86oTNxp9cYh/ngrBaMtDgEzjCWnQOQ7VA?=
 =?us-ascii?Q?lu62vWI5vRV02mmIk1c4XGhTu2LP8BFOBslmVc2KH1g1uSaa7j0ZGdEBzM73?=
 =?us-ascii?Q?llL5bqmR5veJx6i57XlBslQarL7mkopX+fuwQBf2+3WTSTnCdYRJ0hjz+QzT?=
 =?us-ascii?Q?TlQLhm9nynVK7P0N/zujnOnkJWwX2gYh5O6KFTl5zP68aKtrdJ2QFgrjmZFr?=
 =?us-ascii?Q?WGqF9aERqlzxuEBtF0DwEbtAnjtZ1bhqGzyUu7WLcL7/Pge2CYqacmsQU6yP?=
 =?us-ascii?Q?MG7qu2HUigTCO5mkmLVO8P2TkXzmu6r++Uq1VBfWytIJmq3M3cFlC337CAe9?=
 =?us-ascii?Q?WRZ9K+G8RaAhnCtWLbJSa4ghpk87ASIBFFWZceGZ1qpn6Z13e9tiudnQmvzy?=
 =?us-ascii?Q?KnlHQvHSX/51WCGqRILOSEunTw+CwpAEWFekFuwEpXACnl0pDXc5YkscQNWo?=
 =?us-ascii?Q?hpa28+s4kB7/XqLY28V3D6XtM4K969nnBocsDQaFU1LhBv1H2oPL0US63kfW?=
 =?us-ascii?Q?wXVAxHzm/0ivIZ6GtgEgnCvszBrrp5bt5A55DcPYx95TKfpTMcza/eUVyYnD?=
 =?us-ascii?Q?dBTJAXKIFL2pgDW17hq7IUZI+EWLf1ZAAgR5nCrNNstUnqBAJzmBhwvM7U6K?=
 =?us-ascii?Q?ZWUaB5wKDmPCqApjjgF+P9Ui4u4VnGE0hJI1YFD537TQ2CKn7i3zpIxcgLs5?=
 =?us-ascii?Q?GZ7kB8zEqkrTTT4cOFCQ4UTtZPwlC6diwmbH1dq85c+tngkdKN4IXEVDm3N1?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 030be208-e2a3-442d-289c-08dcc796d740
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 19:23:05.2196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 73iVl5Ppscz4pzfuYgRHwjK5NqT+YbcJALaAVgkRuA5IL4sU0/ygDo41I+kbi/dJ5byNypF/kBOhfG16feq+LRF6hnMGlPko+H3uTxq8oLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7980
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

On Tue, Jun 11, 2024 at 07:40:53AM -0700, Matthew Brost wrote:
> In GuC TDR sample ctx timestamp to determine if jobs have timed out. The
> scheduling enable needs to be toggled to properly sample the timestamp.
> If a job has not been running for longer than the timeout period,
> re-enable scheduling and restart the TDR.
> 
> v2:
>  - Use GT clock to msec helper (Umesh, off list)
>  - s/ctx_timestamp_job/ctx_job_timestamp
> v3:
>  - Fix state machine for TDR, mainly decouple sched disable and
>    deregister (testing)
>  - Rebase (CI)
> v4:
>  - Fix checkpatch && newline issue (CI)
>  - Do not deregister on wedged or unregistered (CI)
>  - Fix refcounting bugs (CI)
>  - Move devcoredump above VM / kernel job check (John H)
>  - Add comment for check_timeout state usage (John H)
>  - Assert pending disable not inflight when enabling scheduling (John H)
>  - Use enable_scheduling in other scheduling enable code (John H)
>  - Add comments on a few steps in TDR (John H)
>  - Add assert for timestamp overflow protection (John H)
> v6:
>  - Use mul_u64_u32_div (CI, checkpath)
>  - Change check time to dbg level (Paulo)
>  - Add immediate mode to sched disable (inspection)
>  - Use xe_gt_* messages (John H)
>  - Fix typo in comment (John H)
>  - Check timeout before clearing pending disable (Paulo)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 303 +++++++++++++++++++++++------
>  1 file changed, 242 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 671c72caf0ff..cddb391888b6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -10,6 +10,7 @@
>  #include <linux/circ_buf.h>
>  #include <linux/delay.h>
>  #include <linux/dma-fence-array.h>
> +#include <linux/math64.h>
>  
>  #include <drm/drm_managed.h>
>  
> @@ -23,6 +24,7 @@
>  #include "xe_force_wake.h"
>  #include "xe_gpu_scheduler.h"
>  #include "xe_gt.h"
> +#include "xe_gt_clock.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
> @@ -62,6 +64,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>  #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
>  #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
>  #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> +#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> +#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
>  
>  static bool exec_queue_registered(struct xe_exec_queue *q)
>  {
> @@ -188,6 +192,31 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
>  	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
>  }
>  
> +static bool exec_queue_check_timeout(struct xe_exec_queue *q)
> +{
> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
> +}
> +
> +static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
> +{
> +	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> +}
> +
> +static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> +{
> +	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> +}
> +
> +static bool exec_queue_extra_ref(struct xe_exec_queue *q)
> +{
> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
> +}
> +
> +static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
> +{
> +	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> +}
> +
>  static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>  {
>  	return (atomic_read(&q->guc->state) &
> @@ -920,6 +949,109 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  	xe_sched_submission_start(sched);
>  }
>  
> +#define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div((__t), 105, 100)
> +
> +static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> +{
> +	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
> +	u32 ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
> +	u32 ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
> +	u32 timeout_ms = q->sched_props.job_timeout_ms;
> +	u32 diff;
> +	u64 running_time_ms;
> +
> +	/*
> +	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
> +	 * possible overflows with a high timeout.
> +	 */
> +	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
> +
> +	if (ctx_timestamp < ctx_job_timestamp)
> +		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> +	else
> +		diff = ctx_timestamp - ctx_job_timestamp;

Just noticed this while looking through the code...what is this if/else
supposed to do?  It looks like it's trying to detect when ctx_timestamp
has gone past U32_MAX and wrapped around while ctx_job_timestamp hasn't
yet.  But even if that's happened it doesn't seem like it's doing
anything meaningful either; I think the u32 subtraction works out the
same way regardless of whether or not there's a wraparound, and since
all the variables involved here are u32, adding U32_MAX is effectively
the same as just subtracting 1 from the final result, which doesn't seem
to actually do anything important for the rest of the logic in this
function?

It's also worth noting that starting with Xe2, CTX_TIMESTAMP is now a
64-bit register rather than 32-bits.  For the short timeouts we're
dealing with in this function is probably doesn't matter, but to prevent
future mistakes elsewhere in the driver we may want to think about
updating xe_lrc_ctx_timestamp() and such to return u64's and actually
fill both dwords when running on a platform that has the larger
timestamp.


Matt

> +
> +	/*
> +	 * Ensure timeout is within 5% to account for an GuC scheduling latency
> +	 */
> +	running_time_ms =
> +		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
> +
> +	xe_gt_dbg(gt,
> +		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%u, diff=0x%08x",
> +		  xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> +		  q->guc->id, running_time_ms, timeout_ms, diff);
> +
> +	return running_time_ms >= timeout_ms;
> +}
> +
> +static void enable_scheduling(struct xe_exec_queue *q)
> +{
> +	MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	int ret;
> +
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> +
> +	set_exec_queue_pending_enable(q);
> +	set_exec_queue_enabled(q);
> +	trace_xe_exec_queue_scheduling_enable(q);
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +
> +	ret = wait_event_timeout(guc->ct.wq,
> +				 !exec_queue_pending_enable(q) ||
> +				 guc_read_stopped(guc), HZ * 5);
> +	if (!ret || guc_read_stopped(guc)) {
> +		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
> +		set_exec_queue_banned(q);
> +		xe_gt_reset_async(q->gt);
> +		xe_sched_tdr_queue_imm(&q->guc->sched);
> +	}
> +}
> +
> +static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
> +{
> +	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> +
> +	if (immediate)
> +		set_min_preemption_timeout(guc, q);
> +	clear_exec_queue_enabled(q);
> +	set_exec_queue_pending_disable(q);
> +	trace_xe_exec_queue_scheduling_disable(q);
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +}
> +
> +static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_DEREGISTER_CONTEXT,
> +		q->guc->id,
> +	};
> +
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> +
> +	set_exec_queue_destroyed(q);
> +	trace_xe_exec_queue_deregister(q);
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> +}
> +
>  static enum drm_gpu_sched_stat
>  guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  {
> @@ -927,10 +1059,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	struct xe_sched_job *tmp_job;
>  	struct xe_exec_queue *q = job->q;
>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
> -	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
> +	struct xe_guc *guc = exec_queue_to_guc(q);
>  	int err = -ETIME;
>  	int i = 0;
> -	bool wedged;
> +	bool wedged, skip_timeout_check;
>  
>  	/*
>  	 * TDR has fired before free job worker. Common if exec queue
> @@ -942,49 +1074,53 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  		return DRM_GPU_SCHED_STAT_NOMINAL;
>  	}
>  
> -	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> -		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> -		   q->guc->id, q->flags);
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> -		   "Kernel-submitted job timed out\n");
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> -		   "VM job timed out on non-killed execqueue\n");
> -
> -	if (!exec_queue_killed(q))
> -		xe_devcoredump(job);
> -
> -	trace_xe_sched_job_timedout(job);
> -
> -	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> -
>  	/* Kill the run_job entry point */
>  	xe_sched_submission_stop(sched);
>  
> +	/* Must check all state after stopping scheduler */
> +	skip_timeout_check = exec_queue_reset(q) ||
> +		exec_queue_killed_or_banned_or_wedged(q) ||
> +		exec_queue_destroyed(q);
> +
> +	/* Job hasn't started, can't be timed out */
> +	if (!skip_timeout_check && !xe_sched_job_started(job))
> +		goto rearm;
> +
>  	/*
> -	 * Kernel jobs should never fail, nor should VM jobs if they do
> -	 * somethings has gone wrong and the GT needs a reset
> +	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
> +	 * modify scheduling state to read timestamp. We could read the
> +	 * timestamp from a register to accumulate current running time but this
> +	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
> +	 * genuine timeouts.
>  	 */
> -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> -		if (!xe_sched_invalidate_job(job, 2)) {
> -			xe_sched_add_pending_job(sched, job);
> -			xe_sched_submission_start(sched);
> -			xe_gt_reset_async(q->gt);
> -			goto out;
> -		}
> -	}
> +	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>  
> -	/* Engine state now stable, disable scheduling if needed */
> +	/* Engine state now stable, disable scheduling to check timestamp */
>  	if (!wedged && exec_queue_registered(q)) {
> -		struct xe_guc *guc = exec_queue_to_guc(q);
>  		int ret;
>  
>  		if (exec_queue_reset(q))
>  			err = -EIO;
> -		set_exec_queue_banned(q);
> +
>  		if (!exec_queue_destroyed(q)) {
> -			xe_exec_queue_get(q);
> -			disable_scheduling_deregister(guc, q);
> +			/*
> +			 * Wait for any pending G2H to flush out before
> +			 * modifying state
> +			 */
> +			ret = wait_event_timeout(guc->ct.wq,
> +						 !exec_queue_pending_enable(q) ||
> +						 guc_read_stopped(guc), HZ * 5);
> +			if (!ret || guc_read_stopped(guc))
> +				goto trigger_reset;
> +
> +			/*
> +			 * Flag communicates to G2H handler that schedule
> +			 * disable originated from a timeout check. The G2H then
> +			 * avoid triggering cleanup or deregistering the exec
> +			 * queue.
> +			 */
> +			set_exec_queue_check_timeout(q);
> +			disable_scheduling(q, skip_timeout_check);
>  		}
>  
>  		/*
> @@ -1000,15 +1136,60 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  					 !exec_queue_pending_disable(q) ||
>  					 guc_read_stopped(guc), HZ * 5);
>  		if (!ret || guc_read_stopped(guc)) {
> -			drm_warn(&xe->drm, "Schedule disable failed to respond");
> -			xe_sched_add_pending_job(sched, job);
> -			xe_sched_submission_start(sched);
> +trigger_reset:
> +			xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
> +			set_exec_queue_extra_ref(q);
> +			xe_exec_queue_get(q);	/* GT reset owns this */
> +			set_exec_queue_banned(q);
>  			xe_gt_reset_async(q->gt);
>  			xe_sched_tdr_queue_imm(sched);
> -			goto out;
> +			goto rearm;
> +		}
> +	}
> +
> +	/*
> +	 * Check if job is actually timed out, if so restart job execution and TDR
> +	 */
> +	if (!wedged && !skip_timeout_check && !check_timeout(q, job) &&
> +	    !exec_queue_reset(q) && exec_queue_registered(q)) {
> +		clear_exec_queue_check_timeout(q);
> +		goto sched_enable;
> +	}
> +
> +	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> +		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> +		     q->guc->id, q->flags);
> +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> +		   "Kernel-submitted job timed out\n");
> +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> +		   "VM job timed out on non-killed execqueue\n");
> +
> +	trace_xe_sched_job_timedout(job);
> +
> +	if (!exec_queue_killed(q))
> +		xe_devcoredump(job);
> +
> +	/*
> +	 * Kernel jobs should never fail, nor should VM jobs if they do
> +	 * somethings has gone wrong and the GT needs a reset
> +	 */
> +	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> +			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> +		if (!xe_sched_invalidate_job(job, 2)) {
> +			clear_exec_queue_check_timeout(q);
> +			xe_gt_reset_async(q->gt);
> +			goto rearm;
>  		}
>  	}
>  
> +	/* Finish cleaning up exec queue via deregister */
> +	set_exec_queue_banned(q);
> +	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> +		set_exec_queue_extra_ref(q);
> +		xe_exec_queue_get(q);
> +		__deregister_exec_queue(guc, q);
> +	}
> +
>  	/* Stop fence signaling */
>  	xe_hw_fence_irq_stop(q->fence_irq);
>  
> @@ -1030,7 +1211,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	/* Start fence signaling */
>  	xe_hw_fence_irq_start(q->fence_irq);
>  
> -out:
> +	return DRM_GPU_SCHED_STAT_NOMINAL;
> +
> +sched_enable:
> +	enable_scheduling(q);
> +rearm:
> +	/*
> +	 * XXX: Ideally want to adjust timeout based on current exection time
> +	 * but there is not currently an easy way to do in DRM scheduler. With
> +	 * some thought, do this in a follow up.
> +	 */
> +	xe_sched_add_pending_job(sched, job);
> +	xe_sched_submission_start(sched);
> +
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
>  
> @@ -1133,7 +1326,6 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>  			   guc_read_stopped(guc));
>  
>  		if (!guc_read_stopped(guc)) {
> -			MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
>  			s64 since_resume_ms =
>  				ktime_ms_delta(ktime_get(),
>  					       q->guc->resume_time);
> @@ -1144,12 +1336,7 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>  				msleep(wait_ms);
>  
>  			set_exec_queue_suspended(q);
> -			clear_exec_queue_enabled(q);
> -			set_exec_queue_pending_disable(q);
> -			trace_xe_exec_queue_scheduling_disable(q);
> -
> -			xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -				       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +			disable_scheduling(q, false);
>  		}
>  	} else if (q->guc->suspend_pending) {
>  		set_exec_queue_suspended(q);
> @@ -1160,19 +1347,11 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>  static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>  {
>  	struct xe_exec_queue *q = msg->private_data;
> -	struct xe_guc *guc = exec_queue_to_guc(q);
>  
>  	if (guc_exec_queue_allowed_to_change_state(q)) {
> -		MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> -
>  		q->guc->resume_time = RESUME_PENDING;
>  		clear_exec_queue_suspended(q);
> -		set_exec_queue_pending_enable(q);
> -		set_exec_queue_enabled(q);
> -		trace_xe_exec_queue_scheduling_enable(q);
> -
> -		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +		enable_scheduling(q);
>  	} else {
>  		clear_exec_queue_suspended(q);
>  	}
> @@ -1434,8 +1613,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>  
>  	/* Clean up lost G2H + reset engine state */
>  	if (exec_queue_registered(q)) {
> -		if ((exec_queue_banned(q) && exec_queue_destroyed(q)) ||
> -		    xe_exec_queue_is_lr(q))
> +		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>  			xe_exec_queue_put(q);
>  		else if (exec_queue_destroyed(q))
>  			__guc_exec_queue_fini(guc, q);
> @@ -1612,6 +1790,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>  		smp_wmb();
>  		wake_up_all(&guc->ct.wq);
>  	} else {
> +		bool check_timeout = exec_queue_check_timeout(q);
> +
>  		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
>  		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
>  
> @@ -1619,11 +1799,12 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>  		if (q->guc->suspend_pending) {
>  			suspend_fence_signal(q);
>  		} else {
> -			if (exec_queue_banned(q)) {
> +			if (exec_queue_banned(q) || check_timeout) {
>  				smp_wmb();
>  				wake_up_all(&guc->ct.wq);
>  			}
> -			deregister_exec_queue(guc, q);
> +			if (!check_timeout)
> +				deregister_exec_queue(guc, q);
>  		}
>  	}
>  }
> @@ -1664,7 +1845,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
>  
>  	clear_exec_queue_registered(q);
>  
> -	if (exec_queue_banned(q) || xe_exec_queue_is_lr(q))
> +	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>  		xe_exec_queue_put(q);
>  	else
>  		__guc_exec_queue_fini(guc, q);
> @@ -1728,7 +1909,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	 * guc_exec_queue_timedout_job.
>  	 */
>  	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q))
> +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>  		xe_guc_exec_queue_trigger_cleanup(q);
>  
>  	return 0;
> @@ -1758,7 +1939,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  
>  	/* Treat the same as engine reset */
>  	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q))
> +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>  		xe_guc_exec_queue_trigger_cleanup(q);
>  
>  	return 0;
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
