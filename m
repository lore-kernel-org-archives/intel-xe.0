Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F810C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 21:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA6B10E626;
	Tue, 24 Jun 2025 21:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TB+YKFPk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADC210E626
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750800636; x=1782336636;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8Ydms0pCK2hNGh8elkodBMiqQq0HNcqDFiirEFVUFPU=;
 b=TB+YKFPkI7t+0dWo0HumxvCvh/Ngn6esQqlMIHa6Ofw6gV90fg93mISu
 6DTaMxu+Ggpid7LPGOgpJbO/UatUtF3evVAdaBC+3JK3W6mxV+WzXea8c
 EM86IlEXWcO7cqAnf/vDKbcjFSn8nrKbspQ2Sk5RgFgtWXRgnrVLdh6Rb
 RzCyLTUzwyWTGoq7yZVLrqMJlAGX+Pw0Dapxj/5GOR/6s7rhkk8llGZcx
 Rg1LTplRB7iMLIZBWGW2zk/Ba48OojKFZwMl90daQaC8HnKa4oV2oGV3o
 9FF5bDhlkT2/uhESJzqMMfiizWlLGrE296byXMTuiauXZVKLCIXwytOMV g==;
X-CSE-ConnectionGUID: vvo7sqm5SWmNOAURC7JhBQ==
X-CSE-MsgGUID: Zkyf9HZPQHyI9umYWoD0Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53193074"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="53193074"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 14:30:36 -0700
X-CSE-ConnectionGUID: +b/GtBT2RLWZSMluVrVikw==
X-CSE-MsgGUID: jm6bF8SlQ22hGptGpydNSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="157523983"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 14:30:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:30:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 14:30:34 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.54)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:30:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qVrLq6H7rE0h2N2LPe1ewD7pn2xECWVCBj5ZxM5StV2vn1vkmi/szLDMipVVBVeLqDF7JShAxTXkmBXNQ+hgq9c2ZQwydkMNAiV091SB3ax4mFpY1c6cwZX3Sr0/iO7gR8CTRTmuSiCmJjD/jsn3TlRByFXIGji7AsOddZw51ZwjOxmm26RZVgVWmBBorJPElNWkimyWWvQhQDswWejbTPjn1FgH4ummEU7QtMOP9lmnG7eVJEiJfByLYS2DmEUryaGGHRLGk13ggTxtlhTDWyOM/JK49zaW4S09b/ThCH0MFAp//yxEP1fFgbrtwqZh/g3QNizshqw3PslnPJMY2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WnTelOKhK5ej2P/CvIIDq+beVI3Eg45CLQGUOdS9+n0=;
 b=iGPdQXooM2zMBca9IQQh2pO+BpOEQJirKO6DDrYUf9ngDGpo6HmX7+4PPiTBuzB2F6jjx0QDizJL0CMX/XIaO1FYxeWRva330vrC0hvb6aFMTU+VEI2jAlv871g2IGRqY3/YdvSBHW4bOQFuWUDG4XsPY8KdjlphkLzKnXVXosxv+VYxOeZuDgI5LBqyioDSV99X9i/8/UcIQbdNd6vIIL4Qw06qmGNrgbPayuIbnKowRaTkRy+i6girDEzq7PWzS9HqmQdaTFwGy91N4M2wcQ+Z0cLBeifcjwETeieXxCSXMqAktmT0kqWR1MuGviANKgbz6q8cmXBmCIuuRl3TKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB6350.namprd11.prod.outlook.com (2603:10b6:8:cd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.30; Tue, 24 Jun 2025 21:30:27 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 21:30:27 +0000
Date: Tue, 24 Jun 2025 17:30:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Explicitly exit CT safe mode on unwind
Message-ID: <aFsY65GdKwZA1HZU@intel.com>
References: <20250612220937.857-1-michal.wajdeczko@intel.com>
 <20250612220937.857-3-michal.wajdeczko@intel.com>
 <aFnHMVSx8FRrT110@intel.com>
 <aFrFDV6ghPUHfWLI@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aFrFDV6ghPUHfWLI@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY3PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::30) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: 842b5497-77b3-459f-2a8d-08ddb3665444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TrfpOSpk7P2WxrJUm8ciIYkWOAEfeBdaJyPd/9OZoTE94Czo47qVxWcoG6op?=
 =?us-ascii?Q?5NA3oMpz7VuSgfZ3eXYr3KOz1GV9/RtaSXut/gECbPMIYFK6MxvFLCd6jwWn?=
 =?us-ascii?Q?6C9JOH8H1WVXBleWmW1foT/YanPRcBtEURyhg8JJI9CgVmPj1Yqw3rZK/Iee?=
 =?us-ascii?Q?MTA8jrd5ccX2ReGaSmdzf7un2y8RPuLYFGa6IprtdBOk1eFEXnbxUOy1lmXi?=
 =?us-ascii?Q?ODE63a34YxN/nesR1WctvhUJ8LgSQuobuwFr5qiq1ryNrUL8Xfd5WzyuTBPQ?=
 =?us-ascii?Q?GZxZcdy9/ByC4qKF+MFCOLuT9pcdsfduXJW/vc9xx0+eHW072oHqK2RL7spo?=
 =?us-ascii?Q?KvOOSRgxS1kUB88Xr9FD2615U2vfi73n0yyYVm+DgO7PU990iN2X7oQI1xKK?=
 =?us-ascii?Q?tc2W/M37Ts66FdfhKcK0IVFP3d287qWjYj2boiBzJjMj6ZJbgSpWRqb5s1vR?=
 =?us-ascii?Q?E+3OneQwMbwxHBVhvBUpXNk6VgBh2W7rSXXKbdCltnovnDNj/Ar2tjCg6Nzh?=
 =?us-ascii?Q?6gORW3cNTxqWOqNgus9edOgJUc2i2X/X6l6Rn0f0p7s4IhivOZqRdagElD94?=
 =?us-ascii?Q?et1ogoZWgwuPhfDFmQgE4oxn4Om0zt0e8/pU1Hr2c9M4en/2Qw9Ra/FmitTU?=
 =?us-ascii?Q?e71hhrqqN2Ss7q9xMduXzEz1WiVmsuGFP8wNz3qw7AGKJiCOo0G2F5gfFvnT?=
 =?us-ascii?Q?rpmP/dGA5l6iY3Hwq3EQtwWt2MG6n/RtE242Ts9SdQCABV3d1g1Z2S3P49bg?=
 =?us-ascii?Q?KN4eo0LtuZ9WNdSHV+Mhc4FRU5NLuMaOxsKXcT43iZvStD23UlxwNY3/zp/K?=
 =?us-ascii?Q?S5TzUptpUCjz/cz4NGAN5mIFyO3COn9XlLTCmzT3fN+L+V1lpwlSLeFyJy8X?=
 =?us-ascii?Q?HejbIq+0oBcYe6xh6Q+5MGL+TjmudZ/8h7u3oSVLuvKJS46CHR1jcsBMyX8r?=
 =?us-ascii?Q?5Gypxgd3lq6qvX/je+Rx2fnb/zmkkrq0aTEokQzgFe3tWf+8b6CGjgyxG2q4?=
 =?us-ascii?Q?hd90K1CJLUJYPWdBA+uQjZkjWTVp4F0KHo9fT+96g9DmwKQIEdBWedWJ4r6p?=
 =?us-ascii?Q?Ers8KNleVnSup5ddVdqXhgMTfGDjepbdqtfjJENGqKPLJF0ZU6xl9Ye6fc+5?=
 =?us-ascii?Q?eA5h3QyleDOt1pD0G1g53PIZaK3h4g+3y1gmbMNKfCgiIQRs9jdGDBS8Oc33?=
 =?us-ascii?Q?EHKCj2FzFzRyQmggBqDvI5aT6fYWRACZvHI5FjrsEfmNPrYFun/BXtz/R2lG?=
 =?us-ascii?Q?ju+Ldj0EwOpEyFAWq/McqlRfvp7N1NEiKPKuEkkvOJAX8w3p+j0gaOcjh3ix?=
 =?us-ascii?Q?XXJL19OM5ivnqr69/6EjKCCtnBN4+y77aVU9f774gmtyQ5zBhKshLQ2wHSd4?=
 =?us-ascii?Q?j7kGlBsGYkQ/atzPN2RTXhp747kE3waZW9J0uEzbKkcB33XY9B6hyFaOSlbv?=
 =?us-ascii?Q?2piow6e+1eU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?drnUepaPcYXnU3YDDinNa7Jpxml0ShNBfiMOehz0e+L3wPTfQwvwl5xIu2od?=
 =?us-ascii?Q?mZ5aaPkNXfbb8/11In8xHVoBagvkka0Mkx/1sutWN2p8voACz8hqQY8Z8hQw?=
 =?us-ascii?Q?E6ijNn6055xfl/sxEzghGsk1jrfdq/BpOh5AK3gINV55gYs5Fn3tf2UqNhVm?=
 =?us-ascii?Q?ud/hQRq9XBwu0Fabs/ktBe6UvfdNpUDVNjIcWYidooHeDDgLFPAjxhxxCkzb?=
 =?us-ascii?Q?L+jI3XGK4/jTwPr6Z53d0+zgaFfK5ouuAoOECmIwBTyXT9OYxTClcPL65rzx?=
 =?us-ascii?Q?ra+7EgB5gU1ZsmV92gY8GJIq/FWNPsYVXEODcaYyUf15HaAuNuahKRjE0iK3?=
 =?us-ascii?Q?WqjLNJjBgSF0yaMMhxUbdnG3uavixP+Rg36z1uohjWSDwUPYYb3AzbZKvcB6?=
 =?us-ascii?Q?B90lEMkaEI/DDTkVnEDGQJyWlO8MRQ/GT+dpgPY6CRYiMAjqAYIiiQIFDmA2?=
 =?us-ascii?Q?QjHjJk1op+mUvpkwhHQYze6GnzeLgSP3iS37KsuMcjpgLWY9D+/EZFAttDN7?=
 =?us-ascii?Q?6y+/XsgTS3TOcMMUylEHA4buKglTJdfjk9geAO44Llr2vyR5D6US2wD8991c?=
 =?us-ascii?Q?KDxfygNPb+eAGf8sbmaYwZIdjjspd9OghaBKfm7D4Rs8B1+FhqYC1qgAaKTz?=
 =?us-ascii?Q?18cSTghIvb/tt9mSs1HeG7pzR/uHHqW+gfG/NgLNVioQRoAgNDntsB03At3b?=
 =?us-ascii?Q?d21+eWpgmQxlW6EoVUuFvO/USi8xC56rTvHivArCEXdxfVrf2YnNWtfxXV5v?=
 =?us-ascii?Q?d8jgrPz5Ir9cRKvHZ54w3uDa/i/eSZ+qFnfKDBC2Y2oda8OOevZGizHhBnh1?=
 =?us-ascii?Q?ovhKttM1kb4iU/s5MaQyZSBnnRsaUB6z0ZwA5iL7BfUrjI3yOLWSMd9EA70t?=
 =?us-ascii?Q?EXa3u/2bzrtJcf0tqTbEFhfGQODti4x+WloB00FxUMALlJbcdStP4JDGAAv3?=
 =?us-ascii?Q?5haVUsr4nFje2r+B745ltyp8JH/Uc6YuxmB/rum7IVNh1+bY0EwcFHEYohwi?=
 =?us-ascii?Q?SI4ncoH1+64ZpFVixMzKqnwkS57I+ACDBuvfwTMUsAldjCUuPfcYw4SFjLtY?=
 =?us-ascii?Q?BzlLBvqZ0+/r26fYBLEYjkqbL+gMTFr7XLs8ROE4XR+vI0n7szK8t+9DqS5L?=
 =?us-ascii?Q?nwE3XoJA2O0kltwvLdDFVoefte5LT3gY5PjFins4vLFhwoUOET6SFUFll9Nh?=
 =?us-ascii?Q?LtjC7XIuzzvZVmeM/zd2yIorMdgbLxoL/Q+fA3VcKRCm5SH+qWClxFJkIGo1?=
 =?us-ascii?Q?kcM2nSkwTdBvgtEwFZP93u6BPx0K8MFo512uPvwYSAF6p3Mwaeug/svcTet6?=
 =?us-ascii?Q?TSKusUxgIViixn2y9JDgTr7u0jfplE+F7SGk6VDB//LA3EfBG6uLdGOnf68I?=
 =?us-ascii?Q?AZptFd/Ze6dC6kvLHwFbn3inCp28bSoasV8fsJjsaBxCr3eVdsB9LKEJaF8W?=
 =?us-ascii?Q?c/xKkmPWA/tz30QbefbMq2zGdip+unVU8iFwkvWilmkBLc3ZRYLPMErratay?=
 =?us-ascii?Q?WE9LFnOhodDcqV+ksTYpcvoZU9TRdhlTeUrnZDzYH/OEK/PVDnhRrSjtGB7l?=
 =?us-ascii?Q?aNAtX/hiOei8/hDirznV2ErmTjbBqeDU9oUe5xX8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 842b5497-77b3-459f-2a8d-08ddb3665444
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:30:24.0165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3rIOJFWD0k4lDFreUm4cnZ9R+ExeHJ8BZ4/w6WhBuljrjlHkuTyfH7DvoIy+VPllio45GRd0On6zNP2irl/CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6350
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

