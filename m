Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5D0C7618E
	for <intel-xe@archiver.kernel.org>; Sat, 22 Apr 2023 00:10:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A23B10E1D0;
	Sat, 22 Apr 2023 00:10:00 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CCC10E1D0
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Apr 2023 00:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682122198; x=1713658198;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ksKPvQjcRp0iRyQxEGnBv3AbyHWbclHRC1SRmQlRl8Y=;
 b=G7KSvAobMScAiOKtJ76F4VGV3ZjaonUBOPYflsp80AeEdxPL3SS0WQBM
 oi/jAqvrjvmCO3P8n479r009eBe15wVituJ8cJqxnffRXXQjN/8rl5pEi
 6fGFhkkFnp4/VrE0XqN6t+9nJfGyKtdkNkqTbbWNoV7MJjuQS80WwJ5iA
 igaD/YWRhIuXCQpWCxzrTxn82jdpJ94CCqlE1qgCRC5s+mpkHyiuusVUO
 T45lXcIj8WFG+N0dKkRAz/eA3U+3hA1ltU75zexm+7DeLIXhZ8sqO1tQu
 1l13zbhvkASReVTuaI/El9uxHl22PGdj16Ad4s9NiHn9hWpqj1NrlD1VJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="348905261"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="348905261"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 17:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="781775800"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="781775800"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2023 17:09:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 17:09:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 17:09:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 17:09:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 17:09:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwbQcc8wG7veD+v7yp3TPW3I5EITLyG0Nf092Zeam/C6XWTOgGZs7iaQaSuISj0LP97m/zIX19cFGOIQxTDzTiXzlzbq01MJmplQuuxjcBIhZXc/Y7PF60PqpKfz8tW1yGa2gjRrDd8236aSCHV2hIoMtAU9Co+Dn81JeAzRXla2YNhDe0kinNJxGwyhK29nRaT8t1vJkN/T+/LnDE/9O49rbJIyxcklp39NwVQxj2rthNg2OhRRd4VcRFcWx9LaOpPua39bFbx4huKtAMqlFpNJW8kL+UtNHD+Ps872dOoQDfIkG+qMAsdg1qhH/T9Mk/n6L0KnOLnEkMzz5PCnyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNKMyA/TiEvBwGtQzRbBsS80O86ZqmOnwP3LDgmfdUo=;
 b=J5EXQHRgwVo8fN2BLpdOwT2tbmNoKprmoImu2KRpsjNwfJ3GVVNcuJCqN3sVmlyGktPWvMZir/GvaDcTr+BplHxcD/ByGI5mXH18RzNy40hbNlnuoOoKf33UQ5OUZLtMCZ1RDNbNhTt90JIVu/LBdIQCFaw310Uy8FGGXZSmok0uyjm91iM7152pmwPxACGeXm8SO5gTSaKx1CRx/Tbh0HYlBiTXIskLxoBnf68RCF65hUU4LbLfTXRl9p/mugxZnHCZ+YZ9CHajxMLxB1daemILwAmrS3BMMwVLVb2/miUpXj0jSf0ev5vvVYmM8lXROglCkFP/QX1/6DCIKrnkTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB7855.namprd11.prod.outlook.com (2603:10b6:208:3f8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Sat, 22 Apr
 2023 00:09:54 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Sat, 22 Apr 2023
 00:09:54 +0000
Date: Fri, 21 Apr 2023 17:09:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230422000950.GR4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421223258.128781-9-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: 721825cd-1d11-466a-f999-08db42c5e5d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GhNJPrHJUnz8EWuUlh9/m31R79N1pP6y1LAKztB7NSWicX+xOrl1VYKRRGb28M5IShWBManlXtyncxt0sqFAJNjG3Yh1wXaiCG9VrGLQ5150jHcwL8r66l5DaP3V2Yg8+ezxzCf63ZCgtWJPPzNwCJepMd0831PsH+MWTYpJloP34YpwAx3vrz6vof0sUDLCEdedSgd5Rx6OicRgs5Snv1yAIlubh/9c8F/i7cmx+tSqP6Hu9L844hFhnlbRbGaQuTBh+wfTcSiztCR8bBUNl9PFU3uSAphExuarpaexMVmYvZrzNJVxT7RzFYFx0It+wb1vpX256vFsovQYUOKhhoKGbUqjq4Q1vvxZjsjVnFPkVAAsE98zt8WmZU6Ccfq2ZBSrnJe3+b/FlGWDMIvRJQhKMethv9HaXhhGGpjs17I9uWIvUVX/RIMorYDAHgP7vnPtxzuLOYKwog48oY5R/9rQwO1n3PXRWK+AyNWdGLXGwCg8Ct5At6V3YK1TQafxEr1vALmcoI/eRfdbD3LSC4G60HzvVgbJSBSzT6CJX3sPrxv9LD1HICKGGqrFq33C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(366004)(376002)(346002)(451199021)(66556008)(4326008)(5660300002)(86362001)(478600001)(6636002)(6506007)(83380400001)(26005)(82960400001)(186003)(6512007)(1076003)(38100700002)(6862004)(8936002)(8676002)(316002)(54906003)(6666004)(6486002)(33656002)(41300700001)(66476007)(66946007)(2906002)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DBsqqwlqbu3ylGE+FwWU35maLf/nDjuH1+wIKdgeuZD6BPY0qyRtlKDCUA+1?=
 =?us-ascii?Q?rL7+9QTQ7+W/rqG6O7OtwPewWjxVMRLbWjEDZ4RUV9/+los0nTleJwpaheUp?=
 =?us-ascii?Q?XSBC9aGbuBz1IAFuOg6jWm2VCz8m69hYmgKpRCdOUcvgbs+CftB2OZ7kcFxA?=
 =?us-ascii?Q?TX7EKRzzWM03W6kuWmsz5nd48oML2AuOex/2d9vy7ZAF1P/FDj1U1/U2fGD2?=
 =?us-ascii?Q?l6GxWgrJRqr0sRXrt6PShoaSMAhiZocfWWWFxglXtq7q4vLwlknXgEjlbXc7?=
 =?us-ascii?Q?NcwR8G4uhGzZXRqA6cmLDFcoI0+hL6kkBC6xpCCtRA5no044i+14PNIymdy3?=
 =?us-ascii?Q?qp5dU1stP6tEW+C5w3r0fQA0m9CknQz8w69MeCezvOY5eqrJrLz7PN9AopNd?=
 =?us-ascii?Q?bZ6ThtONSt93B8ecngR6USdwsV+0MQ2jI911i3ItG0ZfhpAzKqJ3uwAoVg8v?=
 =?us-ascii?Q?bgdTurOse+uegLBwlvF/S9mDyU6neRBkUmlkrw0qBUzC5yyFjGNsgKyLBCKe?=
 =?us-ascii?Q?BBDr+Qf8xODHyosMEetYtbmoLW0BhEfwterIlbDnjbMsSBdgeS6bObCpqo2y?=
 =?us-ascii?Q?HyTV9ivd/UhdI82IZdOkwv+vAT31NcaAN40C/9GQ+N0yFGBkJgmuMs/9k5fA?=
 =?us-ascii?Q?dU/MNIv3Ld7lGB3CY1HTOdnYW7XkQB7fEdf/YXpoRdmk+NljTnmsG8+BS33p?=
 =?us-ascii?Q?/XHZTir66eMhqpiXg6AULSbeN8ca40ybwMXcaCWRChx3JeJ0CJB7uamtSbZ9?=
 =?us-ascii?Q?Ps5JeUhHZXb8xU2n2uSY9VMycLpbcSPe/4J0AdFkBiAIaqdkovNEYJ+l7oFu?=
 =?us-ascii?Q?MEYT6hRyNNL58FjPz0AMhv6s1e/XCwn4QeM7ts5biDS1ZJrBijjGpzk7txGv?=
 =?us-ascii?Q?pp1OeWFXMx/LoBBpgooE9G6Zq56HsVa59UXw6r+Uig61Zb1sbKw+GlmZ7n7h?=
 =?us-ascii?Q?GpqDKabOTuvzh+U3zSzl70F8S9jMVbs8OfVUyYPfLjVes1nsjdGkGtFKNnrx?=
 =?us-ascii?Q?MD5z5eMUKtiFkuYBSYUHLmK0iPjf8VtNputm5qgXQMWuzazns33IwEWpLMai?=
 =?us-ascii?Q?jpJpb7nJ9XfTKtHeXmcFxbxethcLXD7Pp991y1WXcZgFFp8TZd8Ui86nwXEq?=
 =?us-ascii?Q?LtjMN1mwr/sR939HDVO3F7y5ubkQ/wj0VsqORPfSIKd0IfIfQyf+PTmcroOb?=
 =?us-ascii?Q?8i2HHK1hD3q9rytaA/AjRdaRzTe74bpBYyl0hob2fsgyqdMoDsbWWVDdN8Qj?=
 =?us-ascii?Q?fcNxB7t4QUFPvZ/NdO35+hPoGF3TGuCqNyhnzBIUPBkRXTdB20cVfdTR5/m4?=
 =?us-ascii?Q?QaBh2Rkx1yDXw/k18oM0UWhfK1c2UhL2nHrLgwBPR4B/jOZfcPHUOCFMfZh3?=
 =?us-ascii?Q?onOK7fIWj9ldURsGpTJZ2GREj0QnuaNm89lOZtgnjFrribTq/krtKz+Ejbqq?=
 =?us-ascii?Q?myjae8NheIro1SFBQzRxnGKq59f2tUKTB0SjvkfqChnThPxhv5xrpM9R4//x?=
 =?us-ascii?Q?ALqffOch5W4Grx5G8+0CXBHUX4j3mQ2i69MgtgZvyY3o3Ndy1K3d9gGszZvq?=
 =?us-ascii?Q?pDCD8kd8gOtTiaZaM79d4BRFqCONx1Ux+qx73WYSbLU/QLEf9gl09j4n7TcS?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 721825cd-1d11-466a-f999-08db42c5e5d2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2023 00:09:54.0750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67a6sEvKPaxcxlR3EICWBRVOtg3ETqOERqEBaBRmwtZxWhS3abyITx2qJlFKs//yshb6SB5dGboTjlHWQKynPtj8uWerKUcM6V3AJoR1AAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7855
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/17] drm/xe/guc: Convert GuC registers
 to REG_FIELD/REG_BIT
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 03:32:49PM -0700, Lucas De Marchi wrote:
> Cleanup GuC register declarations by converting them to use REG_FIELD,
> REG_BIT and REG_GENMASK. While converting, also reorder the bitfields
> so they follow the convention of declaring the higher bits first.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h | 168 +++++++++++++-------------
>  drivers/gpu/drm/xe/xe_ggtt.c          |   6 +-
>  drivers/gpu/drm/xe/xe_guc.c           |   8 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c       |   3 +-
>  4 files changed, 89 insertions(+), 96 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 011868ff38aa..facb1f0a55b6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -14,23 +14,18 @@
>  /* Definitions of GuC H/W registers, bits, etc */
>  
>  #define GUC_STATUS			_MMIO(0xc000)
> -#define   GS_RESET_SHIFT		0
> -#define   GS_MIA_IN_RESET		  (0x01 << GS_RESET_SHIFT)
> -#define   GS_BOOTROM_SHIFT		1
> -#define   GS_BOOTROM_MASK		  (0x7F << GS_BOOTROM_SHIFT)
> -#define   GS_BOOTROM_RSA_FAILED		  (0x50 << GS_BOOTROM_SHIFT)
> -#define   GS_BOOTROM_JUMP_PASSED	  (0x76 << GS_BOOTROM_SHIFT)
> -#define   GS_UKERNEL_SHIFT		8
> -#define   GS_UKERNEL_MASK		  (0xFF << GS_UKERNEL_SHIFT)
> -#define   GS_MIA_SHIFT			16
> -#define   GS_MIA_MASK			  (0x07 << GS_MIA_SHIFT)
> -#define   GS_MIA_CORE_STATE		  (0x01 << GS_MIA_SHIFT)
> -#define   GS_MIA_HALT_REQUESTED		  (0x02 << GS_MIA_SHIFT)
> -#define   GS_MIA_ISR_ENTRY		  (0x04 << GS_MIA_SHIFT)
> -#define   GS_AUTH_STATUS_SHIFT		30
> -#define   GS_AUTH_STATUS_MASK		  (0x03 << GS_AUTH_STATUS_SHIFT)
> -#define   GS_AUTH_STATUS_BAD		  (0x01 << GS_AUTH_STATUS_SHIFT)
> -#define   GS_AUTH_STATUS_GOOD		  (0x02 << GS_AUTH_STATUS_SHIFT)
> +#define   GS_AUTH_STATUS_MASK		REG_GENMASK(31, 30)
> +#define   GS_AUTH_STATUS_BAD		REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x1)
> +#define   GS_AUTH_STATUS_GOOD		REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x2)
> +#define   GS_MIA_MASK			REG_GENMASK(18, 16)
> +#define   GS_MIA_CORE_STATE		REG_FIELD_PREP(GS_MIA_MASK, 0x1)
> +#define   GS_MIA_HALT_REQUESTED		REG_FIELD_PREP(GS_MIA_MASK, 0x2)
> +#define   GS_MIA_ISR_ENTRY		REG_FIELD_PREP(GS_MIA_MASK, 0x4)
> +#define   GS_UKERNEL_MASK		REG_GENMASK(15, 8)
> +#define   GS_BOOTROM_MASK		REG_GENMASK(7, 1)
> +#define   GS_BOOTROM_RSA_FAILED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x50)
> +#define   GS_BOOTROM_JUMP_PASSED	REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
> +#define   GS_MIA_IN_RESET		REG_BIT(0)
>  
>  #define SOFT_SCRATCH(n)			_MMIO(0xc180 + (n) * 4)
>  #define SOFT_SCRATCH_COUNT		16
> @@ -42,90 +37,89 @@
>  #define DMA_ADDR_0_HIGH			_MMIO(0xc304)
>  #define DMA_ADDR_1_LOW			_MMIO(0xc308)
>  #define DMA_ADDR_1_HIGH			_MMIO(0xc30c)
> -#define   DMA_ADDRESS_SPACE_WOPCM	  (7 << 16)
> -#define   DMA_ADDRESS_SPACE_GTT		  (8 << 16)
> +#define   DMA_ADDR_SPACE_MASK		REG_GENMASK(20, 16)
> +#define   DMA_ADDRESS_SPACE_WOPCM	REG_FIELD_PREP(DMA_ADDR_SPACE_MASK, 7)
> +#define   DMA_ADDRESS_SPACE_GTT		REG_FIEDL_PREP(DMA_ADDR_SPACE_MASK, 8)

