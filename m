Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FEFCCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B9E10E18C;
	Tue,  7 Oct 2025 13:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IfAnCO5t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31DE10E18C
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759842046; x=1791378046;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=15umiyAI1jvV6ykBALRT3am9T1zxZSifZxz7acIetQs=;
 b=IfAnCO5tV6KGyuOog0eMuiPIGqVtF+ZMcdaAkLTyXPUYWh4scXibMBPE
 TgLe1evY9LQAQfHgMM/9nETYdiImXZjE7L54fPJ5jwV55HHtAsnpl0fxW
 Z/h378Y0ZtyO7XkCbndp0MBAhhbp23uCLpKGU/HK681OPfVi0eQG9QRpD
 AkRQq5j8Zj7ROa9fh0wvZHePX6Ic66rTzE8TB6AQGlbhsGF84KG02WZbU
 cROCXI43pNVZmxeCRARdIct3tQl6C4U24CgdBEuiFcqOi5FkOjefynQ/U
 2DXqAQ+gAYzSJK0fcZaFS78o2dS1oyxnh4j16G5QrccTfMi/jBbkHlOQ3 A==;
X-CSE-ConnectionGUID: ftArwkkrQ3miGgRZqQIGtg==
X-CSE-MsgGUID: xp329k4rQiasrWr/ZI9SrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="61056766"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="61056766"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:00:45 -0700
X-CSE-ConnectionGUID: 2y3MGmYPR0Kmoka/wSB2tA==
X-CSE-MsgGUID: v1ysgPEBQLuSBLd8P2PHZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="217233539"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:00:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 06:00:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 06:00:44 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 06:00:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6/VkoS+zdTOnBW4Y0QW+TvDkEzwLizMVK3+TtoUddJ8pMBxgbDf8IZxt1DIVgMA1uDbRq1NACchoLPBaoeXNbuXbdENCVPuTR9nE2EZb7rGA0VlSwET5vgZFPH44l5QT91guwuggPHvVGytN9M4TwxUsL/4xaS5FOziJ92vkzVSXxkcBqrlG6fpyX4bOFSe545TKu9zqxdUW5oA1chiVcDD3Rg8LKuT8ITRuqSaZUUQmN4sXM6ni+1Nn+V4GvIKXUeOTy9axffKBf9rUektNkoeyNw5p0O3lfP6yjAYna/nSlTW7I7BsNh6K5cRx/qKNBTcs/BoOiifgMCiZNBUlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtF24m3hjhaluS2tyDiR0m4GhUHT0bxUFGoK+KqsDAo=;
 b=ZZQuDvk7+CiHAbL72+GOPWKJqGsUpbNXDwhC4djIqV80v8wA4yY6FF83N6PJVkfgwC1nJ2Qdn2vuHH3KcrVWfdyPbtJZchXM9Q0bX17JbqLIpqH/BGuz/OqmOjT0hr8EgZUeQxASWNF/xbgRPgSfQpGNNOeeRHr09AAoM0YI30pcbbw3K2NU28PRLTg7xp2/B64yVIXbbOz27F9cIfuzzWzPkZ8eJzNQQYG839toB+UBD2QGB9zGbFQTtRlTFIFLB72ZOlL3/Ty8VCtMkG61qwW9f3iB1GRyvYMTLQsJagtPEGgVUQ+gpsXDIwxvL++OwMyMepkhverPdUZVsWLmIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB5909.namprd11.prod.outlook.com (2603:10b6:303:168::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 13:00:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 13:00:33 +0000
Date: Tue, 7 Oct 2025 06:00:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 05/32] drm/xe: Don't change LRC ring head on job
 resubmission
Message-ID: <aOUO755uNaFnYbuC@lstrano-desk.jf.intel.com>
References: <20251007112641.2669655-1-matthew.brost@intel.com>
 <20251007112641.2669655-6-matthew.brost@intel.com>
 <12156345-50ed-42b9-a213-1b6be14b6a3f@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <12156345-50ed-42b9-a213-1b6be14b6a3f@intel.com>
