Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A70C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:07:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673DB10E0BA;
	Wed, 29 Nov 2023 01:07:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A28C10E0BA
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220067; x=1732756067;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3/DJJDFqUC6I6AkzhEK6iBR4WF/KFW422E/Vm+hR/HU=;
 b=GPuvZ0g/auEehjb3MW5f8dMUsUT6SY2rWsHYP1+UeDHTVEpNjJSs4KGO
 trhOFbf4tgbWlFzAXUcIvE7h4uUKb3cyVd88mrXywVsPOvJWQEINCMtuE
 FhM8fE0YXRePxcXqE+AnRMlCLhe/viVlte8hJAG4DNbfiAqnXQR44/Ao1
 MzDDW23/ewWSXQh66YGm4+LzjOosv0aljFKJuzSHfMukZ2UVpecHtoZ6W
 zsIOkcjkZ6zBns7yBtfwvrhQc4xHYNWqYYLVzUAMfmpHgIrAmndsR69w+
 Jr8erQmM6EmgyU/5lFR8/4pS73FlqBM4lbCs2CBJcCcexoTjixBGH3Ldo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="378091936"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="378091936"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:07:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="942133856"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="942133856"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:07:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:07:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:07:45 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:07:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AV8qJ/xBs5LIHYA71jMCT44ef2rbweh0Ppfmtr0jj+3ReefbhYuWmTjkJ/f4g064WlBeD9gxSZ5h5OX9tBfIao3wzXtiYFJWU1Cwc3r2URxfJW0LlDIvmOzgX1n8Ur1m45M6wiEnlsDijxFkdeC9iPtGIvkU+iidOZurJre7oIHWRLXEayhlwChU9lU3kWTTA/kFpspGInw2ejhtXx1Z7lDOlOEh8Wp0ERyUJXHfLmfpK7kckv5cxJnKrXdL47pcS6NL8y/moINb+hl3C+ChEsieqoUqwUSGR4ZA+g5dwKO7sOm9easXoUk2BDi3YrujIU5bKPYGxZYfLByONNep6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGV/BIAZBYW0PEQHjfi+Qn8Cg7+cYmHyRX8wGmoL+a8=;
 b=Cyj5aWgFwvTXzV6zx+TNiyECbqtS9iTb7+PZeebUz+YmICbdpH6r5CTRhsgmicClfk4hMqx/73SEllz2wzkkW7Fbl8IAIuojE0zVpuAkVlntlc45Jgc/WnLII5Bbw1C2zVgh+Km4zH7Qt+wzUiAm5x2eefB0l6VdZZzsDlwpoNd/QZOYw+6OasksNq3Dzg3HwAml0lWaeVNpvONR5iv2dSJbwGC0jJqwQu7Rk6GV2Yw78UfxK9r3NXFsYiWP1iC8+CWhOSHcyMgX8V5Rddff5FCQ1jMD4Tzx72kiJfCb763w1ICAj/L+NSvZckP81tkebJz789BAfOKjF7gV/z1xMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7326.namprd11.prod.outlook.com (2603:10b6:8:106::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 01:07:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 01:07:43 +0000
Date: Tue, 28 Nov 2023 19:07:39 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <rmydfe5prhckhm7lnsyyv25v6j53dw4kqjjos4eiilscgcpgpw@odhrkdpytyjy>
References: <20231121112555.3734840-1-tejas.upadhyay@intel.com>
 <ykymzzr23ixp3owtn6tdeieb6eyxpnzeypvwajx66mqkkxobzx@eu26ntxgx6fr>
 <ZWWpP99Wzh5U0qwB@DUT025-TGLU.fm.intel.com>
 <mcx6k5c6cx3okqszgpw45ew7yqwty7tprojkjnwv56yj3ulpqz@h5fehhchgjbk>
 <ZWXxXAQLjYdfOEwP@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZWXxXAQLjYdfOEwP@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0190.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 43abaf7c-e308-4950-e00c-08dbf0779702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hV3iPEZ3Z69/wkzdW+m0Wd9wBugjW7V1j1mFyUrKgfAfQwWtSmwqWcf+LRSipV26h36SZ5bEIO/tOUIkddezDKtcrDbWMr2RqpCZry6+DyHs4XWKRF/tEqo+A9gF+LxGIL+vJh2QsHeFqRs0lrwNI46yHgcZHvulbYV8QxsvxDrbcsOAncd23z84+U4s6oRo0WFbPjYZmstoMh7cThaK+NeuNZy0mbirmQZFnOsSD99Yc1u/6HdgKai2hE+gpsOHN9QpacL6gqM9/Dfj5lyUAoL03bGytavD65HlmH/FrKvjYeOACamCfSmMXa6836cDEsL3uVn3I5ctcXOmmx8Cra8c9ZjzOvVgxYJFnx7E2mxW6atZ8vV3z4o7MK7E0vnSfEIDS674/TpOoWpgxDNI3ARQnR1O5CGcNJ9AB3ayaNi04uxlEwQGzCtYqCeOBZ9FL75Qc/IsvXL5Jtn5sytYItgoIhbnes2FtUXFDRupd36/9LRon8Hl1kD4x1mDLgKYnXiW9e/pvq6iCtcttltCGNry1PvTrzoj+Nttdu20NTAwumNVJ3ufpY+rsk3wpKZI69gcBT+JyS4RT5ByiHh4Bw7TG9HzO01ov1AJr0kVa1CYV67D+IaloZoj3SnGxSvHXTqVvfSzcxIAVRuPcVtnzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6666004)(8936002)(4326008)(6862004)(8676002)(9686003)(6512007)(478600001)(6506007)(66476007)(66946007)(66556008)(316002)(6636002)(6486002)(33716001)(38100700002)(41300700001)(86362001)(26005)(2906002)(83380400001)(82960400001)(5660300002)(27256005)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xnxwcMflyK8EYvKW+jEMx68VP/RPaVG6Pz3WYm+ST8f9VbdeTS7C5oyYVkVd?=
 =?us-ascii?Q?WtVLc943TszJQGr2bCPABFzDl4g28w0zLEOfwW7Bh4BW8Gp05ZQKOAIgidac?=
 =?us-ascii?Q?1za7TURf0JBrpsO8VdShabZ63aqyrbE4jLrCVvynSKKlu84dXcZplxPvqyJ0?=
 =?us-ascii?Q?hARpkLg3LK9k/ti06BJPYE2Y0YB4kGtcznDH+S6jXh8IIkVnObDWWk9+Lj69?=
 =?us-ascii?Q?fRPNVG1CL8pwdr9LRNgguu0NYO4FQA7xzux6G+pV46yPe8U+vW/tjqEiJlIs?=
 =?us-ascii?Q?wRfqp3WO1wYcKDSfBqEu3UHu9Ol0SXadjKA2k6xVQ/wJ0zwF/JCW/hkyIsh6?=
 =?us-ascii?Q?xikTDR0ZMsOcund4tHQFPLk5UaI+QgcYd9CkJ2QoL857CW4avheaghfENaDR?=
 =?us-ascii?Q?ipi5EwYjprJwpSZkh5Rrr00CTfnzCjLs2Esd++bBproLxPhzFV70WgW65XQd?=
 =?us-ascii?Q?LXknGWmqcUazezvbq+egE8JEWSrNbQTSUjHdPIJHwHQhGOtw9AtDhnA4dixU?=
 =?us-ascii?Q?oWQpfFE0ENq/4mVgb+rzpRU0yUtHg+fN+FghwtVoJz1X46ujEZRyQxCAZ52x?=
 =?us-ascii?Q?xgNCbyAc4YvHwZazekuEOCooqygnEBQSVTfsKafU9S8KxJ5M3HC/iEcMBQ4m?=
 =?us-ascii?Q?n+SgrwbFaQ7UU3yX0GDSn5abB5VHpCbmI69eQPVuSjxWi7EhmAS7ZZe53Coy?=
 =?us-ascii?Q?/tkAUNbdgNwIbSjMaAmmaYIbI9BJ6vhRXtSFlYgHM7+H2Hv1Dw/p1DRIJwxy?=
 =?us-ascii?Q?GcHi6kA8oIFapvrgsu70AXK+hjcE9yS8pHWJ0s8qPuHo4C7CFEDHupCjlMTg?=
 =?us-ascii?Q?kuYjxr8MkLi4ckNlanjj9dXYMf+q2YnoLHYfxjrctG3JkJ7b73l0z4BgMb8y?=
 =?us-ascii?Q?YD7mH+iQu/Y79/qvUlacsVcWclTqF+iaSGNc+RxZM8TyLp7w+QfeUNh+69NM?=
 =?us-ascii?Q?WYusEIZNtdVxMy8lDYVtQxY5BacfWfe7rMtMyh3ufrEFQj2ZJLAnucjtQW3r?=
 =?us-ascii?Q?Bq1iQ0tVJ0N5//oB+VmLGxlP9dnxnJuqF+DJAgWZWawNUzwdZdjrziLvVYoh?=
 =?us-ascii?Q?lViGR3eXkBf6/9+0inkG4iiXfsRHc9wlWDliRT5kqR+tvZnunpCKG3dNO4Ht?=
 =?us-ascii?Q?VrJM9w/o2kFPC1Zh5dRQyDJF5tIVBHubq14akr0bocpJ9mnsPg+ZcU7/P+pE?=
 =?us-ascii?Q?vWWJc4rhHk+eDsKFe5QwgxYcOuZ6gL88GW13oU8ASrt5mm1EjDYyzYR8YxgR?=
 =?us-ascii?Q?jUgI/+L2ZenJmMabSEYzAjgRgH/3Beo80/Rfo5nTb752iPILmJKLNDWK7eF0?=
 =?us-ascii?Q?aXTNWzRwL+o8s75BIRm8nFKwp08k0MNV8BR62IJg7vNywZFhvTdT7rzwKevP?=
 =?us-ascii?Q?4qe/6fs4TIP9RW+qxXKyKSNsVJQai32CfEDeMKeijHGLDpcw0rf3Y/QHUavv?=
 =?us-ascii?Q?98ybo4YAOBCmGwX4wcK8RsuYW32+mZPx/egQ+adnWc6Vo0BpTWkp7lU6rfQq?=
 =?us-ascii?Q?RLyXOyDoF7XOkY53jWS7zqbVzIhUv1ri8K6MfY0tOy8Lj4HlFGeP9PUL4CTG?=
 =?us-ascii?Q?o+ld0fOrwZc+12BV+3sb0vMPxNj3ZfkocGt1vdVqFeEgv2wGX0KaFBis092U?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43abaf7c-e308-4950-e00c-08dbf0779702
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:07:43.0253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iy+BiYKrc5jo+9YPcB4g38qecXAOuVdnp2w1d+Pggw8Hvs0dSArroEO7jF18A9crKWC/Qu8BDh8hCzmOdIQ4wuDGdY7BNp7o/J9y8ijd7Ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7326
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Move wa processing to gt_init
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

