Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A0AC7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 17:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC3310E336;
	Fri, 27 Jun 2025 17:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKB9hzeY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757CB10E336
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 17:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751045728; x=1782581728;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oN00zrb4pHWImKDuYsGxC4S6yQbx+QXuxivf9XOWOGg=;
 b=YKB9hzeYWrtu6yINhGopU8vAujWAK58GKfKcOA4toTaWEKQ93I0CRkel
 Itzjb8wLRjpWFGGOCev51BawjDKx5e465WHDwulGhrpzDO+R/NW9b70Iu
 rhSQtQK2rnUHqFQMlmzzToxsNh/O5kc49ntwCVg4RK61AmaUEpAitgyUk
 /JNBt/sYVEdb9n5relM5IWYapw8SkgGsJ/J7+iwuA7YoWpaQYKeBVfark
 TWlImiZe9FfpCmiA1BUlbPoxvqkIBXcRnxFsGg9IOYa265WwyKRIySXKV
 ZXpu1QlU1ayCgC6+Gx9jC3MLKTcMAmLZXNB+C6gHWiDnC8G+gkBAgvxjp Q==;
X-CSE-ConnectionGUID: JE5LvD6BSai1PJzzh+HWUQ==
X-CSE-MsgGUID: jtYGI1+/TVKt8MBXAGzLLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="52594371"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="52594371"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 10:35:27 -0700
X-CSE-ConnectionGUID: sBMGWIUKSqGXCt1TtRjMnw==
X-CSE-MsgGUID: Bv6v4ko2TfOE9pSm45tPNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="176531909"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 10:35:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 10:35:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 10:35:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.79)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 10:35:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lELbJn7AiUmVEEfNCJY+8JmDP1nGwNC+mnEUbFKgM27H5R13ZuD6oK98/YdfSc6QEbtmfVm7ylid5C4NiwcAKTc3DDa9YC5jPyUN7KSX3WbnFQA5lSUvOA85sN2cKwqLbTaTg2GkTU0mdNpCmWeeb7VrSTmaafoy4vta9by1zwD9Q4wwOf2SnPTjFG7lzd8VmxFZtpxOwXSrKth5l7axEEhx9cVYBs2i/dgoB+0CqFG7KwZMHO1YiC2HPf8MPyluWI4EQhugWbTSLECJbHWdRW1S30uzn2DesbMeXi2SKIDDi1DuVd7eG5M4DOlQ72AVq+j620UoJvqaDfpW9nbivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/76Sxa7TcZ9O+G4SQkZGlHlRYZ/hQh+NqsbDLOCWCIs=;
 b=ZnpAgTYEo45oLy1yBSvzW6L4ktyAIexEADWFXKD6pf1EMCaD4QjbPYO39WigdOS+BA7BO7F30DAqtdTLmV4qBx7pTdRAw7P3S6YQo4KMVMK+ARoktnF3dCjD4XgQiv4f/00ktMorLmE1BXWig8L60oJZrnh1jv2MULPCNXC/Ve7jmAs98+gLE+o/fS+iTsipZVjRqCjkXNGtkoHEHHlYLQBgJsHFWQZPUh7asYNoxYI6jrxmntRBEVXeeXuW3sgovicKSkbU/BB6DBbobNPi3ZzUrYarOtqPCNybWBf/wcZB+JSSTyAoV4tG0kXaAyFUktD0MkwY4dx4Ws+G1uPnIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7298.namprd11.prod.outlook.com (2603:10b6:610:14c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Fri, 27 Jun
 2025 17:35:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 17:35:21 +0000
Date: Fri, 27 Jun 2025 10:37:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.mrozek@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe: Add more SVM GT stats
Message-ID: <aF7WvCN1BHXSxod1@lstrano-desk.jf.intel.com>
References: <20250603233445.2304383-1-matthew.brost@intel.com>
 <20250603233445.2304383-3-matthew.brost@intel.com>
 <aEAe4dnl5MaFW0r9@fdugast-desk>
 <aEBUhFQIugQ96l1k@lstrano-desk.jf.intel.com>
 <aF7HBdf7QNKPDVLF@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aF7HBdf7QNKPDVLF@fdugast-desk>
X-ClientProxiedBy: MW4PR03CA0253.namprd03.prod.outlook.com
 (2603:10b6:303:b4::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5e35bc-9fe8-4ca7-86c6-08ddb5a0fda4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PVhRk5nKUsmuDAoFsdAfoMBWadEzeBIezIzSXFx64XOTgEL20j2nDhjbw0Og?=
 =?us-ascii?Q?4wpY1geml/QCxlBDrDC9vD5pXXRD7LFTO51ejd6WsWW7Vr1rOf8AXWChp0N0?=
 =?us-ascii?Q?MzCZ2frutj6BsYsW/eY/j6UqgHMYavjNEhLwDqxMWq+JdgWBT0pWsXHnrQ7U?=
 =?us-ascii?Q?bz9zHxc3z8mNl4T6/rw+KddcF6p3nF89LDVJtrHrBrYEJ0d2XbBYugp0+NBc?=
 =?us-ascii?Q?P1M/APgGfXBhtF38SOYHTRrpmIQRpfJaMqhh9KdJyBnQuINVT+GyZ+q6irYf?=
 =?us-ascii?Q?iC6acvN9w3You7JJLRm/rP9ma4RrFR8JMwb4+QX4iwvKSs6xRxRORhsDLIcH?=
 =?us-ascii?Q?CyvQ8ZZEmOBasIkYWUF7T1K1VlciEKhS/Hhh03jqAZreRjLFW2rC9AqvJhJN?=
 =?us-ascii?Q?sYZ5MlZl2i2hcOj7DvKheWkCO/Gkwdnsl7yqjRwnox7ARN1s8OLBI8BXZ6U7?=
 =?us-ascii?Q?wd8Zvk1Q70yal+SXtR0ErIjhe95Of/q9reI3/kSpWNZoQjHf0EKiRJAEnUCI?=
 =?us-ascii?Q?FWJyFngbX+Ed69iElDwpttij+u+TQuOq8v+hfpmIqtGcORBpH+QdAOPtic8i?=
 =?us-ascii?Q?i2/Rty80SygxV24E61+PG4eJdgx8sbLnuzj/RmhiJw18QQ4CKAXRmXQYcoOA?=
 =?us-ascii?Q?R4gkbUTAFO/bys/Q5g4qwbwGoUi3T1O/WDkvhR6WOH1ImPtAvn0GHUAzUOI6?=
 =?us-ascii?Q?glJ7mfqMeEqSPuwLqAj27WGk1Y/uGLQ0cp4jk33p4FmVgRBrLEDEEqKzTaTN?=
 =?us-ascii?Q?f9a2lGn3sYVaU80tLYaND5OrrAY/ZRuCEBTpBtBY7WyKFtYRAJwBzSrkiVvB?=
 =?us-ascii?Q?RuY3NtPhr76A7WtSVVXpBkW5olmQJMs8SIe6nKcB0ryimIvWQcEt8shf/rg2?=
 =?us-ascii?Q?cCSeGyYr0Jpsb3KmqKAUymPg7wovVzyjdye7OBShl+YWCGfd4OAp/74b136B?=
 =?us-ascii?Q?0CxrHGPX6bNnPCPwUZ1EKZv3aTW5UmD4I3cOAPT1sICJXWgkKD4MHm3XgQmo?=
 =?us-ascii?Q?Ph+2xsTSdyST5qTm0uobBeQUBPf351sNibQ4wzkhu9opnCq4DvFx3bQmj5Vm?=
 =?us-ascii?Q?nVCddfsy0OpB+nbsYSldHezf7zr7ah9DysalTPZDMHG6KUd0A1+OJJoJrW+n?=
 =?us-ascii?Q?aIjkqjdIG6MrA9M11u/zHjNYY+O4DXQXE5FpOFjNc2+L/L5Govrt+94bCFCe?=
 =?us-ascii?Q?5a1bg+PkRXfUbnhC9JbSbe/nJg6WrV7ibKoe2x/FvE6Ly1RI4wPPK7gu7ih4?=
 =?us-ascii?Q?Yfovpax0FNg8njxZM0WY0tHV47S2PShXjxINepPkwL/ZBA7tD4zTvXc23pBR?=
 =?us-ascii?Q?ahLSxnmvtObwQgR0kEUq9vdLzAdvw4wqXMuh7D18tmE1f++B8Lc/ex7Qcb2K?=
 =?us-ascii?Q?5+cI8xEAduaBGMDRpAH0oIAbYPmJRiCLE0ZJzu3oFnY6x2HusdrqPJDXGEC+?=
 =?us-ascii?Q?21gAPuWBeTo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hzVHz+tOtC4jBR+3PI95KK/Ux5pacO3Vqzb0+WvtSHYWKYOurt5xgFQOI2ul?=
 =?us-ascii?Q?OmjyNfHohpWGzxyYyaTX5eZNzydL+fCY2+6wxomVgNh3lqUrOct2sKS6LCco?=
 =?us-ascii?Q?av1JIldWOMyuKmkjg8ViViI5og76IyE9+VNHpjJb5PrOjwvH4b2XYunDxxJt?=
 =?us-ascii?Q?TCtPv9U7iKRRASuq4IXB5KwHmpzAqKFScDllhV+rnFMgjx/XUY6OGD4vjqf3?=
 =?us-ascii?Q?p56JTWQUdG6QsbKOAcE7XTGZFpK+o7XrU/zkRNiIlyKcdjpjnKEILEvR7HFY?=
 =?us-ascii?Q?6PPMJ3+jeHuQMg6ZureOhzobFijTbUZmbsT3JLbpfT7GAvZk57Rg3pvbgi9n?=
 =?us-ascii?Q?AbKuJfm/lclY+rj5Qi2eoodS2WADwd3SHC1z8rhiAO5dv3+dE6ejOOQ3Fjz0?=
 =?us-ascii?Q?EcxmvDzRKHZTIRENIHBbYez03q7PIRqbXhZHkAhdwK6kemcKAhipo3hXRtLa?=
 =?us-ascii?Q?9FBrY2pSguLwedl0TQvCMK2fhyfMhw6SK7AJGEfSU6INNxakgzYoprSwOQbt?=
 =?us-ascii?Q?KsHrfi3/WIyzAWzLFGO7dzBu7WSxw7zxj51ynBkSK1cg7iV/fP6B/Ci6Ai9f?=
 =?us-ascii?Q?iMqZoYlYC7SxJeKcFXTreFl7HeQwXFPP8InyItJzUsQKRm05DVs2rnkC86EQ?=
 =?us-ascii?Q?t8ww6c4NEXWtdxTxEoMz2+P5dYt0YFnx+OiP7X+4w92+Xgc1YTklE20F7ymJ?=
 =?us-ascii?Q?UYf8I4rpl2kXTHPN5eK6l3t7ud2FEHQ9A5aJXh40e7lc5Zq84wtHN5HdBCnf?=
 =?us-ascii?Q?s9/Gblb/7LpzQ/7LWkw7hcN7mVCPQ/qm3e6IvWjrvmnpNSg4p5iCNOWMBNfb?=
 =?us-ascii?Q?VJ8nrAOdlhFCcu9yhlbgugU2zJEw01pQwtKLVxaZ1ZUsneQoMJVc7+Yz5sLD?=
 =?us-ascii?Q?UCkXibv52huSDozChnW94ODlZo7R+rpAbYFLx7qMCl3vqd51KbefJAvUVr3+?=
 =?us-ascii?Q?vFD/HstYalcrTQpUHtK3Y4xyJb5rlV89leoDcCHzrRpTDkZsrNNN6k/xuAVp?=
 =?us-ascii?Q?rMZv8vVA68VD3YZjk+RYjDoEErG8unXHlxbsKiEZ2bgbcUNu8hwmPnugmK0v?=
 =?us-ascii?Q?d6WpFiG/dyjn75QKqckSp4IIjrj51XDyFwkGiaDVPw3nbYA8TDgGI6eVq/FN?=
 =?us-ascii?Q?6D6EXIo7mwOd2zmFrWEtN1ep5oPCMYEycnXDn/c0TKC0HczmZeKaOi5bEXiI?=
 =?us-ascii?Q?UUnFOLnwkZtcgcQ/7NXKktgB65DaFqr9xHIv+ovzr89ZhvHvfHHPObCLznNZ?=
 =?us-ascii?Q?MDtYI8I4R19nsQQ5BvglE57xQ78KTevKCmCmDve2MClpyfyohFj3dhvR8iPl?=
 =?us-ascii?Q?8aXsy3bf0EXwVNubr5ULJ54+6PrPgVH1/Wpt8aq85XU2iaS5/HG91xJ7xJpd?=
 =?us-ascii?Q?lbPPUvIkSCMMj+YHeEbov0JdrbV7puOhqw4qC9+zeBW7ZbOKNTnPCWPKjxrt?=
 =?us-ascii?Q?grKlGWwfCkIvh2ZLc8Xv8HlVwhmcFQjA0FSlWBHOqHdII0Qy1rRriNiOuMMM?=
 =?us-ascii?Q?vkGUEUxOHljKTGxx/dM6hkIoJ/82gUj1WWI+aiQbHtAYIutsjhxBXmfgpeLo?=
 =?us-ascii?Q?BbzAt4aGykxBgldyu//0x+NcDfW9ZlWjmpb02Lg03O7UfqJu7yRdbSv9aDXp?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5e35bc-9fe8-4ca7-86c6-08ddb5a0fda4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 17:35:21.3581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yAzXVwJ5tdPrynsV8+xMjQQejMkNtADh2/VDVpGOch4vfgSyYZG77TVmXln3ajbPXsjNylh9zdz43Fghwphy4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7298
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

On Fri, Jun 27, 2025 at 06:29:57PM +0200, Francois Dugast wrote:
> On Wed, Jun 04, 2025 at 07:13:24AM -0700, Matthew Brost wrote:
> > On Wed, Jun 04, 2025 at 12:24:41PM +0200, Francois Dugast wrote:
> > > Hi,
> > > 
> > > On Tue, Jun 03, 2025 at 04:34:45PM -0700, Matthew Brost wrote:
> > > > Add more SVM GT stats which give visibility to where time is spent in
> > > > the SVM page fault handler. Stats include number of faults at a given
> > > > size, total SVM page fault time, migration time in us, copy time in us,
> > > > copy kb, get pages time in us, and bind time in us. Will help in tuning
> > > > SVM for performance.
> 
> After using it extensively for SVM profiling, I can confirm this is extremely
> helpful. The patch needs rebasing. Also, please see one nit below. With that,
> 
>     Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> 

Thanks, I have a couple of other local changes to help profling too.
Will rebase and repost shortly.

Matt

> > > 
> > > Any idea about performance impact of collecting this data? Should we put
> > > more behind IS_ENABLED(CONFIG_DEBUG_FS) to limit function jumps?
> > > 
> > 
> > I think the way I have this coded if CONFIG_DEBUG_FS is false everything
> > related to stats should compile or at least that is the intent. Maybe
> > should confirm this though.
> > 
> > > > 
> > > > v2:
> > > >  - Include local changes
> > > > v3:
> > > >  - Add tlb invalidation + valid page fault + per size copy size stats
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gt_stats.c       |  33 +++
> > > >  drivers/gpu/drm/xe/xe_gt_stats_types.h |  33 +++
> > > >  drivers/gpu/drm/xe/xe_svm.c            | 274 ++++++++++++++++++++++++-
> > > >  3 files changed, 332 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> > > > index 7e12fc3759e2..8fb43cbb2de4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> > > > @@ -29,8 +29,41 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
> > > >  static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> > > >  	"svm_pagefault_count",
> > > 
> > > Maybe this one should be removed to prevent confusion with
> > > svm_*_pagefault_count entries below.
> > > 
> > 
> > I think this is ok - it total number of faults rather than the
> > individual breakdown like some of the stats below.
> > 
> > Matt
> > 
> > > Francois
> > > 
> > > >  	"tlb_inval_count",
> > > > +	"svm_tlb_inval_count",
> > > > +	"svm_tlb_inval_us",
> > > >  	"vma_pagefault_count",
> > > >  	"vma_pagefault_kb",
> > > > +	"svm_4K_pagefault_count",
> > > > +	"svm_64K_pagefault_count",
> > > > +	"svm_2M_pagefault_count",
> > > > +	"svm_4K_valid_pagefault_count",
> > > > +	"svm_64K_valid_pagefault_count",
> > > > +	"svm_2M_valid_pagefault_count",
> > > > +	"svm_4K_pagefault_us",
> > > > +	"svm_64K_pagefault_us",
> > > > +	"svm_2M_pagefault_us",
> > > > +	"svm_4K_device_copy_count",
> > > > +	"svm_64K_device_copy_count",
> > > > +	"svm_2M_device_copy_count",
> > > > +	"svm_4K_migrate_us",
> > > > +	"svm_64K_migrate_us",
> > > > +	"svm_2M_migrate_us",
> > > > +	"svm_device_copy_us",
> > > > +	"svm_device_2M_copy_us",
> > > > +	"svm_device_64K_copy_us",
> > > > +	"svm_device_4K_copy_us",
> > > > +	"svm_cpu_copy_us",
> > > > +	"svm_cpu_2M_copy_us",
> > > > +	"svm_cpu_64K_copy_us",
> > > > +	"svm_cpu_4K_copy_us",
> > > > +	"svm_device_copy_kb",
> > > > +	"svm_cpu_copy_kb",
> > > > +	"svm_4K_get_pages_us",
> > > > +	"svm_64K_get_pages_us",
> > > > +	"svm_2M_get_pages_us",
> > > > +	"svm_4K_bind_us",
> > > > +	"svm_64K_bind_us",
> > > > +	"svm_2M_bind_us",
> > > >  };
> > > >  
> > > >  /**
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > > > index be3244d7133c..5a92226ef033 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > > > @@ -9,8 +9,41 @@
> > > >  enum xe_gt_stats_id {
> > > >  	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
> > > >  	XE_GT_STATS_ID_TLB_INVAL,
> > > > +	XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT,
> > > > +	XE_GT_STATS_ID_SVM_TLB_INVAL_US,
> > > >  	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
> > > >  	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
> > > > +	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
> > > > +	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
> > > > +	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT,
> > > > +	XE_GT_STATS_ID_SVM_4K_VALID_PAGEFAULT_COUNT,
> > > > +	XE_GT_STATS_ID_SVM_64K_VALID_PAGEFAULT_COUNT,
> > > > +	XE_GT_STATS_ID_SVM_2M_VALID_PAGEFAULT_COUNT,
> > > > +	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_US,
> > > > +	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_US,
> > > > +	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_US,
> > > > +	XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_COUNT,
> > > > +	XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_COUNT,
> > > > +	XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_COUNT,
> > > > +	XE_GT_STATS_ID_SVM_4K_MIGRATE_US,
> > > > +	XE_GT_STATS_ID_SVM_64K_MIGRATE_US,
> > > > +	XE_GT_STATS_ID_SVM_2M_MIGRATE_US,
> > > > +	XE_GT_STATS_ID_SVM_DEVICE_COPY_US,
> > > > +	XE_GT_STATS_ID_SVM_DEVICE_2M_COPY_US,
> > > > +	XE_GT_STATS_ID_SVM_DEVICE_64K_COPY_US,
> > > > +	XE_GT_STATS_ID_SVM_DEVICE_4K_COPY_US,
> > > > +	XE_GT_STATS_ID_SVM_CPU_COPY_US,
> > > > +	XE_GT_STATS_ID_SVM_CPU_2M_COPY_US,
> > > > +	XE_GT_STATS_ID_SVM_CPU_64K_COPY_US,
> > > > +	XE_GT_STATS_ID_SVM_CPU_4K_COPY_US,
> > > > +	XE_GT_STATS_ID_SVM_DEVICE_COPY_KB,
> > > > +	XE_GT_STATS_ID_SVM_CPU_COPY_KB,
> > > > +	XE_GT_STATS_ID_SVM_4K_GET_PAGES_US,
> > > > +	XE_GT_STATS_ID_SVM_64K_GET_PAGES_US,
> > > > +	XE_GT_STATS_ID_SVM_2M_GET_PAGES_US,
> > > > +	XE_GT_STATS_ID_SVM_4K_BIND_US,
> > > > +	XE_GT_STATS_ID_SVM_64K_BIND_US,
> > > > +	XE_GT_STATS_ID_SVM_2M_BIND_US,
> > > >  	/* must be the last entry */
> > > >  	__XE_GT_STATS_NUM_IDS,
> > > >  };
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > > index f27fb9b588de..cd7c391282a7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > @@ -108,6 +108,11 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
> > > >  		   &vm->svm.garbage_collector.work);
> > > >  }
> > > >  
> > > > +static void xe_svm_tlb_inval_count_stats_incr(struct xe_gt *gt)
> > > > +{
> > > > +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT, 1);
> > > > +}
> > > > +
> > > >  static u8
> > > >  xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
> > > >  				  const struct mmu_notifier_range *mmu_range,
> > > > @@ -140,6 +145,11 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
> > > >  	 */
> > > >  	for_each_tile(tile, xe, id)
> > > >  		if (xe_pt_zap_ptes_range(tile, vm, range)) {
> > > > +			if (!(tile_mask & BIT(id))) {
> > > > +				xe_svm_tlb_inval_count_stats_incr(tile->primary_gt);
> > > > +				if (tile->media_gt)
> > > > +					xe_svm_tlb_inval_count_stats_incr(tile->media_gt);
> > > > +			}
> > > >  			tile_mask |= BIT(id);
> > > >  			range->tile_invalidated |= BIT(id);
> > > >  		}
> > > > @@ -161,6 +171,24 @@ xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
> > > >  						   mmu_range);
> > > >  }
> > > >  
> > > > +static s64 xe_svm_stats_ktime_us_delta(ktime_t start)
> > > > +{
> > > > +	return IS_ENABLED(CONFIG_DEBUG_FS) ?
> > > > +		ktime_us_delta(ktime_get(), start) : 0;
> > > > +}
> > > > +
> > > > +static void xe_svm_tlb_inval_us_stats_incr(struct xe_gt *gt, ktime_t start)
> > > > +{
> > > > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > > > +
> > > > +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_TLB_INVAL_US, us_delta);
> > > > +}
> > > > +
> > > > +static ktime_t xe_svm_stats_ktime_get(void)
> > > > +{
> > > > +	return IS_ENABLED(CONFIG_DEBUG_FS) ? ktime_get() : 0;
> > > > +}
> > > > +
> > > >  static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> > > >  			      struct drm_gpusvm_notifier *notifier,
> > > >  			      const struct mmu_notifier_range *mmu_range)
> > > > @@ -171,6 +199,7 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> > > >  	struct drm_gpusvm_range *r, *first;
> > > >  	struct xe_gt_tlb_invalidation_fence
> > > >  		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> > > > +	ktime_t start = xe_svm_stats_ktime_get();
> > > >  	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
> > > >  	u8 tile_mask = 0;
> > > >  	u8 id;
> > > > @@ -261,6 +290,13 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> > > >  	r = first;
> > > >  	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
> > > >  		xe_svm_range_notifier_event_end(vm, r, mmu_range);
> > > > +	for_each_tile(tile, xe, id) {
> > > > +		if (tile_mask & BIT(id)) {
> > > > +			xe_svm_tlb_inval_us_stats_incr(tile->primary_gt, start);
> > > > +			if (tile->media_gt)
> > > > +				xe_svm_tlb_inval_us_stats_incr(tile->media_gt, start);
> > > > +		}
> > > > +	}
> > > >  }
> > > >  
> > > >  static int __xe_svm_garbage_collector(struct xe_vm *vm,
> > > > @@ -363,6 +399,60 @@ enum xe_svm_copy_dir {
> > > >  	XE_SVM_COPY_TO_SRAM,
> > > >  };
> > > >  
> > > > +static void xe_svm_copy_kb_stats_incr(struct xe_gt *gt,
> > > > +				      const enum xe_svm_copy_dir dir,
> > > > +				      int kb)
> > > > +{
> > > > +	if (dir == XE_SVM_COPY_TO_VRAM)
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_COPY_KB, kb);
> > > > +	else
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_COPY_KB, kb);
> > > > +}
> > > > +
> > > > +static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
> > > > +				      const enum xe_svm_copy_dir dir,
> > > > +				      unsigned long npages,
> > > > +				      ktime_t start)
> > > > +{
> > > > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > > > +
> > > > +	if (dir == XE_SVM_COPY_TO_VRAM) {
> > > > +		switch (npages) {
> > > > +		case 1:
> > > > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_4K_COPY_US,
> > > > +					 us_delta);
> > > > +			break;
> > > > +		case 16:
> > > > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_64K_COPY_US,
> > > > +					 us_delta);
> > > > +			break;
> > > > +		case 512:
> > > > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_2M_COPY_US,
> > > > +					 us_delta);
> > > > +			break;
> > > > +		}
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_COPY_US,
> > > > +				 us_delta);
> > > > +	} else {
> > > > +		switch (npages) {
> > > > +		case 1:
> > > > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_4K_COPY_US,
> > > > +					 us_delta);
> > > > +			break;
> > > > +		case 16:
> > > > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_64K_COPY_US,
> > > > +					 us_delta);
> > > > +			break;
> > > > +		case 512:
> > > > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_2M_COPY_US,
> > > > +					 us_delta);
> > > > +			break;
> > > > +		}
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_COPY_US,
> > > > +				 us_delta);
> > > > +	}
> > > > +}
> > > > +
> > > >  static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> > > >  		       unsigned long npages, const enum xe_svm_copy_dir dir)
> > > >  {
> > > > @@ -374,6 +464,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> > > >  	u64 vram_addr = XE_VRAM_ADDR_INVALID;
> > > >  	int err = 0, pos = 0;
> > > >  	bool sram = dir == XE_SVM_COPY_TO_SRAM;
> > > > +	ktime_t start = xe_svm_stats_ktime_get();
> > > >  
> > > >  	/*
> > > >  	 * This flow is complex: it locates physically contiguous device pages,
> > > > @@ -431,6 +522,9 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> > > >  			int incr = (match && last) ? 1 : 0;
> > > >  
> > > >  			if (vram_addr != XE_VRAM_ADDR_INVALID) {
> > > > +				xe_svm_copy_kb_stats_incr(tile->primary_gt,
> > > > +							  dir, (i - pos + incr) *
> > > > +							  (PAGE_SIZE / SZ_1K));
> > > >  				if (sram) {
> > > >  					vm_dbg(&tile->xe->drm,
> > > >  					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
> > > > @@ -467,6 +561,8 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> > > >  
> > > >  			/* Extra mismatched device page, copy it */
> > > >  			if (!match && last && vram_addr != XE_VRAM_ADDR_INVALID) {
> > > > +				xe_svm_copy_kb_stats_incr(tile->primary_gt,
> > > > +							  dir, (PAGE_SIZE / SZ_1K));
> > > >  				if (sram) {
> > > >  					vm_dbg(&tile->xe->drm,
> > > >  					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
> > > > @@ -500,6 +596,13 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> > > >  		dma_fence_put(fence);
> > > >  	}
> > > >  
> > > > +	/*
> > > > +	 * XXX: We can't derive the GT here (or anywhere in this functions, but
> > > > +	 * compute always uses the primary GT so accumlate stats on the likely
> > > > +	 * GT of the fault.
> > > > +	 */
> 
> To avoid NULL we need here:
> 
>     if (tile)
> 
> Francois
> 
> > > > +	xe_svm_copy_us_stats_incr(tile->primary_gt, dir, npages, start);
> > > > +
> > > >  	return err;
> > > >  #undef XE_MIGRATE_CHUNK_SIZE
> > > >  #undef XE_VRAM_ADDR_INVALID
> > > > @@ -828,6 +931,142 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
> > > >  	return true;
> > > >  }
> > > >  
> > > > +static void xe_svm_range_fault_count_stats_incr(struct xe_gt *gt,
> > > > +						struct xe_svm_range *range)
> > > > +{
> > > > +	switch (xe_svm_range_size(range)) {
> > > > +	case SZ_4K:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT, 1);
> > > > +		break;
> > > > +	case SZ_64K:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT, 1);
> > > > +		break;
> > > > +	case SZ_2M:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT, 1);
> > > > +		break;
> > > > +	}
> > > > +}
> > > > +
> > > > +static void xe_svm_range_valid_fault_count_stats_incr(struct xe_gt *gt,
> > > > +						      struct xe_svm_range *range)
> > > > +{
> > > > +	switch (xe_svm_range_size(range)) {
> > > > +	case SZ_4K:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_VALID_PAGEFAULT_COUNT, 1);
> > > > +		break;
> > > > +	case SZ_64K:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_VALID_PAGEFAULT_COUNT, 1);
> > > > +		break;
> > > > +	case SZ_2M:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_VALID_PAGEFAULT_COUNT, 1);
> > > > +		break;
> > > > +	}
> > > > +}
> > > > +
> > > > +static void xe_svm_range_fault_copy_count_stats_incr(struct xe_gt *gt,
> > > > +						     struct xe_svm_range *range)
> > > > +{
> > > > +	switch (xe_svm_range_size(range)) {
> > > > +	case SZ_4K:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_COUNT, 1);
> > > > +		break;
> > > > +	case SZ_64K:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_COUNT, 1);
> > > > +		break;
> > > > +	case SZ_2M:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_COUNT, 1);
> > > > +		break;
> > > > +	}
> > > > +}
> > > > +
> > > > +static void xe_svm_range_migrate_us_stats_incr(struct xe_gt *gt,
> > > > +					       struct xe_svm_range *range,
> > > > +					       ktime_t start)
> > > > +{
> > > > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > > > +
> > > > +	switch (xe_svm_range_size(range)) {
> > > > +	case SZ_4K:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_MIGRATE_US,
> > > > +				 us_delta);
> > > > +		break;
> > > > +	case SZ_64K:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_MIGRATE_US,
> > > > +				 us_delta);
> > > > +		break;
> > > > +	case SZ_2M:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_MIGRATE_US,
> > > > +				 us_delta);
> > > > +		break;
> > > > +	}
> > > > +}
> > > > +
> > > > +static void xe_svm_range_get_pages_us_stats_incr(struct xe_gt *gt,
> > > > +						 struct xe_svm_range *range,
> > > > +						 ktime_t start)
> > > > +{
> > > > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > > > +
> > > > +	switch (xe_svm_range_size(range)) {
> > > > +	case SZ_4K:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_GET_PAGES_US,
> > > > +				 us_delta);
> > > > +		break;
> > > > +	case SZ_64K:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_GET_PAGES_US,
> > > > +				 us_delta);
> > > > +		break;
> > > > +	case SZ_2M:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_GET_PAGES_US,
> > > > +				 us_delta);
> > > > +		break;
> > > > +	}
> > > > +}
> > > > +
> > > > +static void xe_svm_range_bind_us_stats_incr(struct xe_gt *gt,
> > > > +					    struct xe_svm_range *range,
> > > > +					    ktime_t start)
> > > > +{
> > > > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > > > +
> > > > +	switch (xe_svm_range_size(range)) {
> > > > +	case SZ_4K:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_BIND_US,
> > > > +				 us_delta);
> > > > +		break;
> > > > +	case SZ_64K:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_BIND_US,
> > > > +				 us_delta);
> > > > +		break;
> > > > +	case SZ_2M:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_BIND_US,
> > > > +				 us_delta);
> > > > +		break;
> > > > +	}
> > > > +}
> > > > +
> > > > +static void xe_svm_range_fault_us_stats_incr(struct xe_gt *gt,
> > > > +					     struct xe_svm_range *range,
> > > > +					     ktime_t start)
> > > > +{
> > > > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > > > +
> > > > +	switch (xe_svm_range_size(range)) {
> > > > +	case SZ_4K:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_PAGEFAULT_US,
> > > > +				 us_delta);
> > > > +		break;
> > > > +	case SZ_64K:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_PAGEFAULT_US,
> > > > +				 us_delta);
> > > > +		break;
> > > > +	case SZ_2M:
> > > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_PAGEFAULT_US,
> > > > +				 us_delta);
> > > > +		break;
> > > > +	}
> > > > +}
> > > > +
> > > >  /**
> > > >   * xe_svm_handle_pagefault() - SVM handle page fault
> > > >   * @vm: The VM.
> > > > @@ -863,6 +1102,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > >  	struct xe_tile *tile = gt_to_tile(gt);
> > > >  	int migrate_try_count = ctx.devmem_only ? 3 : 1;
> > > >  	ktime_t end = 0;
> > > > +	ktime_t start = xe_svm_stats_ktime_get(), bind_start, get_pages_start;
> > > >  	int err;
> > > >  
> > > >  	lockdep_assert_held_write(&vm->lock);
> > > > @@ -881,17 +1121,29 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > >  	if (IS_ERR(range))
> > > >  		return PTR_ERR(range);
> > > >  
> > > > -	if (ctx.devmem_only && !range->base.flags.migrate_devmem)
> > > > -		return -EACCES;
> > > > +	xe_svm_range_fault_count_stats_incr(gt, range);
> > > >  
> > > > -	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
> > > > -		return 0;
> > > > +	if (ctx.devmem_only && !range->base.flags.migrate_devmem) {
> > > > +		err = -EACCES;
> > > > +		goto out;
> > > > +	}
> > > > +
> > > > +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only)) {
> > > > +		xe_svm_range_valid_fault_count_stats_incr(gt, range);
> > > > +		range_debug(range, "PAGE FAULT - VALID");
> > > > +		goto out;;
> > > > +	}
> > > >  
> > > >  	range_debug(range, "PAGE FAULT");
> > > >  
> > > >  	if (--migrate_try_count >= 0 &&
> > > >  	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
> > > > +		ktime_t migrate_start = xe_svm_stats_ktime_get();
> > > > +
> > > > +		xe_svm_range_fault_copy_count_stats_incr(gt, range);
> > > > +
> > > >  		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> > > > +		xe_svm_range_migrate_us_stats_incr(gt, range, migrate_start);
> > > >  		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
> > > >  		if (err) {
> > > >  			if (migrate_try_count || !ctx.devmem_only) {
> > > > @@ -908,6 +1160,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > >  		}
> > > >  	}
> > > >  
> > > > +	get_pages_start = xe_svm_stats_ktime_get();
> > > > +
> > > >  	range_debug(range, "GET PAGES");
> > > >  	err = xe_svm_range_get_pages(vm, range, &ctx);
> > > >  	/* Corner where CPU mappings have changed */
> > > > @@ -927,11 +1181,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > >  	}
> > > >  	if (err) {
> > > >  		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
> > > > -		goto err_out;
> > > > +		goto out;
> > > >  	}
> > > >  
> > > > +	xe_svm_range_get_pages_us_stats_incr(gt, range, get_pages_start);
> > > >  	range_debug(range, "PAGE FAULT - BIND");
> > > >  
> > > > +	bind_start = xe_svm_stats_ktime_get();
> > > >  retry_bind:
> > > >  	drm_exec_init(&exec, 0, 0);
> > > >  	drm_exec_until_all_locked(&exec) {
> > > > @@ -939,7 +1195,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > >  		drm_exec_retry_on_contention(&exec);
> > > >  		if (err) {
> > > >  			drm_exec_fini(&exec);
> > > > -			goto err_out;
> > > > +			goto out;
> > > >  		}
> > > >  
> > > >  		fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
> > > > @@ -953,15 +1209,17 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > >  			}
> > > >  			if (xe_vm_validate_should_retry(&exec, err, &end))
> > > >  				goto retry_bind;
> > > > -			goto err_out;
> > > > +			goto out;
> > > >  		}
> > > >  	}
> > > >  	drm_exec_fini(&exec);
> > > >  
> > > >  	dma_fence_wait(fence, false);
> > > >  	dma_fence_put(fence);
> > > > +	xe_svm_range_bind_us_stats_incr(gt, range, bind_start);
> > > >  
> > > > -err_out:
> > > > +out:
> > > > +	xe_svm_range_fault_us_stats_incr(gt, range, start);
> > > >  
> > > >  	return err;
> > > >  }
> > > > -- 
> > > > 2.34.1
> > > > 
