Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B12C25B7E
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 21:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEA810F1FD;
	Tue, 28 May 2024 21:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDiZu6VI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4E110F3F0
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 21:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716931125; x=1748467125;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ceK7WS1fdQ0wstU6fKrInZDMxCrDGPpuhtJrVf2luIw=;
 b=PDiZu6VIKxT2cJzYwbrS3iCo/NvJV5VJIYALYWQD9fqc1eFM1iy/+OKV
 6wljaADVgl+mmYInC05jtg75koh25wozTps+Hj6P3L23pCH4DfkKAcuHO
 Xy6nBN2t4+0raBZK/VFrxCAFcxIiUc6dsIotpEM2EDSyDouOgeXDUrvHr
 2aiY8VEyGfG0gazTvU7fTRozLaXBjWCKGf9hot0RVmsQ7UWXNc5TLJRAT
 l41D4ad9XJVV7J5YR/SvRufvVN2BZFjwv/GZGy093Wrd3Ip8mtRCNTIj3
 UMfMExi37uQ9A/YsEulJPzAq1Gtmn9BIw8meHTlSBarHwjU1dJjiRDQZb g==;
X-CSE-ConnectionGUID: 5OG3UkymSYSM8a3Ut2ReRw==
X-CSE-MsgGUID: PYQImICWS6qprwjKWenDgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13489142"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="13489142"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 14:18:44 -0700
X-CSE-ConnectionGUID: JVWFEyfTRjSUEZeCrfrhgg==
X-CSE-MsgGUID: W4kqhfdISYGMHi/YuT8POw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="39647970"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 14:18:44 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 14:18:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 14:18:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 14:18:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U96J6gZQotmBhN+0yek/u1LGXOSaJS00TKKFITBcwqJf7VqMjyILbLwLDL/mGBW6F/hb/deNc8RAZfxeSHzbyF4RWegGaoIaN8AiJ54sULVmDIepIO50Ft88eyguEloDoVzunr+cpELRtQSovZXDt1v+wr9/dJ4GUlv9oesvGzqlzuzoGet2+iS1YvJFY6mkAaf5erzsWEXyfHnvmrKTHojZ5q+X/k67H3SxJ6bi81P1ttE13rqQnZbHB4Dm5qiLHJwYk7JJ3Rh6Il9bV0mjNqq3hwDe8VofwjIAwuj48M8lGjO/1optF+LGMh4C8xs5RQfJSUybc5+xYV1G1ClqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsfFwJpZupTxVlhU9ze4L9qEsXOGT3QRRvbl1vqtaYg=;
 b=jX7CUhIbpvpEM8Si9O7Vv1qNgCpfG2uD/w3uRSb/GP9wtnq7QKQ09htqqsxO2tr7TfEFR6UTkZiHD/P0TJdqY/WUinGVDMReuD0D//YWS7cbQXW6iFb4S+DSOgpHVgOfzCB77lErs8KiBkPSKB3pH40iF+JIegewy3Ls9bx4+Qa/MUFdXyC6OC0Ze2I1gYb4E75p3iQ9vu2xiqdExsBiinFjSDagYOeznEIH73wSODKoxSUjbiUVIEAXo8vqhrlW5UMQAxh6vMPj0YRNLoSskRMCDzAMm4yo7eJlkeu8Ayd3vk6d3TarMbzDeTNvZgPTYWTuVUhn+a4lkWDxzINSqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB8502.namprd11.prod.outlook.com (2603:10b6:510:30c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.31; Tue, 28 May
 2024 21:18:41 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 21:18:41 +0000