On Tue, Nov 28, 2023 at 01:55:40PM +0000, Matthew Brost wrote:
>On Tue, Nov 28, 2023 at 11:45:36AM -0600, Lucas De Marchi wrote:
>> On Tue, Nov 28, 2023 at 08:47:59AM +0000, Matthew Brost wrote:
>> > On Tue, Nov 21, 2023 at 08:48:47AM -0600, Lucas De Marchi wrote:
>> > > On Tue, Nov 21, 2023 at 04:55:55PM +0530, Tejas Upadhyay wrote:
>> > > > Currently WA processing for gt is happening in early init API.
>> > > > It also includes processing of WAs which needs filter based on
>> > > > hardware engine by looping over number of hardware engines in gt.
>> > > >
>> > > > However at early init stage hardware engines are not associated
>> > > > with gt in software which skips processing such WAs.
>> > > >
>> > > > Example WAs which will be fixed to apply after this change,
>> > > > "14011060649",
>> > > > "16010515920",
>> > > > "16021867713"
>> > > >
>> > > > Fixes: 811a9b3d262d8 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> > > > ---
>> > > > drivers/gpu/drm/xe/xe_gt.c | 2 +-
>> > > > 1 file changed, 1 insertion(+), 1 deletion(-)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> > > > index 0dddb751c6a4..3d0f7b6f952c 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
>> > > > @@ -311,7 +311,6 @@ int xe_gt_init_early(struct xe_gt *gt)
>> > > > 	if (err)
>> > > > 		return err;
>> > > >
>> > > > -	xe_wa_process_gt(gt);
>> > > > 	xe_wa_process_oob(gt);
>> > > > 	xe_tuning_process_gt(gt);
>> > > >
>> > > > @@ -495,6 +494,7 @@ int xe_gt_init(struct xe_gt *gt)
>> > > > 	if (err)
>> > > > 		return err;
>> > > >
>> > > > +	xe_wa_process_gt(gt);
>> > >
>> > > the problem with that is that if we need to touch any register already
>> > > touched until this point, the workarounds would not had been applied.
>> > > Digging the git history, I had added this commit exactly to be able to
>> > > initialize the gt workarounds as soon as possible:
>> > >
>> > > 	4eb2e8d25ab4 ("drm/xe: Add xe_hw_engines_init_early()")
>> > >
>> > > And then
>> > >
>> > > 	816d37907ac6 ("drm/xe: Plug gt WAs to gt init/reset")
>> > >
>> > > Note that these commits are in the xe branch, not drm-xe-next.
>> > > So, it was:
>> > >
>> > > 	xe_hw_engines_init_early(gt);
>> >
>> > xe_hw_engines_init_early has be called after xe_uc_init_hwconfig after
>>
>> did you mean "has to be" or "has been"?
>>
>
>Sorry, "has to be".
>
>> > the idea is gt->info.engine_mask would be set by reading the hwconfig
>> > table from the GuC rather than from a hardcoded table in the driver.
>>
>> like I said, the problem with postponing that is we could have hard to
>> debug issues because we will think we have all the workarounds coded,
>> not realizing it isn't applied to the early stages of hw initialization.
>>
>> I think we should go back push back on the idea of initializing the hw
>> engines array after loading guc... it doesn't make much sense from the
>> engine initialization pov and we are *not* doing that.
>>
>> static int gt_fw_domain_init(struct xe_gt *gt)
>> {
>> 	...
>> 	err = xe_uc_init_hwconfig(&gt->uc);                                   	if
>> (err)                                                              		goto
>> err_force_wake;
>>
>> 	xe_gt_idle_sysfs_init(&gt->gtidle);
>>
>> 	/* XXX: Fake that we pull the engine mask from hwconfig blob */
>> 	gt->info.engine_mask = gt->info.__engine_mask;
>
>Right, we don't currently parse the hwconfig to get the engine_mask but
>eventually they should be.
>
>>
>> 	...
>> }
>>
>> The engines available are not hardcoded in the driver. We read the fuses
>
>The initial value of info.engine_mask is hardcoded in the driver, the
>fuses adjust this. Eventual I think we want to get rid of all platform

