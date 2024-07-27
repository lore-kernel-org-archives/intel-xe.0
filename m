Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E1CC3DA49
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 00:55:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402F910E2C3;
	Sat, 27 Jul 2024 00:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="giw+zI1G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB67A10E2C3
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 00:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722041723; x=1753577723;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wfiOMCtTnhBBzGK5OqSJ/4KXDGuSkCHg0R9bkB38Nxo=;
 b=giw+zI1GZGBGtb1+GHd6MLJyG5W64TJ5QrzfLeKF0NBxVyEOqkyTs0Pv
 fo1/1x/gIZGohrBk45ezYe2V3USpYnGEsXLkopd1fuJ0SYVEauDvk+RDV
 AoWQu9zTYBbRzGdNnQHzvSctK388RMSKPriMydxamPfm3EAtou5xOoQfm
 o7Gg+LpnnnQ4WFto8WfkplXhibCEPgADoBh7HCcKilHq6NUg5WSuhkcm/
 7UFm9QM8FTl2i//1zzgvthhWsVqA14rqWmuzrsIZVwC794D3duDCeCcjB
 4Cil1Q+fbvYE+qFmR8X0u0PgjEgWEqXd6uXE4gBgxNk1OnMsC5j2rFZAV A==;
X-CSE-ConnectionGUID: btN1r/iWS6m/rt6eARlOIg==
X-CSE-MsgGUID: w5R0Et+yQ2W30t9Mi1cWAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="30462579"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="30462579"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 17:55:22 -0700
X-CSE-ConnectionGUID: 3Eu9JAWKTVObVFeUvfyHnw==
X-CSE-MsgGUID: kuJctdQlQGe7MMsAG1vaLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="58201752"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 17:55:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 17:55:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 17:55:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 17:55:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOiC7O08OlAgzhg49z7p7mTsC2SATs7b1ws0xLyxdeIGMoY3yJYKa9XAWPJ3+bB2VUSdriSZmi/HPsef5hWrCEbcRnCBO/oEilyMz4OFu0zfCqSq3oiIolN1zPY82QkRfTms1gyEOG9pfKq78LtAueyXDUJy9j3vWNABSz28ZQB3A9dUZescb71YgQiT5HddZ155OwksO7rh/ymvaDsbbNhwRpr7V+Vbj3S/HoMOccjKcSSbrK70c91jEpI9/kWIMKwR6ybKNeq56OHq3RTdEzzo+S9hjJW7qB7aYjNJFQNsTFo3qSpGpiCIPafn0osFuul9+yr3EoN6KK4Yq4MGsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEx4Z+5pNdGgDfWKmmtJJ/9fgetfeMOhQ5HD8kCPUsQ=;
 b=Lqt/zWfEfbSS/0wj0bHugrMuO/XmSkvP3Cu+tAjfd2h78X3xDg9FFZ/ucmRFLtkp+ts1sBYMiLOBWpU4Tnh6iUJ03PcO4Kb9b7S5g2j2i/XMfEgA4fa51yeCOkGyn4Xu15DMbs2BAR//1jQ5ygMZuT06q+21ftF3ZZFhPuRrYkbaehBNDakdITOUhvzQdOFDTbBGnX1mSmXRL8Z30QPqZ7hNA7QwPwUkEUeJF+P+Rkz9B62Yi64dFEsBMvTR9irhoRB9qpOhdsrTfn7hkFIZ88MJllY3Wmjv+X1IND2VTXap/wZAzovK2gjGJvYtbs2qr0hhGS6OiHZy/3Vp4Y2yEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5040.namprd11.prod.outlook.com (2603:10b6:a03:2d6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Sat, 27 Jul
 2024 00:55:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Sat, 27 Jul 2024
 00:55:14 +0000
