Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9D9CAC582
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 14:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB5710EC70;
	Fri, 12 Sep 2025 14:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oz5GR5UF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E303710EC70
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 14:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757686999; x=1789222999;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eLnQMBvHjl1chEGw10OIqKveOTavgTMXMTtce4S1+uE=;
 b=Oz5GR5UFaXQ+Ucw5EshekGUq/ntwr3RUlCls7XhkQ+sT+17N8qlgs1wJ
 dFYjOZtIvXiB7qtoco1nhhu1OEDIN88BKrrrpKAmrN3r5+YjVWDl3G4N0
 QrItVphenoO7XHp6dFUTgHwUI0aTE/C8eK2LhFNYPozAwInuQa2LVhnhW
 b34kB6ROmFnME9snjpctdukm1fKK3eO8PINg6OOnuAyh2Ee+lZ3SWA3dt
 MLUFYrzp+Xe9IaCOt6Eb4f51qXuSkUrtXpzDthMlm4pyEakEzFsJDNc7F
 diQf9aDVAUR6SaXwM8nfearuqRl3gQqGB4syQZV/sOThYlC41fuWaUMNh w==;
X-CSE-ConnectionGUID: h0MCbrMcSnenM0gXqah1Fg==
X-CSE-MsgGUID: OPm6tqpzRlCVPb+ZtS3m6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="60179754"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="60179754"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 07:23:19 -0700
X-CSE-ConnectionGUID: UsVlAyezT7eBFGf7X9KWGQ==
X-CSE-MsgGUID: 8RhNgTHOTSqjqJo3YaZ4Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="204970895"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 07:23:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 07:23:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 07:23:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.86)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 07:23:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDz83kHdg0/YuaFr6imnayAKjpMhe4XgchO2xiy4aCIovMdLe98uLy8Y8KgQmWSuSQK7yAFUDB7avleiOcx2ilcbDM3Ds3klNCNIDorLmBj/zGvedGI3OZj2DnnATXGKk/+tXRMyPWsyAWLDaTur3y80d2ZsW28aW2WHDOQ2s+EhpYr58aAE8EJHs9QhvrkI1vOB3JmMxNXcvHEy/HcpGFRLc7rIAFyhz7nhlclAGruKUhhGq40os3Z0UzC4F8hZj6es6sihzbv0w5pD0Rus3uI07abPHk/Na3ifHH8yxCmv6FXMn8EaJQUrNEOLZt2zENPWGh3BT/KsVR+QZeQ89g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrkkw+FbT+nmWdGDQ4L2gN167SGX/Snci4W3lT2Hus4=;
 b=oEiwwjpjIMuPP4tyVkbcoyU1ksAiRJqI0xTHbtFuWDE081b1IteVh4XJ/7G+fKp3Y4Sdy7LS5lvrOY1kIvIKijEsCYmwK4xkUztPhgdcN83sb330y/8HGgCOoZlIPD2eZNkNeeyRNmz84Lf9nRFLj2j/e7bzql/IQ4lKgwd7Thq8chl4sYsYy9zkDS9grDiOTuCCXff6QmL5WqG62ch3xpEDRsK8ShDXLhq/BVIsxcg/Xgv+rqcC4G3it/p40sGKnwLVvgmEbATD/kFNvwTsPFkAMrtsxgMPPqzwv++MVs7ewU//9PSVUbfiAOlWHFfQMlZf8TXMq/uJ3UmZU4vIew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV4PR11MB9514.namprd11.prod.outlook.com (2603:10b6:408:2e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 14:23:15 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.018; Fri, 12 Sep 2025
 14:23:15 +0000
Date: Fri, 12 Sep 2025 10:23:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v11 05/13] drm/xe/xelp: Wait for AuxCCS invalidation to
 complete
