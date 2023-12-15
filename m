Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12BEC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 17:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355A210EA8E;
	Fri, 15 Dec 2023 17:32:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AB610EA58
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 17:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702661532; x=1734197532;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uZpCf+hq8KkMe/VOjWRhz741yMRJoZKucipG7X2Vl4g=;
 b=Cd0rrh8PNnXiqRflR7NBZONXM2ddRN3pKyLgF1VHJ8ABlNJFPDORD8SA
 307KZrreuiMwC5Z8VTIRo0n/Zx5R23EdMI+83y4sFOkcOaHJ6FG6XheYU
 A3jughYUIXQTf+ynlp3fFn9Q2XhbD07WfPQIOqMGavZAQcm6d4V8cOasY
 RRR/34F3XaMgUyZDs8j35x2iAfxpKRs1i8+qj+9WyhfwJ6UPB1Dx39Ybk
 Bn45QtLVYA4P1IJoBKVeVzAHfvz/YxtgOpmF1EH0yQIL3iCULY0aSyX5g
 1rfXI1y9Rk8mXaYiTr9j1wGqk699oDyAphzvH6LofPgnSS7LB/055t02n g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="16856848"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="16856848"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 09:32:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="778335243"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="778335243"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 09:32:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 09:32:10 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 09:32:10 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 09:32:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwAipHOPQUqZ8a3CAr9WHmcFETUVCZUNHapQpl9OtJRI3lrQDRrAN6OGbEpUE1zGTD2Cq0ndLp28LMl0rlhKL9i8hg9POp5LuKo7u7MYUTchD5tIcGq3vc3pZ4z3LvkzKL+qpozjImSDOtHahCUd8E75EZbmQEliw672C84fqYetkzhn0NlwdHa3fHyR+Yh9Y9W/XTVUIJMIZcigczqWtTZCXBKdNXf2aKxQ+FwAfYVb9Lqs7c8aVz/7gHNxWvn32+V8hCsTZdvOH46yYk2wGP5KRQwP3XRRtc4e8LGsWYQYK+FLTGzzC+scTVIIdRfC+A4LtAKPSQqHnuTW4SmUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eIh2NWYJrDycJYBDobfusVvba0Jn1j+aFKcMOkCRG4=;
 b=ATrv+gUrmDn3SjsWS0h3WVAvAnYhBwW3wj0G3HriumfgyywF/TTbTjdYDTGw7Pye+fDEmJjb4n8K8eqJwAOJjyoSihOQBAWKEybdWvMjxlSTPWHW/x5akoTVx5rWVp07/Po2xJQjv9LEJ3HxhMkqdorbFBvWBgN0IfV75XJri2TUxLliGofBXvFjxVud9P7x4s2mEK5P/lrPkePncz9nq2XyX9m4jSWGk+IoYIaML/C0hvC306fk+NV7aB6KYxB2/VnmZhE3KiJdE7n3Bd8/Ub0qKqrevR8QnSJZTuPkM8UlUUv6xeegwF33k6QLkZMyRUs7nGLcII1YqM8eQ/SBgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB8246.namprd11.prod.outlook.com (2603:10b6:208:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 17:32:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.032; Fri, 15 Dec 2023
 17:32:06 +0000
Date: Fri, 15 Dec 2023 12:32:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH] drm/xe: Add wait for completion after gt force reset
Message-ID: <ZXyNkit45DB5dTHr@intel.com>
References: <20231215051541.2536859-1-karthik.poosa@intel.com>
 <ZXyCGMbgOXZBnYYa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZXyCGMbgOXZBnYYa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: 743905ea-7a8f-4174-4ce3-08dbfd93c250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w5muEh4uY9alqBXwk0I4Yl+lP4fPDzIZqWJtDv36HmVX8PvXRVoXycUzjQia/Ud6lQCW+FzPuaVu2X+4V3ebKq1PGZlZYjsVcf8cGZq6gEOoUiLkzZM1b89BaVVV/WNTg5dKrR5KJeBXj0ZqlsfqyfaBoV4Er4xpe85iJpYNWqzA7Uq3bhsyXrPTaKwU3qyWUb6r0YwSgT/W2o9ptUMLwrj06TC9podAoQ8KtY0Io6nL3SBzH3VuG1IYpVmnNfPqNXjEeUlMqR/DY9orw+1XdABXnthUZ73OtM6v6Pu5j3N6rxKdHLnzhH8GJWQcP4xyirogQohIhIJItLwwqtOI7xxLWIWDSokSajlJtd5x7WqAGJKZtcN/xwjeCai6jGiaBbFHwTg5QednE/TidjakVppB8Ix34N1EQ1xdpQjGVnBINauSrs9p611ltwJJd8zs+b09ITgr8jSKau7aQYBZKiutIuEOrW76knZAi/kmudiEXfiiT0E2ueTQKotLTrDPhMdwI1hhrxxDl8TrOaMXzJbQ0sXEEFVZbI2CaN7MZAZYGGYcNC9nif1FgFfZQxrM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(39860400002)(346002)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(5660300002)(2616005)(26005)(107886003)(83380400001)(6486002)(2906002)(44832011)(478600001)(316002)(37006003)(6636002)(36756003)(66946007)(41300700001)(66476007)(66556008)(6862004)(4326008)(8676002)(6512007)(8936002)(6666004)(6506007)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OJKNHuVkfI4nFBBhhbH6OB17R5mwSBCPL3Sxe9s+J9/GSWH4nd6Ulyy7mowt?=
 =?us-ascii?Q?W6qHwJDsYH6UUHpbv+xZeK3BWHFYQP0fwaYv09Vsyda3h0HTs9pKtEp7YP4P?=
 =?us-ascii?Q?omXQODDwZOM5wDoYk7KKF+tYLKCobCqxYBrg2YQJr3XT9yBsI3qWi2QI5+px?=
 =?us-ascii?Q?kOp7vK9IrSmkGeGphKWd+cS56oRLMLGmqOL3/IuK5s/Mf9lJcu5RunCgnlhV?=
 =?us-ascii?Q?MSC6VZX/LHw+doUOLx5v75CSTrhPsehehy9SdfHDmQxWzydQVPmmDcDIURkn?=
 =?us-ascii?Q?FOo6l2qmD33MOvxH0Syxy3CnWmpBmHU6jcoUUu+cP7SqXWTGQS+srm4y2CPV?=
 =?us-ascii?Q?kmLruVX95VgIDnrsdXqJt2+UrqhBgsmaj87wkT/XJqHcAHsvEaQOy9HjjZrS?=
 =?us-ascii?Q?0/TYKfvdopid1eGMhPELwTiC8oDNCw0x2WgigE3VWe9Nje2XPsARM0wOmIHp?=
 =?us-ascii?Q?OPuoC5Bgk0fLozW9gW0a1N8WGc+ho4otCejwoDANVp+PC8117pL09Ht9GUIG?=
 =?us-ascii?Q?k6twqyqMfbSrlGhwwo5aImoOrzfYOEsm4jm/M9ATNiZFoz1GQWQpNfQtQWpO?=
 =?us-ascii?Q?sU+ctiViqU28IXRbLOY0xBONP+PZn7Wf9hH9ssBy6k+nk2UlDA0in99JkDPI?=
 =?us-ascii?Q?wxeeWqBb8XWzfB/TLj4Cq2Hqwvvw9GuEhrzVViCyen6Swz3Wn3ogRrxpummG?=
 =?us-ascii?Q?BxYvNuxpVBn+B+Uzl4eRbmOOGzxxAq4m2Yn3f/Q1qXDT6JDgu92/iVTcFpRy?=
 =?us-ascii?Q?OPIpVcrEcSR1lYH2KJELsFxa5DLkdCuJ4fGT8qGl7IZoXJs98Z1YxkqFDcHm?=
 =?us-ascii?Q?IRGyh5ZXLaykkcOIhV+1yMsvxsmWMwbiIH0oalqFoyEsrn2K+OLfUfjyYpT9?=
 =?us-ascii?Q?c/ZxNQN1qd0R06nsSW5C64FKJr+lOvDkemBDRMD6I/JaLr8bmDH5EALK+6Z6?=
 =?us-ascii?Q?Pp3eDQ7YrCq6anotY23eH/Xy20bTHPTt+Bc/tFGMRzu0CA9Shh3ujMwT/Yjy?=
 =?us-ascii?Q?sWNTKkbR0H5m1v51GYg/cbJRrww+TAUVt/dvcB29x48bPg3DX9r+JvUvh5NM?=
 =?us-ascii?Q?FKlcvjqQiIAxWIYUfnw+nrxtZyDGrL/iBJ0PLCEjAYW1iFuebPpxINZEwA9I?=
 =?us-ascii?Q?oqax7H5zqnMv2N/3yvLlV7/n4Krw403PhlGeGby5Tf/D1fJi/D/v6lntZfpv?=
 =?us-ascii?Q?tUA61oqgQ1epYZg3o7LQ/Qme23A6pZd04QVlCFo+D0r5caAY/aKxtdSEM0ey?=
 =?us-ascii?Q?PhtsiSdzKV6r3C9xEOzG/SoZElM2XxeZ0Y4boBjFVJQqyZuzDlgxB6u/K5Bx?=
 =?us-ascii?Q?o+SK3PYRrDKoZJSkMnOJNJ+2k6wKA+3TwbOrmkGrmb9DlUrmhoIGfliEKLyR?=
 =?us-ascii?Q?vBW75OwNL4ixp5Xwh0Bmwakn35UZXwdlx5pKvMCW4SVfodAp1vDVjnxL6RE5?=
 =?us-ascii?Q?4ZDin79IIZyXr1Q9wDVRLr1pxkS6syJp4wT2UZMmFL3yhmsI8/TSwoewBq/s?=
 =?us-ascii?Q?UW0kaUDy0fK5RwWAAYkE16WvKUQHlapi7tSDAbpGgWPYN9omFsx1mi1ehaYJ?=
 =?us-ascii?Q?opvOw0Zq8wCJgYzS7V3Tav3UiTbvkaQGxnvh2RyCe4jdtTcMO9/G/M6AsNGD?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 743905ea-7a8f-4174-4ce3-08dbfd93c250
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 17:32:06.7080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98NetwX8QA8Ijo0C93SqcRU47BcbkzIB9AirgUt3XpLpFZJujKdZ4lBSPla5ji82mBDiYUArutmejqqQUcru7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8246
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 11:43:04AM -0500, Rodrigo Vivi wrote:
> On Fri, Dec 15, 2023 at 10:45:41AM +0530, Karthik Poosa wrote:
> > Wait for gt reset to complete before returning from force_reset
> > sysfs call. Without this igt test freq_reset_multiple fails
> > sporadically in case xe_guc_pc is not started.
> 
> \o/ I knew I was missing something there. Thanks for finding that out.
> 
> > 
> > Testcase: igt@xe_guc_pc@freq_reset_multiple
> > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c         |  3 +++
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c | 10 ++++++++++
> >  drivers/gpu/drm/xe/xe_gt_types.h   |  3 +++
> >  3 files changed, 16 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index dfd9cf01a5d5..eb7552b6dfa5 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> >  
> >  	gt->tile = tile;
> >  	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
> > +	init_completion(&gt->reset_done);
> >  
> >  	return gt;
> >  }
> > @@ -647,6 +648,8 @@ static int gt_reset(struct xe_gt *gt)
> >  	xe_device_mem_access_put(gt_to_xe(gt));
> >  	XE_WARN_ON(err);
> >  
> > +	complete(&gt->reset_done);
> > +
> >  	xe_gt_info(gt, "reset done\n");
> >  
> >  	return 0;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index c4b67cf09f8f..49b30937a28b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -23,6 +23,8 @@
> >  #include "xe_uc_debugfs.h"
> >  #include "xe_wa.h"
> >  
> > +#define XE_GT_RESET_TIMEOUT_MS	(msecs_to_jiffies(5*1000))
> 
> 5s seems to much, but anyway, this is a debugfs function, so, no
> if 5s fail, then we do have bigger problems.
> 
> perhaps we could get the timeout as input?
> 
> anyway, it is better to have protected like this than the current
> racy one that we have.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

