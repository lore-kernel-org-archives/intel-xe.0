Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA38FC0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 22:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DC410E025;
	Tue, 28 Jan 2025 22:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bevjia9/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788A210E025
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 22:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738102125; x=1769638125;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zEhjPb/H35KZIj0Wyix/Zht6qg2pyQ6mfvykyB+XZa8=;
 b=Bevjia9/DD4/fqsLDcCeF0vq+anNx565gC34oGYwugtiDR0NYHAwSuhq
 atN5CneUmbN0qi6zVWur3MJeqQj5ToU8VDYZXmgyQ/YpJI7nV2MEffGtC
 E77glV7xs3mnv19mXXd0eSzt3z1+HC/yRqq2gY7Jl3i4f+yQ/nsUAwMCq
 6LANiADwe5qF3tNhaYmWEZtK9qa6xElPYdABUTcn70AwIU6t2ZoptDR8Q
 zDfqJbww76m8FsR+2jNCO3hQsGv0bBRzneOQqIqUJjhHy1WR2N20DtadP
 Psb2qIXs8N6dmERyR231azzNfBAqaSbvMEER1q6Ph5ziLFPtggHbLlzhd w==;
X-CSE-ConnectionGUID: 6jSrQtmgSlWlUVan8eOvuw==
X-CSE-MsgGUID: viKynwQRQMSB+m4EFTMa+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38307792"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38307792"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 14:08:44 -0800
X-CSE-ConnectionGUID: QAPZPgWoR/GURX9FON7CyA==
X-CSE-MsgGUID: FBduf6NMTGydTs2yHieu4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="113840779"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 14:08:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 14:08:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 14:08:40 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 14:08:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NM0HfEKBhlOJT4Y8P+h7Ei9W+87+fM+MZKio3w9XYjGxz2Fj3aDYg6OtHnauNVlIjzA83q9Xz0nIMdSj1bWi9i7hi0wMUr863Ckw+YZSDlOCzoPlzz+4PpnkYzlbF2mcX/vrJ98NxRk8D42eZHMIa7Etp/uFZkRWKX0wVKeArNuZgBCRI64rKdSuzNWvf7sU2d/QIkvtD/WcQke4x8zd8gPzO+fCNN6O/zC4CR0++U8U4xHkwytr8DM/MZwESIn540GPkvzNzSIAAxF/CC1+jCLqFsv6Iy0KPTjO+TGTQiK4noHwS+Xqjl4S11hlh/3YI4akNvQYXqHV810aP7XWCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yuGKNrkjFOp2Lj0g3eZ2BoH1VyOHctA0U7BU4FWm5k=;
 b=A8pUTMGf0wA5yclzEaqNrMI8/V4WrH/8odh72S+bmQnyIvjJWOYyidpyjA8g9pAbB7pLSTAbE91IBE3wzquBpfy606bdEJzCVe4T+MCHY1zk8o40qOVOTxLii1kO2HuU4L4iMLE1shsZrcksfUDk6nF/+e9g9HVaNQcsXX7VlySV26LTXDYylQipAsiWyBSJ+xlQHUlUSV7k4aKGLOvcwVS2+8v2SQZZltrHlPue62X7MGCQmep7TN1+kH6s9GtLJrjqgoMvZ1mkL/lvRnm8jL8kP7cDOEi49YE/AqgL2Yu2z/Jyjt5cu8Kp/21E4p54rkuemqOGROrSTnMifem4Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SJ0PR11MB5056.namprd11.prod.outlook.com (2603:10b6:a03:2d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.24; Tue, 28 Jan
 2025 22:08:38 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 22:08:38 +0000
Date: Tue, 28 Jan 2025 17:08:34 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/display: Add intel_plane_initial_vblank_wait
Message-ID: <Z5lVYh6AcMB1BXjn@intel.com>
References: <20250121142850.4960-1-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250121142850.4960-1-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:303:b5::29) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SJ0PR11MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cce1906-ecb4-4900-fde6-08dd3fe850f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fgzkMWnJRzvxGawQSXV8tRxc+1V+AN5ug0VkaWwC5aVNhr8NM2CEHRGdo6IV?=
 =?us-ascii?Q?RjkGj1gE+kBTeJhqJPL+ex7/26pJRd52nMTo2RyC71Hr2EAEUb0x4JkpEf+5?=
 =?us-ascii?Q?EiUz49gI6cHoSsLJ/O7tsABDpryWzc51/QBJanaRenhVdtIcN9pv4ky9xAg5?=
 =?us-ascii?Q?tpMrYcs2lLofBUrOGhExPSPXPAYyVWr1ZO8XIrNCzjm+VCmK0Wa6DiwMhtUh?=
 =?us-ascii?Q?RUkZ1QBZu63X7hj/BR2qr3fz6irXyaVBalzZobpPfoB7dA73ddcZlhuoWQSD?=
 =?us-ascii?Q?3qt2AiQgLTqWqtrP87XGAa2PgOffg0Cmf1v961AG0ngitqEBL8QLvJdH6JE9?=
 =?us-ascii?Q?awpeahyaIUJxZUR7hHGQJOUOOlQ0h0bTgoFXm37GgOkxnBKQclundzsl2Oem?=
 =?us-ascii?Q?GRK5fFCEsWvcsB9WTjpaq+OVTr4Ixb2OOc2pP5EZlNkZLqpEq9loPghF3gUp?=
 =?us-ascii?Q?0aCWwKyXR6ljINlhTmZOq7+VNAE+Px8d8p5iAXpM/cdi2BubE2TAMi7AEXX3?=
 =?us-ascii?Q?fSTVOpviSTw8w8u1CQd4TP6vYlHyR6mcd4dg/HyEpPTZlgA/mnzx4uPdzJwz?=
 =?us-ascii?Q?HPoTrRUIljfVrdpA0T2zC7/TUMLPSZVGCTNzkgfaWA4dnYAU9oSyV+0m0XcC?=
 =?us-ascii?Q?tpJ9p6Vmsr+VP5X/eKvDsjezB0OsI4usv+1UQoeA3dDduSS8W5h6Fck3SlzA?=
 =?us-ascii?Q?+3kO5gAjdmBtlzve36OeLkryV5N3cLJwTb+9VnQs4sREPpViwnK0JA9hpMG/?=
 =?us-ascii?Q?tx/Eh7O/3FEe1c9aYX4gkGnj/Om/KX1PodTzTe00h2LAhMlwQ6LV8sR0W9o4?=
 =?us-ascii?Q?6wYI11B9FjUxDbmr4Dll1wjtMaVk/cE0u383u61ocvQH6zgFhg3rjN5Qph2v?=
 =?us-ascii?Q?+yQhcNORrllsr6J5Ik75TVWJT7Ltil/nE46QtkA3VgPUl+XD/Ovka7HdE6sK?=
 =?us-ascii?Q?rbG/FYHVE+MCF4Fjm83jFhYsGvvohIgVVq6+GCrug20055oNvtfLAS1G81XD?=
 =?us-ascii?Q?9dRHTi+NK7lPCcr1yOFh09dlG6h6xc7GFaZD7mT6aD5Ao2fQ+ghuJy1gv+7Y?=
 =?us-ascii?Q?2aM1cEYOq5bEObsvK+jwRzAhRwOeGMO7ilIKP4StLHVO2pWSzkBps2ABMtem?=
 =?us-ascii?Q?RSFUMjAiVqyLWRz15BO5DnbiayEQVKZBfmZuW4vBs7oByP3fD3bggfCU8WE4?=
 =?us-ascii?Q?WrNwCHRiCeSEJqwoeEsXyhxS7mFydc5UoxvqXowhUV/RN+FZJqlK7J6Tt5Vr?=
 =?us-ascii?Q?/4GTNPwYa/8OT8oSAxW4zlDgfJBhPybS+dQ4W39zSHw3eEzZ4ssN77txsPZJ?=
 =?us-ascii?Q?0qYenrvZBzjJCm6A0gqpqDRVEICKrR2CKM/7obr0JXH94XW+E3y6DX2FFvb5?=
 =?us-ascii?Q?zwdeh1yfQUnog9UNdCWTLImo5ch7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eeVxgXhQb3yjOhnIuQAPJzOrUNrS62A35nfQRUz9X+r+Gl5QFsG3QWwI01ux?=
 =?us-ascii?Q?AyRty7gI7xXfDKqVGfeVMzBrFzjeg9Pk8G1r0gQRQ0TCHFbKqULg1TrwcaBP?=
 =?us-ascii?Q?VFnf88+oQLTTNVrWV7iftHdGD6I37NLZ3Piobcg2IMCO1rnNDbH5ekcrWTmJ?=
 =?us-ascii?Q?LxS0vcYsrYkgg19NpB43eiKDs+3hiqSgqXbUCbr6uWpm/Wlcx+kAxPFmskbD?=
 =?us-ascii?Q?IAvnQzH1E2Uo0a+yhm7ghyzpfxv0bgAGrQZDMaYV5HpcjlcH0IYr7IMP9+BL?=
 =?us-ascii?Q?auwShZM+aJ5EuV23RQvIw0rwSnRk+3FZDzsCEBkyIJ/XuGaJIUTIdakSeAY2?=
 =?us-ascii?Q?QAqRaiJB2u27vGdbT+YX9o+/owpf+RGEm6yYmKKIhi6pEvdcXvqLYRVGT3VK?=
 =?us-ascii?Q?BK7zcuOOCFKRAbvAjz03M8KLUvo6j/QduNLWGWvqc8cwdx+yYKvkJgPTLE+l?=
 =?us-ascii?Q?TR/elMrOl/GS+977tIe4hFhyMAzPA6JFd0q40NEvc1hS2r/kHBuIVXpPUi0D?=
 =?us-ascii?Q?g5QOPgy8lsXDeetHW64NUt1UcisRX1CUPC68bh6DHgh/DZJxzsRc0evW1rTx?=
 =?us-ascii?Q?lgslghzthMJHaGNulDQt5Frkmg0jn1UoB3lGleLeKaTr2EAyKecR8HA94Rmq?=
 =?us-ascii?Q?A869DqmP2L8Hpf7jMBecShGgGasv3ls7J0rMwqp66jIc9UZ7R5LMbz2e85cU?=
 =?us-ascii?Q?LA3UHUmQ9apVwT7vcddaRcRx0GgaAXd03juYUddiTPWa7JQCenmi+qOagcNM?=
 =?us-ascii?Q?zmk+UaR6RFypfq2GezCIo5Rl1JrEfJin066WAelV25ReYF43VLdI2Sjg7RY0?=
 =?us-ascii?Q?RelSToiyJICmYorS96MsUWy/cANAz1NKZIj7dy4NiS1sG6XqSsOe0f5TwLrH?=
 =?us-ascii?Q?3imfbS+QzAxgjCITCzuoa4gDkJyBsUH6+0qJ5xU5RUbmto4l91/aRj/gRBI0?=
 =?us-ascii?Q?0+vzKw4WE+EeewRzIWiq+P6RUS2a7fcxJB3MjpSOx/FRgOWfvNH1vi4L8X2k?=
 =?us-ascii?Q?NDbzfYbWbQt9708a1lyLNBY5Ir75lOehz7o6ayfpCmU1SEsca0XXe2+3BW1T?=
 =?us-ascii?Q?BBkFY3GqfgSAPnSm88nQoLjeg9S/2fkyuTZQ27MsQS4rTOAqNwVN3BCQjVNv?=
 =?us-ascii?Q?5Yb/b/K320LssgxvFxxF6DfLVqKWmeO19fKeRRUaKsrz7mqWH98ADL64FUS/?=
 =?us-ascii?Q?j5Ro7d3/lsVz1LnpTnhKKx0Fdam3rtTQx74ji1I/xbIR1G3Oz6SO1qe1gpzW?=
 =?us-ascii?Q?I8bUv+m6zI/iZsTvy1vunv6bRxBZS3lLpy8YPsE1Ktkb5w2gi6CkgCUodG/e?=
 =?us-ascii?Q?PZ+2WX7D/k68fWaiTVZ/Z1W6VDQl7a4AqfxkjjDPi41M/xWTsvnCjQmtwgyV?=
 =?us-ascii?Q?nl4kklzxOJ58QNUtzlqoYlzgSdkfvE2Lj7zrBNqQvnEhAva657Jqmy2lEqnR?=
 =?us-ascii?Q?2Po79vpa4uE/BuSRzAS8vFuGmodhD+DatQeQFmaNX0EUHPVwcMYPn8HIge84?=
 =?us-ascii?Q?dMzPouJlh5RCgfFSPPPtkI1BADCvk1EGNfGklFaAvCAhzGU2W/5Kt6wpioEq?=
 =?us-ascii?Q?0ihChJ5CGbWBlj9AHcU1o9ExvrDI9eNA+KFmOA81eguyxpoDF+MjHpIOd//U?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cce1906-ecb4-4900-fde6-08dd3fe850f1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 22:08:38.3267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/dPzsVwXhq56nF0jKfJd9Eo8bnHE/RlW/ArcZ0mq5RZrt+P/1KLS4Jrq93yyOmJqXfstf1xhct5c/ltr2yMBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5056
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

