Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16378C5B549
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 14:11:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966EB10E7A7;
	Wed,  4 Jun 2025 14:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTYKPnuV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA1610E789
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 14:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749046317; x=1780582317;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DGnULad+3IX7g00HnF+bu+DZ2fsX+2uu9SyJVo0jX2Y=;
 b=mTYKPnuVTadEpR2kynMOq1Q359Fo/ZzS130/wmAd6lkBAqhaLx1re/Tm
 dTT6pZhLQxhkxIklqwpH95wBWXaZIGmFX0/JxLZ7y5zREZLTmQJv4yZNP
 ba8TeILvxGHImj+wcxpFd1Po2M1WHR//1TfOv6T2Jc3vUwo94KbWlG+Vw
 11mdO8/bMI2G/stbD0NigUmB3cOuraiHtMU1bUVlgQraeW3AF90eyQpDL
 5QlzKuacYBYIy0oqTpQKP8ZKx7yzBsHI/m5csXVfwpOFWi+qNV9uQRxgS
 WgEZvReQ8lF4I8cvzCpr9x5JXD9HQ+XiJ0z3YRXVfH/AXdMQ13o9/4f5h g==;
X-CSE-ConnectionGUID: GcWmKaqhQmaQ28gCwu06aQ==
X-CSE-MsgGUID: DH8ReykLQMyyp9mEM6TNyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="54921742"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="54921742"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 07:11:55 -0700
X-CSE-ConnectionGUID: XQ6DQ8NzTZ2bgwdMnirePA==
X-CSE-MsgGUID: PR/+EQSlQVW/jsvmkmmoFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145095983"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 07:11:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 07:11:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 07:11:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.56)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 07:11:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SROFSA3IPoTxpV16bDcu4+aULJf9iO4Qh2VYTWNpTFAROp85XHyLgo8BaLAPCpUI6JUFXVxey4gfrfBJ8C6avGDsDJLBM5Igm8QlmZ4niJa1kzVqd72uqfhrOhdtB8U3l2ikAbNVck5OyK7X4xhyPbivRGraSFsX7N7UzWseXi4AaevvvjyMw4OzGI9FgdUOk4WKoC0TjDcra0cyj8JdBMER8WbirI1rwspYmfrB/qEEoIN3G/KRrVujOUTBS4fL+OARkbGW0JKq7yquHAZtDf1U41q4Yft7QPuMwh4qESk/O/MEW5tyEA32pvk/oyh4sOVvPEUT1lwV2hCqLXCNJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILmvlOKDlpoB0txPDqfd1ap5/oY5K8bQw4zitf+At/E=;
 b=aHoEYyOQZ26GhlXjFmlc0GqnIZCWAL05dFCbz+YqTCBm5yA12t209P0HQgOUvMuVegEt694dD2qQ1ETaNz1IbajtPpp72YihDlAzYPp6pigg4mbm7NK0GMuhU1xE91TnoX4idnI9gW6Zu4DG02+GuxlWQ7QJm2AMcFoUNXpUsS+8iQE+8R1f7Xd+Ap6m7rlRIHWncrqHoNSMEpcrV542R2OCpPs5zxtDRu8W6Vl3MQrcSYbIooLf7kAdpMwMvqzl8HNj35hkflr4k1mZjPGQtJrwEeJnDyzJEaIEhCgbRA6hbwlD1ZiAya+u1ZbhNG1EH+Q00X/3vnroU8mGqhVG6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4830.namprd11.prod.outlook.com (2603:10b6:a03:2d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 14:11:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Wed, 4 Jun 2025
 14:11:50 +0000
Date: Wed, 4 Jun 2025 07:13:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.mrozek@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe: Add more SVM GT stats
Message-ID: <aEBUhFQIugQ96l1k@lstrano-desk.jf.intel.com>
References: <20250603233445.2304383-1-matthew.brost@intel.com>
 <20250603233445.2304383-3-matthew.brost@intel.com>
 <aEAe4dnl5MaFW0r9@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aEAe4dnl5MaFW0r9@fdugast-desk>
X-ClientProxiedBy: BY5PR16CA0018.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4830:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a3b283-0ac1-4584-2f35-08dda371bfd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2MELLqibr18MFvvaXQxLYas49I3Db+O3PfWGjalTvBUZu/CXC67pqBTQoyOB?=
 =?us-ascii?Q?QhXF0r9gWHhBmpQaWx1lsGV8UZTj13Mm7rbvSvUmDwEjwSdnacPCGikjSuHi?=
 =?us-ascii?Q?j1/OPvMNKsRb9DQuYXwaUwDzaY9CGNVHdeXKjKcB1QYNBwhDlXuMAVS3KGFe?=
 =?us-ascii?Q?AWmoIgFMpEr1zLZfSJ0rs2aXxosMx9cMWJQOFP2ASuHadjmuhmCAhFa/EvMp?=
 =?us-ascii?Q?VHRQZthm0ernKkHOdHCYzErnp3EimhhmifJF5bSYj8tj80BUL1p0HUYo3dpb?=
 =?us-ascii?Q?OdFUiCuhZR1MJgTy7a3o8SOEGNkk4kqU+ugQgdGBDhJGBrZyL1n3nZgK9IBm?=
 =?us-ascii?Q?pP9tTKR5xXl1ILAhZEb7BGRCk2Ir9UHvPKmSrgCU0jvxZVB38kZEVM9T9r4m?=
 =?us-ascii?Q?NN3lAttLkOXiqHQvRFoHCgb+AE6obo5up5QPES42HHIpBo1hO/qVWI05SIda?=
 =?us-ascii?Q?5AsHW+ctIfVdyzIt9TuHAmoTDYOGcSDVOWYMYkyFt2C5KOWExgQanxQR+ydt?=
 =?us-ascii?Q?OXSbKwJbT8Wy7ZamV9lb2cqvCChMo8/Atc1xArKBhXvCOvpw1RbCBAuLcrM+?=
 =?us-ascii?Q?iYl6PEtdR6HR5W7m7mrF9lgb7R1WuAze/ImYpSmgCvVvN1G2kv3EgCqF4Lba?=
 =?us-ascii?Q?9bMelpIGUab2KgbXdVPkqHXWKYUHcC07uf+0GP/gB8Evv7pazUtPs8RZkUBK?=
 =?us-ascii?Q?LP4Bbfgp1nlOtyT1GZhM99k4sRzMB0x39u7XXaqoiEOGWim7B2XD2VWu5Suq?=
 =?us-ascii?Q?M/A3kWDsshTVh6d9Nf4Q2IPCYiftylfbAjkqVIlniLvxzb3TNcFShbzdZ5A6?=
 =?us-ascii?Q?AAQGuFo/0s+S8JlBRGcwOZtmHgh4GOtQqsCzVBHJZhZOm3q9PJrhgbxDOMNa?=
 =?us-ascii?Q?d+raUUT+4s+qOzbtDb+Efaerje90tkhGI9OZMokkwXKbBIl8Cc8cRoH8J2lz?=
 =?us-ascii?Q?lfm3uEYR/owFYfR/nAw4a63FZFRIKDFl0x+6naRWsNLjeuPuIbz4LqYIConQ?=
 =?us-ascii?Q?LiXr0pU/qwePuIqZuk56TsPxaJv40Ke98pNGQHiIpEG1rNuDn6VwSphbg8tG?=
 =?us-ascii?Q?dJFWnE516FvUO78jmkE1OvR0flOfGbV21S95Cw9mHj/fuKIH+flxSV/xJ/Aj?=
 =?us-ascii?Q?YvLtjrJDARdI7lz/kzWqanlVRp50jVaxwm3Z8yck9bUYaDLrYinTXKt8Kuit?=
 =?us-ascii?Q?UaFpMrER2SgbcRtPBJK7DHPVNJt0duCvnH/y+7FQtFzNxVT49zqRr41FEvOM?=
 =?us-ascii?Q?8nHjEXMB8rYb4Nxr+NGgpxAcBggzPiF1Jk7ytG+Vwgw88Ch606TXJOCNm7Cw?=
 =?us-ascii?Q?w3Q5BLfZBJF5vVpm1+6aTEEfF+r946MPSoqcSMAOj8Jwo7OEL7DYWuwcFuea?=
 =?us-ascii?Q?D/55RRtpXhfjK5a38oOZFXyfU2DdDngPkAxsS6kJ6kvyiqTD5SNTXPZmgM7Q?=
 =?us-ascii?Q?21b3VOg8eFM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VBxV/5VF8lMoEpjWjK1UhH8C7NabsXd1EVs4WRRaMUcvGr7abGBUFW8z8fWe?=
 =?us-ascii?Q?ggHFVycBdWpEkZpHa0B706grGeX7WnRSwnqZQGmImwjRyPSliRYl4TvZ9y7o?=
 =?us-ascii?Q?4A26T93PM7X4L8sew78wZ0FqOhgUvXG/o7gTPq/3vr9LaezxUN0w5HcbZ3cL?=
 =?us-ascii?Q?VaamBTVmn2gInsrnUQQasLWS2yIXdYI8zCpy0NKB90werAc8xl7tVc8QQW4N?=
 =?us-ascii?Q?94B5olew933P2DFDEm/JXFi5d3gnPiHRRFMCwcPDY4eiwFFqO3iPoOw2oVSk?=
 =?us-ascii?Q?v4YsHlDGay1pQN1N8dMS/FW7g1C57WfH3XBVgsQmQ45FAiiWv8hXEBawyU9e?=
 =?us-ascii?Q?oZamZStPoCL8ysvQXWELYBdEE2m0yjWh44Ks66scR645m/m4NNUL6kXt6Owq?=
 =?us-ascii?Q?FFJdqgrrPWSeXCqNMwBG46UJhXxbUciVeBHI5CYDtihGJdYzSIyAZq8VJSFi?=
 =?us-ascii?Q?WEBHB3SlSWYhkqqL1xpN7dZGl7qrQOSF8tIciQJ69PY84rji0Y7pd/AkHv5c?=
 =?us-ascii?Q?DiIeboJJ5/TZQp1y+CMe0ljynAo11wzklJn30j5wr619Yv9jVRCV8uGcDhS+?=
 =?us-ascii?Q?fmHr/6JdV1CnLWa9gD9Hz6yidFVOzz1RsGmntW6m5GfDemRjxB202uySiEee?=
 =?us-ascii?Q?HfbhYVkqUPmHy7GJYlQ/5AxaE45v6u+eCpFN8b/T1BZm9dJDLMTipShKgtc2?=
 =?us-ascii?Q?I2xcnHNv8v7se3+WW+lBqsXExWywtJJriRUJ41TrsDotmKVt7xJ/0T5ZsELJ?=
 =?us-ascii?Q?R045YAorkA+4T9Oo5BfY/IlTk2OCG5SlJMW58JZ4Rair+JTsne5kcWrimRxG?=
 =?us-ascii?Q?1gz7daJELhuI7F4VLdgp505ASCZk2uvt+1kXEwKw6NetpFQVevpZjn2wLGIe?=
 =?us-ascii?Q?NZHtfsJtyc4q3vc+NLkFiu+frTHVBlRw+90dPlh9o5LrhswI1rfDDE5M83Ft?=
 =?us-ascii?Q?Zf/gFpvuNy3B+gqhYyyrgKquw25GJYg95qerOc0qlYsr5y/1vAxZPNFjrkBS?=
 =?us-ascii?Q?0+2J08QVI44tH9Z9bNehoH7IOllbZ8NrhCyINYTc8wZ39dAfqWNqA0BqSy8m?=
 =?us-ascii?Q?LCMQh9eKiwW0TZ3RPJWYprblWml4mkJaxYi/Irbf4RG7R5hTMEqrxx/4Kkuh?=
 =?us-ascii?Q?0vmdq3V22+RuhvFwz1MCZPF0xxwwnRoF+3j+pMPiteBrihqM1LTS37E8cwCg?=
 =?us-ascii?Q?KEJcnJRVzTTGhjBZjD3Yp9As0ViN5jUvM+uktcyf1lWiGktqzr5EdoWZQOaB?=
 =?us-ascii?Q?YB8A/8vfWt5Db6e22nQh7Fng+ukzWiff2b0kYiqHyzZbsHhGvlYVQAssmjuU?=
 =?us-ascii?Q?VAROONFDDwM5xnsisgYb0DlTm6nCy11xBYboxJYzLVlGTNP0MpMc2bcQKcEY?=
 =?us-ascii?Q?zmT+/QYQB0r8RnRQkNjbab7yU41f+KXnYSMf1cDPtVwRIJcAcuhdhaQZXKjx?=
 =?us-ascii?Q?ANDHhJcf2vfOMPoc8tCJ6s1NkySApopuchsvWmBlJmMLQAhDm0RvLOH8U0lS?=
 =?us-ascii?Q?GSr4FH6nyBIqyUJOgPQ5Xf3whUG90SuPE8PM7sasmlfN1Cv3X3n7AuXghB76?=
 =?us-ascii?Q?x9DkMskzwBlkltgDpzrrLpRosSEGXryBvxRkN9YpL7+k8e+179CTcDZm45Qo?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a3b283-0ac1-4584-2f35-08dda371bfd1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 14:11:50.5063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJK3269mzjB3FOAcWM2NW9Wbm+zHuU3PazeFwmrPFTWOPiJwV33d8OHVSFYeEVWA3/YRikstksjUmVepcRlm6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4830
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

On Wed, Jun 04, 2025 at 12:24:41PM +0200, Francois Dugast wrote:
> Hi,
> 
> On Tue, Jun 03, 2025 at 04:34:45PM -0700, Matthew Brost wrote:
> > Add more SVM GT stats which give visibility to where time is spent in
> > the SVM page fault handler. Stats include number of faults at a given
> > size, total SVM page fault time, migration time in us, copy time in us,
> > copy kb, get pages time in us, and bind time in us. Will help in tuning
> > SVM for performance.
> 
> Any idea about performance impact of collecting this data? Should we put
> more behind IS_ENABLED(CONFIG_DEBUG_FS) to limit function jumps?
> 

I think the way I have this coded if CONFIG_DEBUG_FS is false everything
related to stats should compile or at least that is the intent. Maybe
should confirm this though.

> > 
> > v2:
> >  - Include local changes
> > v3:
> >  - Add tlb invalidation + valid page fault + per size copy size stats
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_stats.c       |  33 +++
> >  drivers/gpu/drm/xe/xe_gt_stats_types.h |  33 +++
> >  drivers/gpu/drm/xe/xe_svm.c            | 274 ++++++++++++++++++++++++-
> >  3 files changed, 332 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> > index 7e12fc3759e2..8fb43cbb2de4 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> > @@ -29,8 +29,41 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
> >  static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> >  	"svm_pagefault_count",
> 
> Maybe this one should be removed to prevent confusion with
> svm_*_pagefault_count entries below.
> 

I think this is ok - it total number of faults rather than the
individual breakdown like some of the stats below.

Matt

> Francois
> 
> >  	"tlb_inval_count",
> > +	"svm_tlb_inval_count",
> > +	"svm_tlb_inval_us",
> >  	"vma_pagefault_count",
> >  	"vma_pagefault_kb",
> > +	"svm_4K_pagefault_count",
> > +	"svm_64K_pagefault_count",
> > +	"svm_2M_pagefault_count",
> > +	"svm_4K_valid_pagefault_count",
> > +	"svm_64K_valid_pagefault_count",
> > +	"svm_2M_valid_pagefault_count",
> > +	"svm_4K_pagefault_us",
> > +	"svm_64K_pagefault_us",
> > +	"svm_2M_pagefault_us",
> > +	"svm_4K_device_copy_count",
> > +	"svm_64K_device_copy_count",
> > +	"svm_2M_device_copy_count",
> > +	"svm_4K_migrate_us",
> > +	"svm_64K_migrate_us",
> > +	"svm_2M_migrate_us",
> > +	"svm_device_copy_us",
> > +	"svm_device_2M_copy_us",
> > +	"svm_device_64K_copy_us",
> > +	"svm_device_4K_copy_us",
> > +	"svm_cpu_copy_us",
> > +	"svm_cpu_2M_copy_us",
> > +	"svm_cpu_64K_copy_us",
> > +	"svm_cpu_4K_copy_us",
> > +	"svm_device_copy_kb",
> > +	"svm_cpu_copy_kb",
> > +	"svm_4K_get_pages_us",
> > +	"svm_64K_get_pages_us",
> > +	"svm_2M_get_pages_us",
> > +	"svm_4K_bind_us",
> > +	"svm_64K_bind_us",
> > +	"svm_2M_bind_us",
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > index be3244d7133c..5a92226ef033 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > @@ -9,8 +9,41 @@
> >  enum xe_gt_stats_id {
> >  	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
> >  	XE_GT_STATS_ID_TLB_INVAL,
> > +	XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT,
> > +	XE_GT_STATS_ID_SVM_TLB_INVAL_US,
> >  	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
> >  	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
> > +	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_SVM_4K_VALID_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_SVM_64K_VALID_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_SVM_2M_VALID_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_US,
> > +	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_US,
> > +	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_US,
> > +	XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_COUNT,
> > +	XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_COUNT,
> > +	XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_COUNT,
> > +	XE_GT_STATS_ID_SVM_4K_MIGRATE_US,
> > +	XE_GT_STATS_ID_SVM_64K_MIGRATE_US,
> > +	XE_GT_STATS_ID_SVM_2M_MIGRATE_US,
> > +	XE_GT_STATS_ID_SVM_DEVICE_COPY_US,
> > +	XE_GT_STATS_ID_SVM_DEVICE_2M_COPY_US,
> > +	XE_GT_STATS_ID_SVM_DEVICE_64K_COPY_US,
> > +	XE_GT_STATS_ID_SVM_DEVICE_4K_COPY_US,
> > +	XE_GT_STATS_ID_SVM_CPU_COPY_US,
> > +	XE_GT_STATS_ID_SVM_CPU_2M_COPY_US,
> > +	XE_GT_STATS_ID_SVM_CPU_64K_COPY_US,
> > +	XE_GT_STATS_ID_SVM_CPU_4K_COPY_US,
> > +	XE_GT_STATS_ID_SVM_DEVICE_COPY_KB,
> > +	XE_GT_STATS_ID_SVM_CPU_COPY_KB,
> > +	XE_GT_STATS_ID_SVM_4K_GET_PAGES_US,
> > +	XE_GT_STATS_ID_SVM_64K_GET_PAGES_US,
> > +	XE_GT_STATS_ID_SVM_2M_GET_PAGES_US,
> > +	XE_GT_STATS_ID_SVM_4K_BIND_US,
> > +	XE_GT_STATS_ID_SVM_64K_BIND_US,
> > +	XE_GT_STATS_ID_SVM_2M_BIND_US,
> >  	/* must be the last entry */
> >  	__XE_GT_STATS_NUM_IDS,
> >  };
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index f27fb9b588de..cd7c391282a7 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -108,6 +108,11 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
> >  		   &vm->svm.garbage_collector.work);
> >  }
> >  
> > +static void xe_svm_tlb_inval_count_stats_incr(struct xe_gt *gt)
> > +{
> > +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT, 1);
> > +}
> > +
> >  static u8
> >  xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
> >  				  const struct mmu_notifier_range *mmu_range,
> > @@ -140,6 +145,11 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
> >  	 */
> >  	for_each_tile(tile, xe, id)
> >  		if (xe_pt_zap_ptes_range(tile, vm, range)) {
> > +			if (!(tile_mask & BIT(id))) {
> > +				xe_svm_tlb_inval_count_stats_incr(tile->primary_gt);
> > +				if (tile->media_gt)
> > +					xe_svm_tlb_inval_count_stats_incr(tile->media_gt);
> > +			}
> >  			tile_mask |= BIT(id);
> >  			range->tile_invalidated |= BIT(id);
> >  		}
> > @@ -161,6 +171,24 @@ xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
> >  						   mmu_range);
> >  }
> >  
> > +static s64 xe_svm_stats_ktime_us_delta(ktime_t start)
> > +{
> > +	return IS_ENABLED(CONFIG_DEBUG_FS) ?
> > +		ktime_us_delta(ktime_get(), start) : 0;
> > +}
> > +
> > +static void xe_svm_tlb_inval_us_stats_incr(struct xe_gt *gt, ktime_t start)
> > +{
> > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > +
> > +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_TLB_INVAL_US, us_delta);
> > +}
> > +
> > +static ktime_t xe_svm_stats_ktime_get(void)
> > +{
> > +	return IS_ENABLED(CONFIG_DEBUG_FS) ? ktime_get() : 0;
> > +}
> > +
> >  static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> >  			      struct drm_gpusvm_notifier *notifier,
> >  			      const struct mmu_notifier_range *mmu_range)
> > @@ -171,6 +199,7 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> >  	struct drm_gpusvm_range *r, *first;
> >  	struct xe_gt_tlb_invalidation_fence
> >  		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> > +	ktime_t start = xe_svm_stats_ktime_get();
> >  	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
> >  	u8 tile_mask = 0;
> >  	u8 id;
> > @@ -261,6 +290,13 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> >  	r = first;
> >  	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
> >  		xe_svm_range_notifier_event_end(vm, r, mmu_range);
> > +	for_each_tile(tile, xe, id) {
> > +		if (tile_mask & BIT(id)) {
> > +			xe_svm_tlb_inval_us_stats_incr(tile->primary_gt, start);
> > +			if (tile->media_gt)
> > +				xe_svm_tlb_inval_us_stats_incr(tile->media_gt, start);
> > +		}
> > +	}
> >  }
> >  
> >  static int __xe_svm_garbage_collector(struct xe_vm *vm,
> > @@ -363,6 +399,60 @@ enum xe_svm_copy_dir {
> >  	XE_SVM_COPY_TO_SRAM,
> >  };
> >  
> > +static void xe_svm_copy_kb_stats_incr(struct xe_gt *gt,
> > +				      const enum xe_svm_copy_dir dir,
> > +				      int kb)
> > +{
> > +	if (dir == XE_SVM_COPY_TO_VRAM)
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_COPY_KB, kb);
> > +	else
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_COPY_KB, kb);
> > +}
> > +
> > +static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
> > +				      const enum xe_svm_copy_dir dir,
> > +				      unsigned long npages,
> > +				      ktime_t start)
> > +{
> > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > +
> > +	if (dir == XE_SVM_COPY_TO_VRAM) {
> > +		switch (npages) {
> > +		case 1:
> > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_4K_COPY_US,
> > +					 us_delta);
> > +			break;
> > +		case 16:
> > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_64K_COPY_US,
> > +					 us_delta);
> > +			break;
> > +		case 512:
> > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_2M_COPY_US,
> > +					 us_delta);
> > +			break;
> > +		}
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_COPY_US,
> > +				 us_delta);
> > +	} else {
> > +		switch (npages) {
> > +		case 1:
> > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_4K_COPY_US,
> > +					 us_delta);
> > +			break;
> > +		case 16:
> > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_64K_COPY_US,
> > +					 us_delta);
> > +			break;
> > +		case 512:
> > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_2M_COPY_US,
> > +					 us_delta);
> > +			break;
> > +		}
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_COPY_US,
> > +				 us_delta);
> > +	}
> > +}
> > +
> >  static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> >  		       unsigned long npages, const enum xe_svm_copy_dir dir)
> >  {
> > @@ -374,6 +464,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> >  	u64 vram_addr = XE_VRAM_ADDR_INVALID;
> >  	int err = 0, pos = 0;
> >  	bool sram = dir == XE_SVM_COPY_TO_SRAM;
> > +	ktime_t start = xe_svm_stats_ktime_get();
> >  
> >  	/*
> >  	 * This flow is complex: it locates physically contiguous device pages,
> > @@ -431,6 +522,9 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> >  			int incr = (match && last) ? 1 : 0;
> >  
> >  			if (vram_addr != XE_VRAM_ADDR_INVALID) {
> > +				xe_svm_copy_kb_stats_incr(tile->primary_gt,
> > +							  dir, (i - pos + incr) *
> > +							  (PAGE_SIZE / SZ_1K));
> >  				if (sram) {
> >  					vm_dbg(&tile->xe->drm,
> >  					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
> > @@ -467,6 +561,8 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> >  
> >  			/* Extra mismatched device page, copy it */
> >  			if (!match && last && vram_addr != XE_VRAM_ADDR_INVALID) {
> > +				xe_svm_copy_kb_stats_incr(tile->primary_gt,
> > +							  dir, (PAGE_SIZE / SZ_1K));
> >  				if (sram) {
> >  					vm_dbg(&tile->xe->drm,
> >  					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
> > @@ -500,6 +596,13 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> >  		dma_fence_put(fence);
> >  	}
> >  
> > +	/*
> > +	 * XXX: We can't derive the GT here (or anywhere in this functions, but
> > +	 * compute always uses the primary GT so accumlate stats on the likely
> > +	 * GT of the fault.
> > +	 */
> > +	xe_svm_copy_us_stats_incr(tile->primary_gt, dir, npages, start);
> > +
> >  	return err;
> >  #undef XE_MIGRATE_CHUNK_SIZE
> >  #undef XE_VRAM_ADDR_INVALID
> > @@ -828,6 +931,142 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
> >  	return true;
> >  }
> >  
> > +static void xe_svm_range_fault_count_stats_incr(struct xe_gt *gt,
> > +						struct xe_svm_range *range)
> > +{
> > +	switch (xe_svm_range_size(range)) {
> > +	case SZ_4K:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT, 1);
> > +		break;
> > +	case SZ_64K:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT, 1);
> > +		break;
> > +	case SZ_2M:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT, 1);
> > +		break;
> > +	}
> > +}
> > +
> > +static void xe_svm_range_valid_fault_count_stats_incr(struct xe_gt *gt,
> > +						      struct xe_svm_range *range)
> > +{
> > +	switch (xe_svm_range_size(range)) {
> > +	case SZ_4K:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_VALID_PAGEFAULT_COUNT, 1);
> > +		break;
> > +	case SZ_64K:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_VALID_PAGEFAULT_COUNT, 1);
> > +		break;
> > +	case SZ_2M:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_VALID_PAGEFAULT_COUNT, 1);
> > +		break;
> > +	}
> > +}
> > +
> > +static void xe_svm_range_fault_copy_count_stats_incr(struct xe_gt *gt,
> > +						     struct xe_svm_range *range)
> > +{
> > +	switch (xe_svm_range_size(range)) {
> > +	case SZ_4K:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_COUNT, 1);
> > +		break;
> > +	case SZ_64K:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_COUNT, 1);
> > +		break;
> > +	case SZ_2M:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_COUNT, 1);
> > +		break;
> > +	}
> > +}
> > +
> > +static void xe_svm_range_migrate_us_stats_incr(struct xe_gt *gt,
> > +					       struct xe_svm_range *range,
> > +					       ktime_t start)
> > +{
> > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > +
> > +	switch (xe_svm_range_size(range)) {
> > +	case SZ_4K:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_MIGRATE_US,
> > +				 us_delta);
> > +		break;
> > +	case SZ_64K:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_MIGRATE_US,
> > +				 us_delta);
> > +		break;
> > +	case SZ_2M:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_MIGRATE_US,
> > +				 us_delta);
> > +		break;
> > +	}
> > +}
> > +
> > +static void xe_svm_range_get_pages_us_stats_incr(struct xe_gt *gt,
> > +						 struct xe_svm_range *range,
> > +						 ktime_t start)
> > +{
> > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > +
> > +	switch (xe_svm_range_size(range)) {
> > +	case SZ_4K:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_GET_PAGES_US,
> > +				 us_delta);
> > +		break;
> > +	case SZ_64K:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_GET_PAGES_US,
> > +				 us_delta);
> > +		break;
> > +	case SZ_2M:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_GET_PAGES_US,
> > +				 us_delta);
> > +		break;
> > +	}
> > +}
> > +
> > +static void xe_svm_range_bind_us_stats_incr(struct xe_gt *gt,
> > +					    struct xe_svm_range *range,
> > +					    ktime_t start)
> > +{
> > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > +
> > +	switch (xe_svm_range_size(range)) {
> > +	case SZ_4K:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_BIND_US,
> > +				 us_delta);
> > +		break;
> > +	case SZ_64K:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_BIND_US,
> > +				 us_delta);
> > +		break;
> > +	case SZ_2M:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_BIND_US,
> > +				 us_delta);
> > +		break;
> > +	}
> > +}
> > +
> > +static void xe_svm_range_fault_us_stats_incr(struct xe_gt *gt,
> > +					     struct xe_svm_range *range,
> > +					     ktime_t start)
> > +{
> > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > +
> > +	switch (xe_svm_range_size(range)) {
> > +	case SZ_4K:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_PAGEFAULT_US,
> > +				 us_delta);
> > +		break;
> > +	case SZ_64K:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_PAGEFAULT_US,
> > +				 us_delta);
> > +		break;
> > +	case SZ_2M:
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_PAGEFAULT_US,
> > +				 us_delta);
> > +		break;
> > +	}
> > +}
> > +
> >  /**
> >   * xe_svm_handle_pagefault() - SVM handle page fault
> >   * @vm: The VM.
> > @@ -863,6 +1102,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  	struct xe_tile *tile = gt_to_tile(gt);
> >  	int migrate_try_count = ctx.devmem_only ? 3 : 1;
> >  	ktime_t end = 0;
> > +	ktime_t start = xe_svm_stats_ktime_get(), bind_start, get_pages_start;
> >  	int err;
> >  
> >  	lockdep_assert_held_write(&vm->lock);
> > @@ -881,17 +1121,29 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  	if (IS_ERR(range))
> >  		return PTR_ERR(range);
> >  
> > -	if (ctx.devmem_only && !range->base.flags.migrate_devmem)
> > -		return -EACCES;
> > +	xe_svm_range_fault_count_stats_incr(gt, range);
> >  
> > -	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
> > -		return 0;
> > +	if (ctx.devmem_only && !range->base.flags.migrate_devmem) {
> > +		err = -EACCES;
> > +		goto out;
> > +	}
> > +
> > +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only)) {
> > +		xe_svm_range_valid_fault_count_stats_incr(gt, range);
> > +		range_debug(range, "PAGE FAULT - VALID");
> > +		goto out;;
> > +	}
> >  
> >  	range_debug(range, "PAGE FAULT");
> >  
> >  	if (--migrate_try_count >= 0 &&
> >  	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
> > +		ktime_t migrate_start = xe_svm_stats_ktime_get();
> > +
> > +		xe_svm_range_fault_copy_count_stats_incr(gt, range);
> > +
> >  		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> > +		xe_svm_range_migrate_us_stats_incr(gt, range, migrate_start);
> >  		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
> >  		if (err) {
> >  			if (migrate_try_count || !ctx.devmem_only) {
> > @@ -908,6 +1160,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  		}
> >  	}
> >  
> > +	get_pages_start = xe_svm_stats_ktime_get();
> > +
> >  	range_debug(range, "GET PAGES");
> >  	err = xe_svm_range_get_pages(vm, range, &ctx);
> >  	/* Corner where CPU mappings have changed */
> > @@ -927,11 +1181,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  	}
> >  	if (err) {
> >  		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
> > -		goto err_out;
> > +		goto out;
> >  	}
> >  
> > +	xe_svm_range_get_pages_us_stats_incr(gt, range, get_pages_start);
> >  	range_debug(range, "PAGE FAULT - BIND");
> >  
> > +	bind_start = xe_svm_stats_ktime_get();
> >  retry_bind:
> >  	drm_exec_init(&exec, 0, 0);
> >  	drm_exec_until_all_locked(&exec) {
> > @@ -939,7 +1195,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  		drm_exec_retry_on_contention(&exec);
> >  		if (err) {
> >  			drm_exec_fini(&exec);
> > -			goto err_out;
> > +			goto out;
> >  		}
> >  
> >  		fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
> > @@ -953,15 +1209,17 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  			}
> >  			if (xe_vm_validate_should_retry(&exec, err, &end))
> >  				goto retry_bind;
> > -			goto err_out;
> > +			goto out;
> >  		}
> >  	}
> >  	drm_exec_fini(&exec);
> >  
> >  	dma_fence_wait(fence, false);
> >  	dma_fence_put(fence);
> > +	xe_svm_range_bind_us_stats_incr(gt, range, bind_start);
> >  
> > -err_out:
> > +out:
> > +	xe_svm_range_fault_us_stats_incr(gt, range, start);
> >  
> >  	return err;
> >  }
> > -- 
> > 2.34.1
> > 
