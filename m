Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579CFC5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 14:13:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084D310E83D;
	Wed,  4 Jun 2025 14:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgkJxtiM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2988310E8CB
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 14:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749046389; x=1780582389;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lbxnbEbRlvHUmR3+9C8RMeTmAWjymTPyc+8WB31xopY=;
 b=VgkJxtiM6ydXw9YuNytsI1ppJL2iDVvKn8R0DvdwtF0NtZfYGdP68DbP
 KSXTDTQgIeEn+3ULYkUnBR2Sm09yLuCTXnhFjBJg0hyMBpXJxTCFRYme0
 gqLSQSkMtGGwMYzl6jIejknvYqx9kIwcIEde/tBgNVWSa05HZbhHNUWmp
 9LWw1W9L6kvbDQjUNpmiKD+k2KMpJOYtspr5Lqg1/BR/1ajyY9QCcwCbb
 k4iIFuygaDFERPMbLP/l5TfSHHZEREfIvOBTNoTcT7McM3qKgAdtg5ph/
 cCScn9Xfg/B/FBjOpKa0S2cIiHevPYTbY6/usGE//OXgeQlzbB7K7bofZ Q==;
X-CSE-ConnectionGUID: pfQYeTElQH+L23CxYoDGMw==
X-CSE-MsgGUID: dNkt8xe9Rry0TzgsVYHsnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="54795466"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="54795466"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 07:13:09 -0700
X-CSE-ConnectionGUID: pnSLeWZmQdyg9UcsNaYlwA==
X-CSE-MsgGUID: +BLIP6D6SJyFzU6Uq6cZcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145692513"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 07:13:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 07:13:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 07:13:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.87)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 07:13:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNs/Yo3qAClexJPBPJTA8q/+UFQJsY3sLKmDrSrBQE+x6jwNmpJJnVCkkXajB8BVn+dDt0vyPiVMAvsRwyw0Q5wUFTG8Rm+/THc2R0c6KbPlqKax3f2uLN4cRX1xVn9nXctn9bQBytEevPX6eebJp/spWxDfHJkMLmwRIhN6EaE2edUslS1WwCzhcSY9u8h+gSxR1a3E6JvTHzbRW68tEY/imJJUwp8lqwvhWsAT/mrgpPOB38WQUMx7uts3OsEg58rjTicqRDAYdtaYemwE2V7Pkw1qL862VoHL6ftkoogwnVNdRnWs6rzMGMFFg9SOGzIslCH/zKHVoc5ReA0nAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfqolsE6lche71u5j+O1/HloN2GZta1uJjzHSWXFXtY=;
 b=wU4UTHNM/3H3dRgmAf0tgxfqg0tk7tkP2X+BJX0ZujzQdHvAFlgH90GQn39Wy8dJOmqIkpGYQm4IZbUmtxf+kAsEZ0IRe2y7vh6KMThj9AHzVos48Z13YRN+3dyAUpuoUftLXG0Hq0JZqCeXAvm/NHQTcpUx1Twjf5eo2onTcyXxv4simuPhLi0anTBmR7EnhqgKi+xzZmcDFljpE3HVXc3QAwqM5yoqpGBGL1+dzicbflJ29W/d4U6aM3qfJVnPeEfXyzn3aqCTH0bFMRBbON6t3TadhM+2KaNMc3+etQtsTYwJP5mrbyeW76riGjHmf9OHUDrq8wYjZDoMSaqn6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4830.namprd11.prod.outlook.com (2603:10b6:a03:2d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 14:12:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Wed, 4 Jun 2025
 14:12:33 +0000
Date: Wed, 4 Jun 2025 07:14:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.mrozek@intel.com>,
 <francois.dugast@intel.com>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Add clear_stats GT debugfs
Message-ID: <aEBUrjYimeCKxKHh@lstrano-desk.jf.intel.com>
References: <20250603184522.2218192-1-matthew.brost@intel.com>
 <20250603184522.2218192-2-matthew.brost@intel.com>
 <b1e776a1-ff4b-4727-8f11-375a9ad00b8c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b1e776a1-ff4b-4727-8f11-375a9ad00b8c@intel.com>
X-ClientProxiedBy: SJ0PR03CA0237.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4830:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c12eb2c-0325-40ce-32d1-08dda371d94f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/H3Fu3Yl3m8E8txNquAXvYDAtRHzhx99tmHL9M4WxkzEAIJ8043Eb/+NGMWI?=
 =?us-ascii?Q?4EiCRRf7FLTvhrtU/lc3LF3vOit4YARFpQna6evFS1chGcW3kCkNc0HIap8s?=
 =?us-ascii?Q?zq+G1jLxEUF5lVzOZwVipJn6WaLHDoUXgvp66+NXJ/GlJICqicMm5pHG3yfG?=
 =?us-ascii?Q?kO7yCSjrMO7951uBcPZ2QQ8XtZ82gxzQ0IFxCOg8o5xMdVxpPbagGL/O+VpH?=
 =?us-ascii?Q?DlWJxa9kOBqXHdgXpAmpqbV98oFLDZXtaGFNSq9M9HOS1mXI74Mq7NLqHJ+o?=
 =?us-ascii?Q?ABEggZaTskmPxVQ+vMMcizOwZiqafy0Wh0z883FNfNnd6PqpIZxH25lHuFu1?=
 =?us-ascii?Q?jq6E4dGOyUvJ7eFyb9274mm3NaIAPmOP3OjU4ZRsS+rPZC5nermPnwVREpwA?=
 =?us-ascii?Q?sXodfMto4ZQDnj+eJmrN5ud70VuLIBjVm+XQH10Q5pFdo4gfAVqo9fbchsOt?=
 =?us-ascii?Q?96ILU7vPhPpJdTveu2x+NR/bGW8GSahYyI9bcbOO+VPjnEvJgtk9o3OLsOjp?=
 =?us-ascii?Q?/iC8ZiIwpegJG6kph+gjVyEwm93bk0FS1wFIt+PWEDZy2JPw0bsZN8+lps4J?=
 =?us-ascii?Q?L76bn4HaqfSELF7ar4jelnF2QBZ9xx+zzJotdxLkAx9bbk0IPOR/d99qehWI?=
 =?us-ascii?Q?t71U7ci147T/VlezHyTsLEeLEi5aXJI28XBJzauiNHThtTCnTHD/OPWdbjiL?=
 =?us-ascii?Q?cuH+/v0azZSOSlhdr11ouwgxdBLHXr1xkBx8Wl/TpttU8uYDtBXPiynZ7ALg?=
 =?us-ascii?Q?I+VGFsz7hwBafraTgeLyIXwhAcvzsB9XYPw1viBA4eOgZTu5Pgmbjme7ZE0q?=
 =?us-ascii?Q?2fwE0WSyFbwHAxZIgz0o/ojSyO3DbY4C/yAqckVXJk++PKtesoD7sH0YdjEF?=
 =?us-ascii?Q?CCjskiJ/ISgh6yV7eUh0kqCe/m5R2nlXXo0/ymLA9Bn45i+vy5BJiV5etvsQ?=
 =?us-ascii?Q?qP+8sRbTNtVeUsm6ZBWg6ABzU/6B2/Yq5BrjEGuWKY3SsZl9386FHjZ8/2e4?=
 =?us-ascii?Q?831MTIUvGJIrtFEeHgjQKgxJ5bTSmwfXVs94hEVCNCfuesdZCaqQzLdey3tD?=
 =?us-ascii?Q?VEUF16MzvNnvHvg9bwQ/s8CNVt3e1KaC5XohhpvOSaAr0BTDR0wveMfX0uCm?=
 =?us-ascii?Q?ju7g05UZZc38lTXMMluVbhDLE4qE7bkVaoQmFl2wcImzvDlANytqRHo00hJr?=
 =?us-ascii?Q?pzW0Qzkvp5QgZSvaWoZiHV4fGc3EIEnQ0XWxzmmC9dt4AuI/oVNFt/TUaJLD?=
 =?us-ascii?Q?chtDMLs3L8tcaT94hwNQeK+DNpqFOULryAJYNdJM2K9VhcvrZZeClO26UR8G?=
 =?us-ascii?Q?ygcEUCCwygN6vPhAR+ml6X7fcfhLmOg8WUcm2AyO2tp1egwjYo3Cyn7GILYe?=
 =?us-ascii?Q?WchunndPZ+3lkPgR4B5XQVQKuz1wkQK97JbEERxqRt0NxG1L03HwecB4IYXk?=
 =?us-ascii?Q?T/4MjcUlqoo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uELCXS2jJ9uBDkVkSVIADF+jHx0BrJ+N518zZZiIthbkEjZoAQWX9Q9FBOfK?=
 =?us-ascii?Q?aLrNHRjj9ile1dFyK+2efg4vKjV1wFvoUxJLQ1HHH3F5DboNKr/CMyLmwoxL?=
 =?us-ascii?Q?/qOJtXLxZ/NkcDcg1lJvdmqXWfR92Dod0of6XFz3iokV5+P6omSbMysgJO3O?=
 =?us-ascii?Q?gn4sFXYF8uGXDveBiL1tuApIMspiYLZnA98hP2iHuo48P9m9ANCNhBUq+bVp?=
 =?us-ascii?Q?/OW1x1a4KR4TaV0+uEIboKJBD5B+cYJT6+8P3YiYcNMF5PaXX9uabp5TILIF?=
 =?us-ascii?Q?XqOYTbkIuTMHGWdPvD4Jdjdedmeyqo4NO94yLxS3ZcbX9FVNYM+mULCl6toY?=
 =?us-ascii?Q?r8Sys1Q0FAEgtgQXJcDDeNt2r1wCLzQ6XqGE2m2FB9COrGQY+hWCdpqfEob7?=
 =?us-ascii?Q?GnJKJkA7+4YIwtOlwv00et1L/wu5sgfTAZ353LYnN4JnDHsOFaXzYMSr1tGJ?=
 =?us-ascii?Q?JmxIYsA+drykkIaxjP/mKXLLh5Qoadvsrm5nfIFSIeb6G0Y9JGWF5eRBRQ6U?=
 =?us-ascii?Q?uZS3unOkdrGWkaEST1jVdXM+zTuLJ50KGnQEuCEaXEbrGTvIHgdxotkSMi+L?=
 =?us-ascii?Q?GKSSJm5bGvEyJDF5QbTa7Y05+OFclbUh65cYwc+F+bkfXQ7mi7KtMDO/Ei1t?=
 =?us-ascii?Q?L8ZibOYSlVaxrts7tvgi+jeefo8UKEBhckiW/LsSwfQ+uwNxixMPNr4X4OBb?=
 =?us-ascii?Q?pvF0zpieZ+uLdvQPPwxQpCKJH7WghxURtRK2WJVbb4Xj1sKPqDeBzBkMpb8K?=
 =?us-ascii?Q?gIgFCBHxDIsYojmleeQ7PRujHM38E6lCoWAFTvl8d3EoQLeRrDlYr2JvOQJI?=
 =?us-ascii?Q?3biVhHzr62ffrFddSl0DVNiesA0Pwgj76UGIc8s7bmxpgxkoz3yv8KdclAdm?=
 =?us-ascii?Q?vc87APqaOa1WXTLTWZLjmdQQg5FhN1kx+G0Zi6qtVrVZScs9+SMlDdO1UJ3k?=
 =?us-ascii?Q?ZpRYFhSAY26pBfe5HqaWb+HyeIuy31EARlvvPBxZM3nArVhbTqLmnNJggaYu?=
 =?us-ascii?Q?GvoHcXLRzdu4M4Ktr4glZcwxOsmwcsPiS03zaDIsTKhr/kWJoDu/P+Z+1aAI?=
 =?us-ascii?Q?EF4kT5InmaVZBmhrIP3+2tHAsuw94RlY+Few239EbE5c6xxoYfwbh8f9STJF?=
 =?us-ascii?Q?mGW2nJDU8nxblxc9qI1UNIpMah80KcpwuKKRCdWjoDjnBRTB6XqBP24cpNLh?=
 =?us-ascii?Q?IPs31Q3vu/3UTOciRxdywKTpa2XA8CUK5nC8twOTA49UOkgAEz+bYpOaPJ3k?=
 =?us-ascii?Q?QpbwKxA/iUtpybMfK20b8tPIebMdkA4fII/BcHcgtSOnkBeEK1Y5SlAli8lx?=
 =?us-ascii?Q?zJoPuZuZWsXqGofXOJEtRrE5fBRU/cJPC8cXNgGUE6CTsBSQyeDE01461CqG?=
 =?us-ascii?Q?9AcMXRLPFw9davP7WgP0B9lYOzwTNrGKVjq7dK3eqOagUABFXUigq9Ikderg?=
 =?us-ascii?Q?uwEA3RUcREmEbhR3DtfPsE8oPC+vQH7Tf38MxyG6mHuF/1hBdrWKsivTf2Kf?=
 =?us-ascii?Q?ylBrYY2Gv6GTbZvxQuMTTRPN+Amb41eZLNY+XVKhXacd7dYDLMyDBDVRw4Yq?=
 =?us-ascii?Q?9QKcn1NKPW3037ZY2fjM2CWrAk3CeVGUM3nO6SZeG+mEkcQnmFZLSg4BDOe6?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c12eb2c-0325-40ce-32d1-08dda371d94f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 14:12:33.0926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5XLRKjLpDhtxufTUi/AwcuF7pq9KR+9WdKXAFTa1zXN+tTeuVPuj4VK7TIeJdIZ937VBRGvEwS3xCLPtFEXvQ==
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

On Wed, Jun 04, 2025 at 12:41:25AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 04-06-2025 00:15, Matthew Brost wrote:
> > It helpful to clear GT stats, run a test cases which is being profiled,
> > and look at the results of the stats from the individual test case. Add
> > clear_stats GT debugfs entry whih allows the clearing of GT stats.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_debugfs.c | 22 ++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_gt_stats.c   | 14 ++++++++++++++
> >   drivers/gpu/drm/xe/xe_gt_stats.h   |  1 +
> >   3 files changed, 37 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index 848618acdca8..a6888f03a4dd 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -328,6 +328,27 @@ static ssize_t write_to_gt_call(const char __user *userbuf, size_t count, loff_t
> >   	return count;
> >   }
> > +static void clear_stats(struct xe_gt *gt)
> > +{
> > +	xe_gt_stats_clear(gt);
> > +}
> > +
> > +static ssize_t clear_stats_write(struct file *file,
> > +				 const char __user *userbuf,
> > +				 size_t count, loff_t *ppos)
> > +{
> > +	struct seq_file *s = file->private_data;
> > +	struct xe_gt *gt = s->private;
> > +
> > +	return write_to_gt_call(userbuf, count, ppos, clear_stats, gt);
> > +}
> > +
> > +static int clear_stats_show(struct seq_file *s, void *unused)
> > +{
> > +	return 0;
> > +}
> > +DEFINE_SHOW_STORE_ATTRIBUTE(clear_stats);
> > +
> >   static void force_reset(struct xe_gt *gt)
> >   {
> >   	struct xe_device *xe = gt_to_xe(gt);
> > @@ -408,6 +429,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
> >   	root->d_inode->i_private = gt;
> >   	/* VF safe */
> > +	debugfs_create_file("clear_stats", 0600, root, gt, &clear_stats_fops);
> 
> shouldn't 0200 should be enough ? I see no real need for read of this
> attribute via debugfs ?
> 

Yes, agree. Will change.

Matt

> 
> >   	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
> >   	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> > index 30f942671c2b..7e12fc3759e2 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> > @@ -50,3 +50,17 @@ int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
> >   	return 0;
> >   }
> > +
> > +/**
> > + * xe_gt_stats_clear - Clear the GT stats
> > + * @gt: GT structure
> > + *
> > + * This clear (zeros) all the available GT stats.
> > + */
> > +void xe_gt_stats_clear(struct xe_gt *gt)
> > +{
> > +	enum xe_gt_stats_id id;
> > +
> > +	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
> > +		atomic64_set(&gt->stats.counters[id], 0);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
> > index 38325ef53617..e8aea32bc971 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
> > @@ -13,6 +13,7 @@ struct drm_printer;
> >   #ifdef CONFIG_DEBUG_FS
> >   int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
> > +void xe_gt_stats_clear(struct xe_gt *gt);
> >   void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr);
> >   #else
> >   static inline void
> 
