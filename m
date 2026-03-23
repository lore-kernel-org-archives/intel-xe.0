Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B237EF483E3
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 19:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4AD10E43D;
	Mon, 23 Mar 2026 19:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cz8I9Qdp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6170D10E43D
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 19:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774292622; x=1805828622;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JDheJ7rU/38rsI4L8PR+o3FFO/vdcChSSWUVuaR0i/Q=;
 b=Cz8I9QdplMLsTjGvg8HSb4GeWbXWj2zB7Uz4f1T5zgVL6rz1MKD9dtuH
 epIMjZ2HgUnVz/XC8iK1NRTc/7uoltlBjz8tgNGMi2S62Ok7CqYvoa9I7
 8FVXphkjlK+sqgTpLBnoIT7ps80If7UcL83faGmQkbWB4RisrU9Wnfp1m
 VP5JWFM/NeMHtjO0TomGeLKn7QuAitzofhX8D0TWUiXH+8Uagd89v6PHX
 BIAM9s9pqZxVWASAgIbyo55N+WehzW9PwEye78QaLiJibwtZNbQFE0EXw
 vTWvnvQvGsH/NCgfLaSC96n77tw/fdHpwuqNRdWRuvwm/f929A3e8NLkK A==;
X-CSE-ConnectionGUID: 1rn2Rub2RUeXpCj13lS4JA==
X-CSE-MsgGUID: +p6Ok9ciSOOKlslvPoLFGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="78896967"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="78896967"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 12:03:42 -0700
X-CSE-ConnectionGUID: 3LfumErEQEabQ9vMU7om9w==
X-CSE-MsgGUID: +7ZKSSJrQRSUaxZPEy/beA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="262030790"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 12:03:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 12:03:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 12:03:41 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 12:03:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lzs3ot8jOHKdK3cwE7mpJ6N8Xwxnbu3E5kDQEbC2WsxgzpkUaB4hD7y1fMcleg5OKw7K3g8Y1+6g29eqvXG0zRGBZvj78Ap1HhXJqWvt6s/pRg4WorIVnsbh96/hPzaH6ClXFbTDn9J7F1QAMBnlYRspIS/ixuEAs7Bp4ubbIkPhRcQN7/ZQaeCE60A17llFSKSjNMfrh5YvIxUOigmQ+3PRHDRb+bEsczEj7tuTZkGcnr9bKqkmFHycmSuKEHCvVtk5oV+eTuxvccNVfAaYN7TRXQxYuAYvRQgVaO/YR2cm0Eh+L5JUb0T7M5WFwxh+7bggTdixLgw6xNY/77HfMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOrDzHeSb574KNFFEEQSgICdGtgo4Qv5P2yl93Qx9JI=;
 b=fBOlrRlG3/zpvkkoG+j4ds0shGC1FgOAXNepAW8B0uLMxn3k1Tnwu3ISJqhpVCOoKOzwsE5yVE0SSoXyu2a1PKEHdeOhk8WQ0OMNUzbCRH44Aj0Rkb9FIZab+PIUQsWcpxPP8DcKi0NBZAPOFp84bHptfmGnxDZEyDuTI8WYkDvZDOSXqsm0OZaf/PWpSdVPHtSP1kUS7xkVs5haV943C1/RyJ8YLMH9YbBbL2hTsnCG7nhc3D0gglA3tBW5fwIiGhIm/vU1DgIVow0dlrlHDsfqErOmxYolvRitidNv9WInXUvNR2o2EoWxBqgd6MhneEqlMII/3jvlJC0NyDfwQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by PH0PR11MB7615.namprd11.prod.outlook.com
 (2603:10b6:510:26e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 19:03:36 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::3ce8:ebb3:2b7f:8719]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::3ce8:ebb3:2b7f:8719%7]) with mapi id 15.20.9723.008; Mon, 23 Mar 2026
 19:03:35 +0000
