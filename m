Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898AAE7D0A2
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 18:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE1C10E16B;
	Thu, 21 Sep 2023 18:37:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC3010E16B
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 18:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695321449; x=1726857449;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WPxDGLzR6mxHWXAGaPjhWYNflXrJnaq44meNJaXeWYc=;
 b=O80DfmnM4hl50quvpSErYuXAKdYmPkMj+19hj+YXRGFQ1koJVhm9L3+Q
 R2XcyJ5fp3eh3mlBh/M0oPugk69L0g3QImvDNBpeY4hRsnP1f77ZMsCxk
 DLAleUE1v8gDP60OxgP+Dfgf3kuimg2BBFI1jhMzllUmAGzGkN6EBp8nx
 2KKcB8WUK+ZO66JCLuhExrVIByP9msKVhlRcJwkLeJe9vV3lSMefUdZYC
 Jzuxnnc9332nkWcqXuIzVuaVS1guCNaJ+izUAm5u1zuC6sW6+y++jTPbJ
 p3itIjhIGNsg7RnGddrDM+zAiRXAxbEZVFKxPZRYRpmLEmeG/A8LKnFE/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="377916772"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="377916772"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 11:37:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="862605484"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="862605484"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 11:37:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 11:37:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 11:37:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 11:37:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Th/bsVuTrzwJktAMMaRklvtaiNQXGqHA+8UZm2FIT9n82nArORx4dusqFGg4sZvcQfC6sKcrHdtdet5foDmjAs9PaQCu6a25kI8rG+F/UXQDrT/9YcigGh/FAjz1yY5QgSZjEb7mimzTdj9KvGePFSEHZX0qvgZv2M8p0QcH6YhYBmPA1S6JJ/OEFIULAeEnQHdWFVXogUoQeDvVmQnFkBVDouSB8nysIF9kow2K+NlM3/aqUi2Fyj1vt+WWSShcio/J5jTjOFepof75kxPE7oAvhLhFVxFdjPbXdzE5zylpf8l2N0HkPVzMuNqKYLOtwKv6GIVxsl94pnQzVh3YUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XKhC6Qc+zIekCjCxl0PHuBjfZrOjZFZm+RFpAX0HxI=;
 b=HC+yrj43mtXxy6i4b200he37PtZmBV4E/UxCvfEU1VcA7yz9EOPci+cX62XLCn3z8tLymH+Wg3IZmh8dypOsFRM7uOkO26a9TkZVIOy2TeCysi21y32nH7HiLr+onYPjyFr1BcKbKlNSzfsFGnM+fInGY+zeYqYulOQlX51kXkT8uUOINrM7tOgMe0bUY0IPYUAHr0tbrj4QSCGnHE916e2kXvEWIjPYWVe96nPS51A9z8ecln/CFOBBN7pzIuN8gUuA2XWThtwx9rXtrpARv8pIX/ZNQp8T6sl4qAX0m7pb2etX2bMsoKuvfibDvESYMGExIlOhGhxlJdid/jjtJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV3PR11MB8457.namprd11.prod.outlook.com (2603:10b6:408:1b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Thu, 21 Sep
 2023 18:37:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Thu, 21 Sep 2023
 18:37:09 +0000
Date: Thu, 21 Sep 2023 14:37:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Message-ID: <ZQyNUexm787Qvoy1@intel.com>
References: <20230823050955.1226024-1-riana.tauro@intel.com>
 <20230823050955.1226024-3-riana.tauro@intel.com>
 <833fb5fd-2c95-08cf-5643-968dee6e5ca3@intel.com>
 <ZPDoLmBsGBONHKyx@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZPDoLmBsGBONHKyx@intel.com>
X-ClientProxiedBy: BYAPR08CA0050.namprd08.prod.outlook.com
 (2603:10b6:a03:117::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV3PR11MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: a9579eca-e877-47c5-842d-08dbbad1c383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tQuBEWpLxxYFY3Vx9kIk529K0Hfa37DTvA/Q+2p3js19enqFJFs0B/Hdatyq/XiRrwRWieLOdx/Yz6S5PcqdrtwCP07gyYB26xiVUbtcjz22gLy2DUkEFl93dEo4SsL+tXY3oCKKXQE4NrbUL4SS/biD70Mb35Bwc2fKU28hylyTQtHxJcMlzvp3sgXI0UCkrHQ73UKMs9dHNx9Dlo4vXmeDQqn6YQn/T9b73ibiNIpLeyyez1I5cBUjQOPg30P7s7yW/TLIwBwYn1crIqdPXmUrmSEqnYCZ2V0GMGGhypov8DcL4qOBV78Ga0/GT1mp0H38DBcDktLMzDk+CV630pl/Y/Dn4G7i6dszMTg443HzksAnDv00nCepwL2tmGrU8i5+aD7AJ00Xy0qpgQDGDevw2k3zS10JpQkqepc+yQ4V3WASnxpUysR/kBXm5O7f9i4Tb1/7xHDNao44SzC956YzHKhKkcdOzIZs6MAIm7nqns0EFBuzQ4WvvAxle6U34+DpmMRhQUPhTlNMNZS+rA84/q4LeWuSGxZXExubNeP5riw6ZxSMe81zMxRFks+tEgeSOkpa7zqESFIXyJ4WVh1wkwE/gJt3EW9TC1f7RYk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(1800799009)(451199024)(186009)(83380400001)(478600001)(6506007)(6486002)(53546011)(6666004)(8936002)(6512007)(44832011)(8676002)(2616005)(2906002)(37006003)(66946007)(6636002)(66556008)(66476007)(4326008)(316002)(41300700001)(26005)(5660300002)(36756003)(82960400001)(6862004)(38100700002)(86362001)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q22CnzA8uQSBDrOuViqmLXWxI/9oXtVYszWKOdU4YpAWkWl563gPXiFA+vjs?=
 =?us-ascii?Q?V+mNv+JDvIRmV5zp7OW86j6RbNgs3rY17w6dO5Ae9WtmW2jNWfX170OtJhI9?=
 =?us-ascii?Q?2qCUUxJkudaGHWA3ObuWeZn2dSsAZVHWBMPGkzWLDhFx379LW459wKAuVyUZ?=
 =?us-ascii?Q?+NUyW180i13VkLnsIc9ON92vBx4HJ91ZzqNaA79x7g0vwHPhdjoi0ufmxWED?=
 =?us-ascii?Q?l+AOh6xFUsGXLAn/Y9Ntt1lrGcIGHibAqRdG9WYguKVycYW+dBPLW74cRA6X?=
 =?us-ascii?Q?RYjFtwRrBctePgpB1F3JqMRhwTcHlpJQlZNCEH2yNMOe8iuHClCSJuC3C+eG?=
 =?us-ascii?Q?AiwxpwNXfW8gAg2ccN0GstoXdBpEwqfuJavbGAGC/DUQuJhkeQrYTtum9wD5?=
 =?us-ascii?Q?9gs7e4QXsYRAo0PkD06KXUeTcj49V1pSSyMR/Hrm5U98Yj+Wn0HokbbyMaMC?=
 =?us-ascii?Q?zVz3wdYqS2OOoFFIGKrgbv8Vlzn02EvWlFjcnOWS5+qzGIyXOsFjyOxhsfVX?=
 =?us-ascii?Q?eAX9bUS/XShg7T57SN01UCTgSPo0nIi5v82ZT1LXW2htT6I+QotFI17IqmYT?=
 =?us-ascii?Q?esczjHR8egtQEOj2gWEj/dM8mbRX9PaObXYbyohFY8XgFUZQe+8g6rEYqgoR?=
 =?us-ascii?Q?uJouPGCiEwt2I/Gvi4BCmTYCFhUyKW0pVxRn7xduj7juqgiPAKRkymF0YmFV?=
 =?us-ascii?Q?9Hb8ZGGjsyWzwrzYauSfEgLi/ry0jny2VaTwxplD6Ip6CfBQH3ozLBHGcAFF?=
 =?us-ascii?Q?ol/g06LSaXkAAPkQruQ/w/w+IzLqnU10sDV0UnDCnu/LIw4FidFbYJNMQ3IK?=
 =?us-ascii?Q?NyoMpAmZabduWhns8y57EBAEDxXUi9swR3/dWWP1ClZUvgrPOoiwlEu2LBg7?=
 =?us-ascii?Q?xwKvWctGsh9TUeukoq3vVcpYL7yWsBXavkASiRLC+G0z+SW6Hs1GXOHPqHVX?=
 =?us-ascii?Q?dXLMbKJCvRtSKhb7afLiW6EAj3FEwvchYrPoHBVZ9TjdhhkNES0Cm147wxMf?=
 =?us-ascii?Q?gsIPV8H3D/67olQn6A7PsJ2B7LRXEzS8M/Yt3n71T3xza5YeZ6VNdQzY6WIY?=
 =?us-ascii?Q?zfhLAqAW2hzaEXaCkwywF76ikk0+mWRwEKF4Qd1+ChE3Thn8I9EEFvgpuRwY?=
 =?us-ascii?Q?NGYj4tW6iqJdPT3Xv74n7Tiir1MN1s++zjrwFkHRuGg7TigUfWK2VYDMf16x?=
 =?us-ascii?Q?6UqyC8Af45DOVuVJ5gRS9biIuNr6Cm73DaBJA7v9zm1C56DMA6QNk9Xsr5ko?=
 =?us-ascii?Q?og0zXU0Py+VZxWX2+qZF8Y8SxwuyV4nNPZwU1HA+ygl1B2UvvlH2aV6Psgqg?=
 =?us-ascii?Q?POIZ51K2uYSn2/+l+WaamR+RZKNWJtvhl1dwSSaqnO2Wk571SB8Ud6KbbcKI?=
 =?us-ascii?Q?n/72XVn7R02GeZIMONHzh4oZLFpJP0u5+Nx9yEonaxscdfihdOnfsLV4eyRH?=
 =?us-ascii?Q?QUmu406d8jICz1ZnATohVrE6QuoerDwps5BN1lbZX0P0/L4/qbxHqDkaTy1z?=
 =?us-ascii?Q?yZlUmJGO2vVAyw7ScAbzlt2uS1A/HFARRIAk3VeKMPxpzIboGU1d3fUxEW5K?=
 =?us-ascii?Q?lbUSOE94sOx8mcyR81Ziyo3A4ys/b1zlh6qQFZiX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9579eca-e877-47c5-842d-08dbbad1c383
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 18:37:09.8190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6RwG/DNAoM28FndG/Xsu5j4RPWRjBAkFKEr4n8X02BBF89dp6yzM6wNlEj4qRTR9psUExNgc+sm0xcculeHiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8457
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] RFC drm/xe: Disable GuC CT communication
 for D3Hot Transition
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

On Thu, Aug 31, 2023 at 03:21:18PM -0400, Rodrigo Vivi wrote:
> On Thu, Aug 31, 2023 at 12:02:31PM -0700, Ceraolo Spurio, Daniele wrote:
> > 
> > 
> > On 8/22/2023 10:09 PM, Riana Tauro wrote:
> > > During Runtime suspend, GuC is reset for both D0->D3hot/D3Cold
> > > transistions. It is not necessary for GuC to reset for D0 -> D3hot,
> > > only enable/disable ctb communication.
> > > 
> > > Add a function that enables/disables CT communication when d3cold
> > > is not allowed.
> > > 
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > 
> > xe_gt_suspend and xe_gt_resume do more things than just resetting the GuC
> > (e.g. marking submission as disabled). Shouldn't we need at least some of
> > that in the runtime suspend/resume scenario as well?
> 
> I was asking myself the same thing...

I take it back. on the current flow, if we have a chance of receiving a command
submission we shouldn't allow the runtime suspend. so it should be totally safe
to leave it there.

Given the latency data Riana shared with me offline we can see around 60ms of
latency saved here.

I was also wondering about the overall package power savings difference here.
Did you checked that?

Only thing we need to change is that now we have the pmu in the suspend/resume
path and we probably want that on runtime variants as well.

Anyway, let's move forward with this.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> > 
> > Also, which paths and how much we're actually looking to optimize? Are we
> > interested in optimizing the full suspend as well?
> > To elaborate, we're not actually killing the GuC in the suspend flow, we're
> > just resetting its SW state (i.e. putting it back as if it had just been
> > loaded); the actual reset happens in the resume path in xe_uc_init_hw. If
> > the GuC and the LMEM have survived the suspend/resume flow, we could
> 
> On S3/S2idle/S4, GuC and LMEM will lose power.
> 
> > theoretically just restart the SW side of things (re-register the CTBs and
> > start SLPC) in the resume path instead of resetting and reloading the FW;
> > this would be a lesser benefit to the runtime path compared to what you're
> > proposing, but it could benefit the full resume path as well and it'd have
> > the added benefit of keeping the 2 paths the same. I'm not sure though if
> > the LMEM management could end up breaking this approach by moving the memory
> > around during suspend.
> 
> this memory movement is indeed the hardest part with all the locking...
> 
> > 
> > 
> > A couple of minor comments inline
> > 
> > > ---
> > >   drivers/gpu/drm/xe/xe_gt.c | 56 ++++++++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_gt.h |  2 ++
> > >   drivers/gpu/drm/xe/xe_pm.c | 10 +++++--
> > >   drivers/gpu/drm/xe/xe_uc.c | 18 ++++++++++++
> > >   drivers/gpu/drm/xe/xe_uc.h |  2 ++
> > >   5 files changed, 85 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index 13320af4ddd3..0d52621ce64d 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -676,6 +676,62 @@ int xe_gt_resume(struct xe_gt *gt)
> > >   	return err;
> > >   }
> > > +int xe_gt_runtime_suspend(struct xe_gt *gt)
> > > +{
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	int err;
> > > +
> > > +	if (xe->d3cold.allowed)
> > > +		return xe_gt_suspend(gt);
> > > +
> > > +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	err = xe_uc_disable_communication(&gt->uc);
> > > +	if (err)
> > > +		goto err_force_wake;
> > 
> > uc_stop() might already cover what's needed (or could be expanded to do so),
> > although unfortunately uc_start seems to not be matching and therefore not
> > usable as-is for the resume side.
> > 
> > > +
> > > +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> > > +	xe_gt_info(gt, "suspended\n");
> > > +
> > > +	return 0;
> > > +
> > > +err_force_wake:
> > > +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> > > +	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
> > > +
> > > +	return err;
> > > +}
> > > +
> > > +int xe_gt_runtime_resume(struct xe_gt *gt)
> > > +{
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	int err;
> > > +
> > > +	if (xe->d3cold.allowed)
> > > +		return xe_gt_resume(gt);
> > > +
> > > +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	err = xe_uc_resume(&gt->uc);
> > > +	if (err)
> > > +		goto err_force_wake;
> > > +
> > > +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> > > +	xe_gt_info(gt, "resumed\n");
> > > +
> > > +	return 0;
> > > +
> > > +err_force_wake:
> > > +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> > > +	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
> > > +
> > > +	return err;
> > > +}
> > > +
> > >   struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
> > >   				     enum xe_engine_class class,
> > >   				     u16 instance, bool logical)
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > > index caded203a8a0..e6574e51004f 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > > @@ -37,6 +37,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
> > >   void xe_gt_suspend_prepare(struct xe_gt *gt);
> > >   int xe_gt_suspend(struct xe_gt *gt);
> > >   int xe_gt_resume(struct xe_gt *gt);
> > > +int xe_gt_runtime_suspend(struct xe_gt *gt);
> > > +int xe_gt_runtime_resume(struct xe_gt *gt);
> > >   void xe_gt_reset_async(struct xe_gt *gt);
> > >   void xe_gt_sanitize(struct xe_gt *gt);
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index 0f06d8304e17..6bc01bb45fc2 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -245,7 +245,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> > >   	}
> > >   	for_each_gt(gt, xe, id) {
> > > -		err = xe_gt_suspend(gt);
> > > +		err = xe_gt_runtime_suspend(gt);
> > >   		if (err)
> > >   			goto out;
> > >   	}
> > > @@ -294,14 +294,18 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > >   	xe_irq_resume(xe);
> > > -	for_each_gt(gt, xe, id)
> > > -		xe_gt_resume(gt);
> > > +	for_each_gt(gt, xe, id) {
> > > +		err = xe_gt_runtime_resume(gt);
> > > +		if (err)
> > > +			goto out;
> > > +	}
> > >   	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
> > >   		err = xe_bo_restore_user(xe);
> > >   		if (err)
> > >   			goto out;
> > >   	}
> > > +
> > >   out:
> > >   	lock_map_release(&xe_device_mem_access_lockdep_map);
> > >   	xe_pm_write_callback_task(xe, NULL);
> > > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > > index addd6f2681b9..b5b53c8c3edb 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > @@ -216,6 +216,15 @@ static void uc_reset_wait(struct xe_uc *uc)
> > >   		goto again;
> > >   }
> > > +int xe_uc_disable_communication(struct xe_uc *uc)
> > > +{
> > > +	/* GuC submission not enabled, nothing to do */
> > > +	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> > > +		return 0;
> > > +
> > > +	return xe_guc_disable_communication(&uc->guc);
> > > +}
> > > +
> > >   int xe_uc_suspend(struct xe_uc *uc)
> > >   {
> > >   	int ret;
> > > @@ -232,3 +241,12 @@ int xe_uc_suspend(struct xe_uc *uc)
> > >   	return xe_guc_suspend(&uc->guc);
> > >   }
> > > +
> > > +int xe_uc_resume(struct xe_uc *uc)
> > 
> > This should be called runtime_resume.
> > 
> > Daniele
> > 
> > > +{
> > > +	/* GuC submission not enabled, nothing to do */
> > > +	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> > > +		return 0;
> > > +
> > > +	return xe_guc_enable_communication(&uc->guc);
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> > > index 42219b361df5..29bd692d8800 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc.h
> > > +++ b/drivers/gpu/drm/xe/xe_uc.h
> > > @@ -12,8 +12,10 @@ int xe_uc_init(struct xe_uc *uc);
> > >   int xe_uc_init_hwconfig(struct xe_uc *uc);
> > >   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
> > >   int xe_uc_init_hw(struct xe_uc *uc);
> > > +int xe_uc_disable_communication(struct xe_uc *uc);
> > >   void xe_uc_gucrc_disable(struct xe_uc *uc);
> > >   int xe_uc_reset_prepare(struct xe_uc *uc);
> > > +int xe_uc_resume(struct xe_uc *uc);
> > >   void xe_uc_stop_prepare(struct xe_uc *uc);
> > >   int xe_uc_stop(struct xe_uc *uc);
> > >   int xe_uc_start(struct xe_uc *uc);
> > 