s/FIEDL/FIELD/.  Seems like his field isn't actually used anywhere
(which is why we avoided a build failure).  Should we just drop it?


>  #define DMA_COPY_SIZE			_MMIO(0xc310)
>  #define DMA_CTRL			_MMIO(0xc314)
> -#define   HUC_UKERNEL			  (1<<9)
> -#define   UOS_MOVE			  (1<<4)
> -#define   START_DMA			  (1<<0)
> +#define   HUC_UKERNEL			REG_BIT(9)
> +#define   UOS_MOVE			REG_BIT(4)
> +#define   START_DMA			REG_BIT(0)
>  #define DMA_GUC_WOPCM_OFFSET		_MMIO(0xc340)
> -#define   GUC_WOPCM_OFFSET_VALID	  (1<<0)
> -#define   HUC_LOADING_AGENT_VCR		  (0<<1)
> -#define   HUC_LOADING_AGENT_GUC		  (1<<1)
>  #define   GUC_WOPCM_OFFSET_SHIFT	14

Can we drop the _SHIFT...

> -#define   GUC_WOPCM_OFFSET_MASK		  (0x3ffff << GUC_WOPCM_OFFSET_SHIFT)
> -#define GUC_MAX_IDLE_COUNT		_MMIO(0xC3E4)
> +#define   GUC_WOPCM_OFFSET_MASK		REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)

