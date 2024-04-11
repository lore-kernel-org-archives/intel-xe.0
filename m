Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA95CD11C2
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 02:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190F010ED64;
	Thu, 11 Apr 2024 02:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VW0/ITkD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B2410ED64
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 02:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712804185; x=1744340185;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bGkYWn4knJSOoU5n5U6cvtVj+px5JfMfwojChnwpGaA=;
 b=VW0/ITkDbMjPRfWy27pDDEa059J/SyMOB6jV5sFPzXMCnqJUyA2SUG4c
 q5RZ1R8FQND/zrq/vOKFLF/OV+tGTTiv+IUQO7GtItc4O7fwLcfmJrew7
 cou4fcU69Jo8IBq6Cf63gS4BNaGFuDLP52DIONtlzlLolJv9wCwSkCGC6
 oje8v3hvi0318gw34jub5LKqD82bsLShRrrKrV4IHc6izm5bl4awemUhX
 LPVy9yQm5efzJo+radhO5mS2lJgOOMtvB3Cp+a+YAinVMom3RKQKe8CZw
 YUvPVa2fLjyv0Ga9d4R2FNRufyw8CxXppcnLzUWMTctv+mkKwpSlp1++w g==;
X-CSE-ConnectionGUID: 3qFEMXqoRruAD1i7fnUAOA==
X-CSE-MsgGUID: HVmxbr9QS76FFK9UlF/1GQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="33597048"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; d="scan'208";a="33597048"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 19:56:24 -0700
X-CSE-ConnectionGUID: tjvmtRPKTMm8p4rcXDjD4Q==
X-CSE-MsgGUID: D8RmJGOcT/eJAuVeE49YWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; d="scan'208";a="21197064"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 19:56:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 19:56:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 19:56:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 19:56:23 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 19:56:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5NTFJzo8uYWhQJ2cduCmnF9Cm1Qc+m9XRnldI/aBaFaZpLxTmM+e8Faj+ae77EhMs8WWLQsQ2o6lwvPkIuV23n9FQu4cdM1RivLLF1EsLnuQt+0N6DWEbXA9qKtIxbhizgbD36P/ILXYC9Ni1Adi8sOyf0XQjyzQLT3kYC490fH1Rnb7I12jHvZqPmpQ5XVsNf0NMY7M12HrzCNddYK3qaRVR9eioODEhLx/IXNmRmmqrZh0Mzn6AyKpNZuo2srZ8uqXojDPNm8OM6OXpQ9A+oQrjHN6CAgnNFE/UFKJbG6QnkfJW+439Nn9GGdJGZLW1aqTjGmDE8UjZEiUEUhyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JGLv30OOCbTB0YDyOPiaHNtOUIV8EDXaxfC6+7y258=;
 b=NCPxJt4znjJxRmpUX8PYQ0dAwo528u4jMuVEi2Vyxz0TGHkr3gHLn0Z3IySt/zppBB4TwbTDxKgPs+0vTLA/EIjcCdCeVYR16BcbUOSpLUGEVpPnKwKhTG7c8ptqo9VM2yKPmHn97s+5ILHs9ItHrYP6IxUsbNf3KCDNczs79o4cB5u2qj/4C0DwBQgrqTlbPe/jq07NgoQatKyrGRTMcRyncEAvU9JkbSd1JLfpqyy2R12u0eiFdqDsAQp11QrQrnuwltK3gwtNXrvUdIAPA2W1vhLwlJfr0jO4DyL0afgOE44Bi/Xoy59FrW4QHqtGsuX2tBKyGPsfGyF08gcM+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6716.namprd11.prod.outlook.com (2603:10b6:303:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Thu, 11 Apr
 2024 02:56:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 02:56:19 +0000
Date: Thu, 11 Apr 2024 02:55:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 31/31] drm/xe/svm: Migration from sram to vram for system
 allocator
