Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D096C83F3D
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 19:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278A510E6CF;
	Thu, 31 Aug 2023 19:21:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF1810E6CC
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 19:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693509692; x=1725045692;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D3eBhFuEpKWVs/T3ZkYIHKfqRfLfOuSMjxz/edfCfVE=;
 b=iXvtKYQoNnnZ4nN4SItroDyZu5uWHda6iZzuyCTh03ZifZPp8Kh9M7j4
 HFbHg1Meky7kvg27J3r8TEW4F+XcQpJYN0rojB7TjG8moHH2Ad4luX2g1
 sx0FrXs6bkttqP7qN8pwWeGGtV1qSSAmzWhMBsdKgvMU+oyzdjKAE1rRA
 2DkYdH+9DUEFsVukuHNKCG5B7JsZAdAJFsqb9AxQPO/KWi5ELAySyfWHQ
 WhVuNThzLQREo/vHYHbQszl/oGwql86E33T1j9a0i0NULt+nG5tGLGiM6
 tpNy/EmRRgbMQWI0WWzraXd0J2SNPTHEfLquMPxiQt+J3//9um+nDXTcH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="440028233"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="440028233"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 12:21:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070438244"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="1070438244"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 12:21:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 12:21:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 12:21:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 12:21:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPrg+VIZjyrFC1twm3kD1PFqrt4RA91NbHuQc/nEWBv+DDJBsLXxu56nNpelS9JA/yACxTk2hXFuknNilM9nq3jdp8RPF5GVWnXAfr7r14B8LfJOGkf8oab41gpI77hpDteSU82tqj65iAoVM1K1A1WVrY3D8hx3Agt2bGnLN0SwAvp/2j33xL1B//cH9cgRpgYqzC3VgqTdFFPVH70FE09KYeZyhRHJjBV23E+ZE9pL2VT/V++cL1HanQzbgpRyT6KFbfxia9ZVwaDYISAksPKt4W1RG8yD2SliNHHag/UzuLk0SdrM5fqGZ4wvvcuATQnAuPB0I1dV4BpIAIqwtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFgZSxDze1j7Y9J5a7J00qd21xwBYefg5LDO1Q9VVkE=;
 b=T0yht4qtytH9WlsTIg3xmFZibxKz2CT1AwYG5bs0KYb6HY/RF61yPB7b2/saqvViJp5dup4Cc8jtgmF2Ph+fg3gheyBF7XNbse0LyFX/SoClali4jvH5Q6bU6ioRe/iUC7INvLsSXHt8XeLEv5lSx8OGvIkFbSPKFzWejkqUaQYKvTIjFK5UJu1tgpV6Q6G4hAESBz+VnAOI8Pxc08S1briKOfzPQ5YirUCwTx77VGL4vkk02ynGuMbgkTD0sVtaFKAH9DIaF9fbObd1+f0er9mQVs5Zr38uwI2tIc3Zn7DLWU8JLMaxFHznA/91WMoOVePw5eVhtMBSBOtaOq6i8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4871.namprd11.prod.outlook.com (2603:10b6:510:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 19:21:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 19:21:22 +0000
Date: Thu, 31 Aug 2023 15:21:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Message-ID: <ZPDoLmBsGBONHKyx@intel.com>
References: <20230823050955.1226024-1-riana.tauro@intel.com>
 <20230823050955.1226024-3-riana.tauro@intel.com>
 <833fb5fd-2c95-08cf-5643-968dee6e5ca3@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <833fb5fd-2c95-08cf-5643-968dee6e5ca3@intel.com>
X-ClientProxiedBy: BY5PR17CA0006.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4871:EE_
X-MS-Office365-Filtering-Correlation-Id: 1866d3eb-7e63-49c9-6645-08dbaa577606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zJyUBJMlzNJX0cKabv3LFJTQI8L7E+lfVresUA7PNOVvySymYE8UiQoZ+wVWywrP1GTM0jQ0tn9fyL7B6T7RXWFV56hnBjPk+OsJO5rFRZG3ifnHKzVQsA5klI8lwCeJLYl7XxnSTcJOMfDdi/fm58hSFSHb72Mjy6IbwbLPirEqSgKdzYTsEiYaK1jpa8VAP12JuwMdlyxWdZq0bqETK8Pd9p00hYwzRz6/O1i5u8TvO5zG5LczQ+nZXN+28CiV4fwzdQTHlug9uI6yPloZHCpSztHN227VYRJ5MdeCrPJXqMMTtjsLmLVCM4LrixgtrJNIvvL2BdVcW9h8HHEc4BG8HAjh72iigftRKO2OsBKj+AzK/+p8LK/dsERcnKGV1VKaelQYMXrdWTeGBQR9KSj9N459dyVhIzby7yUgiZLm2q1WkCTx70jE25G3nJituPdETRC4isU9v1TkyC4qih77OQWoHnXH3gGlLR7hzLz6CoGP7aHJxYHsejR7wnUPmi/cKeMUa3tVBRfQFtp8YX+Sry9UclV3gVISrJiBCPV8MpdRZ1E249bE4qTgqbQdB6RT/xf0GaO0V/ggFIkjhumFeE0QmILgofBCHZ9lYXQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199024)(1800799009)(186009)(8936002)(6486002)(6506007)(6666004)(6512007)(4326008)(38100700002)(36756003)(86362001)(82960400001)(2906002)(107886003)(8676002)(26005)(53546011)(83380400001)(478600001)(41300700001)(54906003)(66556008)(5660300002)(44832011)(6862004)(66946007)(66476007)(37006003)(2616005)(316002)(6636002)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C6w+/J9mYNjnfg4lJ48q/2vmty7nMOTZJUowoMj9XwJmLez81Sbce9J1d+tg?=
 =?us-ascii?Q?ocxdWEvonIB2ZU+a0BHve3OMSu+ImRNsNLJ3XXYpYvSicVpbSgolPoKaYo8g?=
 =?us-ascii?Q?pZRZCylEs1x8VxHWQXhClu7eLCC9f4Nf4o4XJxNN1ObU9ccwdqc1bNShWoEk?=
 =?us-ascii?Q?dUZPiVdX5DHxgXWPtB6bJOuYmR5JPhr3BO95LUgXp/aVRUkCx+zvowj+C5O/?=
 =?us-ascii?Q?MWEqtWX2IfxqwBK1196js0Nv5c67fFqIi0GPkpnMdc1aQyn2Hn5p9pJf5wbj?=
 =?us-ascii?Q?MqCMu/UUOr/aJ2u7IrI7M0vZQm1GI/w6Va9S5pi35jhImyOUkyWCoR+lu4L0?=
 =?us-ascii?Q?kn7vn3OLu4O5CMF14oP7zEpvorE6v2MtUdjGpnqt5mHPJ51qN/3gpD4rQN+U?=
 =?us-ascii?Q?oCtvQiP3XCagVN4HXEHBt9NdHkzTiiYhp1TwS0yjYoBBKsVC5HrEygyM1ZYq?=
 =?us-ascii?Q?Gh7WoEZL9ldh8gEiuJX4Der4//qpGTeCZrKV0SorgI0yRibFHubBrQFwhdMv?=
 =?us-ascii?Q?lBM2CES1UH4bkyLjnqEN+SlS7BWpLALagE7Lz622Zka5TEP8BWaEYzQka97M?=
 =?us-ascii?Q?v0+OCTF9uTGPwdY24Rt5LqrOOup83IpHS3Y/rwk9loQ+HAawLx2Ftlcyq5HV?=
 =?us-ascii?Q?AfiQZLttQyo07N2904alzk46C80PSSSb7usZAJ/iQZfqreO1uiRHLNjsy8/W?=
 =?us-ascii?Q?a2Rye7HVYMnw1tJmITasf7zP9mJu9iiIk82eC6QaasfZxhUnQG5f1u2XB4bl?=
 =?us-ascii?Q?MddCfWjex25qy8QoV4MaiI0drtQJBAo2egho+WTU9sjcwN+rkxXpOXdgXq4d?=
 =?us-ascii?Q?pQuA4I1R8Rm7Z82+wuSKngfocB8OOhuBgKXFd4H2ZOoHaVEHPxXluQg6C8U3?=
 =?us-ascii?Q?I/VuXj5Elj/bp3LTYeTaScONOjZp/4dCld/Ph+lVyIQ33EBnSUFmlm5+uJbS?=
 =?us-ascii?Q?P+ZqJhaUwzYJoHEmP1gJW00GbQpA3cDu83A01+c4hsPz/D5YQ2albJZHY2Ny?=
 =?us-ascii?Q?jIG7joVOzudHtXvrNQp8//jhEtyF2YNWbpHCqZG0NoF7DJml2XV3DzApVgHk?=
 =?us-ascii?Q?XeEULqglYTTOVswN6tbKRNpunNYI0vh7vZwWZFLTii6B4BifGZRxzrgPhn92?=
 =?us-ascii?Q?DQDG4Ct2vwgqgmPJbjA0Gd/ev8zWiHBNg+j0c014G7Xo36pqws8O4pzCJo5U?=
 =?us-ascii?Q?iYEJMkjVffFHPkOIPDzCXLtcbqGQ/f0JKkwDMTkhQ+FusecVxeQ/UfbwQAi0?=
 =?us-ascii?Q?pdRz+ExqTi8WgSJ1+Qvgk8PLtzQJKrAcmYwi492Cf9LguWxHrhIOyJfWht2g?=
 =?us-ascii?Q?UrWOmDyocU72BXLHhSt+hTEDAaeh41SZ8re0LzVzV8lkhW/y3b8KxivRHf09?=
 =?us-ascii?Q?/R7yM+rqeEXKzJK1hzI05IxFa9ppo3VoUQEwFXBFHUNOPAqfpm2NkzBTEkV6?=
 =?us-ascii?Q?o8PXeqUVNkCV2OQ2bgg0p7iyT5T02FIT7s7cul6F60Dl4DMNXMYkLwDiIbC+?=
 =?us-ascii?Q?xtaiWbRk2o4aM48b/9v6inw2ju17YQsxYAiXDKIxJcwhQe29/Qh4Tb8soenM?=
 =?us-ascii?Q?6NKvJfsDvMArdm8ox6kmOUrWzUVpQ4x0VaQuQU1jxYU+fqutpsvTLYSw1pGh?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1866d3eb-7e63-49c9-6645-08dbaa577606
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 19:21:22.4667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+L2KnmvJPk896TOliWNz1/MH7bbLRPoTIsfHpKxMH2ILsFzT7NAqvsRSj77rM48dhimEq+6zxulVTulgBEX/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4871
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

