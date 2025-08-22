Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95800CA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 16:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFF710E0A0;
	Fri, 22 Aug 2025 16:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmUQv2a8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BD510E0A0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 16:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755881928; x=1787417928;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YA4bi/79VpFAV01xZ0DEnpCF+gIOzknDV6uUcSNfgow=;
 b=BmUQv2a8KMh79qCNm1K9Zw4PMELT4UaczMByoqjrV1MLhkoTohTrVLYy
 9ztVjvS0mLRfDt63xgiKf35aRdG334B2fuus/ISDKSDjyb4GblC8efknn
 S7OVhPIsg7a9oeXX4nyQIv7Y7RGvlRgdYOkz3px4hbxfrMb/m/HK20ul+
 eSejQk96yicDu9KX4qwVx+ec1wzvu+uTJlDifU7lvnW7BaFpboaWj1mud
 lr4bBzc7iA+DHCk482iadp6AjalBhCOwq0BgQHJ6rfW0G+oUy15188SIZ
 q2wzG22QmHpVPTNCfBJCXF3oe1EwXZbpWtuU0kehB4HeZkfPtvCOA3JcK w==;
X-CSE-ConnectionGUID: aqDb0qFRRbu5yqYEAh3RDg==
X-CSE-MsgGUID: vjzvC3t1QuWWMo+G5yCJWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68466603"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="68466603"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 09:58:48 -0700
X-CSE-ConnectionGUID: bLmgDOVyT8mEPLEp+bDiHg==
X-CSE-MsgGUID: +8dFZRjWQaiwTJEmXK45BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="199719485"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 09:58:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 09:58:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 09:58:46 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.68)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 09:58:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNJSBhFK1dzKLgdT3iakHzw0huL0EADWIDZZb0X7zvNm2/gAc8Np+7ipA4YQ8hXnGPT5k4F9oOSlk02A/efkUdfkc4VIrYiUxOIXz0P2bvWMy7EFzpPRI4smYqKqMdeSJy0ECOK5igMMKiYjE8NyVtwVa9S1pwarbepwzaImmVR3iEu4JjFiAngHRsyBPG/i1nDDJhq6akyVAi97AuWLZS/50U5URKt+vKan3TWTjDin5j6hKdOUiKzS2m0VwCfSwxPU5AD0OQ6i3BrZYY+56JhKsy8rBiq1X2fBjDMNlbjoYse80/9LwUYMLYdydliMEjuMX87DGz06OaZUf5V0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3dIGnGqeJ13NLaqBo1UurXz3rWkEHaNxGihuoewEXg=;
 b=bKgPDfla/ZSjwDc4lCucJm3MOpDbLicZPvqXWaWIuYLaXgfHFnxca50I0U4QxRbwswPBEuHBY5P1osKrsSisgTmQONYz24k+wisN6PGmP76UlZSQfrA2DrNzo6LKi5XFMrpPU7XNgftRgJAIt3/B30IA6vofdvQe3PyK9uthMoA59Lrstyl9+452YZIHLkzgR8DicUjlY+Tj1x9owiylsgcu41umdoXkcw+NYMLoOq20dVN9G7bsweRmqLjdUJDdboZn2f/yIWyp0Lbnjek4KAN/sGHZOAEOTLuVcGv0750dpCA8Rgyo9UubyRsmuHgW/tNdO9E/ZeokMvBGKzFDEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPFEC87B8781.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::85c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 16:58:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 16:58:44 +0000
Date: Fri, 22 Aug 2025 09:58:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>,
 <carlos.santa@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 6/8] [ANDROID]: Implement xe_work_period_worker
Message-ID: <aKihwcdC6r9emmx2@lstrano-desk.jf.intel.com>
References: <20250822085932.2221054-1-aakash.deep.sarkar@intel.com>
 <20250822085932.2221054-7-aakash.deep.sarkar@intel.com>
 <2cd84781-89b2-4bfa-bcc3-70d37b6dfa94@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2cd84781-89b2-4bfa-bcc3-70d37b6dfa94@intel.com>