ops, let me tune down my over excitement here.
We need to address the feedback from Badal that was given at intel-gfx ml.

> 
> > +
> >  static struct xe_gt *node_to_gt(struct drm_info_node *node)
> >  {
> >  	return node->info_ent->data;
> > @@ -58,9 +60,17 @@ static int hw_engines(struct seq_file *m, void *data)
> >  static int force_reset(struct seq_file *m, void *data)
> >  {
> >  	struct xe_gt *gt = node_to_gt(m->private);
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	unsigned long timeout;
> >  
> >  	xe_gt_reset_async(gt);
> >  
> > +	timeout = wait_for_completion_timeout(&gt->reset_done, XE_GT_RESET_TIMEOUT_MS);
> > +	if (timeout == 0) {
> > +		drm_err(&xe->drm, "gt reset timed out");
> > +		return -ETIMEDOUT;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index f74684660475..6f2fb9e3cfea 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -358,6 +358,9 @@ struct xe_gt {
> >  		/** @oob: bitmap with active OOB workaroudns */
> >  		unsigned long *oob;
> >  	} wa_active;
> > +
> > +	/** @reset_done : Completion of GT reset */
> > +	struct completion reset_done;
> >  };
> >  
> >  #endif
> > -- 
> > 2.25.1
> > 
