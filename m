Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DEBD0BB41
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 22:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556C810E240;
	Wed, 23 Oct 2024 22:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXNrYBFY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E89E10E240
 for <Intel-Xe@lists.freedesktop.org>; Wed, 23 Oct 2024 22:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729721886; x=1761257886;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kUjtBEUMIkXLwYPXkF0Dq5SvdocOzhIW6Wz8eoLOfQA=;
 b=ZXNrYBFYfL1c6/biVLioxAVOvwjMoaoE7nT0IRygz+pJF0if55iProYg
 YayYuEuujj7G1y+y5sjt1LYWzHsWBhEGzn/M5u6HfrP1+ytAnRcYSbH/d
 ds5OqeU8pW4IGwRwP/1iHPADqusX9oMjoc5x1hyZ5K0ZuffXiP9U2p1Hd
 mcoVHpY2BgT+DRTuoQKlhJEUtfzUg9rYRORltR4z2+LkSa5uYv+4TvHWm
 dHa9mXayeoE68uRMC/TT+T7osl5MPhBvPf4U8sVJ0iE4iNhynfc8ctLfs
 p1lhJtYK0T+j55Aqr9ERYTYVjq7yagJlT1wHvIpNp3wJ7AyN9LoI59KXw w==;
X-CSE-ConnectionGUID: HlZVy7mvTDWBEeCiNB23WQ==
X-CSE-MsgGUID: EuQ/RBiTRzaPiuJnJC1q+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29438705"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="29438705"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 15:18:05 -0700
X-CSE-ConnectionGUID: Rr3PgR+GR92KqJzefS9SYw==
X-CSE-MsgGUID: V2rNkysJSCqsS/qRvxNgCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="80402187"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 15:18:04 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 15:18:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 15:18:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 15:18:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2s4c7jDd+GcYKAfhoJc4G62uhOcJF9fRG5a0RMYvj1RmiN8sTc2hv3tultFCvQRCK7XJXCkegY3j9p2q06qDNbT2k/WGPbalAALCUWHyKY/ZBE+Tw5pm5O2PAwS4eM/94x+8UcYtEMkm4Tu45F8NWjGBAJExdaBUPv7Mx3KhiJhJxBjWaIVdhOgAaWZyE3V0156yHB96O/rBmNsvvUMbXSOVrZE6iPu2P/gflXLpjtHorOzipSZX7pmgC/OwNH4qN6vSPNC0NKp/kMSq0/roFBhLEq/5lDkDB3ySrE1/rGvN05KteL31xJc2yb5sFviwgzthXwzjmTIqVF+QNlCtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8hfOMFssRVMwHmXuFlazt2at9/CjWq5/8SpvwlLPN8=;
 b=FXVoQ4x6g1XjUub7o3+Ey5A1mJnLxUMLcj/nOy2UFIhMOFGBmEkXxAR29WaQIcLyaTJlxDCNUjydsOhmh30AYI0njO0+lDxzuCE9SGP+OgDc35wM/H6ZC8be09+Yi7MO1fZpc8LLj4SBqHAjc5T1unD5iAOv3+lo6ZaXci/xyYWiuXHpobdiHDj/Pi30g3F4Urqh1P8C4N1l16qii7HF9YIKuXY+lpJZoX6nmq3/uyxH7dYp0s95pTbznkbHUZ2Rxmca0lqKt4y5RAMJ9RmSj7mSJsQfSfMWrdYfD7kuBbRpU2pjt16HmBgr1UZmeo4gVWoZl0z9po8RiLTdemZhUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB6547.namprd11.prod.outlook.com (2603:10b6:510:211::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 22:18:01 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 22:18:01 +0000
Date: Wed, 23 Oct 2024 22:17:42 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Separate full CTB content from guc_info
 debugfs
Message-ID: <Zxl2Bj56VnzU4S2n@DUT025-TGLU.fm.intel.com>
References: <20241023001736.1766523-1-John.C.Harrison@Intel.com>
 <20241023001736.1766523-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241023001736.1766523-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR03CA0381.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::26) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: ed68988f-80fa-4e28-91c3-08dcf3b08ece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Tu+7B/KGJrG9lO2/20TuM254Z7L3hX4pPHHECcSmqXOQdkdvQQEUs4jQxKjC?=
 =?us-ascii?Q?lHx5U4ATucRrcv2MgnGyk9z6IZ+lyp01I74Ztc3NBlBUCkn4EU9cu8dAbhZf?=
 =?us-ascii?Q?/4XmkBcnvRxmyhLo0sSKkVzYgsbDsG7VuZkIZDkoF9bAAPOmX+FmzZQofQKl?=
 =?us-ascii?Q?XdiUz+4STPdLI3lAfkPX+CK73iFA7VpiPdOrQL1ZVsHNvVubckAvOYFjPiOp?=
 =?us-ascii?Q?LcDjVBeR1mIGT3m28qviaS1sqLlV/8aCQnc/rc2A85Z3luT4FAz5B+9HdZkl?=
 =?us-ascii?Q?3jElDLLg01I3iW45sOqccWnFR1h10APj0tzf29Xh5TtFgg+fXL84tUVSRKAf?=
 =?us-ascii?Q?2X47Oi3oUuZdyFjmscGyz3GUkk2HXWxEe+VISzsBgwFkimJuMf5pvxiUvneb?=
 =?us-ascii?Q?h5hUpWs+Ky/ECr/rCh9C2L4nR7v+0vMU7apiqsEMuQZCzXp5It+j9T5KRLB4?=
 =?us-ascii?Q?D9j28vzkk2x/Ely46x29IUO6/okNzWPJHkBz5x5Y2JYbiWIloRyVKKQEpB/b?=
 =?us-ascii?Q?iwztyybmImKMtZQO9fN/2SWQRdbGPrQySvQ0di3j3DWoOMpooK9fw3/1OnrU?=
 =?us-ascii?Q?JNPTWn5tRjFTJKIIAIcCdXYSN8zZ0/fx0m9tVpmDnzNLdlz9tp+h0n978swV?=
 =?us-ascii?Q?/nAWY3YPz2mZYlP3ah6YAOlbCOuDi486sp9nR2a3s/69JzMZCxPubL2/mkHg?=
 =?us-ascii?Q?fUdJSB/Twj/MEJ30YhH7yz6Li7s3foYUNn5OlvfqtZAwDmHVAYMUQPrPNDKR?=
 =?us-ascii?Q?E5WnBHb/ZHzSywCOCTBR4UbY+4GggMHRms0GwyX9wai9VQquGnWUQ97Jh0UD?=
 =?us-ascii?Q?IsZoK1UIQtljXGmWbmwv5E+Uw2EYzflH6AxkzLquYvyLkBX/CFV7nbL5ItEz?=
 =?us-ascii?Q?33wPTKzV1JfowGZKOlQdLpEWW7ETgu8Urbatu4Pb+Fi/7SS7vW9vtOioKd/H?=
 =?us-ascii?Q?YDhX0QWiwzqtdzNML2UT1wFiXuwoMidlXVc5fVoozn0vfxLmc9uZo55u/nEd?=
 =?us-ascii?Q?0jUeJ5Idmhqek8/Zye5ANcyzHl6t1ZKd7NaG6aN19pLypiL3cjkEwGogS9rb?=
 =?us-ascii?Q?3ciomatEjpH4BEpvX7gVkK9S/yoJsQpp8tYYddKUDaL4pycQDB7bA7znBZ9c?=
 =?us-ascii?Q?IbwpHvSiOMzS3OKn3i5bki1LPwkAgGz4ZR3v8PuSaOgIv73G/TxuYTnF9aVC?=
 =?us-ascii?Q?lO/cAOMK7gRMzHYPNrtdMSQ8CLLo4zD+CRA6H6fsvtjgbvyEtNZWjX04c728?=
 =?us-ascii?Q?IiGWqAMg8gtN0Qr7h9Ln43X64XW56cvpkJ5fAbV5DroOXEqec6Ai7wNV02Tw?=
 =?us-ascii?Q?XgiGDq0JcTHc3ayuXgItYab7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PaND4+yXQA6crF0ypN0a0Jj4KzDkyMaYnMRSmXt+H7u7WMCNtqF/4H7pjoBr?=
 =?us-ascii?Q?5m1cLXvSNv7P3Wjh1qNbDdjKFphJspZv9YbTIC+pReSd9NbSFn2kerfR8+mX?=
 =?us-ascii?Q?5AXFVxFH4fMJR2FeqRciz+dQBQ8fn6/QoYIq2wwQuWYCexcCcovpIWh0v7dD?=
 =?us-ascii?Q?CTkhvdLfe1p1Tix9bZzAU924quJ9v028k3OWmBsNjynHTYyxElUBOV9kvdbD?=
 =?us-ascii?Q?cohvICwMtySoRJfWo4/XyaN7zGRq75awsWvJq6YzImyhiUj+8CIMw8ljVYIP?=
 =?us-ascii?Q?DgSy8uuHU/6O1mjbAq6yBkq+/hjBEoUUPunR6Rhr6tVrdtfhUbHnbCoiO6AG?=
 =?us-ascii?Q?+EmIUwFiNTg6WgCWfFh2fqtxuRWFko8mrOT1KBbemmzw7dkR9bpCF4swwynX?=
 =?us-ascii?Q?324tNXCImpGZox8xh9sYjX1xJ4z3z+88rFnZkqMne8b9X8t3NNBNWQ5BdkER?=
 =?us-ascii?Q?8qwawPC4mOJil9BAz/pElQ8IiKsSn4T6WVekeJymoa85jfN1U1ujSVdTjcIx?=
 =?us-ascii?Q?XdRXqzt3yhD9deGVLqw5Uhg4H96F+YFCPhgH0t6PWzzBGjc98MwKzuslXVDN?=
 =?us-ascii?Q?Wqo5SzOKKlTUHjLOIPA4Q7szKVf+lWRxuyB7N+QpaG0lNP+7/WT2l0Dmxcjw?=
 =?us-ascii?Q?06yOeam1mA/NgqTznq4SWXsmexDa3MU2yZeugURCO0TEgIkbantbZuVnf4ZB?=
 =?us-ascii?Q?jw7mQZSQdf1EnAD9PIzz3U4ZWG3hB/LCUQmXaD75o0AoFd9L46Reg4/WpGfU?=
 =?us-ascii?Q?ua7lVNs7amtplM+ENKI4zzH8CeykZ0ENyhoTNAjpeFGS78JLFL0KCkzDXm0U?=
 =?us-ascii?Q?YcJJG5mkDX6OZqlabROpsOhuv4aihVl1cHq8cemwZ4tEIHYeJiC43UHxVdHB?=
 =?us-ascii?Q?8rcSLYplJN7RG6muXiGVxzpQTpchZ8QsZhWXzGSizX8gtasDvOL41B/+XDfd?=
 =?us-ascii?Q?ppmxKEnz2TpP3sFN9GUpqvj2wR/VW62SQ5J/2t8CIWX8GqFcGGORTqASnAan?=
 =?us-ascii?Q?VVrKIV+kmTeFvnHYseFew9URzPWVAeOO3lOaZLHsws5+qn0xYoNpu+TCykY8?=
 =?us-ascii?Q?LSSBKCdLeSEI7TKcPpoE1lTWMzFStS38prJl6bPXXV7ZQ0heUjnqWSBrW5CA?=
 =?us-ascii?Q?MMH4L+9PG4JptKAVQfWK+J6wZp00hLuJUHa+OZP2DYp5OjMACO1tTTihV38D?=
 =?us-ascii?Q?AbFkmrDxWUHHcmbnFfgdxR8rvH642/PGgYNOhQLwh9sySTxuw0qBk0wCaDo1?=
 =?us-ascii?Q?BWGef42jFHhCVY8xKgQ0NM3BArTyQ4r3GLc8/JmBIQ+vktS8/Kj9akx3t0Xt?=
 =?us-ascii?Q?Vy1hT8lqxIpMIt8vYBjBJcv3fHoIyDIliAulZU7V8kM24MEyY19MFO+h84RI?=
 =?us-ascii?Q?0eMwHLaMnbsQ84QePPDQ5pKoCcq3O3OAy5pgSDGSMdPGPJvzzbAXZfP1rHpl?=
 =?us-ascii?Q?g9OE3r0kW962Lko6CD2GMd9xj1rsJD+8QE5w/aDlvusOUMsKNzt4aH8u2d6s?=
 =?us-ascii?Q?7YSiY8p1rxRon0xbGCaLkeC1xMm/cln3d0yzn19oVJJ93zuSb7KxRvfFWnqj?=
 =?us-ascii?Q?4RPyPIjeYlDd1ldukIdVTtevhNrOGPCkNW0CXt7uzHI5BLjDkrcrpZ8CDjXC?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed68988f-80fa-4e28-91c3-08dcf3b08ece
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 22:18:01.6456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rnFBfeG2vfrlCP8k2MaaDZx2+SiWM65pyLEvjWVALkMAM1Sf9QxMiH/QFhJBBGd1Q5L+8mmw58S1/RNtYhtAow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6547
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