Message-ID: <aMQs0Mtvgf4tdZwR@intel.com>
References: <20250821141458.72876-1-tvrtko.ursulin@igalia.com>
 <20250821141458.72876-6-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250821141458.72876-6-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::18) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV4PR11MB9514:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f7a204-d0a7-4e72-33c3-08ddf207e9a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+D7ziW/C+Mss9ZdZualrmhPitWwplwsvshItNhKIL4045Lzg+ypVGwGeRv7G?=
 =?us-ascii?Q?kLSdvm2Wr1GrUXn15a62ol2ymfwEiOcIm1QV3R2Xx3wlSQoBNG2wlgauv33r?=
 =?us-ascii?Q?PT4WEf1AZi+PYSi3EfhM9TlAqyEpqdPQUNFBXrhnKyxGMwzpQJjQUlZSXEj4?=
 =?us-ascii?Q?eOS9xbFWW+dzlOSebuOtBZorsXQNAzfAe/oXrHmNjYdx9KLuK0lhj8rULewe?=
 =?us-ascii?Q?Ii0uDDL+7U/I3nsXmBhiW1W9NWESYA16Jc/rTQ8rpGzwyNdDl/E0jJLg3Tht?=
 =?us-ascii?Q?TWstb3ZfQNUjLvTtJpv0HEx6wz/MvciVFeD5YAmy9WnZjPc2nYrGlHfxrEQb?=
 =?us-ascii?Q?uAOCLwcEJVXsfl11HhO4YoankSGfYlVMdjaPmgR9FzHjCGOay2Yqq55tarsF?=
 =?us-ascii?Q?gZFGzqWzkGfp1JqSiFxRxQmgCvBU4dMnA6qylCxk9yTHn3jkCo93/b6AOPfv?=
 =?us-ascii?Q?SShxo3+UhAFmBkeUoMlVhfELu1jZSXvMg84xRmgyXLZcT5GwMho2ooAk5ZrQ?=
 =?us-ascii?Q?1YAKNFm877g7tSKpKyZQBQeQY34+FKrzY53VesQnB55Q6TFXM1Nc7EK6QKZP?=
 =?us-ascii?Q?Gk54A8nWVB0N0H7ag/uhrW3YUMDzLwJweDX0hKwb8+rBMt2gCI3ZCin8XNQQ?=
 =?us-ascii?Q?MDbcpAMSKmAe/nzc6mlu3nqkInLCEJ9w20zUsPmLzJ0YoiRI766E8H1Yf0Z7?=
 =?us-ascii?Q?il7JlyJRM7D18qqK1LPSEtDKWmHgdm+KOThd0LfxZNdDCTvLbg5ZzfRjY4+8?=
 =?us-ascii?Q?jod0CnYaTJDVe64+ktANS0Eo0bmzzh9cjLcQWtIFh++XWUT9jBSRk6VFCwtb?=
 =?us-ascii?Q?CFrVhI/LX+9NhtmYUqRabKKnGvWfBdYgaAtluaz6WNKx/KaOV3k288iT3FWG?=
 =?us-ascii?Q?Q8mZxRn2DoTRBsohey/oDT8149RRyxdxIUxWDosOGJrnsIJ0a6IV8qvSN47h?=
 =?us-ascii?Q?Do8MNmLs//Z4mdjGi/3eJnYGeU3iLVNXc8GjVahPoxlPWvy2ktK1NG1kYokU?=
 =?us-ascii?Q?HU8aFXJAk7hdydRuB5jWQASQ9Hz0A9gZYm1UiGQCoSC/mbtrnusuT1p0udqU?=
 =?us-ascii?Q?XYICUPXAkV0GUv5wqyE8XFuYcjE+JoOyLgxb04f5UDptc0HDsKzpZZUTeeN5?=
 =?us-ascii?Q?S2yxLYkKRf4HqQBl+XL6r7tB7Z8WAZUX/7HlZl+Ovn7w3Nx/oM+0sqZg2mHZ?=
 =?us-ascii?Q?KJ3gIcwm9IRAdYHJfoSPJGB0n9NRxu3ueKMTcjEF5y/hqeiUpuJ8QpunHV1s?=
 =?us-ascii?Q?+/1Zv0hsOs/EJL/cwxeoDlqcdC3oz3bj2RGkKTFugALiFnkVgl8Dj4gBkJjc?=
 =?us-ascii?Q?p0KChxVU3RB4FGUt/ktifaLn7CufC04VJlkDbMncJuo3BCXo1ikcqqOwGKMc?=
 =?us-ascii?Q?wR7R3jg46cuFejrDxA00KD9J5gd09uYAmppKwnssfmp0cjPIXbpKe7n3n5++?=
 =?us-ascii?Q?NwRDrpLLZd0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4BZpiWEtkrOSNinWhOrdjrypIZADy7/S7jXTWVjdcwivembveMT2cttH/l7S?=
 =?us-ascii?Q?FudHH/pjJeYv8gzfKWiYhklAlh4eW9xG81axBz02QawHoW6uRqw2boVRodoR?=
 =?us-ascii?Q?y55mkZX1H8vk22lNpYIvtruXVuQzsyzQpJXcen+e4nn/FEcXBMQiaA5qWos/?=
 =?us-ascii?Q?pPN9ONU6slQuvJ9wW1/XoqpvNgjCrd0Tv0lNp+4Xhxh90Z70P9eSd+i49pxc?=
 =?us-ascii?Q?WVcwyJqhPSv6EW6LfgjjiZPOSO9wcVR7kPZ6isU80/eJYJh8/vy0BmW+3DqM?=
 =?us-ascii?Q?MtOdOkNp2QJ4SjyL4mAgEF7r5yZzhV1GTYngroGfE2RBktgQ7L0QTFS6PAyx?=
 =?us-ascii?Q?LH5EL71JNxb5ENJIrTDg+cOPF3jCvSbJZvmBrUcWUWc1jwbRavQ+3TjDys4U?=
 =?us-ascii?Q?04V4yCwtIgV6DMfRz3DdrejVN4B8P+1kUVN9ecyl7gGAlM7v9HXh46xp7+1n?=
 =?us-ascii?Q?BFWcMdQpDlEsCbqe6vIqvtcCcudB0DjFJjaJr/RQ6E7uqzTDhKoLrYG647d5?=
 =?us-ascii?Q?jU39PFAA2T/ajtuH7VRmck7GhKtGXC5TDOkgD1bDc+FTuOssA/6sDLxBkVp5?=
 =?us-ascii?Q?ebta9Nlg4/M0jGj06zq/9jhsFIx47hSJiCN72wMOQ46/FS2sNebvtQuZU4V6?=
 =?us-ascii?Q?ldjwMm+SALUMPrSaUE8YsrRCxvyVaTd4eiOGWMtyupcWHeaTd6qbaDOiCwV3?=
 =?us-ascii?Q?fsFtxlVemRxsGpDyZgQvTCEhNbk0M/SViV0xpu86iC9zP8BJH94Gm8g/c6rh?=
 =?us-ascii?Q?xSVOzcwa1uE3X+EwFYPFxTyonmKSjNieEU0LSEo0i9o0lJDv4dsJB0lS5koB?=
 =?us-ascii?Q?14N2ATBoEyL5AsbSdU4jJsUY5uMNioLO5wy5VYLN6fsnaMaU1eH44Nbq732g?=
 =?us-ascii?Q?BGaTdS3Itbfu+dRvzvdMTyloqkMR3guIrKmueBlOmm4Y7DWxcBLYaaeNBNj+?=
 =?us-ascii?Q?mzJ/b0f1EoGuWc3faWLFoXOybIh0gspi4daJRjG01DY0uye0dBpNcnu5fpcB?=
 =?us-ascii?Q?N3wPmmCxjXbLS1KknK0+Ikx015ZJ8u0NoujPHC1vaaPNmECz819U/6+/GGCp?=
 =?us-ascii?Q?zYvHoIsFKmYRVzlckz88QZpgxuie1l6nmfekegKDP9YnsPho+S9g8LLmlNi+?=
 =?us-ascii?Q?QF18G89OWawPcMQuTILKvu6Ex2dD75Qq8TEYe+od1tkToiIqcd1czAkE5fjT?=
 =?us-ascii?Q?eCQrLXdDCRx4KpEyUYRgLZWlgwz7qcwA9EqDQmS8IdjA05FxYSBypuOsqhbf?=
 =?us-ascii?Q?NpdhsenkVGlnml/FEa6SbKXUvqlieM0lcQsgYu6dpP6Yvl3jqkv2qA2AeErh?=
 =?us-ascii?Q?Q1NUq3JrJeCrDh29jqSwvMZ7g4PMod8nktEerq9/+fDZKyso6siYxLC7IPOQ?=
 =?us-ascii?Q?GVouW86nITKDCMflkByvxMV14Mg9PhWqrohWQ3/IrL3mBJa+D6okYlmgurAK?=
 =?us-ascii?Q?GHSfJIiA4sI55BIQrkiGAM/YJdIPufyU82dY1l88b5IZyvnyfuuinr1ilskM?=
 =?us-ascii?Q?C2XeIBYwX7Zo0l60eTm0eASbXf4HXbYWr6i3TGfzXXbmeRXb3VvcCZpBhVwg?=
 =?us-ascii?Q?ZodkvDmfyeSkQXJP7DcLNdu2Au2lf3xgliwptgsw1WuRVMMfYQP8rI/TRA+P?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f7a204-d0a7-4e72-33c3-08ddf207e9a1
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:23:15.6589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQ4UNtfioFVMZznJq2y3NwRNx/uqlYYEPzLadDuxwO8isFpQfciNPzDW23UbpiLAmouvwmgHixrM1YlSv1wn8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9514
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

