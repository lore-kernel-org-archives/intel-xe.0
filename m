Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0E4C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 17:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DD910E02F;
	Wed, 26 Jul 2023 17:12:45 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E23710E02F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 17:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690391563; x=1721927563;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zf7aWnq8h++9jE4XZrItecm2A/n4ZViZxoF/D4hwj4U=;
 b=YrJ8b9rETGgKvVa41nVtqWU23TXiL7QvMOabWbi1g7U4IMxvpYz3Iz+N
 FatcryP/wyZvKbHZ3OiykkSWFgEU+L4hBFEatUz5JDTgod/TIebgUrR02
 DD9WATW7+KuojXesGeJ8stEi5kOkUu29E24ny2g+Bbyq6vxcvnW4m9mul
 dDtun7jlWh7O6/1ZcOWtGGRL/NwbA9+FufyICxNDUrL9Dc85Uexv8UjED
 lz1q6O51GQZ+M7px6b5vGuBGgH3mU5sPwMGs8VG6ffizNPD1zkbOXJeSN
 la2io9PuBTNNNNjJ/jueXh/Whf1IWSzcKBYp6It7Gc61OyCu+Ue1GTRMK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="370757365"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="370757365"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 10:12:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="816760661"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="816760661"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2023 10:12:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 10:12:42 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 10:12:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 10:12:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 10:12:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/JNfDdIWoCro5UkdMEcuyQrcATpVevEPXmMZfCNSL9zsFl7GwmfZchbDBnOiPWLmNlhjD1dHYlo4YaQ40fAr76fnOU0YoXIRvp2YXexCmem77H3P67oC2yXGE1/FHSbhwmsa/5kxZn04F6m+80OCrSC6zndVCtfQxQatYjanpCXT9vgfNmBQlBm7NI9grPtcFM6g/YVwjNUOxIx31cZ4g4AntaGvbl7dR23kG3f4lFI+i2utRrE//1LQH0zKrhZQLEGYcV1gUMkcLe4Nm4yLvbxmHPklnm2rmYoFB8UjKyxUA/mmERrmgErXQYVq6df61PxKf6in8HJtFCCfK39bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxtN+sKlyUM+hlDXDmdI/a6dAW3fV2WD5tv9gC2kw84=;
 b=UmRSwLoa54Uo+GuXEQn1J5TU/Y6FIwZAl9g0qsbmmQrwUSW1FYYbrTobKdVrNCFlexVR3OTfp23mEmG0CmvBZaot5rHupY/QbItVuLtcjxvPWO1dfjYLxWLY0QNNyFDVv+j+n0FyuYKLCl9767bQpZEFC1XAMZMAGAYTQwi6o46Hm7p+jCayiSuUt3iy27ytFaXJDouRuVk2Obaw6T8GhOmRt1ZWNn/gmIKg9MmcrvhalPfK9deR20dq3O6+llFu4BtuRETjIYbC8JFREyUzPvhpEq/oOPkHJuAGCONx2MZTD5npwXIheQYjNLl0dORckCte+VvPw3SrNyhA+D8/ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB7244.namprd11.prod.outlook.com (2603:10b6:930:97::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29; Wed, 26 Jul 2023 17:12:39 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 17:12:39 +0000
Date: Wed, 26 Jul 2023 10:12:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230726171236.GU138014@mdroper-desk1.amr.corp.intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
 <20230726160708.3967790-11-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726160708.3967790-11-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::30) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a3ca641-cc8e-4cdb-484e-08db8dfb83be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4qIWVkb9OQKBTGKDSpGcLCSUhFVmo8CHlbT43AIOSIHkVxQbtX9ytCwTMeYcgQ3T6L4ChEjf7qN/mHuAxaP3F2h4W3P7z5HMF+j95rb16XPPa3AzLc/0i739fhJYHTbIoXVLyUObhkgv8gmBKt4mDCpnwu8r45XeB42vBrzyeajr/Ydz4wUwnVvbAA+/M7uAmRV2IB1IYZga67BK8vzNrAnFZ4dcvHoDy8Erl9944ur5hfp0geF7GU+AiLwppp5ifpCGt5/ReKow24982vM8dnmdqbd2osKE15l/vkICf8WQTpF2dYH1EpfMkorl0Thf+lbJX+X7SrwTFYDQvjEl5GHHQ/XsSoe9bB85HEZgRb3cjWcUTgw6UU7Ww50wpiCfg+3XKV+A8/wTd5E/2UrfYbvPEbXUChtRzPSJpE8Ezm/H4Jn+hPXMPrdNPb9hqyQgcb9TYyljMrWrn+G2XXgSDv0gy9VuZH4RW7B2blVO+z7l1w4Ulo5cun6PmC2Nax28LTMRgwtQm/VbAuHw/C8QuqenwBosb3j341kilEkB4h+765gV4QaHw8aRac9Qmi2W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(83380400001)(6506007)(1076003)(6862004)(33656002)(8936002)(26005)(186003)(8676002)(5660300002)(86362001)(6512007)(41300700001)(6666004)(82960400001)(478600001)(2906002)(6486002)(54906003)(38100700002)(316002)(6636002)(66556008)(66946007)(4326008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qggkYoBAM7UwOAPiIp5c9hghSA3zXONcUsLGaUz0V0BF2Dmaz8R30hXgc6ym?=
 =?us-ascii?Q?+mAOK/KnqKUVymGqcvBdAXK//MKw/Z2sNpga3uh42bJWkpP5Hx1VG9uICqHF?=
 =?us-ascii?Q?+Wi5cum2K4oizw+8cUS7EiOg0VFHmjLd2CskTiaB3nfD61p+Trh9rl2eIVrh?=
 =?us-ascii?Q?MZO/xSu/hDoI8A8qFnlbkraeDpGJWB38KT5p6rFoU2TYtUPV+9mnIHq1xJrk?=
 =?us-ascii?Q?Q+smZQDdrs+f6PupmkqStonH2/0d0gYwmm6cUqAuYWWS2uFAwh0WWPzwPoHD?=
 =?us-ascii?Q?wHOm699C19KDhPEi9DER2gnJt1bt3kw9oqGqvAI4EaevV4fC+Sp+kikZ9iej?=
 =?us-ascii?Q?W6retJ56cyZ1BaQo9aNN/XSNToS8ECdRKs2yXle2QJIDYtxX7ir/ks6eKz+x?=
 =?us-ascii?Q?JVX1B0tVRwZQS1mXSgtQ7zytZHMcNHotyd3siLEusENsiaHZmMzcI+Pw8sEb?=
 =?us-ascii?Q?tMNviyswInjbuuo4Gai68zqFvNUypWoDOmDxYYXLSxwqzsrQTGknVwrCN5QR?=
 =?us-ascii?Q?Jqp+k+hDggC3ZE7C14cDDTE9e5SZTiFNg3Hvramc5kQ5msG1kKaQTQ//wMVm?=
 =?us-ascii?Q?zew3aWiWQ+qTz4USN4jZ+IwMVsWubjhgdMZuKwN6euHFxPWHEJVPRC2lkZzN?=
 =?us-ascii?Q?6xjdOJBQH58L8KPSDAKRcb7SG9JNopcqNzfc1U6XAn7JPtW5o8M6NBwQelCE?=
 =?us-ascii?Q?92hrSVjuEFIRMWGPmNlZSjGsr5tl2lZcrNMoKstzqQZiIRdtU9trFxxX5f2u?=
 =?us-ascii?Q?3XaO1ydKI9wAdIQQzHslL1qt6BkzwrixAzKL66w3JhfKMisZ5Wn+Uex71KjC?=
 =?us-ascii?Q?rD7dBAy9V0cQiI969ooYyEomxG1gOYCXXLjg6MuQxu9xnQwzKgQN6HrM7f9a?=
 =?us-ascii?Q?bGa+axWJClkgvDOw17k35NRfDZaATtZ+P9eM8HB+Oc49JPDYCcz5lGfnBPHb?=
 =?us-ascii?Q?UB3aes3tgZAyOBuzXrUSUMaOhn3/ISiPu45/AQFqcnv+oi0IakCyze06vJRB?=
 =?us-ascii?Q?5s0nVUoW9HDDpkUl9ZqBF89YWB/CTexlHFjKJR4kz0DsBDHddkv4yM4q6HoJ?=
 =?us-ascii?Q?3jxvZwP3gDemtsIUP5aR+JxgGJ1mFlY7hcaVUOELIDDea9B2IpcB1Xt/o/eq?=
 =?us-ascii?Q?uVXqWzQrP+tE3DlbGpMqn2yk86KECq3Q3VGwIGXJPtE+8HnMjj4XFdD012hY?=
 =?us-ascii?Q?OsriZzsL9Zy0VCnoh6118IETmi2kxIQqf5L8r9+QPK6YCZ2AonWwFZCuQ2Pg?=
 =?us-ascii?Q?qEzBOuJOwsmYuF2KfVn7/4tWV7p14J1a07SdFOHWvs76M1Z5edypuA7suc8w?=
 =?us-ascii?Q?mGRRWMKah7GraJ0Oo5ysPWBU8f2sUUoOj5a2l5DopJGA1HT7WHqO/uVMYW3g?=
 =?us-ascii?Q?xhcL16/dOXoiQldFrB4bNHBY4bko0htkP4Oa9VFmXAVOCW49SQz+Sk+u9rcX?=
 =?us-ascii?Q?Wx7gLkmMGFBW8MBL+vFo6No0uua1PtbGlhlX+TJV4NmaEBPWFqYJk/pqAXbs?=
 =?us-ascii?Q?F6IwLyUxFUuH80TAFSwNntILxdFUALvFGOhtoFn7HL/yOqfwZa8xBz6C/uVx?=
 =?us-ascii?Q?L6uIMdgIS6UYFN5C/7pQgoNsFkMEIQQLGMwPAp4c607LEn5yvZ/zBrOQoj87?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3ca641-cc8e-4cdb-484e-08db8dfb83be
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 17:12:39.1755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjnBlvST9/Fhbj2HxqaCCn6DA4jCLLbsXX4FhmTZnn37v+QB4h1CbKGnpyDBBAM6ZI+3Hd4vCSJmkg1v9uhEkWoGzoaDPlgFEXmnje8wu8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7244
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 10/10] drm/xe: Sort xe_regs.h
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 09:07:08AM -0700, Lucas De Marchi wrote:
> Sort it by register address to make it easy to update when needed.
> 
> v2: Do not create exception for registers with same functionality.
> Always sort it.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h | 59 ++++++++++++++++---------------
>  1 file changed, 31 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 315f6f8dadf3..ec45b1ba9db1 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -7,9 +7,6 @@
>  
>  #include "regs/xe_reg_defs.h"
>  
> -#define GU_CNTL					XE_REG(0x101010)
> -#define   LMEM_INIT				REG_BIT(7)
> -
>  #define RENDER_RING_BASE			0x02000
>  #define BSD_RING_BASE				0x1c0000
>  #define BSD2_RING_BASE				0x1c4000
> @@ -45,46 +42,52 @@
>  #define FF_THREAD_MODE				XE_REG(0x20a0)
>  #define   FF_TESSELATION_DOP_GATE_DISABLE	BIT(19)
>  
> -#define PVC_RP_STATE_CAP			XE_REG(0x281014)
> -#define MTL_RP_STATE_CAP			XE_REG(0x138000)
> -
> -#define MTL_MEDIAP_STATE_CAP			XE_REG(0x138020)
> -#define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
> -#define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
> -
> -#define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
> -#define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
> -#define   MTL_RPE_MASK				REG_GENMASK(8, 0)
> -
> -#define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
> +#define TIMESTAMP_OVERRIDE					XE_REG(0x44074)
> +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
> +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
>  
>  #define PCU_IRQ_OFFSET				0x444e0
>  #define GU_MISC_IRQ_OFFSET			0x444f0
>  #define   GU_MISC_GSE				REG_BIT(27)
>  
> -#define GFX_MSTR_IRQ				XE_REG(0x190010)
> -#define   MASTER_IRQ				REG_BIT(31)
> -#define   GU_MISC_IRQ				REG_BIT(29)
> -#define   DISPLAY_IRQ				REG_BIT(16)
> -#define   GT_DW_IRQ(x)				REG_BIT(x)
> -
> -#define DG1_MSTR_TILE_INTR			XE_REG(0x190008)
> -#define   DG1_MSTR_IRQ				REG_BIT(31)
> -#define   DG1_MSTR_TILE(t)			REG_BIT(t)
> +#define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
>  
> -#define TIMESTAMP_OVERRIDE					XE_REG(0x44074)
> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
> +#define GU_CNTL					XE_REG(0x101010)
> +#define   LMEM_INIT				REG_BIT(7)
>  
>  #define GGC					XE_REG(0x108040)
>  #define   GMS_MASK				REG_GENMASK(15, 8)
>  #define   GGMS_MASK				REG_GENMASK(7, 6)
>  
> -#define GSMBASE					XE_REG(0x108100)
>  #define DSMBASE					XE_REG(0x1080C0)
>  #define   BDSM_MASK				REG_GENMASK64(63, 20)
>  
> +#define GSMBASE					XE_REG(0x108100)
> +
>  #define STOLEN_RESERVED				XE_REG(0x1082c0)
>  #define   WOPCM_SIZE_MASK			REG_GENMASK64(8, 7)
>  
> +#define MTL_RP_STATE_CAP			XE_REG(0x138000)
> +
> +#define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
> +
> +#define MTL_MEDIAP_STATE_CAP			XE_REG(0x138020)
> +#define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
> +#define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
> +
> +#define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
> +#define   MTL_RPE_MASK				REG_GENMASK(8, 0)
> +
> +#define DG1_MSTR_TILE_INTR			XE_REG(0x190008)
> +#define   DG1_MSTR_IRQ				REG_BIT(31)
> +#define   DG1_MSTR_TILE(t)			REG_BIT(t)
> +
> +#define GFX_MSTR_IRQ				XE_REG(0x190010)
> +#define   MASTER_IRQ				REG_BIT(31)
> +#define   GU_MISC_IRQ				REG_BIT(29)
> +#define   DISPLAY_IRQ				REG_BIT(16)
> +#define   GT_DW_IRQ(x)				REG_BIT(x)
> +
> +#define PVC_RP_STATE_CAP			XE_REG(0x281014)
> +
>  #endif
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
