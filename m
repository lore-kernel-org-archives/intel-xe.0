Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9AFC3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 20:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D9110E3E2;
	Mon, 16 Sep 2024 20:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOy200TV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3957010E3E2
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Sep 2024 20:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726519159; x=1758055159;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pWf4W811adLlbzXYHMutkfWKclHyp1g0FtSLBXhh20g=;
 b=iOy200TVQ8kcCze8ZbFpa+yt9vF4X2eJ904SLZcbnoxJGkxzYOejThS8
 1IYXDvn79xt9eJEm6u84ClCgGFcPKzbB2oApRv27VKpXXrlqjB+heoaF3
 wMH3o+58OOgMF7LlDcpSQjc5jHMhMvx2w3H89dhEKLVP20OV7afRpR8ZK
 qh3Gi0rWhxC6sDkaPY5AjQwYLRMKH7dIgJdSuatm6lBdi+upoBoIhhvF4
 eCJLKV209rdDZ+GCdJohRk/5A5epjy+sHKsjCsubnH66EtgElIRr49rq9
 IUm0lHmmUR3I99rSe7pHZOKQkL1yPqUR7bx2QCs5jw24mwvhOdtxbqQn2 w==;
X-CSE-ConnectionGUID: s69nLthcSqOvZMmPbKhaeA==
X-CSE-MsgGUID: 4BDRk/MmRaCeGpqRCDZtJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="47869798"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="47869798"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 13:39:18 -0700
X-CSE-ConnectionGUID: feAaFBvMSPam+1icd6/ZkA==
X-CSE-MsgGUID: TkyfYVRhQP2cpiGUa1HPfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="69210806"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 13:39:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 13:39:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 13:39:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 13:39:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6pNbwIAjIBaowlBu4XmouEAlTGJPaqKewPSQv6k7H11Uq7KTYpEjfsSsJ8EgGLj9/Jlhu7WSqllXiPaKtcbQY0aYis7yoAfFSPoRW1t/TjdSdWR12oJFfsYqJST+4t+ojUjSQ+W+kctqYhD1/x5+LDngTMfomwB2GfG6pxT4y+waBdjFE8zuwO12eZr5+NvZuvLE/ZP0CTICVW34qtDs+O+vdSTiDVRTqIPTqeXI7nwsVQPOLqlQ5njj9SE7ti8cDLyN30tArE+GrjXkcPv9ZAv1kNFg7IVukss0SCQA1JXGuhbtKOzKDWntmZEc4a7dUPyndVSNYArLGORtjWIfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4BvFE5r0VuuETJmYgoTPvxJ8lZX3PN3GgunQKfLFrU=;
 b=ooXN9Y5BR8UNK2g10Uli/8hNrq1CV9N5Dn5SMWsWLCwOZKsW2PiosneTu2ViySqK9DhRgljA0vKDdwcQfORLSbIsIsFVESxdWG/i9Ht494f7mUb27CwqwF48TQdv4lxFWn8ODyD7u8vSyEgYYlCHQPvXZZsv48jEjBr73vqWOwwqJZan+5HSBEPFHPAz5F27FSw+bWyI/8JTWkmMRkZ7ZGM1RW2+ZRclAAlR7aKn9PuxybbqJ6akJkKBu4vXLWfuMOeNzUobj7eoKoP6KniVcvwgcVX+2u0WIS/PxayI91/b0egFGsKy0LaZYQmaXCh0mpkq2dIn90fH5s+zJF5L8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SJ0PR11MB6575.namprd11.prod.outlook.com (2603:10b6:a03:477::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 16 Sep
 2024 20:39:15 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 20:39:15 +0000
Date: Mon, 16 Sep 2024 13:39:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Move display reference timestamp readout
 to display/
Message-ID: <20240916203912.GO5091@mdroper-desk1.amr.corp.intel.com>
References: <20240913162910.4145142-4-matthew.d.roper@intel.com>
 <Zuh0aTvBXYrKrRzO@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zuh0aTvBXYrKrRzO@intel.com>
X-ClientProxiedBy: SJ0PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::31) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|SJ0PR11MB6575:EE_
X-MS-Office365-Filtering-Correlation-Id: 33632e8c-55b7-44b9-5d0c-08dcd68fa0fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/cPJvZ1YeZTua8pMagvJ3rcc0z/HaaQCCv6cgT/alz8Y1ZwfZChl6JL+ah15?=
 =?us-ascii?Q?OCXP4z1JpM1WC2XddLGn9sx0plOuuea4z35Rj/g2s5IZZpAZEeiEVXgy1J9E?=
 =?us-ascii?Q?bDeJISMgIOZ4XBsR63HuxPDEt+Q6z1/RVwJU/8LH8JHnf1rSIXfhupPfIfGl?=
 =?us-ascii?Q?lJyLPC7yl1GwkxOQry8CwWfCmVJOZTV8BMtYAuX8V8W489OJiWqIKJKnS0oV?=
 =?us-ascii?Q?cuP9GggTh4bWvL50k962BsdKDoLN2rbvFsR5PpkZcuC+14+4+Infa+7TzyCU?=
 =?us-ascii?Q?eb38F9i5nGiMFAkNewJQ2XWZtbgRKbkQ5NevsiWY3dzWpbmsS3SvYUWpZipA?=
 =?us-ascii?Q?L0PRIxsE/6Phu59QjYUACtEmz53jRFAiK5t/E1Oul8p8iq9+aQDBj10Iv9p8?=
 =?us-ascii?Q?YSKruuy3Na7nIQ2uGFEFEtvINp5joeYYMKDW6amkABbsVZqIqQBmwdNegbDU?=
 =?us-ascii?Q?aAHDYEOUktkD1JaqixvomEt9yN3A+KqEwoLccoqq/UOV6pE9nYMO3k1VvwU/?=
 =?us-ascii?Q?fG9dPHDudpTjUop+vhSTJF0zzesX9LbhX79Dx4YrhvncbGEH0nfB4ztZsCzs?=
 =?us-ascii?Q?RVQ0Eepx917nwZJOE7dAK+N8Op/YJ+Z0460UjiY/6/5PRSDn8MYfChD6y88+?=
 =?us-ascii?Q?wyGFnuKrT+J1l7kaWUsYhmc5OK+YwEvZyTFG2f7kgSAYnlLSviMXd7qFc4WH?=
 =?us-ascii?Q?eae61LoXnEzo1KA9Ck6qF2WRH6usaEdLoJr1ONvxkkqSF36HEWfBf9V/MpRz?=
 =?us-ascii?Q?Kft4180qRbXFlcoJ0Z6CUQ6NR4x0hkerqzNXafwRe/EBW3+itxdVGcoKeG+Z?=
 =?us-ascii?Q?Am4RaGKmT6Ea0DLRDiAaXoPtwQxLEqA0HM72f7pjQj4L4DfijWxVvJJl4MVS?=
 =?us-ascii?Q?hVtj7i/b2Ycujx02D2jcke9NI4FYNwzN3KaoJFdi2nbRoRjLjyVBr+sPGGht?=
 =?us-ascii?Q?fd0oncotlDVvK5h5OHXY2ovkgRrnFygR8HOJ1uXYKBpxt6HhwF/4wy/9VHgd?=
 =?us-ascii?Q?OAb1epCtazXkT+mqYSaATg6mFRFQ9B2ci6Ky894XttFtyv5dghdDVQMj/Csm?=
 =?us-ascii?Q?nFp2qvjMzy+/o/0UfKSLlOw/DNCCPjMJYF10s1f2q4d29kUGHu7srk7aNZcQ?=
 =?us-ascii?Q?P6w+YUJ5HUmamS9SKv82oCH2yqH0NL/9vvr83K54QhlRL6zfSaxRBFXae36b?=
 =?us-ascii?Q?+1x40mN0WKFGWalTRuUQxaTHDXK4NvtOinIQt5eFGWj43QH6fIGpssuKCMou?=
 =?us-ascii?Q?6HRpn8ySeMtqitRQm68Ro7kcE4yHnarrfI5E4AY1DL3A3YsNHlWX8P84swZ9?=
 =?us-ascii?Q?nmlQluJRQNV4Z0DJY3LF3Z/3z2Zk6YUbIrR1/0pF/C8IfQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Axd7iUoxyiO/4V+lzBzVxL26ZNIKHtnvcua8fG6TIYz1SIcLUy8n1O+UlgB1?=
 =?us-ascii?Q?XN8EMxThbYrWqSqGbvuI4q3ZxIwhQIBdkPSP1xQc7UDMLTsK5fMck7372eMl?=
 =?us-ascii?Q?4f85acLiKcDtG0A/taVl3tgmzKPF1r8gSsAezhYqMKTl6pdQlJAqWq+Zosno?=
 =?us-ascii?Q?/cKicJKEXv8scuB2AHPRYdvkWCBR8ima5YJMxrWy1+cj3oUtUWmuGmKhxYlj?=
 =?us-ascii?Q?QQS37L1PDUGcqK8sqIUHr03TqGHbQMDbAPrvfAKPQbks52ZeLbeNydEyxGBU?=
 =?us-ascii?Q?CCXJsPmiYCcDTkS83Ui/b8KALhkDfVH4CvUMgk8Mee4P3Perzh4POVN0W4eG?=
 =?us-ascii?Q?ejwp5sY/0xOk/ZLzT8ttyhezq1FMR/U5SJO+91qI2HoE+w2yjbn+KyrTu45h?=
 =?us-ascii?Q?meqgUZiE47B2hTm6kezhbqEXTgyPvA9Ojn42PJP9Kny58wGY+ywx3J3MydV0?=
 =?us-ascii?Q?NoDZYnml59i1mI2hoHTWHDMaoa3cl6DnscuFqfOjJgs0XX9xgFbPHc0vG4qk?=
 =?us-ascii?Q?wj/pI7UIK5D4fj1T5biTZgzzksKVsxXwAtckdoZP0I1lLwVkUnoP4MWkPD5j?=
 =?us-ascii?Q?MLMtD6BtFrWh/5YFZyuOG3eIEHUUx0oM/T8XqPCeBAaFuKkjVWpYL1lY58Sb?=
 =?us-ascii?Q?aIi+x+sKR/RSnbPPxboNrdVIWWljK+n8DnissdueTjhpJkvFpqKrEtK98L5e?=
 =?us-ascii?Q?X3ewV506A+LWwboe6nBznyys2WylNsEsuGeq8wxb4e/kbc7YyTRZv78KvqUe?=
 =?us-ascii?Q?R4ID4A/A1guL3+A1Iiyk7gar5HQDYWJtki31fjuRWbhzyYoW2zn1xPQ4r214?=
 =?us-ascii?Q?5pZH+hiIKN44dcqzqHiBo6cTEwGnie4EA509ZZc102SrVgSomPn0wZuvkn21?=
 =?us-ascii?Q?HvjcYbi87Pct+GF7I5gLz7UG/dWggNZW0E2k4/6UGkySH5Ocyma1PmBCSd1H?=
 =?us-ascii?Q?mYoRWSWeXGfSB7w2ET/8tJQk/8GLwoY4FIHKXzY+D/zIar4leoVOCbVjG640?=
 =?us-ascii?Q?/T73M7I4J8rU45YeHJO5YO/8XvmJvA32GDnCe/V1AcxUbPLsrkWWrVK7w/7Z?=
 =?us-ascii?Q?Tk7UNPdQ8YYXcW451KwDLbV4rxHjWMni+ecDhqcnFiya3qC3BR5Vdwdl3x3W?=
 =?us-ascii?Q?W85ZkRRoPcsPRsZUAeoGb4NEq+yZ5vWjW69beYHTzxZgbH5bk4NsJjW0eOi/?=
 =?us-ascii?Q?j2dU2VtWvc74jHeNMFwxsdpgDjKBKWOr3gYRI2DOGH20R83QfvVvynHco8ke?=
 =?us-ascii?Q?n33UYyZaH8zYxRNIjlY/WPhWmXcVPYBQ9XWHf9VIy3sL+LN2Y1pMjFbfNY+i?=
 =?us-ascii?Q?FKET1zuU8ZF61Kja6KfGVrvB+CF0L9j1X5vTG6q4xhzIpm5hE4PGsjPbMRsw?=
 =?us-ascii?Q?KjdS2LD0ISocSBSSPnCfFnA/ETR8a7338qZICnqzaigVh3UBJiE61Gv+NIJ5?=
 =?us-ascii?Q?eXahp4HxF8HJNQGeRTvOrh6NQYvL/LkPd2USM3g85/f0oAkKTYyMnQprk9sr?=
 =?us-ascii?Q?ZknTXxgeA6NiZAERYikBDqS5JoAOuDyQvfbun083eQSR2hew38h9cPTrnsP/?=
 =?us-ascii?Q?XLnD/Mef3x5cAC0dAHr6LsE2hmd5swhjqEDJfU05M7wl9gZv4+siY00CTTYH?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33632e8c-55b7-44b9-5d0c-08dcd68fa0fd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 20:39:15.0845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndi0HLeKZypWvY9yKQZbt68er1QWn6T6dV8YTcUxRb4estLCksgKXbEWwo2PDTY+H5FrXASaMVz8vNtK/896MdPM+66+C+PdrXO1AtC7GHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6575
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

