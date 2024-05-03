Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE901C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 12:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7582510E496;
	Fri,  3 May 2024 12:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yna9tNUG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1391F10E496
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 12:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714740791; x=1746276791;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ge9WPRp8M374HqVVmPvQHe0q5mWG/z8q72U2GQHOUoI=;
 b=Yna9tNUGOxPsWr4OJuf/T+5Vg0YIk8mW3u4E6hAoOgvdQk4v698x12c+
 mCLJw+rKQHj2DwdJblsr77nHxWq/uM9xQ6/bOqK7HPcQXlSLyZsFrG9ym
 9gbjPhnYdDdfAN/8XuVyoEROti1QTdImjwSbhCAR9HKZJHTjANMzDuDKl
 jyBTuA4H+hvW7cyxhZ/OCyrEhjK9Uwol1OSrdqUn5VpjGDIz0McxSWzoI
 o5vZftkvQ5Fg8n7E5I8bFuKuPLgaXX9bHPHxX8/GsrYYvyidVpqaVj8bx
 C2ksWDpzWjGIeFsMsrAGBdj10yRSItaurftgagrEr5NM0CqtyLsaWLudn w==;
X-CSE-ConnectionGUID: CbkluAnUTkmkRBsu6PCmfg==
X-CSE-MsgGUID: U3/L9ydwS52J3s2OXeNi3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="35936639"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="35936639"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 05:53:10 -0700
X-CSE-ConnectionGUID: yzikEi8YQV2g0T8LnmTMAQ==
X-CSE-MsgGUID: QDWp+aVBQca3/ZBYYdrRVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="64896688"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 05:53:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 05:53:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 05:53:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 05:53:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifZ4KSGcjEs+iJwfOJM7c2YP8XR71yKJwAcf4HbhpItrijQeALoJvBHVnaohp4/KKeh33HEAe4qIGpjICO280fdsxVAdtY8xSAj1+ziGfy6EhK98aaGQDgQe5f1heqlT5MXmzAn2rN/n4wL7CzgoInhykEkykZFkGUPlYcnGRz526yj1EkaBZIaPUsOHC+BDetiXliO9DgFXhOnpKu3W+GzkRYJEGGQhUA8Y7rcdq90bDzkQ9q6BBbfKyBUvnuqruASeMPAwVaBpapMwX9aGZEZthf8J45r7LbgrXUQKqpkeLZOJAjJh0SGCWxyZbRxJ6VByiAPAf3hzoAkGBo7h/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zHHpxLHgNOC9WQ2Ii0LGLXcF+t4vXv/STiVlILW6MI=;
 b=XyMlg4vXI0Nf+lp2dTFGmeR5/le0RB80ZE7RCx1qCV+AslZV0bORtYaXi9Hi4LNG9mHIVi53XwPvNDcoLg7vz9il6++TdIcVr8AKlIruK5vqXY3ctkP6uqze35iYOqWbN5I9kz2Q/gBTsINsHtebTksRgivHWLOFYyuXaOWtGNxOqd5qcbyytXK3og1p1hgbAaL1AFwvPLPIHE0WQVzDinI2SdCetZXjVNstoDfC1fgJc7BZanCYEb9a2JLFddhNjARs2ymBmbIJS+nknwhAGTO2hhRmMwTh4zlnIVC1TJnl+cjzClvarcrE17wHbZSXQM9HehHdatxLzL1axmw4ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB8223.namprd11.prod.outlook.com (2603:10b6:208:450::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Fri, 3 May
 2024 12:53:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 12:53:07 +0000
Date: Fri, 3 May 2024 08:53:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/debugfs: Get a runtime_pm reference when setting
 wedged mode
Message-ID: <ZjTeLtipOHfJEB2G@intel.com>
References: <20240503082450.268335-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240503082450.268335-1-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB8223:EE_
X-MS-Office365-Filtering-Correlation-Id: 301dde2d-2cc7-4c41-ca42-08dc6b6ffac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JiJmEnHmbjRtgra8J8F0qp6xGl1mQpsxyk/VRpLg1HbwP9zkiB+igsV6zK4m?=
 =?us-ascii?Q?egtvBJAKFq50JVbqo3RiGCtnf/m98sLB5AUktz/5KXInFSEs87IrRA7rn4LS?=
 =?us-ascii?Q?ou45r8hRx/WFgoung/jEYeKoCnNUwtEAJrpkHARbI6QPKcJA0OPqbJGTKthT?=
 =?us-ascii?Q?TZ5p8tYcDZ0LaWZBptEtCTvdUgjTsJoce+pR2tj3svzdYEeoVvTlRUZp1c9k?=
 =?us-ascii?Q?XovhrKxzp7wEmTn9Nsjhl7Z4rS4v1p7MwLrgmU/RFZdcKPR//bWQeMPePMV5?=
 =?us-ascii?Q?404GJYunJ4GoGZ/JmB9463+wxz7WuuoR/Fqeq5GuZF/zryqYbrggjoco994g?=
 =?us-ascii?Q?rnCHOeZCyEsJE/uxpvxziRmCMsK2hlrF+yHjZ0aJYcobu0wwwXmi3mrX090O?=
 =?us-ascii?Q?7Rhj9wt0Pk7wtgP+ehC3mTBBHawZHKqdheESw5+T8/VvcJr2M0YrD46pmvb7?=
 =?us-ascii?Q?Edz36RsQ1wNJ5BA9xDNF2jWdOTTSz5wpL8rHvAJc6QrGGq/4QeV/Go9veeXz?=
 =?us-ascii?Q?cKLFnTsW9xERHK//7t8y0RpZdGxA+1tBtz2vEVtXT5fdQzdXKoBQEjfRKdso?=
 =?us-ascii?Q?Zu2yl6oQDKAZKZ6ykwhSwTEEV/3HNJ8RMgLk/vKNJByaIaSle3ex12TY3cqh?=
 =?us-ascii?Q?zmTvYg25S2OXKy6EBSzfUybEbBrOBS+NeECAi9tzJ5bjaJnAMM1n1E1EXV+I?=
 =?us-ascii?Q?Fgapi6RhhMhZXSmYr1KWSaBOBpEYBYWc15iIQT5pd/wLScwk5z4uuZyV5sdz?=
 =?us-ascii?Q?P4Fx3pGLbrAy7AE+nycgqzt1vANatCL2T5LdIKlUGYWZT/dUtoMRdqyUbwZZ?=
 =?us-ascii?Q?3cfWzCZhNuxxTpOeeUnR5bp9LPZstUwzhtUuAK5jKtH0+mVCQhhrWjIhYqFP?=
 =?us-ascii?Q?z6marmsKTaBNKjT+vhq7LwQXlwtt3s+XAgHMfvWl0gwd5c6Bp+sAWPLVSYe7?=
 =?us-ascii?Q?2B6jbOTLK4XZsoU1M+coYllWLEOi8LKO+iwi1XRHhRDw3/GEK9KkxypsC4/r?=
 =?us-ascii?Q?Z15lRThgTQtpE8XI9ex03u4yANFp/HEey+5zNf3KLpa6fJk7/D+hHcunwpQy?=
 =?us-ascii?Q?5suLCkqY3PzVeTFmV4bwcPNRIkA8jNpnUDD3JxkOjhd/BpN62gVeLagYuepI?=
 =?us-ascii?Q?90Dv2lkGGzHMsM57AlKxKVceVY/MjrZWU3lgQGjbgslgr3T7YSuePrsnk850?=
 =?us-ascii?Q?UGWxOP8FxslTLiRcX4AtBOeS954TqeG2FDe60SBZzlY8NtGPYa81E81BGH/d?=
 =?us-ascii?Q?Ji+9JuYo2cabdrVSEw/ROJV0jQzOSOYY8TcN2ZMbJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aGdr6dtcCYSKgwgDAV5VtPbPL24SDiRRX3VY3iQCSlYQzqCnzSnIhKxPytAx?=
 =?us-ascii?Q?WlYo5XgV2d/sEc5oEpm2TcVEMLWUmS5ADZ4G6qJ7Vn8DWKMPqo5l3I5UDT7G?=
 =?us-ascii?Q?qTaGD3sY4xHvI9htdQy6gQ+V0IoCdQ9Y/Nh70iT2Ja4ZTzyOH+a1wbQ8qjhh?=
 =?us-ascii?Q?VKRwt4BopavgaEcQMYey8AfjjlAveD5FZhk9qoVANk1w8RWjILw2qOZo0Z/a?=
 =?us-ascii?Q?cXPCGEexHOSbxPW9XPmS+DKFwIFD+QI8ECf6DxHNsiEYpbU4Snsx5WE2rtts?=
 =?us-ascii?Q?/lQ6yT6HKi6kJBLrXtTluzwbtq3e7iae+PBge3NPEqq7znWYZiE6AXHuB9ka?=
 =?us-ascii?Q?1JU2mTIiy2UyM+BHxaPgo3lvuUbcIBATGCR+9yvC8G3Vt8txdbLNS28q6OIU?=
 =?us-ascii?Q?MxA4ihrbSxFY8Tw8vdJ18ltPLrF6RAmBfKnHDWXCsv/z5nkqA+jFNVMUvHHH?=
 =?us-ascii?Q?LfWSG4DE5AHvht4ZeI4JKKo558xHeuGDrD89ZXvKAZIC5LDao7D4nKnFdPrP?=
 =?us-ascii?Q?yXxcdWb0hfTqjT6VnAjRQXG28dsKQ18pf6cvK5wdPsXbswX1tbWsJos2XZV9?=
 =?us-ascii?Q?8NvJ9Epdg7n2MtkhN4P7aVzd9jKVLniFzj5fbno3kJHGbMeID5wkp2czCfYG?=
 =?us-ascii?Q?A3N9T5hTr25iz+8RnGqEaq4ZzRMFZiqh0C2m4eIAVAJeTRylfAR0WKT0hPL2?=
 =?us-ascii?Q?97HdH9c9TOauUYi5yYR5JINQ98hSAYIfOMebmxzQks5CgzSKIE7NS/h7nqTC?=
 =?us-ascii?Q?4XSUkQN65lj44UPHCzdKsTW8DTo2dXjLEdoXFHZXwfLoXHP9GnMDa+6AKJfU?=
 =?us-ascii?Q?8ilb6maffFZ1/kmUsJZ/q23xncSAIJ7pEWD8vGpketEE+88M2PxGLbmg6AZI?=
 =?us-ascii?Q?ICBNLJsiZLjig6SVG2v7ifwss1vkKGx3MrahIzZ6u2ZF9DBfQnzh4lWLoCGt?=
 =?us-ascii?Q?d6+lztV5dUJuj3EyU8PKJi2G55vE4BZzMSpqPU7vfA5sPfnzu6JXlOr7bAFM?=
 =?us-ascii?Q?RXFZUCMjn/d+0fsdERJLgu9ElxwRyBHhlbG+yvgmAcG5HGKUOwtGLfF/Ixzx?=
 =?us-ascii?Q?r6uZlDd2jQAd81Q17qrK1MHWHZVNmUeOFPrtuUcwMwerffimGO7UERNcg0pL?=
 =?us-ascii?Q?QmLlcTd4iDHiHqzoR39WpkkTFMcEH85l8daA7bn84QEBr2CP/5062ib9hZjm?=
 =?us-ascii?Q?w2N/j5DEppE0ng+vBFw/uZFHHET1BGm00ZYQ9DRGJCXipLhO8NSNO9fkssTz?=
 =?us-ascii?Q?dEyTccQvtg1cb9TqKM2KnKe2qCv/SOhuv/+XoHSJzXuthcZ55adYlisrjjVL?=
 =?us-ascii?Q?sOtvV3MOGByaPWdzIhXXKbpTT7BQwnkaEdXva8apMFQfMs4YzhBKwBSrhC4r?=
 =?us-ascii?Q?gsop5XgqTaZY23pGJ2mAkgzi8FMZGA0HHMVEr36STfKBeo85HfabhMOmkh0h?=
 =?us-ascii?Q?0GZgJJx4Z2mUjva8oCPlTjwv8kNT8znu5YEafU+AKYrlCy2FChqXh93yll7s?=
 =?us-ascii?Q?mAR49W2tppQJi4rRAqJiN81i2BjJrLXE3/bIUTW7LLdLgsy/VQDpHyyGNG2F?=
 =?us-ascii?Q?MDEYyT5aQOVxXBvjMRfnbcbmfstl5UrCzfAQxJnf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 301dde2d-2cc7-4c41-ca42-08dc6b6ffac3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 12:53:07.5137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inYYmwqHTb3gy61PlMVThcTfeX7GVruSHRIqIHLQKG5Fg+3JiE8NrrONFfZNylKLLaHkw9VyqbSNQjdq5EtI0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8223
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

On Fri, May 03, 2024 at 10:24:50AM +0200, Francois Dugast wrote:
> This function is another entry point where it must be ensured that
> the device resumes before operating on the GuC, so grab a runtime_pm
> reference. This fixes inner xe_pm_runtime_get_noresume calls which
> were previously failing.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 0e61fa462c7b..96920f7b2371 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -152,6 +152,7 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  
>  	xe->wedged.mode = wedged_mode;
>  
> +	xe_pm_runtime_get(xe);
>  	for_each_gt(gt, xe, id) {
>  		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
>  		if (ret) {
> @@ -159,6 +160,7 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  			return -EIO;
>  		}
>  	}
> +	xe_pm_runtime_put(xe);
>  
>  	return size;
>  }
> -- 
> 2.43.0
> 