Date: Tue, 28 May 2024 14:18:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/xe: Move BAR definitions to dedicated file
Message-ID: <20240528211839.GG4990@mdroper-desk1.amr.corp.intel.com>
References: <20240527173554.1108-1-michal.wajdeczko@intel.com>
 <20240527173554.1108-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527173554.1108-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0360.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e89e638-9cd1-4cdc-5f94-08dc7f5bbfa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gwFblBedUV4t7zujrrWspHE1XxdvuSNSKCptUBqSxD81uvUZRNPnvQw5AQ?=
 =?iso-8859-1?Q?IvBHzS9lwbx0idfyE477t/rPI361nfjB8GSsBG3NVHaFHGBxsrQStzxMF/?=
 =?iso-8859-1?Q?PYKqcp22PGm/DDkspwL7nteIHyIvk4sPfGlqpiUp7uf3TFa3+wobzYg+89?=
 =?iso-8859-1?Q?HP9N0hpA2aVTEi36LvGlP+B7TKM7QM+ji5zgWl3aXYkurf0mC6/GEEfXsl?=
 =?iso-8859-1?Q?s4oWqyw1zjqfazcZP/Q/UbcKksqY3/8D/QPuM0CdPiN5ST1pUlS+riMmi7?=
 =?iso-8859-1?Q?pskfN5ZNuqv8f1/Csn/DORPNaq73K+7RlImY8McdZ/0H0FtFMZxlX2V0e+?=
 =?iso-8859-1?Q?ecbE72sDnV5oHQLxSr9uzulWXg9/3f1O0htI7JWqenZLopDtAQ36nFzlTa?=
 =?iso-8859-1?Q?OIB/odDTiQ7UCrnS1W8as/78VPe1ggXEOZQfSOECLhzc2Fz8+L1dZGVuHx?=
 =?iso-8859-1?Q?eDoq15V4eKzPPXSE+HoITB2A2Vjn/IJamMk5kcPtpSJfYAhFMSbAW9z71A?=
 =?iso-8859-1?Q?9hpMgTA9Fl+OYmUfT2K3k178kVqUmv9UeubM841wu1W7aLQwHTsdWMIVdJ?=
 =?iso-8859-1?Q?Huy2pMfleRSFC5SiSAQOCa3N9+EHZLno/B0g39Pj2zmZVjsvTXf6CIPgOP?=
 =?iso-8859-1?Q?H6J8Bgfrzea9EH8sCKqeLKet8iIvA1A24bcxLlDk2a7xdyfdFxOYrrbWUH?=
 =?iso-8859-1?Q?1QHIz6g9/J3u2pguBovtsV05B9kRSJ0+vpx8nJkOhWeYQjVA6Z+4rGGKUc?=
 =?iso-8859-1?Q?834opjQPHCExly447WUEgoyl1XbD0A99auJOfBxkrqkzVZEK58mSmlwAKT?=
 =?iso-8859-1?Q?hDU4Zar0WeopiKwAazGTHXl/nrZuYVjXOIUybFFfOhhVlbfsJGKHltDAeh?=
 =?iso-8859-1?Q?Uc3PsF9ZUuEmE7XzvBJ+xUG4J1emX3odoBXZbfVYP36uccT3mGely5RlMZ?=
 =?iso-8859-1?Q?qD3IrQHOWykzJsgLVe1fRz17z+jKCf7a2R02OBuIMkOzSKXVSxa30xd9u6?=
 =?iso-8859-1?Q?6XbjPXJTJnww8LPLHpw6s30FTk+F35T0yGTn1ln2J8RvnADwry1bNBy/37?=
 =?iso-8859-1?Q?2iB7tq/JobNd2D3vT3DaTbyuCXWAJyVNWi3JOSKMul5pgVGLlK0uHna8h2?=
 =?iso-8859-1?Q?MbCtsDk7RnKfivb8FyyRaKJE4gAzx1oqzj9ZRgiV//CD0XMLeT+dNOL4jY?=
 =?iso-8859-1?Q?Z2IPG+GR1lVaHe397UQwnJ+EisSTFEw6YmjIoKzGLDS5ivzCM+D1EJkoip?=
 =?iso-8859-1?Q?c8QhOb0VulGOGJk2L84LhKtRJrcnT/kXsiEyRaL6nmNgfmSQxtLoPeQxKu?=
 =?iso-8859-1?Q?A6inFrBytFMR9eNj/9/EItwPpA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MlKvSf7oIS6K9y5DG7MXPBWn8SMkdEHB8YEXMvTSIPcfGjloBQgzKNp2lg?=
 =?iso-8859-1?Q?hPgQR/5LfCB45G8F8fXLYLxvOt07+Hd+EKX1CIOIhRgYo8qMnB4HvUchaG?=
 =?iso-8859-1?Q?uyXxECOFTlC1fArUexPzNDRM4xrZ6gjFURDqJypYG0dB1Vl//9a6UMT4Sm?=
 =?iso-8859-1?Q?LpzqBPirZnlJyayTA87tfPycaSJRzMQNP4N5ptvd1qH0cOngixhfr5RVKD?=
 =?iso-8859-1?Q?d3sUqRIi+OHA3D0K9Yb43NBSnOSI29i7BPUFopPPvY+vciY2fWm/hWT3hH?=
 =?iso-8859-1?Q?IuADq1IcTTmHsFZ+ZFClZoJIkVdRp6x45SmXA78SG7QvQnEqgJpx699DgY?=
 =?iso-8859-1?Q?j7GPvUX7M08gm39Xj8YYMfKpStHZS6CU7hVPOwMOwp/wr02r+ExZBFkazA?=
 =?iso-8859-1?Q?0hgul4DoIZu40QoPN86eho2ZgHxE+XO5p9568whbh+54fosQNCBjHbO/8P?=
 =?iso-8859-1?Q?uF3a/gQh26f0b+U5Ab15iv2Ubd2cdEWRdxla56gfNP13NVYQKlXktbQ290?=
 =?iso-8859-1?Q?L3JRY2HXLcSg5J8HHj8u52eEqBb8IeTEjDj6RFaYLr6+QBYUOgXe+3KxmJ?=
 =?iso-8859-1?Q?zEeyRBxmI1nMWpMRtBSrcsyleuINz40+meWszgK1uCykiaqzYhIDAT3S81?=
 =?iso-8859-1?Q?vG/3apqIWCviBVMMOkErBkck8FatgLv1YNIJo2UHI3pBro1jmBcAaGxyr1?=
 =?iso-8859-1?Q?uC8XCyoXgoxqsTTSm+pWXneVE2AsydxfXMzhvthCM+QpWVzeOax21JLLm2?=
 =?iso-8859-1?Q?v5S0XQ29afRLUGqm4Ob4wewloy8NPGhqq8jSGotxps+McsOBkkVAykBCxY?=
 =?iso-8859-1?Q?u96jbYlXHJZkq8++akO/L/ud84/AjDlOfcGU5e71OkVE+Ee5WxX6zFD/sQ?=
 =?iso-8859-1?Q?a9ECWrii8LyVWsWRajyUAcHQPGpQ7JcLRbkcv6I+mrnvtjZ0zKPPggN0Zk?=
 =?iso-8859-1?Q?ewq+A+IUrUlJ2UI4Mn3JoB2VBtHBVXLlYaHjaOoVs6dAQXqfFcCXoGEYO7?=
 =?iso-8859-1?Q?3jCrp8VTTEn3s+pZtmuvYjC6qt2N2AxEwthXOjJLUL1HS+fXzT1606EamD?=
 =?iso-8859-1?Q?mSRY9wAOeEGWGZ3JMLl4GRWBktDubJEaQUUjm0Me33Ce4ndWjujrcy+Jhc?=
 =?iso-8859-1?Q?xg+r1V50pWbWsLUaIBjrXnmWfqal98ZZd1CRV5ViSdp5Igb6ZY624o8uGI?=
 =?iso-8859-1?Q?rRAK9w8WZ8HL5v9CAhi3uoXsSNll4s8hI+xaSrJ4zbX4ZlH22cJZVMj8f4?=
 =?iso-8859-1?Q?ldlkEFwEMgKykHql7Q2/bnPpZEIeekqgwaiSH3zqreacGQ95jZnm5MWHuA?=
 =?iso-8859-1?Q?YpWtpPZ6nQar96toGksfqgfLZeukmXpDTZQpGZP9hJ/50HRikBuZjaOeFU?=
 =?iso-8859-1?Q?koxpoihoZvdBpwiE/2uA2ai7ju7KiyS0VWBbye1B/iFoA0UYRhVyoiWU9f?=
 =?iso-8859-1?Q?YoIu+Em4n78LR5fkQFyjg+mT4IM560Adieg29RUxsTwJDUoWb7Iec9jx0X?=
 =?iso-8859-1?Q?o57/2u54aRfBvdiBctv0uBREfAezcQapF/934a/sWG3v4jdE73/5Lsmt+A?=
 =?iso-8859-1?Q?iGyT79hMBJ3Rh4p7D5D7mU6uRav281e7pfqjto2vpt02zrafNilaOUQGhX?=
 =?iso-8859-1?Q?kDR7+mxIN0t78rOxcAJwDEuWthsau11CAiHnL+Wx2LXv/GQR+gVjm2lA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e89e638-9cd1-4cdc-5f94-08dc7f5bbfa0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 21:18:41.4283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGID2ImIpb/4KZconsmFiR45j7XjRcsIn7QyucWGShfTFo/HWXlh0voIGgqTcQp9nEtjpBqJA/PzDBZ+ilsrlwKqkJt29al3KdIH7TTq4/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8502
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