On Thu, Aug 21, 2025 at 03:14:47PM +0100, Tvrtko Ursulin wrote:
> On AuxCCS platforms we need to wait for AuxCCS invalidations to complete.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 6 ++++++
>  drivers/gpu/drm/xe/xe_ring_ops.c                 | 9 ++++++++-
>  drivers/gpu/drm/xe/xe_ring_ops_types.h           | 2 +-
>  3 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index c47b290e0e9f..49d8ffd026d5 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -81,4 +81,10 @@
>  #define MI_SET_APPID_SESSION_ID_MASK	REG_GENMASK(6, 0)
>  #define MI_SET_APPID_SESSION_ID(x)	REG_FIELD_PREP(MI_SET_APPID_SESSION_ID_MASK, x)
>  
> +#define MI_SEMAPHORE_WAIT_TOKEN		(__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(5)) /* XeLP+ */
> +#define   MI_SEMAPHORE_REGISTER_POLL	REG_BIT(16)
> +#define   MI_SEMAPHORE_POLL		REG_BIT(15)
> +#define   MI_SEMAPHORE_CMP_OP_MASK	REG_GENMASK(14, 12)
> +#define   MI_SEMAPHORE_SAD_EQ_SDD	REG_FIELD_PREP(MI_SEMAPHORE_CMP_OP_MASK, 4)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 752dea0a9234..78d8120c4a0e 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -56,7 +56,14 @@ static int emit_aux_table_inv(struct xe_gt *gt, struct xe_reg reg,
>  	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
>  	dw[i++] = reg.addr + gt->mmio.adj_offset;
>  	dw[i++] = AUX_INV;
> -	dw[i++] = MI_NOOP;
> +	dw[i++] = MI_SEMAPHORE_WAIT_TOKEN |
> +		  MI_SEMAPHORE_REGISTER_POLL |
> +		  MI_SEMAPHORE_POLL |
> +		  MI_SEMAPHORE_SAD_EQ_SDD;
> +	dw[i++] = 0;
> +	dw[i++] = reg.addr + gt->mmio.adj_offset;
> +	dw[i++] = 0;
> +	dw[i++] = 0;
>  
>  	return i;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> index 477dc7defd72..1197fc0bf2af 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> @@ -8,7 +8,7 @@
>  
>  struct xe_sched_job;
>  
> -#define MAX_JOB_SIZE_DW 70
> +#define MAX_JOB_SIZE_DW 74
>  #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
>  
>  /**
> -- 
> 2.48.0
> 