On Mon, Sep 16, 2024 at 02:09:45PM -0400, Rodrigo Vivi wrote:
> On Fri, Sep 13, 2024 at 09:29:11AM -0700, Matt Roper wrote:
> > It's quite unusual to read display registers as part of GT
> > initialization, but use of the display reference timestamp is one
> > approach to calculating the GT clock frequency on older platforms.
> > Rename the function that does this readout and move it to display/ to
> > make it more clear what's actually happening when this route is taken.
> > Also add an assert that we've probed display before calling this
> > function since we never expect this to be the route taken on platforms
> > that lack display.
> 
> oh! that's ugly.
> How much of this calculations and clocks are actually a coincidence then?
> 
> Shouldn't we be using a GT based timestamp then?
> Or perhaps a MCHBAR one? But why display timestamp would give anything
> GT related?

We choose whether or not to use this register based on CTC_MODE[0].  The
two options are either "Crystal Clock Pin Source (default)" or
"Broadwell Divide Logic."  The description of the latter doesn't really
mean anything to me and doesn't seem to be explained further anywhere in
the bspec that I can find, but presumably it means the clock is tied to
some soc-level clock that also happens to be the same one used as the
display's reference clock.  In fact I suspect that DSSM[31:29] would
have worked just as well for this purpose as TIMESTAMP_OVERRIDE[9:0]
does, but that's still just another display register.  That also likely
means that if we didn't still care about gen12lp platforms in Xe, we
could probably avoid reading the register at all.  I.e., everything
Xe_HP and later has only had a single display reference clock (38.4 MHz)
and we could probably just hardcode that value if we see the "Broadwell
Divide Logic" setting.