On Thu, Aug 31, 2023 at 12:02:31PM -0700, Ceraolo Spurio, Daniele wrote:
> 
> 
> On 8/22/2023 10:09 PM, Riana Tauro wrote:
> > During Runtime suspend, GuC is reset for both D0->D3hot/D3Cold
> > transistions. It is not necessary for GuC to reset for D0 -> D3hot,
> > only enable/disable ctb communication.
> > 
> > Add a function that enables/disables CT communication when d3cold
> > is not allowed.
> > 
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> 
> xe_gt_suspend and xe_gt_resume do more things than just resetting the GuC
> (e.g. marking submission as disabled). Shouldn't we need at least some of
> that in the runtime suspend/resume scenario as well?

I was asking myself the same thing...

> 
> Also, which paths and how much we're actually looking to optimize? Are we
> interested in optimizing the full suspend as well?
> To elaborate, we're not actually killing the GuC in the suspend flow, we're
> just resetting its SW state (i.e. putting it back as if it had just been
> loaded); the actual reset happens in the resume path in xe_uc_init_hw. If
> the GuC and the LMEM have survived the suspend/resume flow, we could

On S3/S2idle/S4, GuC and LMEM will lose power.

> theoretically just restart the SW side of things (re-register the CTBs and
> start SLPC) in the resume path instead of resetting and reloading the FW;
> this would be a lesser benefit to the runtime path compared to what you're
> proposing, but it could benefit the full resume path as well and it'd have
> the added benefit of keeping the 2 paths the same. I'm not sure though if
> the LMEM management could end up breaking this approach by moving the memory
> around during suspend.

