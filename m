Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF41C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 21:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0EB10E672;
	Tue,  1 Apr 2025 21:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DwKCrb+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CCF10E672
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 21:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743542923; x=1775078923;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t4bHDIUh2rVY4WrMRae3o4YG7XyJBXqpZ9H7nlb5tg8=;
 b=DwKCrb+RMpvfXEkmAuo4I2M9LWQqZKtUV00hLlaaD+pV7x4YkbWuBL1g
 5YhBocCgUZMbUuyVraNVsEcqJLclDQc6U9JADBGJnILv290nML1AzpzBD
 +fqF8IYosJ1vmFbf9olVglPiV8Be4E9rwXagOa3EVCSZYFnlav648Hmwi
 El36eMtTUNzZP3AnAwKsEHBuJa5CbieaLkUKamX7WWtTdABmRMv53Fwq4
 50sDLzEL3LUiMju2vplUZ9rPXuy+HwEe6bR3byb9F6L5/TKk00GiTc8+j
 gYHVlJPl8V7hkVrAPBSLG0l1t9x9jHSgEpBMAO6mqCoJizCti/dWjzxH4 w==;
X-CSE-ConnectionGUID: BO5y55SsTH+Z1Sa/KdUAoQ==
X-CSE-MsgGUID: u+oQcbeRSz+LCqhWAJfH6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44035238"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="44035238"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 14:28:42 -0700
X-CSE-ConnectionGUID: 32buXQOXTYmG+3uOcG/NvA==
X-CSE-MsgGUID: vN7IIw0HRVyQ9BP/IbUgEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="131645401"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2025 14:28:42 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 14:28:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 1 Apr 2025 14:28:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 14:28:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XH8AfsuCxT13+pxEVbwlK6t4Gqu0UIKXHE6JQoP5n0rFmuVKVu3urAfZaZ0udqQM9OG+nSrksCCucdlmNQe2CgbWGqGj0sIGJiq29iipg9nZiW9ykpIh0nb3TvRQtdybxUrGvXR6PRabvAhNNHYeucx5SCT1wxh716oxWsaqWbNZ9y44TUz0Jftau5gcz57gCOJav0VTz2xtV9GQWC+PM2ihrv+dk3/zjjHKhRgoR2lJpWMG5peKLgt0+puXTu82mlkLSUtMbo2bwZAO1U91H1fZkPnJr+naVqp25NMlKw2ko4LLQdWwyy4/6X2GRJraC8tcHOagTREhaQsQff+46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eSbY34vC/YShe0NvvW5g1OMbgqCEfK2uOG1ueSPn6c=;
 b=l0p/VCh7orjh+k7jbEKI1L29XxQGUW2AiGx44PmLYha7v1O1ktUJHGKojjrxtzuUlN21b1NzZE77Z6XFJk6kcwbXYR7XehcXVDund9RCgckTeo6LnZ+RfA2vxhPMfVtDth52VoDt3u0FKDptvujvxO07JxUCYtfCzK8mn8+wVTBO7njztKfk+bk2E3cb5l23zMnikW9WDhMaDN/P3DmTQTFXEiajIjdLSxIUYELBY+aHCO7WfQtdnwAZVbFzPUKRxre1+6InatcKf30Jpx816lQz319Sn51LCnlmEiZXZ9o4n11AwFCKQBiRrq5DtBhvv3MNopDSqSIK1r3Xzq7eew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV3PR11MB8741.namprd11.prod.outlook.com (2603:10b6:408:21d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 21:28:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 21:28:36 +0000
Date: Tue, 1 Apr 2025 14:28:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2] drm/xe: Add the missed value paramter of LE_COS
Message-ID: <20250401212834.GQ3175483@mdroper-desk1.amr.corp.intel.com>
References: <20250401205703.4179906-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250401205703.4179906-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: SJ0PR13CA0107.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV3PR11MB8741:EE_
X-MS-Office365-Filtering-Correlation-Id: 112d0b96-f388-4a0f-ee31-08dd7164299f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+PT3NdE1Rz2iCYnBJOu7O4eD+vdraw1fDDvO17Ep3oC4d8OVDvN9N0UrnN+v?=
 =?us-ascii?Q?EpP6cvRN/IdsHk3ipkVc19MM7KzhdwihzB+jVzyo8z9nf1QN5Yzz8dx8iXdg?=
 =?us-ascii?Q?KYffU7MvKxwbxSJFKt+KrkDjUg3D36rbFJdz3IEXX7mscvzYSC25yqh1DQ8m?=
 =?us-ascii?Q?1j8zseyXyb7xuTbhgVBFia6Dwp84rsUPIavafK4JJka8e4lYM20MHEUqiS/b?=
 =?us-ascii?Q?2kOoAYKYa426ejD02kXa5g+dLRHGKawnmzKo/6SDLP2EOyWsVmoji/SVAZhu?=
 =?us-ascii?Q?kgNK/AMWo3y445xKOpsMGLOG6gjx1lLEyK4lsUEeebPV0h3ZbM/EieeJm/6+?=
 =?us-ascii?Q?UqdcDljb/+5sXoFofoSikjFGr/SxPlYyS4qB7pMfQwjCIlMUNU1iPRQY/PHd?=
 =?us-ascii?Q?fa43S2u6wrtcr95cuH2LpsH1H5d76febTvtLHXwumg5Ly9AmL6s66a14P+EV?=
 =?us-ascii?Q?fgZfggBpJ7NrGZG3f8xuIJedSUmbCDBUJA7pjQED4v5M0zr3ywGaOTvPchSO?=
 =?us-ascii?Q?p6Hqmq/LzN8X+UYcHmMLkTJhOuevNTLWllXDmtjWV47Tx6lixAnFP3zv4S+j?=
 =?us-ascii?Q?O20dX2MuWowPWUjf+dcSp6B0eQfyeoq1eFtd9uiKx5kVMAtJbpsOB/vPmt53?=
 =?us-ascii?Q?a04+FP5BlK0oDHjqZbGUTvaOwB/OAsL+lXxTApuTG1PObMn8bCYxK5vPhTjW?=
 =?us-ascii?Q?vmcdSURg2uIF3Ggf4lnY8/6nCUrgrHzve9hMptY6kG7f1IjWUqAWMhMDArue?=
 =?us-ascii?Q?7cR8qqL8mB85sKFwh2XlfLMZuqiGXDOHh0kYzOls5GtvyB+xDohDKcBEAupx?=
 =?us-ascii?Q?lFwx71KpX8MI7ojptSCNHDAJXXGlyf5fjPov0iF6oXAPyjgbFyKOVvryRHt2?=
 =?us-ascii?Q?LXUHueXXPhwgEFsJRFsm1puUgNforU3l/ulAnobXrPXmHCJ0+MLAUS9mUgji?=
 =?us-ascii?Q?D0DQjA+yftIOL5gAjT8372Wc8/lZO3PB+hLZoOln3zXuYK+xWrAbnPE1vUes?=
 =?us-ascii?Q?dEYPFwo3bQhE+xgbB2szckXiOo4EEor52Eh+o/nZESTG7lhXe7APpZQiAc8x?=
 =?us-ascii?Q?4xc0dvxquJB70/5Hg3QuGRuFF4JpzOhCYsP4yy3tLHdC0dDF22VfQGNhhLj1?=
 =?us-ascii?Q?87Cx7URFNSVTxw7+HJVd0oXRwdvPL0tePc7FUufkhSKU2egRT98Ctxfy/nHT?=
 =?us-ascii?Q?0BuMsKJTi9oebhe95NeGyrsjftU9uU/NZ0DohJwfrckn8zQcGALjwh/tkqFD?=
 =?us-ascii?Q?81xHgEpgQ/m91TaWc/sFR157N+xUykE8AwaG7TmI48fCI+iOnSuKtqykjQbb?=
 =?us-ascii?Q?4stgQh96hNBpfaLoUnFId9AIYx1BMjmpglQr/SDgHA5G5hlfh0EjBxm5pZMD?=
 =?us-ascii?Q?joNfKeOyBbTBH4ddkgJ8mtC8d4iY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IXHHcJQ4ZL2WagiaBDmGnbxC1pTMSIkXFBOdvRFobTi1uEfS4coKASLdEjYM?=
 =?us-ascii?Q?OXU2pIbY52s+X1M1pPAEy8frtSWevG1fWBiVFoLzK1dFsC9sWskQdSfYtny/?=
 =?us-ascii?Q?ybLCQRote+S7hNgzT1yVS8FSF+wFxqNCQaRy5Tzb1lB0Xwq1yaQJt4OFWYdW?=
 =?us-ascii?Q?JfGRzde0pSEh863p3J1ukBcajZzO0dMtqMYW5sJOftx+A0eue2RYLENzlLdR?=
 =?us-ascii?Q?kyz5ejqG/MxtdO4BXFHhCaJfBc6x9Aeg+T2oNmhKPQVESgw6mxZpSz9Eplpf?=
 =?us-ascii?Q?ysAxDebccyO1TwXuhbg2DH9QvQAN/wsY0w3IC2fq/MgFpQlEu+O3t8jOU25y?=
 =?us-ascii?Q?1dJi0Ls3avCAKOdrW78kq6KTaDqOgYm5WATbQVy5pTeLN6z/a41pUO0Oi1wW?=
 =?us-ascii?Q?1guvs5/Qr6+/eERJaY9m5teNVh/V1iu86G8T9nJvHSAShg/IaXbJxfmEi8TO?=
 =?us-ascii?Q?CJ+xemV+FYa9wYR27ciSzaqjnuhMoh7Xjv1q/35pPZzI6T7JuRJ6JA+eaoTb?=
 =?us-ascii?Q?W9xStzXmC8gxrZIBZg54qqKXgabCsz5cGqVBHx6RWKZEGGmc8Lz3gOzJ538r?=
 =?us-ascii?Q?AR4tGpHXltdAqfZTM059FSe+/bXHbIioDIXaRfFGjFNvAY/r9tTaYnfn0rsK?=
 =?us-ascii?Q?KiLQoe3NlgzArKHWE7UDp4/5IDfw8tDE6OcZqJaOfsj8ssE9U5SWxjMaADi1?=
 =?us-ascii?Q?2af2Kvt2mlKUCY9lNOrLfh8pOa0q6SR2KGiwCtOgNujvhFZZAdYRbaC44Idh?=
 =?us-ascii?Q?aLgnnTY7M3NtTKrEDy6guZF8wX9X/aKXdVLSnBt3ntAuHYtLYM4mqRzLi1he?=
 =?us-ascii?Q?71V2udmolNj7Niu/x1v11ept7/RbZXqomfoFEfSCtg6vVL/pUqC1qjwMPUve?=
 =?us-ascii?Q?4nCL0z8QdwKss56V23WnTyoqexntKUTSlTo8Ltzoviw1MwyRG2X7GYj3w3ZU?=
 =?us-ascii?Q?yVXC4Bn8ja2wXzTcfammjrt125HcEwIbA/ZYpYjf8HgmZxbLNxUffixVP01V?=
 =?us-ascii?Q?XTGI8zJNKwbhgYUdhwggnQrkb+DTWarCK1QlrdCWDIb8TWtWHKLXfZj0OAMf?=
 =?us-ascii?Q?mDjO+QPzTVzfDiBCAiOByACzNXOzktfHEggLb6uU5urf0P2O1735BjnFEjfS?=
 =?us-ascii?Q?lpoRlvib3HQehDiiUQ1oEQEsY1gwX8+MD+NmCLQpr8xmktqdz+nQy2sQTHWt?=
 =?us-ascii?Q?zZ/GeHhc74sVYyzU+scHXRuueHvJbsLXqXblita2wjj6S8ardgfBOFu9PbD1?=
 =?us-ascii?Q?IIXujjSwFLFxNfxSGIq9mGO+J1bWO3K+wgcrmio4WAd7gmMMceDicPph40ol?=
 =?us-ascii?Q?FU155qlJDzVl+lITIlxFj65DEZCmqrBmJRMhaTe8ME60n4BEGd/8LGCvBWur?=
 =?us-ascii?Q?TzsJCqWm0iP48tIf2o/my2z8u85Oeo1fkYlYdOsjMvK1PaSFgPfGsXOO9Yh6?=
 =?us-ascii?Q?AKsXgCJOK5o3jQP6x8UOqSl9UsB+TTYFcJgpnycHAQEeqK1TcJt7pRJjWWpJ?=
 =?us-ascii?Q?75HuiKgjsSbGzSERaQCqp8n4tn8SULEThBz+t8Y4ZKxKW2WSmlz6ZbrI+TRw?=
 =?us-ascii?Q?qvMsp/3bO8/669nId9zcojjjY2ExhXH6eoKtCNO6p6TcMW6OojJDiNJOtnMi?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 112d0b96-f388-4a0f-ee31-08dd7164299f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 21:28:36.7169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csB5z9pkrnp7haTNBmNS8bgEVcqt4jk/zHhnGs/wFE46ceIj9gF8EVlKUNMm/5ghbVSfd4gI8g3oeWBDuEX4NqyR94t2BL0AJ+2+Bx8pHu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8741
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