...and hardcode the 14 here?

> +#define   HUC_LOADING_AGENT_MASK	REG_BIT(1)
> +#define   HUC_LOADING_AGENT_VCR		REG_FIELD_PREP(HUC_LOADING_AGENT_MASK, 0)

HUC_LOADING_AGENT_VCR is never used as far as I can see.  And single-bit
"masks" with REG_FIELD_PREP are kind of silly; I think we can just
define HUC_LOADING_AGENT_GUC as REG_BIT(1).


At some point we should also add another patch that sorts this file by
offset.  Doesn't need to be part of this series though.


Matt

> +#define   HUC_LOADING_AGENT_GUC		REG_FIELD_PREP(HUC_LOADING_AGENT_MASK, 1)
> +#define   GUC_WOPCM_OFFSET_VALID	REG_BIT(0)
> +#define GUC_MAX_IDLE_COUNT		_MMIO(0xc3e4)
>  
> -#define HUC_STATUS2             _MMIO(0xD3B0)
> -#define   HUC_FW_VERIFIED       (1<<7)
> +#define HUC_STATUS2			_MMIO(0xd3b0)
> +#define   HUC_FW_VERIFIED		REG_BIT(7)
>  
> -#define GEN11_HUC_KERNEL_LOAD_INFO	_MMIO(0xC1DC)
> -#define   HUC_LOAD_SUCCESSFUL		  (1 << 0)
> +#define GEN11_HUC_KERNEL_LOAD_INFO	_MMIO(0xc1dc)
> +#define   HUC_LOAD_SUCCESSFUL		REG_BIT(0)
>  
>  #define GUC_WOPCM_SIZE			_MMIO(0xc050)
> -#define   GUC_WOPCM_SIZE_LOCKED		  (1<<0)
> -#define   GUC_WOPCM_SIZE_SHIFT		12
> -#define   GUC_WOPCM_SIZE_MASK		  (0xfffff << GUC_WOPCM_SIZE_SHIFT)
> +#define   GUC_WOPCM_SIZE_MASK		REG_GENMASK(31, 12)
> +#define   GUC_WOPCM_SIZE_LOCKED		REG_BIT(0)
>  
>  #define GEN8_GT_PM_CONFIG		_MMIO(0x138140)
>  #define GEN9LP_GT_PM_CONFIG		_MMIO(0x138140)
>  #define GEN9_GT_PM_CONFIG		_MMIO(0x13816c)
> -#define   GT_DOORBELL_ENABLE		  (1<<0)
> +#define   GT_DOORBELL_ENABLE		REG_BIT(0)
>  
>  #define GEN8_GTCR			_MMIO(0x4274)
> -#define   GEN8_GTCR_INVALIDATE		  (1<<0)
> -
> -#define GEN12_GUC_TLB_INV_CR		_MMIO(0xcee8)
> -#define   GEN12_GUC_TLB_INV_CR_INVALIDATE	(1 << 0)
> -
> -#define GUC_ARAT_C6DIS			_MMIO(0xA178)
> -
> -#define GUC_SHIM_CONTROL		_MMIO(0xc064)
> -#define   GUC_DISABLE_SRAM_INIT_TO_ZEROES	(1<<0)
> -#define   GUC_ENABLE_READ_CACHE_LOGIC		(1<<1)
> -#define   GUC_ENABLE_MIA_CACHING		(1<<2)
> -#define   GUC_GEN10_MSGCH_ENABLE		(1<<4)
> -#define   GUC_ENABLE_READ_CACHE_FOR_SRAM_DATA	(1<<9)
> -#define   GUC_ENABLE_READ_CACHE_FOR_WOPCM_DATA	(1<<10)
> -#define   GUC_ENABLE_MIA_CLOCK_GATING		(1<<15)
> -#define   GUC_GEN10_SHIM_WC_ENABLE		(1<<21)
> +#define   GEN8_GTCR_INVALIDATE		REG_BIT(0)
> +
> +#define GEN12_GUC_TLB_INV_CR			_MMIO(0xcee8)
> +#define   GEN12_GUC_TLB_INV_CR_INVALIDATE	REG_BIT(0)
> +
> +#define GUC_ARAT_C6DIS				_MMIO(0xa178)
> +
> +#define GUC_SHIM_CONTROL			_MMIO(0xc064)
>  #define   PVC_GUC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
> -#define   PVC_MOCS_UC_INDEX			1
> -#define   PVC_GUC_MOCS_INDEX(index)		REG_FIELD_PREP(PVC_GUC_MOCS_INDEX_MASK,\
> +#define   PVC_GUC_MOCS_UC_INDEX			1
> +#define   PVC_GUC_MOCS_INDEX(index)		REG_FIELD_PREP(PVC_GUC_MOCS_INDEX_MASK, \
>  							       index)
> +#define   GUC_GEN10_SHIM_WC_ENABLE		REG_BIT(21)
> +#define   GUC_ENABLE_MIA_CLOCK_GATING		REG_BIT(15)
> +#define   GUC_ENABLE_READ_CACHE_FOR_WOPCM_DATA	REG_BIT(10)
> +#define   GUC_ENABLE_READ_CACHE_FOR_SRAM_DATA	REG_BIT(9)
> +#define   GUC_GEN10_MSGCH_ENABLE		REG_BIT(4)
> +#define   GUC_ENABLE_MIA_CACHING		REG_BIT(2)
> +#define   GUC_ENABLE_READ_CACHE_LOGIC		REG_BIT(1)
> +#define   GUC_DISABLE_SRAM_INIT_TO_ZEROES	REG_BIT(0)
>  
> -#define GUC_SEND_INTERRUPT		_MMIO(0xc4c8)
> -#define   GUC_SEND_TRIGGER		  (1<<0)
> -#define GEN11_GUC_HOST_INTERRUPT	_MMIO(0x1901f0)
>  
> -#define GUC_NUM_DOORBELLS		256
> +#define GUC_SEND_INTERRUPT			_MMIO(0xc4c8)
> +#define   GUC_SEND_TRIGGER			REG_BIT(0)
> +#define GEN11_GUC_HOST_INTERRUPT		_MMIO(0x1901f0)
> +
> +#define GUC_NUM_DOORBELLS			256
>  
>  /* format of the HW-monitored doorbell cacheline */
>  struct guc_doorbell_info {
>  	u32 db_status;
> -#define GUC_DOORBELL_DISABLED		0
> -#define GUC_DOORBELL_ENABLED		1
> +#define GUC_DOORBELL_DISABLED			0
> +#define GUC_DOORBELL_ENABLED			1
>  
>  	u32 cookie;
>  	u32 reserved[14];
>  } __packed;
>  
> -#define GEN8_DRBREGL(x)			_MMIO(0x1000 + (x) * 8)
> -#define   GEN8_DRB_VALID		  (1<<0)
> -#define GEN8_DRBREGU(x)			_MMIO(0x1000 + (x) * 8 + 4)
> +#define GEN8_DRBREGL(x)				_MMIO(0x1000 + (x) * 8)
> +#define   GEN8_DRB_VALID			REG_BIT(0)
> +#define GEN8_DRBREGU(x)				_MMIO(0x1000 + (x) * 8 + 4)
>  
>  #define GEN12_DIST_DBS_POPULATED		_MMIO(0xd08)
> -#define   GEN12_DOORBELLS_PER_SQIDI_SHIFT	16
> -#define   GEN12_DOORBELLS_PER_SQIDI		(0xff)
> -#define   GEN12_SQIDIS_DOORBELL_EXIST		(0xffff)
> -
> -#define DE_GUCRMR			_MMIO(0x44054)
> +#define   GEN12_DOORBELLS_PER_SQIDI_MASK	REG_GENMASK(23, 16)
> +#define   GEN12_SQIDIS_DOORBELL_EXIST_MASK	REG_GENMASK(15, 0)
>  
> -#define GUC_BCS_RCS_IER			_MMIO(0xC550)
> -#define GUC_VCS2_VCS1_IER		_MMIO(0xC554)
> -#define GUC_WD_VECS_IER			_MMIO(0xC558)
> -#define GUC_PM_P24C_IER			_MMIO(0xC55C)
> +#define GUC_BCS_RCS_IER				_MMIO(0xC550)
> +#define GUC_VCS2_VCS1_IER			_MMIO(0xC554)
> +#define GUC_WD_VECS_IER				_MMIO(0xC558)
> +#define GUC_PM_P24C_IER				_MMIO(0xC55C)
>  
>  #define VF_SW_FLAG(n)			_MMIO(0x190240 + (n) * 4)
>  #define VF_SW_FLAG_COUNT		4
> @@ -134,21 +128,21 @@ struct guc_doorbell_info {
>  #define MED_VF_SW_FLAG_COUNT		4
>  
>  /* GuC Interrupt Vector */
> -#define GUC_INTR_GUC2HOST		BIT(15)
> -#define GUC_INTR_EXEC_ERROR		BIT(14)
> -#define GUC_INTR_DISPLAY_EVENT		BIT(13)
> -#define GUC_INTR_SEM_SIG		BIT(12)
> -#define GUC_INTR_IOMMU2GUC		BIT(11)
> -#define GUC_INTR_DOORBELL_RANG		BIT(10)
> -#define GUC_INTR_DMA_DONE		BIT(9)
> -#define GUC_INTR_FATAL_ERROR		BIT(8)
> -#define GUC_INTR_NOTIF_ERROR		BIT(7)
> -#define GUC_INTR_SW_INT_6		BIT(6)
> -#define GUC_INTR_SW_INT_5		BIT(5)
> -#define GUC_INTR_SW_INT_4		BIT(4)
> -#define GUC_INTR_SW_INT_3		BIT(3)
> -#define GUC_INTR_SW_INT_2		BIT(2)
> -#define GUC_INTR_SW_INT_1		BIT(1)
> -#define GUC_INTR_SW_INT_0		BIT(0)
> +#define GUC_INTR_GUC2HOST			BIT(15)
> +#define GUC_INTR_EXEC_ERROR			BIT(14)
> +#define GUC_INTR_DISPLAY_EVENT			BIT(13)
> +#define GUC_INTR_SEM_SIG			BIT(12)
> +#define GUC_INTR_IOMMU2GUC			BIT(11)
> +#define GUC_INTR_DOORBELL_RANG			BIT(10)
> +#define GUC_INTR_DMA_DONE			BIT(9)
> +#define GUC_INTR_FATAL_ERROR			BIT(8)
> +#define GUC_INTR_NOTIF_ERROR			BIT(7)
> +#define GUC_INTR_SW_INT_6			BIT(6)
> +#define GUC_INTR_SW_INT_5			BIT(5)
> +#define GUC_INTR_SW_INT_4			BIT(4)
> +#define GUC_INTR_SW_INT_3			BIT(3)
> +#define GUC_INTR_SW_INT_2			BIT(2)
> +#define GUC_INTR_SW_INT_1			BIT(1)
> +#define GUC_INTR_SW_INT_0			BIT(0)
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 862e810ef407..cde80eb09d07 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -186,11 +186,11 @@ int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt)
>  }
>  
>  #define GEN12_GUC_TLB_INV_CR                     _MMIO(0xcee8)
> -#define   GEN12_GUC_TLB_INV_CR_INVALIDATE        (1 << 0)
> +#define   GEN12_GUC_TLB_INV_CR_INVALIDATE        REG_BIT(0)
>  #define PVC_GUC_TLB_INV_DESC0			_MMIO(0xcf7c)
> -#define   PVC_GUC_TLB_INV_DESC0_VALID		 (1 << 0)
> +#define   PVC_GUC_TLB_INV_DESC0_VALID		 REG_BIT(0)
>  #define PVC_GUC_TLB_INV_DESC1			_MMIO(0xcf80)
> -#define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	 (1 << 6)
> +#define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	 REG_BIT(6)
>  
>  void xe_ggtt_invalidate(struct xe_gt *gt)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e00177f4d294..d18f2e25ce56 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -357,7 +357,7 @@ static void guc_prepare_xfer(struct xe_guc *guc)
>  				GUC_ENABLE_MIA_CACHING;
>  
>  	if (xe->info.platform == XE_PVC)
> -		shim_flags |= PVC_GUC_MOCS_INDEX(PVC_MOCS_UC_INDEX);
> +		shim_flags |= PVC_GUC_MOCS_INDEX(PVC_GUC_MOCS_UC_INDEX);
>  
>  	/* Must program this register before loading the ucode with DMA */
>  	xe_mmio_write32(gt, GUC_SHIM_CONTROL.reg, shim_flags);
> @@ -848,11 +848,11 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  
>  	drm_printf(p, "\nGuC status 0x%08x:\n", status);
>  	drm_printf(p, "\tBootrom status = 0x%x\n",
> -		   (status & GS_BOOTROM_MASK) >> GS_BOOTROM_SHIFT);
> +		   REG_FIELD_GET(GS_BOOTROM_MASK, status));
>  	drm_printf(p, "\tuKernel status = 0x%x\n",
> -		   (status & GS_UKERNEL_MASK) >> GS_UKERNEL_SHIFT);
> +		   REG_FIELD_GET(GS_UKERNEL_MASK, status));
>  	drm_printf(p, "\tMIA Core status = 0x%x\n",
> -		   (status & GS_MIA_MASK) >> GS_MIA_SHIFT);
> +		   REG_FIELD_GET(GS_MIA_MASK, status));
>  	drm_printf(p, "\tLog level = %d\n",
>  		   xe_guc_log_get_level(&guc->log));
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index fe1d5be1241e..d4fc2d357a78 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -561,8 +561,7 @@ static void guc_doorbell_init(struct xe_guc_ads *ads)
>  
>  		ads_blob_write(ads,
>  			       system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_DOORBELL_COUNT_PER_SQIDI],
> -			       ((distdbreg >> GEN12_DOORBELLS_PER_SQIDI_SHIFT)
> -				& GEN12_DOORBELLS_PER_SQIDI) + 1);
> +			       REG_FIELD_GET(GEN12_DOORBELLS_PER_SQIDI_MASK, distdbreg) + 1);
>  	}
>  }
>  
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
