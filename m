Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195C7C35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 22:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58C110EA9C;
	Fri, 15 Dec 2023 22:34:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DF410EA9C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 22:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702679674; x=1734215674;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X8bB3UIqCdSlenKKoeyuy0ru1uo1XzAoFe+D0ksParg=;
 b=iTdj3hk5Wx+t8xtA2NHDq3Ng76UNKbWKgG/N+jkWXnn+Z31zQIlXS5Ao
 nYzdaAB4R+wfi/QSvJ7AeHU/Alhdy3pnjoX3NSqZdF5KN0vVajIAUFqvl
 oKcvt1sDdeNLNs4oWKK4hXsrSnmDjorHUJyJNDiz11EEQeVzybWkasA/l
 9wPQX6u2uV3Unvw5jLm9r82wKiakOENwS7ELEV8LIrWrPEL34R8dsokT2
 l0yGwlKQnLgW8ZrS4j9OiHKHat4U2Sdv5VWT64Qki/S6OgWW85THn0qdv
 HM1CTZ3dsR8FpznKf3kGEo32b63UDMiospRdLZMV/T6YyBKktnULHk2Jn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="426464804"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="426464804"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 14:34:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="865546536"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="865546536"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 14:34:34 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:34:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:34:33 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 14:34:33 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 14:34:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyVMMnNfto4AU81yR1OleyrB12mjiOt3nSZChiCns+rTqt6RpRp98n6Y7jAefTzzEDC47cet5+amXcKfikiWEuEER4D4YJzVQS59OvVFouWmCkLZGfkBcgtJV7bnYykrUyvzqndsgH6n7kEHJKVbFzfE/fcTvZljX5H3WzsSI6WJWZbsoggV8KYv/nm9KnWIjqemIbl7t/TONnl5Zo5bHuvjmoaBbieFHshccLvnMq5xurfjmJquyK3y63Js2u8nosLhgvZ3c/xol0j/z5iPgJhjIGefhZjESUEfjPZImU7UZNAp9Sk76K8CjU/KiCcjswGQL/VeNXhsTuoPMAg8lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TogPMiXicCdlnt4s7/h3rPVqr/RPAPakUk91Xqz3NPU=;
 b=hkk5g1Od39AuLsjeErtv+IRmLVqgLz0YA9vF1WSXa+GzGFbUzHSNh8CAMF+a5XWya72qxBNN/Da89WBnQnDDAsTKQHlKshUcJ9yNf3Nfno26cCO4GHtsR8wm0NyI6VItuTCDzPUj1P/l6IzeRYJOqS4KhxhSQOqT9iCiavUdPIJvNCG7XCXXdvTHxqM8sGPr+5v2SAGw0rBWq2ypnjE2IZpC3+nWzAPI5+vU6n/AtA61ll1q8o/CBcxWsltduiTPrrYRUqbaoq3y1VsswLeQe3cvUcp3evmejpjUjplBJQLxBvrs8D8SQrxtCCav54dvYGmRoV3Dp7F5nT8jxo+M3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6384.namprd11.prod.outlook.com (2603:10b6:8:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.38; Fri, 15 Dec
 2023 22:34:24 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7091.032; Fri, 15 Dec 2023
 22:34:24 +0000
Date: Fri, 15 Dec 2023 14:34:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 01/10] drm/xe: Add command MI_LOAD_REGISTER_MEM
Message-ID: <20231215223422.GY1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231214185955.1791-1-michal.wajdeczko@intel.com>
 <20231214185955.1791-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231214185955.1791-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR07CA0093.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: 3711a523-f249-4e18-95e0-08dbfdbdfd7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C48QOwRlnhbm/gVIhqvvq78BEdG7tt3cbq4rAH6/jw+PuPJkmn1opgJxWurJLSEGxtNOnP8BJbz1CYvILHhzwMabjHaZ2osf4FKWEALhDzemWCLpQQCBLJnuuH585OM/3N7lNwTWMHhvcFSPd2TMM+Ar0PgJ2srxZ4d3Nc6xoQZVfubqFbJoAwJYOrNAyETrCYE7Ptx02/QnOol+5dOme5EKZNarNN6jvYV+Db4idN1bq1E2ZT7NwUy2YpwcJfEYF8xgOL6ILf3cAuD4XMXF2n6QASsjIR1sCNPgBfHLPUvrf4xtB2N39j4UNrx3iADxiTpxBtb1YIgo8xHpOL9ITOD32fFCc0uxiVD9AeTc6r4agMDEvUCFzx3zYKBTQDKKSNjTmmBPgP+yOdGAaczbuOuwAZxDXZtJeP0BnSAIFix3XPuf3gi5Dzi8AO4vzfOBNJcppiQkQ/oFnD9baewybiuCSgvCd27oBhMbSjVdBD3zI6JIWNBFYonq/uyWfAz6zmZd4jR1j8lGff/J2jJmK5nOJNTfqtuUFgefPdDDtO7R5P7DmDywDHjTpx3HhGDU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(82960400001)(86362001)(316002)(6636002)(8936002)(33656002)(38100700002)(6506007)(6486002)(6512007)(478600001)(1076003)(26005)(66476007)(4326008)(8676002)(6862004)(66556008)(66946007)(41300700001)(83380400001)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HS0oL4nDArL53xsdX1jHY1j6/Os3iXVNige+NoWLYKS5KFVaQ60oyXlwlt+b?=
 =?us-ascii?Q?NC9PO73rlq+PlTZDk0SxpaC55Lgm6Zj2y+kGnjKn+WcOwfeAah4zgzuqJ0BV?=
 =?us-ascii?Q?oFfAp0NM4kjIBCA8PnmGVoH4Mwl46qEp5f7B1XzUde2xqmkdGRIzPjUFOB+4?=
 =?us-ascii?Q?pphSXMDMU8R9LsUKRv4czwMCpF7JZfRKXmfl0aSoNyqn7x8DJbeztpCAno6k?=
 =?us-ascii?Q?rBZg3MXJU7/xfwvEM4l5yNVEMfAKZosKxDsOt26tDb/wtH+3+qosccsD/52T?=
 =?us-ascii?Q?P7CyLnrLu5C4L/GUoFmFvmF8SSHPRy4CIiOlPxf3rjriwvsHJsTwQucDdbMv?=
 =?us-ascii?Q?+FhS0UohmiD/Al/LBjZf1wCXHI2n72bnyNXpmuzmKyI/ggZtQnQKK+q2Jcqd?=
 =?us-ascii?Q?97o+WiGoB2ZDCgVdqOq2ZGhg1L9ciL7aPIno8o69yXxAkdg+o/sqr2fswUOH?=
 =?us-ascii?Q?/Wx1lbuXVHEwKgHqhlOZPjyxQaEIYn7P+3cxCwcUvxM8b1zCB9XBSFNlnGRF?=
 =?us-ascii?Q?horo9ljoy52rSGvZ+uzgTKLyQDWEAyLb19yXJijVX8a2HoK73Ih5fafQZ4fy?=
 =?us-ascii?Q?uDLqSxGUMU2pvur2tFbx8043+q7asklStzfMWRHucF2ENH6pTNPSjECOdKHA?=
 =?us-ascii?Q?y3JfZlhVdaUaLgKt+A/VByEGZHOQk04CBT7/NeiBhMM1TufoxjyYXo2oLl/r?=
 =?us-ascii?Q?h2WNDJhffDfk1PX7bMi+sPRKQ6RNhll/TiICE79J/yN3B7T3CITZKuyio2pt?=
 =?us-ascii?Q?DKeOnx9Swew1Su6GkTXCgAQFkRxyhcE1a4sIFyhyh7Y6LzIKZknKm0um/dlF?=
 =?us-ascii?Q?jqn5xeakqtJMAcbyLheVMaJ3wdJNxHdnnnHgyEOwfgw1VNP2WXbjVbZk1s0g?=
 =?us-ascii?Q?VQJbUaSyx82sK7PgvUXllKWl/uSVxW1V7+NObE7+euWuMXFc1FzwBvKCF6RN?=
 =?us-ascii?Q?6NNkWQYJYSfgAXC7QgNkwZvLPtWy+KJghjLRIQWEQBhKK3B4QgqqZ04bQ1GQ?=
 =?us-ascii?Q?v2qttNPq7KXs3uWUIQ2x4tyvHvYvjZQ648C24RZKrO6L62aWA9ulOYlLS9zz?=
 =?us-ascii?Q?K5s6RRAdKO0JPNN0QRKbeKhhnWKf/2C+FJopBuDw80dZKi6Or3QKlTwFYEuI?=
 =?us-ascii?Q?xebMa423vxCFfexB/DDNfMKjmF04X/mn0GP5TF7j0tv3etNcU0Kocw9lrpkC?=
 =?us-ascii?Q?Z+5GhuV228EzOctyC0YooFw+SvODn7x6faCS84WsUFR/QAWakX5U1QlEaYPd?=
 =?us-ascii?Q?3m9+ODMcTAPAsQjNdOVc5ZPGvYCTsa1vIpsXky8xJ2hsccGIXXzd+w3/hXjs?=
 =?us-ascii?Q?JMzF4gPbHThpSnyDRt774IK96yMgPkQI5ZDTcP4tU8uPRQEk7RXdP7/NR+o4?=
 =?us-ascii?Q?h4h04ZncZmQ8rztIwlJt/rhEyr/D6oH6sZt9uluKMP5HNfEB8mJSaR4TFwrb?=
 =?us-ascii?Q?BhfljXa9tEytVrEzVLkvkvb7aakywFvvmFD8TwTU3EGI/Oxzm4cmUDrmjQTJ?=
 =?us-ascii?Q?07AJJYkx21vnD5VGFx104ciZR2Bto2zn646QCDOFwrsokMOp1NLOpiCZeIF3?=
 =?us-ascii?Q?YkzEzF7HSb+vAnr8HDX7kAxx/3QF9Hn7m7yzwNyYaagazHKzVZhPgvez3qYl?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3711a523-f249-4e18-95e0-08dbfdbdfd7b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 22:34:24.7659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dk6nZbc1ahRsMJV2xw4Rx44sEWTYn4aBHVf8mG48x2rx6j++QKQRB6PDQHED3KiRrR0z/x2h1k71AHhy73lL2xjVO3g4BScSFZonPExJfvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6384
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