Message-ID: <ZhdREN0UWjNV0TXG@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-32-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240409201742.3042626-32-oak.zeng@intel.com>
X-ClientProxiedBy: SJ0PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6716:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TVXlxxw6s3Sw/WoEwx4sNqhhCiq2MdWj8Ctd4+n+SxBWCRfhRnOoBEnQN+0WkOkwqNCIht8WAC6nB7tqS3q3RDrkSD/+Lu1lbFwLOpHAYyuSQT7HOltt1WwDXlLfxjb44KoSRHCf0TxO72SVrwLy7lwZwnvnEoXqg6r/41WRmwhUBnMDDEDj1eauMtjL7KsF3AarP2uoPhlbKAcLN5gY8rqq+md1+Nduz8zL8evl3C8UsxbCMSoTMf5aZQITJNy1ZtCGRnKiJrqXh6ZWszyhETRfOpmpjeH9bq0EYhZhcgh7ynKFv2U2sgP1e2Lw06xsogI3GQ4q6jH+QqwF/JJUasntGDu6/fmNN6ICkkl6NjMAhq4JMopse6B/P57Fn6PLovKGxZlTGXDmcpLdSXerDeLxeKWar/dZh6fSq1SOWw9kvBunxCcyvyfVuTZ4dm5fiRci98kyQH1OrFlCR8iqBQ1tWnE0xOgZ/rcwFejgMRpeTlKeEixtkQqPDIMjAwRYKPxdj/Xx0p7J2g38oJZJUaphl3LOIwz9JyjPbW9XxEB3BjOPCDTuw+Q3ak1FCFVxsBQPcCTc5qAds0QSJ4e2HbuQtQl+ECRBbLirmqg2ihI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CPNHaH46dTSVQJsFf3iy6YULbqe3wr94ZOnhpc7edFh+17n4Rqzw3in/8lHd?=
 =?us-ascii?Q?W1mQEXy8u2oBIS5pi4LxCyqJJX+hUmw0JKEX9p+yLh5zfw/T3sHCzZNOww8V?=
 =?us-ascii?Q?K1+coWgMBJ3NlbqQn92TDjTdMLPxTEQAGhEqk0du8X1GcBBpkHmJMRj79MDF?=
 =?us-ascii?Q?puYNujZNt5FtHmij1mW7nMGDBnKZZmxE6rOB17AKCPw3EUnt/tfjFqsP2QzE?=
 =?us-ascii?Q?Oc3HD6FEXWBWbWTt8J7UwaSiygvoVqCTEjc5brZCc/siVQce7FyeWezmV5VL?=
 =?us-ascii?Q?mIe/Vdm4ZkKaO0jm6q+/xHaxueXctO/IFc3KFnsgMsl0jC1CvM9iGvfp0Leh?=
 =?us-ascii?Q?tfKggA2oKcnjr2KVkADxExzvIP7iSYuAzQEJySsrPlDfYBNo2X+TvSmjQZ+O?=
 =?us-ascii?Q?uBP1oLV4w/8VERh09bSOEGR4MsOxfxFp6Tk7ouZqMBENVhwCSC4Mq+pji3au?=
 =?us-ascii?Q?shJgTawblbrxYiPLzoiZiBR+bB+WNktmzz99d1qC0MoVRRecNtK6Ig/dY2Sl?=
 =?us-ascii?Q?rWkhouz3LDeIXNqIJqq0esWOkeB+4ayb+aL5mHAIjl84Ri4Ypa8u4HRb5R5u?=
 =?us-ascii?Q?nG56hvQIQ5fj6qAGUZdnBWWH9H7jTU6sdiU3tec2e302KZ68G4tqkYobY7VF?=
 =?us-ascii?Q?pu/SzKQuwDVtvninFDBkLiz0UzFjCrWzG66dyKoNDCmqtmfcHK1WxzYvlXas?=
 =?us-ascii?Q?l5YJXP6JbXhWrv+Pdk+6fL1d89S+bCZnOFLw+nqP9U40zRLS1Z1ppneZZpmL?=
 =?us-ascii?Q?Ql5yMisCMgL7l1o+p1FpMe6XxW4d53aDAC1J9A6iRZmb/xZBwPcjwSIMVuhi?=
 =?us-ascii?Q?U4dMHt/a/z/LjioU5cRl9L2oW+5dd6mRDgRCRjNo5h7U9uSBt0zBkasK2WWb?=
 =?us-ascii?Q?+Fg1FHiUYZCKeSGJSEG2o9HykASg94aNFoN8bEu/vEFq3mVB5rJrUhKCPCXg?=
 =?us-ascii?Q?22YKbT/ljHekRbszRFHREW5f/G0ka+I2qsaKzRfd0UatGLQNs4ZrU69EaGC7?=
 =?us-ascii?Q?qGrfFPIQM75Z7i669/iH1kpHyKEpav5DPPEjV/h01YOrP2WowhQkxUwEPI4b?=
 =?us-ascii?Q?fNhP5YqYDvptkoSA2i+YrNNerVnP+W5ATvWepawLYy5OyLnSV50VKAAM371y?=
 =?us-ascii?Q?O8LrcnMYxs7GGsCQMr4g3ugKfSPNhpvdqBtDSuOUOjWWjztoHOMXjFC+7KpN?=
 =?us-ascii?Q?M35TF4PsAOO2NwtOKrzAwVj2FxNlowSv6AI8agZjjnxQuEUuRdmbUNGgkFHd?=
 =?us-ascii?Q?Tgag9QWQlZp90HD8m8p60X6mU4IpXyIIl4kk+TDDzRN9NU7D3z+wYj06NZ/l?=
 =?us-ascii?Q?Ihe6N+dqOibk5tRw3EJR3q2GBus5PU8wio9uFhrHkc2VnG0O5WobsznYG5hW?=
 =?us-ascii?Q?5LuwZxdYpQ2vUCJSmtf1OZjkCH3okJJ+nxJqUexLb4kEz3eMSMA1SqlHa30i?=
 =?us-ascii?Q?1/0ZsMZNV+A02wEDk938+ZmifQoGa4IS7m2w8z2NFovkC4f2mpC6i+QOEOgK?=
 =?us-ascii?Q?Z0sFwXOcG8LkEDhvtEvp/2F7hUiLaN18LSZwP+bPtETUbjcQhjPh1ygW/iyQ?=
 =?us-ascii?Q?jKTekBv9gA1tMyBgu73F8RuYzdYZnkzHFuOoLyvmo9OlrjrPKbnhuuxXphTx?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ebd4bf7-aad8-47d7-69f3-08dc59d2f6b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 02:56:19.8344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZkOxIX6Culn8ID0KAvWMlsArgFFNaLEm3ffwvzUfTdGNYtbwVG1AQxuuZbmHz5azBHR+TbWk63si9mhPB5vd1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6716
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

