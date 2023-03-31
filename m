Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C51C761A6
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 20:34:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2AC10E0E5;
	Fri, 31 Mar 2023 20:34:52 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA2D10E0E5
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 20:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680294885; x=1711830885;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Dxe7xnQ9wvnia/td1yeo2B1KltlX2zJ0iOT9mccSh0c=;
 b=FJxWBbuR3M9cmPye8D/8uzVtu+QBfgXctB0kX4bznijLqAJN/mmw8Xk+
 k7txqKLgPhkfFm3UK9JsX4BDiQC62+CYIgr9oCd5gYuAd5c98x/fv3vvZ
 49NupmJX4VnpLXw+CQceKZHpGlRTnP0P1OgtfQoW8faq7fZ+WtIcks+ND
 LnmFytj8rv0MDcNCOO/2VG9d/e4y5EGstp1wvKEXBjUzYRFgB8IuvOg4F
 tJNp3xuH++aklGA3FeAEpCGfZfUm82O1O7/AuBT3ugYC0B+8TJOBI1NpG
 hpLdcllCzEq0zvEAaZHadmHwfczO9b+QvGqbGhjp6qOeSblcv0+V8nHXm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="341570944"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="341570944"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 13:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="828852014"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="828852014"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2023 13:34:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 13:34:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 13:34:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 13:34:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 13:34:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYOccTGNPJbqN9oURtjKeUR0i9C9n3V5k1I6bf34kfDQR21q4LoINn74d3KDVUtJ0Sk3cglY7sb7UvId359c7jSGbMk9Na8Tye8LoamafUhVoTZTf7a3YeE5EO6QUb0cBiz6kf5wSZjdohm6fV6R6fmj3LNSkOONIT5EEbHosj9+KXKQQ/BvXloE43rR4Z5OoEL/T476A7rMIHJ2wqEPwvOWGAkPJWGvNOJ6EmA9nZ51+RsB8WzE2LohpFd5UMpv41kup8A2v2o34dje34PJEfPjJfPM/WHOSlMF21VAAy3SruC3QyTuXd2AE7H4OX6xiatr0kq8+tOR9RqEZ/Mg1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75nQcKL+rQTQDEQ/WNllUXem+TFMOE8E2xeHmfXDqFw=;
 b=N6WKCebe7GYgMMoJHrhhi3yDhoSLcWM5VHxxwjKwsmT6Ahx+Tbwv6F6eycxC0EVHMqeqBmYsHcJ7jU4dWw+C1kZDWPGBvBkWojUxsCaVz0CFooTk98xj+xZr44euQKPdW93wxEd40vh+m0bRuJgIAGXQfjG8JKnV4YCySWht2Ud8tywOM8EZTXUaIo6SkW+Z4LYcTzPE+TX99hGflKm3uv6mUB1b7KMpCR5SmQqd9ldE0IS//KXylAI9dLN4k3sd/xLRXH/8VOrqOlMExAAgfebNc3a2M+SS78l+00JoqSw0fh90qs88JeuKCfE+zYtSdF7rUfdn8ZMgvnkg1JfGgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BN9PR11MB5340.namprd11.prod.outlook.com (2603:10b6:408:119::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Fri, 31 Mar
 2023 20:34:33 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.024; Fri, 31 Mar 2023
 20:34:33 +0000
Date: Fri, 31 Mar 2023 13:34:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230331203430.GR4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230329173334.4015124-1-matthew.d.roper@intel.com>
 <20230329173334.4015124-2-matthew.d.roper@intel.com>
 <20230331201415.gdlb7xmjpae5ybbb@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230331201415.gdlb7xmjpae5ybbb@ldmartin-desk2.lan>
