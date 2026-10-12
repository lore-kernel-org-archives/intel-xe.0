Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2912BCA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 17:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B523310E62E;
	Mon, 12 Oct 2026 17:06:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B641610E62E;
 Mon, 12 Oct 2026 17:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791824787; x=1823360787;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=uSPIE/f/hrkApj+zLv6LT5RFxM5uDMr7kXg9/hj6T+w=;
 b=NHmS/2kmIb97VpN6O+Js2UKjHvgD2/BOnggidOUtW31MB24MIQjaQrvm
 Fbui6ZbdeCI6Y0HU/fzox602Bjo5EpJXMRjw+G2bEw6afM5XBCLFmm8cl
 +sgVxS8oTft5OWHwbKVPJVO77Ueq1295wYnMfGNzlfD1/FWKMNFgU/b+y
 TbuE8B0Oocv9CzuD+3DsOtPP1yoKlEHYQgvEe7yNKdiPeBFhKXhQ09tqE
 q1TVosnAVGvBNQQGUS3wbxJeU+G2C9cX811qrbvyv6HEUFUbHPrvCnucl
 AFKufXSt2droO619v+370n5OuBp7Nwj1FlFp55HgIPNXZE1mAvGdwmXd4 g==;
X-CSE-ConnectionGUID: HE99gpDVRAeXNJW/LI0LGw==
X-CSE-MsgGUID: FcNX8D6JSNuE8CjXF44Ocw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="414085"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="414085"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 10:06:26 -0700
X-CSE-ConnectionGUID: fPcuV3odR6S4q57xhvfzeA==
X-CSE-MsgGUID: LYPVU5gNT32E1uc3zAExtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="855359"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 10:06:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 10:06:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 10:06:24 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 10:06:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yr9NVInPj9E2UsLO3EZPu+XrhMVW7c37J80x1w73CWT3cUN4oikkAO30RhRFaBow50Bf3NtZcLd0+dqEll55TDrzh/poI/fRLi/7mgHkzRP4k+xTVeckHS1v2hW6QTlo8q1nFUtAFunml8h2vaXwwu1HaOzdIEJTxBceG2mMPLTQfWR282CSqV/++xzYEXuIFq8/5DU8tZdlW/413DMWARHbFXVJulat1p/dvN+9rG5xVGPcTgX4ahguPJ/k2sdpHsHQ2+UUoP8o3+qSLKCbg8CasE1sF7VCvXpLBbBsPaNdgdQliVYHvSHoh7Ci0NDyWtfdwXpGC+5h6EHVDrhF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncNksqVUSYLwvY4rZxDADdbZP8xxcGk9vy58aNXYwl0=;
 b=Il6gz+2JWKdDD0z/Gr2/5WAAeAotELzvqE8dY7/LIFg9ehXf0Jdf5kR6BiESeHkPuZdPNh6/tjqDVIMGRKl5DK+FHAEMMOwWWxuhi+TXDM1jCqkCL0ScBNuilP/8aAzWfFnfD7r3MndhG6WoYujU0U8D6xAfQnhfo1dCpP8UKpiTrcG/vS9XU+P85xnWIbB4NDzYblQmT976502GZdH6jdfw9w40tB7kXFreLMrOstpvROE+I9hPKW2A03lDjnZmuyhbWu4L2fRf2r51IAJROv0xFiVSXZCFVW/0F9O2xC5hJXpDt5hq7DJ0hoBj7bkmsjsBi2VFOvhu060e9YXOvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by MW5PR11MB5883.namprd11.prod.outlook.com (2603:10b6:303:19f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 17:06:16 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 17:06:16 +0000
Date: Mon, 12 Oct 2026 20:06:10 +0300
From: Imre Deak <imre.deak@intel.com>
To: Mika Kahola <mika.kahola@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/i915/dpll: apply the PLL power save W/A to port
 A only
Message-ID: <as0Tgm77ARcfcHQI@ideak-desk.lan>
References: <20261009103552.1864818-1-mika.kahola@intel.com>
 <20261009103552.1864818-3-mika.kahola@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261009103552.1864818-3-mika.kahola@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GV3PEPF0001DC37.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2ed) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|MW5PR11MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 307c4450-6998-442f-fffb-08df288320c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|18002099003|22082099003|260925021311599003|260925022911599003|260925021911599003|11063799006|261009223027099003|4143699003|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info: 2EDjOzBhEFhI/YAevgWnhH4CUXiQVTeR4+lUkqddaSLxjI+tDoHwVxNIu3jHgxjIMmJ9cm8TLS+P4GW1lB77XxbZW0EPi9xR3nMBLPL2opvUKCm6bSh9dJ+o1gtxxazHHT7Xc69u9IA5aRK76q6yAjiPV/VSXBJQ215CcD9D9jVKhMTMm2fFD8ujrQZZ3mcvS7aXUpjnVZDjrzO1VlwQP38JYRIf3lphAz3zBnW4A5W43+EePUZHfkaYMbraQ3om47QNKQW2SMMoAhCOar7QuXu4U1NYw2C2DXmRI6NN/gIuUF+CorZhCwmzGxC/J0ux88JZZjd5CzeyC7qLhpAIqg/Ex3d83/KQdiC2BTqiijnitN46zCtrZe6iE4Bm5ey8B2Y25ACajgcV/DqgA/BAIO/wPffKs2fLnsbh+IG0T0CGgRhUYJH2YDZg4n/IDH9PrIB6apbxFDfPB4N3bcHaedZIvrJGmdmp3kFRaZdYManzTdQjcoLffg6TBDyqz9UFjNz1v7ICBAIa33wi3NfXq35IOl6UVhqc8xBMxzonkoUOZeb/BjVMux+QIKPXnC8jagtV5DBe0GHcqFPGTy/ThcoQIID7m43/5MRnMLf23JB36Z3WzAQeZYwVqfLgbi2+Pid24M2OBnHjCn/3WsO9+IajrAVfeSg+0X1uTWZ82sI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(18002099003)(22082099003)(260925021311599003)(260925022911599003)(260925021911599003)(11063799006)(261009223027099003)(4143699003)(56012099006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QwWlydE5ekeu2UG+O1mLfljXjHMQ5To66SFdebtlWMaOpHgRwuF1madLo4Jq?=
 =?us-ascii?Q?B1ubG0x9wuOIbz6cLx+v1V1j2BtxOETB7mxCBR2IPpy+ApOxfLNEYxfYMONU?=
 =?us-ascii?Q?JlnJiyHCi4qaQJ18AshP6jUMt3p9Gg5xRuhq9IUKlfUiPQdJ/Ezm+qfzdayw?=
 =?us-ascii?Q?DKxwYRippatThoXmjQ3bzDeb265EdXpSIQMWnzjeOEV82oQ+3/rp1VwfD6zJ?=
 =?us-ascii?Q?9fB4NCn4duvvM8u8kFgpt8d0IM4E7xGoM9RI6Oz3eb8ngHvIfOv2oqIDQk7P?=
 =?us-ascii?Q?56L9VJovAwBVBOLOEPcs1gK7zw7RzlSFjUL5s66CQO4HfOZNr+2GIlSJXi2J?=
 =?us-ascii?Q?gTi8f1KsS7tZMWtWgpYDdKa3Vq8NQ/TYzx0OmAQJvAuDcxtvRM+d44K5qp8R?=
 =?us-ascii?Q?hmANRk+602EvueGFslAe6OUkdDdIOvX5Mvy1FzQyvwXLyOE2QtYsj3RtaTW6?=
 =?us-ascii?Q?ncbW7jZdVQcivH0ehpriJ3rdyAIgfj9oqZEx3JovsWOlu0K7LBpDBwviA/Y+?=
 =?us-ascii?Q?3tSrNgjx1PDM+5mENdtHKeQL8W1RRkjOvYxt+B/AIy12y5st4LFWyywudhGW?=
 =?us-ascii?Q?d2V3yedrE7z7rYpYccnAfSKTDAZdST5K5a/Kt4WvV1Z3LIOgXr4UeozzerrJ?=
 =?us-ascii?Q?WjdsYvUjHl0l2SxkHnHrcSS9Q2DSAOOR64PSaxIW/wXeQBv2csmCABO5jFHl?=
 =?us-ascii?Q?hD0VZ+fsGhRD0uvkoo+jG8HZBO+Sb34S4fnGqBkyDUvnNJMceUsDhFd0iMU4?=
 =?us-ascii?Q?b0zPHCDxgRz9wcJ1udnKYiY65ZMruEuAcehiyRHHIKhYU2szfMxpX0ttcvwO?=
 =?us-ascii?Q?PvIXYrthWHtOs+2nmUuNJ1tqV45RzBGsbj5q1qn1+CwznaNjch1gv5bFgSCE?=
 =?us-ascii?Q?PEYPv12Rd0iVCRrqqEmwKbZWH9FAq26OJZ0ly7huAeYDmCvDJK7nchR0hpCB?=
 =?us-ascii?Q?4PrcopdDIRIB43N8sZzdapKnGx41kULsV9fWngLqaLZ/M51g7zedd4k5WWOQ?=
 =?us-ascii?Q?66HNelWi9xOlAqIZwHWUnhlRmQuF/Yattk3yKmqMA911XrgWmSKM+SeJb1Xa?=
 =?us-ascii?Q?5V2ZwiBUJNGH70b4PkeLqWVCwuVxzgZZPLxSb2vnvZejrcWi3pyS4HpwMA/A?=
 =?us-ascii?Q?i/GADfZjB4EZAVzNKDMJCjgdSaMWJSXmoICG224wQdjl5ZMUx7JwoEUv9Vvh?=
 =?us-ascii?Q?HIMYSDfALqoD01RWQOMdYU2A+98B5ASlS7ejW8C5CTuCdnefnEBPmMIkmzos?=
 =?us-ascii?Q?DpjNI8zu4BLbLdEL4OVB8j362byaM149Of31ZYJDvXc4iBv99LkCOyu2yBbk?=
 =?us-ascii?Q?mxH5zsmjwSug3A8YY/KtsMZu/6tlfUvrjNeb4eQTHwQM2aoS16k8sHNiI6H0?=
 =?us-ascii?Q?JUf7rhWVQVZxo27ibF33M0ZteBJ9/5q+I/a9qVSp6WcaCnzTofVVPhu66rEh?=
 =?us-ascii?Q?o7UKCrhees3Xzd58FuaZCb33jnId5HolirqYfBacVQqRNxps6fxvSY997Yf0?=
 =?us-ascii?Q?5706npRKW5PNX0nmro1Ue6IBg3JOd3OeI9Zcu0K1v++QULavXMwNvP8j0C+/?=
 =?us-ascii?Q?ZfBbF7ZpuT/ByDAhVP/tpPc1v+wEpymLi/CMCPjnlJgvrwOcBl0AJUQ4Vdak?=
 =?us-ascii?Q?mG/jxJJpHgP7jXfJnJYybZCmVCgIvmBpTEd1qgbqWRpNjAu2xCfOLnjKUe/I?=
 =?us-ascii?Q?EYKpbNwSj7YwIoVMVgvKPZX+2MblL7h4MHMdRqrx6Pb3xqAzLQtPOjDzgdD/?=
 =?us-ascii?Q?VoY3dnWkpQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: G/Y0rIT1jrEcU5qbq+KreQzYuRiCkFso4kltYxjL549x+EcciYF2eRu73s3phBFm3HhnGC1KgcR7AgE/yCHuhhOn9HIMmo4gd6Nzq0KCPz0Oggpl4IxfqrgmqCxdLsbNfu07gC9XTr0fFYmVBMM9n9dU3H3rqkaxEdgbZybSO7HIZdV0SfOAjbenXdE+e/Gygqfd1OPrulnT+xKPTVb+uGuQRLxeuyT+wjrUH0s66AqbvC9HmYkhcReFiBx2Es1YnM1u5tQGd47HyP9ugYDs/K5MF9PT4p7BkwzYX8p1xILMhlBRDkmJ4gWopEYVlnmmw1zd45ucfjSbybclaytFiQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 307c4450-6998-442f-fffb-08df288320c5
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 17:06:16.7203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/ULTPiv37lqGDcIVyMIpfHUvp0R3j90giLw0h1DbWWhcRQFWyIC23Ya0vDxDFHl9u+Nh1SBHt5/8vAcY9SSQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5883
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2026 at 10:35:48AM +0000, Mika Kahola wrote:
> W/A 14022081154 applies to port A,

Where is the above described? I only found that the WA is C10 PHY
specific and can't see how the port/PHY A/B being used would matter. It
seems more logical that the WA is needed whenever a C10 PHY is used, in
which case it's being correctly applied in the WCL's C10 port/PHY B case
atm.

> but intel_encoder_is_c10phy() also matches PHY B on WCL, so the W/A
> ran on port B there. Filter on PHY_A.
> 
> On PTL nothing changes, intel_encoder_is_c10phy() already matched port
> A only. MTL and LNL are not affected either, the W/A is for PTL+.
> 
> Assisted-by: Copilot:claude-opus-5
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> index e899b2eb0871..164fe7104545 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> @@ -5226,8 +5226,7 @@ static void sanitize_dpll_state(struct intel_display *display,
>   * The dedicated display PHYs reset to a power state that blocks S0ix, increasing idle
>   * system power. After a system reset (cold boot, S3/4/5, warm reset) if a dedicated
>   * PHY is not being brought up shortly, use these steps to move the PHY to the lowest
> - * power state to save power. For PTL the workaround is needed only for port A. Port B
> - * is not connected.
> + * power state to save power. The workaround is needed only for port A.
>   *
>   * 1. Follow the PLL Enable Sequence, using any valid frequency such as DP 1.62 GHz.
>   *    This brings lanes out of reset and enables the PLL to allow powerdown to be moved
> @@ -5245,6 +5244,9 @@ void intel_dpll_power_save_wa(struct intel_display *display)
>  		if (!intel_encoder_is_dig_port(encoder))
>  			continue;
>  
> +		if (intel_encoder_to_phy(encoder) != PHY_A)
> +			continue;
> +
>  		intel_cx0_pll_power_save_wa(encoder);
>  	}
>  }
> -- 
> 2.43.0
> 