X-ClientProxiedBy: SJ0PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fae0141-eba6-4b89-5c14-08de05a1804b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wmhH3s1/araS54ap6iFnyqKJJ3eKyN8vtLmBIUXkKZWh8E0t5XeTsgPI2QTv?=
 =?us-ascii?Q?IB+hIj2HZqwyZ8q/qeGt2GTosEYTSMWp5YcuVdWl7/l3D53msrpbmxZXRl5b?=
 =?us-ascii?Q?tYlGiGIbF4hQfaQP31PxM4wovw7i+QMvEAuMvtk3w9SohLfcLZ7n7BWHu4UG?=
 =?us-ascii?Q?kfdxMjFsLnpJIk6A2pHcEYZHyk0yojgHUid879Y9qQVlLCMLVMnFAKVN4nHU?=
 =?us-ascii?Q?YK+1eVgYyGbQtMp33ZpeAc+Pj6weICUWjxsmS4rTaouDjM3kJq/Kgwgpzqyr?=
 =?us-ascii?Q?sRQDDXPWD1wZH18+xi8QWCIhKWAvTh7qhOmRXEzPc926iXE4Z/lRW09W1TOg?=
 =?us-ascii?Q?C6Q+kQW2v1obZ4s9eCnjqqai1B4EcMapyTQbehmT+yqyjFB3NNP6aAv5Sr1A?=
 =?us-ascii?Q?TIkiF4W5i40U8uxcze05qMnUFMSRsmVNUW1rgY4/nT2vyQRN5DMOv/oXoJQt?=
 =?us-ascii?Q?3IW7BYxFFdEr0sbzLMX6sVbAtCw8YKlINKaKB3wS4637dbGM/z3SY5W1tzs4?=
 =?us-ascii?Q?ZBbhHv9USynzRngvMvDEveHodptVrQ8HytMZA+jx6Pcbnyqlmt+STJKeRVTz?=
 =?us-ascii?Q?WZDk84kUa841f1JQtRSeXdOiy2vFS5YaBf/7vJstdd4MRgbuo8MhXszXJkMy?=
 =?us-ascii?Q?aqqwivlEe1wqjigXyjKDwbOxO1TRfqi9ny8ES9oG5T9QCD52y4JEotSUwezX?=
 =?us-ascii?Q?Gv01Gp4wiNG5taB/cAD6uRD8uY8lEEWwQNHxR+72MY3HxxcGtxQ3fJAyDCkc?=
 =?us-ascii?Q?P94QZ7uSAXclTwCvifs/nxgBBGYZIlXN4HU6l1ngA8iWXUI4rXtl4QTOpqm2?=
 =?us-ascii?Q?XSV/225glMAEeppjFhSIVz6ZHgPnrA54B4JlFcMA1a4PACb9ob3VKvb7/Rdi?=
 =?us-ascii?Q?SsZFQ5V2ly9Xmrq3zapzjkXnidveHXwew71LZWYZk+xkKiSzKSspqEMzBYdp?=
 =?us-ascii?Q?GZfdniCJ1XNfWUSfwHZN9duJ3aETjHz0PP1AN5lbKxnETxrIq2YfdBMaNjfe?=
 =?us-ascii?Q?OeGdINmbsRn53c0+bXUq3Emfc6Wibp4NcLzwf4qWRIVHzhmeTNI1cxEz8i9t?=
 =?us-ascii?Q?Yb36ay8L+8/+AM69C5m9KNSCtH5rDPH0g/eIEEAN2GQUj7kuVG+7Jv8pa6nt?=
 =?us-ascii?Q?BllGL7hb4UmKCOxfWHPC37dDHahE+FPFL5Ipa02h4PoJcyCWkkCSfj+o5SrE?=
 =?us-ascii?Q?gpoY/wRALsEg+vGqli0Sm/IWhtBP5E38CPkAkgGaWqCmck9cEItbwDlp/LZ+?=
 =?us-ascii?Q?J3h7rb0gCGbc1T8D7sreWK/HIluyiEaH37ti46HZ9J/V8DZLdjVX1gWFUffB?=
 =?us-ascii?Q?Agie5uywESkVV2vLuEBPjp4MzmioArI7KsTjHrX6xEgwucTHNvk+eG1NTLeA?=
 =?us-ascii?Q?VsoSxrJKZVyXJ8uyTuh2+9JcqHyLRgX8C+FR7rBrEoWbkS3KJQJXOAkIGw7y?=
 =?us-ascii?Q?oeMyZ8VS6CWLbTahZRs3k2S2tZScOnN4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xm64HBN2bmF2DemcuD/pWJP0iAgd94kbQIbCbljE/XY/sLA3vH4Gs25loA2g?=
 =?us-ascii?Q?785Qi9MS7aUkhtivbca/mUCAogrA1I598JGVNCtjljitHa/Wwq4OrVf2B0Zp?=
 =?us-ascii?Q?2XAcx6G1Xs+QXJDs+OimQqBxpVAiOjNSuLPLd0H9H82sxHnBwgEjhffX0ZYu?=
 =?us-ascii?Q?cXZgYiBl1YxrvTxbTNxOz7Cxto/ICCDlRtTL3U5HakA92EbpCPne3M70/qzS?=
 =?us-ascii?Q?Q3WITsba/a/QdBylajpjUQFi6tb9XUYexjfvBowjFYiYJYDvk3cn+hA9bd5r?=
 =?us-ascii?Q?q6csAtpm+Y6RnwvmIp8cGtQSZ97R2IYgAwQJuWE92RPX8UrwztNXjQ0GM7R+?=
 =?us-ascii?Q?FLf4QAEcXmWXQeSA+mqHjuRUswVPSFH/WhZz9HknBoyyuwLiWiDBqmFvNldk?=
 =?us-ascii?Q?40AdU8/HGXJdWvCjINd2QZjm8oHZkETI+5WRU80HE6HtIiNxnBJRRFvgacEs?=
 =?us-ascii?Q?/0ndQl2GaH6fZ0jkM49+2M7dbzYL+IQgHCJ/tPqmL7IzrPUoTcU2ofF7kuun?=
 =?us-ascii?Q?PmqvJiFbL/ziXpD663mqxsxM7pNpyC3pHeFpK//vj664H2NTL4B826UGQHLb?=
 =?us-ascii?Q?QToBU/HIoRL/2WAYSzkC+219W3/2A8gnoTTWogB62S8p9tcAgsCA2zu+4/d3?=
 =?us-ascii?Q?BMU2mZ17hpmtvJBPcpqsF7d80+iIfLZCMCyrw6aYgLJ8DClDhOhPnZwjn/g8?=
 =?us-ascii?Q?TBVO0tGBb+Qj3K7qQTFTj3ONcpgqVxdyCMEvDctHsmoaZVYRmLrYLQJkmwP2?=
 =?us-ascii?Q?67KzHDZq0h2vPsY9VKtKNyRuzYRXFj7Mxo1Mpr6Lf24SRjgBgyQICSp6V2cf?=
 =?us-ascii?Q?Z7Xhr4AcT4TZLk5TA1wuhGHjxxVwoytMHUO25HGFY9ioiCB1fPRP4qMqI2a5?=
 =?us-ascii?Q?CW9oHWoTVZKzvcRYSNj2bRyImCnh3DLe/01USSp+Y189R5mFiCPK8yILJke7?=
 =?us-ascii?Q?VLjPYGSfsqv1we88pP+Ez+EUxMc/0QVgcb0jQV5tzfRosI6aqXfluAee2zQU?=
 =?us-ascii?Q?W18Fw4rjilds2kv057UNkODn/ym6NBObg602aO4tFP1Wnl05G2hEU8bXSQdk?=
 =?us-ascii?Q?QIdDGIZue5/sJubgXrFP3RiYr4w6TR37yPYgNrxWX5AD7Zi+f3vU2ss4bseS?=
 =?us-ascii?Q?AJTAowAESR7FURrkzWJZ6UNkisYpnGPf56hTo5J2E3Rfen7tlWfptDf8Wi1x?=
 =?us-ascii?Q?mZKFxe7V8PYdeyyTEOTRx0c72diWUpLk6faK5/oq9YB/O+f6wK1VG+CjmBgC?=
 =?us-ascii?Q?U3h901SzEA6E80I1vGkUnPOlYr0+07QzSAlMaP6k6BdDKns3aDiTfUcvbmOR?=
 =?us-ascii?Q?GlQp+qlDaN41TuCfjWsh/pJCuLwZfdbF1Yc4SJUvhEY7/xdErUkrrUooyHeJ?=
 =?us-ascii?Q?EOK7FZgwJixijKEz6Eg9OAdCOG3soPtDAyYV2GwbKbhxIxJdp1GJUdveLSPe?=
 =?us-ascii?Q?siZlte221UYZqEYFYNzrku+ncePvOmj/C5v9K/OwSorFq/VWyAVVVNUwLp9B?=
 =?us-ascii?Q?x3g7PnBJo+NMYVisC36ey75hJXQihceAkvFFXQd5xEJCkBaXEYWj5s2MZ3X+?=
 =?us-ascii?Q?aa2cR+WLJAUO67oaf/e6b2xJ0dz77SQ195k8Irl0bGP+G0PmceBLJYnOZzBt?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fae0141-eba6-4b89-5c14-08de05a1804b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 13:00:33.5327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dSanLazGZGm4LhejrJztp53ssJgUWzIUXZQzNjfxhzUe3a7JPugRYIsnvlk+VGCNSxMc4QPGgiEgkFnHc8zFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5909
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