X-ClientProxiedBy: SJ0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPFEC87B8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a7ca4f5-67f3-4b84-178a-08dde19d2721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aWxdDAr0+AAhj9+tRStvPbwTrKKNOyZrZ0CWYYBA7QrSNAqI8zW+cS6PBBbY?=
 =?us-ascii?Q?jzaUngyTLyphAcks1WoR6mJ/BI0ZM63YR+2041rUOYq429NP0rdesHk5BhFM?=
 =?us-ascii?Q?e7k+m7YBaXAhTUWL7VOjsWS9Pxmn6/cwPPZkl6seRNsBogMYHUJXav1TxVza?=
 =?us-ascii?Q?xCm9GALKw1hELUkAzyhUy5njBSkk8SJeWq6aICz9rpsk5RBclKSXvBO8pWiN?=
 =?us-ascii?Q?ONUNTnIBCWrJOtQ7eA2DscAxbHhm8fhOxoGpJb2GyGV7UVrkYdv8lBAeGA0L?=
 =?us-ascii?Q?wLeoUVUzTYWte37mJszj7sXLKnQba1mIu9Nm6yeE1IMxtBVskvNnu60hQBoa?=
 =?us-ascii?Q?7ieqx9bbdeAFdLkJcD9/jZiFM2QYA7XYNhbtt7ff1OdrHMfhV0fzJNaagMD3?=
 =?us-ascii?Q?TmuBV4oNlasz6mK4rPDAeGCj4r74+1l45xvuunBNLukd9O6OUWHERxCJhZyg?=
 =?us-ascii?Q?XD8l+DDHtWhPPxmmpZz2ZQ45/2Ye1meX2OfyQKhxslcct1uAT+OOMJSePFYF?=
 =?us-ascii?Q?t4cM7x6Q1WHfXPci1PHLhSmfX2RjE9yMzxZUAzumrlagB1L0tbo3eByrWFRh?=
 =?us-ascii?Q?Suurp2X7URvweyQ1DMvf6HghfgCPbgQ+M5SZSo+btGIo/wMfli/zFiaocoXy?=
 =?us-ascii?Q?i9ZhH0GGhSIG9b/b9SrHmuvq8Ga6LxKXOpEcCQcLZeBcp2WndxbNyo1n8Wr0?=
 =?us-ascii?Q?lu9w3jeiAgqqDfwJm40oCXbFF0fx6C5RZHW28k6XxURaSvmlXk1E9Yzzb4N9?=
 =?us-ascii?Q?Wtpj2nSrABoCUMfh26XDUFyz6oQHenZSn9P3fmm8ecVUdPbnrMNkmV256to+?=
 =?us-ascii?Q?SZ1HHTC8XvW46u0kfoA/vy70nwfGKWzpQl1gfOuIbe8+uXhEXWiR+9i9c1z7?=
 =?us-ascii?Q?g22tS/n97EaRndXbytey4wMWXPL539VAW/9gndBCnnDJtYsJIezicA06/qmj?=
 =?us-ascii?Q?dXYiNIaAwvxZGgOiKC58O6gsJR1Yu1FprwAOivE+EeU2xVSI5+C/mUelc1ay?=
 =?us-ascii?Q?dOURQPNj4xPgKn7PfEWOhU5D7sE2oIFzVRv4A3nJwT1JrCh1aKCcYW32z2lJ?=
 =?us-ascii?Q?alSr956IOgPgxFG7y/uHgR5y+LI6AtrmO98kY6XIrdfuwJG6mpd64AMHkFhg?=
 =?us-ascii?Q?jkXxYW7sXfJTPoaPUFxUud9bQ+o8Ocrmea9dsQE8MMbVhjPjMVbEFBBGqY2p?=
 =?us-ascii?Q?z7blQlsdz4ybZTb5I/SBl0yVkAWV7Rp3TPmPUoOmuYIRqnCwxY1xtXKC5URf?=
 =?us-ascii?Q?QLTu1YumU27JegohCv5JFiod/xZk9ZthLMe4T5upfkbupIHUcbMkbK9OSJWz?=
 =?us-ascii?Q?JUwmtkLn51JjSkU1Hs0Do9tTr3s+yuaN3mLxXn/i7X+8ws0aUg746lKSj6CZ?=
 =?us-ascii?Q?gQ650I++vNxqWlSifx75RM7WUfSucpwzSd+22b5UjBmwngd6xE95JAGxN1h0?=
 =?us-ascii?Q?FDnh4MspZoI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PwmpnUONfx+lXPf7JvqQdEisMm7etgMpJLs9e7REuXtZNP8UTBdChFqxqAU4?=
 =?us-ascii?Q?IlMG0GdCcGOpk+QKEXytwL0xKKxKYETbTCK89S39Ex5T58nrEGOWECHduKDb?=
 =?us-ascii?Q?DlBJyZ/c45NcULgOYj6YdRaNNyXyjrL7edEuzCtKEWn/HyV2TY1W+s5Knc7q?=
 =?us-ascii?Q?1UVdAMkbqrnZRlgegV4FTlp/RbxpCAF2jFVhMAxEX0JebEbsVeV+2v/se3Lq?=
 =?us-ascii?Q?sz7m9w1XCca3xZR34kzQwlVzNx3bAGkgBqvwCQV7P20eO8r7EexKLUndtKna?=
 =?us-ascii?Q?xEHr1324Lty9bE0R2Kc145+pXv6tglPlhe2Ifiv4jkHxgWAghHADpZyBbCY0?=
 =?us-ascii?Q?UsKoI2BcwEDnIY8tAOWcRZNyfoSZ4oIGVrYdU3CzrwpujAZ7/Z62G1EMGP15?=
 =?us-ascii?Q?2FJxO/czJY9k+F1fCcLVDWARxU5Ux824jyxc4F6UGbyJo9zGdRHl8izQyjkt?=
 =?us-ascii?Q?p1BTUrO6HsGyhTztBj1C44W1DeZivX0EAW5MU7+xF1+Y9RcSRtKIWRrfk0Du?=
 =?us-ascii?Q?hjkAStii0Me9/y7+IFWrj4QO7ZqeJ6UO6DMZtmyqA6pbXhZI2jwAwRtTtXcL?=
 =?us-ascii?Q?qW9da/caEfj8sekmKyUdbYx3KZqGS3WBuB6oOBrWXeSNSriKBKj6q/wqtSUM?=
 =?us-ascii?Q?S755VXuTlcwj3UW5wjEjEcxIABi7lpvT+G76NcHJG40Rb2T57LVUCOOF20E5?=
 =?us-ascii?Q?jUg5tbpy8DHFIcQXID8dIHly+9pmJZo+1EtmSzb+75Djy/M7l40xwbMX80sE?=
 =?us-ascii?Q?Cy8RalZw0W3c6iybaUepQq28XTpNBJVo9hRpgnufMsJnMFvHNPmFkSVV0ra2?=
 =?us-ascii?Q?zKb6z3kOEeoZTvO7UXV28YseDUWls69ado7uPcPwiWAFZ5iafUDW+/JVfdbL?=
 =?us-ascii?Q?j12EWZYMYK+HQOT5bGUoOkGIsNp77hkkhErnGhEkJvmaXWyF+Fuw9wTpra7M?=
 =?us-ascii?Q?YpdQg94KKoeqM33SrGf+Ospk1zxWQjwO709Y4udy3BW3EqU2M4YM3vXm8NGL?=
 =?us-ascii?Q?BGkVSOA7Tl9xqwM6rlGda3cbsUPg6JkJT5MAKCJnkSSumY+z0aoayBvopqr2?=
 =?us-ascii?Q?bEqKTDeBLDHxLtSqGvNZta1RIpAhIZvyGL2WJWCJhPQidSvAIO6jqySxj9TH?=
 =?us-ascii?Q?4guxKC04j+DEsAAnFH8yTfFcYM/q3HNAyAqrASRO9ewehfYaVtW6DGopZxDv?=
 =?us-ascii?Q?znnKUfNlmUEOzFlKHcVI0YyBwYgntsOGrMvK1yTacgYqMksreujV/43uMkT9?=
 =?us-ascii?Q?IruO8Znft4ER+yLBOKOG4LyohVqsmlTCYcMKRon3M5rEeNyLHLAgaAAqthxA?=
 =?us-ascii?Q?PwjkCSFeiM3igh2Z9rs1AqrsLdtOORW7Bk+vOXIEIJWwvN729Elf2N5OEi0D?=
 =?us-ascii?Q?qreo+cWrsSsefK9nxxTTffy66Yr0+1FHM/jHw0K/nYU/jxR6PGKPZmdy8Ofg?=
 =?us-ascii?Q?tZlFfaztBIklbVx6nxIHntq93uRiYxq26Zeq/ljC3EvhEju12c3O9SJgz1J8?=
 =?us-ascii?Q?rs99B5BJJcywUQpv5GP8G6tQnhvtLDmu5iWIG1PuH5uPTwPDo7XxNWJRIMqn?=
 =?us-ascii?Q?ogORLRGpu9NI1zWKkuoBooQKp0d1B3VV+g1uo7CsBCJQ5P5ueLOELb5Oexhc?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7ca4f5-67f3-4b84-178a-08dde19d2721
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 16:58:44.0629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/MuPnofXuwBKB/96oKdwTiFg4EtXjpLCxTkkmcm8mhgqB+5c0l+Gy9zzKM7UNG/5lG93ohPu2YLNhJG4Ce2fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEC87B8781
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