but it doesn't matter much. Even if we were to read from the hwconfig,
we would still have gt->info.engine_mask with the upper limit and then
use the hwconfig to trim it down. How different is it from doing the
same thing, but with the fuses? We don't do that today and keep a trim
down engine list, but equally we don't use the hwconfig on
this part of the initialization. The hwconfig could be useful for
something else, but I don't see how it helps here.

>information hardcoded in the driver and dervive info.engine_mask from
>the hwconfig. At least that is the goal from my understanding.
>
>> to know the avilable ones. That is sufficient already to loop through all
>> of them. Note that since it's *engine* WAs, we need to pass those to GuC
>> via the ads since it's GuC itself that does the save and restore.
>>
>
>Yes, but not for hwconfig load. We can load the GuC to read hwconfig and
>then properly populate engine WAs list when the GuC is loaded for
>submission.
>
>> > Likewise for_each_hw_engine should only be called after
>> > xe_hw_engines_init_early is called. With that, I think this patch is
>> > correct. Does that make sense?
>>
>> as per above, no. I think we are overcomplicating it for no real
>> benefit.
>>
>
>I agree this is complicated but I thought this ordering / reading the
>platform information from hwconfig was requirement. Maybe we should
>follow up to check if this is indeed a requirement.

What happens when we need a gt workaround to be applied even before the
first GuC load? This patch moves all the GT workarounds to happen after
the first load so it potentially creates issues if any of the current WAs
in gt_was[] are needed before that point.