On Tue, Apr 09, 2024 at 04:17:42PM -0400, Oak Zeng wrote:
> If applicable, migrate a vma from sram to vram for system allocator.
> Traditional userptr is not migrated. Only userptr created during
> fault (aka userptr splitted from system allocator vma) can be
> migrated.
> 
> FIXME: The migration should be conditional on user memory attributes
> setting. Add this logic when memory attributes are supported
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 9 ++++++++-
>  drivers/gpu/drm/xe/xe_vm.c           | 4 ----
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 668984f0769e..c6ba00049964 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -20,6 +20,7 @@
>  #include "xe_guc_ct.h"
>  #include "xe_migrate.h"
>  #include "xe_trace.h"
> +#include "xe_svm.h"
>  #include "xe_vm.h"
>  
>  struct pagefault {
> @@ -209,12 +210,18 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  
>  	if (xe_vma_is_userptr(vma) && write_locked) {
>  		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> +		struct xe_userptr *userptr = &uvma->userptr;
>  
>  		spin_lock(&vm->userptr.invalidated_lock);
> -		list_del_init(&uvma->userptr.invalidate_link);
> +		list_del_init(&userptr->invalidate_link);
>  		spin_unlock(&vm->userptr.invalidated_lock);
>  
> +		mmap_read_lock(userptr->notifier.mm);
> +		/**FIXME: Add migration policy here*/
> +		if (xe_vma_is_fault_userptr(vma))
> +			xe_svm_migrate_vma_to_vram(vm, vma, tile);

Agree we need a policy here...

See my comments about locking in [1] thinking if we migrate we likely
want to hold the mmap lock until at least the bind being issued to
prevent races with the CPU fault handler, at least initially. 

[1] https://patchwork.freedesktop.org/patch/588542/?series=132229&rev=1

>  		ret = xe_vma_userptr_pin_pages(uvma);
> +		mmap_read_unlock(userptr->notifier.mm);
>  		if (ret)
>  			goto unlock_vm;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 498b36469d00..8a58fe144a02 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -71,16 +71,12 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>  	struct xe_vma *vma = &uvma->vma;
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  	struct xe_device *xe = vm->xe;
> -	struct xe_userptr *userptr;
>  	int ret;
>  
>  	lockdep_assert_held(&vm->lock);
>  	xe_assert(xe, xe_vma_is_userptr(vma));
>  
> -	userptr = &uvma->userptr;
> -	mmap_read_lock(userptr->notifier.mm);
>  	ret = xe_userptr_populate_range(uvma);
> -	mmap_read_unlock(userptr->notifier.mm);

Now you won't have the lock here other callers of this function...
Probably need to have locked / unlocked version or arguments here.

Matt

>  
>  	return ret;
>  }
> -- 
> 2.26.3
> 