X-ClientProxiedBy: SJ0PR13CA0075.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::20) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BN9PR11MB5340:EE_
X-MS-Office365-Filtering-Correlation-Id: ac595c7c-7c94-43b2-3a9a-08db322755f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2+QkV9m3YZzShDt4GEa/DQ9il9D+ynXn5j/zToFSTo1TnIZ/820fcBXmbeR0PHwAD7iSSapFeuXN+62H8U3JcibSzKeqUrK+WCXkUTiFSmIpDDOjsEeYb7U0N3w28bxh4fbA0fq9SAKDVjNHTulEqQBYwZs4iguRkgisnSlAVI3eLV4fqsKO83w6ZhR/1u0OH3Vw4yq+lTEfJCN7hwxuxcg1R7hDuKM0ZQD4xAlVCo7HXprArn6OntuAYiosFB/JGE24BvsDCOrphBEtplvUA+cpbd66ph593bdBFyH3g+FTLFmHJHABEZEfVoeSlwWs8KTBIDxaZBcnGOdcYnoplmEAF9KXkQFeQGDKK+PY8EvegxdZ8tv4mA8YZ6X+T3hMB1eJE4+jaJMMZNi33gbMMhFagxhfziRFuyBQAk72YMmuayfHSj071yK6Ke9Rcg/pKwdOhr8GOc5U8fufwgSYI10VOaTlrIs4VPUYSm1sQ2kWH9VUaTCa8NMk2JBNkjv2grbPjlO2b05DrS05RxGZYIjXhY+vSQyZlXosnVehuOJEnHEt6J+JiLAuH+WctX+Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199021)(26005)(1076003)(82960400001)(33656002)(6506007)(6486002)(478600001)(186003)(5660300002)(8936002)(2906002)(6862004)(6636002)(316002)(66556008)(66476007)(86362001)(4326008)(41300700001)(6512007)(66946007)(8676002)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4apW9ai57N1c0Dl3CbiUOwKl11rgEDz38a0rTmaDPNvv/Rb4PSRNQKYGDjli?=
 =?us-ascii?Q?n803gx8owFwza1d108Oj+J8NgQNLij/3/Oe9uK0YYUHgbXPhAC7cgl7kDdQ2?=
 =?us-ascii?Q?NLSzMn/Z8z0ndU1kwOqypjiEGIrR+x2HseYfyV90WyYDDMYt9aurEGsvLNsj?=
 =?us-ascii?Q?9fsrLjX2+gFdrMeRjejXJ/gdfUjmoh8bmZiV2H0OZJI8r4/oivngRdBV2fv8?=
 =?us-ascii?Q?VWT62iGzk+rRXI77vPtaxmLkeh4Mj/pwdchd3lhcg5i5WYIEPgqG9l/lT5W0?=
 =?us-ascii?Q?C4slvwsRWBdOYNVteot6YpmUKtmI7Gn6uy2Rb+YIHFbPVHxYcZekRXnxB1yA?=
 =?us-ascii?Q?ukIrltp6oqcjodif21r30itn0GO0BSD+0yk5p6L/zAAEMeAyV4CWl8fpJMLt?=
 =?us-ascii?Q?9zecXShtyoQRZqBj15kQNSq8slHh9Bh/UJ0Z4ldHMKijYUAsa23KOV+5BlHQ?=
 =?us-ascii?Q?8BBD0Ziiw0CI4duB0zu/XokdeF3i179uUJF69NgoQMB3NV4mWKM1F4rcUVsp?=
 =?us-ascii?Q?RmOPRLgmVWoszfKDP80zWqNxxtrQzm9o5UZb5Au46vEXuILACNVfo1OJo7El?=
 =?us-ascii?Q?T+07h/Df/GO7vwneuVmpiolYTTFzyQ04c5btKpDVeeEZuDVn0cR2wGmZihZn?=
 =?us-ascii?Q?oPt8Mmj8kHNNAthTpdn2dx6P0CbpV6bgP6RTP5OXRp4W0Vi0+XYKmFyOnCae?=
 =?us-ascii?Q?aVmAwtl9o17VjaUgCkUuX6qpqOa1NgOogan3oJKKj4mC8Hb05UY2Qh3dYQj7?=
 =?us-ascii?Q?K8y7xn+YFeFkrYd3soYA7hiP+YpRgudfmE2yItS4UPSGQ3LggysBMjyHBp6A?=
 =?us-ascii?Q?EM71pELRyqy4vTrFU4DMkkEjAa/E+uJvpUF4dnK6T3g7n4QUeoYsz7S8TLZQ?=
 =?us-ascii?Q?1wj8AXvq2EgcON2pQCqoLBwpIvjQRnkbDry7zqkAHp4fob8yuglJ+ftcs0ar?=
 =?us-ascii?Q?Ohvflvj8F6ywN7itQ/X6HeZQ53tDIM+FfqqUzpE70o5WArRb4IiSMrgrvk1v?=
 =?us-ascii?Q?EogfZUzq/5itjN8LXxXdJQkHHcaiEK2zQxIZlW+O4S15l6gzNbR4PwwQbzH1?=
 =?us-ascii?Q?T4voJXTWWJPyVU4oKIQDHmuctI9RAr6afpX88ln4TQI6SnkWL0EgawZYm/kp?=
 =?us-ascii?Q?Fq46Zj0l517f2tfYTrLlmk+PCcDdXo0ogehU6tO7Jkkmmog2zPMjynlLmuTw?=
 =?us-ascii?Q?DZQ3ytZPtObqr+SL1C57F8Ynh76dyIrvMyZovib1fpx757Sq31DiHRwN7Kwg?=
 =?us-ascii?Q?WYZkQ6nvw/SB8yMvj/WuSjlQGm0OcvTxHJa5ZIj+4jXtXRqkT6O8y9JPq/AC?=
 =?us-ascii?Q?gvKXabkyTkPIwjeOVFp4EKwpgRM1J62lpoL0s/VBWYZLCzqaTLzp2UeTYCml?=
 =?us-ascii?Q?WHYpPrRow1BDbV95BsG85h0Tk8yiecvuRRBj6ttuCeIAxCg/UQdaDMwKv3EF?=
 =?us-ascii?Q?Jw0N/+4na/rxAKG6yzmds8tkVmFFnCAWpunl5yGQwdEkz4TMRWv4AMsZZ/4x?=
 =?us-ascii?Q?Mc6Z3xyUs2SjQJFuuI3N6SGgNBjkFAU+jw3niWKw6QAzrT1E/CBF4mIIv6rt?=
 =?us-ascii?Q?G+FeaRIycR6xuF33+lTZoAZ/lWgc005vdD7Zv+5rv/SwkGniye24u9Rp6/Yg?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac595c7c-7c94-43b2-3a9a-08db322755f6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 20:34:33.2414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfACt927cuWeaabPyZ/QOa9xnaSo0BPOp3rw/vdXo2e65H0yEsZYYv8zH7QzNVcbHJEz9iBNgKaFTQNR+zxN7lQKzxdxuFTEKwIZdEGWqgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5340
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Include hardware prefetch buffer
 in batchbuffer allocations
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

