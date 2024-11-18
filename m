Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC8ED591A3
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 16:56:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EF810E527;
	Mon, 18 Nov 2024 16:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e8JwpbXt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0063310E527
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Nov 2024 16:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731948992; x=1763484992;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nO0kzqC2cF96LcuR/oIDal7K1GUe1mXZhm0nCoNDs8E=;
 b=e8JwpbXtA2MMmrz3Uno0dA41nHVfFm0yq7ZJorYRxKMcYG0jqmOfBKNx
 9luBG614BGkOEqOqnaU7sw7DcwwHEUw7NWHkVqOlVhIEpzuR3ykdAEIQd
 Vlkr1ZnEdnEAmWars88X+hg4F0atEyBMmPOuzZ0Y7f8oU88yCqSY10Puh
 85sY2r0acIHbVAn0C60pJbmgDl0KPF+WcOmi2ODHQXC+hhHBmJ6qeCA6r
 P6y098k6bIgCS6KrpvPOiwn61fVWMhFLRr+UlezdhYF2q3hkTc33su4PO
 cDbRQ6uNF7oEencoVan6SSPicjxkVaj0gbCHwl9SYtq13tuf9OwL3IGcI g==;
X-CSE-ConnectionGUID: ZLJX0SjVQbyh4zTXuzbiYw==
X-CSE-MsgGUID: GdZ299jGSBmuMv7zSjRQ+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43298696"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="43298696"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 08:56:31 -0800
X-CSE-ConnectionGUID: 5fOanzRHScya+fEnr/Qq/Q==
X-CSE-MsgGUID: rg8iMvdSSKOlbPF09N38Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="88842502"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 08:56:31 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 08:56:30 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 08:56:30 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 08:56:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqfOp082TxTPZwbi7oA/8q54YsqYHwv9uL4IF8pWPPsEEPT7BniBVBlRkIwX6dbZzRalD6D/tc2B2Kbs82Ff0hx1UniLGcdB6s27LICKo+YaG03qxBEUyDZre9bf4+S/+Hp5Ln5NVJAksyxgXaYPLp5H+wBJsKQ6vtB8T5sr/Cjfgk/FwOnTIGT5kzN/KuwUT499Mkaa+Hei5RIwxq1uKnBjRq9VzWu/jfhYGo249av1a8L+o+MUj8CNgbrLhYjgeE2OIEa8SY01f1KtIXGTDUGhh1b0zoRTbBOIn7OMMPVovdUqchxzEZe2UWnQSyfC6WLwejWIDCDe93dpVdgJMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xv/S3WILPYOdrDJ6A8z5SaOYwTa1kv6ZrjB0/XXuYMY=;
 b=IMNFWwlNWo4eXon1J8/X2uvogCknjo6NPqWKDJN/rOy8iji1LSgfdZM8nHu3Idko0umbKbFVpyf55JaVXg0BFpP7pa3aEwIqIG5xF3OaC6XWOJAhcnQWfP3btsB1UXi77XGL9t4BpRK9QRxrBV/f6DNEOQGDOtsH3BP+JVnhg85SQCpiAaVMX1rBm6J27v4Q6BixOgtuEWH1Hyzr5lx0MYO5APenvHoMTcEvMOT5OTNw0fJHCOZyJyNHsP4D9CDi59G38EtJYrY9TuFcQwPYRn7Jt8jcQTklBufc5vEqaplNLLpLjkXjU0OUqoNMc3oOTFIuh+a8OMyG+Pqlmw3KQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 18 Nov
 2024 16:56:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 16:56:27 +0000
