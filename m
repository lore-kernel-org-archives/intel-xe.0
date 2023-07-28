Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE392C001DE
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 14:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF4910E6FB;
	Fri, 28 Jul 2023 14:24:00 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DD810E6FB
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 14:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690554238; x=1722090238;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LaQ2xRboXVqVgJ7iet5FgFQxa0pfMLGG7JgHQucQMAo=;
 b=lFqG5jL0heWanQWuMixQZNbgAOPdE6MTNiH7O00os0PKOnA7PkXbm4Cn
 h3eZ6ySY66zbcUlsyyHmVB0HG0nqe1Xc4LivQ0csrzc2nNOFxDyevV5sk
 7c9cHwkFplcuudhSSsR6/8KoSLIgY9fqa2RaaS3sT3Brpfzc6cDoP5niN
 OHtssG/CvngzPks17ddBxu1CMBQDwn8m4JIWRWe1Bb9b0qvVXI2Ew0oHr
 x1J++pe2BmnbVnyqxXsLiLYpzerttEBC2hm7WQpdIdKWqE9apl8P+rwH9
 miP10GC21NrdLcDOaJqImzS7SoWZaBzdntHX89t0OOEcPd/xvw4/QbRF/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="371302953"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="371302953"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 07:21:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="901290332"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="901290332"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 28 Jul 2023 07:21:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 07:21:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 07:21:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 07:21:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 07:21:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLOeL+TIVjtmWcZN0xJf+Ft63/R24R3CGIxOp9shlmhfhxSKIvHA2MN3hnFNY0ySC7W8Lng9xP7mdR+J4wHzTEZuu4f7ZDTur+/lPB/bG3YFopMFgl9zjUfHXNwva0cR3acgUDzDkjmowDFdv25Bgqf1spnmMFMs5vFuKIyaT9NgZ7x/+lBDz6wCEx+HaHKSBhFHBVJoAmpGdsiMrrAtbFRxY29EUMQHWEu05ml0jX+C0UHW+dbHFG2mmMm1DuOGEMrGP+cLzgNEkhPqcw06eEbMfBUEefxJI6dfq6lTs0VhSARpdcoDyo80Uh+J2kdKpOzkJdMFboHH/8w2lwJKTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Fe2uws93Y7roTsoKns26ldybt4h+u9RcVYidKGmwCE=;
 b=ZfQGCgsFo71X4F0ZjT+H9k9OAGAsPdM/6ux8JE4Bh64wGW6colqxmleQmCsTaR6YmixyjpVSbYEFEf0VeG8W//A3/gZEp4PtPaztZxPlcIpzqSoU4LDhsLR6MTjU+BZ2w5GM37yIeU3/HHbky+Qye0cR/GbHWKJ0sx6kAiw3u9ghFP4WOfSww/AURXgkpHY7ny+KbmvTr3FBeYJOzuZczvgD1Pv4+YrmTfhLm3A+uElh+I5rTQKnXaBMqJNK3ATNjc8Vx+BgNsNud3sUNDG1m/Cx4+jVZtWwneLXS32bDzFA6JB+enqfKjJpC7ZALTRM2+vylkO3Ou3OnghT6WCXkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 14:21:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 14:21:45 +0000
Date: Fri, 28 Jul 2023 14:20:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZMPOyViB1sL1HJuH@DUT025-TGLU.fm.intel.com>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
 <20230727082235.905240-7-tejas.upadhyay@intel.com>
 <ZMKMuWeQBXsSo2Sb@DUT025-TGLU.fm.intel.com>
 <ZMNHp1f+wwyd9ZTB@nvishwa1-DESK>
 <ZMNMdIXaJrm4RKGJ@DUT025-TGLU.fm.intel.com>
 <SJ1PR11MB62041E3422EBC2A5D9ABC05C8106A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZMNfY83ZteSxWk3w@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZMNfY83ZteSxWk3w@nvishwa1-DESK>
