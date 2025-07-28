Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4BAC83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 19:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6735510E190;
	Mon, 28 Jul 2025 19:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UR4/WDn7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6481510E190
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 19:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753731365; x=1785267365;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YdYlEPjbxjzieghNpBsErRJun6dOqAzemNAhq7+j2Fo=;
 b=UR4/WDn7qidFTz5bf7ZGdSVG8OaI4KfOng9tf3OFbPFl6oDEG+AkLaAJ
 Y5hiE5qcUSGeIbVxmseBq8UyqzJsaZO283FDVJ+2RqFJUuLioKtF+0eiw
 MKHLIvPRaqVGoMKe3+Mn1xIi3PzYhfTzFVISRPuvUBa6160igB6H5nkd4
 10eojvPkmQfB1Cm45atkPgUtsZqH1S89P5D0UNo9pUim6UT6A+4thTwnI
 etWyuj7c/meNbvZ75bbJBOheBGGlQTxrINbgciNf6iXR+wdRrOXs8487h
 LYOOvJ3Vx3OWngtQajm+Wqer7+OoC/ZTYSNcY+H8rnti5abEVC28ayJL4 A==;
X-CSE-ConnectionGUID: 7y48h1YQQUmlm9vOgknFyQ==
X-CSE-MsgGUID: eF8BlKO5SCWgkxmPGVqqcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="56068835"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56068835"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:36:05 -0700
X-CSE-ConnectionGUID: mb/CvEPgSwemUIXLThgwmw==
X-CSE-MsgGUID: KeSFeJxPRuWRBa3LR6U+Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="163278388"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:36:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:36:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 12:36:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.59)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:36:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVcxNi/UJOP38YaWZruoQi0SWVWPBjCW4gzMJVMRQJNu/H3qbV1owLcBkvLXQs6HWOfX+b/5vrlUyaS8sLIfz+vX8k/G92MLfOfPZbbjnJ8WvhRBgoLc5h3kva6CADp9t7i9RgORXwE8GNaBcdYvkwv6CpLx3XJOH1eH2m8aBkMwwY1TFwnkEJuYUcNnhmZJU24WX2ADJeE3HG3ySpbA39SRnq+vzIMt8aB5xkc/5b2rI4KdmDE3zhjgeMv/8W7mEA5LGcg3O8YOHuaVFLQmPhk+rB62mWxLn8/AhVI/oNfGFITAw122ugi/RjPnwJhJxnB4VgJ+PvoaqvOfM564Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I39zrmsHvsgWw9xaBxejeyegmiiqvwpG6phvn6Suh+g=;
 b=WB8t1zTm79d/fCxkeUt/ZfogwfKF2go2+z+T4CoGwbf/FScG+7S9Z3mgdePnIvc9b3s4ac1FWg9bsKhwOxuEmZ8r8mtri7efNRJTtAzrU2D/RubqOpLFzxh7550ug8xtbPWTD+RZ+m5raiYonhmJVYml/vyk9dU5CwoBjjeNDjhlZVc7foY90AP5+A9yMoBgsoMajbzsrqyVWeVjcbXiis2qLHCvT+pyEwPUzzCl4dINtkKhZLME1JmHmB6MkdAnNXP/Rq1nEV721iDewqP2ZFFIfxMsiTMONjoUcKS5P5Gr5iYEpSChPtS2CMFxOukeTeJH9jAMX7tdcWXMclJCSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM3PPF63A6024A9.namprd11.prod.outlook.com (2603:10b6:f:fc00::f27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Mon, 28 Jul
 2025 19:36:01 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 19:36:01 +0000
Date: Mon, 28 Jul 2025 15:35:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4 01/11] drm/xe: Simplify module initialization code
Message-ID: <aIfRHZEKzMeyCBRf@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
 <20250727172009.587-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250727172009.587-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: PH8PR15CA0022.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM3PPF63A6024A9:EE_