Date: Sat, 27 Jul 2024 00:54:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>
Subject: Re: [PATCH 09/21] drm/xe: Add EUDEBUG_ENABLE exec queue property
Message-ID: <ZqRFQF2i0P6jjOtm@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-10-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-10-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5040:EE_
X-MS-Office365-Filtering-Correlation-Id: a310f038-4bf2-40cf-d8ab-08dcadd6c64f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/Hx6NfVOG0MDtXqexmplqfuaL+HgJLzZ3FkclXRQghCaNwgVLdZRTzO/csP/?=
 =?us-ascii?Q?Gu0ImiB4CtydmjnI+/HW3I5x+LL30NrC4CeN/pSbdVUlxHxi/tOA3PiXSuWc?=
 =?us-ascii?Q?KTQKWfd5Ccuv7kru2SzXt8X1maj20VL4mgN4GzFlSGgKg3yg3E4dLt8gNGAq?=
 =?us-ascii?Q?fAEBAVHnCgX63Z66zBZ0ZbFsi6+k7vrlQMw1wRJxsKAFff4c+tfkCaAuKolb?=
 =?us-ascii?Q?3RODF8puV6VnwwmVxZIKhvXOfOTDM1EjD1yjQv7M2LAPGcb2AKWzYFBMBaQg?=
 =?us-ascii?Q?A/lHp70oIY7YvvzEh/cBqyly86Dzn6KA2gvIoUiBNoqar8Ibcj+yMXAlcwKh?=
 =?us-ascii?Q?iWhz4TAChF9eSQqiwzBhIvlpPwcj3euPY5sscPFHdM7l9RGLfJJYBZa1w6hH?=
 =?us-ascii?Q?2WArObkpAjyUdBP6TmuTLkJIzOiC3651wHVyO5ydK9nS+PSbj0YrNN/kmn+B?=
 =?us-ascii?Q?ieq3jOpDneV2tB3eqzgPl9p0x3GwdpbGSIJSrXDjo9jAGBf86oXN/ztTvSuq?=
 =?us-ascii?Q?6kJ8Y3WYzCzv+BPoZ/oXQqYvlV62lGP0iJ56PmFo5yrAOndfuFuItwTLVnBq?=
 =?us-ascii?Q?s4FDpnl40SiXoyXgi5je/DDG5VDFRwA+GtqnQY+3LFA55OK8OQnL1iytBZiU?=
 =?us-ascii?Q?Bd4S09Mq/Wo1aaS2WjKAd+yji0HsZOABFrN8EoIQm6YY6i9cGjgGX40x7X+g?=
 =?us-ascii?Q?8wSc4/4kU21l4q3fPD+WN86ZD7nQVuMVHYSqxAKO9T79wDRJ3xe2Y8b799tZ?=
 =?us-ascii?Q?MBCBNtw4C54avGiiSb1G9oYr2ksFulSBUnCWNjnSf6WgxyWWloue0bqOED2K?=
 =?us-ascii?Q?LrgqW73m+khSmugnRwEieIBG3AANtZb0PJM1/UqZibUyxl6Q0xLUjUWUYQ8o?=
 =?us-ascii?Q?yktCQtSkRskl0qCAk/PzillIVDoL1ixx7tuVLZhzFQ7u6q5B+V0WVMJpFoRt?=
 =?us-ascii?Q?yX9C1jzmYNpF0xPmW/CW5fKvQFjV43G6K5hqf5AABuWTWMZAmQ+tOnLFkg4W?=
 =?us-ascii?Q?VL9GOmsir0NYMvBWsulPLjMZ7qjSNVPM7KV1KbTddi/6Q/TYFgTpXm24tJzq?=
 =?us-ascii?Q?5+GMXSjOphNsSCOuzNJuQsdJpRzYtacwvWrh3uEt0uKnOSQCuXmrfvMP8+Sx?=
 =?us-ascii?Q?KAZgjUntyWY2qkrYTcvV3YNGM5VO3dlfO2WnTx5zxl/DXjDQRck9fXG7Do05?=
 =?us-ascii?Q?6wyUCL/qYsLGN3BZzDKThWle9uBoslGqtFykq8/ucEM+ZtW08GLl/wuh2Ixu?=
 =?us-ascii?Q?MSUptOKU6UC9rjnJGBdepS99t+8hfyqpKCGMkQUTdeWgCrwKgCiZtpmbT/Gs?=
 =?us-ascii?Q?W2o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P23nve1rMEba61RbtA4PYXTUbgFnD+mgy6Hi/fdpOCZR0jgI3w146AfZQQFD?=
 =?us-ascii?Q?DvcgAGjMTvgVdqFER8XKKcxawkic/OZOArCfOAP6q2GJQzckyNyewMTny0aw?=
 =?us-ascii?Q?kbN1C+sVFGfke/cRUi56x0H+9Roj8pfb8Z5S3BM0QDh+m0jVLNjRElnkGLgN?=
 =?us-ascii?Q?XzbkPWERAySfGDnZRDIi9EU4F2KE13fOquYRm95dz+yVdzA0V3P4Nh4D/QB7?=
 =?us-ascii?Q?EHzUjZhwGCkDUdspRz13cgII8qMjKUMVh0msxgD6YiIHnpRAvYDvqYWb8JBj?=
 =?us-ascii?Q?LwpeZNRJLrsYkUivFRU2bWEg7fNb4yQQtlH5vxn169TI/2/czAGCsV9zG9EU?=
 =?us-ascii?Q?HNrN4qty2yTENMc7btgqlBXbCD27JZG14s/BrxAmCAw2ZzAQI8V7iUJPcz0z?=
 =?us-ascii?Q?GyFdTxYq2P6kOn//RBE0gagJg0my2Oh/W4ut0awsOuRPhHolTQFUrcg5fQFA?=
 =?us-ascii?Q?vGlu1nEjL79nLrQjfwW9zhOpBftuIQsdKGYjL1IvveMgpQ//mwcZdNx+xA26?=
 =?us-ascii?Q?REK47LPlx1fQMl80soH4YEm0VIceq64efFD/bndSOXqOXWVr9D99djVb3/YP?=
 =?us-ascii?Q?JlAe/HH6CNvjHqb29Pcfxiy7etWQBX4lTzP3L/3uerMjsdHBti8CaaC3dPZ2?=
 =?us-ascii?Q?67nc8pLxGz7uKgPw58Ytj5o1mYJnbzKQ42n4IAW5MYN8m3X1r5k6j11Fq64U?=
 =?us-ascii?Q?4y4uXCLRuPx2A9nV5eWh9sq7oSF24tRp9l7OR1OUIGub/JmaKs5oSebGl2NA?=
 =?us-ascii?Q?H/aKip7KtNxYcqOr0qfOoZ9vAdE8570d/bcCNfx41GtHOS2aepeDfHSn9ISB?=
 =?us-ascii?Q?95gyJY3tNtrPujnxibGiSyXc5OGTEfaM7jRI781Dnot9C8knBnzWTgSk8oCD?=
 =?us-ascii?Q?3euflUhYgAt6ohV3SBujIBtN183yvnNQQDe9kNh0+jeybIKVu47XOT+Buh7f?=
 =?us-ascii?Q?xOVEa7ygLGLlUvluJa7ZPJw5NYgCkrDPmUyX73lhUGFTVqJfFTF6e7u+/mz7?=
 =?us-ascii?Q?QfPnM+EVOiEgtHu31uK2qex/EEcN21Yo0V104lLuDjaZfcYr8GLkGFMuIt7v?=
 =?us-ascii?Q?U/zI3heC/pbgrvg1bDefI0yyQMnzhRyaExMwL6RS6zJ+1/T7Ua9KjKgxn4vC?=
 =?us-ascii?Q?nwc6vba9ElgfKsJIAnvgKchWIr9fpi2Bh5ENXBmw8sBQoza0S/GcnSWhhOvl?=
 =?us-ascii?Q?TPaoqyisINrbg+8b9MWiZwQCneoXBWFEYQLUjCSrqteDMEcFe6jNqkQlhsO9?=
 =?us-ascii?Q?msNVUrl09LCbFdyP8uLBGxTaUEuZHavJutiDZmD66eSvTTqXDdXyjItDHcgz?=
 =?us-ascii?Q?86MhzsETNvK6VF6UzcbOIwrfk78hiVwiB4hz262iAGIUwMKt9u92zfRCHqJj?=
 =?us-ascii?Q?cx2uhPk0SE1Twuo8PtU0L/xza7EgfuZOCcuHBcyL8PSJIj//1yIaj0XUMRtP?=
 =?us-ascii?Q?+taxz/xD3WwdHajKrZeLz1zl46gXmFUc8V8n0X2nsn46GJGfdWh4lLWHVkZK?=
 =?us-ascii?Q?cNyqDiBewQ5DWz5WQpfLm0LZAJYixTcB+NeYPXOV+SahlWotbBQWFjMTZaGi?=
 =?us-ascii?Q?u9W5NBet8dRMo4S+J2NOJXnD5mpdHb49c5nZwWOYv5c2gNnjBTLjUgk3ujWT?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a310f038-4bf2-40cf-d8ab-08dcadd6c64f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2024 00:55:14.2394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +oXQZfSnT/61rmyVckUFxNJnFgCMprp3wSqkOx6/BgpEbkhQear8NLKSJfFLAgvaYx+8jacQxBVUG0mOZHChfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5040
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

