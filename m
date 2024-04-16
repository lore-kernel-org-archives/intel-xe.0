Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08A5C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 19:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED5710F2C1;
	Tue, 16 Apr 2024 19:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJ8Ifsvv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874F310F2C1
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 19:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713294506; x=1744830506;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iGMvVIKLaPsu4YyQdiVvtH71geo2/PeiNrqvN7+JeaU=;
 b=OJ8IfsvvWeJq4sTAIcelgVse/ATH+3zuWSRuvdUPN2wUKKaVM4Vq6bEi
 4t7fhtNqOwrtapSHoyPirJiyYHp2hxs7149jE3Ay3OBHUf+oyNjRMCCmL
 +x7kxd/XT7RMCZm5JA+rDgnJf42jivaUb53CHBGH2c2CvjF+xJGd9rEMw
 IpMa58Z7KI97CUoXu9bItlMV/8ijT1fG2e514t6Zq4kOupHR+PkjF7BqC
 jfn/CmVNG+vJpKnRw9P9bufzOPBBgw+9Sm6wMlOrRtsuYTF5evwM5Vy1g
 eWemHt471x8PCIougxIw7RHkcc6ysq21+gFB70VIboeWMhqAHo1JPtkO6 A==;
X-CSE-ConnectionGUID: 8c/CsGIPS/62v7zvMQ9ECg==
X-CSE-MsgGUID: h3S84DR7R+6DzU54ItJLpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="26267515"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26267515"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 12:08:24 -0700
X-CSE-ConnectionGUID: b1sbFffiSFiwyult2lDtgA==
X-CSE-MsgGUID: IF18jElNQOiKAJAifpTB9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="22767266"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 12:08:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 12:08:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 12:08:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 12:08:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 12:08:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lr5JayUVG8zJ1dnbVhlLwtWQqLoCc6WpTpTL5iAu2nyB5lQZkOpKqFYAnX50c/zBrOy7EiAgBJL6hL1nHhO8dYawFFrBnu4N8qyPcniWSRQCFumV6K/NThBWNecfLmpii+mybsA8B7IySL9u3kdKA6wNqf2Q+g6XHIaqN74q6LDJlTHPDeZKHTJhVQoXRvXxMDpNQ4F8E4bluuz8JKv+gFDsanrN9P3yAgGMP57JwQ4xWDSBaqELKyX+mq28t//EprKczsAtQ3agfk1EUgBFmUB1rZsjJ9NkKamYymAUjrN+n2N/mfXoVmGUyp7qJYrSbuZnLnqGmAlB+2ZWfbSJLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iM/FxAwK/p+PBpOIvRhKIDaTpE+T0/fzJncimhW+SEY=;
 b=lz08WVnBnEfP7U1griEan/sTWMZqbbnrGPn6hiXLLnJf/TqeiKZ/YpbRU6O3e6FcgCxC5jK5vEDN+/1zcVTSFvkbxjm+JhZGKxghR9T8u12f06i6kKg764GYjRjQjZ9WOQD1N+MzlTiOcIZFXfsrLx8WAJkKFUPIqUK6OLMFeTcBhlKjleByexGWu6Y07IKAnHjN8oyHMgXyakdSWzAtJ35PYSdXD6P+Kx/vdKJ0YSxWqRFlKPb56prstwXHVe5nfoEchsoLH4n0s14q3TH8v8kjYDTPGhekAZsShVyWeL9edMwKOsj6yJcwQb1lZAwXM8LwTdPpF3ZJ0Vj17RRG5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA1PR11MB8542.namprd11.prod.outlook.com (2603:10b6:806:3a7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Tue, 16 Apr
 2024 19:08:20 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 19:08:20 +0000
Date: Tue, 16 Apr 2024 15:08:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Dafna Hirschfeld <dhirschfeld@habana.ai>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Himanshu Somaiya
 <himanshu.somaiya@intel.com>
Subject: Re: [PATCH 3/4] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
Message-ID: <Zh7Mn0Wr_OHCkGf6@intel.com>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
 <20240409221507.1076471-3-rodrigo.vivi@intel.com>
 <y3bo36g6qldbxafa6mbukof2zfq5bnxlcd4xagbwkapowgyjwa@5vbtlvpu4hcg>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <y3bo36g6qldbxafa6mbukof2zfq5bnxlcd4xagbwkapowgyjwa@5vbtlvpu4hcg>
X-ClientProxiedBy: SJ0PR03CA0259.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::24) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|SA1PR11MB8542:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec1f7ff-71f6-43ae-aab4-08dc5e489419
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B7UM4psLbvfUzndhiLYQSWMegeQPsvtAYAZ7dlc3tL1v32lmAcmg8C6s2KwR+TOX+gyGwnhs937nJqF3WeJf7l7afMhtjBjOoZO9VHzMs5ZHG36mFwWN+9zzLZoSJts2vGTB6NfPQrGuRw8naQxsrXJeCowEq2PD4jDAO8oYtg+mUaQbRckj7ebg3gGYVLB5Fut9v8l+mhNeVoMziekaipJ4DaHIgf8csRFQj9yheLcax9We9ReAuNVmh82oOosPgYBRNv8cDrS80ANUJSL5cjMBRsbf6ihqu90XTwbZr+zhjcHaQoHqlQu0WFagGH8IyQh4tzxwr4f1hQYzQrETflGtkyGCeIsgXWw1d+UdARKbmOkbuElapNsp0qGxrp0oEv57SLgFdWcspukhujklA77zzGcwb8LyoMZhsetVhg5BK4kemutnQbESKeW9tQEeeGj08MnWNrKCz61pK7wGjAtKI77qXtpitRAP9WKi9pXPg+IKjiXueI3M5+eEySjZggE5LeqHeFeb9WDL0WJ54tNVKnhyw1YW1XCjpJn0V6ZbA0adNOORLF1t6CdiSV+tWcTBlSz5jW2CmibyQs5POO2ikWJD4O8LeaDb5seBhzU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WECvdcjvlCjhxgk7cyyAa56bA6TnGwbkcGIsp3VxF/XECtv4lrDPDSNPKQQF?=
 =?us-ascii?Q?0FreFVcinfp2Lit8JOLmDRXy6PkJnTcMJGqmxMvRcfnsTIisOwdYtNDPCjcl?=
 =?us-ascii?Q?j4ZJraBxpKpXJ7wgNgq9qqZkKytNnq6CkWS4ZTUw57VjZRqbUaF0U8B2rq3U?=
 =?us-ascii?Q?thKBjCmYOPXKtTP0JGiVoXWX9jp4VuYDzzwRxmoAnL2vIeK+1ifpxPYG9FUG?=
 =?us-ascii?Q?H8fVB+DU0xTcgpAwOwC+u+tdJDUS7FYTXx9tz6fUu31cc+8w+9kjGpVpV61s?=
 =?us-ascii?Q?wuJwKPEN2V6Xo0Xo5Ij9fWFpYR1VGjYGOXJQ+WB9dLCHKPFnxC3wPamNf9jd?=
 =?us-ascii?Q?8Mi8qPSo43d1t3NtYuAAa82mT8zR1tt66FvoOnCBuFHCFXZXpSoB7BQKX25/?=
 =?us-ascii?Q?KFOiLrbrP+B0jB/wg16ul2QAImLaOMOUOUYBkPTfeSeDQ/6EeMWedKhmkfHC?=
 =?us-ascii?Q?HCP9p87ZxdhLMfm1geiPCe12fxbWC+N6gHwKlMGsOCb/mfBdSHsmLKe6WrBA?=
 =?us-ascii?Q?PdNup5CmLXSG6CWiJmq0fzXnZUdGcNfmBlUC0HhLK5XiCEkYu4RhVpNWJDJB?=
 =?us-ascii?Q?RskG95/jqMDmqUdaY1OupBQsyx8/tNMKYs0HLzmXTu+F4r2DgojXaBox4ToA?=
 =?us-ascii?Q?yhGVNDzzFuVxWoD3yjuGoYO1v85HrjdiP6Ea449qU6X+ZVNJ4wLCmZDzgwLR?=
 =?us-ascii?Q?cMNVn7uzZA5NaXhS6tAnxdnq9NsoVujGAmXkNhXeWD6Ls2FENbyNGZhgCWhW?=
 =?us-ascii?Q?IjF6Ff0Q4ZkKib09zRik8rNKY4H/Egyt8UEhV29gcpEKxUeOxMgx7N6B6oWg?=
 =?us-ascii?Q?3YggqVYDF45xANSZY1I5/eHXHiCadmRqs2Id/4Q5pdG5JtspqoshatZRnrmm?=
 =?us-ascii?Q?r+u6XH9KrHfQMHY8azuy1utS6uB17cca8BR0/cASHmnEHipx3vNoxFxBdCjt?=
 =?us-ascii?Q?sX52entdqUltRKGfgMnYS3jO3d7rjL2QrRj26lufvSCvCIUS4a2ohT+yqxdT?=
 =?us-ascii?Q?jxkBIq13dG5Uf6jTJQFz8Z7ca9HI5sfOckn/WieDjkEp/CanIk3zC6B8dp8D?=
 =?us-ascii?Q?516V4NEXxDBn3Jz58+fN/qwNDf2Lq2d6M5HJyuroq/SZj86uu2QZiRF4je61?=
 =?us-ascii?Q?Ruw+HOMiWxP1KsegTK4JRcOj5QLGsHp2Cnk2ugaC2qAgbqUp+NY9O0k0IxOp?=
 =?us-ascii?Q?iRZcgE497H9Q21Cw7qhRP4iOPY94jUb6Cg0ss3LTNqbVPXlUWAuawfGx3Srf?=
 =?us-ascii?Q?RR/FrZ+kklVOfpeeW9/stqRXg2jAhFJenkNGircgeqoqSx7vGyvsdGB9eBu6?=
 =?us-ascii?Q?FGtaZPflXBddJMdfKbpugaeCdzLOqTlyGusJvxAGayf7NexTF1g0lcPZroHs?=
 =?us-ascii?Q?xWBq7owUTAZpfR626oJcChMMnrbghquYrJ7h7QbMzrftkfz6iQgQ0nL+YIci?=
 =?us-ascii?Q?LuyhXaW3zPOpFyB5RpeWpnFeByo41gCNdjQf4chy+r7pZXHzaQbT6kfA0ghg?=
 =?us-ascii?Q?2FWCA5hxjv5o9uLKB/lIj4b0WTGf9jhnEnSCdRaWIHcC91TSQnZvtXI4YnFs?=
 =?us-ascii?Q?s+U5pQtEPLZ1cfPCqV9C0s0J7ufearyT1UQxEa1AOBPup4dHFQJZzoC5IHSN?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec1f7ff-71f6-43ae-aab4-08dc5e489419
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 19:08:19.8749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvVRFoQFdmhzOVG0C6rmXimEFdA1lLObaEhGCTVRvxjk5yF9Sbo5y6ZeAUqRFQVZb0+M7/MuC0pvK8jTqnv7FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8542
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

