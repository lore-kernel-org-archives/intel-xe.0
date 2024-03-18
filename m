Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDCBC54E71
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 20:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC32B10FFA8;
	Mon, 18 Mar 2024 20:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvWQIyDK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C891B10FFA8
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 20:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710792858; x=1742328858;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cLlkUgeymLXwAS6jd72n+Ip1rsjEZmHlMrda6Xy7NxM=;
 b=fvWQIyDKQOMRtxEU5tX62geNMYrQm0S4kAnvSaw6TjcZ32mR5VuLcdOe
 P+MWHj5smO/21V6sbvU95BTh9f0XP5WkwLohEcS5vEX+CLsChApmbXO6c
 W9huaM4XrTvx+Li4Rtwy7Bp4gJBTxO8u271KlzywJy9wuRwgOJZwe8Zhd
 enHyh/ztNqgOSsKQijHRZ58lQI8dYijrbvrp0f9FtTgjP7wnfG5OcOA5L
 7Sl0YYUexfSMzlguL292MSvIIR/oXMrQUJg7+ETdKcf5yxTDnagiv6wzA
 /UqNP69mnoJjLrXEo4ApOp8J7AsuH4z5Qz2AZh+IjIc+BKu+7qfp7TjCf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5509886"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5509886"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 13:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="13630425"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 13:14:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 13:14:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 13:14:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 13:14:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 13:14:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8ADcuZOh9DpVtykpHEfUY3g7WLmlH4FUbmHm4ao4quVtnPbm4lp4Wmk7kHSuGvQ/3r0yP+vXJ+R+f2fuBpFtbEDETOZJinLVKcemExd+i356I/b7tf/X9u33ZsGRj4+JiEaVqODWUQYVpro8Hor3t3CHXDNJBb40sSOviCtIF1htrEV3D/0DlsUVsVikoHoX82e/WKZzgzlRpnv45knt3eLq/DEbhwol+XIu5SD2lWczHPUVoZkg40Z7zbR2dM0NfyTuDSdjqHGUjnqjjSX9BIiQrtVJtYn7lL5D/2Znk+BGiW5ImQg5nfNrPQF7c/ezpbGCN0njEkCnDk/VyWNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JC/irU03IbymZIxRNw+Wl0I1M+BvL3fMAv15KD+/czE=;
 b=E4rk0FHMB7ytz9RXj1p7XASIFnG3bQLiVxYa5nF58aAMUtoGcoFGmC2lCak5ONEwplDEpAD25pRJSk3yg8hRNLXHj1iLTSFvR9jhKIxfqIKWc6d1IUVqwBFiEJ372+CfxABOP/rHL6iqN2RJ2n8kSKRRL7FCsqcP2tnv9q3wjBj8kFjggu+JWe/0vSPWgmvXeAX/c7wQlT5pvQpAeMkdi60PF618dUeQ2ahF91DE3M3sWiJm3Z2oBQ5e3NwZxBFIxGC+xDYxZ+ip4KdauFPoMOnpREF4ngMjbZT1pMj/+MKg3+rHRYK1THxrxneI9Mut8tVOvrZ4Qt4Gf66M8FCkjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5977.namprd11.prod.outlook.com (2603:10b6:208:384::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 20:14:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 20:14:08 +0000
Date: Mon, 18 Mar 2024 16:14:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Matt Roper <matthew.d.roper@intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 6/6] drm/xe: Introduce the busted_mode debugfs
Message-ID: <ZfigjKare0FDcHw8@intel.com>
References: <20240315140108.217862-1-rodrigo.vivi@intel.com>
 <20240315140108.217862-6-rodrigo.vivi@intel.com>
 <icleohhxyesfwfcfikzsubm3dqcpmujb7dal24lblfx7t62fzx@ella5j5r6ooh>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <icleohhxyesfwfcfikzsubm3dqcpmujb7dal24lblfx7t62fzx@ella5j5r6ooh>
