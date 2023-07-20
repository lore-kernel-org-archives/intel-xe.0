Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48A7EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 15:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59FC10E15C;
	Thu, 20 Jul 2023 15:53:18 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED7B10E168
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 15:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689868397; x=1721404397;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Aknr+0krDHa9upUA6KXMfv8JKR3i8KZB7Ph4ie5S9hg=;
 b=XzXWJeFN54mpIaKVDo1lyufRm2YTFifv53RKw+WPu34EFnOklpGvw646
 ET/3d29HquAu9p7I3VAge1GKwX30RC78NraQ/wUl0XBEvocGN98sRBZln
 qkKyS8RPOVn6IwpyLC8Sqz2mPgK27v6yV/UhKUwAQ2kKDdEOQS4mWMkuw
 yt2cwm1JNQtkMzdtdOMOrOObUHBI6FaN+7vcsjmuff6C75CYWQG55RwvI
 4MHmi3p6mgJckqsqGisH/Usq3pedCTDxtlkDIuHCD9XPIpkmvuvS0KMP0
 VQuQ8/geCtP9BnPXHQLgPWY4LzsVwlR8ev1tYQv3oRmUnwg/0Uh8UYzL2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433001077"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="433001077"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 08:53:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="971070602"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="971070602"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 20 Jul 2023 08:53:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 08:53:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 08:53:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 08:53:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 08:53:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnKcIGbpNTY+yqfnbQ6SeoXkKj9CqFhX8STGIWX4s8DzRCY4exFEMuHRGDvANletDQ61VxeSgJeSyWHqWrFJxyo8RKRAWrXY2lgKMZ9TjD6ENviH/WXXIW+ipW4hkyJTlNfrXdnsGytSAovPrAK2UzQNPoBKxRkO7tr+1KCUb7v77TI+/0IOEqZH3pRNBmHEEbt3mvb2EQsiXF393DOxXmCLSJLowLmeFqbJwg+0rUuN9WFwu/7UGGjmmeq0rklXyV2ZB6U02hGoWNyNZ7BRZoNjt/kGJrE9oidxHVyeT4jG67CTy50Xm099Bbny1Z4kdUWpoDlvld6rF+20SBTFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xuAtIGEhPLwiZYpSVwvkTjAbjOl79V6wgUWw48N9iM=;
 b=fB4yqmmUEUbxeDt4Mx9WxMQ1nYhigQ5za10KwvrkC/dCvCo00EPA4mXPYeJ3056ADxUbTreeRjSZ/y4Tj1Z5cuw9efiPdqYdGkFFu6Ev2wTwKU/bKfLqtOJSrQ8psWD9bxh+iP1PMSCbBGM/mev6CIXlzkJiLpCcGJL1A5QVHw4WHrfAhpij10uCLK0j3GHkLYtYnfqfDCdnJNmbltaHc7h+uGIO7Vyg0tzw4p0pKUgp92jh6VSBzf73TAx/lUKsNBHXq0d0RmXmjwMmq46lx8RenYnnzTnSlsunXZsmGAbEcQ8HjJRtBvpMDQqdGuA2sH57eHnN4KEJpcTAHP6o5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5221.namprd11.prod.outlook.com (2603:10b6:208:310::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 15:53:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 15:53:14 +0000
Date: Thu, 20 Jul 2023 11:53:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLlYZgXxIu12rj91@intel.com>
References: <20230720041057.112903-1-matthew.brost@intel.com>
 <20230720041057.112903-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230720041057.112903-4-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR11CA0100.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::41) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5221:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d7926cc-5cd8-40f4-23e5-08db89396cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4MPyRPy6RGo6SIzKRtCwFuRBGpzLhlJgdr/CSEdFi2jGLI6S2q4Sd/KMwPImCBck1Id1Zn/vQSlHB5IrpBtlis/khgX4QIMkHJ7ygpmD5mWByPt99em1G0ParKvvYDtr24tuWLzpKHeZoo4dmuSgXw0e8iI7u2zx8KkGQH4qC6YcxXJy2W6sb4KXumUtdfzfd877YzoU7NFWIgSgtGlII6FZpgDKEY0VG5lL4qkIqXEl3xyOU6ZGCvvHSb3iOwwH6D6USfGNuKA8c7tl59LzditLwJaSdLmvYpWu7X5+O7Mgke04rxk3TTn554oBoBKe4tkp3QfOk9fJylayZbhxb7Vo1lezOWLEEOs3Tvl8Ct2OWX38iD0P/TBvNRpU7/Z1TSCDCI1BLOsbV4rwLizoi8/LXGR9YNd7gbw7Rm1teoegx4vysEoOC1bpnmzloilU1Xyg/5B3kXgj+RMizGWz0aUaj3SE4Q3fSIkadFJz3BxlDMihffz81X7J8zaVHJFBNSgeVAG+l15qkperckrW24iKYihdEg7USs7Evqz3otmhJGqqfVcMyGnwO48uLnzb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199021)(36756003)(86362001)(2906002)(4744005)(44832011)(186003)(83380400001)(26005)(6506007)(38100700002)(82960400001)(6486002)(6512007)(6666004)(37006003)(316002)(66556008)(66476007)(66946007)(6636002)(4326008)(2616005)(41300700001)(8676002)(8936002)(478600001)(5660300002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PVTaYYuyeuAkjFq3YHr7AF+65moU9PvnrXMVZ+ZwFE7WNE3smPoJW6cYVxIu?=
 =?us-ascii?Q?sHphK52/dftMZmTjAP+El9/jgjdYqnT4UIdOYRaa71bDoQHQIp3+04EkmJf9?=
 =?us-ascii?Q?uFzK7JO3xGRbFmLz8GfCmrciVBDFfAgheQDuwetHHCBGFZR739ls8bykoofO?=
 =?us-ascii?Q?sinnXqq0hkxJ+T2w+Ooo/59AGCB6UaKIbDBt8Gk1ZDtpg7cKTSxXTYKvQSNa?=
 =?us-ascii?Q?A33UL7yJ7fbwzatZzyc4eW6j3g79TBvONLb0XRWtuQoa/+RolqkAnWHhtR3T?=
 =?us-ascii?Q?Y2504lxvyrMSU6LmUisxDCtNsaNr7z6LUKuale3SyGAb8uC2vS3HO0cxJlj/?=
 =?us-ascii?Q?xqdWJ+fPC8k8Oq2uoQWAr4d1adMU8ezkbwza/mn3IXzZCogSXPi+RKUWD4WE?=
 =?us-ascii?Q?ycR9clWul2SbDuXenSxYP4TqkVNWLsMOdF3wvt/0Lo4GRqqCwp+HFGNrZzTY?=
 =?us-ascii?Q?HAFSwpTcat93GJgKT4yhAi1jCVqUtJcTDjNDwygGTGkl9nIRixGiVncWf2CY?=
 =?us-ascii?Q?vN1eCxrnVKrOepeyRKRh73AQr0SwYfkBHEIT2L7EvbqKQn1IV8AVnyd26zWt?=
 =?us-ascii?Q?uIawdq6yOmKAg1pEMo6a/G0MR4asnM4n5ep2nrPTpniD3o8cXecBL/jgTMOi?=
 =?us-ascii?Q?b1jDwqdtyiyDvAaitULPQ6tzNyIEhV6DInz8/fqjUMJKCe3UZYu6rAp2knmI?=
 =?us-ascii?Q?xxozZwVYh84nGdtgnH8eMWHVYBKIHEQ+/q6OoCmLBWMhqlYnboVqitDExclh?=
 =?us-ascii?Q?fD1nKoIikyzXqsa2xYzAGh/+AyWxAdRHYwnyZ1HS9BUEF5pjFwJPbk9C4I5u?=
 =?us-ascii?Q?po4itmLcNuZN+jZ8Ru8scPTJ8J6OsgLER+e2X3fXBbWcWGxbCPf+03bKHOVx?=
 =?us-ascii?Q?sQX6RqO3IkCA7XZo2cjfzMhrH4pC+ExgvCiB08KjjFGON3X1ukgOrMF3ni7K?=
 =?us-ascii?Q?d5g6sNRpgSKqvxBRyY9eBiXCh6O5Sa/GCqWa+vG1ab7ahW0pzRFVN+WbYX+y?=
 =?us-ascii?Q?ZsJpYGgLXh2QnplCw7gP1wJNHav+qgWskVI3YrTLzUxM7rfqpBt04HV8LXR6?=
 =?us-ascii?Q?XMW8sLiQHHnFGoIeMe/afaoxGWO+dqM+U8sb+oG6WMAwJ757rgvBhFj8REPD?=
 =?us-ascii?Q?TL4M3ODM31V7VM+rSgGGSDkrlcOXkIGrjYu9pO5lA3vdq8awmPOnOHtJSjDy?=
 =?us-ascii?Q?BnqTOwSpFxGNLdVFIuFIyFHGrbJXVf6iatMOKga2+TRSv4vPc1u0J+IFL4Gv?=
 =?us-ascii?Q?EwLOrj7rgvWYKihtVitRjIDHtGUE7R94R+i8jW9C5v5H41+FbErH72bcZWV4?=
 =?us-ascii?Q?u+wF79YRpBrn6mty9ojPoFEaZz1+FWi1d9eVErgn6CrIw9yZLmxDPGJzJbCk?=
 =?us-ascii?Q?+42iERnXnhPNCp1GZuk3HL3hHQA60xhqzw8tKVBMcIPpMUxYyMrTK2yD5xYP?=
 =?us-ascii?Q?MZQw2F8e/ybSC+XK8WchbbImi+YzHM1u/gxnaRKHfmud9sCT8twlUwsjZQa1?=
 =?us-ascii?Q?1T5XYNFvPhBF11dH5GHl3UrXEfhvHnFGkIYzMOrjisDAVNRnmJY8JfZMf0wb?=
 =?us-ascii?Q?9kshya8M9h7Ty46G2Izy17+tKwZ14S80BEQDKJlgW3Jujls4mauy1N00FS3s?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7926cc-5cd8-40f4-23e5-08db89396cf5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 15:53:14.1641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1bD3uUUAqnocx6mMXI3UQ29GAs5ZaTggwbYTgvpVQlAQ5qT/0aBWEWgE52rpRgRIgyTdd0aRicpGwI7XuQyHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5221
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/6] drm/xe: Replace list_del_init with
 list_del for userptr.invalidate_link cleanup
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

On Wed, Jul 19, 2023 at 09:10:54PM -0700, Matthew Brost wrote:
> This list isn't used again, list_del is the proper call.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 87faf4b723b3..1ed3bc2541f2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1065,7 +1065,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
>  
>  		spin_lock(&vm->userptr.invalidated_lock);
> -		list_del_init(&vma->userptr.invalidate_link);
> +		list_del(&vma->userptr.invalidate_link);
>  		spin_unlock(&vm->userptr.invalidated_lock);
>  	} else if (!xe_vma_is_null(vma)) {
>  		xe_bo_assert_held(xe_vma_bo(vma));
> -- 
> 2.34.1
> 