The use of this register was introduced (in i915) in commit dab91783338b
("drm/i915: expose command stream timestamp frequency to userspace").
Adding Lionel to the Cc list just in case he remembers any more details
about where the "use display register when CTC_MODE[0] says so"
information was documented at the time.


Matt

> 
> > 
> > In the future we may want to move to an intel_display implementation
> > that can be shared with i915, but we'll leave that for later.
> > 
> > Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/display/xe_display.c | 18 ++++++++++++++++++
> >  drivers/gpu/drm/xe/display/xe_display.h |  4 ++++
> >  drivers/gpu/drm/xe/xe_gt_clock.c        | 24 ++++++------------------
> >  3 files changed, 28 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> > index a3131a67e5b1..ac6d08a5cc73 100644
> > --- a/drivers/gpu/drm/xe/display/xe_display.c
> > +++ b/drivers/gpu/drm/xe/display/xe_display.c
> > @@ -29,6 +29,7 @@
> >  #include "intel_hdcp.h"
> >  #include "intel_hotplug.h"
> >  #include "intel_opregion.h"
> > +#include "xe_mmio.h"
> >  #include "xe_module.h"
> >  
> >  /* Xe device functions */
> > @@ -510,3 +511,20 @@ int xe_display_probe(struct xe_device *xe)
> >  	unset_display_features(xe);
> >  	return 0;
> >  }
> > +
> > +u32 xe_display_read_ref_ts_freq(struct xe_device *xe)
> > +{
> > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > +	u32 ts_override = xe_mmio_read32(mmio, TIMESTAMP_OVERRIDE);
> > +	u32 base_freq, frac_freq;
> > +
> > +	base_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK,
> > +				  ts_override) + 1;
> > +	base_freq *= 1000000;
> > +
> > +	frac_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK,
> > +				  ts_override);
> > +	frac_freq = 1000000 / (frac_freq + 1);
> > +
> > +	return base_freq + frac_freq;
> > +}
> > diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
> > index 17afa537aee5..40030cac7fe9 100644
> > --- a/drivers/gpu/drm/xe/display/xe_display.h
> > +++ b/drivers/gpu/drm/xe/display/xe_display.h
> > @@ -43,6 +43,8 @@ void xe_display_pm_resume(struct xe_device *xe);
> >  void xe_display_pm_runtime_suspend(struct xe_device *xe);
> >  void xe_display_pm_runtime_resume(struct xe_device *xe);
> >  
> > +u32 xe_display_read_ref_ts_freq(struct xe_device *xe);
> > +
> >  #else
> >  
> >  static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) { return 0; }
> > @@ -76,5 +78,7 @@ static inline void xe_display_pm_resume(struct xe_device *xe) {}
> >  static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
> >  static inline void xe_display_pm_runtime_resume(struct xe_device *xe) {}
> >  
> > +static u32 xe_display_read_ref_ts_freq(struct xe_device *xe) { return 0; }
> > +
> >  #endif /* CONFIG_DRM_XE_DISPLAY */
> >  #endif /* _XE_DISPLAY_H_ */
> > diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> > index cc2ae159298e..886c071c10f5 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> > @@ -7,6 +7,7 @@
> >  
> >  #include "xe_gt_clock.h"
> >  
> > +#include "display/xe_display.h"
> >  #include "regs/xe_gt_regs.h"
> >  #include "regs/xe_regs.h"
> >  #include "xe_assert.h"
> > @@ -15,22 +16,6 @@
> >  #include "xe_macros.h"
> >  #include "xe_mmio.h"
> >  
> > -static u32 read_reference_ts_freq(struct xe_gt *gt)
> > -{
> > -	u32 ts_override = xe_mmio_read32(&gt->mmio, TIMESTAMP_OVERRIDE);
> > -	u32 base_freq, frac_freq;
> > -
> > -	base_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK,
> > -				  ts_override) + 1;
> > -	base_freq *= 1000000;
> > -
> > -	frac_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK,
> > -				  ts_override);
> > -	frac_freq = 1000000 / (frac_freq + 1);
> > -
> > -	return base_freq + frac_freq;
> > -}
> > -
> >  static u32 get_crystal_clock_freq(u32 rpm_config_reg)
> >  {
> >  	const u32 f19_2_mhz = 19200000;
> > @@ -57,14 +42,17 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
> >  
> >  int xe_gt_clock_init(struct xe_gt *gt)
> >  {
> > +	struct xe_device *xe = gt_to_xe(gt);
> >  	u32 ctc_reg = xe_mmio_read32(&gt->mmio, CTC_MODE);
> >  	u32 freq = 0;
> >  
> >  	/* Assuming gen11+ so assert this assumption is correct */
> > -	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
> > +	xe_gt_assert(gt, GRAPHICS_VER(xe) >= 11);
> >  
> >  	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
> > -		freq = read_reference_ts_freq(gt);
> > +		xe_gt_assert(gt, xe->info.probe_display);
> > +
> > +		freq = xe_display_read_ref_ts_freq(xe);
> >  	} else {
> >  		u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
> >  
> > -- 
> > 2.45.2
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
