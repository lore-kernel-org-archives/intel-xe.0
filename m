Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3594C77B75
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 19:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BE710E17C;
	Wed,  3 May 2023 19:42:10 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02A010E17C
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 19:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683142928; x=1714678928;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DpvF4H0NQu1iibCdJXht9Pha7fojKaIGjvv94dG4UPw=;
 b=GjKw3T15iHW/Orv9SzS6ZEEqqIeh3mFUNS19vmMjO1PcqSqSXN0P11Qm
 lyJAvJHcNyUTZfiZMVIJeK6PHiUDoDDt1EyGUnk+YIY4odytJr2NKOO/7
 j6gsYHhbDqiTv/JjCQGfFa254PE/pvIglgm4g0fydpd5PQpzvCjOvVv9s
 YUnrYhfyjmedjEOyUxNSs4mOCEo7Qae5+7MW4c8JR5oOjzYx+jmNSdk0t
 URQ/0huhdpjeVHLak/3m9x2I2Ge0TaENAjcvoD4zIvYYfdiDWRxsmufvV
 +yF+h4T+P4Nk4b+IeEywkJVpQEYgMs6e588ui1B1H+bHfdqMoF1BhBZ3A Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="414209991"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; d="scan'208";a="414209991"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 12:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="1026637597"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; d="scan'208";a="1026637597"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 03 May 2023 12:42:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 12:42:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 12:42:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 12:42:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgZ3IksMce/IKViBprF+FCj96wIb654HrqoHWOKIgNGTIExtJrVjoclvwzs1oP2QUcUhzcigBVnzlOaY3nzDUiU7k+OIsu4Q5LILrIc9+VBFnR8YN/VReiL/N010c54H4bai6sr+tFAKuP37mYv/OCyJ22nybceEfBq0worOwWIijgVh+B1jPzISbGK5/eI/ksaC2WHDIwo46TTAAAHKO+9AUWYq6DqzdDR+zoUcd460NFRMb0PxhT0dohCS05BIgciUlxyrT58mBqprubur5Wj9N2B51yoUfplWT8ajO2W8j/Wvi2Wq/Aers1SuWmtgQ+4G4wmVE4oIykEcoUvJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1pF20Nb8faEE/Zq0/Ef9+OiBu0JBnEAkVXY/1urI94=;
 b=jtDER2G+/KAVGat5qW1KVDehRXD4WvkqmB6LX37pWSC3a5s0g8RyN68Ol+JsKRCLbhYzGSmdiP0qSo/gibg11xihaKs2SoytxLJkd9BsCH+eCJPAMDtzktmHY2ONkWmS/CFg8EfBHxK+Apz9ZvM/IQQPy2p1HZtRZ5cy//ANe9IPQ3ZoFjcowPu+82HNSxQIAbe/cbvoY42noALG7aps51i9Q13I2Ggq1JW8P0fWveIaYafuTWUIXfKggHOjJPNUTGdtfPcK1xeC7Nb/Evpw4Eg8xi8VTYc/ihOrct/6R3Y2DmwV6wAHA928YHXSCVIQtionIyfmNdnn/NIPKeMjyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6369.namprd11.prod.outlook.com (2603:10b6:208:3af::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 19:42:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 19:42:04 +0000
Date: Wed, 3 May 2023 15:41:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Message-ID: <ZFK5BjiwP9EyIkly@intel.com>
References: <20230503131005.1602412-1-jani.nikula@intel.com>
 <ZFJpdO7WW5miOo3s@rdvivi-mobl4>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZFJpdO7WW5miOo3s@rdvivi-mobl4>