On Tue, Apr 16, 2024 at 12:19:50PM -0500, Lucas De Marchi wrote:
> On Tue, Apr 09, 2024 at 06:15:06PM GMT, Rodrigo Vivi wrote:
> > In many validation situations when debugging GPU Hangs,
> > it is useful to preserve the GT situation from the moment
> > that the timeout occurred.
> > 
> > This patch introduces a module parameter that could be used
> > on situations like this.
> > 
> > If xe.wedged module parameter is set to 2, Xe will be declared
> > wedged on every single execution timeout (a.k.a. GPU hang) right
> > after devcoredump snapshot capture and without attempting any
> > kind of GT reset and blocking entirely any kind of execution.
> > 
> > v2: Really block gt_reset from guc side. (Lucas)
> >    s/wedged/busted (Lucas)
> > 
> > v3: - s/busted/wedged
> >    - Really use global_flags (Dafna)
> >    - More robust timeout handling when wedging it.
> > 
> > v4: A really robust clean exit done by Matt Brost.
> >    No more kernel warns on unbind.
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_device.c              | 32 ++++++++
> > drivers/gpu/drm/xe/xe_device.h              | 15 +---
> > drivers/gpu/drm/xe/xe_exec_queue.h          |  9 +++
> > drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
> > drivers/gpu/drm/xe/xe_guc_ads.c             |  9 ++-
> > drivers/gpu/drm/xe/xe_guc_submit.c          | 90 +++++++++++++++++----
> > drivers/gpu/drm/xe/xe_module.c              |  5 ++
> > drivers/gpu/drm/xe/xe_module.h              |  1 +
> > 8 files changed, 132 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 67de795e43b3..7928a5470cee 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -785,3 +785,35 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> > {
> > 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
> > }
> > +
> > +/**
> > + * xe_device_declare_wedged - Declare device wedged
> > + * @xe: xe device instance
> > + *
> > + * This is a final state that can only be cleared with a module
> > + * re-probe (unbind + bind).
> > + * In this state every IOCTL will be blocked so the GT cannot be used.
> > + * In general it will be called upon any critical error such as gt reset
> > + * failure or guc loading failure.
> > + * If xe.wedged module parameter is set to 2, this function will be called
> > + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> > + * snapshot capture. In this mode, GT reset won't be attempted so the state of
> > + * the issue is preserved for further debugging.
> > + */
> > +void xe_device_declare_wedged(struct xe_device *xe)
> 
> nit: this function could have been added in this file already in the
> previous patches.

