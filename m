Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B36EB64DD
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 18:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB12D10E0F6;
	Mon, 24 Jul 2023 18:24:51 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDCA10E0F6
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 18:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690223088; x=1721759088;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LQgBgOx0hHZ1Ly38arQG9ZgYVCWvtjQnXne1w4QK0eU=;
 b=RivX9BV7IOf8FDFcwQqnkD/no/nqB34JaX1JddGQ4/t9OUcWkHCVBBY/
 KBSR16Bmh7MKBiIsllWoRm4JBPjkf/qjNGAKTSn6jD4VlHlPCL1nFXpJO
 z0gdnTrvbvjcH2kzUQn8Vrtp7I8oCcx6YiY9RcU7ASm2nuqDRy0ddS9RS
 KHo0PqdqOc7WS/caVO+nfg1sYYm3snkkh0XhXea/ZChmAQBjVohFvD6pK
 2XsBOy18q/wJ6/4IkmEsT98EO1M78R2X9Lwi9G0Ecv+nJsTzQf0iMVuKT
 MwGHYAL0/meHNlAlPdSRdmfutHxmjumVn+6hohnhbJykNEsuZdY4GX4Sz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347127346"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="347127346"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 11:24:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="972374588"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="972374588"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 24 Jul 2023 11:24:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 11:24:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 11:24:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 11:24:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 11:24:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkpVF6JSIym9z4Toof0TImtkKJyVR6nPy2xokZozA9/zDajaoI2AxhCvFIlHv0FMIREsgJyJ2vwsdrzL6I1BnuZLagr1iSN75Lp9b1dKH4zpkPKWIcgAyRSrbhiT/G4OfffRbC7adFC0q1WBieKEII90yaHqtICWdNVq6zzNPHC8d+1+KU2tKbSNa2nSMU/n2UTRt5evF5Souwhw0yhO68s6qK5srLl6NqSfE5yWFHmLA8FlB1XFZ/PP7C+JAZnwdI+93VAFzOwQw8KEZKIwQcoORL6kHiEqCPotsbAxCn/i23Kr+nAX9QX4YRTIT89NJxmRwjZJfuPNOHI/7/fPPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WuRBGJvlUOsMjXiG57QwGeg4rG/vhAZfPYvvdMNzLE=;
 b=RXq8ZGDgr1O4nE1eUHspWZ4X7Rs6czW9Rk+glDAkWSUS68qdseQH36xdDcMU24FCA9lZZjrJRVyTQM+5dqdS/T4gWB0Br9KHhztHlIC2JT22is+qgRUJD9vybsC0vTVl2SJvyvQudbaGCZzNBlTRpucwopZc9q0rrRo1KLl0AZrgdFhUoJ15fcH+QJL7nOMP0KWNYnC/H3PWjobZYoFnGVynl4mYSL+HDUYQ4MD+S6TV7DaYyVqJNcy5Qnu8PVcNI+BzmApkFa+EnO4BJ9hg85qDprA0tQHwmgNpZKyTa2I98oaABxCEyeZrbV4OO8ksMUwEUifImdhoDJ4PfkC+VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5907.namprd11.prod.outlook.com (2603:10b6:303:1a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 18:24:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 18:24:38 +0000
Date: Mon, 24 Jul 2023 14:24:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZL7B4iij9xU5hXz1@intel.com>
References: <20230721132030.7-1-francois.dugast@intel.com>
 <ZLqpUr90JRk4fQIR@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZLqpUr90JRk4fQIR@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0094.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: 22fa8fca-d2d0-4a5c-0ea6-08db8c733d68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6zyuUL0hlmfgb76qCXIpxUuFwEcbxIvmJOg+oiT04vNm7nt0epDcEfYqPvo0SYApXLLMiQ0Rx7yvwV4yuP+jiQMHfsIBkZmljpM2UvRPlcNNtGKdY/1LxtV13+7CwgN/jLoe87o+o4opJ1FEoRoIdm19PSGuR9eA700FwunolEm/XDQsoKo7GE/fJVDoxkVNBLQpu81efTpYLf+gVf231iC2fblF9nMPFYGIIm3lm3ta4Hq2njwO5qJx9JIlq58ABIpoOVfEF4kIZyIxgfb7ycOrHeyo2sRVsjnvttaGmMnd4b86z64ueIdLFZgo1+YTUinUNdTNiGQhEzakx2LnekUK3v63IerPf24b+9jGglgZFlJ5f/LIKYIhSSsOpHMPQxaE8qoCfJyl+PNdZTxBWQpDcofew8gLBfl/PiRRtdMu5WgjBxXEs4CSM+7mGtAEXr/EFmcYSho8KQ9luXa3gLshDxpBVwpBnvw0GSJjwqYxydc4uTjlIv3kJ6lmF3MGDBXug59qzvChlE9yfS9Q7pB2Qg76S9IA0YzousU4lkk1LyMRLfRi3ADmp9+PAeEy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199021)(86362001)(82960400001)(38100700002)(4326008)(66556008)(66476007)(6636002)(66946007)(6862004)(37006003)(316002)(41300700001)(478600001)(8936002)(5660300002)(44832011)(8676002)(6486002)(6512007)(6666004)(2906002)(186003)(6506007)(26005)(66899021)(83380400001)(36756003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UN7cOtZZoXmW96lv6jnMMKXJ+9Mt/5PDmh4RwVFzBqWor7BNozHSRBWAzL0l?=
 =?us-ascii?Q?s9SBxTi6oXjeK5nJLQRVwW2DzPDQA2ivbCRhkaAf6V1BsxY1n+PAC1pzhNuI?=
 =?us-ascii?Q?qfZzZnr0MhtyUn2srD67omW+FjJtifbFi1cxal/43/QfnvI4rqOz8aWqyOaz?=
 =?us-ascii?Q?5JJ7tEcwjKzY5z/HbGVjSqvyD7WkTImoVowLDY85HPKRuyTh/AYm6ma9zrgU?=
 =?us-ascii?Q?pSqjJjS2tItuTaksOjlUGafOZOyGucPcOlHgOG0/OZUZTCxP9nF7SXFzqztH?=
 =?us-ascii?Q?AJC1BEwscxWzJ/D1oJ93IPJsG+eq5PS6rj8UIsE9WIRtzMpiXRCmqdBU7W5K?=
 =?us-ascii?Q?d0m7pRbx7vsbYA5FdG/ZnCfB1FBY7Q4AXzCxQKLLGQr+AnFVJTB7WxmTlcEd?=
 =?us-ascii?Q?udXi5M3uQvlMcdglXW5B0kRxsfR7HvgR6iaCtPhs51xB6AM4nEOBvyjwtxF+?=
 =?us-ascii?Q?H6rqE4p1VEzp83PKAu+SmZF37mp4oMWMq44LudK0hg+W7CkJtLBG60DPUc/I?=
 =?us-ascii?Q?wRxq24LCRAq9+rxVl4tRaSfvGozclKQvkb1/5Gw2K2LrMIyk6LWn52RSHWTu?=
 =?us-ascii?Q?az6BCFQVg9aaIMiy2lW9l2gGiNDShpFAg94axCc2XZQvRG/QsJl6IFuTwVOb?=
 =?us-ascii?Q?BanKoCIVdQF8HIn41fjUdNK120kbU5zDPzeEjgwsXAv/NkuF9uxa9B4kKHXM?=
 =?us-ascii?Q?gkom0KOkqqL6WInHA3nNWZGE7htPOVjMwRU7lof+7LSHSmJaJusgIBhRagOa?=
 =?us-ascii?Q?ZjhZCYCnnnIS/4GYINfNKCrnV9MZMnMrQvabvfyqyuJExMtIg+yrnBiudb+n?=
 =?us-ascii?Q?rqcCcUg4zztDVU93EHEOt0zTbSSLLaViE4hNnH1pDLrnziDlBJRmyDTeXicP?=
 =?us-ascii?Q?xjlCZgX7aMkkMk6z+ZdGkLqgdsiFhBpm8/Y3GuL8Cp911hL8CFR5eMQ+jKmS?=
 =?us-ascii?Q?fF3Ooql9ru5G09ttDO7dP5d9MGC5ZscxBEdRwK/Ic1utnZe/XDw/brWzxpiR?=
 =?us-ascii?Q?77pS1qGEGmRQvZJujGStASCGY6QUau/14CPUXI4A5aezkVTgQ1Znp3W+uKHz?=
 =?us-ascii?Q?fvFqm4HTBt1XFZDXr9lEEMYdZ9H4bUthtWJtKtavJpzm8wQLsqCfQV/Q/RrO?=
 =?us-ascii?Q?jea26RRFRShscjbhyjHDRE47gsEQkOec2kDWiq6pAA5JxdLDBp/aaEzIA2BY?=
 =?us-ascii?Q?EagQO/e9o7eF/h5ahsbTDUSbClxU0V8zDgSL+P+ZHOi/TwrUDY/zE/8RjLEg?=
 =?us-ascii?Q?eUCKIsOP1lFc8gbYeIgdjknN0kDAuzNyw8GIGXQzvAfpEJMF0U5EkKc1qVXG?=
 =?us-ascii?Q?dwh+Ol4nDgtbCrzd9CZ8R3l0aJtaQ0Oavs1UajiPpKClyKNs2XCOdjha83+m?=
 =?us-ascii?Q?QM3oJ2CADQ6EIYatxDERm1XtB5vQXWimeuvolmfdAIcTwj002M8faEOKkNZH?=
 =?us-ascii?Q?mVp8fKiBTupF4xEkBPmmbmOFT2UZPGlJJSamoEOCaAoghEuZ9QtyK913RIy7?=
 =?us-ascii?Q?OhsNIF404wxvyyCUEu6iF3q3MPb1gpqQM2UojtWNJD8d8FFY/l3SND1rrMlk?=
 =?us-ascii?Q?u9sVQRjBxoYLJC5LcctyrwCohgJTG1QcPG/5gdGA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22fa8fca-d2d0-4a5c-0ea6-08db8c733d68
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 18:24:38.6016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I9DGynrChZ80hkQ1a5rs84Bfrio/pwjnPs47XtUR7QzDkHD70GY/OzXxjMnpC6YCDIHJfyJOmhVH95XfYbHbwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5907
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/1] Remove uses of BUG_ON
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 03:50:42PM +0000, Matthew Brost wrote:
> On Fri, Jul 21, 2023 at 01:20:29PM +0000, Francois Dugast wrote:
> > This is a first pass on removing BUG_ON. It is replaced with a call to
> > drm_err() and a return. Feedback on this is welcome before removing
> > remaining uses of BUG_ON, which will require more manual and specific
> > work.
> > 
> 
> Personally I don't like this at all, agree the BUG_ON should be removed
> but IMO we just replace these with a XE_WARN_ON that gets compiled out
> of non-debug builds.