X-ClientProxiedBy: SJ0PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c753837-c5c6-492a-0735-08db4c0e78dd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6vyKtXjI3LQBBolMMYydbLcth0PFpscNAmDuElToXhQKxXXr5XuoO7HAqZ9B3OFBabe4NddPiTlcF0USGABwkZkVGD+CsU+Ut7R7QZ3qK2gs0CbsxGcIXI9M9Cw3uQPnwLNNAf/TWJHYNlWS+xbTLC68xnXtid04lE/c8TkjvZaYdFwtMmdA2LoGv9sQ39UXVd70imRuGUonVAoRBXn/OgH2NRTaJ7NAlnnZ6z0bVs3sUuBDgcJq3+CWVPHvhisF6Wa0V9H7MZh+ddrJFFuaJIVaIIAucLI34qpDdFtlAE/oZC7vB3QYyprenUbSZLU2xRCoPfuqwYJZTaqRKPwtRjDQwuJ5h/v4wRuJRI2uQ4ZSpIX04AF25IR9jd52iTIMLceeTvtuJu4cZXeVsBGTTA7tqgh4uIqbR1gkmYlJikQBTU0TMZ12VTxJ6XVO1BeMNR3UwaQADjSag65bdp/nhd0MR80Gnx6iJRucNtaKjf6hm0zDpPlUjd8BLzZPrKkwwRcHrYaUxzRCMQ8oU3JSdhnM/RKw6eLQA+JNqI7BnOvUaSJhnaJ6AWlHeaQTe1Eq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199021)(44832011)(186003)(38100700002)(107886003)(6486002)(6666004)(2906002)(478600001)(86362001)(36756003)(6512007)(6506007)(26005)(82960400001)(8936002)(8676002)(316002)(2616005)(5660300002)(41300700001)(83380400001)(66556008)(66476007)(66946007)(4326008)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vLRWutkJMR01GIe27FppqN4J7JK1f2y5zDjcSH2ePhMVsh5GN4Qlbzdg4pkk?=
 =?us-ascii?Q?RjmJr2l5AYbGe11H8kXmqMXJc/NNE9j7qN0p32IH8/i1wEARxBeVxSxclcHD?=
 =?us-ascii?Q?q9aLqu/6G0ESIpkJG67W6LKuN1/In4f0KP8+FQvEjaDEDvb9kUXMmByQS9AN?=
 =?us-ascii?Q?3oiqsVtctU6/ITPYDMjBQoG9YEoN0eoCDWh1o1BQtgi1EUVv8XWu2+R0Gr6h?=
 =?us-ascii?Q?YyRv5yE2+CpHgm05Io5bJPnMyevxiwhYaaz+tggEbQdDTWfEL3obWI3plD10?=
 =?us-ascii?Q?c3cLGh1jqNmYgpAmpQO8BSX3CjUeHV6rw5Ymcm75KGVMnOD6uXhtfMmoiRlH?=
 =?us-ascii?Q?+SNuxfmdcqsRBSb/sAKvlndCiRaMZcLu7qrUY+aRutPsGYOA1WTGwA1M4hhG?=
 =?us-ascii?Q?+iIlpsuIeu3I/3Fv6du78G7iI8Sscbz95caToeWW6kkO+TW6uX6/QGJkgcGH?=
 =?us-ascii?Q?Eg5ahPYMQ2h7yX9uoc/1VM+KhiZfZ0fj6X+S/Z+y7iNeTDBUoxqPLKbRHImS?=
 =?us-ascii?Q?a0GeMQHmHhQfk7dwnv7Jd0UyrrSOtpLVGSb1Qbo/wlAUBnDqAZ8L+KaXOuf6?=
 =?us-ascii?Q?dLtCgyEvsdExcoGTJvqdwbLVY6MC472ABp+4taD+6fohjiR3IvBYoW+1zypE?=
 =?us-ascii?Q?lfiqlrTEMwX+/JRKMNjSXbWHXUleYYf5Ya7+yVsdxPlguFO4WTYBdwZ03FM4?=
 =?us-ascii?Q?1MH6TRayV6pUezAMx4hd/2e01YYpklBvOrarK79GoXA8+YWTkVKmOEAt8nPl?=
 =?us-ascii?Q?Womp7kfujNDYLB3pGASixjzfxfAX5e2ddvFy23vTNy4SupDpGsvH4/b56UaH?=
 =?us-ascii?Q?11hnP7MCK5DhntkMexej0qg0ViBxJtPdGOgRdDEeUr0rhMG7anVpBIcEfXft?=
 =?us-ascii?Q?ppeDx0w7slK+ENcLPaffrEM7g1C3ZxbyjHmHFfXladd9a15DkURMXhU0ET1x?=
 =?us-ascii?Q?FFriUVN1QuGGorMR3rMrPeRaklLtHecS+BZuwbbuL+LzGxGa2VtKQnwokKWg?=
 =?us-ascii?Q?mZdKdX1kFW7UDlP5bGOOA/VxmKnlDzT8XSCCUnjCmPpaFQ8fNyNHtvIoqH9K?=
 =?us-ascii?Q?5rtv1xJV59Cvg/Cc1Rdmia5vpvGACiLWD8rSnITudjfRt60Exv2A1osEIdFW?=
 =?us-ascii?Q?dslUu/oUdTj1ZujXMF/jvtLmv3+nv4JLrnPrIGCmZdtK+F9qoK1Wg0eWjAkn?=
 =?us-ascii?Q?dEaZx/7dn3WJx/XN0B5Xr8ZTkW8pqw483NVRY/i2KRr5jwZxZGBdrZT4t7o+?=
 =?us-ascii?Q?3vAR39IPzy8RJER91CKUVEJQQTiaOBvGONtiGwjE2yJSHjiShfBGG67i+h45?=
 =?us-ascii?Q?OrDK58AfeU0FiXYPIaNdqFGfGoDPuF/Sh2O6LHSh4MzW9YiJ/ELt8PJtiUcN?=
 =?us-ascii?Q?GSutgTYyPyZaPi8qIDRx7tCP+HqTBE16GCxlVTybsBOqPWye3gHw5X2r1oGD?=
 =?us-ascii?Q?e6pI3VmZqWn+3uEDnrYEXt7PrUGRhwVcoTTcOLVLZxgG6kw7P3Wyk+88j1x5?=
 =?us-ascii?Q?/uTchv4VLNZ9ZTy8t3iEPaOqkI6EJZQu5MBQNe7A08ZZIuxfAGwcfS4gYg78?=
 =?us-ascii?Q?7ns2/mh7uQOMdfPnMyJ1mJPh88nzgU91zCCR9lpv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c753837-c5c6-492a-0735-08db4c0e78dd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 19:42:04.8120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAdON379lcCajCoVvjCn0JQVS2LvwFVgrVpOjvKsl6xqtV/mjTealVvdWLIT5ggympsckmwbLhE6jRZcMBsXmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6369
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/18] xe&i915 display integration: add
 uncore and pcode compat layers
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
Cc: Jani Nikula <jani.nikula@intel.com>, lucas.demarchi@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 03, 2023 at 10:02:28AM -0400, Rodrigo Vivi wrote:
> On Wed, May 03, 2023 at 04:09:47PM +0300, Jani Nikula wrote:
> > Add intel_uncore.h and intel_pcode.h compat layers to direct the calls
> > in i915 display code properly, without needing to change a lot of call
> > sites in i915 display.
> > 
> > The main trick or hack here is adding a fake uncore member to struct
> > xe_device, which lets all the call sites use &i915->uncore as before,
> > which we can use in the glue layers to get at the struct xe_device
> > pointer.
> > 
> > The fake uncore is intentionally struct fake_uncore in xe, so you can't
> > really start passing around uncore pointers in display code, only do
> > &i915->uncore, and it'll be the correct, but different type for each
> > driver.
> > 
> > IMO the trick and the compat layers are cleaner than what we've had
> > before, and doesn't force using intel_de_* accessors for non-de
> > registers in i915 display code.
> 
> Nice clean-up.
> 
> Couple comments:
> 
> 1. I believe the fake uncore you created is better than convert entire xe
> to match i915 uncore.
> 
> 2. Does the fixup! as revert works well on autosquash? if so this is really
> neat... I was manually removing the revert and reverted patches on the
> clean-up rebases...

