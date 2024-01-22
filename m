Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D1EC46CD2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB72910EFF7;
	Mon, 22 Jan 2024 21:40:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDE410EFF7
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705959620; x=1737495620;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xfiNHILvPXTptcC2cjrSjLTDvDeQ4g+JQ0Z6BklxJWE=;
 b=cQxDbs/V2jZX24ApzMmdjEzveXRtNuMW3T3iGQwv1TcQhG1/FqZtcR/z
 ax57DV/EfdA0MZhP+K5boAm9EYOIdVBpwSNm8UEg3wPCCwtUR28mc4PVt
 TWTovoK1PLLoRH6OdFJ6a0vNfNGDdZIZw7Ruvv5QuhdanCZ5oUzMo1hoI
 BJiSo53X/I6GuAWmpg92QGbZjzzhygcueEyyFMTJaqJYYTiVnPz9eH4uO
 QQoY/RoEO7/xEo5Jn+2d9VG5nG+kurWu4vG3YPZ17hFZGdsRivpQiINWg
 x8BsMw9/KXdX6Ya3wuHaU2A1wlKYbg4YoWX3uWb63cQCRfGYSNl65sRSK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432493355"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="432493355"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:40:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1443169"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 13:40:03 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 13:40:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 13:40:02 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 13:40:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXFd5dU2wNKigDkDYKfqzTRARn75Si43+x+6MMphA81TnwipShEH3tM4LYqO9EhTCnHbocEb8o0gPLfm6pLS4iu36jgOaWxdv/W/RPue8j8ef1Yze4PD86tCMvwrsuUVQwIi55exEYOclw0I4+DOKy1N8y/7+12+soTfFmD6ok48TYp1JoCqjgSIDxxjIp1314YlosQXFvdYG5PL3iqtuWeJfSmC8TLbokHfX7SHGSUl1VGHo3RBllaoziG5gMNvHE5ea275J0dBHHb2CUf/oPbu+iORcSWDvHfQmspNCvqjuJW42c0ksqwYDfQldkFWh2cmgHK06fCBVxS1PKCjDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jt6ijsDMQ4hUaGEF+AQca0ZUj9/KVAfRrOPJIkWtszQ=;
 b=kkuibsM6cz4pjYWqFS1kDjHSUBVGZmR2Zn0GhvZawisyPviHFlWATUMx29LOXlvrRDMQRhNc/nY7TlArJAgd4ZpokunfQ1bLiAGI1hozhTXJIM18ud87u9gRLI27NXbQVw1BBN/8fxlwqJdjAKkjxcckFmY4zEXlkS0bNw+JcNByCN9hVrM0Eo38kWG99nW2VwETCoHli5FAmlZrJF0vjDCkUD94l6cMOM4P4DqRY9ai/KxjiAn3ncwisMHB3s90U0pmU+mLIcdouspJM5t7uxqvjEfei9rlyj+uLac4WwHHuAyg4eQneCBiACTyAfDFA8eFqJCdbhah+1GKUI7ZUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB8047.namprd11.prod.outlook.com (2603:10b6:806:2fc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31; Mon, 22 Jan
 2024 21:39:59 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 21:39:59 +0000
Date: Mon, 22 Jan 2024 13:39:56 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: [PATCH v3 1/9] drm/xe/guc: Add register defines for GuC based
 register capture
Message-ID: <20240122213956.GB7083@mdroper-desk1.amr.corp.intel.com>
References: <20240119004203.393262-1-zhanjun.dong@intel.com>
 <20240119004203.393262-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240119004203.393262-2-zhanjun.dong@intel.com>
X-ClientProxiedBy: BY3PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: ebbcf3d6-af89-4cd2-cb1c-08dc1b92aeb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XEX/szQg65wXSWfcw+XgLAnY/qouD7KxXtc2a8WDrNKWjvnv5zNcTPrZed4pwxzooV8XflkQUO9hISLBN4ljwkcqMXl4KGHeKzb1AUB4xMI+UHAGP5MvoluoKh3gnbaq0d8FQJYNvj7oJoq9UewtEEpJSUdaQf22snCoquz671EBXBzLWgvarLVozkXHenboqLLXx0JRTK/hL89UZ9EGOoWqNojjCV2oHAiq4Zv1Hu8d9F5ODDm2r2U5M3CRh9fqlF4O/GBw4SmPpcjl/ppTIgezof5jLbZagzTLEqTuQxNISUj+rP4FFE0CL5EIQhLXyPfSLdgWuUfjg+uPzgTALt4HOrU5lP0AYGKtgXR/m+YduA6+CIN26yXuGswypuGMNY6c4LknKMiyguwHxCpIpnHyTBOtdFft3AAnbl1va6SuasxNSYHAFdvn2HWGQvmVaIS0pc1V8IwPg8Rlyq2rKb3itd86woa1OPg9CyX2R698DwkHSD9/eMenhrT0MSAZDQ/4Xyau2tLY+NQGozmqBzl332WHPBiJhWzWaVgf8Ucy1Zcdpz7UIWwzt5e1MZl5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(376002)(136003)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(86362001)(82960400001)(33656002)(6512007)(38100700002)(83380400001)(1076003)(26005)(6506007)(478600001)(316002)(6636002)(6486002)(6666004)(66476007)(66946007)(2906002)(66556008)(4326008)(8676002)(5660300002)(6862004)(8936002)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?phxg0pVxoeRZtSK9O9iQpotoqdqs1+FPKwNdpBfZtmYuH5V9s4HJ877H82?=
 =?iso-8859-1?Q?guTZ8Rta/fYaCXvDVlj7sZWZJiAY+/6aY60x/KeiNiVoJghPEyDjhg6pg6?=
 =?iso-8859-1?Q?IuFHHNcRuwBxQ67dPAEOI9oToKjVADIO6rx3FDRkSGGuWI/Clpx+3qxFN7?=
 =?iso-8859-1?Q?jZ2Pn8MVA73JpbTZJomL0P3m6Dp9cvW1+8nS84EJPJsIEbqV1lC4Aof7Qg?=
 =?iso-8859-1?Q?0QbM4AH6OnEx0EKpYqbUg79udRrXQKkN0FFwR16+N9ziykxHa4GvREz9Gi?=
 =?iso-8859-1?Q?wRg08rRQJ9r45x+aru4I40U8yNDY0uLqrjVbY1tvQVoRMMPjS9lBORhmNk?=
 =?iso-8859-1?Q?cC9V3Q8tgYW06IMlyGPsF/NHXS4J3JaiO6fKLqWYUJbEX4b4uz45v8JLZG?=
 =?iso-8859-1?Q?bF8spV0q2JNpOhjx/CzVc7+7fcs6NlHuE6+sZRTkoKeDS/1Jg2KCGDPiSx?=
 =?iso-8859-1?Q?9e5ev+Ub0ZfbKINHLwT8XCgYWqs0F+oo9ig1mG3Jri7GMX8UUsWQ/eIhSW?=
 =?iso-8859-1?Q?7euHi0nBvuUX7795A68C57LoUqAmFk8q+qgRl67DSOZE7fxeHuxl9kHs3l?=
 =?iso-8859-1?Q?H01QWS6CqjYQ+nRKL6g/quZdBf5nNQDqLuirXh1PGTga54PS8/Y+hVfGZL?=
 =?iso-8859-1?Q?NFu61JRwL1NLFTMgPp8C+eXf1u+4J+Jae0g8NcpUkG6iODUvAry9r+tGYa?=
 =?iso-8859-1?Q?EAEEglh7PM86MdjMva1Eer7dS3ZYpHtJQPz2RbwM3gvmWn2OkUTzCKGZwf?=
 =?iso-8859-1?Q?yxPb2xEUK2fczOqT938f7EKp2cMEWodImRZZyFFuzIZsa6NPrPFCk88U0H?=
 =?iso-8859-1?Q?kexNCSuJ0e7Nl60Xso4gvxvQ3t53nFwnCJdDBNxEm+XXgVnAc6WwDJsz7L?=
 =?iso-8859-1?Q?LSwRtdM8LaSQTugZiyQ90/Tnr+eOwge7JDMOAleUtPsvQROxBHXnird3Fs?=
 =?iso-8859-1?Q?X+6hHyF/zpcQFbFwrMRgoquNz8oJmCkBo3rbB0Xqs6Kk7f/6VgH+IRzKNZ?=
 =?iso-8859-1?Q?Gr0qF0csSa3w5/pDna8FQmYYT2haBp50Au0B28wohAt3dW8cGK3VESEeEo?=
 =?iso-8859-1?Q?t37RLBxEoFeOTyEYbRYSG19nObN1NqkUxE/w646c8JY8s8m1ubdMswYuEm?=
 =?iso-8859-1?Q?JVwWrNuiJZ1AG2BnO8wSxq8bN1dBrcQn+lb4xdaLg2/cNqjO6juVE6Gtxf?=
 =?iso-8859-1?Q?/PycPFJdUi2eAWSOk6XDOMQGJb+NHzME9yRAWHOi6GGe2U2u7NGMhmprsB?=
 =?iso-8859-1?Q?gf6gnnFfHM27wMajlc5WPPBiakOPJppjvf52AMlgRUwm4cd0l9ehmUUhkq?=
 =?iso-8859-1?Q?E0uRjQTOtBAJfyvBCVBu8R0jQQ9FBjQHG6pqKT4dJk5gsXhVjfeq1qk0RR?=
 =?iso-8859-1?Q?oo5yzjof3uFZ0YGCuk3R0+EeFNqz0pDGOS57b72tBCKw1Xbcp7ngDx7uVY?=
 =?iso-8859-1?Q?MbWGb3nFGer2huLYOk3lSni6wR4O9qqzixbVy3UcszTGnVrcXDZ8umf4s6?=
 =?iso-8859-1?Q?z2sPIwkoj/g2mxiXIn5KHjyN57hnFNkR/1S+9r/V006Jf8k/fgFzbAqfNm?=
 =?iso-8859-1?Q?NtlUHeqr/C/TANDjNXg59MSoduF1LqV5/g3jaqLCDAlXpgGkODKCFVtjBQ?=
 =?iso-8859-1?Q?MAQmi6DRhwBFkgyk1Cvatn9ucO1EaXNtMFStK0Gp3c5m+NjhOyer/6Uw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbcf3d6-af89-4cd2-cb1c-08dc1b92aeb3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 21:39:59.1691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nW2LIV/sI7LG6kkNDx4vvtJ+ebGFYqzJ/pHnWLu6R1rlPQuqc/2LUolngQcTou7PSfVwh19kGSfCh1BkEDHegQLiH12wsP/4q4wP/4TJD/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8047
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

On Thu, Jan 18, 2024 at 04:41:55PM -0800, Zhanjun Dong wrote:
> Add registers defines and list of registers for GuC based error state capture.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig               |  11 +++
>  drivers/gpu/drm/xe/Makefile              |   1 +
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  12 +++
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  20 +++++
>  drivers/gpu/drm/xe/xe_guc.c              |   5 ++
>  drivers/gpu/drm/xe/xe_guc_capture.c      | 108 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_capture.h      |  15 ++++
>  7 files changed, 172 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 1b57ae38210d..236763569877 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -83,6 +83,17 @@ config DRM_XE_FORCE_PROBE
>  
>  	  Use "!*" to block the probe of the driver for all known devices.
>  
> +config DRM_XE_CAPTURE_ERROR
> +	bool "Enable capturing GPU state following a hang"
> +	depends on DRM_XE
> +	default y
> +	help
> +	  This option enables capturing the GPU state when a hang is detected.
> +	  This information is vital for triaging hangs and assists in debugging.
> +	  Please report any hang to your Intel representative to help with triaging.
> +
> +	  If in doubt, say "Y".
> +

The commit message said that this was just adding register defines, but
you're actually adding new files and build options as well.  That should
probably all happen as a separate patch.

>  menu "drm/Xe Debugging"
>  depends on DRM_XE
>  depends on EXPERT
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index fe8b266a9819..6182f89a6bd5 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -92,6 +92,7 @@ xe-y += xe_bb.o \
>  	xe_gt_topology.o \
>  	xe_guc.o \
>  	xe_guc_ads.o \
> +	xe_guc_capture.o \
>  	xe_guc_ct.o \
>  	xe_guc_db_mgr.o \
>  	xe_guc_debugfs.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 0b1266c88a6a..06015703a33e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -64,10 +64,16 @@
>  
>  #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
>  #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
> +#define RING_IPEIR(base)			XE_REG((base) + 0x64)

There's no such register on any platform supported by Xe; BDW (gen8) was
the last platform that had this.

As a reminder, i915 dumps a whole bunch of invalid registers and data
that don't actually apply to any modern platform.  I think cleaning that
all up has been on the todo list for a long time.  At least with Xe
we're starting fresh so we can make sure that we're dumping just the
registers that actually exist and are useful for debugging, and make
sure that we're dumping them accurately; we don't want to just blindly
copy/paste register dump stuff over from i915 since a lot of it is just
unwanted bitrot.

>  #define RING_IPEHR(base)			XE_REG((base) + 0x68)
> +#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
> +#define RING_INSTPS(base)			XE_REG((base) + 0x70)
> +
>  #define RING_ACTHD(base)			XE_REG((base) + 0x74)
>  #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
>  #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> +#define IPEIR(base)				XE_REG((base) + 0x88)

This looks like the same register as above, but a different offset that
hasn't existed on any platform documented by the current bspec tools.
That means this is probably an old gen3 offset of something; definitely
not the kind of thing that we should be putting into Xe.

You also don't use this definition in the tables at the end of this
patch either.

> +
>  #define RING_HWSTAM(base)			XE_REG((base) + 0x98)
>  #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
>  #define RING_NOPID(base)			XE_REG((base) + 0x94)
> @@ -111,9 +117,12 @@
>  #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
>  #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
>  
> +#define RING_BBSTATE(base)			XE_REG((base) + 0x110)
>  #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>  #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>  
> +#define CCID(base)				XE_REG((base) + 0x180)
> +
>  #define BCS_SWCTRL(base)			XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
>  #define   BCS_SWCTRL_DISABLE_256B		REG_BIT(2)
>  
> @@ -129,6 +138,9 @@
>  #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
>  #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
>  
> +#define RING_PDP_UDW(base, n)		XE_REG((base) + 0x270 + (n) * 8 + 4)
> +#define RING_PDP_LDW(base, n)		XE_REG((base) + 0x270 + (n) * 8)

What is the goal of dumping these?  I don't think they're relevant for
modern usage are they?

> +
>  #define RING_MODE(base)				XE_REG((base) + 0x29c)
>  #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 0d4bfc35ff37..46e3395f57ef 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -67,6 +67,8 @@
>  #define VE1_AUX_INV				XE_REG(0x42b8)
>  #define   AUX_INV				REG_BIT(0)
>  
> +#define AUX_ERR_DBG				XE_REG(0x43f4)
> +

This is a multicast register.  Also it doesn't exist anymore on Xe2 and
beyond but you have it on a "COMMON" list that implies it would apply to
all platforms.

Dumping registers incorrectly (e.g., printing a single value for a
multicast register that actually has several different values) is more
misleading than not printing the register at all.  That's why it's
important to make sure each register is being dumped accurately.  We
also need to justify why we're including various registers; i915
included a bunch of garbage that nobody cared about (which was obvious
since we dumped incorrect values for some registers for years and nobody
noticed).  We should keep the Xe list restricted to just the registers
that we and our userspace partners would actually find useful.  Adding
unwanted registers just increases the maintenance burden and will lead
to Xe's error dump turning into the same kind of graveyard i915's
became.

>  #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
>  #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
>  
> @@ -94,6 +96,8 @@
>  #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
>  #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
>  
> +#define XEHPG_INSTDONE_GEOM_SVG			XE_REG_MCR(0x666c)
> +
>  #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
>  #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>  
> @@ -110,6 +114,10 @@
>  #define   FLSH_IGNORES_PSD			REG_BIT(10)
>  #define   FD_END_COLLECT			REG_BIT(5)
>  
> +#define SC_INSTDONE				XE_REG(0x7100)
> +#define SC_INSTDONE_EXTRA			XE_REG(0x7104)
> +#define SC_INSTDONE_EXTRA2			XE_REG(0x7108)

These are multicast registers too.

> +
>  #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
>  #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
>  
> @@ -299,6 +307,11 @@
>  
>  #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
>  
> +#define FAULT_TLB_DATA0				XE_REG(0xceb8)
> +#define FAULT_TLB_DATA1				XE_REG(0xcebc)

Also multicast.

> +
> +#define RING_FAULT_REG				XE_REG(0xcec4)

Ditto.

> +
>  #define XEHP_MERT_MOD_CTRL			XE_REG_MCR(0xcf28)
>  #define RENDER_MOD_CTRL				XE_REG_MCR(0xcf2c)
>  #define COMP_MOD_CTRL				XE_REG_MCR(0xcf30)
> @@ -317,6 +330,11 @@
>  #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
>  #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>  
> +#define GAM_DONE				XE_REG(0xcf68)

Ditto.

> +
> +#define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
> +#define ROW_INSTDONE				XE_REG_MCR(0xe164)
> +
>  #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
>  #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
>  
> @@ -484,6 +502,8 @@
>  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>  #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>  
> +#define SFC_DONE(n)				XE_REG(0x1cc000 + (n) * 0x1000)
> +
>  #define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
>  #define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
>  #define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 2891b0cc4f7f..63587db6a548 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -17,6 +17,7 @@
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_guc_ads.h"
> +#include "xe_guc_capture.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_hwconfig.h"
>  #include "xe_guc_log.h"
> @@ -290,6 +291,10 @@ int xe_guc_init(struct xe_guc *guc)
>  	if (ret)
>  		goto out;
>  
> +	ret = xe_guc_capture_init(guc);
> +	if (ret)
> +		goto out;
> +
>  	ret = xe_guc_ads_init(&guc->ads);
>  	if (ret)
>  		goto out;
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> new file mode 100644
> index 000000000000..cacd50f4718a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021-2022 Intel Corporation
> + */
> +
> +#include <linux/types.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "abi/guc_actions_abi.h"
> +#include "regs/xe_regs.h"
> +#include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
> +#include "regs/xe_guc_regs.h"
> +
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_exec_queue_types.h"
> +#include "xe_hw_engine_types.h"
> +#include "xe_gt.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc.h"
> +#include "xe_guc_capture.h"
> +#include "xe_guc_ct.h"
> +
> +#include "xe_guc_log.h"
> +#include "xe_gt_mcr.h"
> +#include "xe_guc_submit.h"
> +#include "xe_macros.h"
> +#include "xe_map.h"
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR)
> +
> +/*
> + * Define all device tables of GuC error capture register lists

The tables below don't really make sense yet because they don't get used
anywhere yet and it isn't even clear what the structure is (i.e., the
the "0, 0" part doesn't relate to anything else in this patch).

In general it would probably be better to approach this from the other
direction --- add the general infrastructure to just dump the registers
we already have definitions for first, then follow up with extra patches
that add additional registers and include them in the appropriate lists,
along with an explanation for why each set of registers is useful to
dump.


Matt

> + * NOTE: For engine-registers, GuC only needs the register offsets
> + *       from the engine-mmio-base
> + */
> +#define COMMON_XELP_BASE_GLOBAL \
> +	{ FORCEWAKE_GT,		    0,      0, "FORCEWAKE" }, \
> +	{ FAULT_TLB_DATA0,	    0,      0, "FAULT_TLB_DATA0" }, \
> +	{ FAULT_TLB_DATA1,	    0,      0, "FAULT_TLB_DATA1" }, \
> +	{ AUX_ERR_DBG,		    0,      0, "AUX_ERR_DBG" }, \
> +	{ GAM_DONE,		    0,      0, "GAM_DONE" }, \
> +	{ RING_FAULT_REG,	    0,      0, "FAULT_REG" }
> +
> +#define COMMON_BASE_ENGINE_INSTANCE \
> +	{ RING_PSMI_CTL(0),         0,      0, "RC PSMI" }, \
> +	{ RING_ESR(0),              0,      0, "ESR" }, \
> +	{ RING_EMR(0),              0,      0, "EMR" }, \
> +	{ RING_EIR(0),              0,      0, "EIR" }, \
> +	{ RING_EXECLIST_STATUS_HI(0), 0,    0, "RING_EXECLIST_STATUS_HI" }, \
> +	{ RING_EXECLIST_STATUS_LO(0), 0,    0, "RING_EXECLIST_STATUS_LO" }, \
> +	{ RING_DMA_FADD(0),         0,      0, "RING_DMA_FADD_LDW" }, \
> +	{ RING_DMA_FADD_UDW(0),     0,      0, "RING_DMA_FADD_UDW" }, \
> +	{ RING_IPEIR(0),            0,      0, "IPEIR" }, \
> +	{ RING_IPEHR(0),            0,      0, "IPEHR" }, \
> +	{ RING_INSTPS(0),           0,      0, "INSTPS" }, \
> +	{ RING_BBADDR(0),           0,      0, "RING_BBADDR_LOW32" }, \
> +	{ RING_BBADDR_UDW(0),       0,      0, "RING_BBADDR_UP32" }, \
> +	{ RING_BBSTATE(0),          0,      0, "BB_STATE" }, \
> +	{ CCID(0),                  0,      0, "CCID" }, \
> +	{ RING_ACTHD(0),            0,      0, "ACTHD_LDW" }, \
> +	{ RING_ACTHD_UDW(0),        0,      0, "ACTHD_UDW" }, \
> +	{ INSTPM(0),                0,      0, "INSTPM" }, \
> +	{ RING_INSTDONE(0),         0,      0, "INSTDONE" }, \
> +	{ RING_NOPID(0),            0,      0, "RING_NOPID" }, \
> +	{ RING_START(0),            0,      0, "START" }, \
> +	{ RING_HEAD(0),             0,      0, "HEAD" }, \
> +	{ RING_TAIL(0),             0,      0, "TAIL" }, \
> +	{ RING_CTL(0),              0,      0, "CTL" }, \
> +	{ RING_MI_MODE(0),          0,      0, "MODE" }, \
> +	{ RING_CONTEXT_CONTROL(0),  0,      0, "RING_CONTEXT_CONTROL" }, \
> +	{ RING_HWS_PGA(0),          0,      0, "HWS" }, \
> +	{ RING_MODE(0),             0,      0, "GFX_MODE" }, \
> +	{ RING_PDP_LDW(0, 0),	    0,      0, "PDP0_LDW" }, \
> +	{ RING_PDP_UDW(0, 0),	    0,      0, "PDP0_UDW" }, \
> +	{ RING_PDP_LDW(0, 1),	    0,      0, "PDP1_LDW" }, \
> +	{ RING_PDP_UDW(0, 1),	    0,      0, "PDP1_UDW" }, \
> +	{ RING_PDP_LDW(0, 2),	    0,      0, "PDP2_LDW" }, \
> +	{ RING_PDP_UDW(0, 2),	    0,      0, "PDP2_UDW" }, \
> +	{ RING_PDP_LDW(0, 3),	    0,      0, "PDP3_LDW" }, \
> +	{ RING_PDP_UDW(0, 3),	    0,      0, "PDP3_UDW" }
> +
> +#define COMMON_XELP_BASE_RENDER \
> +	{ SC_INSTDONE,		    0,      0, "SC_INSTDONE" }, \
> +	{ SC_INSTDONE_EXTRA,	    0,      0, "SC_INSTDONE_EXTRA" }, \
> +	{ SC_INSTDONE_EXTRA2,	    0,      0, "SC_INSTDONE_EXTRA2" }
> +
> +#define COMMON_XELP_BASE_VEC \
> +	{ SFC_DONE(0),		    0,      0, "SFC_DONE[0]" }, \
> +	{ SFC_DONE(1),		    0,      0, "SFC_DONE[1]" }, \
> +	{ SFC_DONE(2),		    0,      0, "SFC_DONE[2]" }, \
> +	{ SFC_DONE(3),		    0,      0, "SFC_DONE[3]" }
> +
> +int xe_guc_capture_init(struct xe_guc *guc)
> +{
> +	return 0;
> +}
> +
> +#else	/* IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR) */
> +
> +int xe_guc_capture_init(struct xe_guc *guc)
> +{
> +	return 0;
> +}
> +
> +#endif	/* IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR) */
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> new file mode 100644
> index 000000000000..3caea2c6fffe
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021-2021 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_CAPTURE_H
> +#define _XE_GUC_CAPTURE_H
> +
> +#include <linux/types.h>
> +
> +struct xe_guc;
> +
> +int xe_guc_capture_init(struct xe_guc *guc);
> +
> +#endif /* _XE_GUC_CAPTURE_H */
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