I disagree here. The BUG_ON cases are in general cases that were marked
as possibly catastrophic, hence the execution should be stopped. But
instead, we need to avoid the code after and exit gracefully with some
error message.

With this in mind I like the initial proposal of this patch here.
I just believe we need to go and change message by message.

>
I like WARN/BUG as they act more like a self
> documenting assert of the codes usage plus if they get trigger we get

The if conditions here are pretty clear in the code as well.
no reason to be some macro in capital letters.

> the call stack which usuaully help diagnosis the issue and disappear in
> non-debug builds.

well, the bug cases should be the catastrophic cases, so in general
I don't see why we should avoid in production mode the cases where
we simply print error and return gracefully and avoiding the
catastrophic scenarios,.

For warns, we should use that in cases where the information of the
stack of the callers is a helpful information for debugging or
triage. And this is usually helpful on production cases as well
to receive bug reports with helpful information.

Also, in general we shouldn't need to disable any kind of message
in production because of the bug report case mentioned above. What
we need to do instead is to carefully mark the debug level for the
drm debug to take care of the messages. So a bug reporter could
enable the right level of debug and collect all the useful info
for us.

That said, I need to say that I hate that we have XE_ variants of
BUG_ON() and WARN_ON(). We need to get rid of this things and use
only the drm and kernel standards.