X-ClientProxiedBy: SJ0PR13CA0106.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: fb6fe9fa-32dd-48a3-7e10-08db8f75f8e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gaZw8oET86k+snC+16lr85QauInBo+jaF3wXy6tY8vJqCQU3GyciKncl8WvTaxSPelfwaBmmNOw9OMZ+bSrlP3deT3ksM9TFCMrmih4oshxiDmOkeKhoaN5v6niM084FWS82b9KeDv+6cdiAJ3WU4ce7cMbDbdrdKWLowkpCoOwwKhdJvZCCRMQ6qcXmEHnmzr46whK5HXlFckxgtntxAtYslTpaexBiChIOoanN6ixQcXiDzKmv2yxYKOxnp86cNj/qTOkFRpq29+Qxj18nz2o0HXYMOZCy3fFOIdgRLgpQh9BCusHYWzbNE5i9bnfEreEqdjPKyvGDVotG/grkU99hwi59FVP9VBmN3pJMJhaTYsH/raB18FpWes6hyryNOU5VLpifYf0e7BwuUh1Hi4JnBQHP612RSUoKa1d44xkRCIXY8/qTkVm5fhYmonAcLJdguVo+bAwKSzO/kvaeuVi91YjzWXhOGROxwM+io4EgkiRYbFnDzQjpUWkA8nthqttPZWdgYUAkvNdQGoVlXWeKGEZ1nB3O/T+7hfyATngiFOrzLggCvDoy2TzJWhDV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199021)(6862004)(8676002)(8936002)(86362001)(41300700001)(30864003)(2906002)(83380400001)(6506007)(53546011)(26005)(186003)(44832011)(5660300002)(82960400001)(6486002)(478600001)(6636002)(4326008)(66946007)(66476007)(66556008)(6666004)(38100700002)(54906003)(19627235002)(316002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N4I+4yb3xBIeun2xRfBxUHKfL30P1tmmPQYIm8l2H3z2QXw09rz5qJcARr6H?=
 =?us-ascii?Q?G8XBvkUSLtIe7i6THK+zpQ0fakRK/3lJc7H1+HHCtdwfWcR+v16Rz1PjV4J9?=
 =?us-ascii?Q?rJzB7F7nC3ilXiTO2MH9C7BECx2ip/b4IwC+u+Y5K2CJfA3E6yVXpyEBASqN?=
 =?us-ascii?Q?W0d1RDGt9t9jMgWzyIalADHken8L4QPNh/Oi6o9vo/zcUed0cu20AK35lK4R?=
 =?us-ascii?Q?wZe+4dW2hZypYLD1Ya0H0DFJga0LyP/n3Q4O8Dal9khrfMc052vockrd/vzW?=
 =?us-ascii?Q?Lqjf6i7o6TUzy4uLp7EYHdEJOqE3QNV3klUWmYWOS/TNWbS6Lie2kCexCby/?=
 =?us-ascii?Q?erEQuYH2bhpqzmS1yp+vA4/xPs0C2pBvtFLU6YCkoiny83iBlhcf/KbUFj9N?=
 =?us-ascii?Q?BDh55FSWyFEkwwquLtVn9vBsYH0J+qh3+2qIjcMR+dVwWDmCsI5cVEaTnMbo?=
 =?us-ascii?Q?pUs1UrNUrUEjO+vHSEz3vIQd7mPdW8ohAUkEWaL9GfT+v9rwAhrfUYOBLzMS?=
 =?us-ascii?Q?sLfQXcOic3aJmFnEkg8nUY2aamaoqxeBKhFBLAuxHdB+v8HoCEfvWlG+Hw3o?=
 =?us-ascii?Q?7XbvCjsW+AkO1q7snUKiGV9J5Eh86k9e7tJq4Cae0pjv4QAhL/oHWtmbFCVC?=
 =?us-ascii?Q?UMNDTnCmIA29uUKa+5G2KyFnx3qVp/4kw7nZcAYtmxlLjwfynJav7Uw0NQ9n?=
 =?us-ascii?Q?ymAbzYcIDMTw2Lk7BLu6rj0u1/vcwU4V4Gt3RuAvo4Z5iK34DuLELfHOV2ho?=
 =?us-ascii?Q?1uZqH0dyRCnPsJ/KJsDSCXNsq7V8BtjHLoGfLkFe5fnLK3TxcsbsuHJe63OH?=
 =?us-ascii?Q?3oXk3vW/EMkGa7iaiqyS22UYGcN7PS1Ije/bF6VwO5Zv29JIbmylnl0oTDKV?=
 =?us-ascii?Q?3Pv7TO0k3f6oj6I95u42uH6/fQUTkWHbXx4cKPTaCQ6TuH137x6mxQtokvan?=
 =?us-ascii?Q?ni21ve2kKBv+MxYmdNAt/hn4LEU4lNwVYWWt4NAdT+IkzFeFmpVtZHPzt5KF?=
 =?us-ascii?Q?f4fd6WaCP+5629sdg2GYVSK+JgsXI6cnORUED2cneSmzz2D2A53veMEAYry4?=
 =?us-ascii?Q?L3PEqMPlRgpV8YvcP9koY7ZgABTx2KZvZZh+vpXAMv3pST6HoHiaRxrUePfO?=
 =?us-ascii?Q?t+7yrNiUWw0Ok1iO5iOyNMquIap69Wom6aqTq7yoYYBQ648/FQIYH5w3DPcU?=
 =?us-ascii?Q?FchVGjGdWWMbG285sFcVZGJV6udD9rsOxhyuu1XESn+5H+JHC9WLO1irTrcy?=
 =?us-ascii?Q?96hP0f71WSP14zIMfRkTqh9pQQgYy3DjJZwIKqoYmT6jfWHApSRPmOsY5IA6?=
 =?us-ascii?Q?9YAyRPMW/1duCa5sCmPj0YH/jhpb/TlmTff7HgBctaZgqRrw+Xvo0YREWegL?=
 =?us-ascii?Q?e4yXA+9gUBPtP0NuJyEb58NpgXq1+IvIx0OywOQR7WuXsurafftTd0NN0lYT?=
 =?us-ascii?Q?8UdsidZkYgrvfnweqqhpQbb1++VUfjw6wLYwvO4/GM0jxM0n4utO2xHJgaym?=
 =?us-ascii?Q?fRfNMMFql2m8bX21JBx6X75GBmZl1PVcw07oUnxPRk/voMEwNV+0LeuGYoRa?=
 =?us-ascii?Q?vSP+oiIbGW5caxRPTcVDLqua5RftZa6btkt+WlRxZ92YJ1ii5Uq5xWXC7o50?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6fe9fa-32dd-48a3-7e10-08db8f75f8e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 14:21:45.4139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mC4tRrGbRRcAhiKCAIX+grDfBsQ1RWLkEefNcCZEpkVGx8OMUswVjnd1bu86of4thKEXoNLXJUoN9eiZb6iEKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8146
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V9 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 11:25:39PM -0700, Niranjana Vishwanathapura wrote:
> On Thu, Jul 27, 2023 at 10:54:42PM -0700, Upadhyay, Tejas wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Friday, July 28, 2023 10:35 AM
> > > To: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > xe@lists.freedesktop.org
> > > Subject: Re: [PATCH V9 6/6] drm/xe: Add min/max cap for engine scheduler
> > > properties
> > > 
> > > On Thu, Jul 27, 2023 at 09:44:23PM -0700, Niranjana Vishwanathapura
> > > wrote:
> > > > On Thu, Jul 27, 2023 at 03:26:49PM +0000, Matthew Brost wrote:
> > > > > On Thu, Jul 27, 2023 at 01:52:35PM +0530, Tejas Upadhyay wrote:
> > > > > > Add sysfs entries for the min, max, and defaults for each of
> > > > > > engine scheduler controls for every hardware engine class.
> > > > > >
> > > > > > Non-elevated user IOCTLs to set these controls must be within the
> > > > > > min-max ranges of the sysfs entries, elevated user can set these
> > > > > > controls to any value. However, introduced compile time CONFIG
> > > > > > min-max values which restricts elevated user to be in compile time
> > > > > > min-max range if at all sysfs min/max are violated.
> > > > > >
> > > > > > Sysfs entries examples are,
> > > > > > DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.defaults/
> > > > > > job_timeout_max         job_timeout_ms          preempt_timeout_min
> > > timeslice_duration_max  timeslice_duration_us
> > > > > > job_timeout_min         preempt_timeout_max     preempt_timeout_us
> > > timeslice_duration_min
> > > > > >
> > > > > > DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
> > > > > > .defaults/              job_timeout_min         preempt_timeout_max
> > > preempt_timeout_us      timeslice_duration_min
> > > > > > job_timeout_max         job_timeout_ms          preempt_timeout_min
> > > timeslice_duration_max  timeslice_duration_us
> > > > > >
> > > > > > V9 :
> > > > > >    - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
> > > > > > V8 :
> > > > > >    - fix enforce_sched_limit and avoid code duplication - Niranjana
> > > > > >    - Make sure min < max - Niranjana
> > > > > > V7 :
> > > > > >    - Rebase to replace hw engine with eclass interface
> > > > > >    - return EINVAL in place of EPERM
> > > > > >    - Use some APIs to avoid code duplication
> > > > > > V6 :
> > > > > >    - Rebase changes to reflect per engine class props interface - MattB
> > > > > >    - Use #if ENABLED - MattB
> > > > > >    - Remove MAX_SCHED_TIMEOUT check as range validation is enough
> > > > > > V5 :
> > > > > >    - Rebase to resolve conflicts - CI
> > > > > > V4 :
> > > > > >    - Rebase
> > > > > >    - Update commit to reflect tile addition
> > > > > >    - Use XE_HW macro directly as they are already filtered
> > > > > >      for CONFIG checks - Niranjana
> > > > > >    - Add CONFIG for enable/disable min/max limitation
> > > > > >      on elevated user. Default is enable - Matt/Joonas
> > > > > > V3 :
> > > > > >    - Resolve CI hooks warning for kernel-doc
> > > > > > V2 :
> > > > > >    - Restric min/max setting to #define default min/max for
> > > > > >      elevated user - Himal
> > > > > >    - Remove unrelated changes from patch - Niranjana
> > > > > >
> > > > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/Kconfig                    |   6 +
> > > > > >  drivers/gpu/drm/xe/Kconfig.profile            |  46 +++
> > > > > >  drivers/gpu/drm/xe/xe_engine.c                |  25 +-
> > > > > >  drivers/gpu/drm/xe/xe_hw_engine.c             |   8 +
> > > > > >  drivers/gpu/drm/xe/xe_hw_engine.h             |  31 ++
> > > > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 354
> > > ++++++++++++++++++
> > > > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   2 +
> > > > > >  7 files changed, 466 insertions(+), 6 deletions(-)  create mode
> > > > > > 100644 drivers/gpu/drm/xe/Kconfig.profile
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/Kconfig
> > > > > > b/drivers/gpu/drm/xe/Kconfig index d44794f99338..0a4ea965645b
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/xe/Kconfig
> > > > > > +++ b/drivers/gpu/drm/xe/Kconfig
> > > > > > @@ -83,3 +83,9 @@ depends on DRM_XE  depends on EXPERT  source
> > > > > > "drivers/gpu/drm/xe/Kconfig.debug"
> > > > > >  endmenu
> > > > > > +
> > > > > > +menu "drm/xe Profile Guided Optimisation"
> > > > > > +	visible if EXPERT
> > > > > > +	depends on DRM_XE
> > > > > > +	source "drivers/gpu/drm/xe/Kconfig.profile"
> > > > > > +endmenu
> > > > > > diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> > > > > > b/drivers/gpu/drm/xe/Kconfig.profile
> > > > > > new file mode 100644
> > > > > > index 000000000000..e72f15ec4bf6
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/xe/Kconfig.profile
> > > > > > @@ -0,0 +1,46 @@
> > > > > > +config DRM_XE_JOB_TIMEOUT_MAX
> > > > > > +       int "Default max job timeout (ms)"
> > > > > > +       default 10000 # milliseconds
> > > > > > +       help
> > > > > > +         Configures the default max job timeout after which job will
> > > > > > +         be forcefully taken away from scheduler.
> > > > > > +config DRM_XE_JOB_TIMEOUT_MIN
> > > > > > +       int "Default max job timeout (ms)"
> > > > > > +       default 1 # milliseconds
> > > > > > +       help
> > > > > > +         Configures the default min job timeout after which job will
> > > > > > +         be forcefully taken away from scheduler.
> > > > > > +config DRM_XE_TIMESLICE_MAX
> > > > > > +       int "Default max timeslice duration (us)"
> > > > > > +       default 10000000 # microseconds
> > > > > > +       help
> > > > > > +         Configures the default max timeslice duration between multiple
> > > > > > +         contexts by guc scheduling.
> > > > > > +config DRM_XE_TIMESLICE_MIN
> > > > > > +       int "Default min timeslice duration (us)"
> > > > > > +       default 1 # microseconds
> > > > > > +       help
> > > > > > +         Configures the default min timeslice duration between multiple
> > > > > > +         contexts by guc scheduling.
> > > > > > +config DRM_XE_PREEMPT_TIMEOUT_MAX
> > > > > > +       int "Default max  preempt timeout (us)"
> > > > > > +       default 10000000 # microseconds
> > > > > > +       help
> > > > > > +         Configures the default max preempt timeout after which context
> > > > > > +         will be forcefully taken away and higher priority context will
> > > > > > +         run.
> > > > > > +config DRM_XE_PREEMPT_TIMEOUT_MIN
> > > > > > +       int "Default min  preempt timeout (us)"
> > > > > > +       default 1 # microseconds
> > > > > > +       help
> > > > > > +         Configures the default min preempt timeout after which context
> > > > > > +         will be forcefully taken away and higher priority context will
> > > > > > +         run.
> > > > > > +config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> > > > > > +       bool "Default configuration of limitation on scheduler timeout"
> > > > > > +       default y
> > > > > > +       help
> > > > > > +	 Configures the enablement of limitation on scheduler timeout
> > > > > > +	 to apply to applicable user. For elevated user, all above MIN
> > > > > > +	 and MAX values will apply when this configuration is enable to
> > > > > > +	 apply limitation. By default limitation is applied.
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_engine.c
> > > > > > b/drivers/gpu/drm/xe/xe_engine.c index 9e167b113963..d934196eb79f
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_engine.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > > > > > @@ -13,6 +13,7 @@
> > > > > >
> > > > > >  #include "xe_device.h"
> > > > > >  #include "xe_gt.h"
> > > > > > +#include "xe_hw_engine_class_sysfs.h"
> > > > > >  #include "xe_hw_fence.h"
> > > > > >  #include "xe_lrc.h"
> > > > > >  #include "xe_macros.h"
> > > > > > @@ -191,8 +192,12 @@ static int engine_set_priority(struct
> > > > > > xe_device *xe, struct xe_engine *e,  static int
> > > engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
> > > > > >  				u64 value, bool create)
> > > > > >  {
> > > > > > -	if (!capable(CAP_SYS_NICE))
> > > > > > -		return -EPERM;
> > > > > > +	u32 min = e->hwe->eclass->sched_props.timeslice_min;
> > > > > > +	u32 max = e->hwe->eclass->sched_props.timeslice_max;
> > > > >
> > > > > So I screwed this up in my last comment, sorry.
> > > > >
> > > > > min = cap_nice ? KConfig option for min :
> > > > > e->hwe->eclass->sched_props.timeslice_min;
> > > > > same logic for max;
> > > > >
> > > > > Probably add helper for this.
> > > > >
> > > > > > +
> > > > > > +	if (enforce_schedule_limit() &&
> > > > > > +	    !engine_timeout_in_range(value, min, max))
> > > > >
> > > > > Then I think logic works too...
> > > > >
> > > > > if cap nice && !Kconfig option to enfore limits (enforce_schedule_limit
> > > returns false):
> > > > > 	user can do whatever
> > > > > else if cap nice
> > > > > 	user within Kconfig range
> > > > > else
> > > > > 	user within sysfs range
> > > > >
> > > > > This is what we want in the end.
> > > > >
> > > >
> > > > Matt, I think this is exactly what the previous revision of the patch was
> > > doing.
> > > >
> > > 
> > > No... Previous version
> > > 
> > > min = Kconfig option to enfore limits ? KConfig option for min : e->hwe-
> > > >eclass->sched_props.timeslice_min
> > > same for max
> > > 
> > > Results in:
> > > 
> > > if cap nice && !Kconfig option to enfore limits (enforce_schedule_limit
> > > returns false):
> > > 	user can do whatever
> > > else if cap_nice || Kconfig option to enfore limit
> > > 	user within Kconfig range
> > > else
> > >  	user within sysfs range
> > > 
> > > !cap_nice && Kconfig option to enfore limits == user within Kconfig range
> > > (previously) !cap_nice && Kconfig option to enfore limits == user within sysfs
> > > range (my suggestion)
> > 
> > In previous version we can achieve it by just adding one below check right?
> > #if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT) && cap_nice
> > +       u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
> > +       u32 max = XE_HW_ENGINE_TIMESLICE_MAX;
> > +#else
> > +       u32 min = e->hwe->eclass->sched_props.timeslice_min;
> > +       u32 max = e->hwe->eclass->sched_props.timeslice_max;
> > +#endif
> > 
> > Please let me know!
> > 
> 
> Ah I see. Yah, it is a limits selection issue.
> We can do,
> 
> u32 min = e->hwe->eclass->sched_props.timeslice_min;
> u32 max = e->hwe->eclass->sched_props.timeslice_max;
> 
> #if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>         if (cap_nice) {
>                 u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
>                 u32 max = XE_HW_ENGINE_TIMESLICE_MAX;
>         }
> #endif
> 
> Matt, Tejas
> Also, looks like you missed my another comment below.
> 

Yea but what I suggest works too unless XE_HW_ENGINE_TIMESLICE_MIN can
be undefined. Same logic so either way.

Matt 

> Niranjana
> 
> > > 
> > > The logic is different and I believe we want what I'm suggesting.
> > > 
> > > Matt
> > > 
> > > > > > +		return -EINVAL;
> > > > > >
> > > > > >  	return e->ops->set_timeslice(e, value);  } @@ -201,8 +206,12 @@
> > > > > > static int engine_set_preemption_timeout(struct xe_device *xe,
> > > > > >  					 struct xe_engine *e, u64 value,
> > > > > >  					 bool create)
> > > > > >  {
> > > > > > -	if (!capable(CAP_SYS_NICE))
> > > > > > -		return -EPERM;
> > > > > > +	u32 min = e->hwe->eclass->sched_props.preempt_timeout_min;
> > > > > > +	u32 max = e->hwe->eclass->sched_props.preempt_timeout_max;
> > > > > > +
> > > > > > +	if (enforce_schedule_limit() &&
> > > > > > +	    !engine_timeout_in_range(value, min, max))
> > > > > > +		return -EINVAL;
> > > > > >
> > > > > >  	return e->ops->set_preempt_timeout(e, value);  } @@ -266,11
> > > > > > +275,15 @@ static int engine_set_persistence(struct xe_device *xe,
> > > > > > struct xe_engine *e,  static int engine_set_job_timeout(struct xe_device
> > > *xe, struct xe_engine *e,
> > > > > >  				  u64 value, bool create)
> > > > > >  {
> > > > > > +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
> > > > > > +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
> > > > > > +
> > > > > >  	if (XE_IOCTL_DBG(xe, !create))
> > > > > >  		return -EINVAL;
> > > > > >
> > > > > > -	if (!capable(CAP_SYS_NICE))
> > > > > > -		return -EPERM;
> > > > > > +	if (enforce_schedule_limit() &&
> > > > > > +	    !engine_timeout_in_range(value, min, max))
> > > > > > +		return -EINVAL;
> > > > > >
> > > > > >  	return e->ops->set_job_timeout(e, value);  } diff --git
> > > > > > a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > > index afa7d25c3852..e601bffe3b13 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > > @@ -364,8 +364,16 @@ static void hw_engine_init_early(struct xe_gt
> > > > > > *gt, struct xe_hw_engine *hwe,
> > > > > >
> > > > > >  	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
> > > > > >  		gt->eclass[hwe->class].sched_props.job_timeout_ms = HZ *
> > > 5;
> > > > > > +		gt->eclass[hwe->class].sched_props.job_timeout_min =
> > > XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> > > > > > +		gt->eclass[hwe->class].sched_props.job_timeout_max =
> > > > > > +XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> > > > > >  		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
> > > > > > +		gt->eclass[hwe->class].sched_props.timeslice_min =
> > > XE_HW_ENGINE_TIMESLICE_MIN;
> > > > > > +		gt->eclass[hwe->class].sched_props.timeslice_max =
> > > > > > +XE_HW_ENGINE_TIMESLICE_MAX;
> > > > > >  		gt->eclass[hwe->class].sched_props.preempt_timeout_us =
> > > 640 *
> > > > > > 1000;
> > > > > > +		gt->eclass[hwe->class].sched_props.preempt_timeout_min =
> > > > > > +
> > > 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> > > > > > +		gt->eclass[hwe->class].sched_props.preempt_timeout_max =
> > > > > > +
> > > 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> > > > > >  		/* Record default props */
> > > > > >  		gt->eclass[hwe->class].defaults = gt->eclass[hwe-
> > > >class].sched_props;
> > > > > >  	}
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h
> > > > > > b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > > > > index 7eca9d53c7b1..3d37d6d44261 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > > > > @@ -10,6 +10,37 @@
> > > > > >
> > > > > >  struct drm_printer;
> > > > > >
> > > > > > +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN #define
> > > > > > +XE_HW_ENGINE_JOB_TIMEOUT_MIN
> > > CONFIG_DRM_XE_JOB_TIMEOUT_MIN #else
> > > > > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1 #endif #ifdef
> > > > > > +CONFIG_DRM_XE_JOB_TIMEOUT_MAX #define
> > > > > > +XE_HW_ENGINE_JOB_TIMEOUT_MAX
> > > CONFIG_DRM_XE_JOB_TIMEOUT_MAX #else
> > > > > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000) #endif #ifdef
> > > > > > +CONFIG_DRM_XE_TIMESLICE_MIN #define
> > > XE_HW_ENGINE_TIMESLICE_MIN
> > > > > > +CONFIG_DRM_XE_TIMESLICE_MIN #else #define
> > > > > > +XE_HW_ENGINE_TIMESLICE_MIN 1 #endif #ifdef
> > > > > > +CONFIG_DRM_XE_TIMESLICE_MAX #define
> > > XE_HW_ENGINE_TIMESLICE_MAX
> > > > > > +CONFIG_DRM_XE_TIMESLICE_MAX #else #define
> > > > > > +XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000) #endif #ifdef
> > > > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> > > > > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
> > > > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN #else #define
> > > > > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1 #endif #ifdef
> > > > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> > > > > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
> > > > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX #else #define
> > > > > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000) #endif
> > > > > > +
> > > > > >  int xe_hw_engines_init_early(struct xe_gt *gt);  int
> > > > > > xe_hw_engines_init(struct xe_gt *gt);  void
> > > > > > xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > > > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > > > > index 990bb675d1e0..2b7ac4e02db6 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > > > > @@ -11,6 +11,20 @@
> > > > > >
> > > > > >  static int xe_add_hw_engine_class_defaults(struct kobject
> > > > > > *parent);
> > > > > >
> > > > > > +bool enforce_schedule_limit(void) { #if
> > > > > > +IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > > > > +	return true;
> > > > > > +#else
> > > > > > +	return !capable(CAP_SYS_NICE);
> > > > > > +#endif
> > > > > > +}
> > > > > > +
> > > > > > +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max) {
> > > > > > +	return timeout >= min && timeout <= max; }
> > > > > > +
> > > > > >  static void kobj_xe_hw_engine_release(struct kobject *kobj)  {
> > > > > >  	kfree(kobj);
> > > > > > @@ -39,11 +53,92 @@ kobj_xe_hw_engine_class(struct kobject
> > > *parent, char *name)
> > > > > >  	return keclass;
> > > > > >  }
> > > > > >
> > > > > > +static ssize_t job_timeout_max_store(struct kobject *kobj,
> > > > > > +				     struct kobj_attribute *attr,
> > > > > > +				     const char *buf, size_t count) {
> > > > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > > > > +	u32 timeout;
> > > > > > +	int err;
> > > > > > +
> > > > > > +	err = kstrtou32(buf, 0, &timeout);
> > > > > > +	if (err)
> > > > > > +		return err;
> > > > > > +
> > > > > > +	if (timeout < eclass->sched_props.job_timeout_min)
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	if (enforce_schedule_limit() &&
> > > > > > +	    !engine_timeout_in_range(timeout,
> > > > > > +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> > > > > > +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	WRITE_ONCE(eclass->sched_props.job_timeout_max, timeout);
> > > > > > +
> > > > > > +	return count;
> > > > > > +}
> > > > > > +
> > > > > > +static ssize_t job_timeout_max_show(struct kobject *kobj,
> > > > > > +				    struct kobj_attribute *attr, char *buf) {
> > > > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > > > > +
> > > > > > +	return sprintf(buf, "%u\n",
> > > > > > +eclass->sched_props.job_timeout_max);
> > > > > > +}
> > > > > > +
> > > > > > +static struct kobj_attribute job_timeout_max_attr =
> > > > > > +__ATTR(job_timeout_max, 0644, job_timeout_max_show,
> > > > > > +job_timeout_max_store);
> > > > > > +
> > > > > > +static ssize_t job_timeout_min_store(struct kobject *kobj,
> > > > > > +				     struct kobj_attribute *attr,
> > > > > > +				     const char *buf, size_t count) {
> > > > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > > > > +	u32 timeout;
> > > > > > +	int err;
> > > > > > +
> > > > > > +	err = kstrtou32(buf, 0, &timeout);
> > > > > > +	if (err)
> > > > > > +		return err;
> > > > > > +
> > > > > > +	if (timeout > eclass->sched_props.job_timeout_max)
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	if (enforce_schedule_limit() &&
> > > > > > +	    !engine_timeout_in_range(timeout,
> > > > > > +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> > > > > > +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	WRITE_ONCE(eclass->sched_props.job_timeout_min, timeout);
> > > > > > +
> > > > > > +	return count;
> > > > > > +}
> > > > > > +
> > > > > > +static ssize_t job_timeout_min_show(struct kobject *kobj,
> > > > > > +				    struct kobj_attribute *attr, char *buf) {
> > > > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > > > > +
> > > > > > +	return sprintf(buf, "%u\n",
> > > > > > +eclass->sched_props.job_timeout_min);
> > > > > > +}
> > > > > > +
> > > > > > +static struct kobj_attribute job_timeout_min_attr =
> > > > > > +__ATTR(job_timeout_min, 0644, job_timeout_min_show,
> > > > > > +job_timeout_min_store);
> > > > > > +
> > > > > >  static ssize_t job_timeout_store(struct kobject *kobj,
> > > > > >  				 struct kobj_attribute *attr,
> > > > > >  				 const char *buf, size_t count)  {
> > > > > >  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > > > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > > > > +	u32 min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> > > > > > +	u32 max = XE_HW_ENGINE_JOB_TIMEOUT_MAX; #else
> > > > > > +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
> > > > > > +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
> > > > > > +#endif
> > > > >
> > > > > I don't think we need this, just make sure default is within min /
> > > > > max of the sched_props.
> > > > >
> > > >
> > > > Shouldn't the sched_prop set through sysfs here which applies to all
> > > > future user engines (xe_engine) has the same requirement as the
> > > > sched_prop set directly to user engine (xe_engine) through set_properly
> > > ioctl?
> > > > ie., shoudln't the requirement be same in job_timeout_store() and
> > > > engine_set_job_timeout()?
> > > >
> > > > Niranjana
> > > >
> > > > > Matt
> > > > >
> > > > > >  	u32 timeout;
> > > > > >  	int err;
> > > > > >
> > > > > > @@ -51,6 +146,10 @@ static ssize_t job_timeout_store(struct kobject
> > > *kobj,
> > > > > >  	if (err)
> > > > > >  		return err;
> > > > > >
> > > > > > +	if (enforce_schedule_limit() &&
> > > > > > +	    !engine_timeout_in_range(timeout, min, max))
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > >  	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
> > > > > >
> > > > > >  	return count;
> > > > > > @@ -78,11 +177,40 @@ static ssize_t job_timeout_default(struct
> > > > > > kobject *kobj,  static struct kobj_attribute job_timeout_def =
> > > > > > __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
> > > > > >
> > > > > > +static ssize_t job_timeout_min_default(struct kobject *kobj,
> > > > > > +				       struct kobj_attribute *attr, char *buf) {
> > > > > > +	struct xe_hw_engine_class_intf *eclass =
> > > > > > +kobj_to_eclass(kobj->parent);
> > > > > > +
> > > > > > +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
> > > > > > +}
> > > > > > +
> > > > > > +static struct kobj_attribute job_timeout_min_def =
> > > > > > +__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
> > > > > > +
> > > > > > +static ssize_t job_timeout_max_default(struct kobject *kobj,
> > > > > > +				       struct kobj_attribute *attr, char *buf) {
> > > > > > +	struct xe_hw_engine_class_intf *eclass =
> > > > > > +kobj_to_eclass(kobj->parent);
> > > > > > +
> > > > > > +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
> > > > > > +}
> > > > > > +
> > > > > > +static struct kobj_attribute job_timeout_max_def =
> > > > > > +__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
> > > > > > +
> > > > > >  static ssize_t timeslice_duration_store(struct kobject *kobj,
> > > > > >  					struct kobj_attribute *attr,
> > > > > >  					const char *buf, size_t count)  {
> > > > > >  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > > > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > > > > +	u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
> > > > > > +	u32 max = XE_HW_ENGINE_TIMESLICE_MAX; #else
> > > > > > +	u32 min = e->hwe->eclass->sched_props.timeslice_min;
> > > > > > +	u32 max = e->hwe->eclass->sched_props.timeslice_max;
> > > > > > +#endif
> > > > > >  	u32 duration;
> > > > > >  	int err;
> > > > > >
> > > > > > @@ -90,11 +218,92 @@ static ssize_t timeslice_duration_store(struct
> > > kobject *kobj,
> > > > > >  	if (err)
> > > > > >  		return err;
> > > > > >
> > > > > > +	if (enforce_schedule_limit() &&
> > > > > > +	    !engine_timeout_in_range(duration, min, max))
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > >  	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
> > > > > >
> > > > > >  	return count;
> > > > > >  }
> > > > > >
> > > > > > +static ssize_t timeslice_duration_max_store(struct kobject *kobj,
> > > > > > +					    struct kobj_attribute *attr,
> > > > > > +					    const char *buf, size_t count) {
> > > > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > > > > +	u32 duration;
> > > > > > +	int err;
> > > > > > +
> > > > > > +	err = kstrtou32(buf, 0, &duration);
> > > > > > +	if (err)
> > > > > > +		return err;
> > > > > > +
> > > > > > +	if (duration < eclass->sched_props.timeslice_min)
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	if (enforce_schedule_limit() &&
> > > > > > +	    !engine_timeout_in_range(duration,
> > > > > > +				     XE_HW_ENGINE_TIMESLICE_MIN,
> > > > > > +				     XE_HW_ENGINE_TIMESLICE_MAX))
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	WRITE_ONCE(eclass->sched_props.timeslice_max, duration);
> > > > > > +
> > > > > > +	return count;
> > > > > > +}
> > > > > > +
> > > > > > +static ssize_t timeslice_duration_max_show(struct kobject *kobj,
> > > > > > +					   struct kobj_attribute *attr,
> > > > > > +					   char *buf)
> > > > > > +{
> > > > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > > > > +
> > > > > > +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
> > > > > > +}
> > > > > > +
> > > > > > +static struct kobj_attribute timeslice_duration_max_attr =
> > > > > > +	__ATTR(timeslice_duration_max, 0644,
> > > timeslice_duration_max_show,
> > > > > > +	       timeslice_duration_max_store);
> > > > > > +
> > > > > > +static ssize_t timeslice_duration_min_store(struct kobject *kobj,
> > > > > > +					    struct kobj_attribute *attr,
> > > > > > +					    const char *buf, size_t count) {
> > > > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > > > > +	u32 duration;
> > > > > > +	int err;
> > > > > > +
> > > > > > +	err = kstrtou32(buf, 0, &duration);
> > > > > > +	if (err)
> > > > > > +		return err;
> > > > > > +
> > > > > > +	if (duration > eclass->sched_props.timeslice_max)
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	if (enforce_schedule_limit() &&
> > > > > > +	    !engine_timeout_in_range(duration,
> > > > > > +				     XE_HW_ENGINE_TIMESLICE_MIN,
> > > > > > +				     XE_HW_ENGINE_TIMESLICE_MAX))
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	WRITE_ONCE(eclass->sched_props.timeslice_min, duration);
> > > > > > +
> > > > > > +	return count;
> > > > > > +}
> > > > > > +
> > > > > > +static ssize_t timeslice_duration_min_show(struct kobject *kobj,
> > > > > > +					   struct kobj_attribute *attr, char
> > > *buf) {
> > > > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > > > > +
> > > > > > +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
> > > > > > +}
> > > > > > +
> > > > > > +static struct kobj_attribute timeslice_duration_min_attr =
> > > > > > +	__ATTR(timeslice_duration_min, 0644,
> > > timeslice_duration_min_show,
> > > > > > +	       timeslice_duration_min_store);
> > > > > > +
> > > > > >  static ssize_t timeslice_duration_show(struct kobject *kobj,
> > > > > >  		struct kobj_attribute *attr, char *buf)  { @@ -118,11 +327,40
> > > > > > @@ static ssize_t timeslice_default(struct kobject *kobj,  static
> > > > > > struct kobj_attribute timeslice_duration_def =
> > > > > > __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
> > > > > >
> > > > > > +static ssize_t timeslice_min_default(struct kobject *kobj,
> > > > > > +				     struct kobj_attribute *attr, char *buf) {
> > > > > > +	struct xe_hw_engine_class_intf *eclass =
> > > > > > +kobj_to_eclass(kobj->parent);
> > > > > > +
> > > > > > +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min); }
> > > > > > +
> > > > > > +static struct kobj_attribute timeslice_duration_min_def =
> > > > > > +__ATTR(timeslice_duration_min, 0444, timeslice_min_default,
> > > > > > +NULL);
> > > > > > +
> > > > > > +static ssize_t timeslice_max_default(struct kobject *kobj,
> > > > > > +				     struct kobj_attribute *attr, char *buf) {
> > > > > > +	struct xe_hw_engine_class_intf *eclass =
> > > > > > +kobj_to_eclass(kobj->parent);
> > > > > > +
> > > > > > +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max); }
> > > > > > +
> > > > > > +static struct kobj_attribute timeslice_duration_max_def =
> > > > > > +__ATTR(timeslice_duration_max, 0444, timeslice_max_default,
> > > > > > +NULL);
> > > > > > +
> > > > > >  static ssize_t preempt_timeout_store(struct kobject *kobj,
> > > > > >  				     struct kobj_attribute *attr,
> > > > > >  				     const char *buf, size_t count)  {
> > > > > >  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > > > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > > > > +	u32 min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> > > > > > +	u32 max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX; #else
> > > > > > +	u32 min = e->hwe->eclass->sched_props.preempt_timeout_min;
> > > > > > +	u32 max = e->hwe->eclass->sched_props.preempt_timeout_max;
> > > > > > +#endif
> > > > > >  	u32 timeout;
> > > > > >  	int err;
> > > > > >
> > > > > > @@ -130,6 +368,10 @@ static ssize_t preempt_timeout_store(struct
> > > kobject *kobj,
> > > > > >  	if (err)
> > > > > >  		return err;
> > > > > >
> > > > > > +	if (enforce_schedule_limit() &&
> > > > > > +	    !engine_timeout_in_range(timeout, min, max))
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > >  	WRITE_ONCE(eclass->sched_props.preempt_timeout_us, timeout);
> > > > > >
> > > > > >  	return count;
> > > > > > @@ -158,17 +400,129 @@ static ssize_t
> > > > > > preempt_timeout_default(struct kobject *kobj,  static struct
> > > > > > kobj_attribute preempt_timeout_def =  __ATTR(preempt_timeout_us,
> > > > > > 0444, preempt_timeout_default, NULL);
> > > > > >
> > > > > > +static ssize_t preempt_timeout_min_default(struct kobject *kobj,
> > > > > > +					   struct kobj_attribute *attr,
> > > > > > +					   char *buf)
> > > > > > +{
> > > > > > +	struct xe_hw_engine_class_intf *eclass =
> > > > > > +kobj_to_eclass(kobj->parent);
> > > > > > +
> > > > > > +	return sprintf(buf, "%u\n",
> > > > > > +eclass->defaults.preempt_timeout_min);
> > > > > > +}
> > > > > > +
> > > > > > +static struct kobj_attribute preempt_timeout_min_def =
> > > > > > +__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default,
> > > > > > +NULL);
> > > > > > +
> > > > > > +static ssize_t preempt_timeout_max_default(struct kobject *kobj,
> > > > > > +					   struct kobj_attribute *attr,
> > > > > > +					   char *buf)
> > > > > > +{
> > > > > > +	struct xe_hw_engine_class_intf *eclass =
> > > > > > +kobj_to_eclass(kobj->parent);
> > > > > > +
> > > > > > +	return sprintf(buf, "%u\n",
> > > > > > +eclass->defaults.preempt_timeout_max);
> > > > > > +}
> > > > > > +
> > > > > > +static struct kobj_attribute preempt_timeout_max_def =
> > > > > > +__ATTR(preempt_timeout_max, 0444,
> > > preempt_timeout_max_default,
> > > > > > +NULL);
> > > > > > +
> > > > > > +static ssize_t preempt_timeout_max_store(struct kobject *kobj,
> > > > > > +					 struct kobj_attribute *attr,
> > > > > > +					 const char *buf, size_t count) {
> > > > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > > > > +	u32 timeout;
> > > > > > +	int err;
> > > > > > +
> > > > > > +	err = kstrtou32(buf, 0, &timeout);
> > > > > > +	if (err)
> > > > > > +		return err;
> > > > > > +
> > > > > > +	if (timeout < eclass->sched_props.preempt_timeout_min)
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	if (enforce_schedule_limit() &&
> > > > > > +	    !engine_timeout_in_range(timeout,
> > > > > > +
> > > XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> > > > > > +
> > > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_max, timeout);
> > > > > > +
> > > > > > +	return count;
> > > > > > +}
> > > > > > +
> > > > > > +static ssize_t preempt_timeout_max_show(struct kobject *kobj,
> > > > > > +					struct kobj_attribute *attr, char *buf)
> > > {
> > > > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > > > > +
> > > > > > +	return sprintf(buf, "%u\n",
> > > > > > +eclass->sched_props.preempt_timeout_max);
> > > > > > +}
> > > > > > +
> > > > > > +static struct kobj_attribute preempt_timeout_max_attr =
> > > > > > +	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
> > > > > > +	       preempt_timeout_max_store);
> > > > > > +
> > > > > > +static ssize_t preempt_timeout_min_store(struct kobject *kobj,
> > > > > > +					 struct kobj_attribute *attr,
> > > > > > +					 const char *buf, size_t count) {
> > > > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > > > > +	u32 timeout;
> > > > > > +	int err;
> > > > > > +
> > > > > > +	err = kstrtou32(buf, 0, &timeout);
> > > > > > +	if (err)
> > > > > > +		return err;
> > > > > > +
> > > > > > +	if (timeout > eclass->sched_props.preempt_timeout_max)
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	if (enforce_schedule_limit() &&
> > > > > > +	    !engine_timeout_in_range(timeout,
> > > > > > +
> > > XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> > > > > > +
> > > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_min, timeout);
> > > > > > +
> > > > > > +	return count;
> > > > > > +}
> > > > > > +
> > > > > > +static ssize_t preempt_timeout_min_show(struct kobject *kobj,
> > > > > > +					struct kobj_attribute *attr, char *buf)
> > > {
> > > > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > > > > +
> > > > > > +	return sprintf(buf, "%u\n",
> > > > > > +eclass->sched_props.preempt_timeout_min);
> > > > > > +}
> > > > > > +
> > > > > > +static struct kobj_attribute preempt_timeout_min_attr =
> > > > > > +	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
> > > > > > +	       preempt_timeout_min_store);
> > > > > > +
> > > > > >  static const struct attribute *defaults[] = {
> > > > > >  	&job_timeout_def.attr,
> > > > > > +	&job_timeout_min_def.attr,
> > > > > > +	&job_timeout_max_def.attr,
> > > > > >  	&timeslice_duration_def.attr,
> > > > > > +	&timeslice_duration_min_def.attr,
> > > > > > +	&timeslice_duration_max_def.attr,
> > > > > >  	&preempt_timeout_def.attr,
> > > > > > +	&preempt_timeout_min_def.attr,
> > > > > > +	&preempt_timeout_max_def.attr,
> > > > > >  	NULL
> > > > > >  };
> > > > > >
> > > > > >  static const struct attribute *files[] = {
> > > > > >  	&job_timeout_attr.attr,
> > > > > > +	&job_timeout_min_attr.attr,
> > > > > > +	&job_timeout_max_attr.attr,
> > > > > >  	&timeslice_duration_attr.attr,
> > > > > > +	&timeslice_duration_min_attr.attr,
> > > > > > +	&timeslice_duration_max_attr.attr,
> > > > > >  	&preempt_timeout_attr.attr,
> > > > > > +	&preempt_timeout_min_attr.attr,
> > > > > > +	&preempt_timeout_max_attr.attr,
> > > > > >  	NULL
> > > > > >  };
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > > > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > > > > index 757136614672..2e2ab351a991 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > > > > @@ -10,6 +10,8 @@
> > > > > >
> > > > > >  #define MAX_ENGINE_CLASS_NAME_LEN    16
> > > > > >  int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
> > > > > > +bool enforce_schedule_limit(void); bool
> > > > > > +engine_timeout_in_range(u64 timeout, u64 min, u64 max);
> > > > > >
> > > > > >  /**
> > > > > >   * struct kobj_eclass - A eclass's kobject struct that connects
> > > > > > the kobject and the
> > > > > > --
> > > > > > 2.25.1
> > > > > >