On Fri, Aug 22, 2025 at 12:00:44PM +0100, Matthew Auld wrote:
> On 22/08/2025 09:59, Aakash Deep Sarkar wrote:
> > The work of collecting the GPU run time for a given
> > xe_user and emitting its event, is done by the
> > xe_work_period_worker kworker. At the time of creation
> > of a new xe_user, we simultaneously start a delayed
> > kworker thread. The delay of execution is set to be
> > 500 ms. After the completion of the work, the kworker
> > schedules itself for the next execution. This is done
> > as long as the reference to the xe_user pointer is
> > valid.
> > 
> > During each execution cycle the xe_work_period_worker
> > iterates over all the xe files in the xe_user::filelist
> > and accumulate their corresponding GPU runtime into the
> > xe_user::active_duration_ns; while also updating each of
> > the xe_file::active_duration_ns. The total runtime for
> > this uid in the current sampling period is the delta
> > between the previous xe_user::active_duration_ns and
> > the current xe_user::active_duration_ns.
> > 
> > We also record the current timestamp at the end of each
> > invocation to xe_work_period_worker function in the
> > xe_user::last_timestamp_ns. The sampling period for this
> > uid is the delta between the previous timestamp and the
> > current timestamp.
> > 
> > Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device.c | 28 +++++++----
> >   drivers/gpu/drm/xe/xe_user.c   | 85 ++++++++++++++++++++++++++++++++--
> >   drivers/gpu/drm/xe/xe_user.h   | 18 +++++--
> >   3 files changed, 115 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index bd4a1c5c57ca..b4692d45c7e9 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -151,12 +151,23 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> >   		user->id = idx;
> >   		drm_dev_get(&xe->drm);
> > +
> > +		xe_user_get(user);
> > +		if (!schedule_delayed_work(&user->delay_work,
> > +					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))
> > +			xe_user_put(user);
> >   	}
> > -	mutex_lock(&user->filelist_lock);
> > +
> > +	mutex_lock(&user->lock);
> >   	list_add(&xef->user_link, &user->filelist);
> > -	mutex_unlock(&user->filelist_lock);
> > -	xef->user = user;
> > +	mutex_unlock(&user->lock);
> > +	/*
> > +	 * We have already taken a reference to the xe_user in
> > +	 * xe_user_lookup in case this xe file doesn't own the
> > +	 * pointer to the xe_user.
> > +	 */
> > +	xef->user = user;
> >   	return 0;
> >   }
> > @@ -172,11 +183,12 @@ static void xe_file_destroy(struct kref *ref)
> >   	xe_drm_client_put(xef->client);
> >   	kfree(xef->process_name);
> > -	mutex_lock(&xef->user->filelist_lock);
> > -	list_del(&xef->user_link);
> > -	mutex_unlock(&xef->user->filelist_lock);
> > -
> > -	xe_user_put(xef->user);
> > +	if (xef->user) {
> > +		mutex_lock(&xef->user->lock);
> > +		list_del(&xef->user_link);
> > +		xe_user_put(xef->user);
> > +		mutex_unlock(&xef->user->lock);
> > +	}
> >   	kfree(xef);
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_user.c b/drivers/gpu/drm/xe/xe_user.c
> > index 5c7d21dfcc45..50fb43d03b7b 100644
> > --- a/drivers/gpu/drm/xe/xe_user.c
> > +++ b/drivers/gpu/drm/xe/xe_user.c
> > @@ -6,17 +6,94 @@
> >   #include <linux/slab.h>
> >   #include <drm/drm_drv.h>
> > +#include "xe_assert.h"
> > +#include "xe_device_types.h"
> > +#include "xe_exec_queue.h"
> > +#include "xe_pm.h"
> >   #include "xe_user.h"
> > +#define CREATE_TRACE_POINTS
> > +#include "xe_power_gpu_work_period_trace.h"
> > +
> > +static inline void schedule_next_work(struct xe_device *xe, unsigned int id)
> > +{
> > +	struct xe_user *user;
> > +
> > +	mutex_lock(&xe->work_period.lock);
> > +	user = xa_load(&xe->work_period.users, id);
> > +	if (user && xe_user_get_unless_zero(user))
> > +		schedule_delayed_work(&user->delay_work,
> > +				msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL));
> > +	mutex_unlock(&xe->work_period.lock);
> > +}
> >   /**
> >    * worker thread to emit gpu work period event for this xe user
> >    * @work: work instance for this xe user
> >    *
> >    * Return: void
> >    */
> > -static inline void work_period_worker(struct work_struct *work)
> > +static void xe_work_period_worker(struct work_struct *work)
> >   {
> > -	//TODO: Implement this worker
> > +	struct xe_user *user = container_of(work, struct xe_user, delay_work.work);
> > +	struct xe_device *xe = user->xe;
> > +	struct xe_file *xef;
> > +	struct xe_exec_queue *q;
> > +
> > +	/*
> > +	 * The GPU work period event requires the following parameters
> > +	 *
> > +	 * gpuid:           GPU index in case the platform has more than one GPU
> > +	 * uid:             user id of the app
> > +	 * start_time:      start time for the sampling period in nanosecs
> > +	 * end_time:        end time for the sampling period in nanosecs
> > +	 * active_duration: Total runtime in nanosecs for this uid in
> > +	 *                  the current sampling period.
> > +	 */
> > +	u32 gpuid = 0, uid = user->uid, id = user->id;
> > +	u64 start_time, end_time, active_duration;
> > +	u64 last_active_duration, last_timestamp;
> > +	unsigned long i;
> > +
> > +	mutex_lock(&user->lock);
> > +
> > +	// Save the last recorded active duration and timestamp
> > +	last_active_duration = user->active_duration_ns;
> > +	last_timestamp = user->last_timestamp_ns;
> > +
> > +	xe_pm_runtime_get(xe);
> 
> If this runs every ~500ms is this not the same as disabling RPM completely?
> IIRC when the RPM refcount reaches zero there is about 1 second delay before
> trying to enter runtime suspend. If so, should this not be something like
> get_if_active(), and then rather have the resume side restart the worker as

I agree with Matt Auld here. I'd use get_if_active here and if it fails
skip this function. Ideally you'd put the worker to sleep too (i.e.,
don't requeue it) and on PM resume restart all workers that are asleep.

Matt

> needed?
> 
> > +
> > +	list_for_each_entry(xef, &user->filelist, user_link) {
> > +
> > +		wait_var_event(&xef->exec_queue.pending_removal,
> > +		!atomic_read(&xef->exec_queue.pending_removal));
> > +
> > +		/* Accumulate all the exec queues from this file */
> > +		mutex_lock(&xef->exec_queue.lock);
> > +		xa_for_each(&xef->exec_queue.xa, i, q) {
> > +			xe_exec_queue_get(q);
> > +			mutex_unlock(&xef->exec_queue.lock);
> > +
> > +			xe_exec_queue_update_run_ticks(q);
> > +
> > +			mutex_lock(&xef->exec_queue.lock);
> > +			xe_exec_queue_put(q);
> > +		}
> > +		mutex_unlock(&xef->exec_queue.lock);
> > +		user->active_duration_ns += xef->active_duration_ns;
> > +	}
> > +
> > +	xe_pm_runtime_put(xe);
> > +
> > +	start_time = last_timestamp + 1;
> > +	end_time = ktime_get_raw_ns();
> > +	active_duration = user->active_duration_ns - last_active_duration;
> > +	trace_gpu_work_period(gpuid, uid, start_time, end_time, active_duration);
> > +	user->last_timestamp_ns = end_time;
> > +	xe_user_put(user);
> > +
> > +	mutex_unlock(&user->lock);
> > +
> > +	schedule_next_work(xe, id);
> >   }
> >   /**
> > @@ -38,9 +115,9 @@ struct xe_user *xe_user_alloc(void)
> >   		return NULL;
> >   	kref_init(&user->refcount);
> > -	mutex_init(&user->filelist_lock);
> > +	mutex_init(&user->lock);
> >   	INIT_LIST_HEAD(&user->filelist);
> > -	INIT_WORK(&user->work, work_period_worker);
> > +	INIT_DELAYED_WORK(&user->delay_work, xe_work_period_worker);
> >   	return user;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
> > index 55035a9c2c4c..80948199e743 100644
> > --- a/drivers/gpu/drm/xe/xe_user.h
> > +++ b/drivers/gpu/drm/xe/xe_user.h
> > @@ -11,9 +11,11 @@
> >   #include <linux/mutex.h>
> >   #include <linux/workqueue.h>
> > -#include "xe_device.h"
> > +#include "xe_device_types.h"
> > +#define XE_WORK_PERIOD_INTERVAL 500
> > +
> >   /**
> >    * This is a per process/user id structure for a xe device
> >    * client. It is allocated when a new process/app opens the
> > @@ -32,9 +34,9 @@ struct xe_user {
> >   	struct xe_device *xe;
> >   	/**
> > -	 * @filelist_lock: lock protecting the filelist
> > +	 * @filelist_lock: lock protecting this structure
> >   	 */
> > -	struct mutex filelist_lock;
> > +	struct mutex lock;
> >   	/**
> >   	 * @filelist: list of xe files belonging to this xe user
> > @@ -45,7 +47,7 @@ struct xe_user {
> >   	 * @work: work to emit the gpu work period event for this
> >   	 * xe user
> >   	 */
> > -	struct work_struct work;
> > +	struct delayed_work delay_work;
> >   	/**
> >   	 * @id: index of this user into the xe device users array
> > @@ -73,6 +75,14 @@ struct xe_user {
> >   struct xe_user *xe_user_alloc(void);
> >   struct xe_user *xe_user_lookup(struct xe_device *xe, u32 uid);
> > +static inline struct xe_user *
> > +xe_user_get_unless_zero(struct xe_user *user)
> > +{
> > +	if (kref_get_unless_zero(&user->refcount))
> > +		return user;
> > +	return NULL;
> > +}
> > +
> >   static inline struct xe_user *
> >   xe_user_get(struct xe_user *user)
> >   {
> 
