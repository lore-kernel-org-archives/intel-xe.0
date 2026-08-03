Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9268C55182
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 17:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9810610E5F4;
	Mon,  3 Aug 2026 17:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rf5AAOwd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108B110E5F4
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 17:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785776772; x=1817312772;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=soakE6tuj+hxsmH2VSWTeZdxv00udvCePJjlaEPMImQ=;
 b=Rf5AAOwdKiD1T2G/H3N7iW8lkSqYK9HAr2ILtycbZPMOpOVfGaVeV+AE
 G2BINw6jKdHvj26zlaF1c4Bylh2IfQkwtNStvEoo2LJjehSLQ2D28/4Z8
 b4b7t63soa119tHr+Q8h2d/+w+ORjl7HblrjSQzuQdKXj4w4RH9iCKGQ1
 sXji5kKmPHGLwzOXVsxZlM+RhCyDefab7BkC7MEfxwMKIugksEdGR34qC
 Q7Z962yevEyRp4lWXxdCVPX5973GqZPMD7CebI4rNjkTCN0+qlUyCv+gp
 Dcp4tFktJxPXCQ5rs4dEaDPS1I+qpM7wzvfeOC6m0EcpamHpznvqEBLkt Q==;
X-CSE-ConnectionGUID: WlCdivfOQSu28LtEZW5nUw==
X-CSE-MsgGUID: WlVfmxSSTXyJ3uRNRstA8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86400283"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="86400283"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 10:06:11 -0700
X-CSE-ConnectionGUID: LeHQ3gOARUSViX/ninfeZQ==
X-CSE-MsgGUID: ionxR/NtS4CTfPUoulMELA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="259485034"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 10:06:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 10:06:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 10:06:10 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 10:06:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUJTTNzifv2H9uvtKoUOIPq41+V0xQixV/bZcRnbzb2ne1yzcQkVsvPS0bsxlNGeN5FVaVJuFoPbDiDWuhj6yYoupS+rHi1PJQsiuk4nuiPF5Tu6H89Q7fX0BvTSfb3+b6A0ZjSLMHtYnvm+j9Kge5NX4xKcXeTtK5MfCDB9zxcl/Du+qiC8MkgU+fj2mTIieE7pEyOjTwl1SV5mIR/2Vg5dDhJMji4l2eyNT7qZhYPuMNPcAM6ENjpCQDKlHA+bh17FtCBIJy9fgpSZkJNak7yrrhVZZ82cvZ0qQb2BzN/eIZ8qOFsEOMlc9h+Q+36xwanO9gmBuYXawt1AeReJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOPYuwp65q0Aq9CgI42RDRUgvJbQoB4wTXSRVcAeMy4=;
 b=ARo3yMlj7hFC8c/8mA3c7l+xTrdLqu4CvdxHSD53fI7WZPJ2c1HRJLjDc4cDCkU3SEbFuf4ZjS8DpZBI44lOeXEQgvS1OJ2geTJAeU6lihK5t4Ka+jQ7kKRh9D4iV4/vHAFiiGeSLENtJ2Gd/4ZNOP4aO9x7IXhksD4S01z/XnQR6ZMrhDyx3mn7A5rHdxumVO9QJOFCsCWZu00boRsrMmlUvu5B7+Trm7k/wCBwYTvytvHIH6+GrDvTrT5XUltUJa1roO5FRIZrGNkWY/OxcToLpoFwqnKEU0TjSLmMQQ1rAl5prU9LrYvNxSSDuMMEmS4y7zeM8VdtytYmP9ljiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5140.namprd11.prod.outlook.com (2603:10b6:303:9e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 17:06:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 17:06:08 +0000
Date: Mon, 3 Aug 2026 10:06:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] drm/xe/multi_queue: handle CGP_SYNC wait timeout
 during VF recovery
