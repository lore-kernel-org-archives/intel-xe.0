Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B87C761AF
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 18:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410F010E242;
	Wed,  5 Apr 2023 18:56:30 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE85C10E0E9
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 18:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680720987; x=1712256987;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LYNp0oGfj6mey9seHKCnLaG1LWxE+GVKWWNt+jMveQk=;
 b=HfGLa9+y6qaPcEyvh5NP3kG8KoPWC6ThEo3dDWQ5MPGgzkx/LQSkLrfN
 QyTlk9KEMvhWoLDuny3j3P+Zvi0Xkrx+aDvo/o6rHlsXMPjVuEsLg9a+V
 UV8nCDZLhbQ2hhG9FghjsZydUy5dfRpXBT7ano2nn8NCKZqE7TmB85CD5
 zNQuMQbuxO8XrmCkhHS2OPfb2xB9GAQFZsC+VJQjqw1qaVul3ZKLIaGh7
 mSbSEWcN+XpgkCpnhwSC3j8GtlAr9QPYmZyVix69Ra8+NFMns+1RggaZX
 TZQKhzzdVEgOCu20RrnWRLVvZdzxWGslh/O3kZTr4oNvhXfIbpBUhPAV/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="370370969"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="370370969"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 11:56:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="664141407"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="664141407"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 05 Apr 2023 11:56:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 11:56:24 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 11:56:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 11:56:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 11:56:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJRwiYocQepFjDTvcR/175jWCjpnKtwbeooAfWh0rj955A+vH4RnZPZXnJIy/C+2Y89mV4wQF517zhZYju74DaI5aDAJ/BeKT5S2YaH6jxpk2JnS/zuL/0yTMl3Zf9GAa1u5LMVBWKyMdBW9y3A3yoc47txFd0VX/iwqyRq5GNV4yZhQkjeagEQA0dwRNDc+ykVtgF6Uu0Uo83mJdHq9feXZ9Pr4gfzD83YNDsW70uPGnPpJE7WYoIdTFIBzPNH+DX3RxeMM9oel/McWyYVU05rfdOFrsqaJ/sAtrmVLsaYYY4bmkditnuWsUeSseykIv6DTY8p9Xz7JBUqhaFrdWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUvlfkaZ420lAlmD87p9/xiRfcqtlHRf6IqA7ZjJ4Q0=;
 b=iJdMWyB/fYK68RhGa3IsgMjq+C0+DI47Ren1PU34mJCjEk7f7F43OJBlpIurEKg5ya9GEmD/V64KBk3t0tdBF13lwf/unwqxs/hfOeJq3qaQ1OfRnye65SSsCPKzq5cdqs6W120h5lcFOXaL+7GBZ/7ubyW6Dm9XM8jD/Jt4Qqh7XmRydjB1WvQyivkb5dwlz1PQ2GXhvwqV6plasoj92YHwk2lsWaI9R+AL8OguCJyoPy4zJT9d5OWpRIew7M5QM00cqOBZawlMja9RYT6a57zKx26W9i4v9+2fJXlQSw1jYU9s22t23MEDpXW/tlmEEXGc86+pA45tsCgX+rsd7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5955.namprd11.prod.outlook.com (2603:10b6:208:386::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Wed, 5 Apr
 2023 18:56:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%9]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 18:56:20 +0000
