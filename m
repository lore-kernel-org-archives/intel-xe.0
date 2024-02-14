Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8516EC48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 18:57:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2B710E6C1;
	Wed, 14 Feb 2024 18:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkoaNEfH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D347E10E7E6
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 18:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707937033; x=1739473033;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1/MXm75EaWxgkH+Z4sVoXV3cmRVfz1HgIfUbtnbH5QE=;
 b=VkoaNEfHN9PHFKUYp7R6Xc9zSDLFwHRh3Z5Fy4NOolbsVAvUw8ERFf2H
 02mbTkn5bQuNLUY0lTrl2XIo7y9TBSLwlEhfrINq3acSNIs2tzz0NeAzs
 Ovi2hYNMAZ43L3Pr4cg1fjF7qRTcUpzIugrITZBnuCrHWZmSO9fr8p6lt
 fr5Tvt2/5QgsSqULi8AG5rtMAAH8pkL6GoEke/R3ICXwdkgq8vG69INkm
 S2GmiTHxQU2cb+k5lQ24BDQCzQLmfGFSikvfhEhlun1UB2haBpFL5Guxq
 XzQVmq+Un4OusPsZR+St8VoNhQ8AWd4VxeBXAjGW+QzwHG9/0QG5yYsm0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2121216"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="2121216"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 10:57:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="8031932"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 10:57:13 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 10:57:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 10:57:12 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 10:57:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRgGAOZih9nsgISotkEKlsi9jHpK9CpUd3E6kDEac2bhszwsSTeg4Siypx7BB4oTQ+O5s8ewhL/CrjTd7VXYnWbk+0R9sSI9PWBZGYae7CaIHEDsdbP5oWjxXRXxXoG78hTSYT1/5aAG1M8sRZnJOEFvhEYvMcWOwKf+s5N0+0LPq2A6G6EaLRhacbkMZyd5lwML5vTGDb7XXzk7yfknOfsFt3Qj0jDFpJgRjYXYB6M7eiXC5MXat6aeFCABe9UZSaXA58yNVJE5xQEeBg0Uo9qhR6h7yItS8yGN+uSbhF+ri/Qzm4UqacNMccWEBQgui4YBZ1sDeMhvvB9vU5PaDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lwm70RRJmjsSRJIP6EnasvEwkr17TB4WgufvhOwvjOs=;
 b=m1mw4UUwNWzqWgQx+hD3fMB68y4hbFDG6xdMYegTiXfBCVc2+Ik2ypDr5PXT7Ksx+KUAtqE/c6LgZcpeU+vbTE+rC/fMcMv9okmWziPvVpy5Efbp3HZ8SQzw1Rpzmvcza5gTyxAnBTc2MJcOLjCPs/c3/ZYfUPUVnS2DuwIDbrTFjcaOdgywTs3/qMmjPfEAVD5g60d2hJmwGl789yXE1sl0Q/oD4+UGkGfrEVGcUJdVPhFwSAjRe3YOUARJ+AM+y8ZPzCc17UxvEyartPkNvzTiKUAntE1ZqzpzRFVZVID67i17Ip5iJY+0fAdxGpjeIFHgmBrt/l+78cNfsA85Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8489.namprd11.prod.outlook.com (2603:10b6:806:3a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Wed, 14 Feb
 2024 18:57:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 18:57:08 +0000
Date: Wed, 14 Feb 2024 13:57:05 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 14/34] drm/xe: Runtime PM wake on every debugfs call
Message-ID: <Zc0NAUbVw2qlsjId@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-15-rodrigo.vivi@intel.com>
 <6303efb2-d36f-4666-803d-abe55ced98b4@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6303efb2-d36f-4666-803d-abe55ced98b4@intel.com>