The alternative, adding yet another WA type for when we need to decide
on the WA by looking at the engines it has, doesn't look pretty and also
complicates the decision on where to add new workarounds. When Tejas
asked about the possible solutions and I mentioned making the early
stuff happen early, I was not thinking about moving the WA processing
after the hwconfig, I was thinking about initializing the hw engines
array earlier like it was before.

I think the possible things to do are:

1) move the engine mask to be initialized earlier like it was and stop
pretending we are getting it from hwconfig

2) what this patch does, moving the gt WAs processing after the first
guc load

3) split the gt_was[] - all the WAs that need to check the engine in the
GT would need to be applied later

4) ... something else?

I'd say my preference is (1), (3), (2).

>
>> >
>> > I suggested to Tejas that we add an assert to for_each_hw_engine to
>> > enforce this is called after xe_hw_engines_init_early to catch issues
>> > like this too.
>>
>> I think that is already clear. Not sure it deserves an assert. The
>> assert would for instance trigger right now in calculate_regset_size(),
>> but that is harmless. Also we'd have it spread through the driver.
>>
>
>Well an assert like this would caught this bug quite a bit early.

ok, fair enough on this one.... as long as it's behind the debug
kconfig, it should be fine.

>
>Matt
>
>> Lucas De Marchi
>>
>> >
>> > > 	...
>> > > 	xe_wa_process_gt();
>> > >
>> > > That gt_fw_domain_init() seems a very poor place to initialize these
>> > > things now. It started with commit b892e30c6cd7 ("drm/xe: Move load of
>> > > minimal GuC and hwconfig read much earlier") and then people end up
>> > > adding random stuff in that function :(
>> > >
>> > > So I think we need to get back to the original idea of _early()
>> > > initializing what's needed. Then we'd probably need a few cleanups in
>> > > the initialization sequence so the function names at least partially
>> > > matches what's being initialized.
>> > >
>> >
>> > I agree on that the naming of all of this could be better...
>> >
>> > Matt
>> >
>> > > Lucas De Marchi
>> > >
>> > > > 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
>> > > >
>> > > > 	err = all_fw_domain_init(gt);
>> > > > --
>> > > > 2.25.1
>> > > >