On Tue, Oct 22, 2024 at 05:17:35PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The guc_info debugfs file is meant to be a quick view of the current
> software state of the GuC interface. Including the full CTN contents
> makes the file as a whole much less human readable and is not
> partiular useful in the general case. So don't pollute the info dump
> with the full buffers. Instead, move those into a separate debugfs
> entry that can be read when that information is actually required.
> 

I did notice this when using the debugfs entry and yea a bunch of asic
isn't all that helpful in the common case. So change LGTM but one nit.

> Also, improve the human readability by adding a few extra blank lines
> to delimt the sections.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c |  2 +-
>  drivers/gpu/drm/xe/xe_guc.c         |  5 ++++-
>  drivers/gpu/drm/xe/xe_guc_ct.c      | 25 ++++++++++++-------------
>  drivers/gpu/drm/xe/xe_guc_ct.h      |  8 +++++---
>  drivers/gpu/drm/xe/xe_guc_debugfs.c | 14 ++++++++++++++
>  5 files changed, 36 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 8b0ea77661b2..5d7d8192d6f3 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -267,7 +267,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>  
>  	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
> -	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
> +	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true, true);

One bool, not great. Two bools, yuck. Anyway to refactor this without
bools all over the place?

Matt

>  	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
>  	ss->job = xe_sched_job_snapshot_capture(job);
>  	ss->vm = xe_vm_snapshot_capture(q->vm);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index b065bb9973e9..fcb540003e53 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1187,7 +1187,10 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  
> -	xe_guc_ct_print(&guc->ct, p);
> +	drm_puts(p, "\n");
> +	xe_guc_ct_print(&guc->ct, p, false);
> +
> +	drm_puts(p, "\n");
>  	xe_guc_submit_print(guc, p);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c260d8840990..352673b6974a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1607,7 +1607,8 @@ static void g2h_worker_func(struct work_struct *w)
>  	receive_g2h(ct);
>  }
>  
> -struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic)
> +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
> +						    bool want_ctb)
>  {
>  	struct xe_guc_ct_snapshot *snapshot;
>  
> @@ -1615,7 +1616,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool a
>  	if (!snapshot)
>  		return NULL;
>  
> -	if (ct->bo) {
> +	if (ct->bo && want_ctb) {
>  		snapshot->ctb_size = ct->bo->size;
>  		snapshot->ctb = kmalloc(snapshot->ctb_size, atomic ? GFP_ATOMIC : GFP_KERNEL);
>  	}
> @@ -1650,6 +1651,7 @@ static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
>   * @ct: GuC CT object.
>   * @atomic: Boolean to indicate if this is called from atomic context like
>   * reset or CTB handler or from some regular path like debugfs.
> + * @want_ctb: Should the full CTB content be captured (vs just the headers)
>   *
>   * This can be printed out in a later stage like during dev_coredump
>   * analysis.
> @@ -1658,12 +1660,12 @@ static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
>   * by using `xe_guc_ct_snapshot_free`.
>   */
>  struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> -						      bool atomic)
> +						      bool atomic, bool want_ctb)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_guc_ct_snapshot *snapshot;
>  
> -	snapshot = xe_guc_ct_snapshot_alloc(ct, atomic);
> +	snapshot = xe_guc_ct_snapshot_alloc(ct, atomic, want_ctb);
>  	if (!snapshot) {
>  		xe_gt_err(ct_to_gt(ct), "Skipping CTB snapshot entirely.\n");
>  		return NULL;
> @@ -1704,12 +1706,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>  		drm_printf(p, "\tg2h outstanding: %d\n",
>  			   snapshot->g2h_outstanding);
>  
> -		if (snapshot->ctb) {
> +		if (snapshot->ctb)
>  			xe_print_blob_ascii85(p, "CTB data", snapshot->ctb, 0, snapshot->ctb_size);
> -		} else {
> -			drm_printf(p, "CTB snapshot missing!\n");
> -			return;
> -		}
>  	} else {
>  		drm_puts(p, "CT disabled\n");
>  	}
> @@ -1736,13 +1734,14 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
>   * @ct: GuC CT.
>   * @p: drm_printer where it will be printed out.
>   *
> - * This function quickly capture a snapshot and immediately print it out.
> + * This function will quickly capture a snapshot of the CT state
> + * and immediately print it out.
>   */
> -void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p)
> +void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>  {
>  	struct xe_guc_ct_snapshot *snapshot;
>  
> -	snapshot = xe_guc_ct_snapshot_capture(ct, false);
> +	snapshot = xe_guc_ct_snapshot_capture(ct, false, want_ctb);
>  	xe_guc_ct_snapshot_print(snapshot, p);
>  	xe_guc_ct_snapshot_free(snapshot);
>  }
> @@ -1776,7 +1775,7 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
>  		return;
>  
>  	snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);
> -	snapshot_ct = xe_guc_ct_snapshot_capture((ct), true);
> +	snapshot_ct = xe_guc_ct_snapshot_capture((ct), true, true);
>  
>  	spin_lock_irqsave(&ct->dead.lock, flags);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 338f0b75d29f..01d3b0183bf0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -17,11 +17,13 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
> -struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic);
> -struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
> +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
> +						    bool want_ctb);
> +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic,
> +						      bool want_ctb);
>  void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
>  void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
> -void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
> +void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>  
>  static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> index d3822cbea273..995b306aced7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -47,9 +47,23 @@ static int guc_log(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int guc_ctb(struct seq_file *m, void *data)
> +{
> +	struct xe_guc *guc = node_to_guc(m->private);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	xe_pm_runtime_get(xe);
> +	xe_guc_ct_print(&guc->ct, &p, true);
> +	xe_pm_runtime_put(xe);
> +
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"guc_info", guc_info, 0},
>  	{"guc_log", guc_log, 0},
> +	{"guc_ctb", guc_ctb, 0},
>  };
>  
>  void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
> -- 
> 2.47.0
> 