this memory movement is indeed the hardest part with all the locking...

> 
> 
> A couple of minor comments inline
> 
> > ---
> >   drivers/gpu/drm/xe/xe_gt.c | 56 ++++++++++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_gt.h |  2 ++
> >   drivers/gpu/drm/xe/xe_pm.c | 10 +++++--
> >   drivers/gpu/drm/xe/xe_uc.c | 18 ++++++++++++
> >   drivers/gpu/drm/xe/xe_uc.h |  2 ++
> >   5 files changed, 85 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 13320af4ddd3..0d52621ce64d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -676,6 +676,62 @@ int xe_gt_resume(struct xe_gt *gt)
> >   	return err;
> >   }
> > +int xe_gt_runtime_suspend(struct xe_gt *gt)
> > +{
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	int err;
> > +
> > +	if (xe->d3cold.allowed)
> > +		return xe_gt_suspend(gt);
> > +
> > +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > +	if (err)
> > +		return err;
> > +
> > +	err = xe_uc_disable_communication(&gt->uc);
> > +	if (err)
> > +		goto err_force_wake;
> 
> uc_stop() might already cover what's needed (or could be expanded to do so),
> although unfortunately uc_start seems to not be matching and therefore not
> usable as-is for the resume side.
> 
> > +
> > +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> > +	xe_gt_info(gt, "suspended\n");
> > +
> > +	return 0;
> > +
> > +err_force_wake:
> > +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> > +	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
> > +
> > +	return err;
> > +}
> > +
> > +int xe_gt_runtime_resume(struct xe_gt *gt)
> > +{
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	int err;
> > +
> > +	if (xe->d3cold.allowed)
> > +		return xe_gt_resume(gt);
> > +
> > +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > +	if (err)
> > +		return err;
> > +
> > +	err = xe_uc_resume(&gt->uc);
> > +	if (err)
> > +		goto err_force_wake;
> > +
> > +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> > +	xe_gt_info(gt, "resumed\n");
> > +
> > +	return 0;
> > +
> > +err_force_wake:
> > +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> > +	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
> > +
> > +	return err;
> > +}
> > +
> >   struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
> >   				     enum xe_engine_class class,
> >   				     u16 instance, bool logical)
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index caded203a8a0..e6574e51004f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -37,6 +37,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
> >   void xe_gt_suspend_prepare(struct xe_gt *gt);
> >   int xe_gt_suspend(struct xe_gt *gt);
> >   int xe_gt_resume(struct xe_gt *gt);
> > +int xe_gt_runtime_suspend(struct xe_gt *gt);
> > +int xe_gt_runtime_resume(struct xe_gt *gt);
> >   void xe_gt_reset_async(struct xe_gt *gt);
> >   void xe_gt_sanitize(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 0f06d8304e17..6bc01bb45fc2 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -245,7 +245,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >   	}
> >   	for_each_gt(gt, xe, id) {
> > -		err = xe_gt_suspend(gt);
> > +		err = xe_gt_runtime_suspend(gt);
> >   		if (err)
> >   			goto out;
> >   	}
> > @@ -294,14 +294,18 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >   	xe_irq_resume(xe);
> > -	for_each_gt(gt, xe, id)
> > -		xe_gt_resume(gt);
> > +	for_each_gt(gt, xe, id) {
> > +		err = xe_gt_runtime_resume(gt);
> > +		if (err)
> > +			goto out;
> > +	}
> >   	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
> >   		err = xe_bo_restore_user(xe);
> >   		if (err)
> >   			goto out;
> >   	}
> > +
> >   out:
> >   	lock_map_release(&xe_device_mem_access_lockdep_map);
> >   	xe_pm_write_callback_task(xe, NULL);
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index addd6f2681b9..b5b53c8c3edb 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -216,6 +216,15 @@ static void uc_reset_wait(struct xe_uc *uc)
> >   		goto again;
> >   }
> > +int xe_uc_disable_communication(struct xe_uc *uc)
> > +{
> > +	/* GuC submission not enabled, nothing to do */
> > +	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> > +		return 0;
> > +
> > +	return xe_guc_disable_communication(&uc->guc);
> > +}
> > +
> >   int xe_uc_suspend(struct xe_uc *uc)
> >   {
> >   	int ret;
> > @@ -232,3 +241,12 @@ int xe_uc_suspend(struct xe_uc *uc)
> >   	return xe_guc_suspend(&uc->guc);
> >   }
> > +
> > +int xe_uc_resume(struct xe_uc *uc)
> 
> This should be called runtime_resume.
> 
> Daniele
> 
> > +{
> > +	/* GuC submission not enabled, nothing to do */
> > +	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> > +		return 0;
> > +
> > +	return xe_guc_enable_communication(&uc->guc);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> > index 42219b361df5..29bd692d8800 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.h
> > +++ b/drivers/gpu/drm/xe/xe_uc.h
> > @@ -12,8 +12,10 @@ int xe_uc_init(struct xe_uc *uc);
> >   int xe_uc_init_hwconfig(struct xe_uc *uc);
> >   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
> >   int xe_uc_init_hw(struct xe_uc *uc);
> > +int xe_uc_disable_communication(struct xe_uc *uc);
> >   void xe_uc_gucrc_disable(struct xe_uc *uc);
> >   int xe_uc_reset_prepare(struct xe_uc *uc);
> > +int xe_uc_resume(struct xe_uc *uc);
> >   void xe_uc_stop_prepare(struct xe_uc *uc);
> >   int xe_uc_stop(struct xe_uc *uc);
> >   int xe_uc_start(struct xe_uc *uc);
> 
