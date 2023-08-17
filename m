Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68794C3DA4D
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 16:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1C610E4FC;
	Thu, 17 Aug 2023 16:20:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090A110E4FC
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692289219; x=1723825219;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ntCPOzPN+fK7x2ezuSKP0Xi3ibhfJdlc1Lxjfr3XQGw=;
 b=kjYZ9pwd38TBiu6t+a7SpKxqDtQKdXKEHbcMbQmeYsiCF/Xm/sMCv8fQ
 /BHFjgepEvOWwEwRAiTnda3nGC9Swof34liKeUJzwzemhjtEuHeMDfz8G
 FzeXqidKGGGmSjNcbUjXTFE2hr+J6PKw+5zvXwxOk27ZlX/iKSVaDBwZ+
 E4ldV9c5oi9tK+0548Ho5ljdXVCUQsEMw0GYshWmy3sfnS/mutn2MELx4
 QWtbigZk2rOwvBj7wmeFRBLRdiW7hqsb+jbvPXywEQ57iQriCIFRw9/n+
 qElWe0skfabK45TLb7MGUgOX2niUVP9kD2nnL1ue11BDii81FAhdGy1F4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="372849423"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="372849423"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 09:16:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="769715833"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="769715833"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 17 Aug 2023 09:16:33 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 09:16:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 09:16:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 09:16:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYO2BbkkH/hUsH1oU0W1lIEGc1Zl+6KIhSiHNacS2vr6mqkwxiB/B+k1chqqdWm54qZj/LH1y+FSlkQ3nP/CS2l71MyWqT5p4bIsBD4m8ynV2JL8wHmdh/k0d5+DFbYO3hrjU6fLE5ttwRzNYuKFGJy4Ni7D4qZXZYz0047iHDiTt3AXBOt4TrzZ2B4lWJC957LCmrZjdOfKIrCVB1KiYGMj0ZBMwKjDpwjK1IBLFRQWxJ3Lfn1CGmJZadJqTpPiKJwX0lEvoEDIR/bCP6ETmcVYltERiv+7qu2KJlY22J6JicRDWSu0RWFQZV2NUucFRV4kES19+uSRdzLWXQj7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugodgUucsxjALJ4PhypZlequ+0P4cqGR4eFS9xPvJgY=;
 b=cnS4ROjTIRnMgnrJmDUw3wAPWbq8PEoVZW0bOgjZ+k6081+ZXZv7q4iINHmGEGTb0xFDtAV+O6Dtn2Qe27kmRR7xcHn3EiZ398wqXbI8OZ68I8XSglO/parPI4cLDrCaa6aWAjSP+rftvXBssYU6REes6CUfUCsEA1cl/RkS6itF2Y2C4kRUEoKOG3I5FYVIs5jfqEIJ8zXOWi3+xUKfx7w0gfqTijcXTQgm27Iywhzi0RUR2dbt+H3JkjgipXxwC6VpBOeTpqvzpCbxkxM1mC/Xd6tExTDvAwINdX+ur5G7kmFdS0c7WHhcgrkXM4sf6ic6r0+wAI4fTYxV6Cf0Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB7049.namprd11.prod.outlook.com (2603:10b6:510:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 16:16:31 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 16:16:31 +0000
Date: Thu, 17 Aug 2023 09:16:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20230817161628.GB3375865@mdroper-desk1.amr.corp.intel.com>
References: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
 <20230817110352.7601-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230817110352.7601-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0058.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::33) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 684582de-c0d8-4fb9-7756-08db9f3d518a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zd7xuJ8AhuPA3cc2azxdWbTyITFNPdHC3joJ//xE1wz3Al8hg0JmSRA/v8CHRXKZSHrUMsCMoxybMWZ7xdrIWxzllFfkT4wXi5SA4xsgxeRay9Nxt7ilwwq6asjDl3OUOMCNmft0A1CMAUes5KEYu60QsURehaZ+6I2AFL/R2kqW6LRSQ4MowDrRWB6RKCvZXMQ4+hzV/qwjLqyQRrNwrGNayVoJ2k7k0mhISyXuKjXddcrI5iQIrQN1TLU++5AwwCXoZbNwGO0b/3CmJb/PdyUfWeFM7YNDFti5gg5jS9PZ4ySSrTq5EGVp590VbWwn1561wVlIKWXM1YlwfTQZ2QlxyxxX84hkjkCdEymkPeA/02vOYtQMxQplhGuzhrCWmxjmcDPqHgWXS9HL81RZXQSM0pLKUJ3CVZwyvKLj/zL2+5Q4OoMxS+/NvL6f9zxx5jXqZa0MvOBTWZnr5yYWXXnjsodtR4Wpc0HK9nVrDJvbQ2dOQowZRJgEKXLd45MoC2veTJMxHqniJCgk3XoC/tQKqwBJVluGmjMinUFBh2FXDTWnIHStd46WSpegkSPu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(346002)(136003)(366004)(186009)(1800799009)(451199024)(2906002)(66946007)(66476007)(6486002)(6506007)(66556008)(316002)(26005)(6636002)(6666004)(478600001)(5660300002)(107886003)(4326008)(6512007)(41300700001)(8936002)(6862004)(8676002)(1076003)(86362001)(33656002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P13mdSZA4WY6HG7g8UUFa7gx/8gWYFoFLd7l/NiWa+cfyBFyg1jNZqgCVO/P?=
 =?us-ascii?Q?9+14kp4PnXGL+QZ665qFf6Bd1ir3c7ZGMDUe3bgSfAe1rIYl+jHQnuIPBR3u?=
 =?us-ascii?Q?FyROt86jvVCOg1yO+tN9fvWaSUBEy3FsvoIzoyFlctJ9pll7v9st+OG5LnYR?=
 =?us-ascii?Q?yAPp3IATpQfY7IX3uIMZctq01dYGZd6xaqOJI/1h8miEJ112OaL9RywvWzf6?=
 =?us-ascii?Q?0SAmCBCvpXX/L7g1WHk99dRZ1vy5WxPwB0Miagz7IJLjOES5OHuKlZXnziUq?=
 =?us-ascii?Q?x292SBB4GkRSQ/xpNIrxdHhZn3PNJHytNGnnm6zkgxc/xfb671ErGBdK1HWk?=
 =?us-ascii?Q?cVPP9k08A0TgWQpoyD4QhDZ3E8fXmqdFwHn8cCf/K2nd9sllAIAPiG/va2er?=
 =?us-ascii?Q?zhF1hVuvWs+Q+vDZ2Jq1qi4tuj5SoXHZuHpBuiNlpuaCCZjhYklhNLPGGWrC?=
 =?us-ascii?Q?Apf1Yw7jYDiyTLB/t0lYffRcCfIOEPPt/CrSw+SdqI7aBrnWa9Miicj+pGwX?=
 =?us-ascii?Q?IVDsJgB9se1xYkoB7MccdIk2lYCeCgyV/h/sb9pVGKDND3wcsN5e40fTaUqx?=
 =?us-ascii?Q?q4K1JUZ9wXODWrGjUOHf6Yypvhg96f6ZShkpr+KEtgh2kTJaGDCd8OUNK5Ae?=
 =?us-ascii?Q?AAqzszcb1XdEZrsp+zr2mOeA99SMhJl8ky1KbdML22PgN9uWwLJgndldWsQa?=
 =?us-ascii?Q?OMC0EjheHx5jkZgKKgBc/ayvz/dofBl9V552uBzFrsu+v6xL3kviKXT/0EsQ?=
 =?us-ascii?Q?v4BJflSew+//URnYxmBO8LBIzgB2LSXkOhWhmMYbHIZV0cr0FX0fV3zD3XXx?=
 =?us-ascii?Q?VuBzId1aWErFPakp5Lp244BYtxT9Q2Lmw2eaxbrhS5v+qr5u/jbDNtYfz8D7?=
 =?us-ascii?Q?N2sm9opv1JksVL7Na4Zu+cnes7mNtcfHIMKL6Z4VoyG7zvKLbz2rlsiyKpaY?=
 =?us-ascii?Q?DW//h3B0lNedoCrXVlqd92Su+q1Evmf9+1sGjxcitFzNppavE4wjpO0Kg2f8?=
 =?us-ascii?Q?thKxoC53WB5K5VPF0pOrdwBvqH1w9M+Uo8MoBH/9Gt4U3NXe6BlLC3+v6pLL?=
 =?us-ascii?Q?7ZIpdV4oMWHVQI6mGbc4BO5SGEblW6Sz0El7qXF+0L7Z4Rd9gTQUcGi1SbLX?=
 =?us-ascii?Q?Iv833tIf8uYT+2etCtmneQX+My01k9wO7XziWe1jrbcfhMbrnQ58bcXb+VHF?=
 =?us-ascii?Q?36N+g6F/lAZekI4nQ3LVrS9qmn9PBwl91EKGNtJ/80eOvQGtjs/8FnO4Iuno?=
 =?us-ascii?Q?pz3bQYPGRiwztXkmYMVmhiMNeMhWXCmRl4sBz2bRHZ5GsPqkX9Ge3E5Jg64n?=
 =?us-ascii?Q?P/yVfJRe6dKPcmrB7qsTp3Q3s+h8caIM3nykHGPO3/W7hQ5L/U59AH1jbF7h?=
 =?us-ascii?Q?V+OgNQpgCdlpp7uyXI2Ql+kuzLWRtBOrR/PEIcZ1vhGKw7Ww+0f2oiFXvUcy?=
 =?us-ascii?Q?/GCnIbSJtAUPBUXooyKiXOnkSh839LcmnwSXDXB/f9Arc8T2ZFMrtER0PBLR?=
 =?us-ascii?Q?ecQw6xaP2kg1B8SjVa+sUuKRUVR+gt1fKyDEw2WTurob+OQQRddA1woWP1nK?=
 =?us-ascii?Q?lS64heXtcCgma1uzE1Exfjf38yhIoMrHN7RKZssCvONRGEBPf9F3L1mHZP9O?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 684582de-c0d8-4fb9-7756-08db9f3d518a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 16:16:31.4531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMjnn1ZqJKHMlww6hl5iCF1fbz8c628qRbV5O/a7rFMudkp+TQlm2aFci002Ckvq+yXEZ4E5800zYt92i1FYLEqCXYXHhyXl40Ooq9/3wno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7049
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/3] drm/xe/pvc: Blacklist BCS_SWCTRL
 register
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

On Thu, Aug 17, 2023 at 04:03:50AM -0700, Niranjana Vishwanathapura wrote:
> Wa_16017236439 requires the BCS_SWCTRL to be privileged.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index e83781f9a516..94a2228bf873 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -50,6 +50,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>  				   RING_FORCE_TO_NONPRIV_DENY |
>  				   RING_FORCE_TO_NONPRIV_RANGE_64))
>  	},
> +	{ XE_RTP_NAME("16017236439"),
> +	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COPY)),
> +	  XE_RTP_ACTIONS(WHITELIST(XE_REG(0x200),

Rather than open-coding the XE_REG here, I'd put a definition for
BCS_SWCTRL in regs/xe_engine_regs.h, and then use it here, similar to
what we do with the RING_CTX_TIMESTAMP whitelist.


Matt

> +				   RING_FORCE_TO_NONPRIV_DENY,
> +				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +	},
>  	{}
>  };
>  
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