X-MS-Office365-Filtering-Correlation-Id: ef0485e6-a8a7-4c89-243f-08ddce0dfbb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mjA/UCI8gd64SOAPdND7i0KTIFg/A84haH9p4yimJ0kF1b/kotPhJikVIX1X?=
 =?us-ascii?Q?eHRuEUc0+e1CM8JmYLuyLIbDYbPlXYxYzhfGqVqBuT0AXUuTDzNgr6cxJsGS?=
 =?us-ascii?Q?vOArhhOwTzNpRp6x7d4GRqRPFNDitXRK/M8Rb9Z8FdsrOegb0S2O5WwEQvQT?=
 =?us-ascii?Q?cT++RTmWdxBItG65u9vHgcJaoBiO120oC6LEJp5CCV35lmKgorFDqjTu+5q9?=
 =?us-ascii?Q?+y9X6f66IIF6DPQ1GWzs4K6x1CJLXMTC06dI5iMdceIBhZ6ty9A2x0dHk882?=
 =?us-ascii?Q?IH+svjYMmzjOAUWaUVT6wu7r+wwv6EE8+mE9XWtooz7Z6HKzOzyKKYNnRK7I?=
 =?us-ascii?Q?kSXyvuqBSzSmYfkPSChlmECrLB70JWV9PHq31VWhYSaTAZdQ5eHd+etgboMz?=
 =?us-ascii?Q?9fN7NO0cGRi1jjh7BNTf7MpSWaLpyNYoeMl70Tztpj6i2La+v5db94tzNc62?=
 =?us-ascii?Q?2iyDdCK6DjSBakcLx/gx5ZnG/XydKJNnMuAB3uMBBvJLB0mRRS22VIXJQfh6?=
 =?us-ascii?Q?oNNlCGcJeUMN/8YdTboes7A+5y38DZF6L/2Amn+R/3c93aboNHmtOh0ERN1n?=
 =?us-ascii?Q?Yagyr4JP2ViV0VucFlf3njL2UQtUGjaiX9HDiMYQesztMGUPT0jVw4WkXLSb?=
 =?us-ascii?Q?4SD2KnY3+BM3Ac92C9CKwJt+rDYKz3CaE/lCRjK5biPXPFMXG5Bb1oGHIKEg?=
 =?us-ascii?Q?K5SVY52yIfN96qzk+631AJKsNNFBIMdAvWOND3WwAPjdHbm/HVvn5c79p7sN?=
 =?us-ascii?Q?K7g1t2+EM4ajE78/OzRx9sBxQdfZp5WRk8DN9iWgcYCPbv4ZQpW/kPXJY7QB?=
 =?us-ascii?Q?mU7ioOIj6161x861dUKnd33r81sbkLlgwvXc4d2IzeRyNr9zyeNWXIwfIz+A?=
 =?us-ascii?Q?fAnzRZTaf4XPApOAJ50QocregV1/0zd44KiMthAneMw3Cs8rpJYeYDhlnhDV?=
 =?us-ascii?Q?kfZKuec4ZNwaMw52urpJa+qouZItLh5YAHWGxtS6cNcpgqVMA45/GhXePDTw?=
 =?us-ascii?Q?+NGxTORSWbr44KHsXqDstFG2Ejfhn1mSn9h+J6oCW2kFoWs3wdmnMfj51WZw?=
 =?us-ascii?Q?T75oBk6kD8KPaWHmHGd9hoWEk7Jo4aQvEoH8x81JrM50vVkBIjvM8jnw7r1x?=
 =?us-ascii?Q?SSbvgn8p22hb6mTDRdXNwUeTOYokjAjKNYT/kZaUySioI2xbXUq/T87cwbbD?=
 =?us-ascii?Q?HUyWcZg9TozU8JNCP+3/xvQqV2GCEjARZgvifO2brtKOZjNJ2KyGisntY96u?=
 =?us-ascii?Q?W2a6kGOtothrl0jwxwEDwo1S3RT2c+34PK1zL5qZMqbMZBx5N81i0UBglU7t?=
 =?us-ascii?Q?42S8DubmkPzfTekrEqQlyleTsH0ribF+XnDkHj8UVm+0RO1e0yg+SvA44Hbd?=
 =?us-ascii?Q?Oc1pIKhONhSvp/HHB+hFdxyhWWbqiilaa87+0QG0whiivWC1DooJ+qoRjsTg?=
 =?us-ascii?Q?tMWtXCSTpAg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kERHagmzGStSP9ug2Db/1JfArYDApruXzun0OVbJ0kE1RECsH0W/9bidqQ+1?=
 =?us-ascii?Q?hJ4RVHgCTA+GtgtXL4Om4VFv9qx8WEVoZOHvcKgB5Aaj00MMerarPFoNY0fM?=
 =?us-ascii?Q?0rP/F7JPQjvjCZfSJ2YmYhCcT8sJwLLxShyqcTpnkh6eZ5VTApkUSWI/o0hJ?=
 =?us-ascii?Q?f6tUxSkEkcXomuIomdXn+JqbXSjmIkAL2Vc+xegpC4V3cVNSVdqyrQT8niMS?=
 =?us-ascii?Q?v5fZE3zWREWwlx/a/JJbA4R8YfBHoC9sstmMxe2X9aYcQ8+kSmTdEVSwOPRQ?=
 =?us-ascii?Q?mpR+ECHQs0DhoiBQGVnapKwJEKkUZBAvZGd4zrqRmg1+NNLKehCZq/Xc7jtB?=
 =?us-ascii?Q?1ylDv1chXUldtMLOAIBhHZxy4ozZlPUjXFade/0Vfv94ZxBj4sP+m7yXa+aj?=
 =?us-ascii?Q?DbX38LRggjs6XF3zQiXGG8l7fOw4sqkQWuSmns2AexgEw4freCLrqBOfFqOx?=
 =?us-ascii?Q?+T9zW3bywii8J+ktdpAPBNHUmgIX6L9Bo3o9iwj6MQsIZqVDZaN75S8fuiJG?=
 =?us-ascii?Q?iudRNUz3GAlFL5uW76umbgEruzwsq2ObjRLTIqOuxx1Nv7k2T+fg5KMMh/0Z?=
 =?us-ascii?Q?mBFYgNHVLZB3DXtBO4eYKv9FoN+P1kqBSNiijFLk93hUWMYb8rpDegYVDS8v?=
 =?us-ascii?Q?WIG8AL4A3qLngzQ5n/pA1mu24eWWN6b6Gy50QaE99vLE6LnsA1z3Ou2H5UOA?=
 =?us-ascii?Q?BjtR6G4OFFKW+JxO2rCVnT/Lpz9X+pbLmTm5AM/YARTqB7ah46wxAdWRCtY2?=
 =?us-ascii?Q?azBs3HmytCDi3fv/3M158imUMufDeDlJJpLJupDC6xdmM5KHv/VTzm8Sojsd?=
 =?us-ascii?Q?BtEOBu5Xla2Bg0c9p+lGhmIYKzbIHxXSmKOOrswnTOEbQvg1bhZlOSS75b1y?=
 =?us-ascii?Q?FoBXPyvy9+33lOFzqfSVY3+md+jHwL+AUrAqos+pIErHrogDnDkqa8PJP7+S?=
 =?us-ascii?Q?fGdKZ6O9OPPEntZeE3tBqaGjIF2UiglsBwJIN8aCeM4WCQf9HzzZrLr4ll2Z?=
 =?us-ascii?Q?f/F1xDrhcgwPScqDsnYiuvTWtnsps1m/wyu7RIe36pIY5xHu0hTfQRowzr72?=
 =?us-ascii?Q?YNMKMpM1CNdVMhsHmR8AeJsb6j093DD4xyRDNPHpaplh5nq3HnwO2X7Q6Gad?=
 =?us-ascii?Q?7/hy6IwkSNtB/MoPmeb+2sSKbRZiPQZNoqkPFvP6tUaiCAbCbTp9s8S3V8up?=
 =?us-ascii?Q?Chbz8kBzNOhzuYirYx5/xcvxwKSqrCYgxDoVrGnYAe9LHOS9DEzZtD1cp4hX?=
 =?us-ascii?Q?NCSz3kjQIKd6jN8bqFWEEBP/oO1g3R/QCP88GkUNV2Qjtavm4LHkVMJaHaKG?=
 =?us-ascii?Q?yxEOQ9qSYIKH2ubUOSY4hFymx5IqTpdtFYIQKnufpZhlrJ1D+kXbl8yBmOji?=
 =?us-ascii?Q?y0qDwW6Me7sLCWQDhWfVoSJYSARea1YM4XbdHsXhaoX/PohWFy4bM6MdF11L?=
 =?us-ascii?Q?EiIF8wkQ2RxRG/pn4oCqUWRy2ePy8LRL8fJeODTVJvPU+VLq8sFEWz4jXZ2N?=
 =?us-ascii?Q?JOVsnkKAwM05/pRZQjSI/2ZbPDWq5Dqp5/hp5VzIe24vuJUuZl36dL/+Pce8?=
 =?us-ascii?Q?ruAPJhlTC/RevAECmNhfCaK3mdguChE7f67ARYTnj24bRSDB5F92Wxj4oYV9?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0485e6-a8a7-4c89-243f-08ddce0dfbb8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 19:36:01.2564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLX26a3r3in7pNgnr6HUzc94jws70clnR7FqksZA477KXvgkiR9XB7sd6X3ktcN95GoIFWIGP/pVUHcEzvm5rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF63A6024A9
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

