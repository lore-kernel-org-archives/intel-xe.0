Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A86C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 15:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D141C10E631;
	Wed,  6 Dec 2023 15:45:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B5410E631
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 15:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701877536; x=1733413536;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ey7HCbr9r6qbTq0/iZUJGNmIPiefulRc51RS3aWxX3E=;
 b=EbIrS+ZR8zWrxwSTUmkbaviZikAzs80qQHJ0AxDmQrSeW/iEbQZIncmK
 q1VDWPmNUV7eVcbEkPPfBsXR3/xCzECtB8uaQvZFWumtLWJ33WtVvRTru
 G1ZahCp+xqOnL3HRqFbL16HgVoQ2JwGfih7YoBfKaQ5JmCDbzexZx0IN3
 HWmOK0BDhmirpTMJlAPXyoRv9Dio3dQ9288MZewhRVlNCo916gGuoIAMU
 Uv2UJ7+/9B04NtFcscN1W4xQizRYO044DkJ3xYLXaKQzl7NBmB/yNDsuz
 DQV6qgor+2PxAnu0ecmWfSLffXCc13IF9MlF9ZOwSL6+IbUuWMQT3T96T g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="15633409"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="15633409"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 07:45:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="721119407"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="721119407"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 07:45:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 07:45:34 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 07:45:34 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 07:45:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VF1YGj1c56OwGODSBxyUdVE3sz5XUHbSQqd3YEWucht2p/Hc1JqfRxu3+kH5QceejERO0h4E+yo8Md6H1D/FyCfOCTMdxoLiHOIkOBsGMHtiiyp+ZxdknAqjbnusiWcTHNPGzO36qP1gsMDctH6nGa6d9r9zytkVKCMi0w+T4xdRZzlBc4IEAtRLuORGniMEJnXxpIlTnkca6RUn2hAHvv3pgicn9BYwv2ZcKErEfywRoL/n53sd2fTazyOacXYZ9KLKOhkhAwLFNW4I/WpncLlpxV+hZaUpjUEEQ9qRraG4Wt3iZ3MlYHqxYq0FMPz+ep/S6sVWbkAuCWGthErRrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjFMinNfGgze202Bb74LegLRhFGsYMh7m6myP+5V7yk=;
 b=ILb+QN0xMJVHzoT8sOr7wy7XlBVpOxyJ4l9jt2zvtQIz447sAMBGkaReXTSJSLq6kU6E66Lcvfsrr+h0irnIbU1BZdUUZRWKafYdj7n8yVzyqvbnzZPUbUOwoYzSpWAq7JxzGUuScBe0vifTn6bhDwJKACL5tiHKkQJkDhjpe2kfZHAY+vloyqJzqFANS0gbxnuHCx39grLJZSffrSXP/LQbJTgCbVXuPgqlksv/btaLFDEdlKbsm9NegqFe4wPEfwcQCAUsTY/ymGsgJIeRbIf/DLffU4iUDBCrX3Ma6wXfw7ssStJ2z9i6xbQMpcV/I9/hN1pECqZ5eNevDXxwfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB7610.namprd11.prod.outlook.com (2603:10b6:806:31d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 15:45:26 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 15:45:26 +0000
Date: Wed, 6 Dec 2023 07:45:24 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <20231206154524.GW5757@mdroper-desk1.amr.corp.intel.com>
References: <20231206054615.884040-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231206054615.884040-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY5PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c6b941-9495-47b6-1f79-08dbf6725df0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AoDbvbvwlylryawOOTMPx8jjy+o/T73KO91Rx/QSOtNv6+zdVdq7N/ypAV+spxmSUVyLpiUmmUqS5jUKoU0dT4wkeVOT54yaojAl44YpPNUHcnbD6ebnpbFXIVqeZ+M4jIrcGlrCWHnM34zyo+Rik8VYGh6xel4Bn+oL7uSLoVwAY3DfgQ9QzHz5tLa6jBCyhhL2bgMc9xTaw5U853m6eh2R7VziJRX6/XnFqt5hza8xOe5BumIHIRS2V2Rsul24YbXTYjX9vFv2Y1n8DX9OHJwtSHlXhLgqSBD4J1meuwywgNgWEG4n2V/3xWgf37aPaNCt3yTwqeoQsfhzL3nE6LM3xvRHM9zbR7fkCYEctdcZQUe1WVPEzum6P2EY0dD53MoYVN9+w6dOQ5AheVIIEpf29viWl6tpkYiYCUEySDObC8RMYXN1jrpu6UL4JUKEzssim4ZnHSMnoc1HP2eSx1VXJgsMibc28H0sebjArKaa9b72e1ctVnNQD7kkMH3qgonBWIGpSgZzny81JDPhinOF8ZwoGfFPfduW5woGtDHRKv1BoV8LK2lYp5wARV0t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(5660300002)(82960400001)(2906002)(41300700001)(33656002)(86362001)(6506007)(6486002)(478600001)(6512007)(38100700002)(83380400001)(26005)(1076003)(6862004)(8676002)(4326008)(8936002)(66556008)(6636002)(66946007)(66476007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+8nrQB7drS5VNWpBCcStroGp+RBskdbIH2/OvYRcbiuS1kJ8k4PVhDndNxtH?=
 =?us-ascii?Q?9EEd1DDNCj0yalL8lQAr9gUwGjvIDqA7Tu0FILqG9ccRJXb2m9gb16cmf6Qf?=
 =?us-ascii?Q?H+8Y/AxY4ClH67IqIjzWBvmBDsOU0Ms7zbUKwfma9BAhJHsTiI9DwO60K00i?=
 =?us-ascii?Q?izZl3yU4vqK/ceDN+kvRyWFVFNGtr2Yu0Qn3gqUz+V/zz9okSQQsfRfTo2e3?=
 =?us-ascii?Q?MrJHbzGJ52db9iqMTr0NR7MSM6mEccSZDikenlDb6bJG8QM4iJh8/5YYeMxL?=
 =?us-ascii?Q?AfuRm8CyDl79bZn4o+21xDRfdQh8YLwuqK2rhSaVghVvoIUIddjEAvknz/o6?=
 =?us-ascii?Q?AZWG/5TeBH+I1jlnBq6byZZBVQAsWAN/uZrckoVyV/YDfgODQKK2lWdl21qT?=
 =?us-ascii?Q?FlDlFr/CsjiajR4BHm5vfuL13wWCKADYGHi3PKfq550JiE3j1dWjk0plRgnz?=
 =?us-ascii?Q?WTr+HQhm9G44DZ6BfkTcUG+jFV591UmFHKdHU4PedMHJzY4E+we5C4RwF9AP?=
 =?us-ascii?Q?FYkvr2M7ubOv0q1iI1A2TkvBnBJKcSYTQtoKCPWxWuD9S76fdvS2D/hokZW8?=
 =?us-ascii?Q?QRLSNkVypvSboaGmcSLIIrKTe9KPNvAiB4jaPxMUk5bdYS09LuqgjMhhhU81?=
 =?us-ascii?Q?+PQUUtCeS2jEJ7ny0l9kRKNRinmSAknQYcideGzkq0QXHx98npqbKqoRJUY5?=
 =?us-ascii?Q?d2T4dnwsXPYVaQ+QvhV9vTgza7lasCiEQ8pqJtx4/5hyTZ90Nx1j3pnThj7c?=
 =?us-ascii?Q?ji/N3Bwi+mXWNJqsdh/YbyZCC5LiSHbJzro4rBygiSwBlpNUToyuwi2oJQpC?=
 =?us-ascii?Q?JZHv1YVjkM4D7woqcR/eiLRqVpvN4sk/Jm4rvqWcO1Kt4xr9gViyqJ3YxxKk?=
 =?us-ascii?Q?VSp/jzfJsLCKg03jRe503b7KdlnW3AJGsop+4DxeKLKZ2SmhfuSmhQL/ijbX?=
 =?us-ascii?Q?C4JzrWLyB3/4uS0MTnIbQIXBzntHDrUMshAozsMskmblViUVMZOUAiTje7Un?=
 =?us-ascii?Q?VdABHhgBDBOktC34ZxQoZd0FOjJTJhkG3vywt51AyLBlIHzWmd7B+fYsBwSz?=
 =?us-ascii?Q?IaCrw6Fvb53NSD35SDGSFbUMcZw34O1IN5LmYwvoXIkxGdmqY4+NZOsY4JPj?=
 =?us-ascii?Q?5kNcA12WPza/QBbRzIQyeEccEAsdFIRpQOw8KPErrEHNdOjz657IAh1nq/MY?=
 =?us-ascii?Q?HHNLncIXVlckWJpRCzaw9CgT0/68pvM1QAspfjAABXss0BGAhNdY+DniFGRk?=
 =?us-ascii?Q?qJTtz1IumfNBFRVBUE+2h2rYPyEMEpvUmoK6mGwaQGWGIAkVaP45NtDLZ4ig?=
 =?us-ascii?Q?IB6I2hH8zgGpFc/5pV3cqFakmErMFxhojlHl5AWfinTFRBr/jRknqWDGTILx?=
 =?us-ascii?Q?5RVKaizuWYlmtlgNXs+aNedfRMMfmP5lbaFYdVQujlSCAOSdZIBng8nByVKc?=
 =?us-ascii?Q?FWay32smLKE9dUVloHuyM4qP5MlqvgmyA6BoTfvu9F91TC/tVvlbKKmy0W8Z?=
 =?us-ascii?Q?qp99MQm932BJIZ5Sk0Is3/EXk9JLDxXHrjKnjyCEqd6I6q2bk7sW+Ar14Dav?=
 =?us-ascii?Q?UvSiR3vkx929VubETKWBypkf7eXBdEYDQk7IFNEH6bHgBn8uzgf9f7QRQ9Ot?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c6b941-9495-47b6-1f79-08dbf6725df0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 15:45:26.7044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7CxSZMPCIGg0TgulQqTJUfxmsBgAD+4E931XhTcDGpSryar8swGtjK5y1Plv/jkHs1FtrfM4HJPx4fCz4U2dGGBvgzoAMM0CUmH4JMP6Ks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7610
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3] drm/xe/xe2: Add workaround 18032095049
 and 16021639441
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 06, 2023 at 11:16:15AM +0530, Tejas Upadhyay wrote:
> This workaround applies to graphics 20.04 on all engines.
> 
> Workaround has three parts :
> 1. Pipe flush before MI_ATOMIC - This part isn't relevant to Xe
>    (at least not right now) since we don't use MI_ATOMIC anywhere
>    in the kernel mode driver.
> 2. Memory-based interrupt masking - Memory-based interrupt processing
>    isn't supported on physical functions, only virtual functions,
>    according to bspec 60352. So this is probably only relevant once
>    SRIOV support lands in the driver.
> 3. Disabling CSB/timestamp updates to the ghwsp and pphwsp - Workaround
>    is added by this change.
> 
> The CSB reports to gHWSP and ppHWSP have been discussed as part
> of a different topic on some internal threads and we've confirmed
> that neither the KMD nor the GuC firmware use those for anything,
> so disabling them is always "safe" and should have no functional
> or performance impact on system operation.  The same is true for
> the timestamp updates in the ppHWSP as well.  Given that, it might
> make sense to just combine these two workarounds into a single
> record (and single patch) and apply it on all steppings. Disabling
> the reports for RCS on higher steppings doesn't have any kind of
> negative impact and will simplify the overall situation.
> 
> V3(MattR):
>   - Combine WA apply same WA for all engines, no performance impact
> V2(MattR):
>   - Mention detail in commit message
>   - Reorder bit define
>   - Improve bit naming
>   - Remove workaround part which isnt relevant
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_wa.c               | 14 ++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 444ff9b83bb1..ecdbc04a2d91 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -40,6 +40,7 @@
>  #define RING_NOPID(base)			XE_REG((base) + 0x94)
>  
>  #define RING_IMR(base)				XE_REG((base) + 0xa8)
> +
>  #define   RING_MAX_NONPRIV_SLOTS  12

You still have an unwanted whitespace change here.

With that removed,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

>  
>  #define RING_EIR(base)				XE_REG((base) + 0xb0)
> @@ -47,6 +48,11 @@
>  #define RING_ESR(base)				XE_REG((base) + 0xb8)
>  
>  #define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4, XE_REG_OPTION_MASKED)
> +
> +#define CSFE_CHICKEN1_REG(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
> +#define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
> +#define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
> +
>  /*
>   * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
>   * The lsb of each can be considered a separate enabling bit for encryption.
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index ce897f2d49be..23f1285135b8 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -596,6 +596,20 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
>  	},
> +	/*
> +	 * These two workarounds are the same, just applying to different
> +	 * engines.  Although Wa_18032095049 (for the RCS) isn't required on
> +	 * all steppings, disabling these reports has no impact for our
> +	 * driver or the GuC, so we go ahead and treat it the same as
> +	 * Wa_16021639441 which does apply to all steppings.
> +	 */
> +	{ XE_RTP_NAME("18032095049, 16021639441"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004)),
> +	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1_REG(0),
> +			     GHWSP_CSB_REPORT_DIS |
> +			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +	},
>  
>  	{}
>  };
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
