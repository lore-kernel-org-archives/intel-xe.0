Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08430C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 23:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80C710E8FA;
	Wed, 17 Jan 2024 23:26:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C7410E8FA
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 23:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705533994; x=1737069994;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ogU3Kh8jK0mB74+DnM0o1DW8ZO7HL598y+vVpG1ZWzs=;
 b=kIWvwuFNpwGITp605sRbh8z5sPxmEkOOfWe7yd9YCERT3zVTbV6uOZm2
 kftm6CzskYjbuXfLI23grjrEck0t+VhijO3X76duQYxQHQofrXlHYEkHh
 /K71Hbg9aIyBnUj36Ux1h7FpiK/NQCST85j59hHdBVdh9+M17ViZdW661
 PP1leig37sC1jlnj3upBvxEcu6RTy98JdqM4nFLr9jlcN7aPpLGeeIlF0
 YEvc/c2cODASd3L6eB6QPBP8voFyASEP53AIsvJj2sjaZEOk5qWvHCTSw
 1QDEdpgywzmHx3deARSwoK+cpVxd7HT8JMx3m4KFYVhVbVKc52b+DUyMG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7390389"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7390389"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 15:26:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="927948411"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="927948411"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 15:26:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:26:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:26:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 15:26:32 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 15:26:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hya4V8XheE28mcNKV/iesWXjdT1mvZaXIISK0MZ5hSHidSy0Vow4lsdoNjvkC1Ompi9UF5FCZmBSvV9JxgeqLulkNBPbvmkmiZ0Q58ttWbda3A3J5k4ecpQruhMp9KD/Xkj3l9VAEm7gzmr6xFM4tQR6h812PFIEVnplpWzlpHWmngpx6+DUabTlXu/m2V5HcCsvVAo7RqnKeU1cD4VTuWhSy1cvotQkMNUAA2PgjdUuPzaJU7aBDvL/TgCn3tBobrF9SuMw1sZ+NS2ELMjOdkzOfPhtwMsQwlKGt36E3n1TQf3fZjoskZQPQCF0+yahii0oVsv4BtM4qPB6A9hvTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9Pf8gYHuEA4aAna6Cgbi9QkGM36VA4XbyN99GCqBGg=;
 b=OmW9kCz0W6lmTCLjHj46nQ/z7Ws2Dpa4CaKAkGAr2/nFsFoF6OnYXOUs0bYfoLOuzf6FTjS4/2Nt06KHvt9JtgC2wbUd9frHwvA7lTduShYGFqqX0WyWAPMXohzV4sDfLrpCm0DaQVbW7AnVbxqkX+QozVJE1CDk1HcexqdDF7zhCykjHm/bEbs1DqQv7HtIWlFuU8sF5bPNasReRJWrQvuZjYi1oTYT7UKY0NLPjC6FvF4p7+bPcjejffq3JFC6EBihyR0wsLYyO78JW1IBkCqWebCljX038wAekFEG2CM0LogFYAhOyyjMPoNzwf3zIakutLMTMBSZCJvs+yWJlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by MN2PR11MB4600.namprd11.prod.outlook.com (2603:10b6:208:26e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 23:26:30 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515%5]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 23:26:30 +0000
Date: Wed, 17 Jan 2024 15:26:27 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 3/6] drm/xe: Mark VF accessible GuC registers
Message-ID: <20240117232627.GL45138@mdroper-desk1.amr.corp.intel.com>
References: <20240116145617.1177-1-michal.wajdeczko@intel.com>
 <20240116145617.1177-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240116145617.1177-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::23) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|MN2PR11MB4600:EE_