Message-ID: <anDKfYL3kCpI9Lza@gsse-cloud1.jf.intel.com>
References: <20260731232625.3313657-6-niranjana.vishwanathapura@intel.com>
 <20260731232625.3313657-8-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260731232625.3313657-8-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR04CA0256.namprd04.prod.outlook.com
 (2603:10b6:303:88::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: e8df6289-f07a-4d3d-8285-08def18182b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|11063799006|4143699003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: qClSmP0j3qyujDXTep6L/0tqvAL2lOyRNa6p6Wt3NTS518E9t881P+zxZrXpMNSSlkHOB4bNdcvqHvnwD00tXfy81Azvkey1BjuesaMHEsnCkfcmr4oc6JKvCu78QJNzm5tGKEPAo9irx1RBZmEtE1mxEJmqw5nKheCS1bz9ice0K5vpM2VeMKs9uFBVJhI5yL6eENsM2dnrk5D2vNUfaKhoffC7WH/O+pSlkHlEc+oRgHiDjzZtm+PRdr0ynZQpE+LwW0vwmmfr630PlKhZegN5MepVGKoD4U5Is7AKZ0wf37KkL0QGEY9HQ350sAz1ubvH+ZcjFuAGblnnNh3G59KS2zngiGn7Qg7dEopu18+NMjRRV6fS0AkRd5lTdVoCvCtyNYwlg/FDbNVtdmynwj0ctAWwhJQGZbeeiBW0juBPqrZ/Jda1iBGld67PukI7OS0PXDBIKzmg6tsNcfzBZd2chSh3XLQ3Rag0O8dLVB3Avk9zv+YS/MVzVNhoJZZOnKvki/nmkiUxGd8fnbM+aS1xRXWGvyGffCi1XTY/FlxRFqsXKh1bHNAVswqi2B9s2izU2BvOLNKT2+MO08DtyeVwIlbATDqGyIGzT36EHF9ou+mOnHq8QIl+fWqgBcYjVOb5vtDjQ/5pNzb2FxsGBZlKvD/yXCCIlO01w9nNyDE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?afgxOwe+56UYuU+aI2qV3vatfs7tFMjTlEShHRjd7KGs8FweOhn7usYxoI/Q?=
 =?us-ascii?Q?mYfDKkfNs/rzJr1Sg6BWGiuPZVr8A0YHE5xWP3me5CZN/yjsNwaIrMkRi+sF?=
 =?us-ascii?Q?PjLdLJD2rPOT1jiJQHXCNGHRpwj8d0zOa+eOB7WOrEbgaZT+wZELZKVzLqje?=
 =?us-ascii?Q?O/yrXtB1JyQAyw+Z15xq61tNRQdihTgwGFkfDFWDBV+r1wHZGSTnWrs6jqNH?=
 =?us-ascii?Q?R4GivJinn+aUcBd2eCLr9PDX/h9DUa+hW2HjOjnrHSboLVwndgiWjodQ/sX2?=
 =?us-ascii?Q?wGOgY+rLeU9elVen3eLXTtKvAgV1McGP1wJVKy8j/jOJGEdxTO7y/++nNPlL?=
 =?us-ascii?Q?1LUKCUK80apEBzs8SOt+ujHrk66YHAf7GPsxEWjH5KiuzV4vjocdMOd5O4jK?=
 =?us-ascii?Q?/UiMJo1n2LJTuzN00+cFjupM2/+MSU2FT5C/4FwvQim9yUVAsShiopb6GOg/?=
 =?us-ascii?Q?U4i4+H5pny+t9gIZx2Rgf0bVdwbYURqujMZc0PIvuvXUqhOJdXZKtKf2HvBl?=
 =?us-ascii?Q?YtSeV9bybgnbVnytRXQq9xpBeIY6ea+4RkQe2s4THO6ySECYHu9YfhSXp+pR?=
 =?us-ascii?Q?opxOkX3r7KbIfkPkhY5p93qcQ7KiZVh/rLv7lG9JvmHyDa3P4wqlJ4pT+v5G?=
 =?us-ascii?Q?e1cdzI2z8gpRrsLq0R1GemMpjPKovatPwkC9OslrRSuPtIpBq1Wr3T8ibBwH?=
 =?us-ascii?Q?0d4noOpHusaYmBzA0maww0KFS7Knec0eRrVg62nY/kN9oSOOahMg5YB/6iWd?=
 =?us-ascii?Q?ytrvVB+ziXGmD/ZOULLs5OAiaEfyLKAIEAFEwmMQza+RgnolXCbbBgLNLVXw?=
 =?us-ascii?Q?QcJqogKq5IUbsITiArZEtk0aCigQ4ETqe8GtWpoDZloKHEH1B1y6ZzDIox31?=
 =?us-ascii?Q?9UWpznsRvJbO7DlvFaCXEoFaiEp50cWKaKj+vuLnkR4MRgNOIB+cIX4VhuRX?=
 =?us-ascii?Q?CF6iU1RcMwmQfnbenDIo1EfrG9BF24Uer3ANAMsqGg1g84EUO/hNST9vG+TF?=
 =?us-ascii?Q?PtrknnPF4MaBgJ9A7VRfk0189Zmc3gbIMvubTR7ZTkjNnq9OzYxLLLk7YztK?=
 =?us-ascii?Q?dXQ45EvJDFugxv4H+0oQ8RyNEWGsKl96MH152ptGXYxi5AFKWKmAu5VA5TeN?=
 =?us-ascii?Q?KRb/hLdK07qsnUft0EfcHdgpJycDqKSdJlkVlR5CCF7sE+ZuPGniFA9hWP9U?=
 =?us-ascii?Q?gI6vP75is/uH7AlK7Nx9rOkzY7FBmPoLTuZbDl0bj4upBx5ExbTkb8K2YRBX?=
 =?us-ascii?Q?sSLhD2t3RS+5sZmIPNkBK1hn4siLx+7/jyJnxFm93MMVCM3SV1B6nwdqMnhP?=
 =?us-ascii?Q?QgbkiYtc8XrnNUmC+X+D4aLJ0A3GKne73finZTn5LORCLJavmdNqD7/+CWLR?=
 =?us-ascii?Q?2YSZffCZK1AtSz8MJGL2R0Wa2e0FnYy1ewDb13ExdCbKYYrNmy8X0Z5GJh1U?=
 =?us-ascii?Q?gGHmYdK7DRhOMT0a/vtiAuLYdg0Yz/ByrZFmPojJtalsI3hEpRUPjosuC+/6?=
 =?us-ascii?Q?2xWiIW72yxMBeZ4ayYXjX+geC8Z4SZ43xZAzb41qBKUTB4e+6n7pLT0LJZOv?=
 =?us-ascii?Q?CWFW0QBTNh65CoE1Csqj0H34DKfQWJhyoQNB3nYtf4tWOFkgBeKyN9MGMRcN?=
 =?us-ascii?Q?3zml7359B4GiB0IwzNUgWTiABDqgcMZ6a3rwpBPHT7AMWrSJjdGmbaW70urN?=
 =?us-ascii?Q?53oVUGl5xpVizw3avqeIQgWC5W/oe2shsQy5s0F7fCy1epCwwJ6bVlMSdCR4?=
 =?us-ascii?Q?aTNigchdRw=3D=3D?=
X-Exchange-RoutingPolicyChecked: nR1naDW8lFryw2B7GqXWhhisGUuWN4g8N2KW04ukrmWQTr5h4E0qakVljsFlYyNctcUNEMKZ7gw5Y4M6eWnGSj+JZJreYzXUntKODwihcHPu5seoE3VRE6hyZAT0R4Y5VwNy7+zVxPDyBTkEtxPLAlD5PKV0A4lVRsAQmIIC7t6EFzgQ6puecncSV4lJvssnL8sIDVRjmT8mgdIXifMa+N2cIZoGuBgTIka1Ce0Tis5saG7bsNh9KFk0UoLsP/z+Ql6a+Dl8Y9XkJV9tQce18PPE1ZEmLnmszneJr7+U+hmFEl77qxz4Fc8m7fPDDjGWN3GrEaMzVWZZYUeGsv1jHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e8df6289-f07a-4d3d-8285-08def18182b6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 17:06:08.0326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFIgKf1u8j5U0iRlVrJYKy7BSryCAwsoEP9CTlyb9rq+jhxJsYtz8XSjGD+Yg0+LsasxsXmzzqSL8tRAaT73oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5140
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

On Fri, Jul 31, 2026 at 04:26:25PM -0700, Niranjana Vishwanathapura wrote:
> The CGP_SYNC wait in xe_guc_exec_queue_group_cgp_sync() only woke on
> sync_pending clearing or GuC stop. During VF migration the CT wakes all
> waiters but sync_pending may still be set (the GuC lost the in-flight
> message), causing the timeout path to fire and ban the group.
> 
> Add vf_recovery() as a third wake condition and exclude it from the
> error path so a migration-woken wait returns success rather than
> triggering a GT reset.
> 
> Assisted-by: Github-Copilot:Claude-opus-4.8
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 314747336fb9..13d0ab8052e5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -815,13 +815,12 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
>  	 * Hence, no locking is required here.
>  	 * Wait for any pending CGP_SYNC_DONE response before updating the
>  	 * CGP page and sending CGP_SYNC message.
> -	 *
> -	 * FIXME: Support VF migration
>  	 */
>  	ret = wait_event_timeout(guc->ct.wq,
>  				 !READ_ONCE(group->sync_pending) ||
> -				 xe_guc_read_stopped(guc), HZ);
> -	if (!ret || xe_guc_read_stopped(guc)) {
> +				 xe_guc_read_stopped(guc) || vf_recovery(guc),
> +				 HZ);
> +	if ((!ret && !vf_recovery(guc)) || xe_guc_read_stopped(guc)) {
>  		/* CGP_SYNC failed. Reset gt, cleanup the group */
>  		xe_gt_warn(guc_to_gt(guc), "Wait for CGP_SYNC_DONE response failed!\n");
>  		set_exec_queue_group_banned(q);
> -- 
> 2.43.0
> 
