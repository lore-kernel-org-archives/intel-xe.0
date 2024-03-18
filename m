Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18732C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 19:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD38C10FE2B;
	Mon, 18 Mar 2024 19:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RbmNaQFe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D373610FE2B
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 19:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710790299; x=1742326299;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MzUFstvGm52F94fpHIl3atThKPddWoA0rr7t08Gt0/s=;
 b=RbmNaQFeI8+UrYq1IH63vdC9BxBCHKSPnrWPFZUN5pA8rZE2LiCQUZXc
 KQz/nygvDoEr5Vj8yjM7RMsUpVdFtLDRHMlQev/rXUk5e7XXj82cvM2Vb
 uRpT/Cg+/d71s+b9BdGFO3nsjLGpyAThMgUbrjWB3ekKQNqkfRlLetgkr
 Aj1T33kuemg8xedCussPt96PV58XSytx9ATxtJVuI5uRdPYrLWLqt5awG
 8HSgzVvdalHy1DAxZIi1jXJU+F2JJ9WoKfNVqwRv3M8j64lJ8B9o0wYdC
 If3Bf9tlNpmWg+MNezhTsFRWAoZ4lYTM35rgF+CIvRDLSUw3NvZpuBbYa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="8570834"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="8570834"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 12:31:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18301103"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 12:31:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 12:31:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 12:31:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 12:31:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 12:31:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEaKmzWGBpmEFJcKpSH3oqrE7JLsf2rrXAwCJ72rbTEHN8aSRYxFuldNS5JfAOI2npbUqK4CVYQsPgggSIdKmI17HNL5r5EdSRDSbEyYrnQz0bNHnlWDmmQQmoeQ5K51lFWZFoQV/S+BdlvLcO2imT9xLhFohUgd0b4l+CUs8E1MzR/h6OmZu6OpJuKlQ2d4HZMCJO+OdSuTZ0dQ5oTdKQV+mCRY5HL81jTd2V9y4Y2o9OE1NpUU3Mt6FWg3Tr8tOxjNvqKwsRHXzlJpGp6bJ+Yul3piX7LN6t4di3Sr04iNSBLgFCGWOMfqd/9JczVAIFMo8PzcJnSN5YHgXcKB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fv+pAxtiZMEC8MYUL2tTzGJ38HAzkpuwBgakYJQyf6o=;
 b=fPkKzD8aJDs/V8drfW2PcfiTf7cUzPgPhAUtgPf5cevpKhNsyTZ/bfI7nHdD6pomxQuRGqgLg5Fe1DZuzVQ16ADgJXftpbC6q4ZMlX0rPOPuna89mFSv/Fj1Lki4DYp+SULMpwapwGcOl6FP/fwtjdqhTOQYvszjYzxD7BHNcxdZ+kyCHiP35USJvPkHxJ9MweE+eSHRupu8PkWEtWCn54HTgHFoZXJ8xr3oT22S8MPSpG1wdDACGsjjlELz3TFmSmzIsvSpG3b89N2z+je6oYqURvRSj7ZxdL+97eHfs+ni3E2NxS9tFnhC1FB1q8Be6V/fRkwCYLVIoXmIWUDaDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 19:31:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 19:31:34 +0000