Date: Mon, 18 Nov 2024 08:56:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/vf: Print assumed values of the MOCS entries if VF
Message-ID: <20241118165625.GN5725@mdroper-desk1.amr.corp.intel.com>
References: <20241115210025.2343-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241115210025.2343-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::40) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d023906-edc7-4d20-cf31-08dd07f1f167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PrgxAFh7WkjjdZWqx1qgXORwqFnSaNuLgnRBEnnsg6Sh/2Eu/A2e36MwI+Nv?=
 =?us-ascii?Q?Z/hrT3SWeRaWDIiRkZ98JezfQYcBA9awBOiF4LOm3Du2svygN1wEOY1VZXKS?=
 =?us-ascii?Q?eFwCpc+D17fVlRr/tzd0vnfCiu4Posga0fVSGUGK0QTcpGWmBRtTcem6eMWn?=
 =?us-ascii?Q?WsoplY6dpOJsgWZEtjHcYhose0AYI2bL9hNb3J2tj8XUV17riKfp0ZWJe3wP?=
 =?us-ascii?Q?AWIeCZuptg2KUbtFRdptrBvfbW21G7++YOa32GoBdd3MnPdZlSi+BqxXPC30?=
 =?us-ascii?Q?Y4njUPFwgviYS8cBgVHe7D3xo7n7gaPO7VjtLDuxOi4xHvISMXXUqD/p39LZ?=
 =?us-ascii?Q?D5DGvvTFltNItjo59QfrUdNve6l+2Lla/xsLxq3Hjrcu36jq+O7APSy+Aq9Z?=
 =?us-ascii?Q?xEzmK580DhpRFT8+RLR/QIZFEJGoYbO52J6OJlq/dRwxJ4aTDJZZO28Vmvtr?=
 =?us-ascii?Q?dsy2poYNTiXbA893At9LR54mMOaScjRZ7Gs/Ck8T/Rw/8f0AX1f8yFslXQcL?=
 =?us-ascii?Q?hPpqmFfn6tHyEWRw3z59saRrNHIFCNYg6/xCUiSb8K8XxCDAhlmOErkX6HoT?=
 =?us-ascii?Q?9zk0X2Cn2HUZsc/bF0MW5bPFAni0y1WeUPwNPXq1Pi9EPHnaQ9NKhaV8h+8e?=
 =?us-ascii?Q?Ar8l2Vs2QcH5aG/U0ji3ICeEyWydLiIG+iAZs2UW9TkooOhUtsE1d+VK4jFE?=
 =?us-ascii?Q?9ek/tu1bKyrjIB0Ucg7qtdjtNariOUV7cSMNcpePNvabQotdKP705Ju+Kdie?=
 =?us-ascii?Q?yRbWD6hYSpBxoESNM/c/gv8A7XuDX9rgGvcuEv/wkC4T9Fk5Uop9sY8OecH5?=
 =?us-ascii?Q?77ZIFtiyb5AdhgPvxnH9EKPMobkrc4kp8rQ6452XahzJ6oYBQgQQAzGttj8t?=
 =?us-ascii?Q?RbPEwkrWRz6L3NXclb/U/PTQwItbYi8Qd5l6+n/YuzCp+V08H7zxKa7VhT7k?=
 =?us-ascii?Q?GJ4p+KXeFRdPK8qC1yO0V1xEJfk6D8hNmowYSawoeIQ7NQAiXAEzxenVX9zL?=
 =?us-ascii?Q?DN3xyiBBaP8SUCgO2C9R2DHhAH89R3wTRbQDLs6qKZfIczoJcOqk4EODG0iE?=
 =?us-ascii?Q?R5+MUG86UiLr6AnP8ozX6Z9ABZaFO0u93pbJwUVgluxoaW+scO2d2Xd4V3WQ?=
 =?us-ascii?Q?WZO1oN71vJgwnqo0JQ28zR1RlLG/GVD4mik8UI9UX7ifS8jL72a6iPgGqAMr?=
 =?us-ascii?Q?HVTfZ6eVP9oplU/cLyP0H6taGRScLF9fSzI0p8YePgydteWd7XWg4YGaAiVO?=
 =?us-ascii?Q?1UX6oBwfdIRkButoWaRkX/VZCQHU115AZy0QCjyhkA0rh6t1UH5WGO0i3381?=
 =?us-ascii?Q?zhX6lpzWjPPgnBWFyvii1bii?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QP12ovTJAcQnJObc8KgEuwv5IVMslGvaXfU1y0wruSqKpf2oqbN+TJsCUZZO?=
 =?us-ascii?Q?S90FoasIjWjPoqVsNlkDnIHRcoDTA0uuV2YpXy1KmySi0YXPuwj4k0nxIEIw?=
 =?us-ascii?Q?qEU8M36POa1C2aJpEPwBV8NY5iv9ZTTS/t8dgdqueYOplsg255TIS7HBU1YN?=
 =?us-ascii?Q?069ayZREH63yye+c7dhzs/57czWhFqcNb20SbyE1n7W995ILhoE5zBWSSB6+?=
 =?us-ascii?Q?bFlXNuFQboAt2dNfilXkteAyLpu58gD9oiwu3o14paG9nkMi259z+tL34Zpf?=
 =?us-ascii?Q?rQcS12V5O1AlkiZKZDNwwmIlWFTbs14tDjwl1Bk1GdhiKXf9JqTZ/rkew/sS?=
 =?us-ascii?Q?sQZdF/FRiv/UTu5c9mAHPcDxGFyW8nxRkwFCGwygY9Stg1x1Cfo3NzgYtevv?=
 =?us-ascii?Q?50yYvYBNilzafZL/xBDBOQnKtT0UGdOe/GoKv1DuhTKrBDP3VzotEnzux2mm?=
 =?us-ascii?Q?rp6ZisL8GmgkRTWsIMy5u50oKOHesB6wfPwwQZXMQ86L8YrP4/Sc85xSQOd6?=
 =?us-ascii?Q?fiAdYx6w/0OukejgQhXTR6vIFLUaoQzeOVbICXeW/o9YMnaPWNe4yTammcBF?=
 =?us-ascii?Q?F/ZTyI9x090FODSywwaneyRwoGcFq6Ujjeww6lfyaEfBUHzeEzIh++f8FAXm?=
 =?us-ascii?Q?/AEbX9w+5yG+yPMr7WMkUsbJs2fJ+pTt/RQHzq1IkrU29/dGQbWGOBuVFrKE?=
 =?us-ascii?Q?xMUbOEe024/3J9Az3l3VSjTLbC0NjioEk0jV2KIKU168bqNJ0o9sYF3Evc0J?=
 =?us-ascii?Q?gX2HcDDYFFBR54BOa7OI3b8jvV9WW/saAa0P3SIunBtDiRhvZGN2Z8EQlCFn?=
 =?us-ascii?Q?o1wSG8UJ1vOSMoEFXTf0oGnA+I46IFD/fuSOoCos7hf1dZ9AzL/bZnMj6aP5?=
 =?us-ascii?Q?V20JJadCy/2JoaMUoGATCXOdGofwGjd0IAFe+jgNEQveD1/rY4kfziEI0lnu?=
 =?us-ascii?Q?fkQNeGzZ65pF9WQPJe7zzy3/nXDkoVxBQS3DyBLjw6Mu1PnIoNbWRKSppK/B?=
 =?us-ascii?Q?P9jivR+bFx3Qz00/1Owp12+mdoTHGBuRSmXKZ1zeGZ4oEOcVBbUHBKSnXkIP?=
 =?us-ascii?Q?pEGD82niZKL/mka/hFLmLeSfDz3z4Crc3oXFK3HizgAEEZGNbjyGsZBJW187?=
 =?us-ascii?Q?knAo39JNoYKcyLyWB9U2It2e15D3zf/a8VCh4j+LNhECrBlc7/KLGoVQTc0v?=
 =?us-ascii?Q?Yio+PF6ph93JI2syhJ1AHZfxEAd3mKq4nnRstIW6f2xRMf0ob5J5evMfDupd?=
 =?us-ascii?Q?BNb7m4StXeYWqj0rtpw1ox5OBVFtyQRtsZ+QYu6zNdskob5j+3PNVkE3b43G?=
 =?us-ascii?Q?qIaJThg2GwbNr5e80qtK3BfylrVoso1TrJ3mJRm3NaS5BnOkDlwiONr7N4Xr?=
 =?us-ascii?Q?OB5I8MEf1XPo9hUaTNq427RAf76uFhvpUi8C6Q/jhgQOLNK2sr72anPJ27WA?=
 =?us-ascii?Q?Lnu1jDWn/uPr8P/495Z3e6seQJZSphVIIA9AwrWQtgVilw6xu0itigpmuzVf?=
 =?us-ascii?Q?vexYml9SnaSPPtcwdxETqb0G43A5tpRXzNnaO7whKxLCwF6CRIB9MEr/ZN5C?=
 =?us-ascii?Q?nBD/8nUfd9TGG6kLTA2IsVuVCp7UytEO3p4OKMBtGyL44lk1ueTC6ppuX2li?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d023906-edc7-4d20-cf31-08dd07f1f167
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 16:56:27.6730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9OZUYirkKf9jgnmCZc1SzKTJEHqW6OiPW6vnzl33LcfqB/vAZ+0D7roOtxzTohhBfpwzfQgYYdkBJ9Tdk2F2USzE2Or5REQXM7/V70dMMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
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