Date: Wed, 5 Apr 2023 14:56:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZC3ETPv5uO+pkJdY@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
 <87mt3mz5v5.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87mt3mz5v5.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b31187-9008-4fad-1395-08db3607715b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nI5KwXgMltZjT/iaEq2y8zk1NNT9Pf6TKN26S15jirDiIvNJAsmZXGHysq0zMi3yYDSJWoRIb7B3jItmReM9xwqeTdVrZD8K2HkURzjIolcAsV3rZGlKbbGzJKOjxd7OBGIbhbRo6pmI73c8fdQfsl5xOvV74xqaxXZBtgMeEFEYrL4HINKUI+M/rs0syelyQmXRmkkhfkP1txPo4jM39eoRdrOEClp4KM20JSIPDqz6K6wvISRdND+l5ILI8sJEyqJfQ34heZypY3kEljbdcweIT+aAM88zWzl/AI0li8UB97iVtbEaRcx2LligRnusB/jASjjYI798bE8L2cYyQ3MB6bX1al2iEKCEFpXRnopQ53WaWCWVGnhdCtUmsNoambRr6dlf9ydL8dbfHdq+qld9z5UYDXqh8OxXlx8WcNGOcUBQMHPPzs4zvdu15xXeiG/NbOhkfcIbhTCCwekQjh14hx94xw42jtZmTkD40+AEH6G/N+nKK2aH23jh6hCeHu2Rpvw+ZskqAVXtkvI3Ew/5Qg20T3et9on5ocVMtcW4YTx64zr2Uca9EsgWkL4qFTKrYcRPukatQ/CcKvdiklxiq/weV8MKi61kBpX0Xf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199021)(5660300002)(38100700002)(83380400001)(82960400001)(66946007)(66476007)(66556008)(8676002)(4326008)(2616005)(44832011)(6862004)(8936002)(41300700001)(2906002)(478600001)(86362001)(6636002)(37006003)(316002)(186003)(36756003)(6666004)(6512007)(6506007)(26005)(6486002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j7IM7P2+Quz3kiQHXbt2LURlu/u2A/gVhyhjTcK+InozDgJ/DmKANFV9KRYs?=
 =?us-ascii?Q?LwjuisI4fAZT8x+p9OMNtJeGvFJkcZPruSwYERLXtdS5raHvDGWGaivkBslN?=
 =?us-ascii?Q?E7eRsXkWdfyldOgEYG4gaeyo2ovfr2AMQp5bdEezZ3pfE34dAUW8qHGLyewE?=
 =?us-ascii?Q?2QANRjKdqNkVTqbG+A8b6+QQctIpXh3ENZZcqkb38NxwPJWzwYQM3nHl1Flz?=
 =?us-ascii?Q?9THqilM3SsUANtxqwRm0kgBUL9KgVP7z6uFo0vN8Q5mDkK2ZHgzIXhNIyUDC?=
 =?us-ascii?Q?TT4VaSx92it/n9MMuDdRHdErjMiMLJjuZ6TS+dJYy934KuteZT3SDMSdnQZl?=
 =?us-ascii?Q?Bxjdj+j6f0P+uog1fJgCybsC4EI8Km5t2jcwHHHzQYx0owM5Fs6nAk8PrOko?=
 =?us-ascii?Q?Tu3DRRPx/H1Qb2IGfFwGxVacevQPULUutAea3J7+tHlr44VpXllds3aKZdG+?=
 =?us-ascii?Q?7Pcq5zVRd5TIxWRB8L2CY6vgeFXgtOEl5eRC9qvRxBqvEUlGgGgtr7gFCA/e?=
 =?us-ascii?Q?WhI0wNOJ2d/yMgUZvQtPfy+7OkvUAFPxIEnnUy74UvyOQ2r6Hz/SCACRa7Wu?=
 =?us-ascii?Q?mNnaWgGCSIzh0yXKBs3un4H4ER6xSTOxN4A/Aa0/QRzh4LMQyBEe7kjYENbm?=
 =?us-ascii?Q?+vhNWh9f0t9cpcswb34QZBAoQeV3vKYNCwiCT0ityjtTlWKBD0ZgDh7aFKnD?=
 =?us-ascii?Q?ohwLC+eddq+J2rAFNITxxu1R4RYdem/MW8DX6obhJx+TJxiKRUG5/u89SYQY?=
 =?us-ascii?Q?ByM8c3RDuGY3SBlGMP6V6zlR/BycDGbE00nSEyP3Ev19OO9ZeUd+hnZ01lnI?=
 =?us-ascii?Q?9fsaq9IFiK5ljMywJvm0gbsm2/6PspX5jEoqUUFCYIogmRFBEEaEsK5HXvQ3?=
 =?us-ascii?Q?gJOqqq1EQV6Q+aMZ97LHLM5NUhVlvCbaRueW0i+BrS+rYZnKHszM0ydwVtTL?=
 =?us-ascii?Q?/7XPkrKjBTRE9+roiO/ojpEbjMq0Oo+P3NLFIy0EMPHYcdYqYyzPI9DVM05s?=
 =?us-ascii?Q?RrtoIYoNZbvgKlMJ0RVKBrQNx1+TCSMEWzFuLhB8UrUM0AIl1Osn/SSX/NET?=
 =?us-ascii?Q?GVauuoe0LhzgshBXR5qa0I84afxf7gqmCSkU+9isLzNUQWNgMc06o5m95zL0?=
 =?us-ascii?Q?lK3EZkUhVvjSnPiIuK6RR2W0vdppaC6HpXkB6VBTnBM1UQBQPMuv4wAbHlqK?=
 =?us-ascii?Q?t2X9AeigRQV8N2sVYzt6qmHW9Nn/V7yr2kgvxTrkph2DOeZZOgr9LD+GEWlc?=
 =?us-ascii?Q?ipEqIG7xYUrctGjBfmT6ydu6C2yCpEv31eIP1yTknmy6vHG94lHBhO44o1qC?=
 =?us-ascii?Q?zfIjrN1zQGuXEumKLTWSTpTZVv3kdAuDYVadFHFNvjDG3h0gZDNsAeBMGEeO?=
 =?us-ascii?Q?fPgpMT/g3aRC8XEBmFuBYLkj7puW1bLMo4iLAmK27OaP5QKJ6TzKj2PhvkvQ?=
 =?us-ascii?Q?+DTUSkMF966Llb241TvDQZha3YwjseYA9QP8sRj5Sx9Z3dBS/BrLLx2NjR61?=
 =?us-ascii?Q?KIzm3LQ4CWGIbdfdYQbwrnZOIpGfZaQ4gTdq1vE8T2glD7lEp5xevvdfM95u?=
 =?us-ascii?Q?D3DSh5qvtHCWV+ZIWCk9KlPv2XknPzMIL3ZruXNg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b31187-9008-4fad-1395-08db3607715b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 18:56:20.0597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMzzo5LGFLoRFeypjM1/kb2tobOxDEDOmqDtPVAXpx8V/V8e05IhIDx8ZpCUX9ZbXfFGsPX9yZA+B6HxbEMOXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5955
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/21] xe & i915 display integration ifdef
 cleanups
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
Cc: tvrtko.ursulin@linux.intel.com, joonas.lahtinen@linux.intel.com,
 lucas.demarchi@intel.com, daniel@ffwll.ch, Dave Airlie <airlied@gmail.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 06:49:34PM +0300, Jani Nikula wrote:
> On Wed, 05 Apr 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> > Hey all, here's my first batch of #ifdef cleanups for xe and i915
> > display integration.
> >
> > Many of the patches in this series break the build, and will get fixed
> > by subsequent changes. It's pretty much unavoidable as many of the
> > changes are standalone to i915, and others are fixups.
> >
> > This is pretty straightforward stuff for starters, really. The idea is
> > that in the next rebase, the drm/i915 changes here go *before* any of
> > the current i915 changes.
> >
> > Adding the static inline stubs for xe build in i915 (the !I915 parts) is
> > very helpful in not sprinkling #ifdefs all over the place. A lot of the
> > time, the compiler is able to just compile out lots and lots of
> > unreachable static functions and data without explicitly conditionally
> > building them out. We can leave a lot of it out from "drm/i915/display:
> > Remaining changes to make xe compile". This is crucial especially while
> > upstreaming by keeping the changes to i915 minimal.
> >
> > Also, I think the conditional build and stubs in headers is the least
> > intrusive way of going about this before xe is actually upstream, and it
> > also follows the usual patterns for CONFIG_FOO=n code paths, albeit I915
> > is defined in the Makefile, not in kconfig.
> 
> To this end, would like to get up front acks for the approach from drm
> maintainers and my fellow i915 maintainers.
> 
> Are the drm/i915 patches (i.e. all the ones that are not fixups) in the
> series okay by you for the xe and i915 display integration?

I like the approaches you took on these patches. Having the ifdef at the
.h with the else defining static inline empty ones was the cleanest
approach I've seen so fare here.

Of course, there are still many more cases around and cases where this
simple approach won't be that straighforward or that clean. But this is
a very good start.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

also
Tested-by....

you mention the build breakage in your cover letter, but with the patches
on the right places and all the fixup! applied, the build works fine
everywhere.

> 
> If yes, would you also be okay with merging them to upstream i915 before
> xe is actually submitted upstream, or only as part of the xe (display)
> submission?

I am in favor of this going earlier through drm-intel-next so we avoid
conflicts and rebase issues.

Thanks,
Rodrigo.

> 
> 
> Thanks,
> Jani.
> 
> 
> >
> > BR,
> > Jani.
> >
> >
> >
> > Jani Nikula (21):
> >   fixup! drm/i915/display: Set DISPLAY_MMIO_BASE to 0 for xe
> >   drm/i915: define I915 during i915 driver build
> >   drm/i915/display: add I915 conditional build to intel_lvds.h
> >   fixup! drm/xe/display: Implement display support
> >   drm/i915/display: add I915 conditional build to hsw_ips.h
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   fixup! drm/xe/display: Implement display support
> >   drm/i915/display: add I915 conditional build to i9xx_plane.h
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   drm/i915/display: add I915 conditional build to intel_lpe_audio.h
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   drm/i915/display: add I915 conditional build to intel_pch_refclk.h
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   drm/i915/display: add I915 conditional build to intel_pch_display.h
> >   drm/i915/display: add I915 conditional build to intel_sprite.h
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   fixup! drm/xe/display: Implement display support
> >   drm/i915/display: add I915 conditional build to intel_overlay.h
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   fixup! drm/xe/display: Implement display support
> >
> >  drivers/gpu/drm/i915/display/hsw_ips.h        | 35 +++++++++++
> >  drivers/gpu/drm/i915/display/i9xx_plane.h     | 23 +++++++
> >  drivers/gpu/drm/i915/display/intel_cdclk.c    |  4 +-
> >  drivers/gpu/drm/i915/display/intel_crtc.c     |  6 +-
> >  drivers/gpu/drm/i915/display/intel_display.c  | 15 +----
> >  .../gpu/drm/i915/display/intel_lpe_audio.h    | 20 ++++--
> >  drivers/gpu/drm/i915/display/intel_lvds.h     | 19 ++++++
> >  drivers/gpu/drm/i915/display/intel_overlay.h  | 35 +++++++++++
> >  .../gpu/drm/i915/display/intel_pch_display.h  | 63 +++++++++++++++----
> >  .../gpu/drm/i915/display/intel_pch_refclk.h   | 25 ++++++--
> >  drivers/gpu/drm/i915/display/intel_sprite.c   | 20 +-----
> >  drivers/gpu/drm/i915/display/intel_sprite.h   |  8 +++
> >  drivers/gpu/drm/xe/Makefile                   |  2 -
> >  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  7 +--
> >  14 files changed, 211 insertions(+), 71 deletions(-)
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
