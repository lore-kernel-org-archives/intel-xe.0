Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE03AC282CD
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 21:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580D610E254;
	Mon,  3 Mar 2025 21:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUVFbVPZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27EC10E254
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 21:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741038668; x=1772574668;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8FiYaK/OoEWKMtDcOanExzBcpSxWVuWYKHHptwSsaFY=;
 b=TUVFbVPZxmvhG+4K7/CqpWtO7I4thTWQV2gpL9U/+3ehkFLnamjQgWeO
 17PB96PVyUIvDmbw8HcPwwwMt/vVgHdocOM+L+3bXQ8nET2PlogX/TPgx
 +ASH/IMB3mIp5xEcFghCyJ2P5pBoVpbINl7ZTCVKRIJDGkWwIb37fIn6+
 QYkI4F7HwfRIfkFDfhXFwNsK7zVFrvezp3nFcLnbJaTB4NuMVLrfXtWqw
 zeW4HgiqdSU1lQtcIiuAezOSuLYZuNqkc4TfWe3xo/FO0o1sSVploiyM3
 VIxpN+3TV8yWl7svZul/K9ygEb2KEbOrhqdF3/BCNLWeRvuQRiujl0Tlv A==;
X-CSE-ConnectionGUID: Vl3IGoR4TJCbgpKqM75roA==
X-CSE-MsgGUID: MzIIujN0TYmkAlmo9uzD5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="29521702"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="29521702"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 13:51:07 -0800
X-CSE-ConnectionGUID: p/lkJon4SOyc04dXp8ch5Q==
X-CSE-MsgGUID: h9wnt3ZgRZyQuIeQkd7UJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="118160910"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 13:51:07 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 3 Mar 2025 13:51:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 13:51:06 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 13:51:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcOtjYrXPU0LaQni+LTHAXeHHfsYJ8b+Wj8gJWeBc6+GiXsp2OidyuYFlPHxZMO5ixOkaSfl1UIaE/Q0hmbF0DGT4JkXyBZKA8Nqv+Syawt7G2sEsjxiSJ+8jGY9Lf9kys03TgmQxo5TDqa1r6GufD+8xSmNr5pzkwaVrd7xMQj9++va4PUGq6haj7Xp5dNbgFra3p9JEoJ9EGdH229KE2Kf4eUAO9jUMTwhX+CZznTq2VZBeWAlY30ryRAV3Nnmx2Y1oOAZ89KxUIMWAjmMZ0kQjfT0VtlywxT6AqaKyQzcwkb9d9Gdx3hM9R4pSWDW/c7oxdyghWDaH2pz7sap4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyVfep+xFLPTqEtLM01QwlhmPfYjBynvwVkz/2eVxFc=;
 b=EeSUze/JguWrorlbr29UaM7ZxI9KF6fQZeoSPvhgGuFlt1ZdUC6AizUxQfSVnKVG2Ds0OQ8MSsn0Io7NU4dKut9mmGR1omBRq/xm9eM1LrR726AIvawvrzE3rLmghEWYTrDY0dgzIb+TBtyILHhJcAyq+qFD5eJN2BEyi36cW7fYlThtMD3tiM5lEfX6CIzW3FxcvGbP8qAcpof2cy4V5loQAQDKihF+loSuUiQ1+snjxvrrwfSD5vcZtG90wnHP1N8+8+wgcqJzOHKvdXhG3zIj4itivELT6G5v6HSiT+iu2whQq6jJVjOka5o/MsUd5+xUmfj9Y0uOpnLICSR4Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 21:50:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 21:50:48 +0000
