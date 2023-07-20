Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84351EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 12:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B2510E0F1;
	Thu, 20 Jul 2023 12:01:24 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6002010E0F1
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 12:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689854482; x=1721390482;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M3NtfDAS1wcA21j4yT2wlTZdzqWdCwbbq3vMgdaW65A=;
 b=FG3LplKZ/1XNLPvlAKZfWvOKFVtVBDoF7OchiqlZeB4H82aopcqaDXzi
 jlN7b3VF5ZDBaujDTGOJoYech3mO5U+GfuuSGUo1qFPh8y7cXUimiHrcY
 R9/mSqTvg39XmOtCfQdLNoDb+YeNW39D0UvVD1E68CVPlVFf6Lx8ZBJKi
 cd212PQ8x1qZ7cqNv7F9Rs5E5juuild20/56a/R8W9vj5UeNVFxHszjCa
 rTgHM/uozfNQ14/ptLEBX3by2AjPnCdDUNX2OJ89xFeV0M1NLXvU/znqf
 ae/LKs4/uPpmFWV3ftptwCjcuSo4AeqQj6dO0MMsmFPS6VBCFLaLk5U5C g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="365595856"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="365595856"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 05:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="794455823"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="794455823"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 20 Jul 2023 05:01:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 05:01:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 05:01:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 05:01:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 05:01:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIO1PxNRXBELV4tBf/CUpxKFpn3JPMP+6n/wKpKdlrbblCfmdSg9qrgsslTlpfA2kYZB1gFHR2VnO1LfZVj0u4/EAL0eSycN4PBo9dnlvloNmxWTpkO/Xrg27jJ7NGgLYiGcyBzqym1on7UDqkizPEzEroPtS1zUwaR/u7C7yqLWRSL/siQWr4Q4Lq1WgD9Woc6CqMqxOtQREbXFpEPEAskz55MaN+FkpgzqNOjlGREqEYsauoKwzL32q5tubDuVvDpd5gNZeYIwmPTbQ4qf7F49i91mT58rUhFrDpJybsdgz183zXuGixuOLXmeetdrBv8T6qVEbKHWyej3Pib33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGURoiejrKybLTXMS9KClNT9j3CR1s6PhyCkHx3/Sr4=;
 b=S5UnXMdH8vRJCSOvveLdQBdSF+vfj5YLbzx7kRFIMiWhnpyaSh6T6GCNTJKn9R/pgg8MAPFC+IIFIBWowVdMHQrhHSK/W4T0laP9JJ/AUiXW1O5qYUNvZG9lRfzlBYLafm7DkT83VoCyX0f38qi0JjEM5YyWAVJvyrRIIiG+hYWFyHWqCXvTDUUpeSXIHfMqZYhmONlZ8wQ6NKKm2HgB3xTLb/zNcUP6+3i843qCdEG5ElUKf4JoKhuSgRunuXkCziR5765ghvX8Z8FcOpo38iqwSO4IDrZHVuQeCqsfyN7/uSXZCDjaXHUIo0AEvkiz36hzckB0T7ifssDheqjsSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8375.namprd11.prod.outlook.com (2603:10b6:806:38b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 12:01:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 12:01:10 +0000
Date: Thu, 20 Jul 2023 08:01:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZLkiAmNuvjdUi+09@intel.com>
References: <20230719192726.172056-1-rodrigo.vivi@intel.com>
 <2ed513ec-3a3f-1795-2761-ad1d39bb6a09@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2ed513ec-3a3f-1795-2761-ad1d39bb6a09@intel.com>
X-ClientProxiedBy: SJ0PR05CA0150.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd48a4c-4856-4f95-416d-08db891901e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gaFIlXvJcBQ+XJON6eXTLNX9bwaDKGQW31sRQYd4eZNIGnuu9S7alWr40OfVm+0EWn7KpcFzegf55puWYBcxvVQTik9OV5vdNXOZ5b7TKtmuF+LVs0E6tck+7Lj6Mr6WG9Af6vxoqXl7clbbrqTT1xkrWSNpskFMs5Wpy9tNVdlLTu0hr3NSfhbrxsPnJTVkNVX63OBMTqo4Xi0OPqCS6n6PykJgyD7zds0ZGux/oudnmdWpw3xJrgHkR8ibPq5WNDYeAdKYIE3OQPFz02rCSS6qEQLLjDd+HDMMchiB5Vx8hEO4FkCozinFGUtvKNFgwEqoL14CPVjOXYSBfZCoNgds55W/lnLh+ErSu+Z3aEMNbbPl4TRezTUZr+sp+Uzc+anjK9p2afDu+Vg5IgArRATopXIdnfsWPfA+B8Q5raWCYeZHPvlhERWpBDMif8hQkPC/EOZWM4AOksaaiOWXE/4HkI17aWWNgVP+lDfng02PAKEzDLSh9ENSKQF9EUdYXzWaAH9uFYl2C+DTTH991B0oBr1HrVlDLtRMRZ13C4Q7/+gKIZnFPuusJyvu9JKdHsr0nEqviZch+DuHpHmbjrjfTXYY0k0GsAT+MoLxPzE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199021)(66946007)(6512007)(66556008)(6666004)(6486002)(66476007)(2906002)(53546011)(8936002)(6862004)(316002)(6636002)(8676002)(4326008)(36756003)(5660300002)(82960400001)(44832011)(6506007)(2616005)(38100700002)(26005)(186003)(41300700001)(86362001)(478600001)(83380400001)(37006003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YeUHqQzYC9gDs+Io1PDsyklecn2hlu1M1OJmMz0mVeMEsndolXPmtLVp9yuZ?=
 =?us-ascii?Q?9njDnR+HJ34q9E3Ef2flRnSHC6kESMjxdwjFmRvuBvA6V7XYFK1Hx1TDmszR?=
 =?us-ascii?Q?HarxjE7Cw/0a9JrTsNxUjCxCQCjedCdSsIPaMnm8mRnaUiFxONYriCxdNGMG?=
 =?us-ascii?Q?C3PKJEBgM6XPAIOP/pAx+Zh08fwVC8DGebPOCr6STA6OzujEy96qYrcPicjp?=
 =?us-ascii?Q?Fr6B8++q1roZhtLzOF994RFnp48anmZo+HlYzhTqHfImAcgYGyqEw5bH1B0S?=
 =?us-ascii?Q?iTyzmWLtnoierNt5tPA7jIVNuYUNLV39l2gWmNBqiicNnQQJkY6UvBVcW/sE?=
 =?us-ascii?Q?byoaxoX73nyt5LU0DxtavHPYCzIqiJqjjQn1wmQcYmDpzxQYvkvtXhVj/bRR?=
 =?us-ascii?Q?jyYq6WfkhFZ/mfoI+UB4oYjFZzOGXPuJmaPUEtXlravWDDlTKvV9uNPXqN4E?=
 =?us-ascii?Q?c8kT29XRuQtPlxPo5Enq7X5D+fFIfqnWUaJkQoqh6usDQeabknojIqSmIuA9?=
 =?us-ascii?Q?1HEGC3L1S9p4K9Ibvy5fYilb6ds8hSQDoH9l1dApK38KEx1J8JRHEVEFYAL+?=
 =?us-ascii?Q?OKfTsm2epxhW/TELtuxcb4yex8hA50v/oVWnYAfjYBZOGdmPWJI7H/nxiViV?=
 =?us-ascii?Q?9IwiBxfEcrpCVXVdTBivF5vp4b1iwgFy8SbcFW6FWPgSfGdVFgh7dhy3uEnY?=
 =?us-ascii?Q?Y37ZPnYuFX50pJQPX1xkZzlchaF3rkcg7g5IRAoSmEejOgpq44ml1cMajjF3?=
 =?us-ascii?Q?so6Nv6pmomLEA375IQhAFxrA3mA/nK7yHTrljl2iRuhp4EytOHEYq2rVB/N2?=
 =?us-ascii?Q?lXTGcfx4tFbrA/HieCLBw9hfRi6C++3kQmoEZ9JNU2qaE60aqgcnGoellzSI?=
 =?us-ascii?Q?p+T+etwEDlJOob/iT0cQ2H8yCPAXMJXnFKnhTdcZKcIBUtb1MgSL8BRi42Ue?=
 =?us-ascii?Q?DY+sBw+gySXtqsSngONj2+hwqdUQmGdyCUwGlkPZ7zL+MLA8sInvsU5kYujg?=
 =?us-ascii?Q?dGDRMAQOLkInmWnK0X6T/iRgVIGh6/cUthur/FpRPJBoB556790Z6JF0hy/c?=
 =?us-ascii?Q?Kxy1V0F/FXHfKbVWFD/kPROAs3XReIXolCTSPyPZLnG+TPNohVDNYJAMQRdF?=
 =?us-ascii?Q?rsfA1K/EzFvLmsF/oYvhExnNyJ5gaRcT6ncrGqKwAwCbgwbL5leoOx1SflKk?=
 =?us-ascii?Q?U9kBB/4pauWe8bVBYvdNg8HcRGOE/LA+syaxAAkumyeDkffA6cP+4HkRrCD9?=
 =?us-ascii?Q?DQFMqupJCQkiYtP6O9CFdzuy3WPNfWLuS0+hfDDHr5uLsIX5KOraYrn7r6Vh?=
 =?us-ascii?Q?DzQdLsNnawVzZcUvudPtRoNY9dEdPhH+QDhqnaKzpuFoLm9kOQS4a6na81GS?=
 =?us-ascii?Q?n2oWSYgjI1UOgybGjChK6OZK2Cbdyrni5wMHJlDvwnPsX3ZCfTF+Q7l5czeE?=
 =?us-ascii?Q?Nwna+Ibvz3R+nQh3ccpTFuzOht1hORSRMqyuUkqgfgS/+jxzuR/7s+Y8lGC9?=
 =?us-ascii?Q?5iXvUg5BJmZLqz4UfWYqy52i+dthCDWMpWqR7cH/HYR42AV4nZVBwPKlaxJh?=
 =?us-ascii?Q?hOZErVQFVkcxDmtqX13JVSdmQodDQBRL7dTjUEh2Mj+geWVpqqCY3twWaXn9?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd48a4c-4856-4f95-416d-08db891901e1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 12:01:10.5270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1e/y752IVB6xAq+/pr1qgq9QeDBg9qMAXTH+w/sq2b4RUHHjzJNHcYweowfymd5qUycQ2sMT4IkUwZjk+iSOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8375
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix an invalid locking wait context
 bug
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

On Thu, Jul 20, 2023 at 10:11:00AM +0100, Matthew Auld wrote:
> On 19/07/2023 20:27, Rodrigo Vivi wrote:
> > xe_irq_{suspend,resume} were incorrectly using the xe->irq.lock.
> > 
> > The lock was created to protect the gt irq handlers, and not
> > the irq.enabled. Since suspend/resume and other places touching
> > irq.enabled are already serialized they don't need protection.
> > (see other irq.enabled accesses).
> > 
> > Then with this spin lock around xe_irq_reset, we will end up
> > calling the intel_display_power_is_enabled() function, and
> > that needs a mutex lock. Hence causing the undesired
> > "[ BUG: Invalid wait context ]"
> > 
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_irq.c | 5 -----
> >   1 file changed, 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > index eae190cb0969..df01af780a57 100644
> > --- a/drivers/gpu/drm/xe/xe_irq.c
> > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > @@ -574,10 +574,8 @@ void xe_irq_shutdown(struct xe_device *xe)
> >   void xe_irq_suspend(struct xe_device *xe)
> >   {
> > -	spin_lock_irq(&xe->irq.lock);
> >   	xe->irq.enabled = false;
> >   	xe_irq_reset(xe);
> > -	spin_unlock_irq(&xe->irq.lock);
> 
> Do we not need something like:
> 
> spin_lock_irq(&xe->irq.lock);
> xe->irq.enabled = false; /* no new irqs */
> spin_unlock_irq(&xe->irq.lock);
> 
> synchronize_irq(...); /* flush irqs */
> xe_irq_reset(); /* turn off irqs */
> ....
> 
> And then at the start of the irq handler:
> 
> spin_lock_irq(&xe->irq.lock);
> if (!xe->irq.enabled) {
>     spin_unlock_irq(&xe->irq.lock);
>     return ....;
> }
> 
> Or did something happen prior to xe_irq_suspend() to ensure proper
> serialisation with irq and the above steps are not really needed?

the suspend and resume calls should be serialized by itself, no?!

no other place touching or inspecting irq.enable uses this lock
anyway, since it was created to serialize the gt_handler.

> 
> >   }
> >   void xe_irq_resume(struct xe_device *xe)
> > @@ -585,13 +583,10 @@ void xe_irq_resume(struct xe_device *xe)
> >   	struct xe_gt *gt;
> >   	int id;
> > -	spin_lock_irq(&xe->irq.lock);
> >   	xe->irq.enabled = true;
> >   	xe_irq_reset(xe);
> >   	xe_irq_postinstall(xe);
> >   	for_each_gt(gt, xe, id)
> >   		xe_irq_enable_hwe(gt);
> > -
> > -	spin_unlock_irq(&xe->irq.lock);
> >   }