X-MS-Office365-Filtering-Correlation-Id: c76d109b-0778-436d-cae7-08dc17b3bbd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GfdBqMsNZTb+EvQ5wcwPwvZFf8Ki0mAInmNSHVH8RT1VXzoOWKJRb07CDhlDzZMsLV3Ar/BIZ3p2cCFkdjip5SFZDpM2pbuaJsufpCaqSsPV4+v6UsxWAIEw7KXsZwmnh4g3pThDK8nq6uXZP3jicLsD3f4urWe6NNqHpS1cwEdSY7xUPpnOw1JGbR3JKFyZSwR2s44E/NOncdA6MeNVZuEEi6ihl4P3w3koQLhyFoGNW5KDty2ufoIL279p8ciU4qZ7F5sLVwwHG0LIPZ3shfqGfGfUdrrIGdn4SwXd4TmaSfdwfIdWhAGmcX1G5jTPE7cQgwxbxJzColjrrak85Vp+n0Cov+FCkdSKzyBNMW5kw3I5TYEpl2btrVTsZzQ6L4ZfCjOio80wc1Fw2YJsy9BhbzU8t3pkNOcXaxxUbX+5zZZzoZZuLvXYG3PP9FlwVy3I2J6rKlP6dZzfvtdYWb6/z/zb/aDdsABGSR8JOKGRwp0/sBJTwKXGSDkHCJcBR3uWmYQ+VvWUB7dN2u26kR3CD2l7zKF7oFYFowgPBdXPvYo0dAgnpZqcdtFkqmvo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(39860400002)(376002)(366004)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(82960400001)(41300700001)(86362001)(33656002)(38100700002)(8676002)(8936002)(66556008)(316002)(6636002)(66946007)(66476007)(26005)(6862004)(4326008)(5660300002)(478600001)(6486002)(6506007)(83380400001)(1076003)(6512007)(2906002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jhNkriAONBLkUrGU0a01fbiFQApR9HlCE1FDUqmDlsO9gqzwE81YHTnZ2Zd/?=
 =?us-ascii?Q?KnNND4Q4yqQ92z9oEV7airrbByaDXi7GaYUEjGDQieIR7Ou4g5qeMExlWwbB?=
 =?us-ascii?Q?uMOaF5RMwAPDpdszvk1hTXyh7JJxcM0LEkhnAqy0K/lCe6SIXTQNKCHTUGLU?=
 =?us-ascii?Q?9DmZ3VLOTNxlH+/hs81ogNmLAQhL9MxTs+U9KzVNoHQX1aThASW9pW1CqOBs?=
 =?us-ascii?Q?takUlGONP/hy2PGglK1p0jqKY7UmDfqfuJN4XOg24QL3yHsFRVXfYRHsAC8D?=
 =?us-ascii?Q?ejLDNc18NVqmuhFDUuvkZEplvRumKbxzZPqayNYmXkdgAhkacASy7Gd+FTOH?=
 =?us-ascii?Q?EAlqZXE3cvBRdIvnfBbRRtuiDDF8pFSFAoTN88jMhbEBKTD4pGOCoykYTrGa?=
 =?us-ascii?Q?xqITuC4Dt744kAFwI2fFawnbWzIeI7LLC9cXs255YsFzhhp7gWq7CI0P5bxK?=
 =?us-ascii?Q?kPI8SlVAKJlhr4JT+ArXLhtL8X/2BB4MgexRStVVAOl4enKxPZ/jOWTkzF59?=
 =?us-ascii?Q?gXL72mKY+52T/YUZ3JoKCgJdOtoT8h/qRh2d5rGJYEAYssJrtMwXuBR+FJW5?=
 =?us-ascii?Q?EYf0Tti01+LeMV+3gCjOI6JXPegSCiWDg7rs0T5ot63tblX66XWwpF4+2HxN?=
 =?us-ascii?Q?LaZqNv5wSKt38d5JrszGZgQ083b5A8OlBW1wq4ujEAU1m+QNv9u4QTGTDPsK?=
 =?us-ascii?Q?MQbptGxAwssEWkfO4gv7/miqNi9sJfonoORMWz5YDj5B4KmHYv9Y3o7CPcz9?=
 =?us-ascii?Q?kbiFlSB0UhAx6GO9q7VQM1UauA18CYdJamPD65gb5T7oGZy8RS5dotvAFvHM?=
 =?us-ascii?Q?zlfsOY2enxY1GZCh0VJ/pf1si4EZ+zTr86NmdSpwYsnodFnW0FnRvQNlBffC?=
 =?us-ascii?Q?HhusncGxLuqroZdvsmol8bfczE9TrbvvzMjd9pzU3Vbua7Axc9vxVoR1/j1+?=
 =?us-ascii?Q?JEAhkN4sr0BzMCMclyoxm+wVssQ9NEmGbL1RcZKZOmz2yLGV/2ALOTssfMX0?=
 =?us-ascii?Q?7TeYmvRyd+smVBIZymacbjgLkiloxDMjcDX8zkLYqir7/wOOuVucudTVP5Q7?=
 =?us-ascii?Q?lfsB5CyGNhHM5A762IljmOrtur9QUBWXgOZDzeEI+qQERhCdmpP9oTKBeBLi?=
 =?us-ascii?Q?0EZU4pq9PQmPC4XvvHNrGUa7KD1IV2EGamCvQZPZl+bk+AKq9CUAKBGGJmo5?=
 =?us-ascii?Q?/Ip+xxiVCn4MCi9mU4ya+BjZd7oC9hWDlaLZ1IGpHqNOSgVbeVmY51io+zCS?=
 =?us-ascii?Q?UsPt0WJKVw9KSyjMVRGBQA0yXb+sH4q51J02sc1aZgQzrA55vb5c3lfF38+e?=
 =?us-ascii?Q?2PsgYYghlhqpYe0V8U6mHaPaXaRsY4nT54mxf12zpVL4hEJwGIIzPb5spQ4C?=
 =?us-ascii?Q?sMhun/5JwZMETTBUi3ghN5VduysFq0k+K31TdeQ1xkgDZZDJnWskGQNc4JQV?=
 =?us-ascii?Q?mUYXBBOcLgcDX4R9JTJU0fE3wOqxSCGCBxt1imzsD9rNDSApEAzmmUGHB+kP?=
 =?us-ascii?Q?8MkHf8q6HR1ZeYAakfXXfY6vLRprJnZ2+wmMHsqxhafoZ5czFWTnr3BX/Nb5?=
 =?us-ascii?Q?8BpTYmNG7SuBHHE/QS1zpr0rsAv4ilC0LXPc8dyMcLG6U46YE35GBdmGPdTf?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c76d109b-0778-436d-cae7-08dc17b3bbd5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 23:26:29.8777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVvtQqu/+85q5a2WTfx7kioMbHW3/v1CuFGdzdAdPCtLyOSOPhAmTSLMNoHMhZMO9nD9uEBG0rIQif0NLR3xkMVR7cG1x7sEpMXD2dKFUDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4600
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

On Tue, Jan 16, 2024 at 03:56:14PM +0100, Michal Wajdeczko wrote:
> Only selected registers are available for Virtual Functions.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

It took me a bit of hunting in the spec, but I finally figured out that
folder 53221 is where we can find the list of VF-accessible registers.
It might be worth adding a bspec reference for that since it seems like
a non-obvious location.

Bspec: 53221
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 92320bbc9d3d..71a78a486ac0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -100,14 +100,14 @@
>  #define GT_PM_CONFIG				XE_REG(0x13816c)
>  #define   GT_DOORBELL_ENABLE			REG_BIT(0)
>  
> -#define GUC_HOST_INTERRUPT			XE_REG(0x1901f0)
> +#define GUC_HOST_INTERRUPT			XE_REG(0x1901f0, XE_REG_OPTION_VF)
>  
> -#define VF_SW_FLAG(n)				XE_REG(0x190240 + (n) * 4)
> +#define VF_SW_FLAG(n)				XE_REG(0x190240 + (n) * 4, XE_REG_OPTION_VF)
>  #define VF_SW_FLAG_COUNT			4
>  
> -#define MED_GUC_HOST_INTERRUPT			XE_REG(0x190304)
> +#define MED_GUC_HOST_INTERRUPT			XE_REG(0x190304, XE_REG_OPTION_VF)
>  
> -#define MED_VF_SW_FLAG(n)			XE_REG(0x190310 + (n) * 4)
> +#define MED_VF_SW_FLAG(n)			XE_REG(0x190310 + (n) * 4, XE_REG_OPTION_VF)
>  #define MED_VF_SW_FLAG_COUNT			4
>  
>  /* GuC Interrupt Vector */
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