Date: Mon, 3 Mar 2025 13:50:46 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/xe: Add MI_MATH and ALU instruction definitions
Message-ID: <20250303215046.GB3175483@mdroper-desk1.amr.corp.intel.com>
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
 <20250303173522.1822-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303173522.1822-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:a03:333::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 43a27884-3e48-4351-1b0c-08dd5a9d7591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TXrtwUqmjIbOoUKwyGRnZE/6d26zWKJIUX/K+vK8h4SUSgnwKB/Xx30aBN?=
 =?iso-8859-1?Q?48F1QOB38XZfUTc5CmhGNCGmbGHi8+01/LIvCp1j+n8B8PAKUGcpPkoE0f?=
 =?iso-8859-1?Q?7rj4qo5HT1BV7cvQqN9NWZ2uuf1W3CNgZIueAgcozeVwpdP+8F6U6KLhb4?=
 =?iso-8859-1?Q?rwfPVgbaWsyFaZdqSOxnfaYKXAmjb/Hek2PABwE/JxDo2e0cj9Pou2kSHG?=
 =?iso-8859-1?Q?7inajzXAU9AhaCnwXmq82wN2puBGGf1A55XbZDBf8xfBVMN/a79qUBIK+2?=
 =?iso-8859-1?Q?PeOvB86lTaDV6UxZXX4hMv6u5hHKh/sKnanDh0jC6TA6AuCgVKpzmYKRJY?=
 =?iso-8859-1?Q?zMSEbu/rqVMengfclxrnF5iF+lT9hqPUAQ244rj0ZWgnRbQ1S6UBxkGb/W?=
 =?iso-8859-1?Q?RaHteqi+lrmgFO7EJW50fU/bFKnTAOxE/Ka0fGglxzZJzK4LNc53LNZ4MY?=
 =?iso-8859-1?Q?Zjldu3jHvDrJ7Zn3PdgkZtt8KiSaeGfuPlvBS3/FLi6mON+HckqyDGMtx0?=
 =?iso-8859-1?Q?di6xnJnMYXZyM0C2J7lGLGQ7s04fsPZAKb7PmTsv+jrT3vjhNE7YfEoCFn?=
 =?iso-8859-1?Q?Qz400YngxYsrrIyaxgTumwk04OSJX8hNFsEjc9Q9mOCASsmG9XOypgdOyF?=
 =?iso-8859-1?Q?PJaJUWxGIvdzkIunDM1fyuWGIyZEOigxdff/RiF3ZDotgtK7N0igTt2UbU?=
 =?iso-8859-1?Q?AbHDiVzQCuzFMA/+CIZtu7hC6ALjqlMYjeJJYLya5WBqjN3HsOZ/mPwsDk?=
 =?iso-8859-1?Q?wv9Y02EPjR2HgfjfQnQkwRe8ABl93laTcNz4/crt5adRlUjR4RAaEbP7eW?=
 =?iso-8859-1?Q?GN2kkpd6p4eZiWSsEmB1wq9HLZW/0SPTurCWagPUf2bfo3RYL0RSWpT14j?=
 =?iso-8859-1?Q?iirrqrr348VN6SO+sN049W4XbSLLRDmheuosdfrj3cuPbceqkGr5tRhsFw?=
 =?iso-8859-1?Q?hO1bPkAQsLcX8d+usmPERdLS2h4a1PY7D/SmETeTeseQ8iBHPLD2lvMgni?=
 =?iso-8859-1?Q?HUYMG1FrHgWfVbZcbsnaWhGYNB0tGcPcEwEWX1qxzimfrP99/5zB5FGufR?=
 =?iso-8859-1?Q?/GXzGQoi4WioawipPl3WRxVjLBuNv/LYrpQKxO630zEDNX3EHqTdLQpPF6?=
 =?iso-8859-1?Q?1peJCsXIrOCguZydH4fk3trj7ztcJaaT+0gjTY8lC/VZhSaR/1Y2pwADNp?=
 =?iso-8859-1?Q?1X58Hj6/FOa2qTIMx5cXxbN4CVBfIswriiE8L/r0JSNlM9CgSoAzZVgdHY?=
 =?iso-8859-1?Q?h6CIiVBQ7AjEflgXLMC0s4n1dv2/2GBC0YQn0cYTo+0kw9HQBz2RuiMtEQ?=
 =?iso-8859-1?Q?pT4cbeJopEk+QVUZ5qvnIyyxu7qWYIEAVmfaVwkQfPIE+w+AY8kL87z9lI?=
 =?iso-8859-1?Q?jEHuDwx+pgRyqFl3x8ADvcZOtxbNwyNh85RE03fovK4Y8xpZ9JFzs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?StWlIAIPVs7HZdDj4L2DetNFvzTF7rsUc79LUcfHaTIu2VNO9ZkoZQLot4?=
 =?iso-8859-1?Q?Veg0DqXx+CU2AHC2vxzkcWz3K/0uD+5/gY8amXS2FIihOXKl/Ih/MIDGd+?=
 =?iso-8859-1?Q?dePTQOCBE/i9tCJP5/RLrsTSJjpoG3MhrGeKsblhG15csePjFaqUkHd7Ne?=
 =?iso-8859-1?Q?3mUnsqJPvd9cDbSk7g91Q8Slu0vwYGiBhJk4H5xtmwvYYLVlVFRyYzLdzF?=
 =?iso-8859-1?Q?Um+dbk3nab/6GHmVl7MEx8xcEnOxsLOlGwyXwpPNS2BJjuvWxZpfPXA90i?=
 =?iso-8859-1?Q?a0UEJIAoAvAPDdTDfeamdXstFvFh2HVaTeorQo4TIP4iVys1dxFy1Td6Pe?=
 =?iso-8859-1?Q?Svws//FpPl2ESDvLYbdzuDSH20/kBUXHzlvZlygy4+CAly3Hxxd5WuzQi+?=
 =?iso-8859-1?Q?FpTuVBpA/QNsEFCLuZtijgaR8ovfzO0/i4ZeDAuXfJqer/GJZv6bFFh1nW?=
 =?iso-8859-1?Q?A4Dotch9TpS/pmDM8fmwmuIGRbWNDa1zeWO77BUhFWp0a3w+UKreW0wuQM?=
 =?iso-8859-1?Q?kortkWKP/SMg6Q0bLKajcz68qn9gft/OL8NRtcsaJRTwnCO9ftFH5t6Q2U?=
 =?iso-8859-1?Q?lreuXxYDWchTHv9eyY2unW8rx8LLhwVoLx1a7AwAj4EvtCm3LDZwMqc/Vn?=
 =?iso-8859-1?Q?/M2TwroN0L9XTFBk/D31wXzq5FhocCL1OIsDh80FIs9hw6dofTyl5BEW17?=
 =?iso-8859-1?Q?ZmQCfg4u0L5jnJ2lGLvFqMkWY2WbQ7Us2A9arwOgpzlu9rT0fnDDVE6/X6?=
 =?iso-8859-1?Q?UYQTcHsRXG4sQhgnK1mmGQZ9K6neCTnfwHdyP35CRZVTgjR0aX+Xlv/syD?=
 =?iso-8859-1?Q?A+W7u5f3i8g+PeE1pjwIDoM9ls532pWPI5hoYyxyDQv8KhUuUX2Q9/Mc93?=
 =?iso-8859-1?Q?AHLCbTn4xJEnxbMRGqhUMGZ5PeFrHAul+AM9CiMJD0aBIJz/mIqFrs8Y95?=
 =?iso-8859-1?Q?in9rEbip9cxbonb/Ec2rfLwNtL4IqUXXaEphARGqjyS4Uwdc+B/kycWrg+?=
 =?iso-8859-1?Q?VZ+VX6kkGZe/pOaQOCnL5m3Vy5jDgXv0pa87QuNh2RFntP2kvSEbrxYTL0?=
 =?iso-8859-1?Q?EqMsNnoCFNSIAFwkr14Nc6sOpVvsXSJ55UoFfwL8KaKgZx9dL6tuYDJ8zK?=
 =?iso-8859-1?Q?QvejZM6ZMLDUde8ZQmxGE0yCt+xiHfMdVp2hKlV3XXgtKmQGbZUZhl7IAj?=
 =?iso-8859-1?Q?tc6UhY1jSy4D505TXm9srv9GhKQkBLJFJPHBeZEqoxuaopLjP70S3g64XZ?=
 =?iso-8859-1?Q?IwKFP0JfxDaB3lIbVhg6xAdp/vaZYmtQXJtkajJSnbv1hi2BePjFsP9lXu?=
 =?iso-8859-1?Q?Vnypra2I5Q5gpqX6zP+oCKxLpW9DOzRyPKbbC5QAQhfLemDXIamHt2BCb5?=
 =?iso-8859-1?Q?ZBYLZfArfA+63Krk22LTIaIlOXIuM9KX47bwKrp53rrgSWrSRN4ymrrZSc?=
 =?iso-8859-1?Q?OskpiiuOJ4YKZ23pJSVFaMdCR8RcBiz4qvzFgjyvDp0FdUjlI3UJJl7U5E?=
 =?iso-8859-1?Q?pMe1YE5P5E4Es/qzuSUZjf8SGUM/JCUEos44vO6o6jt88LvFs6kcwIqv1y?=
 =?iso-8859-1?Q?I864Zze/gpzLSDdZU/KAbgFIn1d0IH/4FkVkfubLRLit0AOhEdJbdFnr1x?=
 =?iso-8859-1?Q?sDeZIzEa30mgQRzeET4HopD5ja9vtGDrJM+0opkopKQKvKaBdW/eGCgA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a27884-3e48-4351-1b0c-08dd5a9d7591
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 21:50:48.6613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fys+Lgmxj6OGiFoy+luRBeUMhl9NOLNElOxyPKb5plACWHEdiu3yVmN7SWSaJRTQGb2o/Fm7UiC6f6tdqoSRfrJzerT7DzFiSOKjc5RO3wU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
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

