Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F4EC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 15:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859BD10E5D3;
	Wed, 20 Dec 2023 15:20:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D23110E5D3
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 15:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703085632; x=1734621632;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y5EJCuhZjayNKccCHkOxntC4KVSamXg2NWg8L1tf3u0=;
 b=AkBG6lDksnjckfFgoT6+Xtp48n3P7D5KU/0fxuzQLf8EnPNVaM1GKEo0
 YOvyVWP3DsHH1eajPY+AlWxo5+nXpZ1j4w58O55slymEOGw4To3FEmC7+
 NO7hCNKTpn5BFrp3RJjg1h01VUENbfuZKZulzLpsI3fFBkG867/BpQr2q
 XwHY+7GQO7TXZwZC5Bmx3L3PtNU1UgQ70iXQsdKL+INaToKIvM0uyf28j
 XIBIVGcxNSWXFHyVzinIipnLtj+n5syujdnibPIyRIr5Ogm2l6DcFxVYk
 pxJlMOKirRpFfJbB1XzAWr1n4RFz7wtFdovW01CzCwd8GTxiJp2yQzmNk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="9209636"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9209636"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 07:20:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="18341292"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 07:20:32 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 07:20:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 07:20:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 07:20:30 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 07:20:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iromhZ8rl2fjHqdUI7T88vQDamXXtJlvw0dkU0Vux5MzF2px522awfffi/TSuWqvqZoHUJbWgokeijQVj9BT7mjmK2xf5xkliwWFcccG+agXjAXwACAANzCoUaH2zzoYh801g0Auyx03jps2uNT9oKSnPqv3yR2fxyHN6AXn+gZJm7T1N50RDg3LZpaWa25XaGUbAu25/0ZAok3dLXFC1VPLJN658RGGjzhApa+xs56up3noqv1z38idvSLFjNc5P6I5kCy3BVZI+KUfixr3kieSMAd8ZEBotk4G9nsKUGJQK/1z8d83Dtgz5c80TH4THTQ7x18gusOaJZd31Bdq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNpbN6yObu9s8Qbx3aXzS1/xz8XUAPiJULBae6qjS7w=;
 b=hoMTqbRUI8dXA61KGKHg4kP0Jud6frnaCIMFoIf8ghQOeloOmTwrveNQcbKMOP1IWm6LaHeIXlXSqAgj5cmSelEHKH7A+UOplFdUJHxk6i61qS+hg3bAIVeAX6ekm/jg9g0GsMwJn4RlYw4ZR3jDm1L8N/PFF1m8GX1UGC8qgBknLKrzN+43DcTj1KvZMonhtpuw2A7smEFBA4wqwwAW0jdeGPgqOFtycaVk8yZo1k0ZFbfcRTYN9Ig1KRAA3gCoZ0lA8GsKGuG/c4TKsi2IiyXtdDuA9be9YHee514xvjNgULLHLUKERo9n0uAfp6H9zMBIS6w+Ng/l2qaVqpS2CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 15:20:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 15:20:22 +0000