Date: Mon, 23 Mar 2026 12:03:29 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Implement recent spec updates to Wa_16025250150
Message-ID: <20260323190329.GA511454@msatwood-mobl>
References: <20260319-wa_16025250150_part2-v1-1-46b1de1a31b2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260319-wa_16025250150_part2-v1-1-46b1de1a31b2@intel.com>
X-ClientProxiedBy: MW3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:303:2b::16) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|PH0PR11MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: cc102c06-3001-449d-5d8d-08de890ee299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: ZAKFkmZn22M/7fT6EqEmSL7Skt471JnyL/v5ORW8pmp6kdKnuMXWUZHQM6G2DGzMm6LcfY/jaKilM//XRKXe3EPKfH0p3gxod/RkxJFYU7arwovpQvTlWgbaVXIWJiUicb7Kk3C+dU5gfmYLol11hWH/iOaLNO10vsz2XZxmPRqwbNk/s0PbBYrw+azcXhvGzRDV4gK4DOitMWyhGsZFT5VhdWdDZzaPsG54pDM5xaQgHcFK3vbRYLXHhk7WzulS62zdWXgJuKneHl4pvAd2ST0uEoXZKnFQDdL+Do5cOjBWhFfoE+aktLBiub97BD1cRmaLDEA8lkND1GvgZjSFbemZPd4FT0LxofZybMSQ7ZftaZr+El/N+dslkHJz1laD0OnBtu1X/G28iiVQREVHDV7kNFG0fDSd90tNuYaqbz4B7BXQZOQUY9e8o+6jR+p7/waNYvHBeEXWx4Lg2lKRtg6Z1t87sybUvrefNyiwV+LqimwymUXWkeEHvu7c+W6KubmAELs45lyn9FuDu26ffumkS1U751BYvF9IMn8PJ7S6yUiJ41uW8tVWHZWIHeVVLFPjv7kweAsXbwaVoqM0JgtsqS2aC1SkY1JeNxkSeS4ZqxsNsZ9v/VndgO/yDLRURlrbFIXQzAClzUVhKU6wvScoX+HXEimdJ/qJbzeB/z/z6oQsj6+g3RntJrsYtnnrKLqPYjheD6rLgTavy78POn0PHYVX8+0IGwGW19+Ees4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L6p2n+6gpl4wktgEl9/TByqml2EZkyfCLiHTlVqoQY+O31lDdnA0Tv0xxTIh?=
 =?us-ascii?Q?xXXvQCZL5eCBKMgU9qc9870uwUX4LNGUo+BTZQ30ti+Gw2W0wIsBg5ZHsCH6?=
 =?us-ascii?Q?COt3wQzxvAAaoCEb0/btQZ1ZWl12/CCMWPwxyH5FA45GoNCnvxeVj8e3a6s5?=
 =?us-ascii?Q?GGtr8f8Z6ZY/CDNaP4LNhUMpCpg6R1iFYCZP6w3bfSsb54GqnoUdZ3G96i29?=
 =?us-ascii?Q?nl7y9OtguAOLZER5e22I0mTbWTIgiiDMpuk7mT5Qrf2sUrIj0gphMlt84T5i?=
 =?us-ascii?Q?ocVc1YbbImZG1LaVc/kAJAvodyHxVC1deY44g+SSx7MKLf9TLC0oLgDXoDhy?=
 =?us-ascii?Q?shWzqn/hV2YR6eCs6i3ITyv+ToPVwE+FbnMTBcgNV9N5np4jlrKLIW851JXG?=
 =?us-ascii?Q?ZzF5EaQEcMVUDvEFLpgYhKz9E4/0HgM/McLfhFKAcD+1gPptwCF83MXLG7Jd?=
 =?us-ascii?Q?xu+j950/i8yNF9otNP6EPCo8tYq18qv8tafoUvf+umPjgLubQrSDFs/GRIkJ?=
 =?us-ascii?Q?cdLIqPBvfEMAcSwbXx6exCrUpaLe/eQ8PfvCwmD+fsssoJV2pcPL19viYKiB?=
 =?us-ascii?Q?jAPLS1L8lUJL69gYZb0bCv1ZLtqFfVHWefIabPcG6ZLfSHXVMfFXLkQUXMhf?=
 =?us-ascii?Q?qDjlQi9BJF67HNmyZof49Ah6cYgdPzW0if7y3i//9j8ptTPwZQ5Q//NaT8IH?=
 =?us-ascii?Q?Sq5N8GZ2KIr2wBdSXGi0yaGpO+toRU9DQzq7vV1QLPSLPrS0KfcT1/6DFCQ2?=
 =?us-ascii?Q?YsayPPas5o+ccj3tDGr7iilYBDFC89ISdXlHmAc5vrIWgOZe/ki469YceZjA?=
 =?us-ascii?Q?jvy0xQs6hNcXfEfcLQhjhqXkF5SHMIL+v7YzgYi5BvwIx0UcJ0Wf17HwEdZ1?=
 =?us-ascii?Q?58cR82th7IbxVzeCwuITbIsIGZwgy2R7DDH/Rohs+OWnIJ8qG1POUMRtUlNQ?=
 =?us-ascii?Q?wf7vRuPxxxt0e5LcDizUIK0Vok5IdT/KRgYMCCt3Zv8fmLLcFl0DdjrIExMU?=
 =?us-ascii?Q?3B5M6zIOivrTKk4+yC1au//o7mwr/jkvvX+FKAiYvjuknRNSeV4qIR3o0CML?=
 =?us-ascii?Q?txrptxULJl/FK7C3vAS73imxMHKxNcEHigJhGV2Ous2QhF/YkUAthJwIsfas?=
 =?us-ascii?Q?O6PK8BT2mAzccYpqVMdhQgiaPKi2gCDVVicMfPDbfCwN8HTpqN21lCCQGv8d?=
 =?us-ascii?Q?aqQI9+CF1eQ3o6U/Fb00lXqzKY6L/PR1k3JfaZBP8KyUm/D1O45kyZWbAZSv?=
 =?us-ascii?Q?F0svMrXFl11idW2ay4YWykRIgvkiBlTzwnceiBgCrKrXEpwZvPGwhMfGFPbB?=
 =?us-ascii?Q?yRRyLquNbgFP1JfJQveoRH8XbM8Zs31pzbMExnN3CZ6G4CH1ltVTZbuJNYk4?=
 =?us-ascii?Q?AgKdHJkgUp+O6lW21uapmYBAvZBu4u2Y9KJZQYfaBxOIuWB/lOV46rKUoYN1?=
 =?us-ascii?Q?V6j/IlVuty0G35CklL4W6utiIG7JnYbXFuhn372p1VF8FRc/ROuLKlBRFg6q?=
 =?us-ascii?Q?yGpF9IzwUKdDc2l6ZYaSjCVGeMI8yFqR5gnnl+6uLdcI8Sb31/vqkPEkNUes?=
 =?us-ascii?Q?GZWaGhXBBO+9iaGtajp5hX9idUD3x8CBOrQpctI5Qs0l/TLKpGo9mtLvNKmA?=
 =?us-ascii?Q?iq5qA4FNLQ4k0NCaCJEQnVjBzNLNmgdyZ+LFUiAesNz6QImhi9apdVTOHS7Y?=
 =?us-ascii?Q?xspwpu8mWnDblgcs0EcOke3kMBQSHNq46E70DZcueipMPxyzKJ3kTHQGyQDP?=
 =?us-ascii?Q?MT6TIOzvW8ZTvwm1MGSW1MnQHkwVvjQ=3D?=