On Mon, Mar 03, 2025 at 06:35:19PM +0100, Michal Wajdeczko wrote:
> The command streamer implements an Arithmetic Logic Unit (ALU)
> which supports basic arithmetic and logical operations on two
> 64-bit operands. Access to this ALU is thru the MI_MATH command
> and sixteen General Purpose Register (GPR) 64-bit registers,
> which are used as temporary storage.
> 
> Bspec: 45737, 60236 # MI
> Bspec: 45525, 60132 # ALU
> Bspec: 45533, 60309 # GPR
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  .../gpu/drm/xe/instructions/xe_alu_commands.h | 72 +++++++++++++++++++
>  .../gpu/drm/xe/instructions/xe_mi_commands.h  |  1 +
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h      |  4 ++
>  3 files changed, 77 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/instructions/xe_alu_commands.h
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_alu_commands.h b/drivers/gpu/drm/xe/instructions/xe_alu_commands.h
> new file mode 100644
> index 000000000000..c4321949f534
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/instructions/xe_alu_commands.h
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_ALU_COMMANDS_H_
> +#define _XE_ALU_COMMANDS_H_
> +
> +#include "instructions/xe_instr_defs.h"
> +
> +/* Instruction Opcodes */

It looks like we've only included the opcodes that were available since
Xe_LP platforms here.  Since we seem to be defining all of those
(including the ones not used by subsequent patches in this series) is
there any reason not to include the ones first introduced in Xe_HP (and
still supported on all the Xe2 and beyond platforms that the Xe driver
officially supports)?  I.e., referencing the table from bspec 60146.