X-ClientProxiedBy: SJ0PR13CA0157.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: 06df88b8-3108-484c-ae52-08dc2d8ebe9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rfttC22W9g05bxan4yXjgY51sK88+B/2P+JbqJXFGksSQf+KrSEtLsbXlbH1eKWIt61ewJIyzXKaVGNgSPRO5xGui+KzjPU7JYsfO4V3XpzN8aby80bdoTkYRvvmdgSn10y706yAcZmt9s46Htolm7rtSVzcl7hOSlxzL4RFHJ/uyEc8m4b3sX+e74tD6/QIfvBr0wNJTRQ+MkmTixj8S8zu3z97mTqZJBUSLUWzjhxuzGtBnGVjNGovk73XW7F/jvHhk+dKJCO4uPVKjc7NWoDtrRLGTX3QhJU3iGIPisAUjdr/SAjXuD46toZzntqrLNFJ/CWPeBWpPlifKJ1x/C1lj9QSVK3v/v8wrQHjvyK1DKgD6UenTLXFSAdUZBINei5NCkgWmjkLlkvGe+NPKkzfNLuVJG18/Vg6snXP9UdIDhEAxjz9RuUCcS0ujzPiMH2/An5x+nfctPjvlTlnrnk53taI6Dmerb7qXwaCPvK6LshFKx4Glj6Cf+4ETGuwol5v+yrBrGyABMeV7FdTOMfe42djW+Jj8OhTneR7eD5uGWVUjOb2YmT3gcWIhbin
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(376002)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(86362001)(5660300002)(8676002)(8936002)(66476007)(66946007)(66556008)(4326008)(30864003)(6862004)(2906002)(6512007)(6506007)(6486002)(82960400001)(478600001)(44832011)(38100700002)(83380400001)(26005)(2616005)(36756003)(316002)(53546011)(6666004)(37006003)(41300700001)(6636002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PawIsvQkRsJMBEeyrvl7LQFV1dcgrNeKCSiv7PrYfEiLfRTNfdN8N2LF1Y12?=
 =?us-ascii?Q?0J0Bvsx1uPMGtG+tbRJSQrwjZ0o6997yVliwWJQqy3utEdAdwZcf+qfYFOlT?=
 =?us-ascii?Q?YntjF2Ikm/imYs8XOV3dv4h7FHIXbATCKeaE5K/RssoJHi+zGxNGsrkWyTrD?=
 =?us-ascii?Q?7MfA+ZHbwo8Js2gl8wDt9s88UMHPv3JnucZS3UTUta/Z/gR6mNpiho3mk3mB?=
 =?us-ascii?Q?VXWyZ5TgLCSsMvIwQRh60BQRIo55KsyFoxd49S1iXUr5yb3FQc+bfGoFEQse?=
 =?us-ascii?Q?/kLOuuYHh7NovBPSRNp8nZ1jprPT3O2A+adw2ZbMPGSujrtFj34KalzxcIXH?=
 =?us-ascii?Q?4Mv0zLMaB8mWq1qr2jVv1mw3JicJPIU9JjT0Gp9FAc8lQxqkLkuVemDLkFdB?=
 =?us-ascii?Q?Bs5XApFne6YuXW1z0J6shot+qDQWdX1D1Nqgg1KofwagW6Yx1ESsf+y4uWRk?=
 =?us-ascii?Q?SHbP25ekAzfc7BwgH82rqeAG33ah1hFhsy3WbbTC1jn8BYF/BHQ+cFykpBqW?=
 =?us-ascii?Q?jX/q2bRhXrFqxEa1FkBi4cyhkXriyWpdMfORK9JN+EvQ5p3zEjhxw+x5Lwyr?=
 =?us-ascii?Q?rj2EabThNkjh0LsfZp7nOZflFCTPY1gjgIHeaUd7IVhQOyTND65/pSEbixgt?=
 =?us-ascii?Q?4OSvHy4Ytl1iaxjtIl2dbhp28ucKyHjG3gWnAyGTkBt7eLwLZ4HpaPlGXMaV?=
 =?us-ascii?Q?THbvuqPmWd5TqRkEa1RbAIaqJAWVjNkQUb7youTIGTDiD/sedQ+j3csK5Z3j?=
 =?us-ascii?Q?4vqkwRgm6DrdAWT0CiUE3vbPbtg36sJ1UdKs2ZHif3zpePGfM39eBmrFQWRG?=
 =?us-ascii?Q?UMqwnglZgNA8HEV3R/Tnk3FYl103p9AQG7w4ygA9vkXfmDPWERBnD1P4fGdG?=
 =?us-ascii?Q?+phQ0TQ4Jd2SzZyBETVYDphxg0t4abiTq8F0tUv6DDIBUduurQ+FQH3BTo1i?=
 =?us-ascii?Q?Fj13XuM5Kp/q/NkNIKG4hRIKZKpOxE8oRjWRK0LjEcrb+ZGAT2/Fgv9x39l7?=
 =?us-ascii?Q?7p8AILlzjuk+M48dC4b/5aj2fNs4Tp8Lteichijagg6nh7/O/eHvBp4EnuGu?=
 =?us-ascii?Q?4L/IfY5J+Qq65y+gX/foLnkmRCmOCCmeNKXDG5P+REeQlD4dNoVaR+2peuzK?=
 =?us-ascii?Q?RGuP6DVKb33tHbP3CJrKB8U0b1tKQMT74X1dELBViIDpgIha66U3e32MnB78?=
 =?us-ascii?Q?ldHsLnZFyMwy4MzmJK1yReziwGIBNhClMrtRftybGA0+AWCthrIY0xj4Riuu?=
 =?us-ascii?Q?JyT6VEwGqpPYo0uHX3QckuK1oIkHPpSfhYYQBUUL5wFANVrMh+8WwVhcp4ru?=
 =?us-ascii?Q?56QHrdIT/6RhfRVz4ihwdo6cG5sr851drJdevq3Ytp5C8sgFyMB+nEirqNkP?=
 =?us-ascii?Q?+Dwc3gL6Q1vWuJzhdk/CsuOtagHDG+smk6aulzHaBQq6IPcYjT0VnTiBKnb7?=
 =?us-ascii?Q?bhV1E4m11U8+18dBANMZqsOlMfbs4Z1qBisFUrm69kO8GdUjlvYxc4GmG8hH?=
 =?us-ascii?Q?n05X0uUOC+86JpKFywMmjEfrJJlUnND8uOssNqfrwT56dJW3r16ufijsDBth?=
 =?us-ascii?Q?r8FuiY1qLFeouoWAyWcmS80rqVeMx7r1VF9S1FJGAk+kTthIbq5Kp7zl1cJ6?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06df88b8-3108-484c-ae52-08dc2d8ebe9d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 18:57:08.8911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qgCZIaZ3S4mD5ILuWxuq2/HcSgp5owMe3E7ORRyjYeSvs9mf+ohZ+x0/7I2W4HpBJ2O55+uNdrF77U8SW7h3Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8489
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

On Mon, Feb 05, 2024 at 11:10:19AM +0000, Matthew Auld wrote:
> On 26/01/2024 20:30, Rodrigo Vivi wrote:
> > Let's ensure our PCI device is awaken on every debugfs call.
> > Let's increase the runtime_pm protection and start moving
> > that to the outer bounds.
> > 
> > Also remove the mem_access get_put helpers, now that they are not
> > needed anymore.
> 
> Wrong commit?

hmm... bad sentence probably..

what about:

"Also, let's remove the mem_access_{get,put} from where they are not
needed anymore."


> 
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Otherwise,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> > ---
> >   drivers/gpu/drm/xe/xe_debugfs.c     | 10 +++---
> >   drivers/gpu/drm/xe/xe_gt_debugfs.c  | 53 ++++++++++++++++++++++++++---
> >   drivers/gpu/drm/xe/xe_guc_debugfs.c |  9 ++---
> >   drivers/gpu/drm/xe/xe_huc_debugfs.c |  5 +--
> >   drivers/gpu/drm/xe/xe_ttm_sys_mgr.c |  5 ++-
> >   5 files changed, 66 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> > index 01db5b27bec5..8abdf3c17e1d 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -12,6 +12,7 @@
> >   #include "xe_bo.h"
> >   #include "xe_device.h"
> >   #include "xe_gt_debugfs.h"
> > +#include "xe_pm.h"
> >   #include "xe_step.h"
> >   #ifdef CONFIG_DRM_XE_DEBUG
> > @@ -37,6 +38,8 @@ static int info(struct seq_file *m, void *data)
> >   	struct xe_gt *gt;
> >   	u8 id;
> > +	xe_pm_runtime_get(xe);
> > +
> >   	drm_printf(&p, "graphics_verx100 %d\n", xe->info.graphics_verx100);
> >   	drm_printf(&p, "media_verx100 %d\n", xe->info.media_verx100);
> >   	drm_printf(&p, "stepping G:%s M:%s D:%s B:%s\n",
> > @@ -63,6 +66,7 @@ static int info(struct seq_file *m, void *data)
> >   			   gt->info.engine_mask);
> >   	}
> > +	xe_pm_runtime_put(xe);
> >   	return 0;
> >   }
> > @@ -76,8 +80,7 @@ static int forcewake_open(struct inode *inode, struct file *file)
> >   	struct xe_gt *gt;
> >   	u8 id;
> > -	xe_device_mem_access_get(xe);
> > -
> > +	xe_pm_runtime_get(xe);
> >   	for_each_gt(gt, xe, id)
> >   		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> > @@ -92,8 +95,7 @@ static int forcewake_release(struct inode *inode, struct file *file)
> >   	for_each_gt(gt, xe, id)
> >   		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> > -
> > -	xe_device_mem_access_put(xe);
> > +	xe_pm_runtime_put(xe);
> >   	return 0;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index c4b67cf09f8f..6b4dc2927727 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -18,6 +18,7 @@
> >   #include "xe_lrc.h"
> >   #include "xe_macros.h"
> >   #include "xe_pat.h"
> > +#include "xe_pm.h"
> >   #include "xe_reg_sr.h"
> >   #include "xe_reg_whitelist.h"
> >   #include "xe_uc_debugfs.h"
> > @@ -37,10 +38,10 @@ static int hw_engines(struct seq_file *m, void *data)
> >   	enum xe_hw_engine_id id;
> >   	int err;
> > -	xe_device_mem_access_get(xe);
> > +	xe_pm_runtime_get(xe);
> >   	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >   	if (err) {
> > -		xe_device_mem_access_put(xe);
> > +		xe_pm_runtime_put(xe);
> >   		return err;
> >   	}
> > @@ -48,7 +49,7 @@ static int hw_engines(struct seq_file *m, void *data)
> >   		xe_hw_engine_print(hwe, &p);
> >   	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > -	xe_device_mem_access_put(xe);
> > +	xe_pm_runtime_put(xe);
> >   	if (err)
> >   		return err;
> > @@ -59,18 +60,23 @@ static int force_reset(struct seq_file *m, void *data)
> >   {
> >   	struct xe_gt *gt = node_to_gt(m->private);
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> >   	xe_gt_reset_async(gt);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> >   	return 0;
> >   }
> >   static int sa_info(struct seq_file *m, void *data)
> >   {
> > -	struct xe_tile *tile = gt_to_tile(node_to_gt(m->private));
> > +	struct xe_gt *gt = node_to_gt(m->private);
> > +	struct xe_tile *tile = gt_to_tile(gt);
> >   	struct drm_printer p = drm_seq_file_printer(m);
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> >   	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, &p,
> >   				     tile->mem.kernel_bb_pool->gpu_addr);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> >   	return 0;
> >   }
> > @@ -80,7 +86,9 @@ static int topology(struct seq_file *m, void *data)
> >   	struct xe_gt *gt = node_to_gt(m->private);
> >   	struct drm_printer p = drm_seq_file_printer(m);
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> >   	xe_gt_topology_dump(gt, &p);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> >   	return 0;
> >   }
> > @@ -90,7 +98,9 @@ static int steering(struct seq_file *m, void *data)
> >   	struct xe_gt *gt = node_to_gt(m->private);
> >   	struct drm_printer p = drm_seq_file_printer(m);
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> >   	xe_gt_mcr_steering_dump(gt, &p);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> >   	return 0;
> >   }
> > @@ -99,8 +109,13 @@ static int ggtt(struct seq_file *m, void *data)
> >   {
> >   	struct xe_gt *gt = node_to_gt(m->private);
> >   	struct drm_printer p = drm_seq_file_printer(m);
> > +	int ret;
> > +
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> > +	ret = xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, &p);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> > -	return xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, &p);
> > +	return ret;
> >   }
> >   static int register_save_restore(struct seq_file *m, void *data)
> > @@ -110,6 +125,8 @@ static int register_save_restore(struct seq_file *m, void *data)
> >   	struct xe_hw_engine *hwe;
> >   	enum xe_hw_engine_id id;
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> > +
> >   	xe_reg_sr_dump(&gt->reg_sr, &p);
> >   	drm_printf(&p, "\n");
> > @@ -127,6 +144,8 @@ static int register_save_restore(struct seq_file *m, void *data)
> >   	for_each_hw_engine(hwe, gt, id)
> >   		xe_reg_whitelist_dump(&hwe->reg_whitelist, &p);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> > +
> >   	return 0;
> >   }
> > @@ -135,7 +154,9 @@ static int workarounds(struct seq_file *m, void *data)
> >   	struct xe_gt *gt = node_to_gt(m->private);
> >   	struct drm_printer p = drm_seq_file_printer(m);
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> >   	xe_wa_dump(gt, &p);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> >   	return 0;
> >   }
> > @@ -145,48 +166,70 @@ static int pat(struct seq_file *m, void *data)
> >   	struct xe_gt *gt = node_to_gt(m->private);
> >   	struct drm_printer p = drm_seq_file_printer(m);
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> >   	xe_pat_dump(gt, &p);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> >   	return 0;
> >   }
> >   static int rcs_default_lrc(struct seq_file *m, void *data)
> >   {
> > +	struct xe_gt *gt = node_to_gt(m->private);
> >   	struct drm_printer p = drm_seq_file_printer(m);
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> >   	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_RENDER);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> > +
> >   	return 0;
> >   }
> >   static int ccs_default_lrc(struct seq_file *m, void *data)
> >   {
> > +	struct xe_gt *gt = node_to_gt(m->private);
> >   	struct drm_printer p = drm_seq_file_printer(m);
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> >   	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COMPUTE);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> > +
> >   	return 0;
> >   }
> >   static int bcs_default_lrc(struct seq_file *m, void *data)
> >   {
> > +	struct xe_gt *gt = node_to_gt(m->private);
> >   	struct drm_printer p = drm_seq_file_printer(m);
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> >   	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COPY);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> > +
> >   	return 0;
> >   }
> >   static int vcs_default_lrc(struct seq_file *m, void *data)
> >   {
> > +	struct xe_gt *gt = node_to_gt(m->private);
> >   	struct drm_printer p = drm_seq_file_printer(m);
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> >   	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_DECODE);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> > +
> >   	return 0;
> >   }
> >   static int vecs_default_lrc(struct seq_file *m, void *data)
> >   {
> > +	struct xe_gt *gt = node_to_gt(m->private);
> >   	struct drm_printer p = drm_seq_file_printer(m);
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> >   	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_ENHANCE);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> > +
> >   	return 0;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> > index ffd7d53bcc42..d3822cbea273 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> > @@ -14,6 +14,7 @@
> >   #include "xe_guc_ct.h"
> >   #include "xe_guc_log.h"
> >   #include "xe_macros.h"
> > +#include "xe_pm.h"
> >   static struct xe_guc *node_to_guc(struct drm_info_node *node)
> >   {
> > @@ -26,9 +27,9 @@ static int guc_info(struct seq_file *m, void *data)
> >   	struct xe_device *xe = guc_to_xe(guc);
> >   	struct drm_printer p = drm_seq_file_printer(m);
> > -	xe_device_mem_access_get(xe);
> > +	xe_pm_runtime_get(xe);
> >   	xe_guc_print_info(guc, &p);
> > -	xe_device_mem_access_put(xe);
> > +	xe_pm_runtime_put(xe);
> >   	return 0;
> >   }
> > @@ -39,9 +40,9 @@ static int guc_log(struct seq_file *m, void *data)
> >   	struct xe_device *xe = guc_to_xe(guc);
> >   	struct drm_printer p = drm_seq_file_printer(m);
> > -	xe_device_mem_access_get(xe);
> > +	xe_pm_runtime_get(xe);
> >   	xe_guc_log_print(&guc->log, &p);
> > -	xe_device_mem_access_put(xe);
> > +	xe_pm_runtime_put(xe);
> >   	return 0;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_huc_debugfs.c b/drivers/gpu/drm/xe/xe_huc_debugfs.c
> > index 18585a7eeb9d..3a888a40188b 100644
> > --- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
> > @@ -12,6 +12,7 @@
> >   #include "xe_gt.h"
> >   #include "xe_huc.h"
> >   #include "xe_macros.h"
> > +#include "xe_pm.h"
> >   static struct xe_gt *
> >   huc_to_gt(struct xe_huc *huc)
> > @@ -36,9 +37,9 @@ static int huc_info(struct seq_file *m, void *data)
> >   	struct xe_device *xe = huc_to_xe(huc);
> >   	struct drm_printer p = drm_seq_file_printer(m);
> > -	xe_device_mem_access_get(xe);
> > +	xe_pm_runtime_get(xe);
> >   	xe_huc_print_info(huc, &p);
> > -	xe_device_mem_access_put(xe);
> > +	xe_pm_runtime_put(xe);
> >   	return 0;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > index 3e1fa0c832ca..9844a8edbfe1 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > @@ -73,7 +73,10 @@ static void xe_ttm_sys_mgr_del(struct ttm_resource_manager *man,
> >   static void xe_ttm_sys_mgr_debug(struct ttm_resource_manager *man,
> >   				 struct drm_printer *printer)
> >   {
> > -
> > +	/*
> > +	 * This function is called by debugfs entry and would require
> > +	 * pm_runtime_{get,put} wrappers around any operation.
> > +	 */
> >   }
> >   static const struct ttm_resource_manager_func xe_ttm_sys_mgr_func = {