indeed.. I would had struggled less with the rebases as well :/

> 
> > +{
> > +	if (xe_modparam.wedged_mode == 0)
> > +		return;
> 
> ^ so this would be the only diff

yeap, sorry about that :/

> 
> > +
> > +	if (!atomic_xchg(&xe->wedged, 1)) {
> > +		xe->needs_flr_on_fini = true;
> > +		drm_err(&xe->drm,
> > +			"CRITICAL: Xe has declared device %s as wedged.\n"
> > +			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> > +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
> > +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"
> 
> this brings back the old version. Alternatively we may simplify the
> error message with:
> 
>  		drm_err(&xe->drm,
>  			"CRITICAL: Xe has declared device %s as wedged.\n"
>  			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
>  			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>  			dev_name(xe->drm.dev));
> 
> 
> up to you.
> 
> > +			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> > +			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> > +			dev_name(xe->drm.dev));
> > +	}
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index c532209c5bbd..0fea5c18f76d 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -181,19 +181,6 @@ static inline bool xe_device_wedged(struct xe_device *xe)
> > 	return atomic_read(&xe->wedged);
> > }
> > 
> > -static inline void xe_device_declare_wedged(struct xe_device *xe)
> > -{
> > -	if (!atomic_xchg(&xe->wedged, 1)) {
> > -		xe->needs_flr_on_fini = true;
> > -		drm_err(&xe->drm,
> > -			"CRITICAL: Xe has declared device %s as wedged.\n"
> > -			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> > -			"echo '%s' > /sys/bus/pci/drivers/xe/unbind\n"
> > -			"echo '%s' > /sys/bus/pci/drivers/xe/bind\n"
> > -			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> > -			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> > -			dev_name(xe->drm.dev));
> > -	}
> > -}
> > +void xe_device_declare_wedged(struct xe_device *xe);
> > 
> > #endif
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> > index 02ce8d204622..48f6da53a292 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > @@ -26,6 +26,15 @@ void xe_exec_queue_fini(struct xe_exec_queue *q);
> > void xe_exec_queue_destroy(struct kref *ref);
> > void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
> > 
> > +static inline struct xe_exec_queue *
> > +xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
> > +{
> > +	if (kref_get_unless_zero(&q->refcount))
> > +		return q;
> > +
> > +	return NULL;
> > +}
> > +
> > struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id);
> > 
> > static inline struct xe_exec_queue *xe_exec_queue_get(struct xe_exec_queue *q)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index 93df2d7969b3..8e9c4b990fbb 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -245,7 +245,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> > 			return seqno;
> > 
> > 		xe_gt_tlb_invalidation_wait(gt, seqno);
> > -	} else if (xe_device_uc_enabled(xe)) {
> > +	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
> > 		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> > 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
> > 			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index 757cbbb87869..dbd88ae20aa3 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -20,6 +20,7 @@
> > #include "xe_lrc.h"
> > #include "xe_map.h"
> > #include "xe_mmio.h"
> > +#include "xe_module.h"
> > #include "xe_platform_types.h"
> > #include "xe_wa.h"
> > 
> > @@ -394,11 +395,17 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
> > 
> > static void guc_policies_init(struct xe_guc_ads *ads)
> > {
> > +	u32 global_flags = 0;
> > +
> > 	ads_blob_write(ads, policies.dpc_promote_time,
> > 		       GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US);
> > 	ads_blob_write(ads, policies.max_num_work_items,
> > 		       GLOBAL_POLICY_MAX_NUM_WI);
> > -	ads_blob_write(ads, policies.global_flags, 0);
> > +
> > +	if (xe_modparam.wedged_mode == 2)
> > +		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> > +
> > +	ads_blob_write(ads, policies.global_flags, global_flags);
> > 	ads_blob_write(ads, policies.is_valid, 1);
> > }
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index c7d38469fb46..0bea17536659 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -35,6 +35,7 @@
> > #include "xe_macros.h"
> > #include "xe_map.h"
> > #include "xe_mocs.h"
> > +#include "xe_module.h"
> > #include "xe_ring_ops_types.h"
> > #include "xe_sched_job.h"
> > #include "xe_trace.h"
> > @@ -59,6 +60,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> > #define ENGINE_STATE_SUSPENDED		(1 << 5)
> > #define EXEC_QUEUE_STATE_RESET		(1 << 6)
> > #define ENGINE_STATE_KILLED		(1 << 7)
> > +#define EXEC_QUEUE_STATE_WEDGED		(1 << 8)
> > 
> > static bool exec_queue_registered(struct xe_exec_queue *q)
> > {
> > @@ -175,9 +177,20 @@ static void set_exec_queue_killed(struct xe_exec_queue *q)
> > 	atomic_or(ENGINE_STATE_KILLED, &q->guc->state);
> > }
> > 
> > -static bool exec_queue_killed_or_banned(struct xe_exec_queue *q)
> > +static bool exec_queue_wedged(struct xe_exec_queue *q)
> > {
> > -	return exec_queue_killed(q) || exec_queue_banned(q);
> > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_WEDGED;
> > +}
> > +
> > +static void set_exec_queue_wedged(struct xe_exec_queue *q)
> > +{
> > +	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
> > +}
> > +
> > +static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> > +{
> > +	return exec_queue_banned(q) || (atomic_read(&q->guc->state) &
> > +		(EXEC_QUEUE_STATE_WEDGED | ENGINE_STATE_KILLED));
> > }
> > 
> > #ifdef CONFIG_PROVE_LOCKING
> > @@ -240,6 +253,17 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
> > 	free_submit_wq(guc);
> > }
> > 
> > +static void guc_submit_wedged_fini(struct drm_device *drm, void *arg)
> > +{
> > +	struct xe_guc *guc = arg;
> > +	struct xe_exec_queue *q;
> > +	unsigned long index;
> > +
> > +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> > +		if (exec_queue_wedged(q))
> > +			xe_exec_queue_put(q);
> > +}
> > +
> > static const struct xe_exec_queue_ops guc_exec_queue_ops;
> > 
> > static void primelockdep(struct xe_guc *guc)
> > @@ -708,7 +732,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> > 
> > 	trace_xe_sched_job_run(job);
> > 
> > -	if (!exec_queue_killed_or_banned(q) && !xe_sched_job_is_error(job)) {
> > +	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
> > 		if (!exec_queue_registered(q))
> > 			register_engine(q);
> > 		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
> > @@ -844,6 +868,28 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> > 		xe_sched_tdr_queue_imm(&q->guc->sched);
> > }
> > 
> > +static void guc_submit_wedged(struct xe_guc *guc)
> > +{
> > +	struct xe_exec_queue *q;
> > +	unsigned long index;
> > +	int err;
> > +
> > +	xe_device_declare_wedged(guc_to_xe(guc));
> > +	xe_guc_submit_reset_prepare(guc);
> > +	xe_guc_ct_stop(&guc->ct);
> > +
> > +	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
> > +				       guc_submit_wedged_fini, guc);
> > +	if (err)
> > +		return;
> > +
> > +	mutex_lock(&guc->submission_state.lock);
> > +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> > +		if (xe_exec_queue_get_unless_zero(q))
> > +			set_exec_queue_wedged(q);
> > +	mutex_unlock(&guc->submission_state.lock);
> > +}
> > +
> > static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> > {
> > 	struct xe_guc_exec_queue *ge =
> > @@ -852,10 +898,16 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> > 	struct xe_guc *guc = exec_queue_to_guc(q);
> > 	struct xe_device *xe = guc_to_xe(guc);
> > 	struct xe_gpu_scheduler *sched = &ge->sched;
> > +	bool wedged = xe_device_wedged(xe);
> > 
> > 	xe_assert(xe, xe_exec_queue_is_lr(q));
> > 	trace_xe_exec_queue_lr_cleanup(q);
> > 
> > +	if (!wedged && xe_modparam.wedged_mode == 2) {
> 
> I wonder if these checks shouldn't be inside guc_submit_wedged()

true, but since this is anyway changed in the next patch,
I decided to keep it here.

> 
> 
> anyway,
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thank you

> 
> Lucas De Marchi
