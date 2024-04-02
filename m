Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6582FCD1284
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 19:03:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1314910E1A9;
	Tue,  2 Apr 2024 19:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DdSh4R4l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C47810E1A9
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 19:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712084603; x=1743620603;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OGbIoddz/kwm1s6kGPpffegLlEe5Z9xsf7Bbip7rd1k=;
 b=DdSh4R4lH3UV6vyhJ11GLNjZsOOpkkQscsV+VnhpQC41mGRNyYwMj205
 R8pLuwGbNjuzcrUE2wGWvgUdS57RNcp94feR6eAXrkJJCyFRayEdwPPZl
 YKuqCUW7LAUU5mYQBfa+rO+4Z1TRjN0dpyLkLxwpY5GRSfKdZkxGmAEyL
 uz9MSJFZ9/baowdDR+NswxQDZfhhvyAZL99YHdIGTDYGhjAKjhH3GgGzW
 M+yQtlgeNha6i2aquorl+C0NKYMEvl/1u+HjE0RUr+cyiX/ao2ndL6jis
 Kl3+Dm8FF5mb1GBWO0VVozKy7bFol0KX2V8zhRTm6zT8m+BBGGXQSdkpG A==;
X-CSE-ConnectionGUID: VwkHdPEDSTG3X/MHr9j+Dw==
X-CSE-MsgGUID: ixtsq+ImQai1FNf2hJN5gQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="11111577"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="11111577"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 12:03:23 -0700
X-CSE-ConnectionGUID: BctZquu/T1eyEUZFHBoccw==
X-CSE-MsgGUID: WCiic4pMRQm9G0WjZrCMGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="22860387"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 12:03:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 12:03:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 12:01:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 12:01:53 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 12:01:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVRzHcjLcYRKHd7MS/HeD+3KBglMiyF94IMxbINZP5YeDnxQtNTj5ObWHu4n7e1pbC+0Eh+HzXPTOdwz2GpY7tQtUCOoHl4lUD05URndZw34AlcC9ru+tIl1yQAEmtFWd9lseGP6im8ZwebxtHvzfzKlVW9bHG2MHmROg7gxxUJ1H0CVvoBWYSPYswn5mqF2yVXIfeK3lRH7TDdtEnFd/V1oOT2bLqHobD7iB0EJ0LVtaLCRtLzljvkQe7//8w5tdEJsW6sVxcksOPg5PIpAZXmCed/u9BsJecciTTVss/5YxsXFeqz4xyvTeSBd4xCrjmNM83dCCVh78N0K+VP82Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWFJ8rGLqPuo74sLINGKuoerxwN8aqhEm/0hHBx5H0A=;
 b=iXOUW5ByRPCkGOHbtmflLl7EpD9CST5oikXRqpXTIR8UVEOGN+aSCekKE/gka/Xv8bgpRNvUJov/BvH5DFGuc2In4Po+UNVBlybHINa2uULdL62NmtLQ/GqBBYw8wJRecpL3RzG65FJ604ayhlk537ME3rah4EahVTTKm+g6xuXjB7eI+qnmXsu07h/KUD1ibWbg1vaAEx7KNIC6cSyPeECHeNLAFSMzEL/IcLDniHqKCdJUUipzybIAp7o1v79cRfmhh1QmwKFdfwIwFt4R24Dy6MLQP5O7pPPUNBuKT+kzHLER4Lxz1R2g43X7du0AE+cRKwfLxkec/JNZnND0sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 2 Apr
 2024 19:01:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 19:01:08 +0000