> +#define CS_ALU_OPCODE_NOOP			0x000
> +#define CS_ALU_OPCODE_LOAD			0x080
> +#define CS_ALU_OPCODE_LOADINV			0x480
> +#define CS_ALU_OPCODE_LOAD0			0x081
> +#define CS_ALU_OPCODE_LOAD1			0x481
> +#define CS_ALU_OPCODE_ADD			0x100
> +#define CS_ALU_OPCODE_SUB			0x101
> +#define CS_ALU_OPCODE_AND			0x102
> +#define CS_ALU_OPCODE_OR			0x103
> +#define CS_ALU_OPCODE_XOR			0x104
> +#define CS_ALU_OPCODE_STORE			0x180
> +#define CS_ALU_OPCODE_STOREINV			0x580
> +
> +/* Instruction Operands */
> +#define CS_ALU_OPERAND_REG(n)			REG_FIELD_PREP(GENMASK(3, 0), (n))
> +#define CS_ALU_OPERAND_REG0			0x0
> +#define CS_ALU_OPERAND_REG1			0x1
> +#define CS_ALU_OPERAND_REG2			0x2
> +#define CS_ALU_OPERAND_REG3			0x3
> +#define CS_ALU_OPERAND_REG4			0x4
> +#define CS_ALU_OPERAND_REG5			0x5
> +#define CS_ALU_OPERAND_REG6			0x6
> +#define CS_ALU_OPERAND_REG7			0x7
> +#define CS_ALU_OPERAND_REG8			0x8
> +#define CS_ALU_OPERAND_REG9			0x9
> +#define CS_ALU_OPERAND_REG10			0xa
> +#define CS_ALU_OPERAND_REG11			0xb
> +#define CS_ALU_OPERAND_REG12			0xc
> +#define CS_ALU_OPERAND_REG13			0xd
> +#define CS_ALU_OPERAND_REG14			0xe
> +#define CS_ALU_OPERAND_REG15			0xf
> +#define CS_ALU_OPERAND_SRCA			0x20
> +#define CS_ALU_OPERAND_SRCB			0x21
> +#define CS_ALU_OPERAND_ACCU			0x31
> +#define CS_ALU_OPERAND_ZF			0x32
> +#define CS_ALU_OPERAND_CF			0x33
> +#define CS_ALU_OPERAND_NA			0 /* N/A operand */
> +
> +/* Command Streamer ALU Instructions */
> +#define CS_ALU_INSTR(opcode, op1, op2)		(REG_FIELD_PREP(GENMASK(31, 20), (opcode)) | \
> +						 REG_FIELD_PREP(GENMASK(19, 10), (op1)) | \
> +						 REG_FIELD_PREP(GENMASK(9, 0), (op2)))
> +
> +#define __CS_ALU_INSTR(opcode, op1, op2)	CS_ALU_INSTR(CS_ALU_OPCODE_##opcode, \
> +							     CS_ALU_OPERAND_##op1, \
> +							     CS_ALU_OPERAND_##op2)
> +
> +#define CS_ALU_INSTR_NOOP			__CS_ALU_INSTR(NOOP, NA, NA)
> +#define CS_ALU_INSTR_LOAD(op1, op2)		__CS_ALU_INSTR(LOAD, op1, op2)
> +#define CS_ALU_INSTR_LOADINV(op1, op2)		__CS_ALU_INSTR(LOADINV, op1, op2)
> +#define CS_ALU_INSTR_LOAD0(op1)			__CS_ALU_INSTR(LOAD0, op1, NA)
> +#define CS_ALU_INSTR_LOAD1(op1)			__CS_ALU_INSTR(LOAD1, op1, NA)
> +#define CS_ALU_INSTR_ADD			__CS_ALU_INSTR(ADD, NA, NA)
> +#define CS_ALU_INSTR_SUB			__CS_ALU_INSTR(SUB, NA, NA)
> +#define CS_ALU_INSTR_AND			__CS_ALU_INSTR(AND, NA, NA)