On Sun, Jul 27, 2025 at 07:19:58PM +0200, Michal Wajdeczko wrote:
> There is no need to have extra checks and WARN() in the helpers
> as instead of an index of the entry with function pointers, we
> can pass pointer to the entry which we prepare directly in the
> main loop, that is guaranteed to be valid.
> 
>   add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-180 (-180)
>   Function                                     old     new   delta
>   xe_exit                                      109      79     -30
>   cleanup_module                               109      79     -30
>   xe_init                                      248     188     -60
>   init_module                                  248     188     -60
>   Total: Before=2774145, After=2773965, chg -0.01%
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_module.c | 27 ++++++++++-----------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index d9391bd08194..593bc9e5851a 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -135,24 +135,17 @@ static const struct init_funcs init_funcs[] = {
>  	},
>  };
>  
> -static int __init xe_call_init_func(unsigned int i)
> +static int __init xe_call_init_func(const struct init_funcs *func)
>  {
> -	if (WARN_ON(i >= ARRAY_SIZE(init_funcs)))
> -		return 0;
> -	if (!init_funcs[i].init)
> -		return 0;
> -
> -	return init_funcs[i].init();
> +	if (func->init)
> +		return func->init();
> +	return 0;
>  }
>  
> -static void xe_call_exit_func(unsigned int i)
> +static void xe_call_exit_func(const struct init_funcs *func)
>  {
> -	if (WARN_ON(i >= ARRAY_SIZE(init_funcs)))
> -		return;
> -	if (!init_funcs[i].exit)
> -		return;
> -
> -	init_funcs[i].exit();
> +	if (func->exit)
> +		func->exit();
>  }
>  
>  static int __init xe_init(void)
> @@ -160,10 +153,10 @@ static int __init xe_init(void)
>  	int err, i;
>  
>  	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
> -		err = xe_call_init_func(i);
> +		err = xe_call_init_func(&init_funcs[i]);

perhaps we can go further and avoid this extra function calling
directly here:

err = init_funcs[i].init();

>  		if (err) {
>  			while (i--)
> -				xe_call_exit_func(i);
> +				xe_call_exit_func(&init_funcs[i]);

and
init_funcs[i].exit();
here ?

>  			return err;
>  		}
>  	}
> @@ -176,7 +169,7 @@ static void __exit xe_exit(void)
>  	int i;
>  
>  	for (i = ARRAY_SIZE(init_funcs) - 1; i >= 0; i--)
> -		xe_call_exit_func(i);
> +		xe_call_exit_func(&init_funcs[i]);

and here
init_funcs[i].exit();

But either way is fine I guess...  up to you:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  }
>  
>  module_init(xe_init);
> -- 
> 2.47.1
> 
