Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC8EE6781D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 20:08:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA5810E63E;
	Tue, 12 Nov 2024 20:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLU47B4n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B287210E63E
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 20:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731442134; x=1762978134;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aRz+iqlu9ZM2STiqwNBOhAuN2C9j25LmgZSUdp4Jrx4=;
 b=jLU47B4n9Knei2qFApbC/5r8B8CbKz0paAfhMVo0o//bb7mmADXnp7vl
 v6Clp7eFGoW/IXGpCIb2PHcGakhyEE4294RMwjMYzbuagNbGaKVEkrMXg
 oo0rSnJnLdkJuRyEDl6RX/oTT/Shc7ctBdXzkgcmhU5RE+VRYy89kIVBv
 /guAuEfOwIqj2DsBNBVeLHeTITgcQj6JT3KRB7zi/76AkYqo1qbb9/ZMh
 lIBGq1pZErTqbxO9VQ9bi30NRhWihOlSIzADA1pcQXL2R0/DG5mVvJESK
 IV9VmBADJvJZwIQPBULizjYnhyCfz6z6LA2W9hFhFG5kmgEIHAABsTTMP Q==;
X-CSE-ConnectionGUID: TY12Q/H9RrCqHbR+sYBvDA==
X-CSE-MsgGUID: tfu99RQ9T2W2FfewUX1ZnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31070859"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31070859"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:08:54 -0800
X-CSE-ConnectionGUID: gNKP/+T4QjiOSS3TEKed0Q==
X-CSE-MsgGUID: WQu1NI/SQ3mT7VUaJFU7zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="92598239"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 12:08:54 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 12:08:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 12:08:52 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 12:08:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmDSvM4Zs3WkEWOdToKkWssTRFkb3Ant/iq4ebRAyWYLRkVp9h555omMJ1BjmRhsTyAWslEyJTxZrTUrxZuhXU9pX1jRHfkfjCpAaT4EoI4ZGiSVhSDHTQQj3bTGHfzZLkpQ9MH2sH6pVtmZq33g/wtiSKnxs/rGgIJeQnhnOeI7f8DLevYxDFwDe/b2t7UNQTduebMmB6TAO2KtZInYqUJ3e/xFbI62ZqW1NyQy5ZJII9WZxKMXbFlY9xkzkwKW1kQonDLu/i4xls6zjssCjAbAVHNQQ3t6OcsKPB/vU2IrfY56h4mZq03xbvYeRYjNaowTwIaaxF5kbJjZQES16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdAF3XUpdzKkaCVL5885tPw8rLWpJK5CwqSL7ggKus0=;
 b=nCQ9zgHOFCoeaTMrL7m/WxCiaUQVIUzSY619XsLSzBjqz8RNjkyvOht6Yq7ICihoE+Zywy8cpuTnAXG3kyW8nzLdXRi8AcGOTaOUdf05DJSl5WqfLCHVRloMvPQf/6IfrGannURf6kwaQ0pkAjbPfaFf9yxa0dpKi/2yHkByf3r093tFkqwesAXxriM9wrjadkEvBpBGF9iNHw2SIG83yWV0ODaKlrAg19dMlLJCqnllXTokf8kTd+LkI3yTuuKCJ1Nui1wyU36rX8+XtMkQf4WShdnHDUABKHRusr8cRTrNPyH9Ej7K/fmCyJWyB6eZxttmsAYawYjxAXpu+ChyXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW3PR11MB4521.namprd11.prod.outlook.com (2603:10b6:303:55::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 20:08:48 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 20:08:47 +0000
Date: Tue, 12 Nov 2024 12:08:44 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Mika Kahola <mika.kahola@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/display: Pcode sets the CD clock frequency
 voltage levels
Message-ID: <20241112200844.GI5725@mdroper-desk1.amr.corp.intel.com>
References: <20241112132411.491540-1-mika.kahola@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241112132411.491540-1-mika.kahola@intel.com>
X-ClientProxiedBy: BYAPR02CA0055.namprd02.prod.outlook.com
 (2603:10b6:a03:54::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW3PR11MB4521:EE_
X-MS-Office365-Filtering-Correlation-Id: 19fd829d-25f4-4f03-feab-08dd0355d110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4TV8narirkTm2RWOBrHLZ5iwIdluY2yORNIYgz2JSl9Oxsdvycnjm82xvcQJ?=
 =?us-ascii?Q?nMC1lwefJRsV9FJlwKG71gXvmyJGLwG30wqCKu9F5fVJItx+sh85Ffcwk+eJ?=
 =?us-ascii?Q?5f19TrMzbgSlQfQ52xUxoWHY+potJel0j2im6HdBQ0nD0E47afsaezt8PthJ?=
 =?us-ascii?Q?PSIKJcykRDkyJkGa2ThfbTrTzLPP8PiPx2dlzI0ltd1NQyhc8Zs+WS+0aQRO?=
 =?us-ascii?Q?e8444ERgfaHOWJN6EHN08g+HEFRzSUyNYwV6ZmEVEyPKnRIsY03/rNmsyR5f?=
 =?us-ascii?Q?qAD80o1dmvx+BX4zOpEU7FpyAg39BYhO4YBJb072vQ7c5nEk6EMHXMj3TjP4?=
 =?us-ascii?Q?XEiAzH7VazwhKmBjH3XkEg2IWzrNLAaPpnd9shdBblHmzoKzyTC6Bf+Zw73H?=
 =?us-ascii?Q?j88zwPyL6GySRIhYot6Z8sMVO1kkP831ZSCINMYzzMuIKIut/F0isiAJ4tVW?=
 =?us-ascii?Q?n+Vx/DyHv75FWKjOFBZAcmi0W87l/blr78tbgVS6acDg5KWJGcBz9TDctYct?=
 =?us-ascii?Q?Az5+Ryj03c5WVXJiLxWOwUgDWjLNnb/f5r73T0btTzudNuY14Usnlu/ngKs3?=
 =?us-ascii?Q?6Grx0rUg/+t+PPGgwToSOKK8HmqKQUvwkB0p8CRAOntGyYqmlF9S8VUUfNGR?=
 =?us-ascii?Q?Wsx0jwUBE3Wy3yd06vXVadmVrBae4kwF0uZ0uUuHcd5tI6XePGFi/k564XqI?=
 =?us-ascii?Q?rZuGvdLPabi/QwS7ZDl0ygROzBXHHoSw5QN2QTqssJdoHB6d6gwK7ZahX54G?=
 =?us-ascii?Q?deYeTJsRJYVgwbCKEhgqH2YGFOUC5dfkI0CuClXQGzfEPvQsTvcuH88nVs6F?=
 =?us-ascii?Q?JwZWKyVSCD6dcApgwhvn4PuPwfYDtxR2vulfU9Temle0ErRap+WnJRtZHzyi?=
 =?us-ascii?Q?x1FaxvhulHxBoSioBUN3vnwH8YX8C1fd/A44zsYfAawmO+KihsUHXw0UgzCy?=
 =?us-ascii?Q?T8fR/i3uRC8DrtwDrtyQ5zueFh0khfwqiO55QM/b6KOMGleHTEe/xEmfahjD?=
 =?us-ascii?Q?LhQhw8Ql4OA3c/UYvtu+G7PQLRhQiVEz185J/oAG96H2DFAqDfVutwQbra0a?=
 =?us-ascii?Q?rLCkpnYQnYMaU37PS4LPho4oKItZ9tJnKlB2iDe7vI8juahE0B690Cv6IbdQ?=
 =?us-ascii?Q?h3XlbjahMb+H8R8I8YGB0DMPJ8ulBGBGydEqtPkqxPB6zhHZ0ToP4jof/F+O?=
 =?us-ascii?Q?gK3QQz5qdmmthRKQ9p+XCT553W5AL11lyH5nocl05WNP94apHn9hKXrmWMBG?=
 =?us-ascii?Q?ZIKWh7OvSnfL/095XeyfKyMISZD8F9+M2a4OpRzUQ9BsjzlqiIltht/mYRUz?=
 =?us-ascii?Q?+PzUzN+vH9eBpKKNM2VqHra1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EI6jw3Z62hu/28Q7AqIWnkhHY2P7eNT7kiMc/jZ52EUF+uoWfT6ybmCFmshx?=
 =?us-ascii?Q?oo+AbgobzugZSZXXMZdGcWfdUnnEmCyESibQ1Oiccc+JHxA8684NUBtveDQg?=
 =?us-ascii?Q?fEPeqHbej5VHVnH7SP51TiK5CyR7ALc9+4b6adRv0MaT+Y21X3Zjgk5TAMPJ?=
 =?us-ascii?Q?AxV7ioWmgUUwSRQOngbE95mGhqqOr72mVokCRV74LEhjjNbiyyjn504GCEH3?=
 =?us-ascii?Q?NGDOSip2AdI3EwMB49GAF0rDy1Kr/GqcZGEn0YVvAogtseLP4Gj1z12rM3SD?=
 =?us-ascii?Q?MZdNY4mZzmR9C3geICYGbMpinoNrZc/IbG6Q3XtbXe4YZjb3YkcORb2XlzRE?=
 =?us-ascii?Q?7w3RmIXz0xAke0zBsCWRK61G+ZE9BgFl9X70eKSINvLIRTrc/XALKxDZE36R?=
 =?us-ascii?Q?u4UYuT/aac6WAbm3fM7wC/zgvXwvBscyQG0lrDZH/CKnwSO6ivzbenrnJ+oS?=
 =?us-ascii?Q?SnwTQefbYIuQoZFhmZJZ0PQR2owUKmukKoqlz5WQ0IfOsb7CraOKHQqjXTN5?=
 =?us-ascii?Q?gCq3fLk5VxZ6426YLNDAhEHtbSBf85j3pjilVDqZ3Dz9NZOKcdyOZDB2Txkm?=
 =?us-ascii?Q?inwOCos8/T/x6Q8be14cpjGlFrRsga7Rq7+YEqWYkn3NiYMJDM988DDgybRW?=
 =?us-ascii?Q?veQwyzaGIA13PexcAjBC+8CD8ddp5FK8KMVNitY95YWYf6P20u7k0+7G1Pr9?=
 =?us-ascii?Q?gYgAE6xIr8QhjlZ3/hEISKWFYHC5AGxSx+BZAMxCKqz5FQ+C4bH2dWTrGk66?=
 =?us-ascii?Q?3uBqje8lZ8ijvXitxcRABXBWix1LFjqmWb81LakSxO92IoshOFd2oVu9mO95?=
 =?us-ascii?Q?N/ORAtGVClicMQKHdx1pXxCixhvNsQXQN0ypOrWSYZhZKsxy/V3uR7oNewwY?=
 =?us-ascii?Q?UK9aHK58usQrEnofJd1pZzzwptcImF2gfdZD0JRSBA8eT8wHRWEU+dzMdk7c?=
 =?us-ascii?Q?JX/Ivt2WDtUqespAGaJIIIpA1fZZY6XaJX3OBbw5cKd1XJ0vb57Nf3Fp18uY?=
 =?us-ascii?Q?JvZL0lB6KwvQApxpx8ZVhvY8tCksaFX4XmfWbPx365DsvCuGS5Si047sKKEX?=
 =?us-ascii?Q?9YpnRct5WxulswvJycjif+KePX9tRsEg/yviiormrZIdQBKFKRDW4+kIKaGP?=
 =?us-ascii?Q?jNyKjlJfT2GErdVo/pyD9mWx52oFf2PF6shg65dHdBEoPiuVUMiBYkzUgjI7?=
 =?us-ascii?Q?aXc93HE5mo0hmA+sl/mJT3TKDgcZ9Lc+y3YqC8glgEJjpcSKu//IdngaKcz2?=
 =?us-ascii?Q?53TQT2+nX9wFim9Py4LA/rOOT4IPW/S46x5bgrygg+NaFvW3tcIsvJQs+Xqs?=
 =?us-ascii?Q?YuAlzyfYax1dyNYwBbAgh4NJ3MipFzU4rYZ0NsYLMiOVCzd//d4mr39Da6O7?=
 =?us-ascii?Q?/mcB1ZJP+zGlcq729DI64RgyH/5kfdhrqIDg4U4x74YzKP631OuUNkzrYw75?=
 =?us-ascii?Q?kFGDEXzNzjYCJtJgPIXeBy2/JlT3QTwyI7H4UcOpCmMt/Jh810RMgnXgtkts?=
 =?us-ascii?Q?1mnF6CE06h+cPQE26o/4yMlf2CV4eCxnDxR6De8dUecwndgXlkujoY2GMvy5?=
 =?us-ascii?Q?7pDc2Chw7whk3ojfbPWMjEiwVmKTKRxhvJR6bZ8worwKV2gB9DbavuLI0wPF?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19fd829d-25f4-4f03-feab-08dd0355d110
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 20:08:47.3130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7M/+lx5OmmX1HQHwbbe6F2PtxP5hkYOV/jPJMCBRcstjXVdkKpuHWolCnrkCmTJfK1mt65y9jjLaJIcba+1bXyF1z5G34y+JdB71kuVpwt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4521
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

On Tue, Nov 12, 2024 at 03:24:11PM +0200, Mika Kahola wrote:
> On xe3lpd the CD clock frequency is set by the driver
> without setting voltage levels. Previously, we had 4
> levels of voltages to choose from. However, having only 4
> levels is rather coarse and we may end up consuming more
> power than necessary. Therefore, these are now removed
> and choosing the correct voltage level is now handed over
> to Pcode firmware which is able to set voltage level with
> higher granularity.
> 
> v2: Leave voltage level calculcations untouched as it returns
>     always 0. Drop only voltage level nofication to pcode (Ville)

Can't we just drop this patch completely?  Since we always leave the voltage
level as "0" on Xe3 and beyond, the existing macro does exactly the same
thing as the new one you're adding here (OR'ing in an extra 0 has no
effect on the resulting value).


Matt

> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 5 ++++-
>  drivers/gpu/drm/i915/i915_reg.h            | 3 +++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index 5a4c8c2410ae..325100cd3130 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -2497,7 +2497,10 @@ static void intel_pcode_notify(struct intel_display *display,
>  	if (!IS_DG2(i915))
>  		return;
>  
> -	update_mask = DISPLAY_TO_PCODE_UPDATE_MASK(cdclk, active_pipe_count, voltage_level);
> +	if (DISPLAY_VER(display) == 30)
> +		update_mask = DISPLAY30_TO_PCODE_UPDATE_MASK(cdclk, active_pipe_count);
> +	else
> +		update_mask = DISPLAY_TO_PCODE_UPDATE_MASK(cdclk, active_pipe_count, voltage_level);
>  
>  	if (cdclk_update_valid)
>  		update_mask |= DISPLAY_TO_PCODE_CDCLK_VALID;
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 261f388b49c7..8e4aa5584adb 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -3539,6 +3539,9 @@
>  		((DISPLAY_TO_PCODE_CDCLK(cdclk)) | \
>  		(DISPLAY_TO_PCODE_PIPE_COUNT(num_pipes)) | \
>  		(DISPLAY_TO_PCODE_VOLTAGE(voltage_level)))
> +#define   DISPLAY30_TO_PCODE_UPDATE_MASK(cdclk, num_pipes) \
> +		((DISPLAY_TO_PCODE_CDCLK(cdclk)) | \
> +		(DISPLAY_TO_PCODE_PIPE_COUNT(num_pipes)))
>  #define   ICL_PCODE_SAGV_DE_MEM_SS_CONFIG	0xe
>  #define     ICL_PCODE_REP_QGV_MASK		REG_GENMASK(1, 0)
>  #define     ICL_PCODE_REP_QGV_SAFE		REG_FIELD_PREP(ICL_PCODE_REP_QGV_MASK, 0)
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
