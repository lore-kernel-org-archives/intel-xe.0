Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B1AC6FA99
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 23:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF9E10E06C;
	Fri, 10 Mar 2023 23:56:33 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98AE10E06C
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 23:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678492592; x=1710028592;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0aX5jOvWnL1J+UuvODd12PqHXm8j4lT7c5Kq+oqn4rE=;
 b=m0Aek0GKVvLKkmrZFghpJqQ/S3fDG8EjRKqCUYhdHMAtwwhjQLZW8l50
 Sqh+tW23z53RZ4i6q2yFAnrH7LuCMKaP5HqnVhRLE+xBdduFM64QqkXsX
 WW8i32+cyoq/LRdCtx1Pe9uOT7U4Y6+fjYsgMaqAY+VXDdnXPUxbhbHwl
 +hjI2mEWLxQEWaEB2DxvksVWaVA2fQ+BrJYLHeVGhW3uXZEmN6PiaAtTb
 ri3LXPFjk0P1qU8vbvkmkEDkGUqQh5dISSX1WWm65+xpi7D+01edlB6lR
 +xv8X4TtR3ZOpn94Gj9CYFdlqaVPxVfdi8x5erOxUX7a+U5fj6WHh9k0l w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="338410694"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="338410694"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 15:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="852106799"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="852106799"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 10 Mar 2023 15:56:32 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 15:56:31 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 15:56:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 15:56:31 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 15:56:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwQ12J1LZQd9eiWzBXOyrsQDBT6rl+0KIg44FbZJDkxEudGDFKQqXrJlJHWD9SrpoNKBye4hWpabhGj3fYbq1a+OAdpqZhO8ZbCLuKkH5icLqx2Ssb0bRi7MD9Z5VqTlov+V9Pn3PCl5apmxcKSzgwD/OrKHSfudIgmvfWNwnpui9SHFJResHprrx7dMgpYLKEC/gTo/1OpXB7lVuPbCJHdzM6kF0VolI5LXsfh/a/xBPeeR2GzD50LQfgDoUQW7DmmeQcTWQ/AcFZbkoZpJPMCBAOd//tkzSPRAAZ+Q4A0ygR9YmqO8Lc4+glhDyfmrpZsykPfHKXpdk6qu1jb1mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HODFjFoo0Va6bXxSrLwL2gA5G5T4ONCDpWC8aPmy+Oc=;
 b=FcrNdHEzoTOxV+Zw6uLpJvR6qYCL91EQSnYCKYsBQqqemsTd259UBbglFUAQvJhy7Gyx5F+0RsLj/sK1cZ2OgsG6y+Z0Y0XaZPGEO5p/EmFMyWNw6GvLOt4BZY/xImeH9/nJVY7+Hh7IyVQ7LYKmrw5jKOKWquSsQUotWiLtaJXCF/CVZEZAUI/sExLn5Af3ZlydjPWAV2IqXerLIy/iTQpcE+DF9meplH6hykZYWJLE02it+O94tkdFKlWY7DDXPJEBQL5yhA4ZxZFOy8nb+oe8ETb5xJWELsg1e2z86mgMmVnmOs2ijXPODviN5SQTjouNTuTHxAvF9zAtwLGeCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB7827.namprd11.prod.outlook.com (2603:10b6:930:77::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Fri, 10 Mar 2023 23:56:29 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%6]) with mapi id 15.20.6178.022; Fri, 10 Mar 2023
 23:56:29 +0000