On Fri, Nov 15, 2024 at 10:00:25PM +0100, Michal Wajdeczko wrote:
> VF drivers can't access the MOCS registers so their values can't
> be printed as part of the gt0/mocs debugfs attribute, but since
> MOCS settings are part of the Bspec and SLA between PF and VFs,
> we can print assumed MOCS values instead.

Is it actually useful to anyone for us to fake these values?  It feels
like changing the semantics (printing what the values _should_ be
instead of what they necessarily are) could just cause confusion if
someone is trying to debug a real bug.  Would it be better to just print
an "unavailable" message (or just not register the debugfs at all) when
running in a VF?


Matt

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 42 +++++++++++++++++++++++++++++-------
>  1 file changed, 34 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 54d199b5cfb2..9ad5366f4370 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -257,6 +257,14 @@ static const struct xe_mocs_entry gen12_mocs_desc[] = {
>  		   L3_1_UC)
>  };
>  
> +static u32 get_entry_control(const struct xe_mocs_info *info, unsigned int index);
> +static u32 get_combined_entry_l3cc(const struct xe_mocs_info *info, unsigned int index);
> +
> +static bool regs_are_not_available(struct xe_gt *gt)
> +{
> +	return IS_SRIOV_VF(gt_to_xe(gt));
> +}
> +
>  static bool regs_are_mcr(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -275,7 +283,9 @@ static void xelp_lncf_dump(struct xe_mocs_info *info, struct xe_gt *gt, struct d
>  	drm_printf(p, "LNCFCMOCS[idx] = [ESC, SCC, L3CC] (value)\n\n");
>  
>  	for (i = 0, j = 0; i < (info->num_mocs_regs + 1) / 2; i++, j++) {
> -		if (regs_are_mcr(gt))
> +		if (regs_are_not_available(gt))
> +			reg_val = get_combined_entry_l3cc(info, i);
> +		else if (regs_are_mcr(gt))
>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
>  		else
>  			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
> @@ -307,7 +317,9 @@ static void xelp_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
>  		drm_printf(p, "GLOB_MOCS[idx] = [LeCC, TC, LRUM, AOM, RSC, SCC, PFM, SCF, CoS, SSE] (value)\n\n");
>  
>  		for (i = 0; i < info->num_mocs_regs; i++) {
> -			if (regs_are_mcr(gt))
> +			if (regs_are_not_available(gt))
> +				reg_val = get_entry_control(info, i);
> +			else if (regs_are_mcr(gt))
>  				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>  			else
>  				reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
> @@ -380,7 +392,9 @@ static void xehp_lncf_dump(struct xe_mocs_info *info, unsigned int flags,
>  	drm_printf(p, "LNCFCMOCS[idx] = [UCL3LOOKUP, GLBGO, L3CC] (value)\n\n");
>  
>  	for (i = 0, j = 0; i < (info->num_mocs_regs + 1) / 2; i++, j++) {
> -		if (regs_are_mcr(gt))
> +		if (regs_are_not_available(gt))
> +			reg_val = get_combined_entry_l3cc(info, i);
> +		else if (regs_are_mcr(gt))
>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
>  		else
>  			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
> @@ -425,7 +439,9 @@ static void pvc_mocs_dump(struct xe_mocs_info *info, unsigned int flags, struct
>  	drm_printf(p, "LNCFCMOCS[idx] = [ L3CC ] (value)\n\n");
>  
>  	for (i = 0, j = 0; i < (info->num_mocs_regs + 1) / 2; i++, j++) {
> -		if (regs_are_mcr(gt))
> +		if (regs_are_not_available(gt))
> +			reg_val = get_combined_entry_l3cc(info, i);
> +		else if (regs_are_mcr(gt))
>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
>  		else
>  			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
> @@ -507,7 +523,9 @@ static void mtl_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
>  	drm_printf(p, "GLOB_MOCS[idx] = [IG_PAT, L4_CACHE_POLICY] (value)\n\n");
>  
>  	for (i = 0; i < info->num_mocs_regs; i++) {
> -		if (regs_are_mcr(gt))
> +		if (regs_are_not_available(gt))
> +			reg_val = get_entry_control(info, i);
> +		else if (regs_are_mcr(gt))
>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>  		else
>  			reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
> @@ -550,7 +568,9 @@ static void xe2_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
>  	drm_printf(p, "GLOB_MOCS[idx] = [IG_PAT, L3_CLOS, L3_CACHE_POLICY, L4_CACHE_POLICY] (value)\n\n");
>  
>  	for (i = 0; i < info->num_mocs_regs; i++) {
> -		if (regs_are_mcr(gt))
> +		if (regs_are_not_available(gt))
> +			reg_val = get_entry_control(info, i);
> +		else if (regs_are_mcr(gt))
>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>  		else
>  			reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
> @@ -713,6 +733,13 @@ static u32 l3cc_combine(u16 low, u16 high)
>  	return low | (u32)high << 16;
>  }
>  
> +static u32 get_combined_entry_l3cc(const struct xe_mocs_info *info,
> +				   unsigned int index)
> +{
> +	return l3cc_combine(get_entry_l3cc(info, 2 * index),
> +			    get_entry_l3cc(info, 2 * index + 1));
> +}
> +
>  static void init_l3cc_table(struct xe_gt *gt,
>  			    const struct xe_mocs_info *info)
>  {
> @@ -722,8 +749,7 @@ static void init_l3cc_table(struct xe_gt *gt,
>  	mocs_dbg(gt, "l3cc entries: %d\n", info->num_mocs_regs);
>  
>  	for (i = 0; i < (info->num_mocs_regs + 1) / 2; i++) {
> -		l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
> -				    get_entry_l3cc(info, 2 * i + 1));
> +		l3cc = get_combined_entry_l3cc(info, i);
>  
>  		mocs_dbg(gt, "LNCFCMOCS[%d] 0x%x 0x%x\n", i,
>  			 XELP_LNCFCMOCS(i).addr, l3cc);
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
