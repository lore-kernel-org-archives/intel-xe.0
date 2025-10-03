Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3397CCCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 18:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E779D10E961;
	Fri,  3 Oct 2025 18:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I1JSUDtV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F93510E961
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 18:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759517435; x=1791053435;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iZOuEBqZM9tfhG3jpvovZiQaFA+Z7gxegoI/331lUzQ=;
 b=I1JSUDtVznDftlUtAxSX6P7poqU2TGiI1LATJ5j3TsMmCAdHWP5LO05b
 zTa1EVUdzr3KmxJepoCpC9tsBGznbqxZdjr0j1HiA4QC+4KHOV8Bo1XGz
 rajC9nITQ5TIIxp+1Mxn52jJThA7jxEC5wdl8Eo9SGDTD6h+kJTFdytQI
 aiUQT8eRqzkTfWki8Xx8ImsSsUbVMC82IBO2IX7Werr1mFQFlNMg3FS+B
 IDAZixYrARZbS9INC/CWDurA781HZBdTnX3SUcnqQbMsigAretqj5vZTs
 /rxw3nyXZnrh/aPoJi06n8rzQx80Oz1Uwgw0cjOudU7jasG6wWaKWFhiL Q==;
X-CSE-ConnectionGUID: ivofbxZKQf23RioMasfBMw==
X-CSE-MsgGUID: dM+ESUfWSHiQLIfEfV0KKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="87260656"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="87260656"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 11:50:35 -0700
X-CSE-ConnectionGUID: ips1aXUzSZuMZbDMW0Lobg==
X-CSE-MsgGUID: swV5zxB5TEiOWCCKWyBtNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="184543153"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 11:50:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 11:50:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 11:50:34 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.38)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 11:50:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRoutQIfcgYTbUBM8fL0DZzE7K1b82rwrX6j5wJXgWmyYnL3oVlJlLcTzzkDE2XFcAQBMYMIV+UO+RePyt1KxbuqX1N915rvwKendIAEswEZI6RsNNECqny7J+TKArB8+MZX3e5SNRPY298m2dPaggcPfWnXn00qjb7FJcr0Ru+P14X1rbg4qnXgWW+VaacwMh8bMnxf+IhmUIqB7RtT+IrrLLi6OFfrMkVS3pLLJje0eP1f/gyJYxYOqTOz+T7jubG1cDibaOjjo9zF0ULELNqMRyFUuQVYMYLjWN7/mO3aDBiDpMVj5NqCAmKOO7J6ntKEP5AuYsBbh7vz9e8Djg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bacxHV+LOaSz2TdSHN71vJybh1bT+QFc6Ef4ZQsdI4=;
 b=KvtC0JP7jMT6Sre7uV6Fji/wJJaNHo9e3puYiYr0OQ/Uuv5tEymOlh0PB9x+RYQujHHc6idBrodqVl2mdAry9gLguMPU4b2dEBogB/iDre2y6hx/LhSWflz0bNeJCTX2XdE1zb+tSt4hmkFDLs6iYQIUu7M2XeGZ24c+/GRKUj7jCBqNBAH6U/TmbCD924CUZkEzfBGXlvIybsUMXCSEdbmECCnyXs6YRjpc5ov4zqCfaGHgFhNto3jT2uGAx6FhmTqmem52D1g8fIFf+q8k2DkzzKmjjJIcmDWOv9ZGFkc5Q4woxDbtccXIwLL/t8AhsGgbFmU5bGqJhvyv+3uahQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB9456.namprd11.prod.outlook.com (2603:10b6:8:290::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.19; Fri, 3 Oct
 2025 18:50:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 18:50:28 +0000
Date: Fri, 3 Oct 2025 11:50:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] drm/xe: Don't send a CLEANUP message on sched pause
Message-ID: <aOAa8WLaXuvO94eu@lstrano-desk.jf.intel.com>
References: <20251002230444.313505-1-stuart.summers@intel.com>
 <20251002230444.313505-7-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251002230444.313505-7-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR04CA0381.namprd04.prod.outlook.com
 (2603:10b6:303:81::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd98fed-587f-45b6-5f99-08de02adb863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H5kAajz4caDUITFbz3FbcW2zAat5E5yPIemj6e74+AjbWZbKxOaJLLmpoRtl?=
 =?us-ascii?Q?JhDfx27Z2fqwrH8xZMXpwNcO1GrYvK18605deNI5h1+tvo6tPdyw4XD7MM81?=
 =?us-ascii?Q?gSGwiERlutUeXyB9rrehGrLhSBZvvdTOxiLXFYjt0TCKXWe/2ea2IUNbxyT0?=
 =?us-ascii?Q?v5aiW8FSLHGYL4/6zvBCP3IU6TxdYZBexZrmGL4ftQDFvrDSW7wXJPstGTAU?=
 =?us-ascii?Q?dsR0ld+4RgQUA+7YWJ8kEPjUtTX0poP2Jtcc9u0IcIpMtoFAjPBi8OkY0tOH?=
 =?us-ascii?Q?NZR4sIYWPnU8g144VsnON+p78oOKsinbDZy7MD2Af3aEPuARDc1tqZy7eG8F?=
 =?us-ascii?Q?Q2b7cyVxBmSFDiQmh9NgKjqfx1LMhNfekhgKfssRDYWsn6TuEwmvZqTyI4Ab?=
 =?us-ascii?Q?DZjfz9OC0cLB8W4s7VBDQt3o0nbmCndJQZLw3jQ7Pdn615sAB2dbD75j5Mu6?=
 =?us-ascii?Q?JCDVPdR6EN/ilZfpptu1CDN05BSieSK+H0CyXuOAQfBX/IDF0VykEAJWIBKn?=
 =?us-ascii?Q?6Euj124LTXLycDXbdV4thmS+u14OYL98DYXyfJL2BB23nPvOS0qO4DhayA5x?=
 =?us-ascii?Q?hZNR7eiBRI2ncVByQPOZh9lGCXbQFMw932HxoxMt7lQ96CkuJW1VqhcKFRuN?=
 =?us-ascii?Q?arSZFeRkgLfXn/lY8vF/hQEsbK7ipcUexobT3RoNhaRrtpP3w+bkDnU/fUuo?=
 =?us-ascii?Q?OZE7Zkek88thVhtZeBQE3b2sgt4cwSjRqghz4aQdyn7eZwa7cbDAr0uaL5ZX?=
 =?us-ascii?Q?xU+7/tlOPpT2X4hDgaAv0TU/+acl3omBAFMQssFTEqaSiKj25r47EaMzCvCK?=
 =?us-ascii?Q?UmFtHa6eyIZgEkYeRWN211nVhDdSO0EPB+qLSMfeB/kI2KEW2ef3qky17hUL?=
 =?us-ascii?Q?DIn0al7PYrJDFGEDGLxPV8noGwz6loZt9q1kyYgL4C+WgX34c3VvXvRqkvjP?=
 =?us-ascii?Q?6CPGN9AdE9YkN6bwutcW9qOcHQxiHBiPfZ+h2ckqDCQxX/0OWLjIB/hjJIeC?=
 =?us-ascii?Q?Lx2N80Gwfms9VPgc78EEuJ3KeofQof6YnFzaXD1WS5sOG3VhV7CiUda0R8zX?=
 =?us-ascii?Q?quvfiYHUYUeVdcpKyCgTJiIQazFX26SoY302iz99NZNSBnLveGQdYMJSlyHD?=
 =?us-ascii?Q?TEEzCeFvJlNNv8Eg30IBiYuwqMcHOKwIvU29lnapDtKx5vrg9dIoArCefMr3?=
 =?us-ascii?Q?+t/VnOCxwAXaI/m0zeaXGk596AUVEukpC5/3NJzWihTvkDg/IvjjdL2sBhDr?=
 =?us-ascii?Q?RE5A/7Cx91HZTTXDkOMXWU/eT9foWqYcvKJVn5vr2OzOLDWmwsSZzmF+xc/Q?=
 =?us-ascii?Q?TYbaSEIuky4dHhaDJ1hCASdpMVUddejKEIS1bM9Bxjd/BfaIIaeNJZ1ypMpO?=
 =?us-ascii?Q?HmbKgMRD8jkljzDZqGwdWULr8CAC8OLicldJeQ3VtbVfjiRPQBqBxAvKTOBu?=
 =?us-ascii?Q?n49rPkZB2G86bu8gCpi1eMFNJ5Pvjdb4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xUZoaoj7JVdhtZrvEaAIzb7yYaSc29xb2Mqe38ifWxMpv1j8qK9zxvBxkITl?=
 =?us-ascii?Q?5tGOXXzd1+/ehkSWqWnkbh7UPGp73rFQEmHIGqVt0h6iwpcv3gjRWyYa4EBw?=
 =?us-ascii?Q?U2QrHvQ9UU3US3QqqbpKJWBRMHZifve3n4qUjlSpHLdtme7V/e+poCxDT84t?=
 =?us-ascii?Q?32AfR4ib9bSyO15hH3ruduAoD4R/mgGrU6jgFkcczH+s1W1CyZe7s8J2mgy8?=
 =?us-ascii?Q?2ovE/9fO1pRRGauz0ZlcS18s/O4Raq+shf/rmICL0Nb5bRej0cEyfAKQQxxx?=
 =?us-ascii?Q?uqqicyodZWF6hq+9OZw1yrLOF+T7VP4Cse1KNcKQTJtTXmcl0Lb9fsSpOjAO?=
 =?us-ascii?Q?LpTFfvUzfgG2AYex+/VZiJ7jH7xa3XQnl/LPfJMaN/SGD2vzLyck/ZNUfNTY?=
 =?us-ascii?Q?Bou04UESo5MzfbLPn/40DSUxPgKIj+PWrbuF1p52E42wkGEmjRNx5tEUodK4?=
 =?us-ascii?Q?aZjbHypTrHz6DGPPAFGSYrsGuwbRRoHGjjNiU7shfsZG1ORn72CYsKKsAj9K?=
 =?us-ascii?Q?bNKWhFdwnoqq6GD1xlmuTXi+Yy0wy11P7GyLAYUlE7tXINi1Wm7ygpWmsLBj?=
 =?us-ascii?Q?avra+aD5k5klSLB/sgaRV8llnjVL6SVBe8cItb5iBwfDtkpDjMUDAKOWVPxT?=
 =?us-ascii?Q?Ihmwx/qIJuGuWLg4JvAGvsIMKvWrLg6IyeV7IfOBXcUbO7FkCqrv0uPLtC5K?=
 =?us-ascii?Q?5ds+9/rPzTu7TDN9HSo4+6JDMAw0Z2Sfrc1IFOXWOvkyhaZyTUwy+E3r9+A3?=
 =?us-ascii?Q?dgJD7cINz+jD5oLtYI20pMYkSf6ATsB6GliJDprC+yElSuYNygCNhrzdEPUZ?=
 =?us-ascii?Q?9A2vQoIqZas3X0f4ZTx+ZLQa4gdBhjxg9Ksr+kk5KI6AdXRtveJMPkSwdqjc?=
 =?us-ascii?Q?RdkGElROrgphykj+yMEmw/VanipYQrBgSHWroml2hkNqe6CR/XZOcCgDYRgk?=
 =?us-ascii?Q?zSwk/O6i9d2N1ml0RC8vYPtx6OShkYV7q4Fs0xLM7Q6SySLBnQkhz0Il1m8j?=
 =?us-ascii?Q?WH4j/7cFxKcYqeS7Pi67tSPa90kwjclZT1zwRcXCwGEKuapQDO7kPrLny55W?=
 =?us-ascii?Q?2Sm88kgLa1poxSkVyGfGUEv0AhiW+iqM9fyoebgAEkoTuSIWuUf0K7Vvnm3c?=
 =?us-ascii?Q?fFJdkUQcpiYjaZZCed/P/I2veiuT+ThuKSF7ruwscpykhH/N68jmjLEKS4h2?=
 =?us-ascii?Q?zJxchxRem8X4IaEF2mDhqTtqQTVLHySvsNRPD5SHG7NVLoREE6bsxWaFFArs?=
 =?us-ascii?Q?CKjubuOOkFOtJRkb2mLyJY7NIaHEpNq3BrlxpKdNJgv+wpZqMjCBK++E7fnD?=
 =?us-ascii?Q?xxYvajYIm72blZVTMnMKqdI/oOlcbqz9eFLfFJM7T4JgmjoviBiJANqfOtro?=
 =?us-ascii?Q?v4SpD82o1xFA/xKzdfpYTbYW0q3fUYL4P8FJ6xJGW6Ru8QZo7Sma+YZC+oFs?=
 =?us-ascii?Q?kzKKUuGRReVVFzQfyp5OcnDUOkWRNofwAWP4B6xXyY6xlj78RF9dbraYBKU/?=
 =?us-ascii?Q?M7wfotIi6hnkqi0u0riSq/kaKzi5ScMywXaXxglpe9qQgjbrI4i55t3z38MN?=
 =?us-ascii?Q?Uj9w/66NCLiDlBEseyQl9XYEL+iPosseNOQdwgBlzBmbmhTbG8iWaAH7kDfa?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd98fed-587f-45b6-5f99-08de02adb863
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 18:50:28.1095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGdTP655ijzUJ0xG+04geSWm4lLSZ1ilIbNnMNjkP/EnBIwuyI6wRTsckgyNsEGCTJmwEB77aMJeNPxFo7/34g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9456
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

On Thu, Oct 02, 2025 at 11:04:43PM +0000, Stuart Summers wrote:
> When the DRM scheduler has been "paused" (see xe_gpu_scheduler.c),
> if we then send a message to cleanup an exec queue at that time,
> we will never get a response for it if for some reason the
> unpause never happens. This can occur if for some reason during

That is not how this designed. Messages to the queue do get processed
when schedule is paused but should get processed when the queue is
resumed.

> exec queue creation, the device becomes wedged. The wedge event
> will cause that scheduler to become paused and the creation

IIRC wedging the driver shouldn't leave any queues paused. It should
just signal all of the queues job's fences without touching any hardware
state. 

So something else is going on here if memory is leaking after wedging -
i.e., this fix doesn't look right.

Matt

> then leaves a dangling LRC that will never get cleaned up since
> the recovery is a driver rebind. So essentially this change
> fixes a potential memory leak in the event the device is
> wedged during a test unexpectedly (e.g. during an unexpected
> hardware failure).
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 55a50c46ea2b..45b72bebfc63 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1732,7 +1732,8 @@ static void guc_exec_queue_destroy(struct xe_exec_queue *q)
>  {
>  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
>  
> -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
> +	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q) &&
> +	    !READ_ONCE(q->guc->sched.base.pause_submit))
>  		guc_exec_queue_add_msg(q, msg, CLEANUP);
>  	else
>  		__guc_exec_queue_destroy(exec_queue_to_guc(q), q);
> -- 
> 2.34.1
> 