Date: Wed, 20 Dec 2023 10:20:19 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Subject: Re: [PATCH] drm/xe: Add wait for completion after gt force reset
Message-ID: <ZYMGMyHVp95WBrhM@intel.com>
References: <20231215051541.2536859-1-karthik.poosa@intel.com>
 <ZXyCGMbgOXZBnYYa@intel.com> <ZXyNkit45DB5dTHr@intel.com>
 <CY5PR11MB62118022C5A132ED232853F39596A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CY5PR11MB62118022C5A132ED232853F39596A@CY5PR11MB6211.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5469:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb651f8-2038-48aa-80b1-08dc016f2eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3M8QhdX3whDgo5SJpM8k2iPSH2/eWTEOhOU2EE8qJAbcFqT0+j5g+GZGTBaLmL+pDEvR4vYslLyASw0+jWQAGSHzuS2G+W/jatdZ/56OXiD7yn/r1+h6hi8ikUZSu1ozdC9I9L66eBz5zkNcI6LgejiUbOHiAwJL7UqzyWR3IolFGCAZc4g8+J5gkwXtGBc6Gtij3hEmpoFOaqQButCLRDjipeCyVggUURj8IeF+CmXdLh98SOJ5wR8wbhmNbliNRRvHy51S7s0K4HfwaJ6+AaRy7sDbjZlun0XV/VVYVIt1DmMTbNYxSl54pVm43bA9hDwMTRziqLiYCbQRoiSv3QeKz8yM9whaW4nKbqScXJLSSyLwY9MKfgBRD39BQuReZavzSmkQvn7rmVWz+rIRfKUCRC9kqA2xM0W/Dpx69VH8hcdXger2kZLQl6KNPr9eRRkKF4yiCNC3XxUJb7x7Kb/2I29afwQaLaLsxXwiuHEIRut5xYLO5y6Wcr/V4tilkK+XPIv/De1ufF9bAhCT/m/xHHauIvM1Aw6SENZQPN3oeGuTlfnngoB7OWhwXF69
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(396003)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(478600001)(37006003)(66946007)(66556008)(66476007)(316002)(6636002)(38100700002)(6666004)(82960400001)(41300700001)(86362001)(53546011)(6512007)(36756003)(6506007)(54906003)(5660300002)(26005)(6862004)(4326008)(83380400001)(44832011)(8936002)(2616005)(8676002)(2906002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c6G5ZHiYw1Wylf4L3iOv0cyiOG+qALnZmfFWjQs/rkfUs2IGo+G7LmbMVIQK?=
 =?us-ascii?Q?IfdApNKx8ixu0ahQufY37nWzRkr+1k1QO8TWxWT5ird7YZ90mlWQg/6Ojj1w?=
 =?us-ascii?Q?0XJ9L8/ZFwOeRzkAz1R22DMqYCArnc4hzYSQMwReafI4LyWmp1pfvEnWYCiD?=
 =?us-ascii?Q?XNNDs2RlMcTTxaoNtcFOsqKVm0mbGDsM8GYw/ykg2vqyT3/QZrARmyeqMaTT?=
 =?us-ascii?Q?W8ZiEoMXZLlnz5XJT0kMwa0OUyKaMwvPSb5jtajjAlHZxmb12aAO552rGD7A?=
 =?us-ascii?Q?qEwToaCttxYAaEpMm7Rx169ckMRYDygoQegWiVP63CI1X34T5VQqvJPTzcHK?=
 =?us-ascii?Q?rhCs4kS98qMj6DhbFZMwg645qf0dvmrcLhY3a72BcWREZg5IgclOhLnCPCNY?=
 =?us-ascii?Q?VLrZh0jy1iJE0tK4CbqSutmWZtKL9qYFqNrCwubLRkuPGLFAj+h62v2NFnCs?=
 =?us-ascii?Q?wyl8KX7ClVjSJ1LAZIddJO1RZevBPz9r6HjkabcnJJ78jq0/UYHnwuEiytD5?=
 =?us-ascii?Q?iI+9BxOW4pUJIEYB91lEFCHiIpJXF4btEEM2ycl81IW3Sc9RjgbQkfZK7Hhr?=
 =?us-ascii?Q?w53o9YQB63PXRW513Dj+JB1z3DArd0+X8ylCYRwfmGvr7cGKOOjqR1LLNv0G?=
 =?us-ascii?Q?4J+x2yf+nyKWsUxFkitA6WRZ/JzrWpwTJQqCB9n2QVgo5xxkmi/UZMlXUMDk?=
 =?us-ascii?Q?M2kgrMfAMLzsDeXQISJpc+Ms5sRJkvN+gnYiyXbPJ1WAwUF8zbWco9O4PJr5?=
 =?us-ascii?Q?W72UGXB+TtpdFSBAoEyTOn5icYT3dbhvIwnokAHIdyGtX1iBSRjOlpKSMyRI?=
 =?us-ascii?Q?HuiMd/AQpmVw2cgE41T9JdZxz9ukkl+7IPTUznYJoc/4/aYW/I8GPjTQjeAV?=
 =?us-ascii?Q?c1QVVARRq9wTcPl2wp25+fUbiA5G0si2rqwfWcyW4F5b+UPUm7A+rhD+wD5G?=
 =?us-ascii?Q?9e76kiL5EXzjbAnRTnf1tEgWucl7cx3bH2g2/gvw0GhuzEU/9LI39KLvEaHM?=
 =?us-ascii?Q?7DfWU1VTkoLI68Ih6VaqkeAYoTTTYG4DydawyElg7y7z5tKge0hh0B3pEQDw?=
 =?us-ascii?Q?MrvLFBK9cg4DyJUzmS1emtRLtwkVKGeEE4x90GouTk473spfOFi5zzbkx7jv?=
 =?us-ascii?Q?dC7dgn0pi8m0ypRVH80y0cWnKJh4bk/lmihoOluFjVvnRY+6NV+XgbL7LF94?=
 =?us-ascii?Q?j6xJNYbuyfi2/+Xe6RkXFp5wIAlGX4h7WyU+1Dzwa5X0vugVujdDXru0gLj6?=
 =?us-ascii?Q?tbECHTt2ZTRtoEuZBgs2N7vTqDKdEyVL1OUPdO2XoeU0ELODf4wxANrS/+vk?=
 =?us-ascii?Q?qKBwZTCp1gjJPwss+0ni3Qoo2NvXC/diEUUjI6RjB2xMZ+y7WaLYraMiblb3?=
 =?us-ascii?Q?STfG2c4DZvCbCDWigIJW9CRwKtuiDOp7uq+oWmUtZ9y56eYDS+lgqylb+gP/?=
 =?us-ascii?Q?ZdBoadLsatDEj5m4tqzW0YqcL5zWnT7ya13082e1x4qLYEcNCWfq9JGyg0Ed?=
 =?us-ascii?Q?tRQVPk75ZTr+Ta2cjYjXYFfXIUFBrnikSjrnPyVutpPwdVwf9U586DQpZiN4?=
 =?us-ascii?Q?n93GE8f049y9SCgOit3rMhd/cobUPo2/hORyzfXp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb651f8-2038-48aa-80b1-08dc016f2eff
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 15:20:22.3878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrYUnFfkqmBu2EBOI469dqC0NKGcrUomybqYS5G3VYWAD36TozuNHhj8NUr/YfQ5rCLbs+obe3eX7BNIA5oxBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5469
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
Cc: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 20, 2023 at 07:51:31AM -0500, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrigo
> > Vivi
> > Sent: Friday, December 15, 2023 11:02 PM
> > To: Poosa, Karthik <karthik.poosa@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [PATCH] drm/xe: Add wait for completion after gt force reset
> > 
> > On Fri, Dec 15, 2023 at 11:43:04AM -0500, Rodrigo Vivi wrote:
> > > On Fri, Dec 15, 2023 at 10:45:41AM +0530, Karthik Poosa wrote:
> > > > Wait for gt reset to complete before returning from force_reset
> > > > sysfs call. Without this igt test freq_reset_multiple fails
> > > > sporadically in case xe_guc_pc is not started.
> > >
> > > \o/ I knew I was missing something there. Thanks for finding that out.
> > >
> > > >
> > > > Testcase: igt@xe_guc_pc@freq_reset_multiple
> > > > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gt.c         |  3 +++
> > > >  drivers/gpu/drm/xe/xe_gt_debugfs.c | 10 ++++++++++
> > > >  drivers/gpu/drm/xe/xe_gt_types.h   |  3 +++
> > > >  3 files changed, 16 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > index dfd9cf01a5d5..eb7552b6dfa5 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > @@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> > > >
> > > >  	gt->tile = tile;
> > > >  	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
> > > > +	init_completion(&gt->reset_done);
> > > >
> > > >  	return gt;
> > > >  }
> > > > @@ -647,6 +648,8 @@ static int gt_reset(struct xe_gt *gt)
> > > >  	xe_device_mem_access_put(gt_to_xe(gt));
> > > >  	XE_WARN_ON(err);
> > > >
> > > > +	complete(&gt->reset_done);
> > > > +
> > > >  	xe_gt_info(gt, "reset done\n");
> > > >
> > > >  	return 0;
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > index c4b67cf09f8f..49b30937a28b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > @@ -23,6 +23,8 @@
> > > >  #include "xe_uc_debugfs.h"
> > > >  #include "xe_wa.h"
> > > >
> > > > +#define XE_GT_RESET_TIMEOUT_MS	(msecs_to_jiffies(5*1000))
> > >
> > > 5s seems to much, but anyway, this is a debugfs function, so, no if 5s
> > > fail, then we do have bigger problems.
> > >
> > > perhaps we could get the timeout as input?
> How should we get that, I guess debugfs or modparam, sysfs will require a uapi user ?

