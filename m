Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A901EC54FB9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 21:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCEA10E795;
	Fri, 17 Nov 2023 21:33:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2FE10E795
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 21:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700256795; x=1731792795;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1TSjHGUIX2W+1m2Wm0mmrxgp4mbzwq+DF1a+1DZTLqo=;
 b=fBVqE1ZZ6wMXvjy1zi9xaYcBrsEHsIPtVZqN5LqorrJ2wgD932JEdz7X
 tCDQq5pkA+dkxWlaXgNAXgp27OtrKZAIo+UD7ICupcVD07PNOfa3JsCDn
 FkxfiMC8ANbUXDyodn+ZUd5yFmutLNJVi0WOLj/CpzEjoetJF+8RGVf9r
 9bTc2CXqnEcPdLqN0dOg3sUozvLjtXae+F0Ym1ZFPs0iZpm3CZMWo0xKt
 Gt6mMaZikUX0PtvQa3GSsOE+R/Ihk4Lbowj50nOz8WrYioVacGu1U0k+1
 +jBRpahh7P3GyugebRKryAZcWlA8GJbZ8t443uFfPtm7OT6D745tdieTE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="10032289"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="10032289"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 13:33:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="715650713"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="715650713"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 13:33:14 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 13:33:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 13:33:13 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 13:33:13 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 13:33:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moDr6g74h6bs8hsqTLTMkupQGF0M5dbiZQVrgtf2EvrnbIh8Y9Kds+xgViBifbhbBrTOIy74045OLLcublEPv8dTjbqsGH7m8DCDCF2Sz0h0aHkwl3xNUOEDzWiMBIVvrRNdOBnm3VuQoxm/50jmJmsy1VATxTrGjapWbrXiRnRUSonoGaCH5BqC2C1PJJlV13VjmbxBEEFvZKV3MpehG1bNT87yivCVCb0eRTmK+bG+TQp5IM7LCwtll/RIpviACtgKAiWyA9G7J+Ix1yPyk8m71NgvINrR6jn7VvXv+IHvzvOHbU840soTjqzxKV83wGnKYKUkSTKipGdDPgBvMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/NMaWtQl0g7Nf+mgCsp1tBt1F8xNYDRDkGg+wpri3k=;
 b=FSdntI5Y3I7OX4p1VqC6Rv3/47TVem4cBwf+Mtfjz7TJLLTWzlQ6Kxjr77ky+6TSbILvClrXNB2JWa2wOxB8F/3Ib90xDMCvtcN/v81aZWuYn9QDKGcPW+3sgCQOu5NZYMyuNKMTQMJY/RinRx2gdUYtfNdosAUWeUQI0r/h7w0s/1nJwg9cJgqSVG+gF5317oNLWfsPDooVDF/gASkDmaFRFqYj1QMeWVbph9ELmAcJQRvmKKNSZ/lp0rtmNajyrUUDA+K3g0S/wCgZazeAxS9etaatv1OKLn6u3OZHYAl09AuXrXwYgnoi0OtbMk836KDYBAS46a5eMadIyQ/i1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6310.namprd11.prod.outlook.com (2603:10b6:8:a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 21:33:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 21:33:10 +0000
Date: Fri, 17 Nov 2023 16:33:06 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Message-ID: <ZVfcEpiH4QGOX7Gx@intel.com>
References: <20231115030111.770130-1-sujaritha.sundaresan@intel.com>
 <20231115030111.770130-2-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231115030111.770130-2-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: BY5PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:a03:180::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e1e3efb-f1fc-4a98-b026-08dbe7b4cbb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lu1bF56Fuaro3x3PcniFRZZFUWCpM2DwYuU/ccxydxI5FHr99FsMO4ME3twWZhK2r1QXgi9yPKKRpRbmrgIjLiXvULkXJETBfV/DWSsrLEPEOY1oe7hMsqsDGnDstCGr2qtQXoTpKdPF71yE88z0+zEUjA0gGUmYYWuZsWjJhuMU4yLm3/jcLbMCADzuVFV4RfubHcPViqjkOaes1BFghzSfZpxVwK8b6y9HdQtv2wGir2Deai3FnhJGgnd9Oe22RwhCfEAbpkvw8iVJwVHVG3AMmnA8yxZrpqQkjP5iJ3AAY3PVDJlQFFA6iW4uqom+6maw2GK2mjWoeRNk6pMPyhLAdXvGCCTSBwAE98C8qVgjR1reRzpS4mDss384NCIoAX14w65RTVQ4+hLrfKlg5C+qOH4bULEF9SCrNN8P5GWSc2kTKTuXnkrJgMr6yXJYv8gXnYe3PNWMD6Zwa39cVK+kUDKKS0iN5lf4D+l/js0zW56XYmQG3hfk2ZzzR4ViJhJrfSSZHzMTQQZK8n3/7ohBOaR5kvAknFBi5DU16rdzMKlyf5+0OJYq02TeOqdm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(366004)(346002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(82960400001)(38100700002)(5660300002)(44832011)(2906002)(4326008)(8936002)(6862004)(8676002)(86362001)(41300700001)(316002)(6636002)(2616005)(37006003)(66946007)(66476007)(66556008)(83380400001)(478600001)(26005)(6486002)(36756003)(6506007)(6666004)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?38DBwZ4m9/9oqA2z7QJ0cFgNIoENfOmAmQhAVKY294VBH1zqQEMhXcZMg2j5?=
 =?us-ascii?Q?phHOa01+tnWKAVOu7I4TKHUjz3XCd0OqLP09xUP6Hq3omD1feNwBwhCxFjoC?=
 =?us-ascii?Q?fXl6V0J88k5to/8CXXpI/uNXosj0uKySFg0gqJpmF/Hv/RzMLwq4quHgmlMm?=
 =?us-ascii?Q?nDyBi6GrYHJpXzw2O72Lglp8tMgGIMvT9iNl29rokbLBcQ5jBAsfKJjW0Xqn?=
 =?us-ascii?Q?g3rQEMykJ/WMpEvpNkSdT/ppjbczm7BnQXDtuyAiYbh7s+Z5FiGpfzMKS76B?=
 =?us-ascii?Q?9NCcI4M/meHqF6NEFbMdKkgYfMHbb3alg0aToD/t1Ws4D0yhYW7qnLuq07ij?=
 =?us-ascii?Q?cyzjqyGey8/UkVUmEjLg2Kvk9w0r23qiLaI1OJ1p9C5FeXDRQDkY5IImhfpp?=
 =?us-ascii?Q?9pTkKelix0RvvnFqRiXSyNi6A8Kf//5w7fmSpyTA3PYfGraaU+IcRPiyhECt?=
 =?us-ascii?Q?0vdqLUTxsJAHAdZZ9FmKBwyqpy1/XP7ItQBZBdBVjBtRIPmPR1M9sQRjn3O8?=
 =?us-ascii?Q?+oAKd6j/1egaPUFF4UNV1r03qRKP+9qbRBnpzm5vaZbC+mWXAcWHO3wVeSbQ?=
 =?us-ascii?Q?NDGMpZLe8wAiSJXkPKdyreu76FABJnZEHCaLaBsGZKkF9yrSOT7z2xfVKcFp?=
 =?us-ascii?Q?1v62yjOGLeHQJLy3nvJfYy4nqpOlBVHQiriklYKyutrSm/ut0jz/O2X5FZRQ?=
 =?us-ascii?Q?7V+P7DgticqfgaNpoLPvngMoXV/kinttCfMejoLJu4vqFwVa98gFwf8p7PXF?=
 =?us-ascii?Q?b+cocabPj2kPBHd2/fB32YAbY9xFiOvDwNC7CDcO1Z0dEYU/uBrnUxm9hXvT?=
 =?us-ascii?Q?z7M5LVoUyhoxB2zrSzpQy6AyS8MG8P4MLt9mKxLoGga6ao14AV+f5qw5Rxhr?=
 =?us-ascii?Q?4OvwWFw4cqaYVmro7KXDgnE1mfg/T401hJ66XZn9hFgFiOUm0jkv2+rWgGqM?=
 =?us-ascii?Q?Pj3nC/a8w21N0mF7ldEudlZpKSSz/Uhd3jiXpoDiy/znOq5JzH85rO2oEwED?=
 =?us-ascii?Q?g2aLByPgbRtWLfxw11u/fhfpHQiXNRO0EbVE+7Rq419LW/64NZWW60yBy4TF?=
 =?us-ascii?Q?XWirB0IFGYsbtdk9qCS/AkNpX8LAwu6+u6kqILu8DH0zaU9mPpakI//0RnlP?=
 =?us-ascii?Q?eoYG0R8FU6HrOV19U8DZgpL2uEoXSFwoZoILwrh+RA+BeIhBsSRWYl4ESUV2?=
 =?us-ascii?Q?rQWG+l1y02ersIMZZZYoOCupYh2IakZKANyDKfISvJoG/X02UMgAE945iWvC?=
 =?us-ascii?Q?3Z7X7MGHmamasUGyvahRUcpn8gUZLtBqlt3ll9UpzVoNzQ5nJ/8jHw3oQa17?=
 =?us-ascii?Q?gIiRQvSJ+UmF6dBfeE9281bx+luOmGeT1VhO5jHjKliBO47W7HMqkHZLePJ9?=
 =?us-ascii?Q?44uzFQBVAuZ0K5sev1Epy9N4wEQijzrxrmCRVQI7tidoG+Itu7gPReSAD0g2?=
 =?us-ascii?Q?WWRYOr+rJLxiX/qzik/EQRdx+DJNP2NRhp5eadcAcJJ0RBgzESIWFVJJWccf?=
 =?us-ascii?Q?RqbU8m0wsuCDemN6ODlD61k6o8f1jJoet1F2HxI0npjE/DVToku89FkQxbxe?=
 =?us-ascii?Q?f/qmsyB6Q6+ONlUp3Wg5IeeUD3sure0/Qf/kZHbvX6T/JZIgvy9aGm9eqstY?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1e3efb-f1fc-4a98-b026-08dbe7b4cbb4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 21:33:10.2976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YdQ4vrsFwXUrgyxuIh/EASQ/+MhwvF0E0rnncYXk5MHOQ1/a2aa+35d2ZgVJUxJjTf3AdwZpfNyz0H+IbOA9GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6310
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: Moving and renaming existing
 frequency sysfs attributes
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

On Wed, Nov 15, 2023 at 08:31:11AM +0530, Sujaritha Sundaresan wrote:
> Creating a new freq directory to move frequency sysfs attributes.
> Additonally, renaming the frequency sysfs to align with devfreq
> requirements.
> 
> /device/tile<n>/gt<n>/freq
> 			|- act_freq
> 			|- cur_freq
> 			|- max_freq
> 			|- min_freq
> 			|- rp0_freq
> 			|- rpn_freq
> 			|- rpe_freq
> 

on top of this we should become future proof by having a possibility of
N freq directory for different domains/PLLs.

/device/tile<n>/gt<n>/freq<n>

under each freq dir a file 'name' that would contain the differentiator
name. probably useful already on PVC with media freq, although there
we could only read the act_freq.

But this patch is great. Thanks for taking care of this!

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 65 ++++++++++++++++++----------------
>  1 file changed, 34 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index f4ac76d6b2dd..5d64cd041db2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -57,15 +57,15 @@
>   * Xe's GuC PC provides a sysfs API for frequency management:
>   *
>   * device/gt#/freq_* *read-only* files:
> - * - freq_act: The actual resolved frequency decided by PCODE.
> - * - freq_cur: The current one requested by GuC PC to the Hardware.
> - * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
> - * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
> - * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
> + * - act_freq: The actual resolved frequency decided by PCODE.
> + * - cur_freq: The current one requested by GuC PC to the Hardware.
> + * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
> + * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
> + * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
>   *
>   * device/gt#/freq_* *read-write* files:
> - * - freq_min: GuC PC min request.
> - * - freq_max: GuC PC max request.
> + * - min_freq: GuC PC min request.
> + * - max_freq: GuC PC max request.
>   *             If max <= min, then freq_min becomes a fixed frequency request.
>   *
>   * Render-C States:
> @@ -385,7 +385,7 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>  	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>  }
>  
> -static ssize_t freq_act_show(struct device *dev,
> +static ssize_t act_freq_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
>  {
>  	struct kobject *kobj = &dev->kobj;
> @@ -410,9 +410,9 @@ static ssize_t freq_act_show(struct device *dev,
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	return ret;
>  }
> -static DEVICE_ATTR_RO(freq_act);
> +static DEVICE_ATTR_RO(act_freq);
>  
> -static ssize_t freq_cur_show(struct device *dev,
> +static ssize_t cur_freq_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
>  {
>  	struct kobject *kobj = &dev->kobj;
> @@ -439,18 +439,18 @@ static ssize_t freq_cur_show(struct device *dev,
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	return ret;
>  }
> -static DEVICE_ATTR_RO(freq_cur);
> +static DEVICE_ATTR_RO(cur_freq);
>  
> -static ssize_t freq_rp0_show(struct device *dev,
> +static ssize_t rp0_freq_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
>  {
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
>  
>  	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
>  }
> -static DEVICE_ATTR_RO(freq_rp0);
> +static DEVICE_ATTR_RO(rp0_freq);
>  
> -static ssize_t freq_rpe_show(struct device *dev,
> +static ssize_t rpe_freq_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
>  {
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -462,18 +462,18 @@ static ssize_t freq_rpe_show(struct device *dev,
>  	xe_device_mem_access_put(xe);
>  	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
>  }
> -static DEVICE_ATTR_RO(freq_rpe);
> +static DEVICE_ATTR_RO(rpe_freq);
>  
> -static ssize_t freq_rpn_show(struct device *dev,
> +static ssize_t rpn_freq_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
>  {
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
>  
>  	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
>  }
> -static DEVICE_ATTR_RO(freq_rpn);
> +static DEVICE_ATTR_RO(rpn_freq);
>  
> -static ssize_t freq_min_show(struct device *dev,
> +static ssize_t min_freq_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
>  {
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -510,7 +510,7 @@ static ssize_t freq_min_show(struct device *dev,
>  	return ret;
>  }
>  
> -static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
> +static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
>  			      const char *buff, size_t count)
>  {
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -540,9 +540,9 @@ static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
>  	xe_device_mem_access_put(pc_to_xe(pc));
>  	return ret ?: count;
>  }
> -static DEVICE_ATTR_RW(freq_min);
> +static DEVICE_ATTR_RW(min_freq);
>  
> -static ssize_t freq_max_show(struct device *dev,
> +static ssize_t max_freq_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
>  {
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -568,7 +568,7 @@ static ssize_t freq_max_show(struct device *dev,
>  	return ret;
>  }
>  
> -static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
> +static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
>  			      const char *buff, size_t count)
>  {
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -598,7 +598,7 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>  	xe_device_mem_access_put(pc_to_xe(pc));
>  	return ret ?: count;
>  }
> -static DEVICE_ATTR_RW(freq_max);
> +static DEVICE_ATTR_RW(max_freq);
>  
>  /**
>   * xe_guc_pc_c_status - get the current GT C state
> @@ -664,13 +664,13 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
>  }
>  
>  static const struct attribute *pc_attrs[] = {
> -	&dev_attr_freq_act.attr,
> -	&dev_attr_freq_cur.attr,
> -	&dev_attr_freq_rp0.attr,
> -	&dev_attr_freq_rpe.attr,
> -	&dev_attr_freq_rpn.attr,
> -	&dev_attr_freq_min.attr,
> -	&dev_attr_freq_max.attr,
> +	&dev_attr_act_freq.attr,
> +	&dev_attr_cur_freq.attr,
> +	&dev_attr_rp0_freq.attr,
> +	&dev_attr_rpe_freq.attr,
> +	&dev_attr_rpn_freq.attr,
> +	&dev_attr_min_freq.attr,
> +	&dev_attr_max_freq.attr,
>  	NULL
>  };
>  
> @@ -950,6 +950,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_bo *bo;
> +	struct kobject *kobj;
>  	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
>  	int err;
>  
> @@ -965,7 +966,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  
>  	pc->bo = bo;
>  
> -	err = sysfs_create_files(gt->sysfs, pc_attrs);
> +	kobj = kobject_create_and_add("freq", gt->sysfs);
> +
> +	err = sysfs_create_files(kobj, pc_attrs);
>  	if (err)
>  		return err;
>  
> -- 
> 2.25.1
> 