On Tue, Oct 07, 2025 at 01:29:58PM +0100, Matthew Auld wrote:
> On 07/10/2025 12:26, Matthew Brost wrote:
> > Now that we save the job's head during submission, it's no longer
> > necessary to adjust the LRC ring head during resubmission. Instead, a
> > software-based adjustment of the tail will overwrite the old jobs in
> > place. For some odd reason, adjusting the LRC ring head didn't work on
> > parallel queues, which was causing issues in our CI.
> > 
> > v5:
> >   - Add comment in guc_exec_queue_start explaning why the function works
> >     (Auld)
> > v7:
> >   - Only adjust first state on first unsignaled job (Auld)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gpu_scheduler.h | 21 +++++++++++++++++----
> >   drivers/gpu/drm/xe/xe_guc_submit.c    | 18 ++++++++++++++++--
> >   2 files changed, 33 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > index e548b2aed95a..3a9ff78d9346 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > @@ -77,17 +77,30 @@ static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
> >   	spin_unlock(&sched->base.job_list_lock);
> >   }
> > +/**
> > + * xe_sched_first_pending_job() - Find first pending job which is unsignaled
> > + * @sched: Xe GPU scheduler
> > + *
> > + * Return first unsignaled job in pending list or NULL
> > + */
> >   static inline
> >   struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
> >   {
> > -	struct xe_sched_job *job;
> > +	struct xe_sched_job *job, *r_job = NULL;
> >   	spin_lock(&sched->base.job_list_lock);
> > -	job = list_first_entry_or_null(&sched->base.pending_list,
> > -				       struct xe_sched_job, drm.list);
> > +	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
> > +		struct drm_sched_fence *s_fence = job->drm.s_fence;
> > +		struct dma_fence *hw_fence = s_fence->parent;
> > +
> > +		if (hw_fence && !dma_fence_is_signaled(hw_fence)) {
> > +			r_job = job;
> > +			break;
> > +		}
> > +	}
> >   	spin_unlock(&sched->base.job_list_lock);
> 
> I think it might make sense to split this change out, since it also changes
> the behaviour of the other existing caller, and that might want to be
> treated as a potential fix. Or commit needs to be reworded to make this more
> clear.
> 

