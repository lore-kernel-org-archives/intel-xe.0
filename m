Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052ACC2BB3F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 19:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB57810E0BE;
	Mon, 20 Nov 2023 19:34:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D4110E0BE
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 19:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700508846; x=1732044846;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+YA3Dfiu6/NYAm78KJzGdTUhsSKRp1Em1SNuk9PfFQI=;
 b=AYQl3B5/GViFsKlNhxubMZHxsE1VgP/Tse/12YIX8YqaS94S/+pkwWId
 8rzk220W47h3ZOixJF55x/c8cMFe41a3VlTChZ5mpn1hXbs0emJ7yTHkA
 aXZ+n+UTnWH2m9Ov0x/MuPtufdArnJm7f9wWeBiYJdEPk0Kz7/oma7jgw
 y+S9/yXRcZhD0qmvPvgND6JZGai3cMTC6qLfMTcvv+O0Eyeur8V3pNpHG
 mr+J1EOthP1T7mU8ClUNsaF1Qh+XovGxFPNzdKfGghUIri7W2X6gPyob1
 vT9vyljc96QX1k3StC3N8UJod8++4ylTQPiS7v7KWOhI7BYe50ZVltgMy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371864716"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="371864716"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 11:34:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="770006099"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="770006099"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 11:34:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 11:34:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 11:34:03 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 11:34:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxAukxbfullwe76DJwAyrCdASeohRow8QiohwE7szhfC1y5boqUN0VXvUzLJyvApJ9dsLiEg6JDlpnL1N4gl8aypDBX0yhGQX6eklEda+R4DvkVBNvUu2YGFVwEu267mrocm0XmekBm0/XyZWfubWfozuPD7k08zi4zkw4vVQveea/c1Q/OshSNxjODyKOyIR7opF0zTlubqq70rkxDYqqhHJ0YvkftUd4Qtgp1dR4B8T4GW1cPSOR+hMVwEnNOkziiL3mAVpNL1ky8q729EX9ipJ2JLU1UDPkFqxEj5Pan1UNSzbZAYcZ+un6IyRslWYw1K2nM92P+Zez7uHHjmeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6R0Rdc/pbjLtCHq4Nz3zhiOjoTDXbthPw1RWyUBOXk=;
 b=HWt81e7CMh4RL9VxGX5lUGkd4T2WLjMMTjJGHyEEGgdp8R9HYRVQ0qr3jTipRWLUPYYtPfMQ1VhdQYF8iCqqJaU3IbE5m2+HpHW1thcw5FjDDUSptlvMR7OFka0IbkB88/7X1TnMaUaKstfHqT2TxOPgx9u3D37QchQLfrKg+jbCbQgew3XqqfXHmjZkX8DVTbNbr5QFRkQQFV9Py96LWOmy26bJR9D7TaXOuEPbL+9ab9rEy6TjdQCE4/Obm/DqBqKPXYEHa3NdYRajmvsS3awU2Zko+jmQYX1CTm297XT8WrXBi0LiZUWtvaO331xLOyypBOSmRh2j3sqGinmWNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8089.namprd11.prod.outlook.com (2603:10b6:8:17f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 19:34:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 19:34:01 +0000
Date: Mon, 20 Nov 2023 12:32:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Message-ID: <ZVtR+/twLmWu5Dj5@DUT025-TGLU.fm.intel.com>
References: <20231110062907.3604598-1-aravind.iddamsetty@linux.intel.com>
 <ZU4tWZXqWSlIG7GZ@DUT025-TGLU.fm.intel.com>
 <37cb2bd7-dfbb-c96d-c5d7-8a318a20dd70@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <37cb2bd7-dfbb-c96d-c5d7-8a318a20dd70@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8089:EE_
X-MS-Office365-Filtering-Correlation-Id: 104c663c-4456-41d0-5ea1-08dbe9ffa598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eGD0J4ENNX21YVO6ieHq/de2dGJanWNzBKhqp42rhtN73x9YYj/PMelRx0+wSlVGWtaTg+tDvb8aWb8WHjVnL7aRnepfy6Y2KYHAEZaLvhW4EL2Jud6VpT5ZBkeSeEjeAJYj4heqAjFv5HlocO4uk2NQA/Z6w0UBh2e9x8tCoAU3QWMT8PIR2XwOj/cDlJmePNhqGBh2/ziPJQLhHQywbTgyFcVQzZ5B6tuvB9uT+z0e0sFmpeslTl7ILJl1D2O5uaA3EBTrRljfNgemm9rql//Xe9YgjALAlFtGywU4NvHYWw3e5ZwUJAGwUo94a3JrGWnEOykpH411nhkNM4LBcZbFRzznzNjPRYX3LsI39zCg1unPiD8kdowS0ZHEy4fHAT3OYFWJAtKZl7aO2VZsMV/V0T9/QxEkAY75HxKgmepoSzCDRd6coUqzsxFUxdxV6bCvQfSTOI1H3Bc12+X/HlZ1Q8r9oia+kmOfCiDwlfYc1pIYkvjS8mSb70OfbS6d46ipZF/VbBpWlgYxS+ETSy8EyeugkK03v7sKPnZIL79s3cmHM/wKqUF7FTATP97kEaVmlQ+vNGKroOukDAq9eomeFItcfCC5SLT9Gk3f1W0tL6H5/4ATD3DRX+kuhaVb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(366004)(39860400002)(346002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(186009)(1800799012)(2906002)(5660300002)(4326008)(8936002)(8676002)(82960400001)(86362001)(38100700002)(41300700001)(478600001)(66946007)(66556008)(6916009)(316002)(26005)(66476007)(6486002)(83380400001)(53546011)(44832011)(6506007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OQEU8I5iUxojjQEM4qZNOMRJnVxdowcDuJD+Ip77BEcajZWaJy4wp96KXCnc?=
 =?us-ascii?Q?lTODQvFzZ7ajJji+n/7uPVqERZDAoXIPEcdmuB0fVMoqOz/gLq73bGCgF2bm?=
 =?us-ascii?Q?1cr1QujjmAiuieVcJUE0Nc0Y3XuKmLurz0HjhrqUshE+BuV1Ltu00rWCcngt?=
 =?us-ascii?Q?fZZUaikLWBRVNZkzQAebsROM/7xsyQKF8BOf8ous96eqBiKIGr0Fq5bjUIXp?=
 =?us-ascii?Q?nVMAIs+M153oV9qjnIflaL3ORr4IqNPD9sQR1UXklSd6FTxhHScIf34cxKFd?=
 =?us-ascii?Q?AFocZClNfsdqeCs8/3fgzG3Nzxi0iSVTFu/ptGmA2GwWIWlPrmHpOe2CYaOs?=
 =?us-ascii?Q?w6a/1hX+N4lELd2ZHjA9RxRy3mP6Fb13GU9uCBH4dGFVSS7Emx7uOCbesjqG?=
 =?us-ascii?Q?t8ax2oBHIO3w2nkjnxQCBeXwUXjPu3I76Xz+xAqs72MpdKg6xUEcqJI+bES/?=
 =?us-ascii?Q?kL9sy/M+Oelv2tYb4bjPU3IanPxZeHWAoHRCxfZ42cHkI753VU81SkVPvNBo?=
 =?us-ascii?Q?A1AcmhEzRfpRFUc7lalBvPTOfCLJ7FRSwc6WgPlr2w6y7Oj5OqxmJTS/AnUm?=
 =?us-ascii?Q?jp4dMeDhGHqhBJ+MotQxU+2g7taZOjR4kBeNpwrjjyMcx42+wOeQAKsoZ04L?=
 =?us-ascii?Q?lZR14kKYURZpPfSvEIXsQveS0KW6a0pHlHNrUvJTBGQWy/CLKPwUxWpuNwsz?=
 =?us-ascii?Q?AUJN64Im21aI034vWdnv7hkIwtmMHyBOg6jpK91JM+O305wJoYggoLjZlAwb?=
 =?us-ascii?Q?JAX97sTJS15ReBVAB8hRqHGMGnHkhDHC7D0e9vDh84xSeJpsgKTiAn44x8Sa?=
 =?us-ascii?Q?rCQq/Fp53Al1wrC60fKB/PrfPWGHTqjvXSa403UVI72PfAeLxoB1n6QxWxSk?=
 =?us-ascii?Q?mR6HQOYNuM7IfeNN7hgkgnNMNIYDTVAoaoEOF8KUW/urA4Letqj6tdR8MO9E?=
 =?us-ascii?Q?cyRL1WMeLDxcX+YAeodK8abYuFFe7r4ynvx3CcQBDEOWd4h2rFRBAQB3yG8m?=
 =?us-ascii?Q?HZW7XnkYeVIF0RSU4MNVwMaKokl93CDNy6idmy0se3r6RvRBjuXfZ5grbrXK?=
 =?us-ascii?Q?YkZqP4NZwEoqmN+6P5uSQSpMwHqtNKPbooUNRka4TxSpPWJNue9ybo08XVpi?=
 =?us-ascii?Q?3NR+zZg+IMsfc5BuFsxkYkHecNnVlSaRyajiXZ4aDGMArAPnUKq7A1J0OjSn?=
 =?us-ascii?Q?P7Clf56eYH+lFIw1PCH0cyhgAPyf4pIS+E0ixPDkjMWBAOOqfj+vMJF6kNms?=
 =?us-ascii?Q?HfxtXsA3u4xidg26867LMl0fbCClD6MlvOQsA/dpxFpSwuqtgji47JavpnL0?=
 =?us-ascii?Q?QW89KBTGIdRQxfnBB7j4k7o2Up9YUxIlWhXD+eAqN0q+p5NHhgo+UA85ynG/?=
 =?us-ascii?Q?nBDWo1IkJQaC4UJFseQYXVBDJth/SARCII92eEVe1HF1IOS8pWSrfegj9VcR?=
 =?us-ascii?Q?G0ewir6eojdjPzup4C0lBshkO2rxJXcGzXltSnKzxkOTa7VdI58m3ekE0iyZ?=
 =?us-ascii?Q?y2a4vofRG0XNLK9fyMXDSVrElAPPmEM8Cp5uu5JkYfXWnJ3gIzjdEFufy35X?=
 =?us-ascii?Q?LJDuxrAl7klBQe8j3JudnTKXyna45B6s8bJEz2IMWAsDJyDOI7zDOncGmi61?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 104c663c-4456-41d0-5ea1-08dbe9ffa598
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 19:34:00.8735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yr9SzJZMDZjdyoydfdKK7zcEpsip3AnYRwbPUpHhZilOie83z1lHfDo8mSlbvLlP+CsKir/S6DQs76r0isVkTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8089
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix lockdep warning in xe_force_wake
 calls
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

On Fri, Nov 17, 2023 at 02:18:01PM +0530, Aravind Iddamsetty wrote:
> 
> On 10/11/23 18:47, Matthew Brost wrote:
> > On Fri, Nov 10, 2023 at 11:59:07AM +0530, Aravind Iddamsetty wrote:
> >> Use spin_lock_irqsave, spin_unlock_irqrestore
> >>
> >> Fix for below:
> >> [13994.811263] ========================================================
> >> [13994.811295] WARNING: possible irq lock inversion dependency detected
> >> [13994.811326] 6.6.0-rc3-xe #2 Tainted: G     U
> >> [13994.811358] --------------------------------------------------------
> >> [13994.811388] swapper/0/0 just changed the state of lock:
> >> [13994.811416] ffff895c7e044db8 (&cpuctx_lock){-...}-{2:2}, at:
> >> __perf_event_read+0xb7/0x3a0
> >> [13994.811494] but this lock took another, HARDIRQ-unsafe lock in the
> >> past:
> >> [13994.811528]  (&fw->lock){+.+.}-{2:2}
> >> [13994.811544]
> >>
> >>                and interrupts could create inverse lock ordering between
> >> them.
> >>
> >> [13994.811606]
> >>                other info that might help us debug this:
> >> [13994.811636]  Possible interrupt unsafe locking scenario:
> >>
> >> [13994.811667]        CPU0                    CPU1
> >> [13994.811691]        ----                    ----
> >> [13994.811715]   lock(&fw->lock);
> >> [13994.811744]                                local_irq_disable();
> >> [13994.811773]                                lock(&cpuctx_lock);
> >> [13994.811810]                                lock(&fw->lock);
> >> [13994.811846]   <Interrupt>
> >> [13994.811865]     lock(&cpuctx_lock);
> >> [13994.811895]
> >>                 *** DEADLOCK ***
> >>
> Hi Matt,
> 
> Firstly thanks for your comment and sorry for the late response was OOO on sick the entire week.
> 
> > I don't personally like this. Where in an irq context do we grab this
> > lock? FW probably shouldn't ever be grabbed from an irq context. I see
> > this was changed from a mutex to spin lock in which is pretty suspect
> > IMO.
> with the PMU interface "drm/xe/pmu: Enable PMU interface" we are exposing engine busyness
> counters and the registers fall under GT domain and needed forcewake as PMU is atomic context
> so had to change the forcewake to use spinlock. But other than this i do not think forcewake
> is being called from any irq context, AFAIU lockdep is predicting a scenario and hence the
> warning. which subsided by use of spin_lock_irqsave.
> 
> 
> >
> > 'drm/xe: Use spinlock in forcewake instead of mutex'  
> >
> > If this really needs to be a spin lock I'd rather have versions of
> > xe_force_wake_get/put that called from non-atomic contexts (e.g. use
> > spin_lock_irq) and atomic contexts (e.g. use spin_lock) rather than
> > using spin_lock_irqsave.
> 
> I somehow doubt if lockdep be able to recognize such a use and not warn again.
> 

That is exactly what these calls are for:

spin_lock_irqsave -> don't know if in atomic or non-atomic context
spin_lock -> in a atomic context (irqs are already disabled)
spin_lock_irq -> in a non-atomic context (irqs are enabled)

Generally we should attempt to use spin_lock/spin_lock_irq if possible
as knowing if we are in an atomic / non-atomic code path is a good
practice.

Matt

> Thanks,
> Aravind.
> >
> > Matt
> >
> >> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> >> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> >> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_force_wake.c | 10 ++++++----
> >>  1 file changed, 6 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> >> index 32d6c4dd2807..9bbe8a5040da 100644
> >> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> >> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> >> @@ -145,9 +145,10 @@ int xe_force_wake_get(struct xe_force_wake *fw,
> >>  	struct xe_gt *gt = fw_to_gt(fw);
> >>  	struct xe_force_wake_domain *domain;
> >>  	enum xe_force_wake_domains tmp, woken = 0;
> >> +	unsigned long flags;
> >>  	int ret, ret2 = 0;
> >>  
> >> -	spin_lock(&fw->lock);
> >> +	spin_lock_irqsave(&fw->lock, flags);
> >>  	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> >>  		if (!domain->ref++) {
> >>  			woken |= BIT(domain->id);
> >> @@ -162,7 +163,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
> >>  				   domain->id, ret);
> >>  	}
> >>  	fw->awake_domains |= woken;
> >> -	spin_unlock(&fw->lock);
> >> +	spin_unlock_irqrestore(&fw->lock, flags);
> >>  
> >>  	return ret2;
> >>  }
> >> @@ -174,9 +175,10 @@ int xe_force_wake_put(struct xe_force_wake *fw,
> >>  	struct xe_gt *gt = fw_to_gt(fw);
> >>  	struct xe_force_wake_domain *domain;
> >>  	enum xe_force_wake_domains tmp, sleep = 0;
> >> +	unsigned long flags;
> >>  	int ret, ret2 = 0;
> >>  
> >> -	spin_lock(&fw->lock);
> >> +	spin_lock_irqsave(&fw->lock, flags);
> >>  	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> >>  		if (!--domain->ref) {
> >>  			sleep |= BIT(domain->id);
> >> @@ -191,7 +193,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
> >>  				   domain->id, ret);
> >>  	}
> >>  	fw->awake_domains &= ~sleep;
> >> -	spin_unlock(&fw->lock);
> >> +	spin_unlock_irqrestore(&fw->lock, flags);
> >>  
> >>  	return ret2;
> >>  }
> >> -- 
> >> 2.25.1
> >>