Date: Mon, 18 Mar 2024 14:31:31 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Matt Roper <matthew.d.roper@intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 6/6] drm/xe: Introduce the busted_mode debugfs
Message-ID: <icleohhxyesfwfcfikzsubm3dqcpmujb7dal24lblfx7t62fzx@ella5j5r6ooh>
References: <20240315140108.217862-1-rodrigo.vivi@intel.com>
 <20240315140108.217862-6-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240315140108.217862-6-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR06CA0033.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::46) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: 84884227-a363-4757-d63f-08dc4782058f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sIH/VkD6xJ+TbOAcizR61cirfo8xMQSKzH+frU2r77lTU+UWTfXsAYtGDo8/EC9Iku7dmdjqICZ55N1cFcKvVItZNMWZzpMJ700CPRp3LZc7WKL7VXFgsdr0iWKSZqDzhnQiVQBR9wzA2/shytQiKj+MStfGRqyKVFHl1bDgeLdWbvNMTEukn5sr37m7Ezy1D/6jeNLADmAArzkif0SWViH9bB3M07tos0np1QI1JCGr7vCVcKdSeftngxgI8gu5b6eVvLcTJ6GTLoD9OqbeL6O7cwQ8QwcUT20hFy6ShPYViDnIfoT2wHXfKc322RzAi7LRQxHPiCly2KS35ELsL1fsxW/Xs5dLl5bE9xz4HWeBs9CpxM8UsEFnbnSboeailUpwgY2wMet3KG/mz6VY8q3X6Dev6ShQeIMlD3FdBQKTr666KhKmixPT0ZnnShxnen1CVa7NX802uDtEQGENds5L+79/3B6zAYNjigmKsKePwbyqePKKcwf4y6DFQlMMlNawCovWR09FdDXFHHVMUAeGjCMV7/PcC7vvRx26YG8xe9PUJ9nEyiJL/vXbKDfgp1rISV8d1WIawTz4mbCNz+cQeJQPixNUVw6elUJ4tN96B8M6zfiXPoZFLC6n2i5426W35VdTOJgP0GdJh3v/MC7HX5h4hG1dGsKEuuXD5fM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/ekuCPIbRNrA/Jh/JVk5G9eMhUxDp0he/JLHhIAgFWMbFO3ittf7HliICrA7?=
 =?us-ascii?Q?tjYmTCh+FswCwLC9hFQMZjYosUzX17ypUJSty+maYi55uZCtSEEXH04PjEPv?=
 =?us-ascii?Q?s7O2Cp4EQMNQMvxs8SmNKx14w1Hjt1BTW2+a88NvZ/fctNkYS5tFjBO7989F?=
 =?us-ascii?Q?m3HyJFikYIkWUdAiXVL8JA4e8Ov7A4VKPDSgbS+mNL6j8MoEz9cwLODwOh0m?=
 =?us-ascii?Q?a6L1RYriQeww6g3C63/jM4OIKXE+Mxfz/rN0EaxwbXLW+z3GZuUhL1MiWQtG?=
 =?us-ascii?Q?xhVsc8FfaxKLbGGy5WEKe7zINhwkbcp52h0PcnChZXY9svKLxVehCqH7Cx+j?=
 =?us-ascii?Q?mKQyFnD3RckenvurDsEpN1R4Zu1PWsa7at/Y9lXQXyUGXhD+jPLquwGBNoXT?=
 =?us-ascii?Q?wxQuPdGcnSAAuUOYDG/zXxZfETt3T51D/wEAmm+dFpRByIqaoTBzcbtDhEqn?=
 =?us-ascii?Q?ww7uRpCbpadUl02oGedP57ojxLKNWwGRaI3nPJi3mn2KaVu4UZwv4UwO79Pe?=
 =?us-ascii?Q?oA9eT0xGKfrU5wPnR2uunRd/SVVUbmorbBMiFhHkVfgtehN2EJ+r5x/BIkOw?=
 =?us-ascii?Q?TfPFZArfUyDw8W3lLMMcBHnlXj8W2aUZTcUoJbntdN9QeDSErVeZYutcCj7d?=
 =?us-ascii?Q?akFEl3XIM28X8B0hxvLzsEuDDgNtlnef7GW9UZjSHv0//C8GqZcBLRj72/P/?=
 =?us-ascii?Q?jgH7E1KdB2iI13Tr4in99P+NTDEeo3aVuwIbrVeobto+4weSIo9wXr+RXKX+?=
 =?us-ascii?Q?te2XIT88p0bLE4KeXAQ03y6WIMHDBlvWr2bjy7btl4mmdB+NMb+e3+sUhMev?=
 =?us-ascii?Q?pzzcEtB4TjuOSdMzmthAxyDjVAlYYoo+Evp7bMj4jW5ceaShCJ/Ypo7qwmBp?=
 =?us-ascii?Q?nfRNjDLMDTWzCtPRtWr2A/YE49grzMRbmlYpHZXiGZha/h/kSdOnSYtsDVq8?=
 =?us-ascii?Q?u/hCWEBmQ3RU3lD22MnrKDNrDLDFOOG2eHA4AcBWhYmVX9krYBSZz5b+X491?=
 =?us-ascii?Q?ZlI/vRB6Ko9JYY+3BKnRjzJGLK6J1zA7LnWJgfzHiY9ocVlgy0/1/xTF3n8D?=
 =?us-ascii?Q?7XFFQ+b3rhA265ITtd9MCv9Zbu7LoQDIPtycnRqFMwT/wUz9X1bn5KZpXhTT?=
 =?us-ascii?Q?mZq7HozgHwfxawF56/myBNEP0Jb6fSpIaVi2HiSWTWoB1g8xAfVf8RQzs8Ev?=
 =?us-ascii?Q?wmknJ/NLIJQ8HkXlc47nEhLgApIgu6iuW62q+KaiwM7RZ6XzzAGtvbF3Q3xB?=
 =?us-ascii?Q?SIRuYTKM1Z/BC6U45VNSwhEwrOLeF+/MELIDkx+ZwOb3nVZ5qt124e5Yoi6f?=
 =?us-ascii?Q?U2I4BZIA18gTPj5wy0YQtB96pOjM94Icjvixjz7Q+SBrYGiVjux79Ia/63wp?=
 =?us-ascii?Q?8b0bkeWbL80oDzV3mqv+DgxmIux3ZLqUyDOUfVQmyBojgg8CUZsDOBXETCbl?=
 =?us-ascii?Q?etIkFaYczrexATswmfGkT+IV2VjtQcoUQZLNR5JAK8fMaPsm480gFL03e48h?=
 =?us-ascii?Q?GGYETGv3qgJl1zcA/DaSt4w/uWnYZGHazTp+TUH3wGPwtltzihNpIpdMzTaW?=
 =?us-ascii?Q?yOn9LReYMoUPkcap9HpCTsha6aouxHXDuJIb0UyMdsfu+rd9tRWfX/A9+62t?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84884227-a363-4757-d63f-08dc4782058f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 19:31:34.5742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORnqPAcV6iLtWb2cP+HnmY3pQd/xRgz343Ab9pjctzcWW/uI+SajumYhEl6yQFPrvdNV09TtiVm4Pq0qkGfXW4uS5MJwabTZkXHKpxQ+yNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7824
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