Date: Tue, 2 Apr 2024 12:01:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/xe2: Add workaround 18034896535
Message-ID: <20240402190105.GD6571@mdroper-desk1.amr.corp.intel.com>
References: <20240402061129.117196-1-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240402061129.117196-1-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: BYAPR08CA0014.namprd08.prod.outlook.com
 (2603:10b6:a03:100::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB8282:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mTY1JBTPpecgV/ZP5Qc8IQ4SDPtJnrZIfVIPSv0ibuxw3yxgRsrMP8d4GLATHI/yiE3HOvvb05retzKVh5rPPPxQV6TMoky6C1VDY9A6qnnw4pBgDrBwtXunY8w5xpWRO/7MFA6NYEIj2HfvfwN4h2rhjIHdZTK6I0jhHalMkmBksRe8D6E6GK0UXmxNSWQpbriBADvkF0A2K7v1xTdb3Uf4Q+k8puoLtU/MshQrMXDTN4LGKDcFyxKJ5A1XzfqCX7+DcR5Qp5M0bcvF9v4N60UUZ/aoWm6oI5Wy91w3skj0UDB/K9IKlOv11IBuwqlncqzoZOArb+QNXq0tgYn8xV2yF1ggMCssQmrgmFDa9XmAPtiBrhAfW93gERbSu5EilYud9MIdFgtcaFRWnYcK3HsSb0VKJ1AwEHNabtL4wCVQh4fcy1lZxrZz/Xjtpgdup3zqIAhvLa13rUfwEg/z8xaBzew6YLbkF4A/wc8QMz1U2U+J9NXI/OsepLSQBjQ8nkvl7n+BL/3OKWE34YjZw+YoVZr+Xsv171ow1PssqEenxtAhJ+LxkDGT+x8ZOkDzKoS0uGt/JeBOH4Ah8IrWqBPXFf1IoTeRckSnMpobOh2ybrHCuRmSzZLiDmRqU2rd12p9v0RCv1+UoLAPc2qhKFyDI3VK3s/sRazaovAzNfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?idAAO55dJ2X206lQxkH0tW7zsl+F/X9NCL2Juz/uH+6xdN8K+0AeMpksF/yr?=
 =?us-ascii?Q?6013/d3GGYF0gVKt2zbq/Uc8S7yeiyhejgNrgsZQcUDmRmfpHCVqsDU5o8mS?=
 =?us-ascii?Q?i9cnGmZQwBSvPsXfNEl2xbkjddtHLAxyo6fITPQjujw/R+tuJ7+zIM6aG65A?=
 =?us-ascii?Q?FnxsT/bMZGZgGYBz9eaAmgNCbeGCr5WU19mFKjonXUk9rGwGwV/h7bp+UHLB?=
 =?us-ascii?Q?Y8vs7OjZ1Mm+3ud97pFSPAHgpVtE7N64GtWGok8dgLmP9t/IQsofzdLyfNoj?=
 =?us-ascii?Q?gAycTF8vTwkXtiUBTL6V6ZBHCrd6HnH36LkSdMqi1pd59v52aAC2gzaiYtUi?=
 =?us-ascii?Q?y4K9PjJmaUrbA/w4Pirqy9/aZ7FeenPGAibvefhqT2rIkn6nd9TC4CF+Cck9?=
 =?us-ascii?Q?h3NWCzQzNP4unX+a5KK2knDyX2rUkDOJAwTwHIzmOR5d1kWaA2ejjm3slAw+?=
 =?us-ascii?Q?YP43eubrMmqPqf6E2NGBeIuCWVLoGMQ+2HBLvozAA61dhEdUToah3RCDzVjr?=
 =?us-ascii?Q?UWmggc3xnEiFyxk2TAv+LnWwrl2Ge6ZtcZyXdsiQzmWDRY8aqK56XAx4f5cK?=
 =?us-ascii?Q?gu3DMs+anaUxTI2LbWxbDf4fUdx/4GnE4wf/pD7y8GL7qZBjn+kY5orVbtMI?=
 =?us-ascii?Q?sXlU3xJ1FgcKIwspDEpmWfhCKpAcuHkDc/KmMQ06JGozQYCVFwqTNU+Ncxn0?=
 =?us-ascii?Q?r35o4/sZvbyWGzKIKAsL54imBtAtQmBTEpD1FQGerSlOue/JU44qzT5P6pwL?=
 =?us-ascii?Q?rxm8N38p5pT9bQ21IiEE/jWzxjewGRCfYnMKl7+7ZHBmAFGj/EqMYJpe6lQ3?=
 =?us-ascii?Q?E+emHQf0ja45gz3vorYPbspMxL39pBLFL9a5BUfWshx7RTQYoh1N6BNsknZe?=
 =?us-ascii?Q?+ncwx90D+EAtDdcPdYnFpeGI6p5OfDsTdsC34M2lddLiUG7YT0+bkTQ4MoQG?=
 =?us-ascii?Q?oIXl6gFJpvCgQqNLvHhYiSmk4lpdvxEyfqdsGhdpTmYNYsoXwCZ+0W23faFq?=
 =?us-ascii?Q?Ji1e8qUSHwP62lg9rWtp2HcOMODy8xoDZrq4W+Wgksru16pwY844GpSLN+r1?=
 =?us-ascii?Q?2LUDlDkT1dyZGnhw6tww4N9aUR9Yb58irg+g+Na6KCaoD71D16OqmP5Q0yiW?=
 =?us-ascii?Q?IahlttuYQSYsjNMLdpETqqovS8wPM5ocSUNQ+nSctEe2PDtiJ9F/igkmKfJ9?=
 =?us-ascii?Q?IUVYHL3XX8xGgxIhBe3ct+yCklQK255PUMOmkUw4HDCIXCu4Lk1teZlfwMdu?=
 =?us-ascii?Q?hpmYNoE2y1Ov0YqP+4H1hVLrkBWTJzuOPg1ZW8u9Vx1kwfoMGgbEzHznjZEk?=
 =?us-ascii?Q?QeKoSW3tKXzREXHjlDWUI8Yel5MxFTVCvas0LO8ccH15bOK/WbBnKONNpWYX?=
 =?us-ascii?Q?47Z02Am36rktWrNMGJ/wvr2ANReDjCxpAKBmde+zHZbRxgA+nqFoSQhS/OjA?=
 =?us-ascii?Q?EUufMSRYUxohc7ykEvjZu0jCVsreIrpR//3zA15/9ruGpY0UGKtVrFShZmO+?=
 =?us-ascii?Q?wynBFEQ0FWQx4vweW4sarz0SeeseqS0JDpBc6vhAUFl5XLWOaKHrFDj+Kzm9?=
 =?us-ascii?Q?z4BbFQL+cL0jKP6xZEwQLjCOvDGowDNe1P/ZlHSPbkP5ItOJTRsFaX5B/JR/?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0858a21-5a03-4863-f7c5-08dc53474119
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 19:01:08.1094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTRkY41XmZmZUb2eAmNaX2BEToVG+zXGRNRzFm0zKe5W9UA7oower0ovw1FD8hmZ6bVSeL/AcVeTsAI2TeMwfN8s9suWEwuYM6ZJ52PMHC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8282
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

On Tue, Apr 02, 2024 at 11:41:29AM +0530, Bommu Krishnaiah wrote:
> Add 18034896535 as driver permanent workarounds.
> Also reverting temporary workaround 16021540221.

Why are we reverting 16021540221?  It's still listed in the workaround
database and I don't think we're at the point where we want to remove
preproduction-only workarounds (in fact I don't think we even know yet
exactly which steppings are considered preproduction).

Even when multiple independent workarounds happen to have the same
implementation, we still implement them all in the driver.  The
independent workarounds may extend to future steppings and/or platforms
in different ways and need separate handling.


Matt

> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 74b33a3845f2..4d8e0d64cf42 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -423,8 +423,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5, DISABLE_SAMPLE_G_PERFORMANCE))
>  	},
> -	{ XE_RTP_NAME("16021540221"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> +	{ XE_RTP_NAME("18034896535"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>  	},
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