what I had in mind was simply a input of this force_reset debugfs file.
nothing special nor nothing extra.

> Thanks,
> Anshuman.
> > >
> > > anyway, it is better to have protected like this than the current racy
> > > one that we have.
> > >
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > ops, let me tune down my over excitement here.
> > We need to address the feedback from Badal that was given at intel-gfx ml.
> > 
> > >
> > > > +
> > > >  static struct xe_gt *node_to_gt(struct drm_info_node *node)  {
> > > >  	return node->info_ent->data;
> > > > @@ -58,9 +60,17 @@ static int hw_engines(struct seq_file *m, void
> > > > *data)  static int force_reset(struct seq_file *m, void *data)  {
> > > >  	struct xe_gt *gt = node_to_gt(m->private);
> > > > +	struct xe_device *xe = gt_to_xe(gt);
> > > > +	unsigned long timeout;
> > > >
> > > >  	xe_gt_reset_async(gt);
> > > >
> > > > +	timeout = wait_for_completion_timeout(&gt->reset_done,
> > XE_GT_RESET_TIMEOUT_MS);
> > > > +	if (timeout == 0) {
> > > > +		drm_err(&xe->drm, "gt reset timed out");
> > > > +		return -ETIMEDOUT;
> > > > +	}
> > > > +
> > > >  	return 0;
> > > >  }
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> > > > b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > index f74684660475..6f2fb9e3cfea 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > @@ -358,6 +358,9 @@ struct xe_gt {
> > > >  		/** @oob: bitmap with active OOB workaroudns */
> > > >  		unsigned long *oob;
> > > >  	} wa_active;
> > > > +
> > > > +	/** @reset_done : Completion of GT reset */
> > > > +	struct completion reset_done;
> > > >  };
> > > >
> > > >  #endif
> > > > --
> > > > 2.25.1
> > > >