> 
> Let's see if the team agrees.
> 
> Matt
> 
> > For this pass, most of the changes were automated with coccinelle using:
> > 
> > 	@notpossible@
> > 	@@
> > 
> > 	- XE_BUG_ON("NOT POSSIBLE");
> > 	+ drm_err(&vm->xe->drm, "NOT POSSIBLE");
> > 	+ return -EINVAL;
> > 
> > 	@e@
> > 	identifier macro =~ "^XE_BUG_ON$";
> > 	expression cond;
> > 	@@
> > 	macro(cond)
> > 
> > 	@script : python q@
> > 	cond << e.cond;
> > 	cond_expr;
> > 	@@
> > 	coccinelle.cond_expr = cocci.make_expr("\""+cond.replace(" ", "")+"\"");
> > 
> > 	@replace_in_func_return_struct@
> > 	identifier e.macro;
> > 	expression e.cond;
> > 	expression q.cond_expr;
> > 	identifier func;
> > 	identifier a;
> > 	@@
> > 
> > 	struct a *func(...) {
> > 	...
> > 	- macro(cond);
> > 	+ if (cond) {
> > 	+ drm_err(&xe->drm, cond_expr);
> > 	+ return NULL;
> > 	+ }
> > 	...
> > 	}
> > 
> > 	@replace_in_func_return_void@
> > 	identifier e.macro;
> > 	expression e.cond;
> > 	expression q.cond_expr;
> > 	identifier func;
> > 	@@
> > 
> > 	void func(...) {
> > 	...
> > 	- macro(cond);
> > 	+ if (cond) {
> > 	+ drm_err(&xe->drm, cond_expr);
> > 	+ return;
> > 	+ }
> > 	...
> > 	}
> > 
> > 	@replace_in_func_return_other@
> > 	identifier e.macro;
> > 	expression e.cond;
> > 	expression q.cond_expr;
> > 	@@
> > 
> > 	- macro(cond);
> > 	+ if (cond) {
> > 	+ drm_err(&xe->drm, cond_expr);
> > 	+ return -EINVAL;
> > 	+ }
> > 
> > Francois Dugast (1):
> >   drm/xe: Remove uses of BUG_ON
> > 
> >  drivers/gpu/drm/xe/xe_bo.c                  | 105 ++++++++++++----
> >  drivers/gpu/drm/xe/xe_bo_evict.c            |  10 +-
> >  drivers/gpu/drm/xe/xe_execlist.c            |  22 +++-
> >  drivers/gpu/drm/xe/xe_force_wake.c          |  10 +-
> >  drivers/gpu/drm/xe/xe_gt_clock.c            |   5 +-
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c          |   5 +-
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  31 ++++-
> >  drivers/gpu/drm/xe/xe_guc.c                 |  32 +++--
> >  drivers/gpu/drm/xe/xe_guc_ads.c             |  35 ++++--
> >  drivers/gpu/drm/xe/xe_guc_hwconfig.c        |   5 +-
> >  drivers/gpu/drm/xe/xe_guc_submit.c          |  95 +++++++++++----
> >  drivers/gpu/drm/xe/xe_huc.c                 |   5 +-
> >  drivers/gpu/drm/xe/xe_migrate.c             |  61 ++++++++--
> >  drivers/gpu/drm/xe/xe_sched_job.c           |   9 +-
> >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c      |  10 +-
> >  drivers/gpu/drm/xe/xe_vm.c                  | 125 +++++++++++++++-----
> >  drivers/gpu/drm/xe/xe_wopcm.c               |  45 +++++--
> >  17 files changed, 482 insertions(+), 128 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 