On Fri, Jul 26, 2024 at 05:08:06PM +0300, Mika Kuoppala wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Introduce exec queue immutable property of eudebug
> with a flags as value to enable eudebug specific feature(s).
> 
> For now engine lrc will use this flag to set up runalone
> hw feature. Runalone is used to ensure that only one hw engine
> of group [rcs0, ccs0-3] is active on a tile.
> 
> Note: unlike the i915, xe allows user to set runalone
> also on devices with single render/compute engine. It should not
> make much difference, but leave control to the user.
> 
> v2: use exec queue flags (Mika)
> v3: eudebug enable as flags (Mika)
> v4: adapt to lrc_create (Mika)
> v5: EUDEBUG property space squash (Mika)
> v6: runalone as rmw (Dominik)
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 35 ++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 +++++
>  drivers/gpu/drm/xe/xe_hw_engine.c        |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c              | 16 +++++++++--
>  drivers/gpu/drm/xe/xe_lrc.h              |  4 ++-
>  include/uapi/drm/xe_drm.h                |  3 +-
>  7 files changed, 60 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index fd31f3fb2b4c..764c270599d0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -136,6 +136,7 @@
>  #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
>  #define	  CTX_CTRL_RUN_ALONE			REG_BIT(7)
>  #define	  CTX_CTRL_INDIRECT_RING_STATE_ENABLE	REG_BIT(4)
> +#define	  CTX_CTRL_RUN_ALONE			REG_BIT(7)
>  #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
>  #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 26ae2fdbf682..bc2edade5e5b 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -106,10 +106,14 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  
>  static int __xe_exec_queue_init(struct xe_exec_queue *q)
>  {
> +	u32 flags = 0;
>  	int i, err;
>  
> +	if (q->eudebug_flags & EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)
> +		flags |= LRC_CREATE_RUNALONE;
> +
>  	for (i = 0; i < q->width; ++i) {
> -		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
> +		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, flags);
>  		if (IS_ERR(q->lrc[i])) {
>  			err = PTR_ERR(q->lrc[i]);
>  			goto err_lrc;
> @@ -336,6 +340,31 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
>  	return 0;
>  }
>  
> +static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_queue *q,
> +				  u64 value)
> +{
> +	const u64 known_flags = DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
> +
> +	if (XE_IOCTL_DBG(xe, (q->class != XE_ENGINE_CLASS_RENDER &&
> +			      q->class != XE_ENGINE_CLASS_COMPUTE)))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, (value & ~known_flags)))
> +		return -EINVAL;
> +