On Tue, Jun 24, 2025 at 08:32:29AM -0700, Matthew Brost wrote:
> On Mon, Jun 23, 2025 at 05:29:21PM -0400, Rodrigo Vivi wrote:
> > On Fri, Jun 13, 2025 at 12:09:37AM +0200, Michal Wajdeczko wrote:
> > > During driver probe we might be briefly using CT safe mode, which
> > > is based on a delayed work, but usually we are able to stop this
> > > once we have IRQ fully operational.  However, if we abort the probe
> > > quite early then during unwind we might try to destroy the workqueue
> > > while there is still a pending delayed work that attempts to restart
> > > itself which triggers a WARN.
> > > 
> > > This was recently observed during unsuccessful VF initialization:
> > > 
> > >  [ ] xe 0000:00:02.1: probe with driver xe failed with error -62
> > >  [ ] ------------[ cut here ]------------
> > >  [ ] workqueue: cannot queue safe_mode_worker_func [xe] on wq xe-g2h-wq
> > >  [ ] WARNING: CPU: 9 PID: 0 at kernel/workqueue.c:2257 __queue_work+0x287/0x710
> > >  [ ] RIP: 0010:__queue_work+0x287/0x710
> > >  [ ] Call Trace:
> > >  [ ]  delayed_work_timer_fn+0x19/0x30
> > >  [ ]  call_timer_fn+0xa1/0x2a0
> > > 
> > > Exit the CT safe mode on unwind to avoid that warning.
> > > 
> > > Fixes: 09b286950f29 ("drm/xe/guc: Allow CTB G2H processing without G2H IRQ")
> > > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_ct.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index 822f4c33f730..6e353757e204 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -35,6 +35,11 @@
> > >  #include "xe_pm.h"
> > >  #include "xe_trace_guc.h"
> > >  
> > > +static void receive_g2h(struct xe_guc_ct *ct);
> > > +static void g2h_worker_func(struct work_struct *w);
> > > +static void safe_mode_worker_func(struct work_struct *w);
> > > +static void ct_exit_safe_mode(struct xe_guc_ct *ct);
> > > +
> > >  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > >  enum {
> > >  	/* Internal states, not error conditions */
> > > @@ -189,14 +194,11 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
> > >  {
> > >  	struct xe_guc_ct *ct = arg;
> > >  
> > > +	ct_exit_safe_mode(ct);
> > 
> > I was going to ask if we also don't need to disable more of the ct
> > at this point, but I believe it is indeed not relevant at this point
> > of the code.
> > 
> > But it is any possibility of double call of this function in some of
> > the regular removal paths?
> > 
> 
> ct_exit_safe_mode is safe to be called many times - it just cancels a
> delayed worker.
> 
> The code looks correct to me.
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

I was going to push this right now, but it looks it needs a rebase now...

> 
> > >  	destroy_workqueue(ct->g2h_wq);
> > >  	xa_destroy(&ct->fence_lookup);
> > >  }
> > >  
> > > -static void receive_g2h(struct xe_guc_ct *ct);
> > > -static void g2h_worker_func(struct work_struct *w);
> > > -static void safe_mode_worker_func(struct work_struct *w);
> > > -
> > >  static void primelockdep(struct xe_guc_ct *ct)
> > >  {
> > >  	if (!IS_ENABLED(CONFIG_LOCKDEP))
> > > -- 
> > > 2.47.1
> > > 