It seems like the bspec forgot to document AND (on page 60143).  But
this looks correct nevertheless.


Up to you if you want to add the other shift, store, and load
instructions above or not.  Either way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> +#define CS_ALU_INSTR_OR				__CS_ALU_INSTR(OR, NA, NA)
> +#define CS_ALU_INSTR_XOR			__CS_ALU_INSTR(XOR, NA, NA)
> +#define CS_ALU_INSTR_STORE(op1, op2)		__CS_ALU_INSTR(STORE, op1, op2)
> +#define CS_ALU_INSTR_STOREINV(op1, op2)		__CS_ALU_INSTR(STOREINV, op1, op2)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index 526bad9d4bac..eba582058d55 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -32,6 +32,7 @@
>  #define MI_BATCH_BUFFER_END		__MI_INSTR(0xA)
>  #define MI_TOPOLOGY_FILTER		__MI_INSTR(0xD)
>  #define MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
> +#define MI_MATH(n)			(__MI_INSTR(0x1A) | XE_INSTR_NUM_DW((n) + 1))
>  
>  #define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
>  #define   MI_SDI_GGTT			REG_BIT(22)
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 4f372dc2cb89..659cf85fa3d6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -184,6 +184,10 @@
>  #define   PREEMPT_GPGPU_LEVEL_MASK		PREEMPT_GPGPU_LEVEL(1, 1)
>  #define   PREEMPT_3D_OBJECT_LEVEL		REG_BIT(0)
>  
> +#define CS_GPR_DATA(base, n)			XE_REG((base) + 0x600 + (n) * 4)
> +#define CS_GPR_REG(base, n)			CS_GPR_DATA((base), (n) * 2)
> +#define CS_GPR_REG_UDW(base, n)			CS_GPR_DATA((base), (n) * 2 + 1)
> +
>  #define VDBOX_CGCTL3F08(base)			XE_REG((base) + 0x3f08)
>  #define   CG3DDISHRS_CLKGATE_DIS		REG_BIT(5)
>  
> -- 
> 2.47.1
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