X-ClientProxiedBy: BYAPR06CA0009.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5977:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jMeMfkRiMRIiCErHNOdJ9pbt1LfaUJ7YxGgsGMz1nBPussCphmgBtAQoimnTgp1C6iTL9lW3FTH6xRlsQjRBGwHtTILxq8b8V9jNIfVYKEjUTYNLrz40LWQle2a9b5p+RQNRslYxgVfJ3nNwNQx2KBJCLvc6NHyhwpaAg4W9JEyd7XhHWF/OT7+wRVzCJSY03RT8qBoA5PC9WZR7s5Qu9KSVUPv9j8Q05JhZPU28Mry2v8oG24N6FnG2AcAmRocoANgZ3d/5o9UrrdO0mFpngk/83FsUFXMul0Y+wB7QOWGom4s7MRwvQWDAbeuaoIqUH6J5fbui1u6Lan4BHTcfvQAeNc46x81VYcf6KlAfiGnBNhJrrBuBw/zJH5/ib5taIA2QrD1Qj4gh5dOTBdqRhmqBgDerLXH5BWG8v9RK6JFGplI3kX4xTQlSpgzcg/N5hiQX5t4stoj8/+SdaeoPDDPJ5/HuWePUzbwF6oUMxsTI3HKnkhrDIyDhZgi9GpYqcOXXQurKRoJk4UYrn59voEQTGyWBhAorsI4VWWr7wXm5D6ikSumuapbrCi98hEYmBFHLr5ghz+PONHO5lppZ1z/s9t3flX4pgsbqsSNJq2fozvP0PkzpUG6R5LlIsaTViaP9sIhTP4lal5HaYP4osw1QX0EK5wSLw9kO4DOuXGg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vhPR/JeCnpJ5eaDd9gn8QQPcm+FHp+YIt5wwW4f7WQOflREFH+Xy/SoaeQX5?=
 =?us-ascii?Q?4NXim6rEMLFYByUJQ+qurCHxL1OABu+Klse26gUy0wQ+y9gJukNaIAN8KUkD?=
 =?us-ascii?Q?QFJi/qtske8ri9Fp4slBozjJVJdqRlAeTTYcBaAbPxvoy6xzGsepLbGp70WI?=
 =?us-ascii?Q?CmCsjALFOgZ6NDVGuiqY2OUxw25JruACoxgCiugLBPIxIxJJJlzKVnNAgzzd?=
 =?us-ascii?Q?bvbyMCTabvER7ffyPse1FWAbNuKzfdhxmdvygI3gS/qj15OnRGjsQLVj9UBP?=
 =?us-ascii?Q?iiE+OWYmU050bdH7nh1VAaEHl65Qa/DKSPFi4weP7zc2VRKbdEDJImcNgYJN?=
 =?us-ascii?Q?xJiYEcMLRG8RSbqkJqPl0/o3fgTHV9Bd6V+XER+3ik7/8T/YW+rAjMZd0TH0?=
 =?us-ascii?Q?MRKgnaBYphJjaKgY3r321C72HIQGxYx9Asm0+m3ychsGkqDiNI7SOTVCFbhW?=
 =?us-ascii?Q?SPXO+jOXBUDpa16LvPryQV56otucAXW7IpcLjMyXrFEgcc7UIXjuDASFvuwt?=
 =?us-ascii?Q?GEFQpzOHgR6zGd23ZYTQRxaGh3xWNaNRmx7Fv6O16+nmy2LpdQWxZHubWErA?=
 =?us-ascii?Q?JOaYwlboUjXajxu5nUc/5iwh9hZvGZa5Xbu0edO+6Cc7cwpiCXtF87MhFDvc?=
 =?us-ascii?Q?8wnA0/qbD01SRlRMCehBpy87XermCPuGwQGSpV5gzsIn+siVJ6J/JeVlyplg?=
 =?us-ascii?Q?EPEcVUr4TwHt0loMxha6RrXqkvIapRvhAG33SRu40wyY+IpG2+MVpmfFxIDj?=
 =?us-ascii?Q?WOR3MAI5Cm5324jL9QCQHcziM9NHIvG9dysnhyuppdLE0HqNxyTKyj4q4Wzw?=
 =?us-ascii?Q?hamc1iunm1GEvzNw8W4JrLlWd9b9NQ8SLtkWYywdpYEb+UMlcbRbkqzRGDLf?=
 =?us-ascii?Q?bUa7UHV29/J707pIplUyyaNb8n7vfpv7yP8j15wZ4hOPtes9XS9hVxmg0iC7?=
 =?us-ascii?Q?L6l5tT+xVsfWoLQBetj9bc6gQkJmrjk67byQOhYbYVwEUoNcvKUfVZlggJXO?=
 =?us-ascii?Q?0M9yDXROFaMCn4rCDiwq7AwU3YP8psT+AqTb2xeNcjv1iYOp2zA+2ZvIHbSn?=
 =?us-ascii?Q?/KCYVxqxUyBnpHs5XL2zJApJwvK4/LyCgGzKVgwe878F3AobEAETED8wZv4O?=
 =?us-ascii?Q?+7UKxOyDT9cyrILIhzOpvA5bJ6Q51C92hzw3VfTxpIo3oczUYyCuRyuulgjL?=
 =?us-ascii?Q?3C0nEoQkYMIML/iAluOpbW9j0ZEjbMTSZDrGz7fqsCXH6aP9pBRT5fL7XIaz?=
 =?us-ascii?Q?A1u1fjYoMlmDcxYgHaUi3BZ6KXyWqIldGM2OX2aIE49ajOcjongAVC7F6PT6?=
 =?us-ascii?Q?mhlUjoaKe4GKUGWMjTjpFhnpqoWOfqA/7Ln3m+pfhG1yExLsvTZb55g0Zpj6?=
 =?us-ascii?Q?9nGQ3dLkAa1ER6GLaYDhp52QUgGu9XnAgDRaTPaS5qOdLFsljGqhHPnip5AI?=
 =?us-ascii?Q?gINCsWKKiWA2spVt7cXB+9U+bH91ck51IgNnJUPyok0vbarnyoPdInYCET50?=
 =?us-ascii?Q?jlKKQ53THk4cTfgvS9WYyNhgKFZGoP8o5YvghVT14G3xsLWaG0foNVNxfZLI?=
 =?us-ascii?Q?3Sea9BmNB1kfeTnLRPHJ8BQqpj+BK24pbGF5a0ZQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e9dd201-b07a-4c41-c414-08dc4787f7b0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 20:14:08.4335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qftyhsKgjcNXtLojxrX/wxocHXz6gnSw0xAzxUyeOntdSWvuVMOP5Am0dshZAzytCzWtIaLm6YPWCO3okdVtlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5977
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