Date: Fri, 10 Mar 2023 15:56:26 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230310235626.GW1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
 <20230310221549.2337402-4-lucas.demarchi@intel.com>
 <20230310235544.GV1175070@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230310235544.GV1175070@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::24) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: 64b5a96c-c124-4e62-da94-08db21c31102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cHZ+F83FUVuvPyWeWGW30ZWnDqGFQ5mgTPa5k7E4JL3WbhNzpUxHIpuMizlm9Rw+SgLb+lEcs28nnI6HyKPdqwbK2MwCkHJmfHOkVz3jOASo/lmcS4KX1I1SEfnEFj1qu8P/Wl6h6gfx38XYAQ5LA1kjFxNegzY4qvvDr9A+Uqi6shG3tjmupz2Jrr4mOPeX3iWs/yS4WL6BIZSMYKdaWMvUZmbyNzkV/NK/+Tvxo5QPY3ybgIXREIqfVdz7ZUDNyP5D+Iy1ZXIRknx38QIJjYUy0bGofLw8TjberhkR0+0N4yvg3fcj8gSu+4Ltoo0KhKKlXL+OoGK30xQt0YtvAs1VmL640LgMWK+HHsyzCY8MncoSxDT7ypiivo7QyEGKc0Et1O3jrpEYFPFDx5tLUQ2GdB/7ytU6/Idpo8+nTkHRxUTXYvwvUq8slG5KnPWDjESP1z4hKfAUwxSD5DDadYbjQgXrWxHN1QIfhm1VOdAAsx1ETJeP+1JupKZqDY/fwIBQfr6skRDNZmC6P5QzfiHdXQwGe/QpsLo0SLWBjIjL+I04THkAHnK/GOjNTrfH6lahhBPrWUo6721LtrmEF42sqZyrrsjujbzfmvTVM5ugUuKkdqfar4jL+Ve+dXzaZWfa+Yga5KXgoOhXzOg53Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199018)(6862004)(8936002)(5660300002)(26005)(1076003)(6506007)(6666004)(38100700002)(66946007)(82960400001)(83380400001)(186003)(6512007)(41300700001)(316002)(6636002)(8676002)(4326008)(66556008)(66476007)(33656002)(86362001)(478600001)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bXO7R84FuVAxV83xM3Gc/6Xwhj7zrRWTgXCWDDnm4IliVKx8sDq1WbpXk7M8?=
 =?us-ascii?Q?YieTT5OkEElJ0cTO7lDDPDyCgGecJJ5BOm/WvFHUtZ7q5VZAnUOpXS7pzhLC?=
 =?us-ascii?Q?BXmchmYDOHJeFyCFVjriWwmEwOgWKaK9DNpkyFPgQSzmGz95fBWbPhzsheja?=
 =?us-ascii?Q?fO+oZPk95d1/iIlbul+3cpTheKC0cMvR6YChmt05PmUXzYkBAHNqYz4SfwIq?=
 =?us-ascii?Q?9VfV9GQPSbh62zKhmXzrSnJtzfWit7uetzpIcQ/caSP1Ua3eKfJFE/yFzkgq?=
 =?us-ascii?Q?v+NS6bU72t3+C+RPH+Aiimm0FuTBJx3S3zvaP1p3kRorNAuP3Fj/2GpYH5iK?=
 =?us-ascii?Q?KUDs4CPDuC4hxjJ9BI+Ih2FIiLLhR7UjHZJr9SwnfEdgAAU0TBTx6KzGaEwH?=
 =?us-ascii?Q?If7gPFacB79b1igH94KS8gQjK9Z7gX9wCRWb/Gc95WXxCtBqlr5ODm46/yWi?=
 =?us-ascii?Q?LNNy2sxAZAArRD+vWLK89v9BT+v+GhR9NgAtzWH0Flhkt7JQFR4WNbdDT2BN?=
 =?us-ascii?Q?MaOR9aTp7ymx0pYTaZT+FU0qIY82eTpiMWEDNtjdVHOaqF2FMz23tyNtUS90?=
 =?us-ascii?Q?DU7ZZdiW7wkFnZbBAM3yBkQ2Yk3EWSphXjjC5wRZf989KL/0jsVIQJSZcTHw?=
 =?us-ascii?Q?caMByCDWnQ8neJwbQXhs+Zhpw2Io5hLzWNTQT1isxG833gpaYbtAGfCj+IlC?=
 =?us-ascii?Q?IRljlQ+kPstGiVaWiRXt+d5RnTgXR3w9toUvBfXY8kp6yeLd2R5sJqz4+P7H?=
 =?us-ascii?Q?WR30wlkWyg3ys12V/2NhFgd8YmGwS7gbGDRxwpxjAyBEBMAiqxfkXl8UczLl?=
 =?us-ascii?Q?PtOsWFdK0xHR7jZnSkpPOey801fL7oxAnXTgyiJDN+QowSJ1aGHoN95tss21?=
 =?us-ascii?Q?VjJhwFz4Xf+x4cylwtOlhIn0RqeXqqRXKEkZ496MckdxhMhcTqfWABGOj2Ko?=
 =?us-ascii?Q?zS4qITJupy693d1iKBJ1QAUjr0RumWAFWJ7e2dz0Ww77r5Eqj3mswvJG8Q3h?=
 =?us-ascii?Q?Ymw4cUANcae0lxMQLblyILM1qu3jBxCXG1rgPIFpX1qrH9MzbalHE/pxSwKx?=
 =?us-ascii?Q?TUdPE64XVDskg8tfEQmaw1RUuDFqdDZlr3rdAjB8/yIPwbPfwf/hroVh0j15?=
 =?us-ascii?Q?I+F6PNfjY/83HBP4Zz5aNppISHOJMvlA/wpH1vrT3M5tDD9/tyb3RjmIQh33?=
 =?us-ascii?Q?DM3r1/mhhAXoSqjdSOdNLRAmngYT1ubovdir+V3mkCWieEuiD6Y/X9jJIGPd?=
 =?us-ascii?Q?cFEdvtHmd1lPux+VrpZOXQrbc00NyICsVMYe0twY9kMYgpUVtw3eBDnDyyeg?=
 =?us-ascii?Q?vYB4h18V6zeNpTrxAmfpl2GjwBr2qHvpkHIpGF0EUwhEZbw5hphjCy0aX58A?=
 =?us-ascii?Q?wf/bLanQ1+tIOutJ9qYL2D5KpPfF90duYzzVAteE7aYkxi64DhSOio1sO0P3?=
 =?us-ascii?Q?VjHj7lfa/GdJhMiFwFl65JLvXUczvlr79RvOGVoBn/nqTTotCAAxnXP+q+Np?=
 =?us-ascii?Q?qpwCDqInpDcbvslBKkYbW44d7irJvstwqb8EUEz17QbuIjcP7PGyiCw96yJz?=
 =?us-ascii?Q?qKtNwg7D1fPxLWDBJ5c5IEK87BlipEF761zy5cGdC932jqUBDgqdB34Tmu73?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b5a96c-c124-4e62-da94-08db21c31102
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 23:56:29.2370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mqzj57UwnUE41J7o9wU8+XiwoaDPK7ETbYkStfognnIwl27vCqkUl3kjjVv3ZCr9netl9rmzqbbZCkMK1BayitGVV/FMymE1xmilU0QoVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7827
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/12] drm/xe: Print whitelist while
 applying
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