Since I've talked about layering a bit [1] [2] it worth mentioning I
think this patch fine wrt layering.

If we add a Kconfig as I suggest [1] here you'd wanna add something
like:

if (!IS_ENABLED(CONFIG_EU_DEBUG))
	return -EOPNOTSUPP;

Just make sure it is unique error code return which the UMD can
interrupt as 'kernel not compiled with EU debug support'.

Matt

[1] https://patchwork.freedesktop.org/patch/606049/?series=136572&rev=1#comment_1101330
[2] https://patchwork.freedesktop.org/patch/606056/?series=136572&rev=1#comment_1101337

> +	/*
> +	 * We want to explicitly set the global feature if
> +	 * property is set.
> +	 */
> +	if (XE_IOCTL_DBG(xe,
> +			 !(value & DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)))
> +		return -EINVAL;
> +
> +	q->eudebug_flags = EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
> +
> +	return 0;
> +}
> +
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value);
> @@ -343,6 +372,7 @@ typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG] = exec_queue_set_eudebug,
>  };
>  
>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
> @@ -362,7 +392,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  			 ARRAY_SIZE(exec_queue_set_property_funcs)) ||
>  	    XE_IOCTL_DBG(xe, ext.pad) ||
>  	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE))
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG))
>  		return -EINVAL;
>  
>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 1408b02eea53..48e1190c2b58 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -90,6 +90,13 @@ struct xe_exec_queue {
>  	 */
>  	unsigned long flags;
>  
> +	/**
> +	 * @eudebug_flags: immutable eudebug flags for this exec queue.
> +	 * Set up with DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG.
> +	 */
> +#define EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		BIT(0)
> +	unsigned long eudebug_flags;
> +
>  	union {
>  		/** @multi_gt_list: list head for VM bind engines if multi-GT */
>  		struct list_head multi_gt_list;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 0d8b871b47fe..74813bc20787 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -532,7 +532,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  		goto err_name;
>  	}
>  
> -	hwe->kernel_lrc = xe_lrc_create(hwe, NULL, SZ_16K);
> +	hwe->kernel_lrc = xe_lrc_create(hwe, NULL, SZ_16K, 0);
>  	if (IS_ERR(hwe->kernel_lrc)) {
>  		err = PTR_ERR(hwe->kernel_lrc);
>  		goto err_hwsp;
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 94ff62e1d95e..563b57f5b9ee 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -890,7 +890,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
>  
>  static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> -		       struct xe_vm *vm, u32 ring_size)
> +		       struct xe_vm *vm, u32 ring_size, u32 flags)
>  {
>  	struct xe_gt *gt = hwe->gt;
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -1007,6 +1007,16 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	map = __xe_lrc_start_seqno_map(lrc);
>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>  
> +	if (flags & LRC_CREATE_RUNALONE) {
> +		u32 ctx_control = xe_lrc_read_ctx_reg(lrc, CTX_CONTEXT_CONTROL);
> +
> +		drm_dbg(&xe->drm, "read CTX_CONTEXT_CONTROL: 0x%x\n", ctx_control);
> +		ctx_control |= _MASKED_BIT_ENABLE(CTX_CTRL_RUN_ALONE);
> +		drm_dbg(&xe->drm, "written CTX_CONTEXT_CONTROL: 0x%x\n", ctx_control);
> +
> +		xe_lrc_write_ctx_reg(lrc, CTX_CONTEXT_CONTROL, ctx_control);
> +	}
> +
>  	return 0;
>  
>  err_lrc_finish:
> @@ -1026,7 +1036,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   * upon failure.
>   */
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size)
> +			     u32 ring_size, u32 flags)
>  {
>  	struct xe_lrc *lrc;
>  	int err;
> @@ -1035,7 +1045,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>  	if (!lrc)
>  		return ERR_PTR(-ENOMEM);
>  
> -	err = xe_lrc_init(lrc, hwe, vm, ring_size);
> +	err = xe_lrc_init(lrc, hwe, vm, ring_size, flags);
>  	if (err) {
>  		kfree(lrc);
>  		return ERR_PTR(err);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index c24542e89318..d2429a26fb22 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -22,8 +22,10 @@ struct xe_vm;
>  
>  #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
>  
> +#define LRC_CREATE_RUNALONE     BIT(0)
> +
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size);
> +			     u32 ring_size, u32 flags);
>  void xe_lrc_destroy(struct kref *ref);
>  
>  /**
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index a68734ff12f4..61c4c061bd75 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1110,7 +1110,8 @@ struct drm_xe_exec_queue_create {
>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> -
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		2
> +#define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 << 0)
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -- 
> 2.34.1
> 
