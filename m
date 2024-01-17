Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEE1C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 23:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B7F10E8A6;
	Wed, 17 Jan 2024 23:41:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111CC10E8A6
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 23:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705534903; x=1737070903;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1lFcocNsqTy1a0FCLBUibGPm17t4+4bDoqSqmzyjQNE=;
 b=j/ibJaIExwudkkW8KNmnjDNZF8dMf9xz2E03nfrsUzIjj0Mb3N4AraiL
 uhBVzwWUxeHrgfo5ah7r2zRiK7Rmpzvr6vvUgrCrRNKJ1Inn6xHMXX0pr
 NvHKNbaKLJD3K+TwR2qXc5IYb1slOQ/LGZBEGaLRCcTjz+uAsoZnKOH5/
 ba6kGsZcDYViE10tDoctcFJArxAEbfdekJlJ4Odknt4CW2ukOlYZ90Ey/
 66gAohwpnpeSwMEBYIYhk2QckCnrZsYjlophccagSeU99oSqkXHlW4rrD
 RkhxONutsSVIUkKueEV++sZxQ8UUUveTaWkV8viCYkDWqELCrBAVTmfjs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="196913"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="196913"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 15:41:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="784649420"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="784649420"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 15:41:42 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:41:41 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:41:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 15:41:41 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 15:41:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/mr1BuMiRYyXJLIu9LvgaOegdl51zudwO7Z6L7iZ64YMczsE5YKNuNiG+mYNcW9wPKKE42I87xLm0JfVvkcIamMf9oN9020XtprxdSUuhwGM3bh/JEyMiVcyQMEX049aartdyRYeXPADz3Y9JmFqBDgC+0FQDhw/8uPAb+vm3ihC5pc5cz8pvwWMa+mUIUtCV+NE+dOmpGYOT2XBb4rDtDNt1tGtA9u/l/zdwc4SvBjR0p+6DapaAd3eAoHD1luxn0gAwZ5kyL6wFa4Z85eDPVwkKwsEd5GJJKWl2dRJGGui+ZFDjfO+YLZ/af4+8o5PYAfkiV9enkBsveEU6HA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhjqEv2jB2Gxe4H1P0OgKbFSSXw/zifpEagFk4GE9Bo=;
 b=G0YvVFq2F8VJBDcrrRtW7CppKOLu3+jP0w8MH4hfEH4ydvY+jRVgeC7mzQSx+ja9x45+eyEVALoNkMlm6RJfGI/rLDRJB23ieSisVDhS5mjMrNbJhVdFUvyhTHUVpNHzNeyxH4DeRpyjkd1VNOcLsx1N4Ah+bdxDNTSej0wrJI+bsnNJ8XFHOT+nuw1jFjPQWR/NUYns4WwwoDfArmCFz/bImCgjCvX3gvmj85zM+Td3PUyymwiVXmIj/VIRbWzJxf2zsmJzcnOlfZrU1xrT5VSc4ts+/SFxOUJXAxYMd4o2MeRcRCtvvoGIfdyQDPyx5S3DfUnWzHywCqmd1p8drQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB8175.namprd11.prod.outlook.com (2603:10b6:208:44f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 17 Jan
 2024 23:41:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.024; Wed, 17 Jan 2024
 23:41:38 +0000
Date: Wed, 17 Jan 2024 15:41:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 5/6] drm/xe: Mark VF accessible GT registers
Message-ID: <20240117234136.GN45138@mdroper-desk1.amr.corp.intel.com>
References: <20240116145617.1177-1-michal.wajdeczko@intel.com>
 <20240116145617.1177-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240116145617.1177-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:a03:338::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 001341c4-23a3-4e19-1941-08dc17b5d956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T5qM46h8pk5+LNqIzBdrc8cCVv/N5lfv78jzDwJLJF0jFTe3leskgIUkJRuZAlESLvHrQzqwz1zJrxyr+JyZOWc0VDpMpcV9Gp7xfdriYxC9EnR71qRX/i6t4wJga7Zkufnv0kW/SfGNfIu3FwRuUs/MbByfZqczoc108yEu2icT00VFPWXVcQXhCvFbIZc8zuLTZnPq1Xd59m5lbyM6oruJogTmxReOs8Bu91TIKEJKNyJtmUMbi5nAvW90+sjqC3D71ek6/PV1EwlmaeHaRx19pxljc8s6snGjqjEXlkAJcyPA1Jy/VYuhm9OjAa0LqnxG3pF9n7vRbAsslzUlimLQ8I+nKMBeBpVaj7axyB/i2EKhxxozjQHsV8iu1sTuEY0+ASkxWnvuRRv/7PnA9zU+arYy3ki9ngya51Bdbb18pYw/YrFN06zkP3DflXOGMhPmnuKsgzepC3576qr2+a+KArh3u6ZREDTTUwhkQjQREqe5ag2zq4sjFKBI8Y5GPubsCc9Ok4ENCZSaBpeFToywFunM50Ru5lvjQ/xHC555GIDHLyteYJvbw9P7YFDD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(39860400002)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(8936002)(316002)(66476007)(478600001)(8676002)(66556008)(6636002)(66946007)(6512007)(26005)(6506007)(83380400001)(6486002)(6862004)(41300700001)(4326008)(2906002)(5660300002)(33656002)(38100700002)(82960400001)(1076003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qjQ9KfnbONyiTv/ExNXE7sE5Y8iaTcWs7ad8uS7Ny6+61rMHuCUkrIqPLQnd?=
 =?us-ascii?Q?OeukF43rMAgl2qdJ0SzQvSWX2xL4g9uKZltnJxeFOTlPeLnpF5xpGPkhS5F+?=
 =?us-ascii?Q?yBQTIcqqyiqmTDcDiQNqVJFkv4LaeUfvca/ZzjW0eourJxvCd5f8ZYd8W5m+?=
 =?us-ascii?Q?CW3woec+xvj6dcHTotMzfSOTEoeYH9PXylQzhAt5LKB1qr00ckFNqfIeEo7Z?=
 =?us-ascii?Q?fuSyx5W8prsq1kXrFf0Ny4xvGaJQxdgNBfiuLV3bwO13aM5JwnoPJdhlFu6E?=
 =?us-ascii?Q?hL10vN6feqqOvxO+SAu2bV57t4nNBFJF3Pl2VWTyWr5hdnK9mQa+eiFDKeBc?=
 =?us-ascii?Q?abdiDHTX+KWg16tgSmQIFZRT3Ksc35YnfiS7VV2B/CNZ7VDNVdRPUOFvvtrI?=
 =?us-ascii?Q?VLJtxZb0X5ZS7D6szr7zRMAR4hRs7fxuRObqqmoI1DV+gMVFz0hDE5DwQy27?=
 =?us-ascii?Q?P4C+u0h2sh+8TlNURs+LrgNtjZPE6vehCf5DPuhrkXkuyvV91gApkDnoMYmM?=
 =?us-ascii?Q?T7JZ1aeD1axpHzbRE/ld7MZjYvjvovkj7zWqoZxKHf47YlOMVyvzpjTQUQeA?=
 =?us-ascii?Q?GP+NRQuPkjPtc6OZ4mdN+YYQuMbbSfSfq0+52UeWWUf8VtdXKWXx10DpLzSH?=
 =?us-ascii?Q?23mH0NPenya0p3bfNLXvs82ueKCL8Ow6es3wyT+g33x/dxgLcpLgMXztj4hp?=
 =?us-ascii?Q?vwMQdPCc2VVf1dSy9LhwFLvkX7NhpXkaLWgRuWsfGGoX1WjQU9WusFKWACcw?=
 =?us-ascii?Q?XMXqbtSUxBBZ1Of4vEGeANY5Uj+fBKT6xtdC33RSploIfIP7K2eJaFda3MJM?=
 =?us-ascii?Q?dOJS7/hiBD0Jpd76APVlC758HJHvbOZyavVHkc3MBB9OniBWPxTRctGDXVf2?=
 =?us-ascii?Q?zGNYza6l0r88imtWVQONQhSlfqWWEDZFdXoSauCBcgt6WOpcxQWN3MYu9GH9?=
 =?us-ascii?Q?4ZZzB8AQngCKItfZfd8gsW7VtTZl+7NLQ7BGqtqQzKLoQPXSQXpnpXF+2fBs?=
 =?us-ascii?Q?OmKoEwrsDBsGXFda2JCwskQrVp+kb/654NijEYR9jMXAvGSfVHHa2wyeWWib?=
 =?us-ascii?Q?MgDp1HISSU1NVjoplYE2DzCkYzwYcfwTxQov1JdmM047M0OuY5TXezkuHphc?=
 =?us-ascii?Q?y0J4VVMHas41x2JwGLbd2o//hDu2KI7S4uhXWR6V4nxxVZp2K+Nax09wIDqW?=
 =?us-ascii?Q?UlHKVCBE41fv/GkrZavfGyHgBnnJ36YtAtQb4uYTxXCAbLBOP7buCmXr77x7?=
 =?us-ascii?Q?huNwyT3gRG7R5HVTbmG/viN4MSzKdlbnfQ1GTIZIyU9rf7kmwhcdtF+lNrh6?=
 =?us-ascii?Q?IlHO7eadX0veWx4w3RPxgeGQqggsU7CuJ8Zgo6UQDqaM7umf6XrPmwNccqHs?=
 =?us-ascii?Q?G8eWoCoG5cnEpNhNx09KRuiLjC7mHrQvY758VUIDHY6YbPouLgvSuHVt6Rqs?=
 =?us-ascii?Q?OCPytIJUcdwLNQsHyx5ygZCMetMSWONvBjFBGawou9/2CDbPaEwHVpCPIcBj?=
 =?us-ascii?Q?uxXk/aRJQ8285JFupsxEn4CfUwQR2e+MGDZdEEK/+qygv6eZAs1EIkymAe+Z?=
 =?us-ascii?Q?pt17dV4GyXlTmCatBIJAXffjD8gf2bDIPcMQZMCFA0m+ucnsTJv21bfmxDf1?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 001341c4-23a3-4e19-1941-08dc17b5d956
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 23:41:38.3640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glWfuUtVyQuHR0KLjG3SFg74dbhojm0jiu2hPPFnXEDmlkjOoWcJ1jk11FH7jaxfOuXGE1dW3/i/X2g27GRygqi74QMaiPUqNRmWkFGJLM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8175
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 03:56:16PM +0100, Michal Wajdeczko wrote:
> Only selected registers are available for Virtual Functions.

Are these registers still accessible from the VF on platforms that have
memory-based interrupts?  I thought these weren't directly accessible
anymore?

If this is just to support the older pre-memirq platforms, then we may
want to make that more clear with code comments or something.  Maybe
even moving these to a separate register with some dedicated kerneldoc.
Having these in xe_gt_regs.h might not have been the best idea since
even though they relate to GT concepts, the registers themselves are in
the sgunit, so the current placement is confusing.


Matt

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 46 ++++++++++++++--------------
>  1 file changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 4017319c6300..500d96392e8a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -433,7 +433,7 @@
>  #define GT_PERF_STATUS				XE_REG(0x1381b4)
>  #define   VOLTAGE_MASK				REG_GENMASK(10, 0)
>  
> -#define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
> +#define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4), XE_REG_OPTION_VF)
>  #define   INTR_GSC				REG_BIT(31)
>  #define   INTR_GUC				REG_BIT(25)
>  #define   INTR_MGUC				REG_BIT(24)
> @@ -444,16 +444,16 @@
>  #define   INTR_VECS(x)				REG_BIT(31 - (x))
>  #define   INTR_VCS(x)				REG_BIT(x)
>  
> -#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
> -#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
> -#define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
> +#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030, XE_REG_OPTION_VF)
> +#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034, XE_REG_OPTION_VF)
> +#define GUC_SG_INTR_ENABLE			XE_REG(0x190038, XE_REG_OPTION_VF)
>  #define   ENGINE1_MASK				REG_GENMASK(31, 16)
>  #define   ENGINE0_MASK				REG_GENMASK(15, 0)
> -#define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c)
> -#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044)
> -#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048)
> +#define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c, XE_REG_OPTION_VF)
> +#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044, XE_REG_OPTION_VF)
> +#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048, XE_REG_OPTION_VF)
>  
> -#define INTR_IDENTITY_REG(x)			XE_REG(0x190060 + ((x) * 4))
> +#define INTR_IDENTITY_REG(x)			XE_REG(0x190060 + ((x) * 4), XE_REG_OPTION_VF)
>  #define   INTR_DATA_VALID			REG_BIT(31)
>  #define   INTR_ENGINE_INSTANCE(x)		REG_FIELD_GET(GENMASK(25, 20), x)
>  #define   INTR_ENGINE_CLASS(x)			REG_FIELD_GET(GENMASK(18, 16), x)
> @@ -461,21 +461,21 @@
>  #define   OTHER_GUC_INSTANCE			0
>  #define   OTHER_GSC_INSTANCE			6
>  
> -#define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4))
> -#define RCS0_RSVD_INTR_MASK			XE_REG(0x190090)
> -#define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0)
> -#define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8)
> -#define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac)
> -#define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0)
> -#define GUC_SG_INTR_MASK			XE_REG(0x1900e8)
> -#define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec)
> -#define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4)
> -#define CCS0_CCS1_INTR_MASK			XE_REG(0x190100)
> -#define CCS2_CCS3_INTR_MASK			XE_REG(0x190104)
> -#define XEHPC_BCS1_BCS2_INTR_MASK		XE_REG(0x190110)
> -#define XEHPC_BCS3_BCS4_INTR_MASK		XE_REG(0x190114)
> -#define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
> -#define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
> +#define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4), XE_REG_OPTION_VF)
> +#define RCS0_RSVD_INTR_MASK			XE_REG(0x190090, XE_REG_OPTION_VF)
> +#define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0, XE_REG_OPTION_VF)
> +#define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8, XE_REG_OPTION_VF)
> +#define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac, XE_REG_OPTION_VF)
> +#define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0, XE_REG_OPTION_VF)
> +#define GUC_SG_INTR_MASK			XE_REG(0x1900e8, XE_REG_OPTION_VF)
> +#define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec, XE_REG_OPTION_VF)
> +#define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4, XE_REG_OPTION_VF)
> +#define CCS0_CCS1_INTR_MASK			XE_REG(0x190100, XE_REG_OPTION_VF)
> +#define CCS2_CCS3_INTR_MASK			XE_REG(0x190104, XE_REG_OPTION_VF)
> +#define XEHPC_BCS1_BCS2_INTR_MASK		XE_REG(0x190110, XE_REG_OPTION_VF)
> +#define XEHPC_BCS3_BCS4_INTR_MASK		XE_REG(0x190114, XE_REG_OPTION_VF)
> +#define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118, XE_REG_OPTION_VF)
> +#define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c, XE_REG_OPTION_VF)
>  #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
>  #define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
>  #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
