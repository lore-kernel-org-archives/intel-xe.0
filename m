Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6737CEB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 16:32:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1610A10E5DE;
	Thu, 20 Jul 2023 16:32:52 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3505510E5DE
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 16:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689870770; x=1721406770;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LfhSsFPhDizDxNnS8vl5EyTmO3AaCEU+0ccVR3UbEf0=;
 b=LJ+PoDTNbUz92YSRwnsg3bFyT0Ku22iMuQTzONDNcQWEQMZisgAjg+Cz
 1L0L3KuoiXtVfKZrwybKTYraiwdoAUrJ6HXFP2ushRM+PP8JjwKpolRAu
 xF8tVivyM3U4qEG9BXe2EC1O6cZv+I1CcKPvpBzTT4e/dQudsv8FNINHN
 PzT8gbMZdp1WNhbUP5XWDP1Ec7lNipyqw0+LOCn+y9m64DYxPpykxdRC1
 IhQ4d+4G7XVojL4sz1KEFkVHKJ56sSinDFW0kbj119OgySCDmh+9O706f
 2VB9jj+WmyqaaZGR0dksBLjAbv9EjDbtzl6x9tA0tZ8jQeaHykaPviozg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="356780130"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="356780130"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 09:32:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="759625702"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="759625702"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 20 Jul 2023 09:32:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 09:32:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 09:32:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 09:32:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+Te+vTXwVKnoq6bWqlsstNZd21m5QCNN2iM6XI0jubnoAKgn4pJ2p8HUtsPhtwi13MzcE5g4MbKkVr8SB5r959ELzBkSc949UZd3/G8Zrbjzx1NoazvxogoJCrdRSTf2U+g61vVod+UEdpjI0KGMsl31gFCtisFm+1pEuiZKvUvS7DLn6kpuuDvrQvE2PRYA95mAUhh9AawKwihMvn3ybLOjY143092Hl5qHEEXvyvd0MwwD+dqONaWHcBt/zX9PaI+VHNPFgJV/qNWMnE5kB5dBVNEuIGgrE10UwxtAvCtIlxOdLMAyKhfrIJ/9xL7Tv8rvr7muSZXPhlQ/+epyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPUOjBE8R9JZQCy9Kqs9VRt/sdvfURw1KIPagun620I=;
 b=FbidhaqhSvw3XG26NPfm0z9pbo7WgDp5VDBdk7ac1S5OYx4Kd3xmqL/YNv/c9c3OcaI0PDubQNDPpBn8G5VuO5k56xiYJN4xVD6mCyiR+uECi7HhuNO8DAMR1Fqfad7YSs22URjhZDoKMGcOBYMsPsEJVcjTBPgsnASqHyRvFDA8HAH2mYQLu8r1bmug9OPbn0UNAwS5JNAE80/5Ck9lKl2tjFtWQgRNKe9wJ8rEo+cGtRBz+m7wExwiWEo/IlI9qjh3BvmBNQII4wbYt2ugBSdGXIdLuYdlwR86kxM4FsxKnjnsliwqmEhJzVtqdmR0O4OJwpuKNErHTF7zLYsCSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8416.namprd11.prod.outlook.com (2603:10b6:610:17f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 16:32:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 16:32:43 +0000
Date: Thu, 20 Jul 2023 12:32:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Message-ID: <ZLlhp1t9q9BeHRJ+@intel.com>
References: <20230718133216.3079521-1-himal.prasad.ghimiray@intel.com>
 <20230718133216.3079521-2-himal.prasad.ghimiray@intel.com>
 <20230718235250.GL138014@mdroper-desk1.amr.corp.intel.com>
 <MW4PR11MB7056C4F7A20F8995CC5D3207B339A@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <MW4PR11MB7056C4F7A20F8995CC5D3207B339A@MW4PR11MB7056.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac6bb93-4c00-4868-fab5-08db893ef140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uuoD2ePeTkPYJRMzBakfYnuGErZ531uCprG1r7J7Qshh0mEJAHB/Ezwc+uPg72NmibeUD/cZXobqZUB5b3zaWND3B1THgjgSJvGJBI072M85cOieZoJTfi5jkZU/hDEmqRWSFq+ZRtcJN7qGRq89wCztyEo9tkeXXnpGD1UTmqXbzv3XeW/e3Lvv4KXGBtPYXDCHJRd0rkDn/N9AEVF+UmJOve0Ju6JLMrnlRN4v513+6zBlW4PQ3jtDbNCA+UTEhkcjGvGh0Ttib66EuC7+A4WGzoUi/FdL0+fWs51oYiL1JD0nSqfgQUtl25XiuszLHYvM/UQohaRKpt3Shj+PPuxA2zXt4ypDLQHR6YJkyLYc4w7jUzNVSJOl482qFSKOfmEam35Qztxgogo6/v9p3x+UVVmrmIankSvH+B3n8ByAiePud1SAi3Q7KU6C6XeB65NPx5jF1XSTXZ8RuxBEb8K610b7G6MIm1VsgkCd/YfYYk91sLAlHHg6XuM6zPQMkzwHlSKvi4G6vJNGQQ5/3qMMyW19G9GuHiwn+9JaKFI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199021)(6506007)(6512007)(6666004)(41300700001)(6486002)(966005)(44832011)(53546011)(37006003)(54906003)(26005)(186003)(6636002)(316002)(5660300002)(66556008)(66946007)(66476007)(4326008)(86362001)(6862004)(8676002)(8936002)(36756003)(478600001)(2906002)(2616005)(83380400001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eNUiqVmz1Sh7Tcb3kmwNmkypWB6Nfb2FXCI88pZrtPPsjZn8t/LDW4tJe3wm?=
 =?us-ascii?Q?AssAe3JP2qicNuUx3/zwUY9wRJ7Uue+Z/B7DAJCecax0EZsTBGRvP6nmCYRj?=
 =?us-ascii?Q?un4rAukC5OIAlozB50n/laYfPuo8Spw3sihtIrgvOIUb0CfRWqIU8qPqP9S1?=
 =?us-ascii?Q?DvpcGWgKY7dMDOng/Bjqb+AAIELQU92jxKqNniUVCJynI54H/l12UiiFs/KV?=
 =?us-ascii?Q?uYK3V4tzzCKwoc3crYC2nj0XnTNg9L+6iU3JS6qts06RP35RtjnDpySRqkdx?=
 =?us-ascii?Q?ziTKWG+7MVZ+vN/sFTSQuiT2hz7lcrwlpwT2xnKQ6IpbWfbDCo0URlBIuHZe?=
 =?us-ascii?Q?NUTFZ+kH/c/h6gb7qZ9WjUEskCbkfNiQHBagHMb3CeY/3lHw7/xk+h94BWyf?=
 =?us-ascii?Q?kJzRlbCkfUBngokOJqksea4R7CCGVQCZlE/Oav4iIBSLaNdoBeq8Ij0G8tKl?=
 =?us-ascii?Q?0KtrglpNoKT4agwik/p/2TPgBjbh3g8b2c0xeq9FwthM3BKcaqvpFxp8I7pg?=
 =?us-ascii?Q?+gCkDGta643sTYY7faIaWNcIRJu52Et3D3oRixZWQ4VMAaBtdsizlxF0DPIp?=
 =?us-ascii?Q?Cb9xTIlG7v2slOgqTZznWPKE6IgddT8Y9dcVv0Xr9w9LeRJurYkz65i9Yo1P?=
 =?us-ascii?Q?Ju0tl5MtheL+EWHHP5SFh65iE5OQuRp0h8stTqdQifUYDIwmRf4r8DdYWKAr?=
 =?us-ascii?Q?XLa9+8m2nzOyFAVBIsjE7MYc9SqsihUNrLCp22r2yFFQ4wSU/vgbJk2l9/7e?=
 =?us-ascii?Q?eGe1BdzE2iY/KBoB29dwI3vJIYJg6BeCQH1sFG049T50AJCuBUXk9J0tcPp1?=
 =?us-ascii?Q?Xf3IBtC9/lZ3zvmTMz8RvRhBC7u63GXr25xArKzcS5+QbI9sHLMMJmhACK/5?=
 =?us-ascii?Q?Ul1aSEpooaTxw1i9YcIzZgDrODBNvJjL12wsh0SAqIWBGO133aEe3ypFZ1rl?=
 =?us-ascii?Q?WCESRKo3bQpJ9bX2pR71qicYJXnYLwKbwGTcsY4u59oylwT7v4WBkSbjbR52?=
 =?us-ascii?Q?8t7uEG0C8qiv80cIQQMBxJkNnW4XQUP72KZNipqMj+EwUSzoAHjXda4nQLPe?=
 =?us-ascii?Q?SzVs5cyThUT3x9NAI2j1o7ONfWxGP/ye+H0kNcWcUr8N8s8+RU1RBi6b8onu?=
 =?us-ascii?Q?xJ8Yp1u/JN7MPHEg0Y+MWA8wqAjmVWopK9JDU5jXeS84VmrMNdQTBTEH8HHx?=
 =?us-ascii?Q?h0myWtWF3CM3T3pEqNt08/vV7P49FvJ7MgN0WhW8izSFXtLfE5qqzJABhnLB?=
 =?us-ascii?Q?o8r/yi/q/wm+rTR8XrdE4mp5vLxyNkLftmlCnSmgVOP71TDaSPlVzdW9GKby?=
 =?us-ascii?Q?iAC9+5M3WNlzLZYDKgne6mBwq8triWGKCngCYtt1ayRhlx9fj5NylMX7UkyV?=
 =?us-ascii?Q?taMDusfPIPnH2Hl2LAXkdYelxuQgAkYkGAImgk3Jr8F++AaA1UnEIZNYzwaj?=
 =?us-ascii?Q?Bx8RLowzdyV8SomK1H+IjAOQT+G8bd40gjEVKdKJ0dfSz7IzPG3y7JGlsVt5?=
 =?us-ascii?Q?B2YgksWQEfFaw76dHMBGaP9lCKohBz2hjjY1kUVKHvm46ETsxaqdwlIVAWN7?=
 =?us-ascii?Q?mNT36A5XK0Oez9LCovNXX7hrWgUOZNTNBrGdgeFVtH8JcimAdZeKWAWRawQ8?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac6bb93-4c00-4868-fab5-08db893ef140
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 16:32:43.6576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hK4VSehHm0v9NCnyVzebnTA6AOufe4d1wW+6a52cMdKDkp0IH2p0ulM9gYaOEk7GKSFYthIbxEWEGOHMe8Y7qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8416
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 1/2] drm/xe: Notify Userspace when gt
 reset fails
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 01:51:37AM +0000, Ghimiray, Himal Prasad wrote:
> Hi Matt,
> 
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: 19 July 2023 05:23
> > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Subject: Re: [Intel-xe] [PATCH v5 1/2] drm/xe: Notify Userspace when gt reset
> > fails
> > 
> > On Tue, Jul 18, 2023 at 07:02:15PM +0530, Himal Prasad Ghimiray wrote:
> > > Send uevent in case of gt reset failure. This intimation can be used
> > > by userspace monitoring tool to do the device level reset/reboot when
> > > GT reset fails. udevadm can be used to monitor the uevents.
> > 
> > This seems a bit questionable.  In theory a GT reset shouldn't fail; if it does it
> > either means we've either got a major software bug or a really catastrophic
> > hardware failure.  Letting the kernel driver just blindly move forward after
> > reporting a uevent doesn't seem like a proper response to a huge problem
> > like that.  Relying on userspace to pick up the pieces seems insufficient.
> > 
> > Right now the return code from gt_reset() is just ignored and no meaningful
> > action is taken within the driver.  It seems like we should at least be putting
> > the device into some kind of 'unusable' state (similar to i915's 'wedged') so
> > that other parts of the driver know that everything is completely broken and
> > that they should stop trying to use the device (or some subset of the device).
> > We could also potentially attempt recovery ourselves by escalating to a
> > DriverFLR.
> 
> Agreed. These feature needs to be there in the driver.

indeed. one possibility is to remove the drm card but keep the pci up waiting
for the reset. Another is to 'wedge' like i915.

> 
> > 
> > I'm not sure why any userspace would ever care about the specific condition
> > of "gt reset failed" --- it seems like it would pretty much only care about the
> > device being in one of three states and wouldn't care about the driver-
> > internal details about how/why it's in one of
> > those:
> > 
> >  * Everything is good; can use device as normal
> >  * Device partially broken; it's no longer possible to use these
> >    specific GTs, engines, etc., but other units should still function as
> >    expected.
> >  * Absolutely everything is broken and nothing works.  You _might_ be
> >    able to unload the driver, issue a PCI FLR, and reload the driver,
> >    but otherwise all hope is lost and the device cannot be used anymore.
> > 
> > Even if we decide that some uevent is appropriate here, this is new uapi and
> > will need a real userspace consumer too.  The fact that we can watch any
> > uevents raised by the device with udevadm doesn't seem like it would be
> > sufficient for that purpose; that doesn't feel much different than claiming
> > 'cat' as the userspace consumer of a sysfs node or something.
> > What we really need for new uapi is a meaningful top-to-bottom solution
> > that gives us confidence that we have an appropriate and maintainable
> > interface defined.
> 
> https://spec.oneapi.io/level-zero/latest/sysman/api.html#_CPPv441ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIRED is the consumer for this uapi.
> The application can register for events ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIRED with Sysman and start listening to this event.
> Then Sysman would send ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIRED event to application, incase sysman recieves uevent "RESET_FAILED=1" or "RESET_REQUIRED=1" or if Sysman detects a repair have occurred.
> 
> Then after getting ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIRED event application could query zesDeviceGetState  to get the reason of RESET. And Sysman would tell the reason of reset as :
> ZES_RESET_REASON_FLAG_WEDGED: Sysman would try to create a context and if context creation fails due to EIO error, then device is determined to be wedged and reset reason is declared as WEDGED
> 
> And sysman triggers a SBR to reset the device.

yeap, this is already good by itself, even independent of that mode.

But we need to think about the possibility of removing the drm card above.
Maybe it would be better to add the uevent at the pci level rather then
the drm.
And maybe with a general device_status= variable.

+Joonas

> 
> BR
> Himal
> > 
> > 
> > Matt
> > 
> > >
> > > v2:
> > > -Add NULL check for xe_gt_hw_engine return(Aravind) -Arrange variables
> > > in Christmas tree order(Tejas) -Check GUC_GSC_OTHER_CLASS(Tejas)
> > >
> > > v3:
> > > - Rebase
> > > - Remove notification for engine reset failure (Rodrigo)
> > >
> > > v4
> > > - Rectify the comments in header file.
> > >
> > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt.c | 18 ++++++++++++++++++
> > > include/uapi/drm/xe_drm.h  |  8 ++++++++
> > >  2 files changed, 26 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index a21d44bfe9e8..1db4d610f2fd 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -8,6 +8,7 @@
> > >  #include <linux/minmax.h>
> > >
> > >  #include <drm/drm_managed.h>
> > > +#include <drm/xe_drm.h>
> > >
> > >  #include "regs/xe_gt_regs.h"
> > >  #include "xe_bb.h"
> > > @@ -500,6 +501,20 @@ static int do_gt_restart(struct xe_gt *gt)
> > >  	return 0;
> > >  }
> > >
> > > +static void xe_uevent_gt_reset_failure(struct xe_device *xe, u8 id) {
> > > +	char *reset_event[5];
> > > +
> > > +	reset_event[0] = XE_RESET_FAILED_UEVENT "=1";
> > > +	reset_event[1] = "RESET_ENABLED=1";
> > > +	reset_event[2] = "RESET_UNIT=gt";
> > > +	reset_event[3] = kasprintf(GFP_KERNEL, "RESET_ID=%d", id);
> > > +	reset_event[4] = NULL;
> > > +	kobject_uevent_env(&xe->drm.primary->kdev->kobj, KOBJ_CHANGE,
> > > +reset_event);
> > > +
> > > +	kfree(reset_event[3]);
> > > +}
> > > +
> > >  static int gt_reset(struct xe_gt *gt)  {
> > >  	int err;
> > > @@ -549,6 +564,9 @@ static int gt_reset(struct xe_gt *gt)
> > >  	xe_device_mem_access_put(gt_to_xe(gt));
> > >  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> > >
> > > +	/* Notify userspace about gt reset failure */
> > > +	xe_uevent_gt_reset_failure(gt_to_xe(gt), gt->info.id);
> > > +
> > >  	return err;
> > >  }
> > >
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 347351a8f618..c28bb54812e5 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -16,6 +16,14 @@ extern "C" {
> > >   * subject to backwards-compatibility constraints.
> > >   */
> > >
> > > +/*
> > > + * Uevents generated by xe on it's device node.
> > > + *
> > > + * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset
> > > + * gt fails. The value supplied with the event is always 1.
> > > + */
> > > +#define XE_RESET_FAILED_UEVENT "RESET_FAILED"
> > > +
> > >  /**
> > >   * struct xe_user_extension - Base class for defining a chain of extensions
> > >   *
> > > --
> > > 2.25.1
> > >
> > 
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