No, this doesn't play nicely with autosquash.
it is better to just use regular revert, then manually removing both patches
on the rebase clean-up...

result of some local experiments here:

You asked to amend the most recent commit, but doing so would make
it empty. You can repeat your command with --allow-empty, or you can
remove the commit entirely with "git reset HEAD^".
interactive rebase in progress; onto 78054149ebf8
Last commands done (14 commands done):
   pick 4358c97316a9 drm/i915/display: Add more macros to remove all direct calls to uncore
   fixup 98a5b4a593bc fixup! drm/i915/display: Add more macros to remove all direct calls to uncore
  (see more in file .git/rebase-merge/done)
Next commands to do (348 remaining commands):
   pick 5388ce02065b drm/i915/display: Remove all uncore mmio accesses in favor of intel_de
   fixup 6d8f5663eaaf fixup! drm/i915/display: Remove all uncore mmio accesses in favor of intel_de
  (use "git rebase --edit-todo" to view and edit)
You are currently rebasing branch 'drm-xe-next' on '78054149ebf8'.
  (all conflicts fixed: run "git rebase --continue")

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	drivers/gpu/drm/xe/

No changes
Could not apply 98a5b4a593bc... fixup! drm/i915/display: Add more macros to remove all direct calls to uncore

---

Then if I allow empty I have some bogus commits to get removed on a next round.
if I --skip then the offending code doesn't get removed.