I'll break it out into its own patch as I need to respin for CI now.

I don't think I'll include a fixes tag as GT resets shouldn't ever be
getting triggered by end users unless our hardware or sw stack is
broken.

Matt

> Otherwise lgtm.
> 
> > -	return job;
> > +	return r_job;
> >   }
> >   static inline int
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 3a534d93505f..d123bdb63369 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -2008,11 +2008,25 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
> >   	struct xe_gpu_scheduler *sched = &q->guc->sched;
> >   	if (!exec_queue_killed_or_banned_or_wedged(q)) {
> > +		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
> >   		int i;
> >   		trace_xe_exec_queue_resubmit(q);
> > -		for (i = 0; i < q->width; ++i)
> > -			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
> > +		if (job) {
> > +			for (i = 0; i < q->width; ++i) {
> > +				/*
> > +				 * The GuC context is unregistered at this point
> > +				 * time, adjusting software ring tail ensures
> > +				 * jobs are rewritten in original placement,
> > +				 * adjusting LRC tail ensures the newly loaded
> > +				 * GuC / contexts only view the LRC tail
> > +				 * increasing as jobs are written out.
> > +				 */
> > +				q->lrc[i]->ring.tail = job->ptrs[i].head;
> > +				xe_lrc_set_ring_tail(q->lrc[i],
> > +						     xe_lrc_ring_head(q->lrc[i]));
> > +			}
> > +		}
> >   		xe_sched_resubmit_jobs(sched);
> >   	}
> 
