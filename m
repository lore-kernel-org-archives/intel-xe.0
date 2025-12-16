Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF51ED5B87E
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 01:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B030A10E310;
	Tue, 16 Dec 2025 01:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kLDqwn73";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E935D10E310
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 01:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765849043; x=1797385043;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wcytiRKpXh4ya0TATu34XzmLvKIxvSuFWZZrrpvmJ+k=;
 b=kLDqwn73prvmWN1DbjD4f33DD+zYq9IN7+bVa5zad0HdPLelIG8J9PYx
 R4XC30Tr3jH96b6fP1a1FffwuS4O6+O/oCECi5mW4CssxF5acmNos4M39
 q93d8JriCgGir+NgHRLrffw0vIPcX1pYJ9MdPVHeXDi7t3GfxyAvFIvcX
 FVuiQHy8LeqQYPyj9DvEBCrPy+JGtTLAuet6rvbd2CDHz7eO1lqeBAEsS
 pxLAHoKKTbyeIwOj01CEdCxR987kvo49F/TzWU14pwgKFNMPjxDTWM+n4
 k8T2fFVZB6GCzxP+FwEULE0ueHVitnFneNBN3I6G2WL0bi8OoM6VUp0Tp w==;
X-CSE-ConnectionGUID: 1gr8qy7+SHiPb0T2aa9kzA==
X-CSE-MsgGUID: QtTgApx4TfG4MheSprVutg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66949101"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="66949101"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 17:37:22 -0800
X-CSE-ConnectionGUID: uSQL9n+gSp2uqAg/HJlG4w==
X-CSE-MsgGUID: bLRZi9mhSw+2f0f9dcWdaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197152396"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 17:37:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 17:37:20 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 17:37:20 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 17:37:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+1PTLTrIGR0Sij8F0ysHn2Z9fOCEHaG9me7bnK0cdNYtBm6GUOzwBwv0LGHfXv+HVDJmoV80sEg8yw+JvBS/Y8yZPHRVk+Hb23LQZTHgwfdYvDmxFbBmu1mwLEr+zCbBDRIFZGeOEPdGd8vT0d72R31VkzvXMLJVvyYKbW/ciFnbKvmoxlfMDep+WOl7HUIrfVuvaPfTFcAQg0UgCUcDJJ+/H4io17GSywzS7aD0QjQaT1VrdIphkzs38jhxHYSvfAaApVi3xuls+MtNwxF1NELKn+e/NL0Ml1Czre9+4poqkeFdW0fjFmxxCDVWBWx7sbsB4E0iJOFJKAU9pv/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmdtW0I8n38PAyUAm1GixwG0HgvNXz5KpwiAnX36UhA=;
 b=WXvLkyw9qC3+kQPS1HgNBcPoafGXwLFdIXX26y/urwW7/eghnJJKjJ+w5Fe8NLr+4LqAOb3RANwuirwtAtzY3A7Dqtn8vpeUrI3Cus0pLm1aEY2j2LsBv8GvJQ0kPIplLnICwmHe8vbZqBfQ/eB+BCTANMr2F5+o6pfbxIzXXEU1uu8jvYU7w8RPwQc5LIb3MDbzz+oEM7klE80G5Lg4Xq3JAzPwJcbAaObkxlRCVA3lPjPN2CHry2Cbsiq0l7CRMNT4K4VPOiukjXcRfIILovkfFbNWPbcTGXy7FJZ4Lp9vhTbGEc9a15t+BVfJn5HeSDh9fo8XcHnFqAVC9y1pWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7338.namprd11.prod.outlook.com (2603:10b6:930:9e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 01:37:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 01:37:18 +0000
Date: Mon, 15 Dec 2025 17:37:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v11 0/4] drm/xe: Improve wedged mode handling
Message-ID: <aUC3zDF9PHfhzGlh@lstrano-desk.jf.intel.com>
References: <20251215174613.3701-1-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251215174613.3701-1-lukasz.laguna@intel.com>
X-ClientProxiedBy: MW4PR04CA0163.namprd04.prod.outlook.com
 (2603:10b6:303:85::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b62c9bd-6700-4c71-dc51-08de3c43a665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XFT/MgG3SRJVHqXcQp59h0ebJ/dDDDKyFOp8pskYDL6hm2HlXyhCIUXRkbdH?=
 =?us-ascii?Q?2MXFeGjUP/or3soYO+edyopr/DRK3SdE7FxIYg/I1oD/QAGyhs9SikkUPQ+z?=
 =?us-ascii?Q?/8hqIrK4Ms/OLajYAS6zASOpsuAgzfC0LUFRtHAMs1RhJ/PYRp7kLwPGKzHM?=
 =?us-ascii?Q?6hG8BES4i6SbKG1yVB/yw8XYfIRKTbCU/ogqSUzcoVcBHjlwXCGTXupeL+NH?=
 =?us-ascii?Q?6uZmADaE/tBl+sbw3jdMC/Y1QwQVRPWsxQ0VQJQlI9Zg2ZvnorrdaxaCJqtO?=
 =?us-ascii?Q?tLrw6C9joLUpuJiWPchoNYz/dP9GTdfj3jAF00pI3f7zbeU0TqVfrDsnGWRX?=
 =?us-ascii?Q?uQdYunn98c0/XNdvmt5fghWD7ToGwxYSIrCj20r7Q2LT+LmgQOGj3P3zo9oJ?=
 =?us-ascii?Q?YPPCCm9whmfNP+aJFGN4VB2N7vxHHk2LpzoZAmX2aWLzEbgsQdPrFOrPY6mA?=
 =?us-ascii?Q?vlDzjGVE3SFsEzIYV+OjKY3ZSFwQbJv4x/f55SGJw1HgumTWqoc8Li+qsvZe?=
 =?us-ascii?Q?FuUS01kBI4cz3VJe/bSxlpWeFXum13VXjquoF7509lqItoCe5ApiWVttLmgs?=
 =?us-ascii?Q?+LoBJt2mDyH7ZdOFpCMwb2zypENs/kOCzuUSUVSrkPEnue1S/Cy8AbI61wZR?=
 =?us-ascii?Q?3GOIdhvDneZNZAtJNvg/WJhOs7LLlcAH0qoGr0yNxSwXO9wCBvy0dFBru2sk?=
 =?us-ascii?Q?/qco8Rvbi3O0h+jx9YH9LDiPvw/QP2RrgixDrocoBlrpkOf9yetZYuLbvcHt?=
 =?us-ascii?Q?+efm8q9/X1SiNdhSVDh+tg8zRSmfKLuL13PxOGS1WQHBhSymg4FWuQD/5LOh?=
 =?us-ascii?Q?OfJxJKLnoPOS7qzg1Qrj40p3L8T74TDzumzgd+LS08+K5zg1U9ApLWaL4fHl?=
 =?us-ascii?Q?xTgQjDzcVsGbUWrqA272P+XZ75vkkuKyX7iE13orOvjBw7VjLnqdlDCpmomR?=
 =?us-ascii?Q?n3UQ7Sk4fmVOjaUuVyRGhsHe6HdeJtSBIc7L7CX4CO+18EYOm7q5O1VmW68P?=
 =?us-ascii?Q?j1s0E4armsP6GwJce7ns2zXkv8JoJDoqdh5d3BehF+bM521rcpI5nwWgwsLd?=
 =?us-ascii?Q?FWOuLWjSzTup9Y6iq78YTHLLicaxnNdDRK6v1rFGZvamlyXDh63+ddop9VCe?=
 =?us-ascii?Q?2EgRW3CXAKc+OOwCwBGxf1J4sHd2CmgCDq4MU3O3nJhfYawDg+k/frXNx7Kg?=
 =?us-ascii?Q?2giBudxXi1qvU0ho8Ow/pOBDSNEsjBct9mEUG1FsJLDQKRxWLZtJyWc6iMpb?=
 =?us-ascii?Q?ER9wUBoXNKQWQmny11YtAewCmW+1HNObKpC3diilPnvSQwQaloWHCyBLSaE+?=
 =?us-ascii?Q?BHA3Dz7gxouZ/FHbn/bcP1ma+MqUAj3EO1ExkVbQIkzXgw9y4aRZnUdebYA7?=
 =?us-ascii?Q?RHnb6DJ2KLI4AaqvrEF+4yW+pzF8XslypJKVT4orilTAfu8a+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pVRpXf9LvQIDj6kMfKFixQk/q9izt4i9KBstDYAANgWPbIowito1dLt3PkcR?=
 =?us-ascii?Q?Eb4YvJrjHglqcONx/tQrEb+pwnFi9oP6Ne0zy4+a0OE8u2hwppNnpTaO8NF6?=
 =?us-ascii?Q?TJNwD5EBWhFLZZqD3+kbiSr0jsgt1Isw+zpctBq8gf4f1ZvrWxTDxNSJIfMO?=
 =?us-ascii?Q?bZFl4BAvG9HYMjRUfTMebN+NAiwqW7PKUUjEuLgK5ppv+eagW9/AsiJHsZ0q?=
 =?us-ascii?Q?mXN01CHtS7H5jVYloHvIn7TUs4TdX7tQuKcqcx6buM8IfXo9nKO272j/AmG0?=
 =?us-ascii?Q?VlIW/X7T/TCUZX4pklR8YCdhkkaCleiDrvY43e/V22cLP1EVOII6JDr1rjMx?=
 =?us-ascii?Q?078tfK0SFp7SqLdiPIXWy0N2jDo2seEJoO8NUJWEWOyPlk4B6JAeXYXAx6rs?=
 =?us-ascii?Q?7nOBA6juywdkBIB4YJQ9/0/ccBm9p0XUgBPw9rl8cvuKMkOQJnjF1Ok7Rc46?=
 =?us-ascii?Q?pwR+pyAbhlhSsaiJGhYG6OFiQke8zpAlYi+VQmcuN2yvoM0YIklkH8DfYiHq?=
 =?us-ascii?Q?O/c3mQ02qj3R7pq/ia/Zc2TblsGs8ZRITs1dqz5Wc8u4mL0AN/TjHABlaJBo?=
 =?us-ascii?Q?fyAOUm1o1RdKMh1Kmi3ByUydiNqXf2oBl+GJLNHf/phh4q3N1mfAlhFDj7U3?=
 =?us-ascii?Q?YT2uur2WFRw2egKS/ZBqzXQiYWgwv8phiB81spnyZOvLhvSREl9e3H8r6pEH?=
 =?us-ascii?Q?LTmpcJ1o7+GTfQ5gkdV+dtKJofV5kVGvgKyqWMgd/JzxQx3PWjcoDEsdtmA7?=
 =?us-ascii?Q?UW9OVLpKiCIqPnTeO0RsjMsv7I3b91nbfGCasDTTAAwHG5YS2tf61fzDSnOp?=
 =?us-ascii?Q?AdcHm0KlYxc5EPsOsKB5gZBG8Qwg1nZEeKREP+R0PjRwrzYgBzXoy3AThmAn?=
 =?us-ascii?Q?pfPfOfVB5f3oq7xCOtbHvqkMtoUPMuroY0qfbcGUA0OKfPCS5PtE8De8wiEV?=
 =?us-ascii?Q?qpnzWcDEEtaGJUlDEbt1E7dUWBAlFyCSg1owL82isSTJTqoPfu5TrZc6YzIz?=
 =?us-ascii?Q?VCTOU33Kq0dQDnIwoavjJ4GYNqWS0S33GqBd00vyIpHKV7fL7S0wUFPSR3Pk?=
 =?us-ascii?Q?dx5KKQhpFamQs4XtNdHoiF89uIFvf/WoVjFETq97klfVicKNnsNt/FofX2Mx?=
 =?us-ascii?Q?Jnky9URVjbOe/7V/1XNfaRYNKB943f34LWu+5eAIC5qDTx7/M8EnpX4I/2Oj?=
 =?us-ascii?Q?mdAXG/wkVchC/TcVOQIBfhVMy1JkuM7jrQutY1RZ7Ubx9i/Xz3kFaZE116hV?=
 =?us-ascii?Q?56xZF1Dt0wNZtZT1yFXRETAUs4o5FNEgWe3zaN2BJ9qfPAnAK12xW9DDuE75?=
 =?us-ascii?Q?QA0BewadspRfFP/0cDw9mPVccuascdlMXrhRPfURVOlHZEgJ/mOQ5zSDOHbn?=
 =?us-ascii?Q?dTgQos0HaLvqymW4FRpYTsazBR61psMtH3eYUaj0PUkwvUoOFRBEYIW5otsU?=
 =?us-ascii?Q?Qp/94O4D5uwjVvdmkGL/6JXcc6Bm8IYx1JZjPacgpWTcfThZ6ymnUSVBMibd?=
 =?us-ascii?Q?Z+u4NGvv+Ri+XwU2Y25/JYtpwSzImGXTV00eC3gIgWAvVSCjxLzoNZwefjzr?=
 =?us-ascii?Q?Q8mcD5wAljMeKhGy5rgw7hUan74GLxd+dmo84kSgqr4nMODgkY4pfkOmpZEF?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b62c9bd-6700-4c71-dc51-08de3c43a665
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 01:37:18.6492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2REo90DoMSiPAJzCp2SA7NnMEzLnuvTIKzKYVz/9QSjHxbm4vPZ94RzMo5wnBvRIicUhm/I09y+bw0k4uWyRkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7338
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

On Mon, Dec 15, 2025 at 06:46:09PM +0100, Lukasz Laguna wrote:
> Prevent the VF from attempting to update the GuC reset policy when
> changing the wedged mode, as this operation is not supported on VFs.
> 
> Additionally, validate the wedged_mode module parameter input, update
> the driver's internal wedged.mode state only after successful reset
> policy change, and allow setting wedged_mode=2 only in debug builds
> if running as PF.
> 
> v1: https://patchwork.freedesktop.org/series/148214/#rev1
> v2: Replace magic numbers with definitions (Matt, Michal)
>     Use helper to sanitize wedged_mode (Michal)
>     Change debug messages (Michal)
>     Reorder patches (Michal)
>     Add fixes tag (Matt)
> v3: Rename xe_device_wedged_mode_validate to
>     xe_device_validate_wedged_mode (Michal)
>     Make enum nameless (Michal)
>     Add default field in enum (Michal)
>     Change names of enum fields to match modparam description (Michal)
> v4: Fix GuC reset policy update
>     Replace missing magic numbers with definitions
>     Update debug message
> v5: Remove old rb-s from the patch that changed
> v6: Use string names instead of enum values in log messages (Michal)
>     Handle inconsistent reset policy state between GTs (Michal)
>     Use bool param in function toggling reset policy (Michal)
>     Update commits titles and descriptions (Michal)
> v7: Rebase series (Lukasz)
>     Rename helpers (Michal, Lukasz)
>     Split complex condition into smaller, separate ones (Michal)
>     Don't introduce XE_WEDGED_MODE_MISCONFIGURED enum field (Michal)
>     Add needs_policy_update helper (Michal)
> v8: Apply missing rb (Lukasz)
> v9: Simplify conditions (Rodrigo)
> v10: Define enum outside of the xe_device struct
>      Fix description of module parameter (Michal)
> v11: Update the Xe Device Wedging doc (Rodrigo)
>      Provide a more detailed commit description (Rodrigo)
> 

This series looks good but can I ask we hold on until this series [1]
merges in an effort to get clean backports to stable? [1] has a couple
of CI issues which I am looking into now.

Matt

[1] https://patchwork.freedesktop.org/series/158884/

> Lukasz Laguna (4):
>   drm/xe: Validate wedged_mode parameter and define enum for modes
>   drm/xe: Update wedged.mode only after successful reset policy change
>   drm/xe/vf: Disallow setting wedged mode to upon-any-hang
>   drm/xe/pf: Allow upon-any-hang wedged mode only in debug config
> 
>  drivers/gpu/drm/xe/xe_debugfs.c      | 75 ++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_device.c       | 60 +++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_device.h       |  2 +
>  drivers/gpu/drm/xe/xe_device_types.h | 23 ++++++++-
>  drivers/gpu/drm/xe/xe_guc_ads.c      | 16 +++---
>  drivers/gpu/drm/xe/xe_guc_ads.h      |  5 +-
>  drivers/gpu/drm/xe/xe_guc_capture.c  |  9 +++-
>  drivers/gpu/drm/xe/xe_guc_submit.c   |  7 +--
>  drivers/gpu/drm/xe/xe_module.c       | 10 ++--
>  drivers/gpu/drm/xe/xe_module.h       |  2 +-
>  10 files changed, 170 insertions(+), 39 deletions(-)
> 
> -- 
> 2.40.0
> 