X-Exchange-RoutingPolicyChecked: q+Nd11KREPWgb6+1/a/IPsT9icctPLMdif0lR2jDj+V2y//jvrC+mJ0rpWPI1KYZs5VsQ2rJVP4czuD/F/rv4hFOD4KNx4+vFRO6ZCwkwykMA1jBTWIgTIFJetmxfDvhSrcZUJRcko8toknCbWJ2ruJLbJj6IrWTmpg2I2ychbUZ9NPZhoz+Hf3WGW5r2cU4+qfBoUQmH6WxfSRBGhJj7p3yC8/FVqueobEKKnudLKDzRwQSfY9wUEO2Z+1Fs3JeB2HDKsaTC1GEo3elwRw2gWtiO5yhHbSvoK5Urn/8C01S9hcJjWtqTE0pngyva7WuRu1kHKnPjX6xQnBNGg+Q9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc102c06-3001-449d-5d8d-08de890ee299
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 19:03:35.8993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUjr609dajbPe5QOa8kFLaJXodaSLtEUE9D/5Xeo1q5ZMCuTB28gS4xgmyBXymCFcFBXRqeZ7hsAcrc6YJmoYF/418JsYt86Qr1BXxIoR2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7615
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

On Thu, Mar 19, 2026 at 03:30:34PM -0700, Matt Roper wrote:
> The hardware teams noticed that the originally documented workaround
> steps for Wa_16025250150 may not be sufficient to fully avoid a hardware
> issue.  The workaround documentation has been augmented to suggest
> programming one additional register; make the corresponding change in
> the driver.
> 
> Fixes: 7654d51f1fd8 ("drm/xe/xe2hpg: Add Wa_16025250150")
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 84b80e83ac460b0af3777741ef02b15da707a4a6..4ebaa0888a433b4423e0180aa196f66c5dfa71c0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -578,6 +578,7 @@
>  #define   ENABLE_SMP_LD_RENDER_SURFACE_CONTROL	REG_BIT(44 - 32)
>  #define   FORCE_SLM_FENCE_SCOPE_TO_TILE		REG_BIT(42 - 32)
>  #define   FORCE_UGM_FENCE_SCOPE_TO_TILE		REG_BIT(41 - 32)
> +#define   L3_128B_256B_WRT_DIS			REG_BIT(40 - 32)
>  #define   MAXREQS_PER_BANK			REG_GENMASK(39 - 32, 37 - 32)
>  #define   DISABLE_128B_EVICTION_COMMAND_UDW	REG_BIT(36 - 32)
>  #define   LSCFE_SAME_ADDRESS_ATOMICS_COALESCING_DISABLE	REG_BIT(35 - 32)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 8c55cd187a0c2f17f1d6ed0ef2f9c7a87913a840..430fab6ae1d9abfccc36ffda1e8b88419587b901 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -260,7 +260,8 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  				   LSN_DIM_Z_WGT_MASK,
>  				   LSN_LNI_WGT(1) | LSN_LNE_WGT(1) |
>  				   LSN_DIM_X_WGT(1) | LSN_DIM_Y_WGT(1) |
> -				   LSN_DIM_Z_WGT(1)))
> +				   LSN_DIM_Z_WGT(1)),
> +			SET(LSC_CHICKEN_BIT_0_UDW, L3_128B_256B_WRT_DIS))
>  	},
>  
>  	/* Xe3_LPG */
> 
> ---
> base-commit: 242f4d8af4c4708eabb93e79949d45caec8d4354
> change-id: 20260319-wa_16025250150_part2-476c67c27648
> 
> Best regards,
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
> 