On Mon, May 27, 2024 at 07:35:51PM +0200, Michal Wajdeczko wrote:
> We should keep all hardware definitions separated from the driver
> code. Move LMEM_BAR definition to new regs/xe_bars.h file and also
> add there GTTMMADR_BAR definition to avoid using magic 0 resource.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_bars.h      | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_mmio.c           |  3 ++-
>  drivers/gpu/drm/xe/xe_mmio.h           |  2 --
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  1 +
>  4 files changed, 14 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_bars.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_bars.h b/drivers/gpu/drm/xe/regs/xe_bars.h
> new file mode 100644
> index 000000000000..ce05b6ae832f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_bars.h

It seems like we're starting to put stuff in this folder that isn't
technically (or exclusively) "regs" anymore.  We might want to rename or
reorganize the folder at some point down the road.  Anyway, this seems
fine for the time being.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +#ifndef _XE_BARS_H_
> +#define _XE_BARS_H_
> +
> +#define GTTMMADR_BAR			0 /* MMIO + GTT */
> +#define LMEM_BAR			2 /* VRAM */
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 44bff104c011..1272246dd8a3 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/xe_drm.h>
>  
> +#include "regs/xe_bars.h"
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
> @@ -435,7 +436,7 @@ int xe_mmio_init(struct xe_device *xe)
>  	 * registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
>  	 */
>  	xe->mmio.size = pci_resource_len(pdev, mmio_bar);
> -	xe->mmio.regs = pci_iomap(pdev, mmio_bar, 0);
> +	xe->mmio.regs = pci_iomap(pdev, mmio_bar, GTTMMADR_BAR);
>  	if (xe->mmio.regs == NULL) {
>  		drm_err(&xe->drm, "failed to map registers\n");
>  		return -EIO;
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 1d578fd6ffc2..6ae0cc32c651 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -11,8 +11,6 @@
>  struct xe_device;
>  struct xe_reg;
>  
> -#define LMEM_BAR		2
> -
>  int xe_mmio_init(struct xe_device *xe);
>  int xe_mmio_probe_tiles(struct xe_device *xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 64592a8e527b..f46fd2df84de 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -13,6 +13,7 @@
>  
>  #include <generated/xe_wa_oob.h>
>  
> +#include "regs/xe_bars.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