> 
> > 
> > BR,
> > Jani.
> > 
> > 
> > Jani Nikula (18):
> >   fixup! drm/xe/display: Implement display support
> >   fixup! drm/xe/display: Implement display support
> >   fixup! drm/xe/display: Implement display support
> >   fixup! drm/xe/display: Rename intel_de.h to xe_de.h
> >   fixup! drm/xe/display: Implement display support
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   fixup! drm/xe/display: Implement display support
> >   fixup! drm/i915/display: Add more macros to remove all direct calls to
> >     uncore
> >   fixup! drm/i915/display: Remove all uncore mmio accesses in favor of
> >     intel_de
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
> >   fixup! drm/xe/display: Implement display support
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   fixup! drm/xe/display: Implement display support
> >   fixup! drm/xe/display: Implement display support
> >   fixup! drm/xe/display: Implement display support
> >   fixup! drm/xe/display: Implement display support
> > 
> >  drivers/gpu/drm/i915/display/hsw_ips.c        |   7 +-
> >  drivers/gpu/drm/i915/display/intel_bios.c     |  19 +-
> >  drivers/gpu/drm/i915/display/intel_bw.c       |  34 ++--
> >  drivers/gpu/drm/i915/display/intel_cdclk.c    |  45 ++---
> >  drivers/gpu/drm/i915/display/intel_de.h       |  54 ------
> >  drivers/gpu/drm/i915/display/intel_display.c  |   1 +
> >  .../drm/i915/display/intel_display_power.c    |   3 +-
> >  .../i915/display/intel_display_power_well.c   |   7 +-
> >  drivers/gpu/drm/i915/display/intel_dpio_phy.c |   9 +-
> >  drivers/gpu/drm/i915/display/intel_hdcp.c     |   9 +-
> >  drivers/gpu/drm/i915/display/skl_watermark.c  |  23 +--
> >  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   1 +
> >  .../drm/xe/compat-i915-headers/intel_pcode.h  |  42 +++++
> >  .../drm/xe/compat-i915-headers/intel_uncore.h |  99 +++++++++++
> >  drivers/gpu/drm/xe/display/ext/i915_irq.c     | 134 +++++++-------
> >  .../drm/xe/display/ext/intel_clock_gating.c   |   1 +
> >  .../drm/xe/display/ext/intel_device_info.c    |   1 +
> >  drivers/gpu/drm/xe/display/ext/intel_dram.c   |   3 +-
> >  drivers/gpu/drm/xe/display/xe_de.h            | 163 ------------------
> >  drivers/gpu/drm/xe/xe_device_types.h          |   4 +
> >  drivers/gpu/drm/xe/xe_display.c               |   3 +
> >  drivers/gpu/drm/xe/xe_mmio.h                  |   8 +
> >  22 files changed, 307 insertions(+), 363 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
> >  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> >  delete mode 100644 drivers/gpu/drm/xe/display/xe_de.h
> > 
> > -- 
> > 2.39.2
> > 