On Tue, Jan 21, 2025 at 03:28:48PM +0100, Maarten Lankhorst wrote:
> We're changing the driver to have no interrupts during early init for
> Xe, so we poll the PIPE_FRMSTMSMP counter instead.
> 
> Interrupts cannot be enabled during FB readout because memirq's requires
> an allocation. This would overwrite the FB we want to read out.

So, since this is causing flickering or blank screens and limiting the
fastboot, let's move ahead with this. We might revisit this or revisit
the i915's side of the irq as well later.

> 
> While it might be possible to also run do the same in i915 and run
> it without interrupts, the platforms i915 supports had a less clear
> distinction between display and graphics. For this reason I choose
> only to touch Xe for now.

The other complication that this would bring to i915 is that older
platforms might have other registers or not have that...

But at this time I'm convinced that we need to fix this flicker
on Xe and other irq issues, so let's unblock the progress and
move on...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c  |  6 +++---
>  .../drm/i915/display/intel_plane_initial.c    |  7 ++++++-
>  .../drm/i915/display/intel_plane_initial.h    |  2 ++
>  drivers/gpu/drm/xe/display/xe_plane_initial.c | 19 ++++++++++++++++++-
>  4 files changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index e63619da2e62b..605adc3a30b39 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -796,7 +796,7 @@ void intel_plane_disable_noatomic(struct intel_crtc *crtc,
>  	if ((crtc_state->active_planes & ~BIT(PLANE_CURSOR)) == 0 &&
>  	    hsw_ips_disable(crtc_state)) {
>  		crtc_state->ips_enabled = false;
> -		intel_crtc_wait_for_next_vblank(crtc);
> +		intel_plane_initial_vblank_wait(crtc);
>  	}
>  
>  	/*
> @@ -810,7 +810,7 @@ void intel_plane_disable_noatomic(struct intel_crtc *crtc,
>  	 */
>  	if (HAS_GMCH(dev_priv) &&
>  	    intel_set_memory_cxsr(dev_priv, false))
> -		intel_crtc_wait_for_next_vblank(crtc);
> +		intel_plane_initial_vblank_wait(crtc);
>  
>  	/*
>  	 * Gen2 reports pipe underruns whenever all planes are disabled.
> @@ -820,7 +820,7 @@ void intel_plane_disable_noatomic(struct intel_crtc *crtc,
>  		intel_set_cpu_fifo_underrun_reporting(dev_priv, crtc->pipe, false);
>  
>  	intel_plane_disable_arm(NULL, plane, crtc_state);
> -	intel_crtc_wait_for_next_vblank(crtc);
> +	intel_plane_initial_vblank_wait(crtc);
>  }
>  
>  unsigned int
> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> index 6789b7f140952..b1675b46e06cb 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> @@ -14,6 +14,11 @@
>  #include "intel_frontbuffer.h"
>  #include "intel_plane_initial.h"
>  
> +void intel_plane_initial_vblank_wait(struct intel_crtc *crtc)
> +{
> +	intel_crtc_wait_for_next_vblank(crtc);
> +}
> +
>  static bool
>  intel_reuse_initial_plane_obj(struct intel_crtc *this,
>  			      const struct intel_initial_plane_config plane_configs[],
> @@ -442,7 +447,7 @@ void intel_initial_plane_config(struct intel_display *display)
>  		intel_find_initial_plane_obj(crtc, plane_configs);
>  
>  		if (display->funcs.display->fixup_initial_plane_config(crtc, plane_config))
> -			intel_crtc_wait_for_next_vblank(crtc);
> +			intel_plane_initial_vblank_wait(crtc);
>  
>  		plane_config_fini(plane_config);
>  	}
> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.h b/drivers/gpu/drm/i915/display/intel_plane_initial.h
> index 6c6aa717ed21f..5c315acda2101 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.h
> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.h
> @@ -6,8 +6,10 @@
>  #ifndef __INTEL_PLANE_INITIAL_H__
>  #define __INTEL_PLANE_INITIAL_H__
>  
> +struct intel_crtc;
>  struct intel_display;
>  
>  void intel_initial_plane_config(struct intel_display *display);
> +void intel_plane_initial_vblank_wait(struct intel_crtc *crtc);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index 2a2f250fa495d..41103571b870b 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -8,7 +8,9 @@
>  
>  #include "regs/xe_gtt_defs.h"
>  #include "xe_ggtt.h"
> +#include "xe_mmio.h"
>  
> +#include "i915_reg.h"
>  #include "intel_atomic_plane.h"
>  #include "intel_crtc.h"
>  #include "intel_display.h"
> @@ -22,6 +24,21 @@
>  
>  #include <generated/xe_wa_oob.h>
>  
> +void intel_plane_initial_vblank_wait(struct intel_crtc *crtc)
> +{
> +	/* Early xe has no irq */
> +	struct xe_device *xe = to_xe_device(crtc->base.dev);
> +	struct xe_reg pipe_frmtmstmp = XE_REG(i915_mmio_reg_offset(PIPE_FRMTMSTMP(crtc->pipe)));
> +	u32 timestamp;
> +	int ret;
> +
> +	timestamp = xe_mmio_read32(xe_root_tile_mmio(xe), pipe_frmtmstmp);
> +
> +	ret = xe_mmio_wait32_not(xe_root_tile_mmio(xe), pipe_frmtmstmp, ~0U, timestamp, 40000U, &timestamp, false);
> +	if (ret < 0)
> +		drm_warn(&xe->drm, "waiting for early vblank failed with %i\n", ret);
> +}
> +
>  static bool
>  intel_reuse_initial_plane_obj(struct intel_crtc *this,
>  			      const struct intel_initial_plane_config plane_configs[],
> @@ -293,7 +310,7 @@ void intel_initial_plane_config(struct intel_display *display)
>  		intel_find_initial_plane_obj(crtc, plane_configs);
>  
>  		if (display->funcs.display->fixup_initial_plane_config(crtc, plane_config))
> -			intel_crtc_wait_for_next_vblank(crtc);
> +			intel_plane_initial_vblank_wait(crtc);
>  
>  		plane_config_fini(plane_config);
>  	}
> -- 
> 2.43.0
> 