On Tue, Apr 01, 2025 at 08:57:03PM +0000, Shuicheng Lin wrote:
> value is missed for LE_COS
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index da1f198ac107..042c8401aee9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -62,7 +62,7 @@
>  #define   LE_SSE_MASK				REG_GENMASK(18, 17)
>  #define   LE_SSE(value)				REG_FIELD_PREP(LE_SSE_MASK, value)
>  #define   LE_COS_MASK				REG_GENMASK(16, 15)
> -#define   LE_COS(value)				REG_FIELD_PREP(LE_COS_MASK)
> +#define   LE_COS(value)				REG_FIELD_PREP(LE_COS_MASK, value)

It looks like this definition was added in commit 9fbd0adbcbe8
("drm/xe/mocs: Add debugfs node to dump mocs") but has never been used
anywhere in the driver (which is why we didn't have a build error).  The
value for this field is universally "0" for every MOCS entry on the old
Xe_LP platforms, and the whole field has been removed from Xe_HP onward.
So it might make more sense to just delete the line so that we don't
have an unused definition.


Matt

>  #define   LE_SCF_MASK				REG_BIT(14)
>  #define   LE_SCF(value)				REG_FIELD_PREP(LE_SCF_MASK, value)
>  #define   LE_PFM_MASK				REG_GENMASK(13, 11)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