On Fri, Mar 10, 2023 at 03:55:47PM -0800, Matt Roper wrote:
> On Fri, Mar 10, 2023 at 02:15:40PM -0800, Lucas De Marchi wrote:
> > Besides printing the various register save-restore, it's also useful to
> > know the register being allowed/denied access to unprivilige batch
> 
> s/to/from/
> 

Hit send too early...aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> 
> > buffers. Print them during device probe.
> > 
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_reg_sr.c        |  4 +++
> >  drivers/gpu/drm/xe/xe_reg_whitelist.c | 41 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_reg_whitelist.h |  7 +++++
> >  3 files changed, 52 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> > index c6f92fe9aad1..f6ed9e6e5697 100644
> > --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> > +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> > @@ -20,6 +20,7 @@
> >  #include "xe_gt_mcr.h"
> >  #include "xe_macros.h"
> >  #include "xe_mmio.h"
> > +#include "xe_reg_whitelist.h"
> >  #include "xe_rtp_types.h"
> >  
> >  #define XE_REG_SR_GROW_STEP_DEFAULT	16
> > @@ -194,6 +195,7 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	struct xe_reg_sr_entry *entry;
> > +	struct drm_printer p;
> >  	unsigned long reg;
> >  	unsigned int slot = 0;
> >  	int err;
> > @@ -207,7 +209,9 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
> >  	if (err)
> >  		goto err_force_wake;
> >  
> > +	p = drm_debug_printer(KBUILD_MODNAME);
> >  	xa_for_each(&sr->xa, reg, entry) {
> > +		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
> >  		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot).reg,
> >  				reg | entry->set_bits);
> >  		slot++;
> > diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > index 2dd10e62718f..6c8577e8dba6 100644
> > --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > @@ -67,3 +67,44 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
> >  {
> >  	xe_rtp_process(register_whitelist, &hwe->reg_whitelist, hwe->gt, hwe);
> >  }
> > +
> > +/**
> > + * xe_reg_whitelist_print_entry - print one whitelist entry
> > + * @p: DRM printer
> > + * @indent: indent level
> > + * @reg: register allowed/denied
> > + * @entry: save-restore entry
> > + *
> > + * Print details about the entry added to allow/deny access
> > + */
> > +void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
> > +				  u32 reg, struct xe_reg_sr_entry *entry)
> > +{
> > +	u32 val = entry->set_bits;
> > +	const char *access_str = "(invalid)";
> > +	unsigned range_bit = 2;
> > +	u32 range_start, range_end;
> > +	bool deny;
> > +
> > +	deny = val & RING_FORCE_TO_NONPRIV_DENY;
> > +
> > +	switch (val & RING_FORCE_TO_NONPRIV_RANGE_MASK) {
> > +	case RING_FORCE_TO_NONPRIV_RANGE_4: range_bit = 4; break;
> > +	case RING_FORCE_TO_NONPRIV_RANGE_16: range_bit = 6; break;
> > +	case RING_FORCE_TO_NONPRIV_RANGE_64: range_bit = 8; break;
> > +	}
> > +
> > +	range_start = reg & REG_GENMASK(25, range_bit);
> > +	range_end = range_start | REG_GENMASK(range_bit, 0);
> > +
> > +	switch (val & RING_FORCE_TO_NONPRIV_ACCESS_MASK) {
> > +	case RING_FORCE_TO_NONPRIV_ACCESS_RW: access_str = "rw"; break;
> > +	case RING_FORCE_TO_NONPRIV_ACCESS_RD: access_str = "read"; break;
> > +	case RING_FORCE_TO_NONPRIV_ACCESS_WR: access_str = "write"; break;
> > +	}
> > +
> > +	drm_printf_indent(p, indent, "REG[0x%x-0x%x]: %s %s access\n",
> > +			  range_start, range_end,
> > +			  deny ? "deny" : "allow",
> > +			  access_str);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.h b/drivers/gpu/drm/xe/xe_reg_whitelist.h
> > index 6e861b1bdb01..c76d81c528da 100644
> > --- a/drivers/gpu/drm/xe/xe_reg_whitelist.h
> > +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.h
> > @@ -6,8 +6,15 @@
> >  #ifndef _XE_REG_WHITELIST_
> >  #define _XE_REG_WHITELIST_
> >  
> > +#include <linux/types.h>
> > +
> > +struct drm_printer;
> >  struct xe_hw_engine;
> > +struct xe_reg_sr_entry;
> >  
> >  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
> >  
> > +void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
> > +				  u32 reg, struct xe_reg_sr_entry *entry);
> > +
> >  #endif
> > -- 
> > 2.39.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