On Thu, Dec 14, 2023 at 07:59:46PM +0100, Michal Wajdeczko wrote:
> We will need this shortly during context state preparation.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> v2: update dump_mi_command (Matt)
> ---
>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h |  3 +++
>  drivers/gpu/drm/xe/xe_lrc.c                      | 14 ++++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index 1cfa96167fde..c74ceb550dce 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -56,6 +56,9 @@
>  #define   MI_FLUSH_IMM_QW		REG_FIELD_PREP(MI_FLUSH_DW_LEN_DW, 5 - 2)
>  #define   MI_FLUSH_DW_USE_GTT		REG_BIT(2)
>  
> +#define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
> +#define   MI_LRM_USE_GGTT		REG_BIT(22)
> +
>  #define MI_BATCH_BUFFER_START		__MI_INSTR(0x31)
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index d6dfbd0bdc70..c8e242d8fb09 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -966,6 +966,20 @@ static int dump_mi_command(struct drm_printer *p,
>  			drm_printf(p, " - %#6x = %#010x\n", dw[i], dw[i + 1]);
>  		return numdw;
>  
> +	case MI_LOAD_REGISTER_MEM & MI_OPCODE:
> +		drm_printf(p, "[%#010x] MI_LOAD_REGISTER_MEM: %s%s\n",
> +			   inst_header,
> +			   dw[0] & MI_LRI_LRM_CS_MMIO ? "CS_MMIO " : "",
> +			   dw[0] & MI_LRM_USE_GGTT ? "USE_GGTT " : "");
> +		if (numdw == 4)
> +			drm_printf(p, " - %#6x = %#010llx\n",
> +				   dw[1], ((u64)(dw[3]) << 32 | (u64)(dw[2])));
> +		else
> +			drm_printf(p, " - %*ph (%s)\n",
> +				   (int)sizeof(u32) * (numdw - 1), dw + 1,
> +				   numdw < 4 ? "truncated" : "malformed");
> +		return numdw;
> +
>  	case MI_FORCE_WAKEUP:
>  		drm_printf(p, "[%#010x] MI_FORCE_WAKEUP\n", inst_header);
>  		return numdw;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