On Mon, Mar 18, 2024 at 02:31:31PM -0500, Lucas De Marchi wrote:
> On Fri, Mar 15, 2024 at 10:01:08AM -0400, Rodrigo Vivi wrote:
> > So, the busted mode can be selected at runtime with the device
> > granularity, rather then a module policy.
> 
> did you mean to squash this in the previous commit?

doh! yes, that was the intention, but forgot to mark it as a fixup.

> 
> for the entire series, it seems it's going the right direction. It would
> be good to have some more testing with it before merging though. I asked
> SV folks to give it a try. I also saw some typos I forgot to comment on
> so I will have to go through the patches again.

yeap, I also want their ack on that as well.

> 
> Another question is about naming since some people didn't like "busted".
> Options:
> 
> 1) keep busted
> 2) zombie
> 3) back to wedged
> 4) dead
> 5) blocked
> 6) disabled
> 7) unusable
> 8) unreliable
> 9) misbehaving
> 
> Did I miss any suggestion?  Well.... the order above is just _my_
> preference, but I'm totally fine if other people disagree and we decide
> something else.
> 
> Cc'ing some people who may chime in with their preference.

well, at this point anything works to me. Just let me know the most popular
and I change the patches.

> 
> Lucas De Marchi
> 
> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_debugfs.c | 12 +++++++++
> > drivers/gpu/drm/xe/xe_guc_ads.c | 46 +++++++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_guc_ads.h |  1 +
> > 3 files changed, 59 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> > index 175ba306c3eb..0cd20862d32e 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -12,6 +12,7 @@
> > #include "xe_bo.h"
> > #include "xe_device.h"
> > #include "xe_gt_debugfs.h"
> > +#include "xe_guc_ads.h"
> > #include "xe_pm.h"
> > #include "xe_step.h"
> > 
> > @@ -124,8 +125,10 @@ static ssize_t busted_mode_set(struct file *f, const char __user *ubuf,
> > 			       size_t size, loff_t *pos)
> > {
> > 	struct xe_device *xe = file_inode(f)->i_private;
> > +	struct xe_gt *gt;
> > 	u32 busted_mode;
> > 	ssize_t ret;
> > +	u8 id;
> > 
> > 	ret = kstrtouint_from_user(ubuf, size, 0, &busted_mode);
> > 	if (ret)
> > @@ -136,6 +139,15 @@ static ssize_t busted_mode_set(struct file *f, const char __user *ubuf,
> > 
> > 	mutex_lock(&xe->busted.lock);
> > 	xe->busted.mode = busted_mode;
> > +	if (busted_mode == 2) {
> > +		for_each_gt(gt, xe, id) {
> > +			ret = xe_guc_ads_scheduler_policy_disable_reset(&gt->uc.guc.ads);
> > +			if (ret) {
> > +				drm_err(&xe->drm, "Failed to update GuC ADS scheduler policy. GPU might still reset even on the busted_mode=2\n");
> > +				break;
> > +			}
> > +		}
> > +	}
> > 	mutex_unlock(&xe->busted.lock);
> > 
> > 	return size;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index 43f0a88bbe8a..5dccdbe595bf 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -7,6 +7,7 @@
> > 
> > #include <drm/drm_managed.h>
> > 
> > +#include "abi/guc_actions_abi.h"
> > #include "regs/xe_engine_regs.h"
> > #include "regs/xe_gt_regs.h"
> > #include "regs/xe_guc_regs.h"
> > @@ -14,6 +15,7 @@
> > #include "xe_gt.h"
> > #include "xe_gt_ccs_mode.h"
> > #include "xe_guc.h"
> > +#include "xe_guc_ct.h"
> > #include "xe_hw_engine.h"
> > #include "xe_lrc.h"
> > #include "xe_map.h"
> > @@ -679,3 +681,47 @@ void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
> > {
> > 	guc_populate_golden_lrc(ads);
> > }
> > +
> > +static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_offset)
> > +{
> > +	struct  xe_guc_ct *ct = &ads_to_guc(ads)->ct;
> > +	u32 action[] = {
> > +		XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE,
> > +		policy_offset
> > +	};
> > +
> > +	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> > +}
> > +
> > +int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads)
> > +{
> > +	struct xe_device *xe = ads_to_xe(ads);
> > +	struct xe_gt *gt = ads_to_gt(ads);
> > +	struct xe_tile *tile = gt_to_tile(gt);
> > +	struct guc_policies *policies;
> > +	struct xe_bo *bo;
> > +	int ret = 0;
> > +
> > +	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
> > +	if (!policies)
> > +		return -ENOMEM;
> > +
> > +	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
> > +	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
> > +	policies->is_valid = 1;
> > +	if (xe->busted.mode == 2)
> > +		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> > +
> > +	bo = xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct guc_policies),
> > +					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > +					    XE_BO_CREATE_GGTT_BIT);
> > +	if (IS_ERR(bo)) {
> > +		ret = PTR_ERR(bo);
> > +		goto out;
> > +	}
> > +
> > +	ret = guc_ads_action_update_policies(ads, xe_bo_ggtt_addr(bo));
> > +out:
> > +	kfree(policies);
> > +	return ret;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
> > index 138ef6267671..7c45c40fab34 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
> > @@ -13,5 +13,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
> > void xe_guc_ads_populate(struct xe_guc_ads *ads);
> > void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
> > void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
> > +int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads);
> > 
> > #endif
> > -- 
> > 2.44.0
> > 
