Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870C7F34C63
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 15:37:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402B010E3CE;
	Mon, 13 Apr 2026 15:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JHiaJhnZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7674910E3CE
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 15:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776094620; x=1807630620;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ERkM7uHl+BzpuiMsb5iVGNmVW9s0Qh7p2Mma1iLT9g4=;
 b=JHiaJhnZz36+IoA8Ag+QidmW2Ld4LqVocqbE8UHigCTyHFqwNJyn9tBb
 CFTQzPgh+TK6BNiPULCjxf043HpaxMw3Px+uke4zYpUEgrk2VxdIxCbSk
 sPVN4WPJGa7T66xrPkcFVLcTieG730L1bHsIYu35uf+khSVbS+0duKa+i
 cfn10twZ9IV2XYFoDoGDYeHW19+/1Hko9iWuJrc0WOhQujPQbt01Tpb2X
 PqoqgnUA5XDwop/Kq0ZpKY7V+SdTzHBpE0cKdK9qCBtOnlNHT2RXXVUGv
 5EGML6ScIbnLu2M51vavo+rWy3nwo4xTBtTg5oAA3DlBk6f4LvlnrMQMR w==;
X-CSE-ConnectionGUID: 9ZoCe89cQtCahyjUYAH9NA==
X-CSE-MsgGUID: gDmVR1itRlqBlX50zXZxVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88480994"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="88480994"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 08:36:59 -0700
X-CSE-ConnectionGUID: SD13+IpwS/uSuleHMqYC0A==
X-CSE-MsgGUID: +gJdbP6fTbqgK229iDghaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="228945872"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 08:36:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 08:36:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 08:36:57 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 08:36:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPMMYeHI4c7rGBVdq752oeU8Xt5kgAg/vSnt/BY5PhwwOQckBS5ql8o96brpidTCK9bQP9/2otqlLnTxMZK32g26J2wPYm6TZwYnoJqBGVhsiiXpQoAnX/6E1QqzB97Ya2GuHScQd0IWomWU+w+bUeUPIzlanmiYhs6JZJu84kDaYxc+rz0KYoKeTNAuHQ0WlXF1BJlzIvwxxOhhrZUexx7YryU7VE3oZ6Q7g8wdcw44PRwFyckjM2PDTK/CZzQB8r6Fl5THkLq0JcRn8eOS380BuZlyqGuaQhgnnMYEL7AEoOq6Ittbt1Z5roEGA6fll1/dIrUYbhK9ORT5TQXWRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7H2yP78RYE5fxE1LVcBm40+azrK+u0kfbAgp+E8TY2I=;
 b=QClp7TmaC8yCWNqB6vikR1SH87TM2LF+Fq7tURjX/H6GQSsenzaZ8Py+A3J8lye0y6o4ovTeDcLvcTP6FrnMKFFQiYzi2D/ItO97jh8hbnHalYKwZmjK47Q2nNP9ymBJlq/Zw+qglZzs8QVv4/mVJobmxVq35L/3aLHX+K61CQSmP4j6bpnZ8TQQKzLI7fOVAQRn5ICD/B1E5DzwU0sXVD9keKhPMEad1gb2LbdPHlOHCINKx8zUBG9nlg5rFLmQzkdF+jTLxELon1GGlRCR4IN88+elw1m9nqRDBQiYy/yFSleHb/xoG7S8UZS0UkKLi2SwlgI/AzD+s/RuQcd+9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CO1PR11MB4836.namprd11.prod.outlook.com (2603:10b6:303:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Mon, 13 Apr
 2026 15:36:50 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 15:36:50 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/tuning: Use proper register offset for
 GAMSTLB_CTRL
In-Reply-To: <20260410-xe3p_tuning-v1-2-e206a62ee38f@intel.com>
References: <20260410-xe3p_tuning-v1-0-e206a62ee38f@intel.com>
 <20260410-xe3p_tuning-v1-2-e206a62ee38f@intel.com>
Date: Mon, 13 Apr 2026 12:36:46 -0300
Message-ID: <87jyuaoos1.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0042.namprd08.prod.outlook.com
 (2603:10b6:a03:117::19) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CO1PR11MB4836:EE_
X-MS-Office365-Filtering-Correlation-Id: 56899f57-1acf-4d13-c230-08de99727b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: C4WVMeXC0buT2Vkn1nh9jtuGl5LMbvUK1YkToC+01rYAKZpMFuPWD+BIXq4ly52SWZxw6ClA+n0oHBbVLJUjDMndvqy3QFuZ+9jD+0MJbJr0qcrDiFx7lavMBjMtYR1qEkL1DLVsmUGweOgbt6YGLcCyI4MSRI2xfUPxqVwTvocQd7wF9yAzzZbAbyksU/hFEfF0WtnC8+9LIRqLLqBjM1UsdwX1wUufOTOKQ11gawH6LELdvWzDCfiZ8F81zqUbNBbS9rlIwdnpqp7zKCsxgfxeUStHzH3zc97+FNFA4GHW+zIkzFc5gPMZET24u94euDTdQXUiEjn5M02Tqut1AQCV3YfXIwFs0pBnAC4EdCVn0WXYMRfHxAj+m3+fe71XYXiIpKckH/g1yGKBoVCYyi7evGQR8bbEMh17bdf5nxoOo+YBphIPZdoq/TL5TGh73mg84xfL2fX+TklNwaz8mJPj9RRsmadGXsfZCc+985sP4z4laplnPCmAL2yr0tBRTXcFGsoAoIfkTwQB5Q1/MeNLJCrxsCCTcs1+i2n4MbUZ9Ns9yXmR+CLNYTMwiJZVERIjTdXaZm/UknsNLVobQtV6sBKbKTR1ZHT29ZRZneBRlqed4jXDwJF0ng9xVIZibXNBcO6B+Q5BEpEYEaXeI0QAYTCZyALTfMNbB+hoN6fghOq334Ouxpejl6vxi2WkOK0FHkBPMJrB1fKnpcCUksv9mOqveouBvQj6cANQm7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HaTa2rkvDI8EPAy8VkbPqKUaUgl6YAa1HErtiyelVnMp/7VXA/YTVamhg8d6?=
 =?us-ascii?Q?PnAcsn1RbBBBWvz9FOoHsWSNJ5qqTSLrJT6kVdKN2RIyR+rLp702G0JZrMnh?=
 =?us-ascii?Q?XI99AvFhd1yZZOhMrLvZl3K6P+/xautmyNcesOrzGfihaOHiH+I5jGXuH/Mm?=
 =?us-ascii?Q?dTJ4mXfp2DzR8GRPvgVj9eSyxXYnzk7iTx69UBRyAawlw9nHofpLD+Ej0zK3?=
 =?us-ascii?Q?fozbDWVecb7z20rHfeyAo2YYDMkssSSZfrdZCVrcBg7P6/4FhnUeKrWXALC9?=
 =?us-ascii?Q?KNdeu9M9MyFy9U8IxY00PFHO90emK1tNwuLQTtAVRfpsuQtyqpNxuNpdIrPX?=
 =?us-ascii?Q?9fgHMtegjV6ofiwfC3/IdThNbklOKubUGbAXyC/r2GhZgFqlpxMDz6MuvO0I?=
 =?us-ascii?Q?lJINRg3pzvBY3bqFAeAvTnM2XAuQciiTaCngGbUAaRF34tzItlrxBe9LGX+Q?=
 =?us-ascii?Q?5fzxsvVTys7dHvivBa7KZ7hqYQedp8XTkQWK68kN1CT1uLMvom/zoHUZN0Is?=
 =?us-ascii?Q?OLEcXwTzQqifdNhWVVu/A/kSVsfNf0UwJQu2a64YMGU25SIySoXK9jC0xxeg?=
 =?us-ascii?Q?bQaU2VwLBJXTgCemA15GknFfXOWrw6lB4Hjrqwjd3l9NoRqWmgfIm24sFVVU?=
 =?us-ascii?Q?m7n88MuQW6atmUMWod2CW5d33kbhddJDoAIUK6fW8d5a0eMnBGOfTyhpr/h5?=
 =?us-ascii?Q?3167zzAozHQlvmR1FdHYo/9JzvkxwKOEhy3W5aXd61Mv5EgMraaOEV55ciDk?=
 =?us-ascii?Q?qnaBKvpy/FYXh4wachkk/GTF2hGXjREXTkiTnkvduBzuQmsQoeg++vvZtK2x?=
 =?us-ascii?Q?pM70VpAKQTKmoBU+YKs27aMcYNimyIRBKKxr4AdsYrELD5eBW/VbBToLswaJ?=
 =?us-ascii?Q?JePuTFsuAAMHYgAt6oxhqWmqR/PXrn9yWaetTtQaVH/eiseF8q7BPGaAE6yO?=
 =?us-ascii?Q?jrxB5kp9gbotk5kgh3cLzjfj/XFHQmPBO6spZLIPAzS6kuQD5mOZrlsBQQ/n?=
 =?us-ascii?Q?D51Xfx6BJnVDkG+uGoHOdqJsHida9PMIYW+6Ap3ZynHJlVxsWrmvM/r49Cjv?=
 =?us-ascii?Q?7jQm4xPek7ciQHtOR1ta++3qXpg1vxJ/dNV1QbbQiGla0pS8SdoUhWaM0lxK?=
 =?us-ascii?Q?eALp/vOqd6Oonopb4sK/1DssOV1M3aZmh+ruOnK4w3J1E6zZfKpynSvFD0FN?=
 =?us-ascii?Q?uYSZIu2XWKJlr51EIm7LhcFWowYdbj8fOiWabRJ5+Vy7GQqI00Me3RN91q0a?=
 =?us-ascii?Q?uNOAkS/m8Fw8AbJU8hIDKBC/+fenYN0IDk44Tj8EWEhSqn1UOd2Mdm6lzjRB?=
 =?us-ascii?Q?4QgS0H6FAxlxnRHeaEWbR1BqyiW4NN6hxC1X4y/fe8oMpaXCpcO2TSjEjFj1?=
 =?us-ascii?Q?/U8oO03DOtBD3M3VP1mT7nNPUEezYnxWOV0LOAkxgZ70ItCrWx2DK5I2/RFQ?=
 =?us-ascii?Q?F56zT8D+Q2s7mqVgNceLOQDzg/6iS4ydVnVwDtw+SEW5PKmcTKpA/6foUdF4?=
 =?us-ascii?Q?mxs+8uKoSggysJq74mpbwUPZt32hkPuJShAiVRiWWKVqx5Mf/smZaCzjvYfq?=
 =?us-ascii?Q?BRH9cSCtimTWxJxQayYt5v/WRe/rNjkkH1PlWkMvo5b/fBu9zlruqszv2Svw?=
 =?us-ascii?Q?71K6xqZzVYvy28FE6kWUn8pzqNXdSaXtWpj4YGHdyDs2GTLq8C56YQMcoZgv?=
 =?us-ascii?Q?Ho+ywSDWMuEhU5xDPaPtiHvt++EBlFap7QzwM1U+6A7VpldTlNQBtAN2YzH/?=
 =?us-ascii?Q?AnnI6sH6hg=3D=3D?=
X-Exchange-RoutingPolicyChecked: SjiwAlVFycSrKp4C4aj3iETKvAq/S/O2QgQ8xoCpPA8BeAJhucZPK8Vy48kyJIXQA/IBol9ngNYW2VZiYsdtHjp5rhcGB/MT/+BPdTJYouxQeMUgkCeF6gHzOZMRR+1WVFzvFRXivMDHHiIcQrhJrMA9mv3r9ogfp4vBblvZUQJmKLRV+qzLe/Aw3PydjroaqkLJNws3R7Wz3Tp3BCcVaHc68fd1HSTxPpyI8BJhlUBgrYgE5MZmYE4/+EbFdFbAX2cmdjDL2tG7EeeEQ1FaCV7oy7+whcUz23SpTqEunSsDzn4RREOXKtywIWjktlgx9j+XAaWOW8i20wGfFseYiQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56899f57-1acf-4d13-c230-08de99727b28
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 15:36:50.6218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aj2zcsui9IGjUJtScE7nZ/CBP5XBNRUTWd+9+gRhTj7sUHeftWjk3dL8O+ESD9cUvX+16G1o52Hf8YmZvKIriA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4836
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

Matt Roper <matthew.d.roper@intel.com> writes:

> From Xe2 onward (i.e., all platforms officially supported by the Xe
> driver), the GAMSTLB_CTRL register is located at offset 0x477C and
> represented by the macro "GAMSTLB_CTRL" in code.  However the register
> formerly resided at offset 0xCF4C on Xe1-era platforms, and we also have
> macro XEHP_GAMSTLB_CTRL that represents this old offset in the
> unofficial/developer-only Xe1 code.  When tuning for the register was
> added for Xe3p_LPG, the old Xe1-era macro was accidentally used instead
> of the proper macro for Xe2 and beyond, causing the tuning to not be
> applied properly.  Use the proper definition so that the correct offset
> is written to.
>
> Bspec: 59298
> Fixes: 377c89bfaa5d ("drm/xe/xe3p_lpg: Set STLB bank hash mode to 4KB")
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tuning.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index ea48e2a60fcd..6fb8887d1482 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -97,7 +97,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  	{ XE_RTP_NAME("Tuning: Set STLB Bank Hash Mode to 4KB"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, XE_RTP_END_VERSION_UNDEFINED),
>  		       IS_INTEGRATED),
> -	  XE_RTP_ACTIONS(FIELD_SET(XEHP_GAMSTLB_CTRL, BANK_HASH_MODE,
> +	  XE_RTP_ACTIONS(FIELD_SET(GAMSTLB_CTRL, BANK_HASH_MODE,
>  				   BANK_HASH_4KB_MODE))

Should we also consolidate the definitions in xe_gt_regs.h into a single
section as well?

In any case,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>  	},
>  };
>
> -- 
> 2.53.0