On Fri, Mar 31, 2023 at 01:14:15PM -0700, Lucas De Marchi wrote:
> On Wed, Mar 29, 2023 at 10:33:32AM -0700, Matt Roper wrote:
> > The hardware prefetches several cachelines of data from batchbuffers
> > before they are parsed.  This prefetching only stops when the parser
> > encounters an MI_BATCH_BUFFER_END instruction (or a nested
> > MI_BATCH_BUFFER_START), so we must ensure that there is enough padding
> > at the end of the batchbuffer to prevent the prefetcher from running
> > past the end of the allocation and potentially faulting.
> > 
> > Bspec: 45717
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_bb.c | 25 +++++++++++++++++++++++--
> > 1 file changed, 23 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> > index 5b24018e2a80..f326f117ba3b 100644
> > --- a/drivers/gpu/drm/xe/xe_bb.c
> > +++ b/drivers/gpu/drm/xe/xe_bb.c
> > @@ -8,11 +8,26 @@
> > #include "regs/xe_gpu_commands.h"
> > #include "xe_device.h"
> > #include "xe_engine_types.h"
> > +#include "xe_gt.h"
> > #include "xe_hw_fence.h"
> > #include "xe_sa.h"
> > #include "xe_sched_job.h"
> > #include "xe_vm_types.h"
> > 
> > +static int bb_prefetch(struct xe_gt *gt)
> > +{
> > +	struct xe_device *xe = gt->xe;
> > +
> > +	if (GRAPHICS_VERx100(xe) >= 1250 && !xe_gt_is_media_type(gt))
> > +		/*
> > +		 * RCS and CCS require 1K, although other engines would be
> > +		 * okay with 512.
> > +		 */
> > +		return SZ_1K;
> > +	else
> > +		return SZ_512;
> > +}
> > +
> > struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
> > {
> > 	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> > @@ -21,8 +36,14 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
> > 	if (!bb)
> > 		return ERR_PTR(-ENOMEM);
> > 
> > -	bb->bo = xe_sa_bo_new(!usm ? &gt->kernel_bb_pool :
> > -			      &gt->usm.bb_pool, 4 * dwords + 4);
> > +	/*
> > +	 * We need to allocate space for the requested number of dwords,
> > +	 * one additional MI_BATCH_BUFFER_END dword, and additional buffer
> > +	 * space to accomodate the platform-specific hardware prefetch
> > +	 * requirements.
> > +	 */
> > +	bb->bo = xe_sa_bo_new(!usm ? &gt->kernel_bb_pool : &gt->usm.bb_pool,
> > +			      4 * (dwords + 1) + bb_prefetch(gt));
> 
> if the command buffer for the CS is 512 or 1024, wouldn't it be
> sufficient to just align the end rather than increase it by that?

I thought that initially, but the spec indicates that the prefetch
doesn't just happen in .5K chunks or whatever, but that they're
continuously happening as each command in the batch buffer is executed.
So if you complete a 1 DW instructions, a new DW is prefetched at the
current HEAD + 0.5K.  If that falls outside the batchbuffer (and
potentially outside the bound pages), the hardware can fault.

The MI_BATCH_BUFFER_START bspec page (45718) also gives some more
clarity on this:

        "It keeps fetching command data as and when space is available
        in the storage upon execution of commands. In case of batch
        buffer execution, DMA engine stops prefetching the command data
        only on executing MI_BATCH_BUFFER_END command and
        MI_BATCH_BUFFER_START in case of chained batch buffers."


Matt

> 
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