On Fri, Mar 15, 2024 at 10:01:08AM -0400, Rodrigo Vivi wrote:
>So, the busted mode can be selected at runtime with the device
>granularity, rather then a module policy.

did you mean to squash this in the previous commit?

for the entire series, it seems it's going the right direction. It would
be good to have some more testing with it before merging though. I asked
SV folks to give it a try. I also saw some typos I forgot to comment on
so I will have to go through the patches again.

Another question is about naming since some people didn't like "busted".
Options:

1) keep busted
2) zombie
3) back to wedged
4) dead
5) blocked
6) disabled
7) unusable
8) unreliable
9) misbehaving

Did I miss any suggestion?  Well.... the order above is just _my_
preference, but I'm totally fine if other people disagree and we decide
something else.

Cc'ing some people who may chime in with their preference.

Lucas De Marchi

>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_debugfs.c | 12 +++++++++
> drivers/gpu/drm/xe/xe_guc_ads.c | 46 +++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_ads.h |  1 +
> 3 files changed, 59 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>index 175ba306c3eb..0cd20862d32e 100644
>--- a/drivers/gpu/drm/xe/xe_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_debugfs.c
>@@ -12,6 +12,7 @@
> #include "xe_bo.h"
> #include "xe_device.h"
> #include "xe_gt_debugfs.h"
>+#include "xe_guc_ads.h"
> #include "xe_pm.h"
> #include "xe_step.h"
>
>@@ -124,8 +125,10 @@ static ssize_t busted_mode_set(struct file *f, const char __user *ubuf,
> 			       size_t size, loff_t *pos)
> {
> 	struct xe_device *xe = file_inode(f)->i_private;
>+	struct xe_gt *gt;
> 	u32 busted_mode;
> 	ssize_t ret;
>+	u8 id;
>
> 	ret = kstrtouint_from_user(ubuf, size, 0, &busted_mode);
> 	if (ret)
>@@ -136,6 +139,15 @@ static ssize_t busted_mode_set(struct file *f, const char __user *ubuf,
>
> 	mutex_lock(&xe->busted.lock);
> 	xe->busted.mode = busted_mode;
>+	if (busted_mode == 2) {
>+		for_each_gt(gt, xe, id) {
>+			ret = xe_guc_ads_scheduler_policy_disable_reset(&gt->uc.guc.ads);
>+			if (ret) {
>+				drm_err(&xe->drm, "Failed to update GuC ADS scheduler policy. GPU might still reset even on the busted_mode=2\n");
>+				break;
>+			}
>+		}
>+	}
> 	mutex_unlock(&xe->busted.lock);
>
> 	return size;
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index 43f0a88bbe8a..5dccdbe595bf 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -7,6 +7,7 @@
>
> #include <drm/drm_managed.h>
>
>+#include "abi/guc_actions_abi.h"
> #include "regs/xe_engine_regs.h"
> #include "regs/xe_gt_regs.h"
> #include "regs/xe_guc_regs.h"
>@@ -14,6 +15,7 @@
> #include "xe_gt.h"
> #include "xe_gt_ccs_mode.h"
> #include "xe_guc.h"
>+#include "xe_guc_ct.h"
> #include "xe_hw_engine.h"
> #include "xe_lrc.h"
> #include "xe_map.h"
>@@ -679,3 +681,47 @@ void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
> {
> 	guc_populate_golden_lrc(ads);
> }
>+
>+static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_offset)
>+{
>+	struct  xe_guc_ct *ct = &ads_to_guc(ads)->ct;
>+	u32 action[] = {
>+		XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE,
>+		policy_offset
>+	};
>+
>+	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>+}
>+
>+int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads)
>+{
>+	struct xe_device *xe = ads_to_xe(ads);
>+	struct xe_gt *gt = ads_to_gt(ads);
>+	struct xe_tile *tile = gt_to_tile(gt);
>+	struct guc_policies *policies;
>+	struct xe_bo *bo;
>+	int ret = 0;
>+
>+	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
>+	if (!policies)
>+		return -ENOMEM;
>+
>+	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>+	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>+	policies->is_valid = 1;
>+	if (xe->busted.mode == 2)
>+		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>+
>+	bo = xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct guc_policies),
>+					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>+					    XE_BO_CREATE_GGTT_BIT);
>+	if (IS_ERR(bo)) {
>+		ret = PTR_ERR(bo);
>+		goto out;
>+	}
>+
>+	ret = guc_ads_action_update_policies(ads, xe_bo_ggtt_addr(bo));
>+out:
>+	kfree(policies);
>+	return ret;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
>index 138ef6267671..7c45c40fab34 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.h
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.h
>@@ -13,5 +13,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
> void xe_guc_ads_populate(struct xe_guc_ads *ads);
> void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
> void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
>+int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads);
>
> #endif
>-- 
>2.44.0
>
